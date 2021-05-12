using Console.StudentWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Console
{
    public class Program
    {
        static void Main(string[] args)
        {
            GetStudent gs = new GetStudent();

            gs.UseDefaultCredentials = true;
            string studentNumber = "1111111111";
            
            System.Console.WriteLine(gs.CallGetStudent(num: ref studentNumber));
            System.Console.WriteLine("Press Enter to Exit");
            System.Console.ReadLine();
        }
    }
}
