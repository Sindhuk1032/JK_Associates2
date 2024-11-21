pageextension 50150 PosalesInvoice extends "Posted Sales Invoice Subform"
{
    layout
    {

        addafter(Description)
        {
            field(SalesQuantity; rec.SalesQuantity)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}