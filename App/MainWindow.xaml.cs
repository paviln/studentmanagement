using Console.StudentWS;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml.Serialization;
using WPF.Models;

namespace WPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            //Webservice to retrieve the student header
            GetStudent gs = new GetStudent
            {
                UseDefaultCredentials = true
            };

            //Specific student number (Primary Key)
            string studentNumber = "1111111111";

            string test = gs.CallGetStudent(num: ref studentNumber);
            //Deserialize JsonObject from Webservice
            var result = JsonConvert.DeserializeObject<Student>(gs.CallGetStudent(num: ref studentNumber));
            Student studentItem = new Student
            {
                FirstName = result.FirstName,
                LastName = result.LastName,
                Education = result.Education,
                Birthdate = result.Birthdate,
                StudentNumber = result.StudentNumber,
                PhoneNumber = result.PhoneNumber,
                AverageGrade = result.AverageGrade,
                ClassDesignation = result.ClassDesignation

            };
            student.ItemsSource = new List<Student> { studentItem };
            List<CourseGrade> courseGrades = result.CourseGrades;
            coursegrade.ItemsSource = courseGrades;
        }
    }
}
