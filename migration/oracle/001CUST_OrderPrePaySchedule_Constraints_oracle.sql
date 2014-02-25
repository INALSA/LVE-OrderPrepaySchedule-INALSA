Alter Table CUST_OrderPrePaySchedule
Add Constraint FK_CUST_OrderPrePaySchedule_C_Order Foreign Key (C_Order_ID)
References C_Order(C_Order_ID);

Alter Table CUST_OrderPrePaySchedule
Add Constraint FK_CUST_OrderPrePaySchedule_C_PaySchedule Foreign Key (C_PaySchedule_ID)
References C_PaySchedule(C_PaySchedule_ID);
