<%--
 -- @(#)viewRequest.jsp
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%-- Views Investment Declaration(s) made by an Employee
 -- Comments
 -- @author Vikrant Desai
 -- @version 1.00
 --%>

<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%--@page errorPage="../common/errorPage.jsp"--%>

<jsp:useBean id="investmentController" class="com.bccl.investment.web.controllerbeans.InvestmentController" />
<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
	</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name  = "frmInvestment" method = "post">
<input type="hidden" name="option">
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../common/config.jsp" %>
<%!
	Hashtable statusHash = new Hashtable();
	Hashtable iconHash = new Hashtable();

%>

<%
	//Populating the Hashtables
	statusHash.put("P", "Proposed Declaration");
	statusHash.put("L", "Actual Declaration");
	statusHash.put("AP", "Proposed Processed");
	statusHash.put("AL", "Actual Processed");
	statusHash.put("R",  "Rejected");
	statusHash.put("H", "Archived");

	
	iconHash.put("L", "../images/ico_inprocess.gif");
	iconHash.put("P", "../images/ico_inprocess.gif");
	iconHash.put("A", "../images/ico_approved.gif");
	iconHash.put("AP", "../images/ico_approved.gif");
	iconHash.put("AL", "../images/ico_approved.gif");
	iconHash.put("R", "../images/ico_rejected.gif");
	iconHash.put("H", "../images/ico_archived.gif");

	//String taxCodes[] = {"REB03","REB01","INCHSG","INTHSG","REB04","REB02","REB06","ILICJE","INVS07","INVS03","INVS02","INVS06","INVS08","INVS09","INVS13","INVS14","INVS18","INVS12","INVS20","INVS17","INVS19","INVS04","INVS05","HRARLF","NOOFMONTHS"};
	String taxCodes[] = {"REB03","REB01","INCHSG","INTHSG","REB04","REB02","REB06","ILICJE","INVS07","INVS03","INVS02","INVS06","INVS08","INVS09","INVS13","INVS14","INVS12","INVS20","INVS19","INVS05","HRARLF","INVS10","INVS11","INTRHSG","NOOFMONTHS"};
	String mobileNumber = "0";
	String transactionId = "";
	String currTxn= "";
	String currTxnStatus = "";
	String amountStr = "0";
	String noOfMonthsStr = "0";
    String effMonthYearLegacy = "0";
	String appliedDate = "";
	String remarks = "";
	String processedDate = "";
	

	String tmpArr[] = null;

	Hashtable detailHash = new Hashtable();
	ArrayList resultList = new ArrayList();
	ArrayList requestList = new ArrayList();
	Hashtable detailHashActual = new Hashtable();

	
	String option = (String) request.getParameter("option");
	//System.out.println(option);
	
	if(option == null){		
		session.removeAttribute("txnList");
		resultList  = investmentController.viewHistory(timescapeUserOId, (String) faYearHash.get(companyCode));	
		
		if(resultList.size() == 0 || resultList == null ){
			response.sendRedirect("../common/promptPage.jsp?msg=NO_REQ");
			return;		
		}
				
		requestList = (ArrayList) resultList.get(0);
		session.setAttribute("txnList", requestList);
		
		// Get the PAN Number, Mobile Number, Applied Date, Remarks, Status
		tmpArr = (String[]) requestList.get(0);
		mobileNumber = tmpArr[2];

		panNumber = tmpArr[1];

		// Getting the Remarks
		remarks = tmpArr[8];

		// Getting the Applied Date
		appliedDate = tmpArr[5];

		// Status of the transaction
		currTxnStatus = tmpArr[9];

		processedDate = tmpArr[7];

		currTxn = tmpArr[0];
		detailHash  = (Hashtable) resultList.get(1);
		detailHashActual  = (Hashtable) resultList.get(2);

	}else{
		String txnId = (String) request.getParameter("requestNumber");
		//System.out.println("Request Number " + txnId);
		
		resultList = investmentController.viewTxnId(txnId);
		ArrayList tempList = (ArrayList) resultList.get(0);
		
		tmpArr = (String[]) tempList.get(0);

		// Get the PAN Number, Mobile Number, Applied Date, Remarks, Status
		mobileNumber = tmpArr[2];

		panNumber = tmpArr[1];

		// Getting the Remarks
		remarks = tmpArr[8];

		// Getting the Applied Date
		appliedDate = tmpArr[5];

		// Status of the transaction
		currTxnStatus = tmpArr[9];

		detailHash = (Hashtable) resultList.get(1);
		requestList = (ArrayList) session.getAttribute("txnList");
		currTxn = txnId;
		processedDate = tmpArr[7];
	}
	
	// Set all other Invsetment Codes to zero amount
	for(int ii=0; ii < taxCodes.length; ii++){
		
		if(detailHash.containsKey(taxCodes[ii])){
			continue;
		}else{
			detailHash.put(taxCodes[ii], "");
		}
	
	}

	for(int ii=0; ii < taxCodes.length; ii++){
		
		if(detailHashActual.containsKey(taxCodes[ii])){
			continue;
		}else{
			detailHashActual.put(taxCodes[ii], "");
		}
	
	}

	//Populating the processed Date
	if(currTxnStatus.equalsIgnoreCase("AP") || currTxnStatus.equalsIgnoreCase("AL") || currTxnStatus.equalsIgnoreCase("H")){
		processedDate = tmpArr[7];
	}

	ArrayList getDeclOptionsList = investmentController.getDeclOptions(currTxn, timescapeUserOId, (String) faYearHash.get(companyCode));

	String radiosection1= "1";
	String radiosection2= "1";
	String radiosection3= "1";
	String radiosection4= "1";
	String radiosection6= "1";
	String dateofloan = "";


	for(int k=0; k<getDeclOptionsList.size(); k++)
	{
		String invOptArr[] = (String[]) getDeclOptionsList.get(k);

		String invCode=invOptArr[0];
		String selOption=invOptArr[1];

		if(invCode.equals("REB03"))
		{
			radiosection1=selOption;
		}
		else if(invCode.equals("REB01"))
		{
			radiosection2=selOption;
		}
		else if(invCode.equals("REB04"))
		{
			radiosection3=selOption;
		}
		else if(invCode.equals("REB02"))
		{
			radiosection4=selOption;
		}
		else if(invCode.equals("HRARLF"))
		{
			radiosection6=selOption;
		}
		else if(invCode.equals("INTRHSG"))
		{
			dateofloan=invOptArr[2];;
		}
		
	}
%>
<!-- Header Table -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">

		<tr>
			<td width="100%" class="bold2" align="right"><span class="redbold"><a href="javascript:window.print()" class="redbold"><img src="../images/print.gif" alt="print" border="0" >Print</a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.close()" class="redbold">Close</a></td>
		</tr>

		<tr>
			<td width="100%" bgcolor = "#00000000" class="whitenormal" align="center" height="20">Investment Declaration Form (Proposed - FY 2011-12)&nbsp;(ANNEXURE 2)</td>
		</tr>
		
		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>		
		
	</table>
<!-- Header Table ends-->
<!-- Employee Header Table -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="25%" height="15" class="bold2" align="left">Company Name</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15"class="normal2" align="left"><%=companyName%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15" class="bold2" align="left">Name of Employee</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15" class="normal2" align="left"><%=displayName%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="25%" height="15" class="bold2" align="left">Employee Payroll Id</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15" class="normal2" align="left"><%=payId%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15" class="bold2" align="left">Branch/Location</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15" class="normal2" align="left"><%=locationName%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="25%"height="15" class="bold2" align="left">Employee SAP Id</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15" class="normal2" align="left"><%=sapId%>&nbsp;&nbsp;<span class="rednormal"><b>DOJ - </b><%=joiningdate%></span></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15" class="bold2" align="left">Email Id</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15" class="normal2" align="left"><%=emailId%></td>
		</tr>


		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="25%" height="15" class="bold2" align="left">Income Tax PAN Number</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15" class="normal2" align="left"><%=panNumber%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15" class="bold2" align="left">Mobile Number</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" height="15" class="normal2" align="left"><%=mobileNumber%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>
		
		<tr>
			<td colspan="100%" class="normal2" align="left" height="20">
					The following tax saving investments may be considered for computation of income tax deduction at source for the financial year <%=faStartYear%> - <%=faEndYear%> :
			</td>
		</tr>
		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="25%" class="bold2" align="right" height="15"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" class="bold2" align="right" height="15">
				Online Transaction ID : <%=currTxn%>&nbsp;&nbsp;
				<%
					String txn[] = null;
				%>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" class="bold2" align="left" height="15">
				
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="25%" class="bold2" align="left" height="15">
			  <span class="redbold">Remarks : </span><%=remarks.toUpperCase()%>
			</td>
		</tr>
	</table>
<!-- Employee Header Table ends-->

<!-- Section 7 begins -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		
		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="bold2" align="left">Sr.No.</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="bold2" align="left">Investment Description</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="bold2" align="left">Section</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>			
			<td width="10%" height="15" class="bold2" align="left">Proposed Amount (Rs.)</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>	
			<td width="10%" height="15" class="bold2" align="left">Approved Amount (Rs.)</td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left">1</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%"  height="15"class="normal2" align="left">
				<p align="justify">
					<strong>Investment under Sec.80-C &amp;80-CCC qualifying for deductions upto <span class="style17"></span>1 lac </strong>				
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left"></td>			
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left"></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(A)  Annuity Plan for Certain Pension Funds
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80CCC</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("ILICJE")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("ILICJE")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(B)   Payment towards Life Insurance Policy - Directly paid by Employee				
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS06")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS06")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(C)   Tuition Fees (Only full time course at any Indian University,<br> College, School - Upto 2 children)		
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS19")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS19")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(D)   Subscription to notified Central Government Security (NSS)		
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS10")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS10")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(E)   Contribution to ULIP		
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS08")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS08")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(F)  Subscription to approved equity shares or debentures (Infrastructure)
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80CCC</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS11")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS11")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(G)  Subscription to approved mutual fund (Infrastructure)	
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS12")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS12")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>
       	
		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(H)  Contribution to Public Provident Fund
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS02")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS02")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(I)  Subscription to notified Central Government Savings Certificate (NSC VII issue)
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS09")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS09")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(J) Housing Loan Principal Repayment
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS07")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS07")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(K)   Subscription to notified deposit scheme of the National Housing Bank
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS03")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS03")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(L)  Term Deposits under Section 80C
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS20")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS20")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(M) 5 year time deposit under the Post Office Time Depost Rules 1981 
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS05")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS05")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(N)   Any Mutual Fund notified under section 10 (23D)	
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80C</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS05")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS05")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

