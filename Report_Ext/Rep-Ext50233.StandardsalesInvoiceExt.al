reportextension 50233 "Standard sales Invoice Ext" extends "Standard Sales - Invoice"
{
    dataset
    {
        modify(Header)
        {
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
        }

        modify(Totals)
        {
            trigger OnafterPreDataItem()
            begin
                totalInvAmount := TotalAmountExclInclVATValue + RemainAmountToPrint1;

            end;
        }

        add(Line)
        {
            // add a new field to the dataset
            column(netWeight; SalesQuantity) { }
        }


        add(Totals)
        {
            column(totalInvAmount; totalInvAmount)
            {
            }
            column(subtotal; subtotal)
            {
            }
            column(setDimensionValue; setDimensionValue)
            {
            }
        }

        addafter(Line)
        {
            dataitem(Customer; Customer)
            {
                // RequestFilterFields = "Global Dimension 2 Code";
                DataItemLink = "No." = FIELD("Bill-to Customer No.");
                PrintOnlyIfDetail = true;

                column(Open_Customer_Entries_; 'Open Customer Entries')
                {
                }
                column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
                {
                }
                column(TIME; Time)
                {
                }
                column(CompanyInformation_Name; CompanyInformation.Name)
                {
                }
                column(USERID; UserId)
                {
                }
                column(Subtitle; Subtitle)
                {
                }
                column(PrintAmountsInLocal; PrintAmountsInLocal)
                {
                }
                column(filterstring; FilterString)
                {
                }
                column(filterstring2; FilterString2)
                {
                }
                column(Customer_TABLECAPTION__________FilterString; Customer.TableCaption + ': ' + FilterString)
                {
                }
                column(Cust__Ledger_Entry__TABLECAPTION__________FilterString2; "Cust. Ledger Entry".TableCaption + ': ' + FilterString2)
                {
                }
                column(Customer__No__; "No.")
                {
                }
                column(Customer_Name; Name)
                {
                }
                column(Customer__Phone_No__; "Phone No.")
                {
                }
                column(Customer_Contact; Contact)
                {
                }
                column(CustomerBlockedText; CustomerBlockedText)
                {
                }
                column(Cust__Ledger_Entry___Remaining_Amt___LCY__; "Cust. Ledger Entry"."Remaining Amt. (LCY)")
                {
                }
                column(Customer_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
                {
                }
                column(Customer_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
                {
                }
                column(Customer_Currency_Filter; "Currency Filter")
                {
                }
                column(Customer_Date_Filter; "Date Filter")
                {
                }
                column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
                {
                }
                column(Control9Caption; CaptionClassTranslate('101,1,' + Text003))
                {
                }
                column(Customer__No__Caption; Customer__No__CaptionLbl)
                {
                }
                column(DocumentCaption; DocumentCaptionLbl)
                {
                }
                column(Cust__Ledger_Entry__On_Hold_Caption; "Cust. Ledger Entry".FieldCaption("On Hold"))
                {
                }
                column(Cust__Ledger_Entry__Posting_Date_Caption; "Cust. Ledger Entry".FieldCaption("Posting Date"))
                {
                }
                column(Cust__Ledger_Entry__Document_Type_Caption; Cust__Ledger_Entry__Document_Type_CaptionLbl)
                {
                }
                column(Cust__Ledger_Entry_DescriptionCaption; "Cust. Ledger Entry".FieldCaption(Description))
                {
                }
                column(Cust__Ledger_Entry__Due_Date_Caption; "Cust. Ledger Entry".FieldCaption("Due Date"))
                {
                }
                column(RemainAmountToPrintCaption; RemainAmountToPrintCaptionLbl)
                {
                }
                column(Cust__Ledger_Entry__Document_No__Caption; Cust__Ledger_Entry__Document_No__CaptionLbl)
                {
                }
                column(OverDueDaysCaption; OverDueDaysCaptionLbl)
                {
                }
                column(Cust__Ledger_Entry__Currency_Code_Caption; "Cust. Ledger Entry".FieldCaption("Currency Code"))
                {
                }
                column(Cust__Ledger_Entry__Remaining_Amount_Caption; "Cust. Ledger Entry".FieldCaption("Remaining Amount"))
                {
                }
                column(Phone_Caption; Phone_CaptionLbl)
                {
                }
                column(Contact_Caption; Contact_CaptionLbl)
                {
                }
                column(Control1020000Caption; CaptionClassTranslate(GetCurrencyCaptionCode("Currency Code")))
                {
                }
                column(Report_Total_Amount_Due___Caption; CaptionClassTranslate('101,0,' + Text004))
                {
                }
                column(CompanyDivisionAddress; CompanyDivisionName)
                {
                }
                column(Total; customer.FieldCaption(Total))
                {
                }
                column(OldBalance; customer.FieldCaption(OldBalance))
                {
                }
                column(InvoiceDate; customer.FieldCaption(InvoiceDate))
                {
                }
                column(InvoiceAmount; customer.FieldCaption(InvoiceAmount))
                {
                }
                column(InvoiceNumber; customer.FieldCaption(InvoiceNumber))
                {
                }

                dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
                {
                    DataItemLink = "Customer No." = FIELD("No."), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Currency Code" = FIELD("Currency Filter"), "Posting Date" = FIELD("Date Filter");
                    DataItemTableView = SORTING("Customer No.", Open, Positive, "Due Date") WHERE(Open = CONST(true));
                    RequestFilterFields = "Document Type", "On Hold";

                    column(Cust__Ledger_Entry__Posting_Date_; Format(invDate, 0))
                    {
                    }
                    column(Cust__Ledger_Entry__Document_Type_; "Document Type")
                    {
                    }
                    column(Cust__Ledger_Entry__Document_No__; DOCUMENTNo)
                    {
                    }
                    column(Cust__Ledger_Entry_Description; Description)
                    {
                    }
                    column(Cust__Ledger_Entry__Due_Date_; Format("Due Date", 0))
                    {
                    }
                    column(RemainAmountToPrint; RemainAmountToPrint)
                    {
                    }
                    column(Cust__Ledger_Entry__On_Hold_; "On Hold")
                    {
                    }
                    column(OverDueDays; OverDueDays)
                    {
                    }
                    column(Cust__Ledger_Entry__Currency_Code_; "Currency Code")
                    {
                    }
                    column(Cust__Ledger_Entry__Remaining_Amount_; remainingInvAmount) // BlankZeroFormatted("Remaining Amount")
                    {
                        // AutoFormatExpression=
                    }
                    column(Remaining_Amount; "Remaining Amount")
                    {
                    }
                    column(Cust__Ledger_Entry__Cust__Ledger_Entry___Customer_No__; "Cust. Ledger Entry"."Customer No.")
                    {
                    }
                    column(Customer__No___Control40; Customer."No.")
                    {
                    }
                    column(RemainAmountToPrint_Control41; RemainAmountToPrint1)
                    {
                    }
                    column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
                    {
                    }
                    column(Cust__Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                    {
                    }
                    column(Cust__Ledger_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                    {
                    }
                    column(Customer_Total_Amount_DueCaption; Customer_Total_Amount_DueCaptionLbl)
                    {
                    }
                    column(Control1020001Caption; CaptionClassTranslate(GetCurrencyCaptionCode(Customer."Currency Code")))
                    {
                    }
                    dataitem(TempCustLedgerEntry; TempCustLedgerEntry)
                    {
                        column(InvNumber; InvNumber)
                        {
                        }
                        column(InvDate; Format(invDate, 0))
                        {
                        }
                        column(InvAmount; InvAmount)
                        {
                        }

                    }

                    trigger OnAfterGetRecord()
                    begin
                        if "Cust. Ledger Entry"."Document No." <> InvoiceNo then begin
                            CalcFields("Remaining Amount", "Remaining Amt. (LCY)");
                            if (ToDate > "Due Date") and ("Remaining Amount" > 0) and ("Cust. Ledger Entry"."Document No." <> InvoiceNo) then
                                OverDueDays := ToDate - "Due Date"
                            else
                                OverDueDays := 0;
                            if PrintAmountsInLocal then begin
                                if "Currency Code" = Customer."Currency Code" then
                                    RemainAmountToPrint := "Remaining Amount"
                                else
                                    if Customer."Currency Code" = '' then
                                        RemainAmountToPrint := "Remaining Amt. (LCY)"
                                    else
                                        RemainAmountToPrint := Round(CurrExchRate.ExchangeAmtFCYToFCY(DateToConvertCurrency, "Currency Code", Customer."Currency Code", "Remaining Amount"), Currency."Amount Rounding Precision");
                            end
                            else
                                RemainAmountToPrint := "Remaining Amt. (LCY)";
                        end
                    end;

                    trigger OnPreDataItem()
                    var
                        tempTable: Record TempCustLedgerEntry;
                        customer: Record Customer;
                    begin
                        tempTable.DeleteAll();
                        if "Cust. Ledger Entry"."Document No." <> InvoiceNo then begin
                            if "Cust. Ledger Entry".FindSet() then begin
                                if "Cust. Ledger Entry"."Remaining Amount" <> 0 then begin
                                    repeat
                                        if "Cust. Ledger Entry"."Document No." <> InvoiceNo then begin
                                            Remaining_Amount += "Cust. Ledger Entry"."Remaining Amount";
                                            tempTable.InvNumber := "Cust. Ledger Entry"."Document No.";
                                            tempTable.InvDate := "Cust. Ledger Entry"."Posting Date";
                                            tempTable.InvAmount := "Cust. Ledger Entry"."Remaining Amount";
                                            tempTable.Insert();
                                        end;
                                    until "Cust. Ledger Entry".Next() = 0;
                                end
                            end;
                            RemainAmountToPrint1 := Remaining_Amount;
                        end;
                    end;
                }

                trigger OnAfterGetRecord()
                var
                    dimensionSetId: Integer;
                    myCodeUnit: Codeunit events;
                    custNo: code[20];
                begin
                    Header.SetRange("No.", InvoiceNo);
                    if Header.FindFirst() then begin
                        code := Header."Shortcut Dimension 2 Code";
                    end;
                    //code := Header.GetFilter(Header."Shortcut Dimension 2 Code");
                    Dimention_Value.SetRange(Dimention_Value.Code, code);
                    if Dimention_Value.FindSet() then begin
                        CompanyDivisionName := Dimention_Value.Name;
                    end;
                end;


                trigger OnPreDataItem()
                begin
                    if ToDate <> 0D then Subtitle := Text000 + ' ' + Format(ToDate, 0, 4) + ')';
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            addafter(Options)
            {
                field(ToDate; ToDate)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ending Date';
                    ToolTip = 'Specifies the date to which the report or batch job processes information.';
                }
                field(PrintAmountsInLocal; PrintAmountsInLocal)
                {
                    ApplicationArea = Suite;
                    Caption = 'Print Amounts in Customer''s Currency';
                    MultiLine = true;
                    ToolTip = 'Specifies if amounts are printed in the customer''s currency. Clear the check box to print all amounts in US dollars.';
                }
                // field(setDimensionValue; setDimensionCode)
                // {
                //     caption = 'Division Code';
                //     ApplicationArea = all;
                //     Editable = false;
                // }
            }
            //addafter()B
        }
        trigger OnOpenPage()
        begin
            if ToDate = 0D then ToDate := WorkDate();
            getDimensionValue := Header.GetFilter("No.");
            Header.SetRange("No.", getDimensionValue);
            if Header.FindFirst() then begin
                if Header."Shortcut Dimension 2 Code" <> '' then setDimensionCode := Header."Shortcut Dimension 2 Code"
            end;
            DimensionValue.SetRange(Code, setDimensionCode);
            if DimensionValue.FindSet() then begin
                setDimensionValue := DimensionValue.Name;
            end;
        end;

        trigger OnClosePage()
        begin
            if setDimensionValue = '' then Error('Please Set the Division Value first(in Dimension table)');
        end;

    }
    rendering
    {
        layout(LayoutName)
        {
            Type = Word;
            LayoutFile = './Report_Ext/LayoutNameJKCorp.docx';
        }
    }
    trigger OnPreReport()
    begin
        InvoiceNo := Header.GetFilter("No.");
    end;

    var
        divisionValue: Code[20];
        setDimensionValue: Code[90];
        setDimensionCode: code[20];
        getDimensionValue: Code[20];
        posted_salesInvoice: Page "Posted Sales Invoice";
        SalesInvoiceLine: Record "Sales Invoice Line";
        salesInvoiceHeader: Record "Sales Invoice Header";
        salesorderline: record "Sales Line";
        remainingInvAmount: Text[50];
        InvoiceNo: Text[20];
        code: text[50];
        dimensioncode: Text[50];
        companySurName: Text[50];
        Remaining_Amount: Decimal;
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        GLSetup1: Record "General Ledger Setup";
        FilterString: Text;
        FilterString2: Text;
        CustomerBlockedText: Text[80];
        Subtitle: Text[126];
        PrintAmountsInLocal: Boolean;
        DateToConvertCurrency: Date;
        ToDate: Date;
        OverDueDays: Integer;
        RemainAmountToPrint: Decimal;
        RemainAmountToPrint1: Decimal;
        CompanyInformation: Record "Company Information";
        Text000: Label '(Open Entries Due as of';
        Text1020000: Label ' *** Customer is Blocked for %1 processing ***';
        PrivacyBlockedTxt: Label ' *** Customer is Blocked for privacy***.';
        Text002: Label 'Amount due is in %1';
        Text003: Label 'Amounts are in the customer''s local currency (report totals are in %1).';
        Text004: Label 'Report Total Amount Due (%1)';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Customer__No__CaptionLbl: Label 'Customer';
        DocumentCaptionLbl: Label 'Document';
        Cust__Ledger_Entry__Document_Type_CaptionLbl: Label 'Type';
        RemainAmountToPrintCaptionLbl: Label 'Amount Due';
        Cust__Ledger_Entry__Document_No__CaptionLbl: Label 'Number';
        OverDueDaysCaptionLbl: Label 'Days Overdue';
        Phone_CaptionLbl: Label 'Phone:';
        Contact_CaptionLbl: Label 'Contact:';
        Customer_Total_Amount_DueCaptionLbl: Label 'Customer Total Amount Due';
        Dimention_Value: Record "Dimension Value";
        CompanyDivisionName: Text[20];
        invDate: Date;
        invAmount: Decimal;
        DocumentNo: code[20];
        totalInvAmount: Decimal;
        subtotal: Label 'Subtotal Incl. Tax';
        unitpriceCaption: Label 'Unit Price';
        DimensionValue: Record "Dimension Value";
        Invoicetotal: Decimal;
        salesshipmentNA: Report "Sales Shipment NA";
        OrderedQuantity: Decimal;
        BackOrderedQuantity: Decimal;
        OnLineNumber: Integer;
        TempSalesShipmentLine: Record "Sales Invoice Line" temporary;
        OrderLine: Record "Sales Line";
        ReceiptLine: Record "Sales Invoice Line";
        PackageTrackingText: Text;
        PrintPackageTrackingNos: TEXT;


    local procedure GetCurrencyRecord(var Currency: Record Currency; CurrencyCode: Code[10])
    begin
        if "Cust. Ledger Entry"."Document No." <> InvoiceNo then begin
            if CurrencyCode = '' then begin
                Clear(Currency);
                Currency.Description := GLSetup1."LCY Code";
                Currency."Amount Rounding Precision" := GLSetup1."Amount Rounding Precision";
            end
            else
                if Currency.Code <> CurrencyCode then Currency.Get(CurrencyCode);
        end;
    end;

    local procedure GetCurrencyCaptionCode(CurrencyCode: Code[10]): Text[80]
    begin
        if "Cust. Ledger Entry"."Document No." <> InvoiceNo then begin
            if PrintAmountsInLocal then begin
                if CurrencyCode = '' then exit('101,1,' + Text002);
                GetCurrencyRecord(Currency, CurrencyCode);
                exit(StrSubstNo(Text002, Currency.Description));
            end;
            exit('');
        end;
    end;

    procedure BlankZeroFormatted(numFormat: Decimal): Text
    var
        num: Integer;
    begin
        if Evaluate(num, Format(numFormat)) and (num = 0) then
            exit('')
        else
            exit(Format(numFormat));
    end;
}
