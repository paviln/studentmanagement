page 50102 "Student Card"
{
    PageType = Card;
    SourceTable = "Student Header";
    RefreshOnActivate = true;
    layout
    {
        area(content)
        {
            group(Reward)
            {
                field("Firstname"; "Firstname")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique ID of the reward.';
                }
                field("Lastname"; "Lastname")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique ID of the reward.';
                }
                field("Education"; "Education")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique ID of the reward.';
                }
                field("Birthdate"; "Birthdate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique ID of the reward.';
                }
                field("Student Number"; "Student Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique ID of the reward.';
                }
                field("Phone Number"; "Phone Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique ID of the reward.';
                }
                field("Average Grade"; "Average Grade")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique ID of the reward.';
                }
            }

        }

    }
    actions
    {
        area(Navigation)
        {
            action("Open Student")
            {
                ApplicationArea = All;
                RunObject = page "Student Document";
                RunPageLink = "Student Number" = field("Student Number");
                ToolTip = 'View all Students';
            }
            action("Open Customer")
            {
                ApplicationArea = All;
                RunObject = page "Customer Card";
                Image = Absence;
                ShortCutKey = 'Alt+c';
                ToolTip = 'View Customer Card';
            }

            action("Display Dialog")
            {

                RunObject = codeunit "Student Management";
            }

        }
    }
}