<%
	ArrayList getCheckBox1List = new ArrayList();
	getCheckBox1List = investmentController.getCheckBox1List(currTxn, timescapeUserOId, (String) faYearHash.get(companyCode));
	
	String getCheckBox1Arr[] = (String[]) getCheckBox1List.get(0);

	String chkbox1 = getCheckBox1Arr[0];
	String chkbox2 = getCheckBox1Arr[1];
	String chkbox3 = getCheckBox1Arr[2];

%>

	<tr>
			<td width="5%" height="15" class="normal2" align="left">2</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%"  height="15"class="normal2" align="left">
				<p align="justify">
					<strong>Other Deductions</strong>
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left"></td>			
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left"></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>
	
      <tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
                <p align="justify">
                    (A)&nbsp;Medical Insurance Premium&nbsp;&nbsp;-&nbsp;&nbsp;
					<br />
                </p>
            </td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80D</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td>&nbsp;</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
	  </tr>
<%
		
		if(chkbox1.equals("1")){
%>
      <tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
                <p align="justify">
		 For Self, Spouse &amp; Dependent Children<span class="Rs"> (Upto Rs 15,000)</span>	
		</p>
		</td>
		<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		<td width="10%" height="15" class="normal2" align="left">&nbsp;</td>
		<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("REB03")%></td>
		<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("REB03")%></td>
	</tr>
			
<%
		}
		if(chkbox2.equals("1")){
%>
      <tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
                <p align="justify">
			 For Self, Spouse &amp; Dependent Children<span class="Rs"> (Upto Rs 15,000)</span>
		</p>
		</td>
		<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		<td width="10%" height="15" class="normal2" align="left">&nbsp;</td>
		<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("REB032")%></td>
		<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("REB032")%></td>
	</tr>
<%
		}
		if(chkbox3.equals("1")){
%>
      <tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
                <p align="justify">
			 For Self, Spouse &amp; Dependent Children<span class="Rs"> (Upto Rs 15,000)</span>
		</p>
		</td>
		<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		<td width="10%" height="15" class="normal2" align="left">&nbsp;</td>
		<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("REB033")%></td>
		<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("REB033")%></td>
	</tr>
<%
		}
