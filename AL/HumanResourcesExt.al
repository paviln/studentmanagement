pageextension 50121 HumanResourcesExt extends "Human Resources Manager RC"
{
    actions
    {
        addlast(Sections)
        {
            group("School")
            {
                action("Students List")
                {
                    RunObject = page "Students List";
                    ApplicationArea = All;
                }
                action("Student Card")
                {
                    RunObject = page "Student Card";
                    ApplicationArea = All;
                }
                action("Student Document")
                {
                    RunObject = page "Student Document";
                    ApplicationArea = All;
                }
            }
        }
    }
}