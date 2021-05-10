page 50103 "Student Document"
{
    PageType = Document;
    SourceTable = "Student Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Firstname"; "Firstname")
                {
                    ApplicationArea = All;
                }
                field("Lastname"; "Lastname")
                {
                    ApplicationArea = All;
                }
                field("Education"; "Education")
                {
                    ApplicationArea = All;
                }
                field("Birthdate"; "Birthdate")
                {
                    ApplicationArea = All;
                }
                field("Student Number"; "Student Number")
                {
                    ApplicationArea = All;
                }
                field("Phone Number"; "Phone Number")
                {
                    ApplicationArea = All;
                }
            }
            group(LOL)
            {
                part("Student List"; "Student List")
                {

                }
            }
        }
    }
}