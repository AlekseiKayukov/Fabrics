using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using ООО_Ткани.Data;

namespace ООО_Ткани
{
    /// <summary>
    /// Логика взаимодействия для Product.xaml
    /// </summary>
    public partial class Product : Window
    {
        TradeEntities DB = new TradeEntities();
        List<Data.Product> products;
        public Product(User user)
        {
            InitializeComponent();
            ProductLV.ItemsSource = DB.Product.ToList();
            var manufacturer = DB.Manufacturer.ToList();
            FullNameUserTBl.Text = user.FullName;
            if (user.RoleId == 1)
                ControlButtonGrid.Visibility = Visibility.Visible;
            FilteringCB.Items.Add("Все производители");
            for (int i=0;i<DB.Product.Select(z=>z.Manufacturer.
            Manufacturer1).Distinct().ToList().Count; i++)
            {
                FilteringCB.Items.Add(manufacturer[i].Manufacturer1.ToString());
            }
        }

        private void ExitBT_Click(object sender, RoutedEventArgs e)
        {
            var mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void SortingPriceCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateServices();
        }
        /// <summary>
        /// Метод для совместной работы сортировки, фильтрации и поиска
        /// </summary>
        private void UpdateServices()
        {
            var filterText = SearchTB.Text.Trim().ToLower();
            var filtered = DB.Product.ToList();
            var resultFilter = filtered.Where(x => x.GetType().GetProperties().
            Any(p => p.GetValue(x, null)?.ToString().ToLower().
            Contains(filterText) ?? false)).ToList();
            if (FilteringCB.SelectedIndex == 0 ||
                FilteringCB.Text == string.Empty)
            {
                resultFilter = resultFilter.ToList();
            }
            else
            {
                resultFilter = resultFilter.Where(u => u.Manufacturer.Manufacturer1 ==
                FilteringCB.SelectedItem.ToString()).ToList();
            }
            switch (SortingPriceCB.SelectedIndex)
            {
                case 0:
                    {
                        resultFilter = resultFilter.OrderBy(u => u.Price).ToList();
                        break;
                    }
                case 1:
                    {
                        resultFilter = resultFilter.OrderByDescending(u => u.Price).ToList();
                        break;
                    }
                default:
                    { break; }
            }
            products = resultFilter.ToList();
            ProductLV.ItemsSource = products.ToList();
            if (ProductLV.Items.Count == 0)
            {
                ResultSearchTBl.Text = "По результатам поиска ничего не найдено.";
            }
            else
            {
                ResultSearchTBl.Text = "";
            }
            CountElementTBl.Text = resultFilter.Count.ToString()
                + "/" + filtered.Count.ToString();
        }

        private void FilteringCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateServices();
        }

        private void SearchTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateServices();
        }

        private void DeleteProductBT_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = MessageBox.Show("Вы действительно хотите удалить данные?",
                    "Подтверждение", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (result == MessageBoxResult.Yes)
                {
                    var selectRow = (Data.Product)ProductLV.SelectedItem;
                    if (selectRow != null)
                    {
                        DB.Product.Remove(selectRow);
                        DB.SaveChanges();
                        UpdateServices();
                    }
                    else
                    {
                        MessageBox.Show("Не выбрана строка для удаления.",
                            "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + "\nСкорее всего ошибка связана с тем, " +
                    "что Вы пытаетесь удалить продукт, который уже " +
                    "в заказе у пользователя", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error );
            }
        }

        private void EditProductBT_Click(object sender, RoutedEventArgs e)
        {
            var selectRow = (Data.Product)ProductLV.SelectedItem;
            if (selectRow != null)
            {
                var addOrEditProduct = new AddOrEditProduct(selectRow);
                addOrEditProduct.ShowDialog();
            }
            else
            {
                MessageBox.Show("Не выбрана строка для удаления.",
                    "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void AddProductBT_Click(object sender, RoutedEventArgs e)
        {
            var addOrEditProduct = new AddOrEditProduct();
            addOrEditProduct.ShowDialog();
        }
    }
}
