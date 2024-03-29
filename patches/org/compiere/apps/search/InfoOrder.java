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
package org.compiere.apps.search;

import java.awt.Frame;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.swing.JPanel;

import net.miginfocom.swing.MigLayout;

import org.adempiere.plaf.AdempierePLAF;
import org.compiere.grid.ed.VCheckBox;
import org.compiere.grid.ed.VDate;
import org.compiere.grid.ed.VLookup;
import org.compiere.grid.ed.VNumber;
import org.compiere.minigrid.IDColumn;
import org.compiere.model.MLookupFactory;
import org.compiere.model.MQuery;
import org.compiere.swing.CLabel;
import org.compiere.swing.CTextField;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;
import org.compiere.util.Msg;
import org.compiere.util.Util;

/**
 *  Info Order
 *
 *  @author Jorg Janke
 *  @version  $Id: InfoOrder.java,v 1.2 2006/07/30 00:51:27 jjanke Exp $
 */
public class InfoOrder extends Info
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2246871771555208114L;

	/**
	 *  Detail Protected Contructor
	 *  @param frame parent frame
	 *  @param modal modal
	 *  @param WindowNo window no
	 *  @param value query value
	 *  @param multiSelection multiple selections
	 *  @param whereClause where clause
	 */
	protected InfoOrder(Frame frame, boolean modal, int WindowNo, String value,
		boolean multiSelection, String whereClause)
	{
		super (frame, modal, WindowNo, "o", "C_Order_ID", multiSelection, whereClause);
		log.info( "InfoOrder");
		setTitle(Msg.getMsg(Env.getCtx(), "InfoOrder"));
		//
		try
		{
			statInit();
			p_loadedOK = initInfo ();
		}
		catch (Exception e)
		{
			return;
		}
		//
		int no = p_table.getRowCount();
		setStatusLine(Integer.toString(no) + " " + Msg.getMsg(Env.getCtx(), "SearchRows_EnterQuery"), false);
		setStatusDB(Integer.toString(no));
		if (value != null && value.length() > 0)
		{
			fDocumentNo.setValue(value);
			executeQuery();
		}
		//
		pack();
		//	Focus
		fDocumentNo.requestFocus();
	}   //  InfoOrder

	/**  String Array of Column Info    */
	@SuppressWarnings("unused")
	private Info_Column[] m_generalLayout;
	/** list of query columns           */
	@SuppressWarnings({ "rawtypes", "unused" })
	private ArrayList 	m_queryColumns = new ArrayList();
	/** Table Name              */
	@SuppressWarnings("unused")
	private String      m_tableName;
	/** Key Column Name         */
	@SuppressWarnings("unused")
	private String      m_keyColumn;

	//  Static Info
	private CLabel lDocumentNo = new CLabel(Msg.translate(Env.getCtx(), "DocumentNo"));
	private CTextField fDocumentNo = new CTextField(10);
	private CLabel lDescription = new CLabel(Msg.translate(Env.getCtx(), "Description"));
	private CTextField fDescription = new CTextField(10);
	private CLabel lPOReference = new CLabel(Msg.translate(Env.getCtx(), "POReference"));
	private CTextField fPOReference = new CTextField(10);
	//
