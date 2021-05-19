codeunit 50113 "Student Management"
{
    trigger OnRun();
    begin
        Dialog.Message('Navision Message');
    end;

    procedure ExportStudents()
    var
        CSWriter: File;
        StudentRec: Record "Student Header";
        StudentLineRec: Record "Student Line";
    begin

        if CSWriter.Create('C:\temp\Students.csv') then begin
            CSWriter.TextMode(true);
            CSWriter.Write('Student Firstname;Student Lastname;Student Birthdate;Student Education;Student Number;Student Phone Number; Student Average Grade');
            StudentRec.Reset();
            StudentLineRec.Reset();

            if StudentRec.Find('-') AND StudentLineRec.Find('-') then
                repeat
                    CSWriter.Write(StudentRec.Firstname + ';' + StudentRec.Lastname + ';' + Format(StudentRec.Birthdate) + ';' + Format(StudentRec.Education) + ';' + StudentRec."Student Number" + ';'
                    + StudentRec."Phone Number" + Format(StudentRec."Average Grade"))
                    until StudentRec.next = 0;
            CSWriter.Write('Student Number;Student Course;Student Grade');
            repeat
                CSWriter.Write(StudentLineRec."Student Number" + ';' + StudentLineRec."Course Name" + ';' + Format(StudentLineRec.Grade))
                until StudentLineRec.next = 0;
            Dialog.Message('Students Exported Check C:\temp folder');
            CSWriter.Close();
        end;
    end;


    /*
    procedure ExportStudentsToCSV()
    var
        LineNo: Integer;
        TempCSVBuffer: Record "CSV Buffer" temporary;
        StudentRec: Record "Student Header";
        StudentLineRec: Record "Student Line";
        filePath: Text;
    begin
        LineNo := 1;
        TempCSVBuffer.InsertEntry(LineNo, 1, 'Student Firstname');
        TempCSVBuffer.InsertEntry(LineNo, 2, 'Student Lastname');
        TempCSVBuffer.InsertEntry(LineNo, 3, 'Student Birthdate');
        TempCSVBuffer.InsertEntry(LineNo, 4, 'Student Education');
        TempCSVBuffer.InsertEntry(LineNo, 5, 'Student Student Number');
        TempCSVBuffer.InsertEntry(LineNo, 6, 'Student Phone Number');
        TempCSVBuffer.InsertEntry(LineNo, 7, 'Student Average Grade');
        TempCSVBuffer.InsertEntry(LineNo, 8, 'Student Course');
        TempCSVBuffer.InsertEntry(LineNo, 9, 'Student Grade');
        if StudentRec.FindSet() then
            repeat
                LineNo += 1;
                TempCSVBuffer.InsertEntry(LineNo, 1, StudentRec.Firstname);
                TempCSVBuffer.InsertEntry(LineNo, 2, StudentRec.Lastname);
                TempCSVBuffer.InsertEntry(LineNo, 3, Format(StudentRec.Birthdate));
                TempCSVBuffer.InsertEntry(LineNo, 4, Format(StudentRec.Education));
                TempCSVBuffer.InsertEntry(LineNo, 5, StudentRec."Student Number");
                TempCSVBuffer.InsertEntry(LineNo, 6, StudentRec."Phone Number");
                TempCSVBuffer.InsertEntry(LineNo, 7, Format(StudentRec."Average Grade"));
                TempCSVBuffer.InsertEntry(LineNo, 8, StudentLineRec."Course Name");
                TempCSVBuffer.InsertEntry(LineNo, 9, Format(StudentLineRec."Grade"));
            until StudentRec.Next() = 0;

        TempCSVBuffer.SaveData('C:\temp\Students.csv', ',');

        Dialog.Message('Students Exported Check C:\temp folder');
    end;
    */
    procedure GetStudent(var num: Code[10]) ReturnValue: Text
    var
        StudentRec: Record "Student Header";
        StudentLineRec: Record "Student Line";
        JObject: JsonObject;
        GradeCouse: JsonArray;
        GradeCouseItem: JsonObject;
    begin
        if StudentRec.GET(num) then begin
            IF (StudentLineRec.FINDSET) then
                repeat
                    GradeCouseItem.Add('CourseName', StudentLineRec."Course Name");
                    GradeCouseItem.Add('Grade', StudentLineRec.Grade);
                    GradeCouse.Add(GradeCouseItem);
                    GradeCouseItem.Remove('CourseName');
                    GradeCouseItem.Remove('Grade')
                until (StudentLineRec.Next = 0);
            JObject.Add('CourseGrades', GradeCouse);
            JObject.Add('Firstname', StudentRec.Firstname);
            JObject.Add('Lastname', StudentRec.Lastname);
            JObject.Add('Birthdate', Format(StudentRec.Birthdate));
            JObject.Add('Education', Format(StudentRec.Education));
            JObject.Add('StudentNumber', StudentRec."Student Number");
            JObject.Add('PhoneNumber', StudentRec."Phone Number");
            JObject.Add('Average Grade', Format(StudentRec."Average Grade"));

            JObject.WriteTo(ReturnValue);
            exit(ReturnValue);

        end;
    end;
}