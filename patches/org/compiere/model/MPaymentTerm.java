/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.compiere.model;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.erpca.model.MCUSTOrderPrePaySchedule;


/**
 *	Payment Term Model
 *	
 *  @author Jorg Janke
 *  @version $Id: MPaymentTerm.java,v 1.3 2006/07/30 00:51:03 jjanke Exp $
 *  @author Cristina Ghita, www.arhipac.ro
 * 			<li>BF [ 2889886 ] Net days in payment term
 * 				https://sourceforge.net/tracker/index.php?func=detail&aid=2889886&group_id=176962&atid=879332
 */
public class MPaymentTerm extends X_C_PaymentTerm
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2494915482340569386L;

	/**
	 * 	Standard Constructor
	 *	@param ctx context
	 *	@param C_PaymentTerm_ID id
	 *	@param trxName transaction
	 */
	public MPaymentTerm(Properties ctx, int C_PaymentTerm_ID, String trxName)
	{
		super(ctx, C_PaymentTerm_ID, trxName);
		if (C_PaymentTerm_ID == 0)
		{
			setAfterDelivery (false);
			setNetDays (0);
			setDiscount (Env.ZERO);
			setDiscount2 (Env.ZERO);
			setDiscountDays (0);
			setDiscountDays2 (0);
			setGraceDays (0);
			setIsDueFixed (false);
			setIsValid (false);
		}	}	//	MPaymentTerm

	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName transaction
	 */
	public MPaymentTerm(Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MPaymentTerm

	/** 100									*/
	private final static BigDecimal		HUNDRED = new BigDecimal(100);

	/**	Payment Schedule children			*/
	private MPaySchedule[]				m_schedule;

	/**
	 * 	Get Payment Schedule
	 * 	@param requery if true re-query
	 *	@return array of schedule
	 */
	public MPaySchedule[] getSchedule (boolean requery)
	{
		if (m_schedule != null && !requery)
			return m_schedule;
		String sql = "SELECT * FROM C_PaySchedule WHERE C_PaymentTerm_ID=? AND IsActive='Y' ORDER BY NetDays";
		ArrayList<MPaySchedule> list = new ArrayList<MPaySchedule>();
		PreparedStatement pstmt = null;
		try
		{
			pstmt = DB.prepareStatement(sql, get_TrxName());
			pstmt.setInt(1, getC_PaymentTerm_ID());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				MPaySchedule ps = new MPaySchedule(getCtx(), rs, get_TrxName());
				ps.setParent(this);
				list.add (ps);
			}
			rs.close();
			pstmt.close();
			pstmt = null;
		}
		catch (Exception e)
		{
			log.log(Level.SEVERE, "getSchedule", e); 
		}
		try
		{
			if (pstmt != null)
				pstmt.close();
			pstmt = null;
		}
		catch (Exception e)
		{
			pstmt = null;
		}
		
		m_schedule = new MPaySchedule[list.size()];
		list.toArray(m_schedule);
		return m_schedule;
	}	//	getSchedule

	/**
	 * 	Validate Payment Term & Schedule
	 *	@return Validation Message @OK@ or error
	 */
	public String validate()
	{
		getSchedule(true);
		if (m_schedule.length == 0)
		{
			if (! isValid())
				setIsValid(true);
			return "@OK@";
		}
		if (m_schedule.length == 1)
		{
			if (isValid())
				setIsValid(false);
			if (m_schedule[0].isValid())
			{
				m_schedule[0].setIsValid(false);
				m_schedule[0].save();
			}
			return "@Invalid@ @Count@ # = 1 (@C_PaySchedule_ID@)";
		}
		
		//	Add up
		BigDecimal total = Env.ZERO;
		for (int i = 0; i < m_schedule.length; i++)
		{
			BigDecimal percent = m_schedule[i].getPercentage();
			if (percent != null)
				total = total.add(percent);
		}
		boolean valid = total.compareTo(HUNDRED) == 0;
		if (isValid() != valid)
			setIsValid (valid);
		for (int i = 0; i < m_schedule.length; i++)
		{
			if (m_schedule[i].isValid() != valid)
			{
				m_schedule[i].setIsValid(valid);
				m_schedule[i].save();
			}
		}
		String msg = "@OK@";
		if (!valid)
			msg = "@Total@ = " + total + " - @Difference@ = " + HUNDRED.subtract(total); 
		return Msg.parseTranslation(getCtx(), msg);
	}	//	validate


	/*************************************************************************
	 * 	Apply Payment Term to Invoice -
	 *	@param C_Invoice_ID invoice
	 *	@return true if payment schedule is valid
	 */
	public boolean apply (int C_Invoice_ID)
	{
		MInvoice invoice = new MInvoice (getCtx(), C_Invoice_ID, get_TrxName());
		if (invoice == null || invoice.get_ID() == 0)
		{
			log.log(Level.SEVERE, "apply - Not valid C_Invoice_ID=" + C_Invoice_ID);
			return false;
		}
		return apply (invoice);
	}	//	apply
	
	/**
	 * 	Apply Payment Term to Invoice
	 *	@param invoice invoice
	 *	@return true if payment schedule is valid
	 */
	public boolean apply (MInvoice invoice)
	{
		if (invoice == null || invoice.get_ID() == 0)
		{
			log.log(Level.SEVERE, "No valid invoice - " + invoice);
			return false;
		}

		if (!isValid())
			return applyNoSchedule (invoice);
		//
		getSchedule(true);
		if (m_schedule.length <= 1)
			return applyNoSchedule (invoice);
		else	//	only if valid
			return applySchedule(invoice);		
	}	//	apply

	/**
	 * Appli Pre-Pay Schedule to Order
	 * @author <a href="mailto:yamelsenih@gmail.com">Yamel Senih</a> 15/03/2013, 19:20:46
	 * @param order
	 * @return
	 * @return boolean
	 */
	public boolean applyToOrder (MOrder order)
	{
		if (order == null || order.get_ID() == 0)
		{
			log.log(Level.SEVERE, "No valid Order - " + order);
			return false;
		}

		if (!isValid())
			return applyNoSchedule (order);
		//
		getSchedule(true);
		if (m_schedule.length <= 1)
			return applyNoSchedule (order);
		else	//	only if valid
			return applySchedule(order);		
	}	//	apply
	
	
	/**
	 * Add Support to Order
	 * @author <a href="mailto:yamelsenih@gmail.com">Yamel Senih</a> 15/03/2013, 20:03:11
	 * @param C_Order_ID
	 * @return
	 * @return boolean
	 */
	public boolean applyToOrder (int C_Order_ID)
	{
		MOrder order = new MOrder (getCtx(), C_Order_ID, get_TrxName());
		if (order == null || order.get_ID() == 0)
		{
			log.log(Level.SEVERE, "apply - Not valid C_Order_ID=" + C_Order_ID);
			return false;
		}
		return applyToOrder (order);
	}	//	apply
	
	/**
	 * Support to Order
	 * @author <a href="mailto:yamelsenih@gmail.com">Yamel Senih</a> 15/03/2013, 19:56:15
	 * @param order
	 * @return
	 * @return boolean
	 */
	private boolean applyNoSchedule (MOrder order)
	{
		deleteOrderPrePaySchedule (order.getC_Order_ID(), order.get_TrxName());
		//	updateInvoice
		if (order.getC_PaymentTerm_ID() != getC_PaymentTerm_ID())
			order.setC_PaymentTerm_ID(getC_PaymentTerm_ID());
		if (order.get_ValueAsBoolean("isPayScheduleValid"))
			order.set_Value("IsPayScheduleValid", false);
		return false;
	}	//	applyNoSchedule
	
	/**
	 * 	Delete existing Invoice Payment Schedule
	 *	@param C_Order_ID id
	 *	@param trxName transaction
	 */
	private void deleteOrderPrePaySchedule (int C_Order_ID, String trxName)
	{
		String sql = "DELETE CUST_OrderPrePaySchedule WHERE C_Order_ID=" + C_Order_ID;
		int no = DB.executeUpdate(sql, trxName);
		log.fine("C_Order_ID=" + C_Order_ID + " - #" + no);
	}	//	deleteOrderPrePaySchedule
	
	/**
	 * Add Support to Order
	 * @author <a href="mailto:yamelsenih@gmail.com">Yamel Senih</a> 15/03/2013, 19:57:01
	 * @param order
	 * @return
	 * @return boolean
	 */
	private boolean applySchedule (MOrder order)
	{
		deleteOrderPrePaySchedule (order.getC_Order_ID(), order.get_TrxName());
		//	Create Schedule
		MCUSTOrderPrePaySchedule ops = null;
		BigDecimal remainder = order.getGrandTotal();
		for (int i = 0; i < m_schedule.length; i++)
		{
			ops = new MCUSTOrderPrePaySchedule (order, m_schedule[i]);
			ops.save(order.get_TrxName());
			log.fine(ops.toString());
			remainder = remainder.subtract(ops.getDueAmt());
		}	//	for all schedules
		//	Remainder - update last
		if (remainder.compareTo(Env.ZERO) != 0 && ops != null)
		{
			ops.setDueAmt(ops.getDueAmt().add(remainder));
			ops.save(order.get_TrxName());
			log.fine("Remainder=" + remainder + " - " + ops);
		}
		
		//	updateInvoice
		if (order.getC_PaymentTerm_ID() != getC_PaymentTerm_ID())
			order.setC_PaymentTerm_ID(getC_PaymentTerm_ID());
		return ops.validatePaySchedule();
	}	//	applySchedule
	
	/**
	 * 	Apply Payment Term without schedule to Invoice
	 *	@param invoice invoice
	 *	@return false as no payment schedule
	 */
	private boolean applyNoSchedule (MInvoice invoice)
	{
		deleteInvoicePaySchedule (invoice.getC_Invoice_ID(), invoice.get_TrxName());
		//	updateInvoice
		if (invoice.getC_PaymentTerm_ID() != getC_PaymentTerm_ID())
			invoice.setC_PaymentTerm_ID(getC_PaymentTerm_ID());
		if (invoice.isPayScheduleValid())
			invoice.setIsPayScheduleValid(false);
		return false;
	}	//	applyNoSchedule

	/**
	 * 	Apply Payment Term with schedule to Invoice
	 *	@param invoice invoice
	 *	@return true if payment schedule is valid
	 */
	private boolean applySchedule (MInvoice invoice)
	{
		deleteInvoicePaySchedule (invoice.getC_Invoice_ID(), invoice.get_TrxName());
		//	Create Schedule
		MInvoicePaySchedule ips = null;
		BigDecimal remainder = invoice.getGrandTotal();
		for (int i = 0; i < m_schedule.length; i++)
		{
			ips = new MInvoicePaySchedule (invoice, m_schedule[i]);
			ips.save(invoice.get_TrxName());
			log.fine(ips.toString());
			remainder = remainder.subtract(ips.getDueAmt());
		}	//	for all schedules
		//	Remainder - update last
		if (remainder.compareTo(Env.ZERO) != 0 && ips != null)
		{
			ips.setDueAmt(ips.getDueAmt().add(remainder));
			ips.save(invoice.get_TrxName());
			log.fine("Remainder=" + remainder + " - " + ips);
		}
		
		//	updateInvoice
		if (invoice.getC_PaymentTerm_ID() != getC_PaymentTerm_ID())
			invoice.setC_PaymentTerm_ID(getC_PaymentTerm_ID());
		return invoice.validatePaySchedule();
	}	//	applySchedule

	/**
	 * 	Delete existing Invoice Payment Schedule
	 *	@param C_Invoice_ID id
	 *	@param trxName transaction
	 */
	private void deleteInvoicePaySchedule (int C_Invoice_ID, String trxName)
	{
		String sql = "DELETE C_InvoicePaySchedule WHERE C_Invoice_ID=" + C_Invoice_ID;
		int no = DB.executeUpdate(sql, trxName);
		log.fine("C_Invoice_ID=" + C_Invoice_ID + " - #" + no);
	}	//	deleteInvoicePaySchedule

	
	/**************************************************************************
	 * 	String Representation
	 *	@return info
	 */
	public String toString ()
	{
		StringBuffer sb = new StringBuffer ("MPaymentTerm[");
		sb.append(get_ID()).append("-").append(getName())
			.append(",Valid=").append(isValid())
			.append ("]");
		return sb.toString ();
	}	//	toString
	
	/**
	 * 	Before Save
	 *	@param newRecord new
	 *	@return true
	 */
	protected boolean beforeSave (boolean newRecord)
	{
		if (isDueFixed())
		{
			int dd = getFixMonthDay();
			if (dd < 1 || dd > 31)
			{
				log.saveError("Error", Msg.parseTranslation(getCtx(), "@Invalid@ @FixMonthDay@"));
				return false;
			}
			dd = getFixMonthCutoff();
			if (dd < 1 || dd > 31)
			{
				log.saveError("Error", Msg.parseTranslation(getCtx(), "@Invalid@ @FixMonthCutoff@"));
				return false;
			}
		}
		
		if (Integer.signum(getNetDays()) < 0)
		{
			throw new AdempiereException(Msg.parseTranslation(getCtx(), "@NetDays@") + " " +
										 Msg.parseTranslation(getCtx(), "@positive.number@"));
		}
		
		if (!newRecord || !isValid())
			validate();
		return true;
	}	//	beforeSave
	
}	//	MPaymentTerm
