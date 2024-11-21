codeunit 50175 events
{
    Access = Public;
    SingleInstance = true;
    InherentEntitlements = X;
    InherentPermissions = X;

    procedure printRecord(ShowRequestPage: Boolean)
    var
        DocumentSendingProfile: Record "Document Sending Profile";
        DummyReportSelections: Record "Report Selections";
        IsHandled: Boolean;
        EInvoiceMgt: Codeunit "E-Invoice Mgt.";
        Rec: Record "Sales Invoice Header";
    begin
        begin
            IsHandled := false;
            OnBeforePrintRecords(DummyReportSelections, Rec, ShowRequestPage, IsHandled);
            if not IsHandled then begin
                EInvoiceMgt.EDocPrintValidation(0, Rec."No.");
                DocumentSendingProfile.TrySendToPrinter(DummyReportSelections.Usage::SalesInvoice.asInteger(), Rec, rec.FieldNo("Bill-to Customer No."), ShowRequestPage);
            end;
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePrintRecords(var ReportSelections: Record "Report Selections"; var SalesInvoiceHeader: Record "Sales Invoice Header"; ShowRequestPage: Boolean; var IsHandled: Boolean)
    begin
    end;

    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Invoice", 'OnBeforeSalesInvHeaderPrintRecords', '', false, false)]
    local procedure OnBeforeSalesInvHeaderPrintRecords(var SalesInvHeader: Record "Sales Invoice Header"; var IsHandled: Boolean)
    begin
        //Message('hi');
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Sales-Post", 'OnBeforeSalesInvLineInsert', '', false, false)]

    local procedure OnBeforeSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line"; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean; var IsHandled: Boolean; PostingSalesLine: Record "Sales Line"; SalesShipmentHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header"; var ReturnReceiptHeader: Record "Return Receipt Header")
    begin

        Message('%1', SalesInvLine.SalesQuantity);
        SalesInvLine.SalesQuantity := SalesLine.Quantity;

        //Message('%1', SalesInvLine.SalesQuantity);
    end;

    var
        a: codeunit 80;
}