%>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
                    (B)&nbsp;Deduction for expenditure incurred on handicapped <br>dependents / Deposits with LIC&nbsp;&nbsp;-&nbsp;&nbsp;<%
					if(radiosection2.equals("1"))
					{
					%>
					with disability -less than 80%
					
					<%
					}else if(radiosection2.equals("2"))
					{
					%>
					with severe disability - exceeding 80%
					<%
					}
					%>
                 </p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80DD</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("REB01")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("REB01")%></td>	
		</tr>


<!-- newly added -->
		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>
		<tr>
			<td width="5%" height="20" class="normal2" align="left"></td>
			<td class="normal2" height="20" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="20"class="normal2" align="left" >
				<p align="justify">
                    (C)&nbsp;Deduction for expenditure incurred for specified disease<br> or ailment (Cancer / AIDS etc.)</b>&nbsp;&nbsp;-&nbsp;&nbsp;<%
					if(radiosection3.equals("1"))
					{
					%>
					Age below 60 years
					
					<%
					}else if(radiosection3.equals("2"))
					{
					%>
					Age above 60 years
					<%
					}
					%>					
				</p>
			</td>
			<td class="normal2" height="20" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="20" class="normal2" align="left" >
				 80DDB
				
			<td class="normal2" height="20" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="20" class="normal2" align="left" >&nbsp;<%=detailHash.get("REB04")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("REB04")%></td>
		</tr>
		
        <tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
                    (D)&nbsp;Deduction for Self Permanent Disability</b>&nbsp;&nbsp;-&nbsp;&nbsp;<%
					if(radiosection4.equals("1"))
					{
					%>
					self disability -less than 80%
					
					<%
					}else if(radiosection4.equals("2"))
					{
					%>
					self severe disability - exceeding 80%
					<%
					}
					%>
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80U</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("REB02")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("REB02")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
                    (E)&nbsp;Interest on Education Loan (Self, Spouse&nbsp;&amp;&nbsp;Children) from <br>Charitable or Financial Institutions</b>						
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80E</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("REB06")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("REB06")%></td>
		</tr>
						
		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(F)&nbsp;Investment in Long Term Infrastructure Bonds				
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">80CCF</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INVS14")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INVS14")%></td>
		</tr>
						
		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left">3</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%"  height="15"class="normal2" align="left">
				<p align="justify">
					<strong>Other Investments.</strong>				
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left"></td>			
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left"></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>
<!-- --------------------------------------------------------------------------------------- -->

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(A)&nbsp;Interest Rebate on Housing Loan<br>Date of Loan taken&nbsp;-&nbsp;<%=dateofloan%>
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">Int U/s 24</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INTRHSG")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INTRHSG")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left"></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					(B)&nbsp;Income / Loss from rented out house property
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">Int U/s 24</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHash.get("INTHSG")%></td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INTHSG")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="5%" height="15" class="normal2" align="left">4</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					Other Income as per Annex 4<br>
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">Int U/s 24</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">
				&nbsp;<%=detailHash.get("INCHSG")%>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("INCHSG")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

