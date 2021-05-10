pageextension 50121 HumanResourcesExt extends "Human Resources Manager RC"
{
    actions
    {
        addlast(Sections)
        {
            group("School")
            {
                action("Students")
                {
                    RunObject = page "Student Document";
                    ApplicationArea = All;
                }
            }
        }
    }
}