tableextension 50184 CustomerExt extends Customer
{
    
    fields
    {
        field(50322; Total; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Total';
        }
        field(50323; OldBalance; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Old Balance';
        }
        field(50324; InvoiceDate; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Invoice Date';
        }
        field(50325; InvoiceAmount; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Invoice Amount';
        }
        field(50326; InvoiceNumber; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Invoice Number';
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
