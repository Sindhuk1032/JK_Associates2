table 50211 TempCustLedgerEntry
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; InvNumber; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; InvAmount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3; InvDate; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; InvNumber)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        // Add changes to field groups here
    }
    var
        myInt: Integer;

    trigger OnInsert()
    begin
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}
