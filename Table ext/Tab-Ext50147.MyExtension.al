tableextension 50147 MyExtension extends "Sales Invoice Header"
{
    fields
    {
        field(50101; DimValue; Code[20])
        {
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
    trigger OnAfterInsert()
    var
        SalesHeader: Record "Sales Invoice Header";
    // SomePage: Page standard s;
    begin
        SalesHeader.SetCurrentKey("No.");
        //SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        // SomePage.SetTableView(SalesHeader); // Only view sales orders.  
        // SomePage.Run;
    end;
    // end;
    procedure printRecord(ShowRequestPage: Boolean)
    var
        DocumentSendingProfile: Record "Document Sending Profile";
        DummyReportSelections: Record "Report Selections";
        IsHandled: Boolean;
        EInvoiceMgt: Codeunit "E-Invoice Mgt.";
    begin
        begin
            IsHandled := false;
            //OnBeforePrintRecords(DummyReportSelections, Rec, ShowRequestPage, IsHandled);
            if not IsHandled then begin
                EInvoiceMgt.EDocPrintValidation(0, "No.");
                DocumentSendingProfile.TrySendToPrinter(DummyReportSelections.Usage::SalesInvoice.asInteger(), Rec, FieldNo("Bill-to Customer No."), ShowRequestPage);
            end;
        end;
    end;

    // [IntegrationEvent(false, false)]
    // local procedure OnBeforePrintRecords(var ReportSelections: Record "Report Selections"; var SalesInvoiceHeader: Record "Sales Invoice Header"; ShowRequestPage: Boolean; var IsHandled: Boolean)
    // begin
    // end;

    var
        myInt: Integer;
}
