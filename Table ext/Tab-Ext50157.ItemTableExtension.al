/// <summary>
/// TableExtension ItemTableExtension (ID 50157) extends Record Item.
/// </summary>
tableextension 50157 ItemTableExtension extends Item
{
    fields
    {
        field(50019; "Threshold"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
            MinValue = 0.1;
        }
    }
    var
        myInt: Integer;
}
