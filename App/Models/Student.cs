using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WPF.Models
{
    public class Student
    {
        public int StudentNumber { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Education { get; set; }

        public string Birthdate { get; set; }

        public string PhoneNumber { get; set; }

        public int AverageGrade { get; set; }

        public string ClassDesignation { get; set; }
        public List<CourseGrade> CourseGrades = new List<CourseGrade>();

    }
}
