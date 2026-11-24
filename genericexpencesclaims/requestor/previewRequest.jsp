<%--
 -- @(#)previewRequest.jsp	12/3/2008
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
 -- @version 	1.00, 12/3/2008
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>


<%
	GregorianCalendar today = new GregorianCalendar();
	String applyDate		= "";
	String days				= "";
	String amountTotal		= "";
	String amountWords		= "";
	String total			= "";
	String actionNumber		= "";
	String txnId			= "";
	String savedBills		= "";
	String entitlementCode = "";
	String [] billDate		= null;
	String [] billNo		= null;
	String [] billDesc		= null;
	String [] billAmount	= null;
	String [] billAttachment	= null;
	String noOfRows			= request.getParameter("noOfRows");
	int rows				= 0;
	int actualRows			= 0;
	String[] months = {"Month", "January" , "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>B2E</title>
	<link rel="stylesheet" href="../style/global.css">
	<link rel="stylesheet" href="../style/common.css">
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript" src="../jscripts/common.js"></script>
	<script Language="JavaScript" src="../jscripts/previewRequest.js"></script>
    
</head>
<body>
 <%@ include file="../includes/genericClaimHeader.html" %>
 <%@ include file="../includes/genericClaimMenu.jsp" %> 
	<table width="100%" border="0" cellpadding="2" cellspacing="2">
		<form name="frmPreviewRequest" method="post">
<%	
    actionNumber = (String) request.getParameter("actionNumber");
    
	if(noOfRows!=null){
	rows = Integer.parseInt(noOfRows);
	}
	
	billDate			= new String[rows+1];
	billNo			    = new String[rows+1];
	billDesc			= new String[rows+1];
	billAmount			= new String[rows+1];
	billAttachment			= new String[rows+1];

	// Get fromDate in the 'YYYY-MM-DD' format
	int todayDay = today.get(Calendar.DAY_OF_MONTH);
	int todayMonth = today.get(Calendar.MONTH);
	int todayYear = today.get(Calendar.YEAR);
	applyDate = Utility.returnDate(todayDay, (todayMonth+1), todayYear);

	int monthNumber =Integer.parseInt(request.getParameter("forMonth"));
	String forMonth= months[monthNumber];
	String forYear = (String) request.getParameter("forYear");
	String id = "";

	amountTotal= (String) request.getParameter("amountTotal");
	amountWords= (String) request.getParameter("amountWords");
	total= (String) request.getParameter("total");
	//txnId = (String) request.getParameter("txnId");
    savedBills = (String) request.getParameter("savedBills");
	int savedBillsNew = Integer.parseInt(savedBills);

    //entitlementCode = (String) request.getParameter("entitlementCode");
	entitlementCode = (String)session.getAttribute("entitlementCode");
	//out.println("entitlementCode"+entitlementCode);
	id = (String) request.getParameter("id");

	String entitlementCode1 = "";


	if("INT".equals(entitlementCode)){
		
		 entitlementCode1 = "Internet";
	}else if("ENT".equals(entitlementCode))
	{
		 entitlementCode1 = "Entertainment";
	}else if("BKP".equals(entitlementCode)){
		 entitlementCode1 = "Books And Periodicals";

	}else if("DRR".equals(entitlementCode)){
		 entitlementCode1 = "Driver reimbursement";

	}else if("FRR".equals(entitlementCode)){
		 entitlementCode1 = "Fuel reimbursement";

	}else if("VRR".equals(entitlementCode)){
		 entitlementCode1 = "Vehicle Repair reimbursement";

	}


	out.println(rows);
	for(int ii=1;ii<=rows;ii++)
	{   
        
		billDate[ii] = request.getParameter("billDate"+ii);
		billNo[ii] = request.getParameter("billNo"+ii);
		billDesc[ii] = request.getParameter("billDesc"+ii);
		if(billDesc[ii]==null || billDesc[ii].equals("null") || billDesc[ii].trim().equals("")){
			billDesc[ii] = "-";
		}
		billAmount[ii] = request.getParameter("billAmount"+ii);
		billAttachment[ii] = request.getParameter("billAttachment"+ii);

		out.println(billAttachment[ii]);

        if(!(billNo[ii]==null || billNo[ii].trim().equals(""))){
		actualRows++;
%>
            <input type="hidden" id="billDate" name="billDate<%=ii%>" value="<%=billDate[ii]%>">
			<input type="hidden" id="billNo" name="billNo<%=ii%>" value="<%=billNo[ii]%>">
			<input type="hidden" id="billDesc" name="billDesc<%=ii%>" value="<%=billDesc[ii]%>">
			<input type="hidden" id="billAmount" name="billAmount<%=ii%>" value="<%=billAmount[ii]%>">
			<input type="hidden" id="billAttachment" name="billAttachment<%=ii%>" value="<%=billAttachment[ii]%>">
<%      }
	}

%>
            <input type="hidden" name="actualRows" value="<%=actualRows%>">

			<input type="hidden" name="total" value="<%=total%>">
			<input type="hidden" name="forMonth" value="<%=forMonth%>">
			<input type="hidden" name="forYear" value="<%=forYear%>">
			<input type="hidden" name="option" value="1">
			<input type="hidden" name="actionNumber" value="<%=actionNumber%>">
			<!-- <input type="hidden" name="txnId" value=<%//=txnId%>> -->
            <input type="hidden" name="id" value=<%=id%>>
			<input type="hidden" name="savedBills" value="<%=savedBills%>">
			<input type="hidden" name="entitlementCode" id = "entitlementCode" value="<%=entitlementCode%>">

			<tr>
				<td class="whitesmall" bgcolor="#000000" align="center" colspan ="8" height="20" color="#ffffff">GENERIC REIMBURSEMENT CLAIM FORM PREVIEW</td>
			</tr>

			<tr>
				<td height="25"colspan="100%"><block type="spacer" height="25"></td>
			</tr>
			<tr>
				<td colspan="100%" class="normal">
					<p>Accounts Department<br><br>Please find attached generic bills worth Rs.&nbsp;<span class="bold"><%=amountTotal%></span>&nbsp; for Reimbursement of Month&nbsp;<b><%=forMonth%></b>&nbsp;Year&nbsp;<b><%=forYear%></b>&nbsp;Salary
				</td>
			</tr>
			<tr>
				<td height="25"colspan="100%"><block type="spacer" height="25"></td>
			</tr>
			<tr>
				<td colspan="100%">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tr bgcolor="#000000">
							<td class="whitesmall" width="5%"style="border-bottom:1px solid #E8E8E8">SR. NO.</td>
							<td class="whitesmall" width="20%"style="border-bottom:1px solid #E8E8E8">BILL DATE</td>
							<td class="whitesmall" width="20%"style="border-bottom:1px solid #E8E8E8">BILL NO.</td>
							<td class="whitesmall" width="20%"style="border-bottom:1px solid #E8E8E8">BILL DESCRIPTION</td>
							<td class="whitesmall" width="20%"style="border-bottom:1px solid #E8E8E8">CLAIM TYPE</td>
							<td class="whitesmall"width="20%"style="border-bottom:1px solid #E8E8E8">&nbsp;&nbsp;AMOUNT</td>
							<td class="whitesmall"width="15%"style="border-bottom:1px solid #E8E8E8">ATTACHMENT</td>
							<td class="whitesmall"width="15%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
						</tr>

<%				for(int ii=1;ii<=rows;ii++){
					if(!(billNo[ii]==null || billNo[ii].trim().equals(""))){
		
%>
						<tr>
							<td class="normal" width="5%"style="border-bottom:1px solid #E8E8E8"><%=ii%>.</td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><%=billDate[ii]%></td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><%=billNo[ii]%></td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><%=billDesc[ii]%></td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><%=entitlementCode1%></td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8">Rs.&nbsp;<%=billAmount[ii]%>&nbsp;</td>
<%
							
								String emailidNew = emailId;
								if (emailidNew.indexOf("@") > -1) {
									emailidNew = emailidNew.substring(0, emailidNew.indexOf("@"));        
								}
								
								String transIdNew = (String)request.getParameter("transIdNew");

								boolean changedSavedBills = false;
								
								String oldBillAttachmentName = billAttachment[ii];
								String oldBillAttachmentNameDbN = (String)request.getParameter("oldBillAttachmentNameDb"+ii);
								
								/* System.out.println("*************************"); */
								//System.out.println("oldBillAttachmentNameDbN:" + oldBillAttachmentNameDbN);
								//System.out.println("Are oldBillAttachmentNameDbN equals oldBillAttachmentName:" + oldBillAttachmentNameDbN.equals(oldBillAttachmentName));

								if(oldBillAttachmentNameDbN != null){
									if(!(oldBillAttachmentNameDbN.equals(oldBillAttachmentName))){
										oldBillAttachmentName = oldBillAttachmentNameDbN;
									}
								}
								

								/* System.out.println("Old Bill Attachment Name:" + oldBillAttachmentName); */
								
								if(request.getParameter("newBillAttachment"+ii) != null && !request.getParameter("newBillAttachment"+ii).isEmpty()){
									billAttachment[ii] = (String)request.getParameter("newBillAttachment"+ii);
									changedSavedBills = true;
								}
								
								String newBillAttachmentName = billAttachment[ii];
								
								/* System.out.println("New Bill Attachment Name:" + newBillAttachmentName);
								System.out.println("Are they equal:" + oldBillAttachmentName.equals(newBillAttachmentName));
								System.out.println("*************************"); */
								//out.println("<br />>>>" + changedSavedBills+ " " + ii + " < " + savedBillsNew);
								
								//if(isBCCLEmployee) {

								if(transIdNew != null){
									if(ii<savedBillsNew){
										if(changedSavedBills){
%>											
											<td class="normal"width="15%"style="border-bottom:1px solid #E8E8E8"><a href="javascript:void(0);" onclick ="showCurrentFile('<%=billAttachment[ii]%>','<%=emailidNew%>','0','');"><img src="../images/Downloads-icon.png" border="0" height="12px" width="12px" title="<%=billAttachment[ii]%>"></a></td>
<%											
										} else {
%>											
											<td class="normal"width="15%"style="border-bottom:1px solid #E8E8E8"><a href="javascript:void(0);" onclick ="showCurrentFile('<%=billAttachment[ii]%>','','','<%=transIdNew%>');"><img src="../images/Downloads-icon.png" border="0" height="12px" width="12px" title="<%=billAttachment[ii]%>"></a></td>
<%											
										}
									} else {
%>
										<td class="normal"width="15%"style="border-bottom:1px solid #E8E8E8"><a href="javascript:void(0);" onclick ="showCurrentFile('<%=billAttachment[ii]%>','<%=emailidNew%>','0','');"><img src="../images/Downloads-icon.png" border="0" height="12px" width="12px" title="<%=billAttachment[ii]%>"></a></td>
<%	
									}
									
								} else {
%>
									<td class="normal" width="15%"style="border-bottom:1px solid #E8E8E8">&nbsp;&nbsp;<a href="javascript:void(0);" onclick ="showCurrentFile('<%=billAttachment[ii]%>','<%=emailidNew%>','0','');"><img src="../images/Downloads-icon.png" border="0" height="12px" width="12px" title="<%=billAttachment[ii]%>"></a></td>
<%	
								} 
								
								//} else { 
%>								
									<!-- <td class="normal"width="15%"style="border-bottom:1px solid #E8E8E8"></td> -->
<%									
								//}
%>
							
						</tr>
						<input type="hidden" id="billDate" name="billDate<%=ii%>" value="<%=billDate[ii]%>">
						<input type="hidden" id="billNo" name="billNo<%=ii%>" value="<%=billNo[ii]%>">
						<input type="hidden" id="billDesc" name="billDesc<%=ii%>" value="<%=billDesc[ii]%>">
						<input type="hidden" id="billAmount" name="billAmount<%=ii%>" value="<%=billAmount[ii]%>">
						<input type="hidden" id="billAttachment" name="billAttachment<%=ii%>" value="<%=billAttachment[ii]%>">
						

							<input type="hidden" id="updateSavedBillsHid" name="updateSavedBillsHid<%=ii%>" value="<%=changedSavedBills%>">
							<input type="hidden" id="oldBillAttachmentName" name="oldBillAttachmentName<%=ii%>" value="<%=oldBillAttachmentName%>">
							<input type="hidden" id="newBillAttachmentName" name="newBillAttachmentName<%=ii%>" value="<%=newBillAttachmentName%>">

<%
					}	
				}
%>

						 <tr>
							<td class="normal" width="5%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
							<td class="normal"   width="20%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
							<td class="bold" width="20%"style="border-bottom:1px solid #E8E8E8">TOTAL</td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><span class="bold">Rs.&nbsp;<%=total%></span></td>
							<td class="normal" width="15%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
<%
if(actionNumber.equals("pre_req"))
{actionNumber = "sav_req";}
%>

			<tr>
				<td width="100%"align="center"colspan="7">
				<a href="javascript:validate('<%=actionNumber%>')"><img src="../images/but_saveAsDraft.gif"border="0"><a/>
				&nbsp;&nbsp;
				<a href="javascript:validate('sub_req','<%=todayDay%>')"><img src="../images/but_submit.gif"border="0"><a/>
				&nbsp;&nbsp;
				<a href="javascript:history.back()"><img src="../images/but_back.gif" border="0"></a>
				</td>
			</tr>
	</form>
	</table>

</body>
</html>