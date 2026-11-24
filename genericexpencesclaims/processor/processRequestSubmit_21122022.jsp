<%--
 -- @(#)processRequestSubmit.jsp	15/05/2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Viraj Patil
 -- @version 	1.00, 15/05/2008
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/sapCompCode.jsp" %>
<%@ include file="../../../../../common/sapConnectionDetails.jsp" %>
<%@ include file="../common/config.jsp" %>
<%@ page import="java.util.Hashtable,java.util.Arrays, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar,java.util.StringTokenizer" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>

<jsp:useBean id="genericClaimController" class="com.bccl.claim.web.controllerbeans.GenericClaimController" /> 
<%
	String portalId = (String) profile.get("portalId");
	////out.println(portalId);
	
	Hashtable SAPConnectionDetails = new Hashtable();
	Hashtable SAPColumnHeads = new Hashtable();
	Hashtable SAPValues = new Hashtable();

	SAPConnectionDetails.put("CLIENT","700");
	SAPConnectionDetails.put("USERID","tsrfc");
	//SAPConnectionDetails.put("PASSWORD","welcome");
	//SAPConnectionDetails.put("USERID","sandeshb2005"); // for HANA user name	
	SAPConnectionDetails.put("PASSWORD","Welcome@123"); // for HANA password
	SAPConnectionDetails.put("LANGUAGE","EN");
	//SAPConnectionDetails.put("HOSTNAME","10.100.229.39"); // fOR ppr old
	//SAPConnectionDetails.put("HOSTNAME","10.200.65.51"); // fOR ppr new
	//SAPConnectionDetails.put("HOSTNAME","10.200.66.76"); // for QR3 new
	//SAPConnectionDetails.put("HOSTNAME","10.100.223.250"); // for PROD old
	//SAPConnectionDetails.put("HOSTNAME","10.200.67.52"); // for PROD new
	SAPConnectionDetails.put("HOSTNAME",hostname); // for PROD new
	//SAPConnectionDetails.put("SYSTEMNO","00");
	SAPConnectionDetails.put("SYSTEMNO",systemno);
	SAPConnectionDetails.put("RFCNAME","ZPY_REIMBURSEMENT_ENTRIES");
	SAPConnectionDetails.put("TOTALTABLESTOUPDATE","1");
	SAPConnectionDetails.put("TABLENAME1","PERKS_ENTRIES");
	
	String lineItem[] = {"MANDT", "MTHLY_COMPCODE", "MTHLY_SRNO", "MTHLY_EMPLNO", "MTHLY_TRANSCODE", "MTHLY_PAYMONTH", "MTHLY_EFFECTIVE", "ZEXM", "ZTAX", "MTHLY_SAP_PAYROL", "MTHLY_SAP_FISCAL", "MTHLY_ENTLCODE", "MTHLY_CLAIMD_AM", "MTHLY_ACCEPT_AM", "MTHLY_AMOUNT_PAY", "MTHLY_NOTCONSID", "WAERS", "MTHLY_RECORDTRAN", "MTHLY_SOURCELOC", "MTHLY_DOCTMPNUMB","VERIFIED_BY"};
	
	SAPColumnHeads.put("LINEITEM1",lineItem);
%>
<%
	GregorianCalendar today = new GregorianCalendar();

	String noOfRows			= request.getParameter("noOfBills");
	int rows				= Integer.parseInt(noOfRows);
	ArrayList lineItemList =  new ArrayList( );
	
	String[] billNo			= new String[rows+1];
	String[] allBillNo		= new String[rows+1];
	String[] billAmount		= new String[rows+1];
	String[] billRemark		= new String[rows+1];

	String actualAmount		= request.getParameter("actualAmount");
	String claimAmount		= request.getParameter("claimAmount");
	String txnId			= request.getParameter("txnId");

	String entitlementCode			= request.getParameter("entitlementCode");
	
//out.println("entitlementCode---@@"+txnId);
	boolean status = false;
	////out.println(claimAmount);
	////out.println(actualAmount);

	ArrayList processData	= new ArrayList( );
	Hashtable legacyHash	= new Hashtable( );

	for(int ii=1;ii<=rows;ii++)
	{
		billNo[ii]      = request.getParameter("billCheck"+ii);
        if(billNo[ii]!=null){
            billNo[ii]      = Utility.replaceQuoteOracle(billNo[ii]);
        }
		allBillNo[ii] = request.getParameter("billNo"+ii);
		billAmount[ii] = request.getParameter("billAmount"+ii);
		billRemark[ii] = request.getParameter("remark"+ii);
		billRemark[ii] = Utility.replaceQuoteOracle(billRemark[ii]);
	}

	processData.add(0,txnId);
	processData.add(1,actualAmount);
	processData.add(2,billNo);
	processData.add(3,allBillNo);
	processData.add(4,billAmount);
	processData.add(5,billRemark);
	processData.add(6,emailId);
	processData.add(7,"R");
	processData.add(8,entitlementCode);

	////out.println(processData);

	ArrayList batch = new ArrayList( );
	ArrayList updateMedical = new ArrayList( );

	updateMedical = genericClaimController.process(processData);
	batch.addAll(updateMedical);


	// Data for SAP table entry
	String todayDay		= Integer.toString(today.get(Calendar.DAY_OF_MONTH));
	String todayMonth	= Integer.toString(today.get(Calendar.MONTH)+1);
	String todayYear	= Integer.toString(today.get(Calendar.YEAR));

	if(todayDay.length()==1){
		todayDay = "0"+todayDay;
	}

	if(todayMonth.length()==1){
		todayMonth = "0"+todayMonth;
	}

	String appliedDate	= request.getParameter("effectiveMonth");
	String userSapNo	= request.getParameter("userSapNo");

	StringTokenizer st = new StringTokenizer(appliedDate, "-"); 
	String[] token = new String[st.countTokens()];
	int p=0;
	while(st.hasMoreElements())
	{
		token[p]=(String)st.nextElement();
		p++;					
	}

	String YYYY = token[2];
	String MM = token[1];
	String DD = token[0];						
	String applDtSapFormat = YYYY+MM+DD;
	String processDtSapFormat = todayYear+todayMonth+todayDay;

	////out.println(applDtSapFormat);

	int payrollPeriod = today.get(Calendar.MONTH)+1;

	if( payrollPeriod >=4 && payrollPeriod <=12){
		payrollPeriod = payrollPeriod - 3;
	}else{
		payrollPeriod = payrollPeriod + 9;
	}
	////out.println(payrollPeriod);

	String companyCodeUser		= request.getParameter("companyCode");
	String sapCompCodeUser = (String)sapCompCode.get(companyCodeUser);

	if("ENT".equalsIgnoreCase(entitlementCode)){
		//System.out.println("aa");


	String lineItems[] = {"700", sapCompCodeUser, txnId, userSapNo, "ZENT", processDtSapFormat, applDtSapFormat, "-", "-", payrollPeriod+"", faStartYear, "ZENT", claimAmount, actualAmount, "-", "-", "INR", "V", "-", txnId, portalId};
	lineItemList.add(lineItems);

	}if("INT".equalsIgnoreCase(entitlementCode))
		{
		System.out.println("11");
	String lineItems[] = {"700", sapCompCodeUser, txnId, userSapNo, "ZINT", processDtSapFormat, applDtSapFormat, "-", "-", payrollPeriod+"", faStartYear, "ZINT", claimAmount, actualAmount, "-", "-", "INR", "V", "-", txnId, portalId};
	lineItemList.add(lineItems);
	//System.out.println("lineItems--"+Arrays.toString(lineItems));

	}if("BKP".equalsIgnoreCase(entitlementCode))
	{
		String lineItems[] = {"700", sapCompCodeUser, txnId, userSapNo, "ZBAP", processDtSapFormat, applDtSapFormat, "-", "-", payrollPeriod+"", faStartYear, "ZBKP", claimAmount, actualAmount, "-", "-", "INR", "V", "-", txnId, portalId};
		lineItemList.add(lineItems);
	}
	if("DRR".equalsIgnoreCase(entitlementCode))
	{
		String lineItems[] = {"700", sapCompCodeUser, txnId, userSapNo, "ZDRR", processDtSapFormat, applDtSapFormat, "-", "-", payrollPeriod+"", faStartYear, "ZDRR", claimAmount, actualAmount, "-", "-", "INR", "V", "-", txnId, portalId};
		lineItemList.add(lineItems);
	}if("FRR".equalsIgnoreCase(entitlementCode))
	{
		String lineItems[] = {"700", sapCompCodeUser, txnId, userSapNo, "ZFRR", processDtSapFormat, applDtSapFormat, "-", "-", payrollPeriod+"", faStartYear, "ZFRR", claimAmount, actualAmount, "-", "-", "INR", "V", "-", txnId, portalId};
		lineItemList.add(lineItems);
	}if("VRR".equalsIgnoreCase(entitlementCode))
	{
		String lineItems[] = {"700", sapCompCodeUser, txnId, userSapNo, "ZVRR", processDtSapFormat, applDtSapFormat, "-", "-", payrollPeriod+"", faStartYear, "ZVRR", claimAmount, actualAmount, "-", "-", "INR", "V", "-", txnId, portalId};
		lineItemList.add(lineItems);
	}
		
	

	SAPValues.put("LINEITEMLIST1",lineItemList);

	// insert into the Timescape and SAP system
	status = genericClaimController.process(batch, SAPConnectionDetails, SAPColumnHeads, SAPValues);
	
	//out.println(status);
	session.removeAttribute("claimRequests");

	if(status)
	{
		response.sendRedirect("../common/promptPage.jsp?msg=suc_pro&compCode="+companyCodeUser);
		return;
	}else{
		response.sendRedirect("../common/promptPage.jsp?msg=err_pro&compCode="+companyCodeUser);
		return;
	}
%>