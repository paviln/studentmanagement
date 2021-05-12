table 50102 "Student Line"
{
    LookupPageID = "Students List";

    fields
    {
        field(1; "Course Name"; Text[50])
        {
        }
        field(2; "Grade"; Integer)
        {

        }
        field(3; "Line Number"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Student Number"; Code[10])
        {

        }
    }
    keys
    {
        key(Key1; "Line Number", "Student Number")
        {
            Clustered = true;
        }

    }
}