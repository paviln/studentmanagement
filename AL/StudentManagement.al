codeunit 50113 "Student Management"
{
    trigger OnRun();
    begin
        Dialog.Message('Fuck you Navision');
    end;

    procedure ExportStudentsToCSV()
    var
        LineNo: Integer;
        TempCSVBuffer: Record "CSV Buffer" temporary;
        Student: Record "Student Header";
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
        if Student.FindSet() then
            repeat
                LineNo += 1;
                TempCSVBuffer.InsertEntry(LineNo, 1, Student.Firstname);
                TempCSVBuffer.InsertEntry(LineNo, 2, Student.Lastname);
                TempCSVBuffer.InsertEntry(LineNo, 3, Format(Student.Birthdate));
                TempCSVBuffer.InsertEntry(LineNo, 4, Format(Student.Education));
                TempCSVBuffer.InsertEntry(LineNo, 5, Student."Student Number");
                TempCSVBuffer.InsertEntry(LineNo, 6, Student."Phone Number");
                TempCSVBuffer.InsertEntry(LineNo, 7, Format(Student."Average Grade"));
            until Student.Next() = 0;

        TempCSVBuffer.SaveData('C:\temp\Students.csv', ',');
    end;

    procedure GetStudent(var num: Code[10]) ReturnValue: JsonObject
    var
        Student: Record "Student Header";
    begin
        if Student.GET(num) then begin
            ReturnValue.Add('Firstname', Student.Firstname);
            ReturnValue.Add('Lastname', Student.Lastname);
            ReturnValue.Add('Birthdate', Format(Student.Birthdate));
            ReturnValue.Add('Education', Format(Student.Education));
            ReturnValue.Add('StudentNumber', Student."Student Number");
            ReturnValue.Add('PhoneNumber', Student."Phone Number");
            ReturnValue.Add('Average Grade', Format(Student."Average Grade"));
            exit(ReturnValue);
        end;
    end;
}