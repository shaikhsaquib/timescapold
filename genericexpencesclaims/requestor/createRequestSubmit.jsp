<%--
 -- @(#)createRequestSubmit.jsp	15/05/2008
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
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/sapCompCompany.jsp" %>
<%@ include file="../common/config.jsp"%>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>

 <jsp:useBean id="genericClaimController" class="com.bccl.claim.web.controllerbeans.GenericClaimController" /> 
<%

	String noOfRows			= request.getParameter("actualRows");

	String[] medicalClaim = {"FAYEAR","TIMESCAPEUSEROID","CLAIMAMOUNT","CREATEDBY","TRANSACTIONID"};

	Hashtable genericClaimHeader	= new Hashtable( );
	ArrayList genericClaimDetail	= new ArrayList( );

	String year				= "";
	String claimTotal		= "";
	String actionNumber		= "";
	String txnId			= null;
	String entitlementCode = "";
	int savedBills			= 1;
	int ii					= 1;

	String strBalanceAmt			= "";
	String balanceAmt				= "";
	float floatBalAmt				= 0;

//System.//out.println("Balance Cov before= "+balanceAmt);
	//criteriaHash			 = new Hashtable();
	//companiesList		 = new ArrayList();

	ArrayList  compListSAP = new ArrayList();
	entitlementCode = (String)request.getParameter("entitlementCode");
	
	companiesList = listDomainObjectsController.listCompanies(criteriaHash);

	for(int jj=0; jj< companiesList.size(); jj++){
		String tmpArr[] = (String[])companiesList.get(jj);
		compListSAP.add(tmpArr[0]);
	}

    if(compListSAP.contains(companyCode)){
		String balanceAmt2 = genericClaimController.getGenericBalances(timescapeUserOId, sapId, faYear, entitlementCode);
		floatBalAmt = Float.parseFloat(balanceAmt2);
		balanceAmt = floatBalAmt+"";
	}else{	
		ArrayList entlBalancesLst		= genericClaimController.viewBalances(timescapeUserOId, faYear, entlCode, legacyCompanyCode);
	    if(entlBalancesLst.size() > 0){
			strBalanceAmt						= ((String[]) entlBalancesLst.get(0))[5];
			floatBalAmt = Float.parseFloat(strBalanceAmt);
			balanceAmt = floatBalAmt+"";
		}
	}
	//System.//out.println("Balance Cov after= "+balanceAmt);

	genericClaimHeader.put("BALANCEAMT", balanceAmt);
	genericClaimHeader.put("ENTITLEMENTCODE", entitlementCode);

	genericClaimHeader.put("FAYEAR", faYear);

	Long timescapeUserOIdLong = new Long(timescapeUserOId);
	genericClaimHeader.put("TIMESCAPEUSEROID", timescapeUserOIdLong);

	claimTotal = (String) request.getParameter("total");
	genericClaimHeader.put("CLAIMAMOUNT", claimTotal);

	actionNumber = (String) request.getParameter("actionNumber");
	if(actionNumber.equals("sub_req"))
	{actionNumber = "L";}
	else{actionNumber = "O";;}
	genericClaimHeader.put("ACTIONNUMBER", actionNumber);

	genericClaimHeader.put("CREATEDBY", emailId);
	genericClaimHeader.put("MODIFIEDBY", "timescape.admin@timesgroup.com");

	savedBills = Integer.parseInt(request.getParameter("savedBills"));
	//txnId = request.getParameter("txnId");
	String editTxnId = (String)session.getAttribute("editTxnId");
	
	//if(txnId!=null && !txnId.equals("null") && !txnId.trim().equals(""))
	//if(editTxnId!=null && !editTxnId.equals("null") && !editTxnId.trim().equals(""))
	if(savedBills > 1)
	{
		//genericClaimHeader.put("TRANSACTIONID", txnId);
		genericClaimHeader.put("TRANSACTIONID", editTxnId);
	}

	if((request.getParameter("savedBills")) == null)
	{savedBills = 1;}

	int rows = Integer.parseInt(noOfRows);
	rows= rows+1;
	int arraySize = (rows-savedBills+1);

	String[] billDate			= new String[arraySize];
	String[] billNo			    = new String[arraySize];
	String[] billDesc			= new String[arraySize];
	String[] billAmount			= new String[arraySize];
	String[] billAttachment		= new String[arraySize];

//Saved bills are only updated , New bills will be inserted(hence we only pass new bills)
		
	for(ii=savedBills;ii<rows;ii++){	
		int index = ((ii-savedBills)+1);
		billDate[index]		= request.getParameter("billDate"+ii);
		billNo[index]		= request.getParameter("billNo"+ii);
		billNo[index] = Utility.replaceQuoteOracle(billNo[index]);
		billDesc[index]		= request.getParameter("billDesc"+ii);
		billDesc[index] = Utility.replaceQuoteOracle(billDesc[index]);
		billAmount[index]	= request.getParameter("billAmount"+ii);
		billAttachment[index]	= request.getParameter("billAttachment"+ii);
	}

	String[] strArrayUpdateAttachment		= new String[savedBills];
		int countOfTrueUpdateAttachment = 0;
		
		for(int countForUpdateFile=1; countForUpdateFile < savedBills; countForUpdateFile++) {
			String updateAttachment = (String)(request.getParameter("updateSavedBillsHid" + countForUpdateFile));
			//System.out.println("Type of updateSavedBillsHid" + updateAttachment+""+countForUpdateFile);
			
			if(updateAttachment.equals("true")) {
				//System.out.println("updateAttachment:" + updateAttachment+""+countForUpdateFile);
				String oldAttachName = (String)(request.getParameter("oldBillAttachmentName"+countForUpdateFile));
				String newAttachName = (String)(request.getParameter("newBillAttachmentName"+countForUpdateFile));
				
				//System.out.println("countOfTrueUpdateAttachment:" + countOfTrueUpdateAttachment);	
				strArrayUpdateAttachment[countOfTrueUpdateAttachment] = oldAttachName + ";" + newAttachName;
				//System.out.println("strArrayUpdateAttachment[countOfTrueUpdateAttachment]:" + strArrayUpdateAttachment[countOfTrueUpdateAttachment]);	
				countOfTrueUpdateAttachment++;
				//System.out.println("countOfTrueUpdateAttachment++:" + countOfTrueUpdateAttachment);
			}
		}

	genericClaimDetail.add(0,billDate);
	genericClaimDetail.add(1,billNo);
	genericClaimDetail.add(2,billDesc);
	genericClaimDetail.add(3,billAmount);
	genericClaimDetail.add(4,billAttachment);
	genericClaimDetail.add(5,strArrayUpdateAttachment);

	boolean status = false;

	status = genericClaimController.create(genericClaimHeader,genericClaimDetail);
	if(actionNumber.equals("L")){
		if(status){
			response.sendRedirect("../common/promptPage.jsp?msg=suc_req");
			return;
		}else{
			response.sendRedirect("../common/promptPage.jsp?msg=err_req");
			return;
		}
	}else{
			if(status){
			response.sendRedirect("../common/promptPage.jsp?msg=opn_suc_req");
			return;
		}else{
			response.sendRedirect("../common/promptPage.jsp?msg=opn_err_req");
			return;
		}
	}
%>