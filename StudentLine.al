table 50102 "Student Line"
{
    fields
    {
        field(1; "Course Name"; Text[50])
        {
        }
        field(2; "Grade"; Text[2])
        {
        }
        field(3; "Line Number"; Integer)
        {
        }
        field(4; "Student Number"; Integer)
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