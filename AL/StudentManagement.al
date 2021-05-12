codeunit 50113 "Student Management"
{
    trigger OnRun();
    begin
        Dialog.Message('F*** You Navision');
    end;

    procedure ExportStudentsToCSV()
    var
        LineNo: Integer;
        TempCSVBuffer: Record "CSV Buffer" temporary;
        StudentRec: Record "Student Header";
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
            until StudentRec.Next() = 0;

        TempCSVBuffer.SaveData('C:\temp\Students.csv', ',');

        Dialog.Message('Students Exported Check C:\temp folder');
    end;

    procedure GetStudent(var num: Code[10]) ReturnValue: Text
    var
        StudentRec: Record "Student Header";
        StudentLineRec: Record "Student Line";
        JObject: JsonObject;
    begin
        StudentLineRec.Find(StudentRec."Student Number");
        if StudentRec.GET(num) then begin
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