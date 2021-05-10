table 50100 "Student Header"
{
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
            OptionMembers = "Option with ","spaces and ","other symbols!";
        }
        field(4; Birthdate; Date)
        {

        }
        field(5; "Student Number"; Text[6])
        {

        }
        field(6; "Phone Number"; Text[20])
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
    begin

    end;

    trigger OnRename()
    begin

    end;
}