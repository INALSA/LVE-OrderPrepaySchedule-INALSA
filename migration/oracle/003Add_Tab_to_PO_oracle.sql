-- Apr 10, 2013 10:23:48 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Tab (AD_Client_ID,AD_Org_ID,AD_Tab_ID,AD_Table_ID,AD_Window_ID,Created,CreatedBy,EntityType,HasTree,ImportFields,IsActive,IsAdvancedTab,IsInfoTab,IsInsertRecord,IsReadOnly,IsSingleRow,IsSortTab,IsTranslationTab,Name,Processing,SeqNo,TabLevel,Updated,UpdatedBy) VALUES (0,0,3000202,3000207,181,TO_DATE('2013-04-10 22:23:47','YYYY-MM-DD HH24:MI:SS'),100,'ECA03','N','N','Y','N','N','Y','N','Y','N','N','Pre-Payment Schedule','N',60,0,TO_DATE('2013-04-10 22:23:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:23:48 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, CommitWarning,Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.CommitWarning,t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=3000202 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- Apr 10, 2013 10:24:15 PM VET
-- Order Prepay Schedule
UPDATE AD_Tab_Trl SET Name='Programa de Aticipos a Ordenes',Updated=TO_DATE('2013-04-10 22:24:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000202 AND AD_Language='es_MX'
;

-- Apr 10, 2013 10:24:42 PM VET
-- Order Prepay Schedule
UPDATE AD_Table_Trl SET Name='Programa de Aticipos a Ordenes',Updated=TO_DATE('2013-04-10 22:24:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000207 AND AD_Language='es_MX'
;

-- Apr 10, 2013 10:24:58 PM VET
-- Order Prepay Schedule
UPDATE AD_Element_Trl SET Name='Programa de Aticipos a Ordenes',PrintName='Programa de Aticipos a Ordenes',Updated=TO_DATE('2013-04-10 22:24:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000218 AND AD_Language='es_MX'
;

-- Apr 10, 2013 10:25:33 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000249,3000227,0,3000202,TO_DATE('2013-04-10 22:25:33','YYYY-MM-DD HH24:MI:SS'),100,'The record is active in the system',1,'ECA03','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','Y','Y','Y','N','N','N','N','N','Active',TO_DATE('2013-04-10 22:25:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:33 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000227 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000247,3000228,0,3000202,TO_DATE('2013-04-10 22:25:33','YYYY-MM-DD HH24:MI:SS'),100,'Amount of the payment due',14,'ECA03','Full amount of the payment due','Y','Y','Y','N','N','N','N','N','Amount due',TO_DATE('2013-04-10 22:25:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000228 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000238,3000229,0,3000202,TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100,'Client/Tenant for this installation.',10,'ECA03','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','Y','Y','Y','N','N','N','N','N','Client',TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000229 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000245,3000230,0,3000202,TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100,'Calculated amount of discount',14,'ECA03','The Discount Amount indicates the discount amount for a document or line.','Y','Y','Y','N','N','N','N','N','Discount Amount',TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000230 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000246,3000231,0,3000202,TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100,'Last Date for payments with discount',7,'ECA03','Last Date where a deduction of the payment discount is allowed','Y','Y','Y','N','N','N','N','N','Discount Date',TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000231 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000248,3000232,0,3000202,TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100,'Date when the payment is due',7,'ECA03','Date when the payment is due without deductions or discount','Y','Y','Y','N','N','N','N','N','Due Date',TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000232 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000240,3000233,0,3000202,TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100,'Order',10,'ECA03','The Order is a control document.  The  Order is complete when the quantity ordered is the same as the quantity shipped and invoiced.  When you close an order, unshipped (backordered) quantities are cancelled.','Y','Y','Y','N','N','N','N','N','Order',TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:34 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000233 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000241,3000234,0,3000202,TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100,10,'ECA03','Y','Y','N','N','N','N','N','N','Order Pre-Payment Schedule',TO_DATE('2013-04-10 22:25:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000234 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000239,3000235,0,3000202,TO_DATE('2013-04-10 22:25:35','YYYY-MM-DD HH24:MI:SS'),100,'Organizational entity within client',10,'ECA03','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','Y','Y','Y','N','N','N','N','N','Organization',TO_DATE('2013-04-10 22:25:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000235 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000242,3000236,0,3000202,TO_DATE('2013-04-10 22:25:35','YYYY-MM-DD HH24:MI:SS'),100,'Payment Schedule Template',10,'ECA03','Information when parts of the payment are due','Y','Y','Y','N','N','N','N','N','Payment Schedule',TO_DATE('2013-04-10 22:25:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000236 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000251,3000237,0,3000202,TO_DATE('2013-04-10 22:25:35','YYYY-MM-DD HH24:MI:SS'),100,'The document has been processed',1,'ECA03','The Processed checkbox indicates that a document has been processed.','Y','Y','Y','N','N','N','N','N','Processed',TO_DATE('2013-04-10 22:25:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000237 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000252,3000238,0,3000202,TO_DATE('2013-04-10 22:25:35','YYYY-MM-DD HH24:MI:SS'),100,1,'ECA03','Y','Y','Y','N','N','N','N','N','Process Now',TO_DATE('2013-04-10 22:25:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000238 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,3000250,3000239,0,3000202,TO_DATE('2013-04-10 22:25:35','YYYY-MM-DD HH24:MI:SS'),100,'Element is valid',1,'ECA03','The element passed the validation check','Y','Y','Y','N','N','N','N','N','Valid',TO_DATE('2013-04-10 22:25:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:25:35 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000239 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000237
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3000229
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3000235
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3000233
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3000236
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3000227
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000232
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000228
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000231
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000230
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000238
;

-- Apr 10, 2013 10:27:11 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000239
;

-- Apr 10, 2013 10:27:22 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-04-10 22:27:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000235
;

-- Apr 10, 2013 10:28:16 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2013-04-10 22:28:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000229
;

-- Apr 10, 2013 10:28:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2013-04-10 22:28:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000235
;

-- Apr 10, 2013 10:28:19 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2013-04-10 22:28:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000233
;

-- Apr 10, 2013 10:28:30 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2013-04-10 22:28:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000239
;

-- Apr 10, 2013 10:28:32 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-04-10 22:28:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000228
;

-- Apr 10, 2013 10:28:35 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-04-10 22:28:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000230
;

-- Apr 10, 2013 10:28:43 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2013-04-10 22:28:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000239
;

-- Apr 10, 2013 10:29:05 PM VET
-- Order Prepay Schedule
UPDATE AD_Tab SET SeqNo=25, TabLevel=1,Updated=TO_DATE('2013-04-10 22:29:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000202
;