<!-- ------------------------------------------------------------------------------------------------------ -->

		<tr>
			<td width="5%" height="15" class="normal2" align="left">5</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					Previous Employment Income<br>
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">Int U/s 24</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			
			<td width="10%" height="15" class="normal2" align="left">
				&nbsp;<%=detailHash.get("PREVEMP")%>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">&nbsp;<%=detailHashActual.get("PREVEMP")%></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>
	
<!-- ------------------------------------------------------------------------------------------------------ -->

 <%
	
	ArrayList hraLIST  =  investmentController.viewHRAHistory(timescapeUserOId, (String) faYearHash.get(companyCode), "HRARLF", currTxn);
	//out.println("hraLIST size="+hraLIST.size());
	String tmpHRAArr[] = null;
	String fromdt = "";
	String todt = "";
	String proposedamt = "";
	String approvedamt = "";
	int kk;	
 %>
		<tr>
			<td width="5%" height="15" class="normal2" align="left">6</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="65%" height="15"class="normal2" align="left">
				<p align="justify">
					Housing Rent Exemption&nbsp;-&nbsp; 
					<%
					if(radiosection6.equals("1"))
					{
					%>
					Rent Agreement 
					
					<%
					}else if(radiosection6.equals("2"))
					{
					%>
					Annex 5
					<%
					}
					%><br>
				</p>
			</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
			<td width="10%" height="15" class="normal2" align="left">U/s 10(13A)</td>
			<td class="normal2" height="15" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>
