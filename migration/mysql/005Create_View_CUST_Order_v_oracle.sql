CREATE OR REPLACE VIEW CUST_Order_v AS
	SELECT o.AD_Client_ID, o.AD_Org_ID, o.AD_OrgTrx_ID, o.AD_User_ID, o.AmountRefunded, 
	   o.AmountTendered, o.Bill_BPartner_ID, o.Bill_Location_ID, o.Bill_User_ID, 
	   o.C_Activity_ID, o.C_BPartner_ID, o.C_BPartner_Location_ID, o.C_Campaign_ID, 
	   o.C_CashLine_ID, o.C_Charge_ID, o.C_ConversionType_ID, o.C_Currency_ID, o.C_DocType_ID, 
	   o.C_DocTypeTarget_ID, o.ChargeAmt, o.CopyFrom, o.C_Order_ID, o.C_OrderSource_ID, 
	   o.C_Payment_ID, o.C_PaymentTerm_ID, o.C_POS_ID, o.C_Project_ID, o.Created, o.CreatedBy, 
	   o.DateAcct, o.DateOrdered, o.DatePrinted, o.DatePromised, o.DeliveryRule, o.DeliveryViaRule, 
	   o.Description, o.DocAction, o.DocStatus, o.DocumentNo, o.DropShip_BPartner_ID, o.DropShip_Location_ID, 
	   o.DropShip_User_ID, o.FreightAmt, o.FreightCostRule, 
	   CASE WHEN o.IsPayScheduleValid = 'N' THEN o.GrandTotal ELSE pps.DueAmt END GrandTotal, 
	   o.InvoiceRule, o.IsActive, 
	   o.IsApproved, o.IsCreditApproved, o.IsDelivered, o.IsDiscountPrinted, o.IsDropShip, o.IsInvoiced, 
	   o.IsPayScheduleValid, o.IsPrinted, o.IsSelected, o.IsSelfService, o.IsSOTrx, o.IsTaxIncluded, 
	   o.IsTransferred, o.Link_Order_ID, o.M_FreightCategory_ID, o.M_PriceList_ID, o.M_Shipper_ID, 
	   o.M_Warehouse_ID, o.OrderType, o.Pay_BPartner_ID, o.Pay_Location_ID, o.PaymentRule, o.POReference, 
	   o.Posted, o.PriorityRule, o.Processed, o.ProcessedOn, o.Processing, o.PromotionCode, o.Ref_Order_ID, 
	   o.SalesRep_ID, o.SendEMail, o.TotalLines, o.Updated, o.UpdatedBy, o.User1_ID, o.User2_ID, o.Volume, o.Weight,
	   pps.CUST_OrderPrePaySchedule_ID, pps.DueAmt, pps.DueDate
	FROM C_Order o
	LEFT JOIN CUST_OrderPrePaySchedule pps ON(pps.C_Order_ID = o.C_Order_ID)