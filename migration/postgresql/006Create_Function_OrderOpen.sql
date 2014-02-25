-- Function: orderOpen(numeric, numeric)

-- DROP FUNCTION orderOpen(numeric, numeric);

CREATE OR REPLACE FUNCTION orderOpen(p_C_Order_ID numeric, p_CUST_OrderPrePaySchedule_ID numeric)
  RETURNS numeric AS
$BODY$
/*************************************************************************
 * The contents of this file are subject to the Compiere License.  You may
 * obtain a copy of the License at    http://www.compiere.org/license.html
 * Software is on an  "AS IS" basis,  WITHOUT WARRANTY OF ANY KIND, either
 * express or implied. See the License for details. Code: Compiere ERP+CRM
 * Copyright (C) 1999-2001 Jorg Janke, ComPiere, Inc. All Rights Reserved.
 *
 * converted to postgreSQL by Karsten Thiemann (Schaeffer AG), 
 * kthiemann@adempiere.org
 * add to Order by Yamel Senih
 * yamelsenih@gmail.com
 *************************************************************************
 ***
 * Title:	Calculate Open Item Amount in Invoice Currency
 * Description:
 *	Add up total amount open for C_Order_ID if no split payment.
 *  Grand Total minus Sum of Allocations in Invoice Currency
 *
 *  For Split Payments:
 *  Allocate Payments starting from first schedule.
 *  Cannot be used for IsPaid as mutating
 *
 * Test:
 * 	SELECT CUST_OrderPrePaySchedule, DueAmt FROM C_OrderPaySchedule WHERE C_Order_ID=109 ORDER BY DueDate;
 * 	SELECT orderOpen (109, null) FROM AD_System; - converted to default client currency
 * 	SELECT orderOpen (109, 11) FROM AD_System; - converted to default client currency
 * 	SELECT orderOpen (109, 102) FROM AD_System;
 * 	SELECT orderOpen (109, 103) FROM AD_System;
 ************************************************************************/
DECLARE
	v_Currency_ID		NUMERIC(10);
	v_TotalOpenAmt  	NUMERIC := 0;
	v_PaidAmt  	        NUMERIC := 0;
	v_Remaining	        NUMERIC := 0;
    	v_Temp              	NUMERIC := 0;
    	v_Precision            	NUMERIC := 0;
    	v_Min            	NUMERIC := 0;
    	ar			RECORD;
    	s			RECORD;

BEGIN
	--	Get Currency
	BEGIN
		SELECT	MAX(C_Currency_ID), SUM(GrandTotal)
		INTO	v_Currency_ID, v_TotalOpenAmt
		FROM	CUST_Order_v		--	corrected for CM / Split Payment
		WHERE	C_Order_ID = p_C_Order_ID;
	EXCEPTION	--	Order in draft form
		WHEN OTHERS THEN
            	RAISE NOTICE 'orderOpen - %', SQLERRM;
			RETURN NULL;
	END;

	SELECT StdPrecision
	    INTO v_Precision
	    FROM C_Currency
	    WHERE C_Currency_ID = v_Currency_ID;

	SELECT 1/10^v_Precision INTO v_Min;

	--	Calculate Payment Amount
	FOR ar IN 
		SELECT	pa.AD_Client_ID, pa.AD_Org_ID,
		pa.PayAmt, pa.DiscountAmt, pa.WriteOffAmt,
		pa.C_Currency_ID, pa.DateTrx
		FROM	C_Payment pa
		WHERE	pa.C_Order_ID = p_C_Order_ID
          	AND   pa.DocStatus IN('CO', 'CL')
	LOOP
        v_Temp := ar.PayAmt + ar.DisCountAmt + ar.WriteOffAmt;
		v_PaidAmt := v_PaidAmt
        -- Allocation
			+ currencyConvert(v_Temp,
				ar.C_Currency_ID, v_Currency_ID, ar.DateTrx, null, ar.AD_Client_ID, ar.AD_Org_ID);
      	RAISE NOTICE '   PaidAmt=% , Paymen= %', v_PaidAmt, v_Temp;
	END LOOP;

    --  Do we have a Payment Schedule ?
    IF (p_CUST_OrderPrePaySchedule_ID > 0) THEN --   if not valid = lists invoice amount
        v_Remaining := v_PaidAmt;
        FOR s IN 
        	SELECT  CUST_OrderPrePaySchedule_ID, DueAmt
	        FROM    CUST_OrderPrePaySchedule
		WHERE	C_Order_ID = p_C_Order_ID
	        AND   IsValid='Y'
        	ORDER BY DueDate
        LOOP
            IF (s.CUST_OrderPrePaySchedule_ID = p_CUST_OrderPrePaySchedule_ID) THEN
                v_TotalOpenAmt := s.DueAmt - v_Remaining;
                IF (s.DueAmt - v_Remaining < 0) THEN
                    v_TotalOpenAmt := 0;
                END IF;
            ELSE -- calculate amount, which can be allocated to next schedule
                v_Remaining := v_Remaining - s.DueAmt;
                IF (v_Remaining < 0) THEN
                    v_Remaining := 0;
                END IF;
            END IF;
        END LOOP;
    ELSE
        v_TotalOpenAmt := v_TotalOpenAmt - v_PaidAmt;
    END IF;
--  RAISE NOTICE ''== Total='' || v_TotalOpenAmt;

	--	Ignore Rounding
	IF (v_TotalOpenAmt > -v_Min AND v_TotalOpenAmt < v_Min) THEN
		v_TotalOpenAmt := 0;
	END IF;

	--	Round to currency precision
	v_TotalOpenAmt := ROUND(COALESCE(v_TotalOpenAmt,0), v_Precision);
	RETURN	v_TotalOpenAmt;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;