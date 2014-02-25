-- Apr 10, 2013 10:38:14 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,3000255,2281,0,20,259,'IsPayScheduleValid',TO_DATE('2013-04-10 22:38:14','YYYY-MM-DD HH24:MI:SS'),100,'Is the Payment Schedule is valid','ECA03',1,'Payment Schedules allow to have multiple due dates.','Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Pay Schedule valid',0,TO_DATE('2013-04-10 22:38:14','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Apr 10, 2013 10:38:14 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000255 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Apr 10, 2013 10:38:27 PM VET
-- Order Prepay Schedule
ALTER TABLE C_Order ADD COLUMN IsPayScheduleValid CHAR(1) DEFAULT NULL CHECK (IsPayScheduleValid IN ('Y','N'))
;

-- Apr 10, 2013 10:39:45 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,HideInListView,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,PreferredWidth,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,3000255,3000240,0,294,TO_DATE('2013-04-10 22:39:45','YYYY-MM-DD HH24:MI:SS'),100,'Is the Payment Schedule is valid',0,'ECA03','Payment Schedules allow to have multiple due dates.','N','Y','Y','Y','N','N','N','Y','N','Pay Schedule valid',0,680,0,TO_DATE('2013-04-10 22:39:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Apr 10, 2013 10:39:45 PM VET
-- Order Prepay Schedule
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000240 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Apr 10, 2013 10:40:16 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3437
;

-- Apr 10, 2013 10:40:16 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3423
;

-- Apr 10, 2013 10:40:16 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3430
;

-- Apr 10, 2013 10:40:16 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=4240
;

-- Apr 10, 2013 10:40:16 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3431
;

-- Apr 10, 2013 10:40:16 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3462
;

-- Apr 10, 2013 10:40:16 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3432
;

-- Apr 10, 2013 10:40:16 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3463
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3442
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3433
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=4241
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=9298
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=9297
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3672
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3434
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3445
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3460
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3421
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=9299
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3465
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3705
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=6508
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=6221
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3418
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=3422
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=3453
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=3424
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3455
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3429
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3428
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3435
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3436
;

-- Apr 10, 2013 10:40:17 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3419
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=6505
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3458
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=6507
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3452
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=6504
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3451
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=10123
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=55413
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=55414
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=55415
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3444
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3447
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3464
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3443
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3448
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3420
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3441
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=8652
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3438
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3467
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3456
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3454
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3466
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3439
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3459
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3457
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3446
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=7039
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=7824
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=7823
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3425
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3427
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000240
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3449
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3450
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=6506
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3426
;

-- Apr 10, 2013 10:40:18 PM VET
-- Order Prepay Schedule
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3671
;

