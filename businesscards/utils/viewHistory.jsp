<%--
 -- Business Card views
 -- @(#)viewHistory.jsp	14/7/2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Amruta Gangan
 -- @version 	1.00, 21-NOV-2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%@ include file="../utils/statusHash.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar"%>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../utils/viewHistory.jsp");

%>

<html>
	<head>
		<title> B2E </title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		<script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript" src="../jscripts/common.js"></script>
	 </head>
 

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name="frmRequestCards" method="post">

<!-- include menu file -->
		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>

<%

	ArrayList requestDetailsLst = new ArrayList();

	String roleCode = (String)session.getAttribute("businessCardRole");

	requestDetailsLst = businessCardUserWebController.viewHistory(emailId,roleCode);

	int listSize = requestDetailsLst.size( );

%>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

			<tr>
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="20" align="center">
					VIEW HISTORY
				</td>
			</tr>

<%
			if (roleCode.equals("5")){
%>
			<tr height="20">
				<td bgcolor="#CCCCCC" class="boldsmall" width="20%" align="left">&nbsp;REQUESTOR NAME</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;CARD TEMPLATE</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="8%" align="left">&nbsp;CARDTYPE</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;QUANTITY</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="9%" align="left">&nbsp;CARD COST(Rs.)</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;APPLIED ON</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="15%" align="left">&nbsp;MODIFIED BY</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;MODIFIED ON</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="15%" align="left">&nbsp;REMARK</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="5%" align="left">&nbsp;STATUS&nbsp;</td>
			</tr>
<%
			}else{
%>
			<tr height="20">
				<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;REQUEST ID</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="20%" align="left">&nbsp;REQUESTOR NAME</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="5%" align="left">&nbsp;CARD TEMPLATE</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="5%" align="left">&nbsp;CARDTYPE</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="5%" align="left">&nbsp;QUANTITY</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="5%" align="left">&nbsp;CARD COST(Rs.)</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;APPLIED ON</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="15%" align="left">&nbsp;MODIFIED BY</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;MODIFIED ON</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="20%" align="left">&nbsp;REMARK</td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td bgcolor="#CCCCCC" class="boldsmall" width="5%" align="left">&nbsp;STATUS&nbsp;</td>
			</tr>

<%
			}
				if(listSize == 0){
%>
			<tr>
				<td colspan="100%" class="small" align="center" height="20">
					&nbsp;
				</td>
			</tr>

			<tr>
				<td colspan="100%" class="small" align="center" height="30">
					No request(s) for Business Cards to be displayed.<br><br>
				</td>
			</tr>
			<%
				} else {
			%>

				<%

					for(int ii=0; ii< listSize; ii++){
						String cardArr[ ] = (String[ ]) requestDetailsLst.get(ii);

//						String approvedDate = cardArr[14];
//						String reviewedDate = cardArr[17];
//						String processedDate = cardArr[20];

						String approverRemarks = cardArr[15];
						String reviewerRemarks = cardArr[18];
						String processorRemarks = cardArr[21];
						String remark = "-";

/*						if (cardArr[16].equals("timescape.admin@timesgroup.com"))
						{
							reviewedDate = "-";

							if (cardArr[19].equals("timescape.admin@timesgroup.com"))
							{
								processedDate = "-";
							}
							else
							{
								processedDate = cardArr[20];
							}
						}
						else if (cardArr[19].equals("timescape.admin@timesgroup.com"))
						{
							processedDate = "-";
						}


						if(cardArr[23].equals("L") || cardArr[23].equals("H")){
							remark = "-";
						}

						else if(cardArr[23].equals("HA")){
							remark = approverRemarks;//Approver remark
						}

						else if(cardArr[23].equals("A")){
							remark = (cardArr[16].equals("timescape.admin@timesgroup.com"))?approverRemarks:reviewerRemarks;//Approver remark/Reviewer remark
						}

						else if (cardArr[23].equals("P")){
							remark = processorRemarks;//Processer remark
						}
						else if (cardArr[23].equals("D") || cardArr[24].equals("C")){
							remark = "-";
						}
						else if (cardArr[23].equals("R"))
						{
							remark = (cardArr[16].equals("timescape.admin@timesgroup.com"))?approverRemarks:reviewerRemarks;
						}
*/

				%>
			<tr height="30">
<%
			if (!roleCode.equals("5")){
%>
				<td align="left" class="small">&nbsp;<a href="javascript:void window.open('../utils/requestDetails.jsp?id=<%=cardArr[0]%>','','resizable=yes,toolbars=no,scrollbars=yes,width=750,height=375,top=100,left=50')" class="underline"><%=cardArr[0]%></a></td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
<%
				}
%>
				<td align="left" class="small">&nbsp;<%=cardArr[1]%></td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td align="left">&nbsp;<a href="#" onclick="javascript:window.open('../utils/viewCardTemplate.jsp?id=<%=cardArr[0]%>','_blank','top=100, left=100, height=500, width=500, status=no, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" class="underline"><img src="../images/icon_vcard.gif" border="0"></a></td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td align="left" class="small">&nbsp;<%=cardArr[30]%></td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td align="left" class="small">&nbsp;<%=cardArr[11]%></td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td align="left" class="small">&nbsp;<%=cardArr[31]%></td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td align="left" class="small">&nbsp;<%=cardArr[12]%></td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td align="left" class="small">&nbsp;<%=(cardArr[23].equals("D"))?cardArr[29]:cardArr[27]%></td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td align="left" class="small">&nbsp;<%=cardArr[22]%></td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td align="left" class="small">&nbsp;<%=cardArr[28]%></td>
				<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
				<td align="left" class="small">&nbsp;<%=statusHash.get(cardArr[23])%></td>
			</tr>

			<%
				}
			}
			%>
			
		</table>

		</form>
	</body>
</html>