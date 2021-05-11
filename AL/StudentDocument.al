page 50103 "Student Document"
{
    PageType = Document;
    SourceTable = "Student Header";
    RefreshOnActivate = true;

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
                field("Average Grade"; "Average Grade")
                {

                    ApplicationArea = All;
                }
            }
            group("Student Grade List")
            {
                part("Student List"; "Student List")
                {
                    SubPageLink = "Student Number" = field("Student Number");
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action("Export Students")
            {
                ApplicationArea = All;

                //RunObject = codeunit DisplayMsg.ExportStudentsToCSV();
                trigger OnAction()
                var
                    displaymsg: Codeunit DisplayMsg;
                begin
                    displaymsg.ExportStudentsToCSV();
                end;

            }
        }
    }
}