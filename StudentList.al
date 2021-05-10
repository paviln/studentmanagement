page 50101 "Student List"
{
    PageType = ListPart;
    SourceTable = "Student Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Course Name"; "Course Name")
                {
                    ApplicationArea = All;
                }
                field("Grade"; "Grade")
                {
                    ApplicationArea = All;

                }
                field("Line Number"; "Line Number")
                {
                    ApplicationArea = All;
                }

                field("Student Number"; "Student Number")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}