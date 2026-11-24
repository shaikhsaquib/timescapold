<%--
 -- @(#)processNominationsSubmit.jsp - 1-APR-2010
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Home Page of Mata Talent award
 -- @author  -  Chetan Gothe
 -- @version -  1.0
 -- This page is used to process nominations by unit head, functional head and HR
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, com.bccl.util.Utility" %>
<jsp:useBean id="mtAwardController" class="com.bccl.mtawards.web.controllerbeans.MTAwardController"/>

<%
	String currLink = "../jury/processNominations.jsp";
%>

<%--
	Make all your global declarations over here 
--%>

<html>
<head>
	<title>Mata Talent Award</title>
	<link rel="stylesheet" href="../style/global.css">
</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
		<%@ include file="../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">
			<tr>
				<td  background = "../images/MTheaderbg.jpg" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../images/header.jpg" /></div>
				<td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					<%@ include file="../includes/awardProgramMenu.jsp"%>
				<td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;
				</td>
			</tr>
<%
	
	String hiddenMonthYear = (String) request.getParameter("hiddenMonthYear");
	String nominationNo = (String) request.getParameter("hiddNominationNo");
	String alertNo = (String) request.getParameter("hiddAlertNo");
	String remark = Utility.replaceQuoteOracle((String) request.getParameter("hiddRemark"));
	String parentCategoryCode = (String) request.getParameter("hiddParentCatCode");
	String categoryCode = (String) request.getParameter("hiddCatCode");

	Object objArr[] = new Object[4];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = "'DD-MON-YYYY'";
	objArr[2] = "2010040003";
	objArr[3] = nominationNo;
	
	Hashtable searchHash = new Hashtable();
	searchHash.put("queryId", "1000");
	searchHash.put("arguments", objArr);
	ArrayList requestDetails = mtAwardController.viewNomination(searchHash);
	
	String[] requestValues = (String[])requestDetails.get(0);


	Hashtable nominationHash = new Hashtable();
	nominationHash.put("programId", "2010040003");
	nominationHash.put("nominationId", nominationNo);
	nominationHash.put("modifiedBy", timescapeUserOId);
	nominationHash.put("roleCode", role);
	nominationHash.put("selectRadioValue", "-");
	nominationHash.put("reviewerXML", requestValues[6]);


	String reviewerDetails []  = {"reviewerDetails", "reviewer", "user", "date", "remark"};
	String reviewerDetailsValues[] ={"subNode", "details", emailId, Utility.returnCurrentDate(), remark};

	Hashtable updateAlertHash = new Hashtable();
	updateAlertHash.put("alertId", alertNo);
	updateAlertHash.put("reviewerRemarks", remark);
	updateAlertHash.put("status", "A");

	ArrayList updateNomination = new ArrayList();
	updateNomination.add(reviewerDetails);
	updateNomination.add(reviewerDetailsValues);
	updateNomination.add(nominationHash);
	updateNomination.add(updateAlertHash);

	boolean status = mtAwardController.updateNomination(updateNomination);

	boolean alertStatus = false;

	if(status)
	{ 
		 ArrayList userDetails  = mtAwardController.viewUserRole("5");

		for(int ii = 0; ii<userDetails.size(); ii++)
		{
			String userDetailsValues[] = (String[]) userDetails.get(ii);
			Hashtable alertHash = new Hashtable();
			alertHash.put("nominationId", nominationNo);
			alertHash.put("creatorOId", timescapeUserOId);
			alertHash.put("createdBy", emailId);
			alertHash.put("moderatorEmailId", userDetailsValues[1]);
			alertHash.put("reviewerRemarks", remark);
			alertHash.put("txnStatus", "L");

			alertStatus = mtAwardController.createAlert(alertHash);

		}
	}


	if(alertStatus){
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);

	
%>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >You have successfully approved the selected Award Nomination request !!!
				</td> 
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;</td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Click <a href="../jury/processNominations.jsp">here</a> to view pending Nomination requests
				</td> 
			</tr>
<%
	}else{
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		//return;
%>		
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >There is some problem while filing the request !!!
				</td> 
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;</td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Click <a href="../jury/processNominations.jsp">here</a> to try again
				</td> 
			</tr>
<%
	}
%>

	</table>
</body>
</html>