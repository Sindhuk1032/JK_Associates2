tableextension 50146 SalesInvoiceLine extends "Sales Invoice Line"
{
    fields
    {
        field(50100; SalesQuantity; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Caption = 'Std-Quantity';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        // Add changes to keys here
    }
    fieldgroups
    {
        // Add changes to field groups here
    }
    var
        myInt: Integer;
}
