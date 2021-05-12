table 50100 "Student Header"
{
    LookupPageID = "Student List";

    fields
    {
        field(1; Firstname; Text[50])
        {

        }
        field(2; Lastname; Text[50])
        {

        }
        field(3; Education; option)
        {
            OptionMembers = "Mathematics","Computer Science","European Studies","Electronics","Innovation and Business";
        }
        field(4; Birthdate; Date)
        {

        }
        field(5; "Student Number"; Code[10])
        {

        }
        field(6; "Phone Number"; Text[20])
        {

        }
        field(7; "Average Grade"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Average("Student Line".Grade WHERE("Student Number" = Field("Student Number")));


        }
        field(8; "Class Designation"; Text[50])
        {

        }


    }

    keys
    {
        key(Key1; "Student Number")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    var
        StudentLine: Record "Student Line";
    begin
        StudentLine.SetRange(StudentLine."Student Number", "Student Number");
        StudentLine.DeleteAll();
    end;

    trigger OnRename()
    begin

    end;
}