<!-- -------------------------------------------------------------------------- -->		
<table width="100%" border="1" align="center" cellpadding="1" cellspacing="0" id="tblSample">

  <tr>
    <th colspan="100%" align="left" class="normal2">Rent Period</th>	
	<th colspan="100%" align="left" class="normal2">From Date</th>
	<th colspan="100%" align="left" class="normal2">To Date</th>
	<th colspan="100%" align="left" class="normal2">Proposed Amt(Rs.)</th>
	<th colspan="100%" align="left" class="normal2">Approved Amt(Rs.)</th>
  </tr>
  
  <%
	
	for(kk=1;kk<(hraLIST.size()+1);kk++)
	
	{
	
		tmpHRAArr = (String[]) hraLIST.get(kk-1);
	
		if(tmpHRAArr[2].equals("0"))
		{
			fromdt = "";
			todt = "";
			proposedamt = "0";
			approvedamt = "0";
		}
		else
		{
			fromdt = tmpHRAArr[0];
			todt = tmpHRAArr[1];
			proposedamt = tmpHRAArr[2];
			approvedamt = tmpHRAArr[3];
		}
%>
	<tr>
		<td colspan="100%" class="normal2"><%=kk%></td>   
		<td colspan="100%" class="normal2"><%=fromdt%></td>
		<td colspan="100%" class="normal2"><%=todt%></td>
		<td colspan="100%" class="normal2"><%=proposedamt%></td>
		<td colspan="100%" class="normal2"><%=approvedamt%></td>		 
	</tr>

<%
	}
%>
	
	</table>
  
</table>


	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<br>
				
		<tr>
			<td colspan="100%" class="normal2">
				<p align="justify">
					I undertake that the above investments will be made not later than 12'th March and proof will be submitted for finalizing computation of income tax deduction at source for the current FY.
					<br>
					Based on the documentary evidence of actual investments furnished by me, any shortfall of actual investments made against the investments proposed, I hereby authorise Finance Department to deduct income tax from my salary for January, 12 to March, 12 towards the balance TDS liability.
 				</p>
			</td>
		</tr>
		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>
		
		<tr>
		<td colspan="100%" class="normal2"><strong>Enclosed Documents:-</strong></td>
	  </tr>
	  
<%
	ArrayList getEnclosedAnnexuresList = new ArrayList();
	getEnclosedAnnexuresList = investmentController.getEnclosedAnnexuresList(currTxn, timescapeUserOId, (String) faYearHash.get(companyCode));
	
	String getEnclosedAnnexuresArr[] = (String[]) getEnclosedAnnexuresList.get(0);

	String annex3=getEnclosedAnnexuresArr[0];
	String annex4=getEnclosedAnnexuresArr[1];
	String annex5=getEnclosedAnnexuresArr[2];
	String annex6=getEnclosedAnnexuresArr[3];
	String annex7=getEnclosedAnnexuresArr[4];
	String annex8=getEnclosedAnnexuresArr[6];
	String rentagr=getEnclosedAnnexuresArr[5];
	//System.out.println(annex3+" "+annex4+" "+annex5+" "+annex6+" "+annex7+" "+rentagr);
%>

	  
	  <tr>
		<td width="60%" class="normal2">
