tableextension 50144 salesLineTableExt extends "Sales Line"
{
    fields
    {
        field(50100; "Threshold"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
            MinValue = 0.1;
        }
    }
    var
        myInt: Integer;
}
