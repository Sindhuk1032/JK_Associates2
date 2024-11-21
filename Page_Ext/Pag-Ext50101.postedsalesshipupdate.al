pageextension 50301 postedsalesshipupdate extends "Posted Sales Shipment - Update"

{

    layout
    {
        addafter("Package Tracking No.")
        {
            field(GrossWeight; rec."Transit Distance")
            {
                Caption = 'Gross Weight';
                ApplicationArea = Suite;
                Editable = true;

            }

            field(NoofPallets; rec."Transit Hours")
            {
                Caption = 'No. of Pallets';
                ApplicationArea = Suite;
                Editable = true;
            }

            field(NoofPackages; rec."Insurer Policy Number")
            {
                Caption = 'No of Packages';
                ApplicationArea = Suite;
                Editable = true;
            }
        }
    }
    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        xSalesShipmentHeader := Rec;
    end;

    trigger OnQueryClosePage(CloseActions: Action): Boolean
    begin
        if CloseActions = ACTION::LookupOK then
            if RecordChange() then
                CODEUNIT.Run(CODEUNIT::"Shipment Header - Update", Rec);
    end;

    var
        xSalesShipmentHeader: Record "Sales Shipment Header";

    local procedure RecordChange() IsChanged: Boolean
    begin
        IsChanged :=
          (Rec."Transit Distance" <> xSalesShipmentHeader."Transit Distance") or
          (Rec."Package Tracking No." <> xSalesShipmentHeader."Package Tracking No.") or
          (Rec."Shipping Agent Service Code" <> xSalesShipmentHeader."Shipping Agent Service Code");

        OnAfterRecordChange(Rec, xSalesShipmentHeader, IsChanged);
    end;

    procedure SetRecord(SalesShipmentHeader: Record "Sales Shipment Header")
    begin
        Rec := SalesShipmentHeader;
        Rec.Insert();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterRecordChange(var SalesShipmentHeader: Record "Sales Shipment Header"; xSalesShipmentHeader: Record "Sales Shipment Header"; var IsChanged: Boolean)
    begin
    end;

    var
        myInt: Integer;

}
