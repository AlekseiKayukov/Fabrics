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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using ООО_Ткани.Data;

namespace ООО_Ткани
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DispatcherTimer timer;
        TradeEntities DB = new TradeEntities();
        public MainWindow()
        {
            InitializeComponent();
            // Инициализация таймера
            timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(10);
            timer.Tick += Timer_Tick;
        }
        private void Timer_Tick(object sender, EventArgs e)
        {
            EnterBT.IsEnabled = true;
            timer.Stop();
        }
        private void RestartCaptchaBT_Click(object sender, RoutedEventArgs e)
        {
            CreateCaptchaNoise();
            Generate();
        }
        private int _countEnter = 0;
        /// <summary>
        /// Авторизация пользователя в системе
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void EnterBT_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(LoginTB.Text))
                {
                    MessageBox.Show("Укажите свой логин", "Ошибка",
                        MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (string.IsNullOrEmpty(PasswordPB.Password))
                {
                    MessageBox.Show("Укажите свой пароль", "Ошибка",
                        MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if (DB.User.Any(u => u.Login == LoginTB.Text && u.Password
                == PasswordPB.Password
                && u.RoleId == 1 && textBlockCaptchaTBl.Text == EnterCaptchaTB.Text))
                {
                    var user = DB.User.FirstOrDefault(z => z.Login == LoginTB.Text);
                    var product = new Product(user);
                    product.Show();
                    this.Close();
                }
                else
                {
                    if (DB.User.Any(u => u.Login == LoginTB.Text && u.Password
                == PasswordPB.Password
                && u.RoleId == 2 && textBlockCaptchaTBl.Text == EnterCaptchaTB.Text))
                    {
                        var user = DB.User.FirstOrDefault(z => z.Login == LoginTB.Text);
                        var product = new Product(user);
                        product.Show();
                        this.Close();
                    }
                    else
                    {
                        if (DB.User.Any(u => u.Login == LoginTB.Text && u.Password
                == PasswordPB.Password
                && u.RoleId == 3 && textBlockCaptchaTBl.Text == EnterCaptchaTB.Text))
                        {
                            var user = DB.User.FirstOrDefault(z => z.Login == LoginTB.Text);
                            var product = new Product(user);
                            product.Show();
                            this.Close();
                        }
                        else
                        {
                            MessageBox.Show("Введен неверное пароль или логин",
                                "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                            _countEnter++;
                        }
                    }
                }
                if (_countEnter == 1)
                {
                    EnterBT.IsEnabled = false;
                    EnterCaptchaTB.Visibility = Visibility.Visible;
                    RestartCaptchaBT.Visibility = Visibility.Visible;
                    CreateCaptchaNoise();
                    Generate();
                    timer.Start();
                    _countEnter = 0;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        /// <summary>
        /// Метод для генерации графического шума
        /// </summary>
        private void CreateCaptchaNoise()
        {
            CaptchaCanvasCV.Children.Clear();
            Random random = new Random();
            for (int i = 0; i < 10; i++)
            {
                Line line = new Line
                {
                    X1 = random.Next((int)CaptchaCanvasCV.ActualWidth),
                    Y1 = random.Next((int)CaptchaCanvasCV.ActualHeight),
                    X2 = random.Next((int)CaptchaCanvasCV.ActualWidth),
                    Y2 = random.Next((int)CaptchaCanvasCV.ActualHeight),
                    Stroke = Brushes.LightBlue,
                    StrokeThickness = 1
                };
                CaptchaCanvasCV.Children.Add(line);
            }
            for (int i = 0; i < 10; i++)
            {
                Line line = new Line
                {
                    X1 = random.Next((int)CaptchaCanvasCV.ActualWidth),
                    Y1 = random.Next((int)CaptchaCanvasCV.ActualHeight),
                    X2 = random.Next((int)CaptchaCanvasCV.ActualWidth),
                    Y2 = random.Next((int)CaptchaCanvasCV.ActualHeight),
                    Stroke = Brushes.Pink,
                    StrokeThickness = 1
                };
                CaptchaCanvasCV.Children.Add(line);
            }
            for (int i = 0; i < 10; i++)
            {
                Line line = new Line
                {
                    X1 = random.Next((int)CaptchaCanvasCV.ActualWidth),
                    Y1 = random.Next((int)CaptchaCanvasCV.ActualHeight),
                    X2 = random.Next((int)CaptchaCanvasCV.ActualWidth),
                    Y2 = random.Next((int)CaptchaCanvasCV.ActualHeight),
                    Stroke = Brushes.Yellow,
                    StrokeThickness = 1
                };
                CaptchaCanvasCV.Children.Add(line);
            }
            for (int i = 0; i < 500; i++)
            {
                Ellipse ellipse = new Ellipse
                {
                    Width = 1,
                    Height = 1,
                    Fill = Brushes.Blue
                };
                Canvas.SetLeft(ellipse, random.Next((int)CaptchaCanvasCV.ActualWidth));
                Canvas.SetTop(ellipse, random.Next((int)CaptchaCanvasCV.ActualHeight));
                CaptchaCanvasCV.Children.Add(ellipse);
            }
        }
        /// <summary>
        /// Генерация символов в разном порядке
        /// </summary>
        public void Generate()
        {
            string symbols = "abcdefghijklmnopqrstuvwxyz0123456789";
            string stringOne = "";
            EnterCaptchaTB.Text = "";
            Random random = new Random();
            string stringTwo = "";
            for (int i = 0; i < 8; i++)
            {
                var m = symbols[random.Next(0, symbols.Length)];
                stringTwo = stringTwo + m;
                stringOne = stringOne + stringTwo;
                stringTwo = "";
            }
            textBlockCaptchaTBl.Text = stringOne;
        }
    }
}