<%
		if(annex3.equals("1")){
%>
			<input name="annexure3" type="checkbox" value="1" checked="checked" disabled/>Annexure 3		
<%
		}
		else if(annex3.equals("0")){
%>
			<input name="annexure3" type="checkbox" value="0" disabled/>Annexure 3	
<%
		}		
		if(annex4.equals("1")){
%>			
			<input name="annexure4" type="checkbox" value="1" checked="checked" disabled/>Annexure 4
<%
	    }
		else if(annex4.equals("0")){
%>
			<input name="annexure4" type="checkbox" value="0" disabled/>Annexure 4		
<%
		}
		if(annex5.equals("1")){
%>			
			<input name="annexure5" type="checkbox" value="1" checked="checked" disabled/>Annexure 5
<%
		}
		else if(annex5.equals("0")){
%>
			<input name="annexure5" type="checkbox" value="0" disabled/>Annexure 5	
<%
		}
		if(annex6.equals("1")){
%>			
			<input name="annexure6" type="checkbox" value="1" checked="checked" disabled/>Annexure 6
<%
		}
		else if(annex6.equals("0")){
%>
			<input name="annexure6" type="checkbox" value="0" disabled/>Annexure 6		
<%
		}
		if(annex7.equals("1")){
%>			
			<input name="annexure7" type="checkbox" value="1" checked="checked" disabled/>Annexure 7
<%
		}
		else if(annex7.equals("0")){
%>
			<input name="annexure7" type="checkbox" value="0" disabled/>Annexure 7	
<%
		}
		if(annex8.equals("1")){
%>			
			<input name="annexure7" type="checkbox" value="1" checked="checked" disabled/>Annexure 8
<%
		}
		else if(annex8.equals("0")){
%>
			<input name="annexure7" type="checkbox" value="0" disabled/>Annexure 8	
<%
		}
		if(rentagr.equals("1")){
%>		
			<input name="rentagr" type="checkbox" value="1" checked="checked" disabled/>Rent Agreement
<%
		}
		else if(rentagr.equals("0")){
%>
			<input name="rentagr" type="checkbox" value="0" disabled/>Rent Agreement	
<%
		}
%>
		</td>
	  </tr>		
		
		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td width="50%" class="normal2" align="left">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Applied Date : </strong><%=appliedDate%><br>
				&nbsp;&nbsp;<strong>Processed Date  : </strong><%=processedDate%> 
			</td>
			
			<td width="50%" class="normal2" align="right">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="normal2" width="55%" align="right"><strong>Submitted By</strong></td>
						<td class="normal2" width="5%"  align="center"><strong>:</strong></td>
						<td class="normal2" width="40%"  align="left"><%=displayName%></td>
					</tr>
					<tr>
						<td class="normal2" width="55% "align="right"><strong>Dept</strong></td>
						<td class="normal2" width="5%" align="center"><strong>:</strong></td>
						<td class="normal2" width="40%" align="left"><%=deptName%></td>
					</tr>
					<tr>
						<td class="normal2" width="55% "align="right" height="20"><strong>Signature</strong></td>
						<td class="normal2" width="5%" align="center" height="20"><strong>:</strong></td>
						<td class="normal2" width="40%" align="left" height="20"></td>
					</tr>
				</table>				
			</td>
		</tr>

		 <tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<!-- <tr>
			<td colspan="100%" class="bold2">
				<p align="justify">
					NOTE : <br>	
					1. Kindly quote your PAN, Pay ID and SAP ID accurately.<br>								
                    2. Kindly do send in your final declaration of investments and docs evidencing such investments by 15.01.11 for timely finalisation of TDS.<br>	
                    <br>						
				</p>
			</td>
		</tr>

		<tr>
			<td colspan="100%" class="normal2" align="left" bgcolor="#00000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>
		<tr>
			<td colspan="100%" class="normal2" align="left" height="40">"During re-submission, the data submitted earlier would be replaced with the data in the current form.  Hence, this submission should be complete in all respects and it should also include the data submitted earlier (unless a specific item needs to be deleted/modified). Supportings submitted earlier need not be submitted again."	
			</td>
		</tr>  -->
		

	</table>
</form>
</html>

