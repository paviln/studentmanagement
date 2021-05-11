page 50101 "Student List"
{
    PageType = ListPart;
    SourceTable = "Student Line";
    //SourceTableView = WHERE(Student)
    RefreshOnActivate = true;
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

            }
        }
    }
}