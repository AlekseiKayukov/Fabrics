using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
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
    /// Логика взаимодействия для AddOrEditProduct.xaml
    /// </summary>
    public partial class AddOrEditProduct : Window
    {
        TradeEntities DB = new TradeEntities();
        public AddOrEditProduct()
        {
            InitializeComponent();
        }
        public AddOrEditProduct(Data.Product product)
        {
            InitializeComponent();
            TitleWindow.Text = "Редактирование продукта";
        }

        private void ExitBT_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
