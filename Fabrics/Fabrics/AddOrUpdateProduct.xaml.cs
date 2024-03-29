using Fabrics.DataBase;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.IO;
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

namespace Fabrics
{
    /// <summary>
    /// Логика взаимодействия для AddOrUpdateProduct.xaml
    /// </summary>
    public partial class AddOrUpdateProduct : Window
    {
        VinidiktovDay5Entities DB = new VinidiktovDay5Entities();
        Product isProduct = new Product();
        
        public AddOrUpdateProduct()
        {
            InitializeComponent();
            var items = DB.Supplier.Select(f => f.Name).Distinct().ToList();
            SupplierProduct.ItemsSource = items;
            var itemsCat = DB.CategoryProduct.Select(f => f.Name).Distinct().ToList();
            CategoryProductCMB.ItemsSource = itemsCat;
            var itemsUnit = DB.UnitMeasurement.Select(f => f.Name).Distinct().ToList();
            UnitOfMeasurementCMB.ItemsSource = itemsUnit;

        }

        public int id_Product;

        public AddOrUpdateProduct(InfoProduct INF)
        {
            InitializeComponent();
            id_Product = INF.ID_Product;
            var pris = DB.Product.Find(INF.ID_Product);
            TitleProduct.Text = pris.Name;
            PriceProduct.Text = pris.Cost.ToString();
            CountProduct.Text = pris.QuantityStock.ToString();
            DescriptionProduct.Text = pris.DescriptionProduct;
            var items = DB.Supplier.Select(f => f.Name).Distinct().ToList();
            SupplierProduct.ItemsSource = items;
            SupplierProduct.SelectedValue = pris.Supplier.Name;
            var itemsCat = DB.CategoryProduct.Select(f => f.Name).Distinct().ToList();
            CategoryProductCMB.ItemsSource = itemsCat;
            CategoryProductCMB.SelectedValue = pris.CategoryProduct.Name;
            var itemsUnit = DB.UnitMeasurement.Select(f => f.Name).Distinct().ToList();
            UnitOfMeasurementCMB.ItemsSource= itemsUnit;
            UnitOfMeasurementCMB.SelectedValue = pris.UnitMeasurement.Name;
            IconProduct.Source = INF.Image;
            if (!string.IsNullOrEmpty(INF.Photo))
            {
                isProduct.Photo = @"\Resource\" + INF.Photo.Split('\\').Last();
            }
        }

        private void AddOrEditProductBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (TitleProduct.Text.ToString() == ""
                    || PriceProduct.Text.Length <= 0
                    || SupplierProduct.Text.Length <= 0
                    || DescriptionProduct.Text == ""
                    || CountProduct.Text.Length <= 0)
                {
                    MessageBox.Show("Заполните все поля ввода!", "Ошибка",
                        MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else if (Convert.ToInt32(PriceProduct.Text) < 0)
                {
                    MessageBox.Show("Стоимость не может быть отрицательной!", "Ошибка",
                        MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else if (Convert.ToInt32(CountProduct.Text) < 0)
                {
                    MessageBox.Show("Товар не может быть отрицательным!", "Ошибка",
                        MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    Product serv = new Product();
                    if (id_Product != 0)
                    {
                        serv.ID_Product = id_Product;
                    }
                    else
                    {
                        serv.ID_Product = DB.Product.Max(a => a.ID_Product) + 1;
                    }
                    serv.Name = TitleProduct.Text;
                    serv.Articul = GenerateRandomArticule();
                    serv.ID_Category = DB.CategoryProduct.First(a => a.Name == 
                    CategoryProductCMB.SelectedItem.ToString()).ID_Category;
                    serv.Cost = PriceProduct.Text;
                    serv.ID_Supplier = DB.Supplier.First(a => a.Name == 
                    SupplierProduct.SelectedItem.ToString()).ID_Supplier;
                    serv.DescriptionProduct = DescriptionProduct.Text;
                    serv.QuantityStock = Convert.ToInt32(CountProduct.Text);
                    serv.ID_UnitMeasurement = DB.UnitMeasurement.First(a => a.Name == 
                    UnitOfMeasurementCMB.SelectedItem.ToString()).ID_UnitMeasurement;
                    serv.ID_Manufacture = 1;
                    serv.ManufactureProduct = DB.ManufactureProduct.Find(isProduct.ManufactureProduct);
                    serv.CategoryProduct = DB.CategoryProduct.Find(isProduct.CategoryProduct);
                    serv.MaxDiscount = 0;
                    serv.CurrentDiscount = 0;
                    if (string.IsNullOrEmpty(isProduct.Photo))
                    {
                       string dir = Environment.CurrentDirectory + @"\Resource\";
                       serv.Photo = @"\Resource\picture.png";
                       if (!(File.Exists(dir + "picture.png")))
                       {
                       File.Copy(@"path\to\default\picture.png", dir + "picture.png");
                       }
                    }
                    else
                    {
                        serv.Photo = isProduct.Photo;
                    }
                    DB.Product.AddOrUpdate(serv);
                    DB.SaveChanges();
                    Users users = new Users();
                    users.ID_Role = 1;
                    ProductsForm main = new ProductsForm(users);
                    main.Show();
                    Close();
                }
        }
            catch
            {
                MessageBox.Show("Произошла непредвиденная ситуация", "Ошибка",
                MessageBoxButton.OK, MessageBoxImage.Error);
            }
}

        /// <summary>
        /// Генерация артикула
        /// </summary>
        /// <returns></returns>
        private string GenerateRandomArticule()
        {
            const string prefix = "T";
            const string suffixLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            const string suffixNumbers = "0123456789";
            Random random = new Random();
            StringBuilder sb = new StringBuilder();
            //Генерация трех случайных цифр
            sb.Append(prefix);
            sb.Append(random.Next(100, 999));
            //Генерация случайной буквы
            char randomLetter = suffixLetters[random.Next(suffixLetters.Length)];
            sb.Append(randomLetter);
            //Генерация случайной цифры
            int randomNumber = random.Next(0, 9);
            sb.Append(randomNumber);
            return sb.ToString();
        }

        private void CancelBtn_Click(object sender, RoutedEventArgs e)
        {
            Users users = new Users();
            users.ID_Role = 1;
            ProductsForm main = new ProductsForm(users);
            main.Show();
            Close();
        }

        public string path;

        /// <summary>
        /// Загрузка фотографий из проводника
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ChoosePhotoProduct_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "All supported graphics|*.jpg;*.jpeg;*.png|" +
            "JPEG (*.jpg;*.jpeg)|*.jpg;*.jpeg|" +
            "Portable Network Graphic (*.png)|*.png";
            if (openFileDialog.ShowDialog() == true)
            {
                IconProduct.Source = new BitmapImage(new Uri(openFileDialog.FileName));
                path = openFileDialog.FileName;
                string dir = Environment.CurrentDirectory + @"\Resource\";
                if (!(File.Exists(dir + openFileDialog.FileName.Split('\\').Last())))
                    File.Copy(path, dir + openFileDialog.FileName.Split('\\').Last());
                isProduct.Photo = @"\Resource\" + openFileDialog.FileName.Split('\\').Last();
            }
        }

        private void PriceProduct_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (char.IsLetter(e.Text, e.Text.Length - 1))
            {
                e.Handled = true;
            }
        }

        private void CountProduct_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Space)
            {
                e.Handled = true;
            }
        }
    }
}
