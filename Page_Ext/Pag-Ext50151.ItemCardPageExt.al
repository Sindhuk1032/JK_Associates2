pageextension 50151 ItemCardPageExt extends "Item Card"
{
    layout
    {
        addafter("Unit Price")
        {
            field("Threshold Amount"; Rec.Threshold)
            {
                Caption = 'Threshold Amount';
                ApplicationArea = all;

                trigger OnValidate()
                begin
                    if rec.Threshold > Rec."unit price" then begin
                        dialog.Error('Please enter lower then unit price');
                    end
                end;
            }
        }
        modify("Unit Price")
        {
            trigger OnAfterValidate()
            begin
                if rec."unit price" < Rec.Threshold then begin
                    dialog.Error('Please enter higher then threshold, The old threshold amount is %1', Rec.Threshold);
                end
            end;
        }
    }
    var
        myInt: Integer;
}
