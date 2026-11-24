<%--
 -- Governance Code
 -- @(#)governanceCode.jsp	07/11/2010
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Nitin Sharma
 -- @version 	1.00, 07-NOV-2010
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>
<jsp:useBean id="governanceController" class="com.bccl.governancecode.web.controllerbeans.GovernanceWebController" />

<%
	String toDate = "";
	 String status = "";
	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
    //out.println("companyCode----"+companyCode);
    String dateRangeHeader = (String)EnvironmentProperties.getValue("governancecode", "daterangeheader");
	GregorianCalendar thisDay = new GregorianCalendar( );
	String currDate = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
	String currYear = thisDay.get(Calendar.YEAR)+"";
	String prevYear = thisDay.get(Calendar.YEAR)-1+"";
	//String prevYear = "2013"; 
	//String roleCode = "1";
  
	if(currDate.length() == 1){
			currDate = "0" + currDate;
	}

	currDate =  currDate + "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);

	ArrayList governanceResult = new ArrayList(); 
	
	governanceResult = governanceController.viewChklist(timescapeUserOId, prevYear, currYear);
//	out.println("governanceResult :" + governanceResult.size());

	session.setAttribute("currLink", "../requestor/governaceCode.jsp");
	session.setAttribute("leftLink", "0");
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/savechklist.js"></script>

</head>

<%
	 String roleIds = "";
	 String isAttach="";
	 String flag ="";
%> 

<body>
<form name="frmSaveChklist" method = "post" action = "">

<input type="hidden" name="size" value="<%=governanceResult.size()%>">

<%@ include file="../includes/headerMenu.jsp"%>

<table width="100%" height="59" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td colspan="20" >
		<%@ include file="../includes/governanceCodeMenu.jsp"%>
	</td>
</tr>
  
  <tr>
    <!-- <td height="17" colspan="20"  align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> <%=dateRangeHeader%> </span></div></td> -->
    <td height="17" colspan="20"  align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> From  01-04-2024 to 31-03-2025 </span></div></td>
   
  </tr>
</table>

<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">
<%
	if (governanceResult.size() > 0){


%>
  <tr>
    <td width="6%"	 height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">No.</td>
    <td width="49%"  height="26"  align="left" valign="middle" bgcolor="#74CAD3" class="style1">POLICY</td>
    <td width="15%"  height="26"  align="left" valign="middle" bgcolor="#74CAD3" class="style1">COMPLIANCE ASSURED </td>
    <td width="18%"  height="26"  align="left" valign="middle" bgcolor="#74CAD3"><span class="style1">Remarks (iF ANY) <img src="../image/remark_head.png" width="14" height="13" /></span></td>
    <td width="12%"  height="26"  align="left" valign="middle" bgcolor="#74CAD3" class="style1"> ADD<img src="../image/attachment_head.gif" width="21" height="15" /></td>
  </tr>

	<%
		String policyHeader = "";
		for(int i = 0; i< governanceResult.size(); i++) {
			
			
				 
			String feedBackOptions = "feedBackOptions"+i;
			//out.println(feedBackOpt+i);
			String remarks = "remark"+i;
			String attachment="";
			String userAttachment = "userAttachment"+i;
			String[] tmpArr = (String [] )governanceResult.get(i);
			
			roleIds = tmpArr[5];
			String feedbackopt = (String)tmpArr[2];
			String remarkopt = (String)(tmpArr[3].equals("NA")? "" : tmpArr[3]);
			isAttach = (String)tmpArr[8];
			
			//String UserAttach = (String)tmpArr[4];
			//out.println(tmpArr[9]);

			if (isAttach.equals("YES"))
			{
			attachment ="<a href=\"javascript:void window.open('../upload/uploadFile.jsp?attachNo="+i+"','','resizable=yes,scrollbars=no,toolbars=no,status=yes,width=350,height=150,top=0,left=0')\" ><img src=\"../image/attachment.gif\" border=\"0\"></a>";
			}

			

			if (!policyHeader.equals(tmpArr[10].trim())) {
				
				policyHeader = tmpArr[10].trim();
				//out.println(policyHeader);
%>
				<tr>
					<td bgcolor="#C0C0C0"  height = "30" width="15%" align="left" valign="middle" class="style2" colspan = "100%"> <b><%=policyHeader%></b></td>
				</tr>
<%
			}

					
	%>		
	
			 
			<!-- <input type="hidden" name="feedBackOptions<%=i%>" value="<%=tmpArr[2]%>">  -->
			<!-- <input type="hidden" name="remarks<%=i%>" value="<%=tmpArr[3]%>">  -->
			<!-- <input type="hidden" name="isAttach" value="<%=tmpArr[8]%>"> -->
			<input type="hidden" name="feedbackid<%=i%>" value="<%=tmpArr[7]%>">
			<input type="hidden" name="questionno<%=i%>" value="<%=tmpArr[0]%>">
			<input type="hidden" name="checklist<%=i%>" value="<%=tmpArr[1]%>">
			<input type="hidden" name="timescapeUserOId<%=i%>" value="<%=timescapeUserOId%>">
			<input type="hidden" name="userAttachment<%=i%>" value="<%=tmpArr[4]%>"> 
			<input type="hidden" name="noncompliancetext<%=i%>" value="<%=tmpArr[11]%>"> 
				
			<% 
				//out.println("ttttttttttttttttttt"+tmpArr[9]);
				

					flag = "i";
			%> 
		
		<tr>
			<td bgcolor="#f8f8f8" width="6%" align="left" valign="middle" class="style3"><%=i+1%> </td>
			<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[1]%> </td>
			<td bgcolor="#f8f8f8" width="12%" align="left" valign="middle" class="normal">
			<%@ include file="../includes/feedbackOptions.jsp"%>
 			</td>
			
			<td bgcolor="#f8f8f8" width="15%" align="center" valign="middle" class="style3">
			<%@ include file="../includes/remark.jsp"%>
			<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=attachment%> </td>
			 
		</tr>
	<%
							
				
				 status = tmpArr[9];
             toDate = tmpArr[13];
			}

			

		}

%>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


	


<table width="100%" height="40" border="0" cellpadding="2" cellspacing="2">


<%@ include file = "../includes/checkRequestorDate.jsp"%>


</table> 
<p>&nbsp;</p>
</body>
</html>
