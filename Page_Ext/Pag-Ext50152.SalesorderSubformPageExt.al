pageextension 50152 "Sales order Subform PageExt" extends "Sales Order Subform"
{
    layout
    {
        modify("Unit Price")
        {
            trigger OnAfterValidate()
            begin
                ItemRec.SetRange(ItemRec."No.", Rec."No.");
                if ItemRec.FindSet() then begin
                    if rec."unit price" < ItemRec.Threshold then begin
                        dialog.Error('Please enter higher then threshold, The old threshold amount is %1', ItemRec.Threshold);
                    end
                end;
            end;
        }
    }
    var
        ItemRec: Record item;
}
