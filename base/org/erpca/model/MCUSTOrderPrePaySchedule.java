/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
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
 * Copyright (C) 2003-2013 E.R.P. Consultores y Asociados.                    *
 * All Rights Reserved.                                                       *
 * Contributor(s): Yamel Senih www.erpconsultoresyasociados.com               *
 *****************************************************************************/
package org.erpca.model;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.MCurrency;
import org.compiere.model.MInvoicePaySchedule;
import org.compiere.model.MOrder;
import org.compiere.model.MPaySchedule;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.TimeUtil;

/**
 * @author <a href="mailto:yamelsenih@gmail.com">Yamel Senih</a>
 *
 */
public class MCUSTOrderPrePaySchedule extends X_CUST_OrderPrePaySchedule implements
		I_CUST_OrderPrePaySchedule {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8702657224895665569L;

	/**
	 * *** Constructor ***
	 * @author <a href="mailto:yamelsenih@gmail.com">Yamel Senih</a> 15/03/2013, 20:16:25
	 * @param ctx
	 * @param CUST_OrderPrePaySchedule_ID
	 * @param trxName
	 */
	public MCUSTOrderPrePaySchedule(Properties ctx, int CUST_OrderPrePaySchedule_ID,
			String trxName) {
		super(ctx, CUST_OrderPrePaySchedule_ID, trxName);
		if (CUST_OrderPrePaySchedule_ID == 0)
		{
		//	setC_Invoice_ID (0);
		//	setDiscountAmt (Env.ZERO);
		//	setDiscountDate (new Timestamp(System.currentTimeMillis()));
		//	setDueAmt (Env.ZERO);
		//	setDueDate (new Timestamp(System.currentTimeMillis()));
			setIsValid (false);
		}
		
		// TODO Auto-generated constructor stub
	}

	/**
	 * *** Constructor ***
	 * @author <a href="mailto:yamelsenih@gmail.com">Yamel Senih</a> 15/03/2013, 20:16:25
	 * @param ctx
	 * @param rs
	 * @param trxName
	 */
	public MCUSTOrderPrePaySchedule(Properties ctx, ResultSet rs, String trxName) {
		super(ctx, rs, trxName);
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * 	Get Payment Schedule of the Order
	 * 	@param ctx context
	 * 	@param C_Order_ID invoice id (direct)
	 * 	@param CUST_OrderPrePaySchedule_ID id (indirect)
	 *	@param trxName transaction
	 *	@return array of schedule
	 */
	public static MCUSTOrderPrePaySchedule[] getOrderPrePaySchedule(Properties ctx, 
		int C_Order_ID, int CUST_OrderPrePaySchedule_ID, String trxName)
	{
		String sql = "SELECT * FROM CUST_OrderPrePaySchedule ops ";
		if (C_Order_ID != 0)
			sql += "WHERE C_Order_ID=? ";
		else
			sql += "WHERE EXISTS (SELECT * FROM CUST_OrderPrePaySchedule x"
			+ " WHERE x.CUST_OrderPrePaySchedule_ID=? AND ops.C_Order_ID=x.C_Order_ID) ";
		sql += "ORDER BY DueDate";
		//
		ArrayList<MCUSTOrderPrePaySchedule> list = new ArrayList<MCUSTOrderPrePaySchedule>();
		PreparedStatement pstmt = null;
		try
		{
			pstmt = DB.prepareStatement(sql, trxName);
			if (C_Order_ID != 0)
				pstmt.setInt(1, C_Order_ID);
			else
				pstmt.setInt(1, CUST_OrderPrePaySchedule_ID);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				list.add (new MCUSTOrderPrePaySchedule(ctx, rs, trxName));
			}
			rs.close();
			pstmt.close();
			pstmt = null;
		}
		catch (Exception e)
		{
			s_log.log(Level.SEVERE, "getOrderPrePaySchedule", e); 
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
		
		MCUSTOrderPrePaySchedule[] retValue = new MCUSTOrderPrePaySchedule[list.size()];
		list.toArray(retValue);
		return retValue;
	}	//	getSchedule

	/** Static Logger					*/
	private static CLogger		s_log = CLogger.getCLogger (MInvoicePaySchedule.class);

	/** 100								*/
	private final static BigDecimal		HUNDRED = new BigDecimal(100);

	/**
	 * 	Parent Constructor
	 *	@param order invoice
	 *	@param paySchedule payment schedule
	 */
	public MCUSTOrderPrePaySchedule (MOrder order, MPaySchedule paySchedule)
	{
		super (order.getCtx(), 0, order.get_TrxName());
		m_parent = order;
		setClientOrg(order);
		setC_Order_ID(order.getC_Order_ID());
		setC_PaySchedule_ID(paySchedule.getC_PaySchedule_ID());
		
		//	Amounts
		int scale = MCurrency.getStdPrecision(getCtx(), order.getC_Currency_ID());
		BigDecimal due = order.getGrandTotal();
		if (due.compareTo(Env.ZERO) == 0)
		{
			setDueAmt (Env.ZERO);
			setDiscountAmt (Env.ZERO);
			setIsValid(false);
		}
		else
		{
			due = due.multiply(paySchedule.getPercentage())
				.divide(HUNDRED, scale, BigDecimal.ROUND_HALF_UP);
			setDueAmt (due);
			BigDecimal discount = due.multiply(paySchedule.getDiscount())
				.divide(HUNDRED, scale, BigDecimal.ROUND_HALF_UP);
			setDiscountAmt (discount);
			setIsValid(true);
		}
		
		//	Dates		
		Timestamp dueDate = TimeUtil.addDays(order.getDateOrdered(), paySchedule.getNetDays());
		setDueDate (dueDate);
		Timestamp discountDate = TimeUtil.addDays(order.getDateOrdered(), paySchedule.getDiscountDays());
		setDiscountDate (discountDate);
	}	//	MInvoicePaySchedule
	
	/**	Parent						*/
	private MOrder	m_parent = null;

	
	/**
	 * @return Returns the parent.
	 */
	public MOrder getParent ()
	{
		if (m_parent == null)
			m_parent = new MOrder (getCtx(), getC_Order_ID(), get_TrxName()); 
		return m_parent;
	}	//	getParent
	
	/**
	 * @param parent The parent to set.
	 */
	public void setParent (MOrder parent)
	{
		m_parent = parent;
	}	//	setParent
	
	/**
	 * 	String Representation
	 *	@return info
	 */
	public String toString()
	{
		StringBuffer sb = new StringBuffer("MCUSTOrderPrePaySchedule[");
		sb.append(get_ID()).append("-Due=" + getDueDate() + "/" + getDueAmt())
			.append(";Discount=").append(getDiscountDate() + "/" + getDiscountAmt())
			.append("]");
		return sb.toString();
	}	//	toString
	
	
	
	/**
	 * 	Before Save
	 *	@param newRecord new
	 *	@return true
	 */
	protected boolean beforeSave (boolean newRecord)
	{
		if (is_ValueChanged("DueAmt"))
		{
			log.fine("beforeSave");
			setIsValid(false);
		}
		return true;
	}	//	beforeSave

	/**
	 * 	After Save
	 *	@param newRecord new
	 *	@param success success
	 *	@return success
	 */
	protected boolean afterSave (boolean newRecord, boolean success)
	{
		if (is_ValueChanged("DueAmt"))
		{
			log.fine("afterSave");
			getParent();
			validatePaySchedule();
			m_parent.save();
		}
		return success;
	}	//	afterSave
	
	/**
	 * 	Validate Invoice Pay Schedule
	 *	@return pay schedule is valid
	 */
	public boolean validatePaySchedule()
	{
		MCUSTOrderPrePaySchedule[] schedule = MCUSTOrderPrePaySchedule.getOrderPrePaySchedule
			(getCtx(), m_parent.getC_Order_ID(), 0, get_TrxName());
		log.fine("#" + schedule.length);
		if (schedule.length == 0)
		{
			m_parent.set_ValueOfColumn("IsPayScheduleValid", false);
			return false;
		}
		//	Add up due amounts
		BigDecimal total = Env.ZERO;
		for (int i = 0; i < schedule.length; i++)
		{
			schedule[i].setParent(m_parent);
			BigDecimal due = schedule[i].getDueAmt();
			if (due != null)
				total = total.add(due);
		}
		boolean valid = m_parent.getGrandTotal().compareTo(total) == 0;
		m_parent.set_ValueOfColumn("IsPayScheduleValid", valid);

		//	Update Schedule Lines
		for (int i = 0; i < schedule.length; i++)
		{
			if (schedule[i].isValid() != valid)
			{
				schedule[i].setIsValid(valid);
				schedule[i].saveEx(get_TrxName());
			}
		}
		return valid;
	}	//	validatePaySchedule


}