//	private CLabel lOrg_ID = new CLabel(Msg.translate(Env.getCtx(), "AD_Org_ID"));
//	private VLookup fOrg_ID;
	private CLabel lBPartner_ID = new CLabel(Msg.translate(Env.getCtx(), "BPartner"));
	private VLookup fBPartner_ID;
	//
	private CLabel lDateFrom = new CLabel(Msg.translate(Env.getCtx(), "DateOrdered"));
	private VDate fDateFrom = new VDate("DateFrom", false, false, true, DisplayType.Date, Msg.translate(Env.getCtx(), "DateFrom"));
	private CLabel lDateTo = new CLabel("-");
	private VDate fDateTo = new VDate("DateTo", false, false, true, DisplayType.Date, Msg.translate(Env.getCtx(), "DateTo"));
	private CLabel lAmtFrom = new CLabel(Msg.translate(Env.getCtx(), "GrandTotal"));
	private VNumber fAmtFrom = new VNumber("AmtFrom", false, false, true, DisplayType.Amount, Msg.translate(Env.getCtx(), "AmtFrom"));
	private CLabel lAmtTo = new CLabel("-");
	private VNumber fAmtTo = new VNumber("AmtTo", false, false, true, DisplayType.Amount, Msg.translate(Env.getCtx(), "AmtTo"));
	private VCheckBox fIsSOTrx = new VCheckBox ("IsSOTrx", false, false, true, Msg.translate(Env.getCtx(), "IsSOTrx"), "", false);
	private VCheckBox fIsDelivered = new VCheckBox("IsDelivered", false, false, true, Msg.translate(Env.getCtx(), "IsDelivered"), "", false);

	//	Yamel Senih 2013-03-25 18:38
	//	Add OpenAmt and CUST_OrderPrePaySchedule_ID
	
	/**  Array of Column Info    */
	private static final Info_Column[] s_invoiceLayout = {
		new Info_Column(" ", "o.C_Order_ID", IDColumn.class),
		new Info_Column(Msg.translate(Env.getCtx(), "C_BPartner_ID"), "(SELECT Name FROM C_BPartner bp WHERE bp.C_BPartner_ID=o.C_BPartner_ID)", String.class),
		new Info_Column(Msg.translate(Env.getCtx(), "DateOrdered"), "o.DateOrdered", Timestamp.class),
		new Info_Column(Msg.translate(Env.getCtx(), "DocumentNo"), "o.DocumentNo", String.class),
		new Info_Column(Msg.translate(Env.getCtx(), "C_Currency_ID"), "(SELECT ISO_Code FROM C_Currency c WHERE c.C_Currency_ID=o.C_Currency_ID)", String.class),
		new Info_Column(Msg.translate(Env.getCtx(), "GrandTotal"), "o.GrandTotal",  BigDecimal.class),
		new Info_Column(Msg.translate(Env.getCtx(), "ConvertedAmount"), "currencyBase(o.GrandTotal,o.C_Currency_ID,o.DateAcct, o.AD_Client_ID,o.AD_Org_ID)", BigDecimal.class),
		new Info_Column(Msg.translate(Env.getCtx(), "OpenAmt"), "orderOpen(o.C_Order_ID, o.CUST_OrderPrePaySchedule_ID)",  BigDecimal.class),
		new Info_Column(Msg.translate(Env.getCtx(), "DueDate"), "o.DueDate",  Timestamp.class),
		new Info_Column(Msg.translate(Env.getCtx(), "IsSOTrx"), "o.IsSOTrx", Boolean.class),
		new Info_Column(Msg.translate(Env.getCtx(), "Description"), "o.Description", String.class),
		new Info_Column(Msg.translate(Env.getCtx(), "POReference"), "o.POReference", String.class),
		new Info_Column(Msg.translate(Env.getCtx(), "IsDelivered"), "o.IsDelivered", Boolean.class),
		new Info_Column("", "''", KeyNamePair.class, "o.CUST_OrderPrePaySchedule_ID")
	};
	private static int INDEX_PAYSCHEDULE = s_invoiceLayout.length - 1;	//	last item

	//	End Yamel Senih
	
	/**
	 *	Static Setup - add fields to parameterPanel
	 *  @throws Exception if Lookups cannot be initialized
	 */
	private void statInit() throws Exception
	{
		lDocumentNo.setLabelFor(fDocumentNo);
		fDocumentNo.setBackground(AdempierePLAF.getInfoBackground());
		fDocumentNo.addActionListener(this);
		lDescription.setLabelFor(fDescription);
		fDescription.setBackground(AdempierePLAF.getInfoBackground());
		fDescription.addActionListener(this);
		lPOReference.setLabelFor(fPOReference);
		fPOReference.setBackground(AdempierePLAF.getInfoBackground());
		fPOReference.addActionListener(this);
		fIsSOTrx.setSelected(!"N".equals(Env.getContext(Env.getCtx(), p_WindowNo, "IsSOTrx")));
		fIsSOTrx.addActionListener(this);
		fIsDelivered.setSelected(false);
		fIsDelivered.addActionListener(this);
		//
	//	fOrg_ID = new VLookup("AD_Org_ID", false, false, true,
	//		MLookupFactory.create(Env.getCtx(), 3486, m_WindowNo, DisplayType.TableDir, false),
	//		DisplayType.TableDir, m_WindowNo);
	//	lOrg_ID.setLabelFor(fOrg_ID);
	//	fOrg_ID.setBackground(AdempierePLAF.getInfoBackground());
		fBPartner_ID = new VLookup("C_BPartner_ID", false, false, true,
			MLookupFactory.get (Env.getCtx(), p_WindowNo, 0, 3499, DisplayType.Search));
		lBPartner_ID.setLabelFor(fBPartner_ID);
		fBPartner_ID.setBackground(AdempierePLAF.getInfoBackground());
		//
		lDateFrom.setLabelFor(fDateFrom);
		fDateFrom.setBackground(AdempierePLAF.getInfoBackground());
		fDateFrom.setToolTipText(Msg.translate(Env.getCtx(), "DateFrom"));
		lDateTo.setLabelFor(fDateTo);
		fDateTo.setBackground(AdempierePLAF.getInfoBackground());
		fDateTo.setToolTipText(Msg.translate(Env.getCtx(), "DateTo"));
		lAmtFrom.setLabelFor(fAmtFrom);
		fAmtFrom.setBackground(AdempierePLAF.getInfoBackground());
		fAmtFrom.setToolTipText(Msg.translate(Env.getCtx(), "AmtFrom"));
		lAmtTo.setLabelFor(fAmtTo);
		fAmtTo.setBackground(AdempierePLAF.getInfoBackground());
		fAmtTo.setToolTipText(Msg.translate(Env.getCtx(), "AmtTo"));
		//
		parameterPanel.setLayout(new MigLayout("", "[100][140][120][250][100]"));
		//  First Row
		parameterPanel.add(lDocumentNo, "align right");
		parameterPanel.add(fDocumentNo, "growx");
		parameterPanel.add(lBPartner_ID, "align right");
		parameterPanel.add(fBPartner_ID, "growx");
		parameterPanel.add(fIsSOTrx, "gapleft 15,wrap");

		//  2nd Row
		parameterPanel.add(lDescription, "align right");
		parameterPanel.add(fDescription, "growx");
		parameterPanel.add(lDateFrom, "align right");
		
		JPanel datePanel = new JPanel();
		datePanel.setLayout(new MigLayout("insets 0","[120][min!][120]"));
		datePanel.add(fDateFrom, "growx");
		datePanel.add(lDateTo);
		datePanel.add(fDateTo, "growx");
		parameterPanel.add(datePanel);
		parameterPanel.add(fIsDelivered, "gapleft 15,wrap");

		//  3rd Row
		parameterPanel.add(lPOReference, "align right");
		parameterPanel.add(fPOReference, "growx");
		parameterPanel.add(lAmtFrom, "align right");
		
		JPanel amountPanel = new JPanel();
		amountPanel.setLayout(new MigLayout("insets 0","[120][min!][120]"));
		amountPanel.add(fAmtFrom, "growx");
		amountPanel.add(lAmtTo);
		amountPanel.add(fAmtTo, "growx");
		parameterPanel.add(amountPanel);
	}	//	statInit

	/**
	 *	General Init
	 *	@return true, if success
	 */
	private boolean initInfo ()
	{
		//  Set Defaults
		String bp = Env.getContext(Env.getCtx(), p_WindowNo, "C_BPartner_ID");
		if (bp != null && bp.length() != 0)
			fBPartner_ID.setValue(new Integer(bp));

		//  prepare table
		StringBuffer where = new StringBuffer("o.IsActive='Y'");
		if (p_whereClause.length() > 0)
			where.append(" AND ").append(Util.replace(p_whereClause, "C_Order.", "o."));
		prepareTable(s_invoiceLayout,
			" CUST_Order_v o",
			where.toString(),
			"2,3,4");

		return true;
	}	//	initInfo

	
	/**************************************************************************
	 *	Construct SQL Where Clause and define parameters.
	 *  (setParameters needs to set parameters)
	 *  Includes first AND
	 *  @return sql
	 */
	protected String getSQLWhere()
	{
		StringBuffer sql = new StringBuffer();
		if (fDocumentNo.getText().length() > 0)
			sql.append(" AND UPPER(o.DocumentNo) LIKE ?");
		if (fDescription.getText().length() > 0)
			sql.append(" AND UPPER(o.Description) LIKE ?");
		if (fPOReference.getText().length() > 0)
			sql.append(" AND UPPER(o.POReference) LIKE ?");
		//
		if (fBPartner_ID.getValue() != null)
			sql.append(" AND o.C_BPartner_ID=?");
		//
		if (fDateFrom.getValue() != null || fDateTo.getValue() != null)
		{
			Timestamp from = (Timestamp)fDateFrom.getValue();
			Timestamp to = (Timestamp)fDateTo.getValue();
			if (from == null && to != null)
				sql.append(" AND TRUNC(o.DateOrdered, 'DD') <= ?");
			else if (from != null && to == null)
				sql.append(" AND TRUNC(o.DateOrdered, 'DD') >= ?");
			else if (from != null && to != null)
				sql.append(" AND TRUNC(o.DateOrdered, 'DD') BETWEEN ? AND ?");
		}
		//
		if (fAmtFrom.getValue() != null || fAmtTo.getValue() != null)
		{
			BigDecimal from = (BigDecimal)fAmtFrom.getValue();
			BigDecimal to = (BigDecimal)fAmtTo.getValue();
			if (from == null && to != null)
				sql.append(" AND o.GrandTotal <= ?");
			else if (from != null && to == null)
				sql.append(" AND o.GrandTotal >= ?");
			else if (from != null && to != null)
				sql.append(" AND o.GrandTotal BETWEEN ? AND ?");
		}
		sql.append(" AND o.IsSOTrx=?");
		sql.append(" AND o.IsDelivered=?");

		log.finer(sql.toString());
		return sql.toString();
	}	//	getSQLWhere

	/**
	 *  Set Parameters for Query.
	 *  (as defined in getSQLWhere)
	 *  @param pstmt statement
	 *  @param forCount for counting records
	 *  @throws SQLException
	 */
	protected void setParameters(PreparedStatement pstmt, boolean forCount) throws SQLException
	{
		int index = 1;
		if (fDocumentNo.getText().length() > 0)
			pstmt.setString(index++, getSQLText(fDocumentNo));
		if (fDescription.getText().length() > 0)
			pstmt.setString(index++, getSQLText(fDescription));
		if (fPOReference.getText().length() > 0)
			pstmt.setString(index++, getSQLText(fPOReference));
		//
		if (fBPartner_ID.getValue() != null)
		{
			Integer bp = (Integer)fBPartner_ID.getValue();
			pstmt.setInt(index++, bp.intValue());
			log.fine("BPartner=" + bp);
		}
		//
		if (fDateFrom.getValue() != null || fDateTo.getValue() != null)
		{
			Timestamp from = (Timestamp)fDateFrom.getValue();
			Timestamp to = (Timestamp)fDateTo.getValue();
			log.fine("Date From=" + from + ", To=" + to);
			if (from == null && to != null)
				pstmt.setTimestamp(index++, to);
			else if (from != null && to == null)
				pstmt.setTimestamp(index++, from);
			else if (from != null && to != null)
			{
				pstmt.setTimestamp(index++, from);
				pstmt.setTimestamp(index++, to);
			}
		}
		//
		if (fAmtFrom.getValue() != null || fAmtTo.getValue() != null)
		{
			BigDecimal from = (BigDecimal)fAmtFrom.getValue();
			BigDecimal to = (BigDecimal)fAmtTo.getValue();
			log.fine("Amt From=" + from + ", To=" + to);
			if (from == null && to != null)
				pstmt.setBigDecimal(index++, to);
			else if (from != null && to == null)
				pstmt.setBigDecimal(index++, from);
			else if (from != null && to != null)
			{
				pstmt.setBigDecimal(index++, from);
				pstmt.setBigDecimal(index++, to);
			}
		}
		pstmt.setString(index++, fIsSOTrx.isSelected() ? "Y" : "N");
		pstmt.setString(index++, fIsDelivered.isSelected() ? "Y" : "N");
	}   //  setParameters

	/**
	 *  Get SQL WHERE parameter
	 *  @param f field
	 *  @return sql
	 */
	private String getSQLText (CTextField f)
	{
		String s = f.getText().toUpperCase();
		if (!s.endsWith("%"))
			s += "%";
		log.fine("String=" + s);
		return s;
	}   //  getSQLText
	

	/**
	 *	Zoom
	 */
	protected void zoom()
	{
		log.info("");
		Integer C_Order_ID = getSelectedRowKey();
		if (C_Order_ID == null)
			return;
		MQuery query = new MQuery("C_Order");
		query.addRestriction("C_Order_ID", MQuery.EQUAL, C_Order_ID);
		query.setRecordCount(1);
		int AD_WindowNo = getAD_Window_ID("C_Order", fIsSOTrx.isSelected());
		zoom (AD_WindowNo, query);
	}	//	zoom

	/**
	 *	Has Zoom
	 *  @return true
	 */
	protected boolean hasZoom()
	{
		return true;
	}	//	hasZoom
	
	/**
	 *	Save Selection Settings
	 */
	protected void saveSelectionDetail()
	{
		//  publish for Callout to read
		Integer ID = getSelectedRowKey();
		Env.setContext(Env.getCtx(), p_WindowNo, Env.TAB_INFO, "C_Order_ID", ID == null ? "0" : ID.toString());
		//
		int CUST_OrderPrePaySchedule_ID = 0;
		int row = p_table.getSelectedRow();
		if (row >= 0)
		{
			Object value = p_table.getValueAt(row, INDEX_PAYSCHEDULE);
			if (value != null && value instanceof KeyNamePair)
				CUST_OrderPrePaySchedule_ID = ((KeyNamePair)value).getKey();
		}
		if (CUST_OrderPrePaySchedule_ID <= 0)	//	not selected
			Env.setContext(Env.getCtx(), p_WindowNo, Env.TAB_INFO, "CUST_OrderPrePaySchedule_ID", "0");
		else
			Env.setContext(Env.getCtx(), p_WindowNo, Env.TAB_INFO, "CUST_OrderPrePaySchedule_ID", String.valueOf(CUST_OrderPrePaySchedule_ID));
	}	//	saveSelectionDetail
	
	
}   //  InfoOrder
