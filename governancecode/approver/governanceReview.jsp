<%--
 -- Governance Code
 -- @(#)governanceReview.jsp	11/02/2011
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
 -- @version 	1.00, 11-FEB-2011
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<jsp:useBean id="governanceApprover" class="com.bccl.governancecode.web.controllerbeans.GovernanceAppWebController" />
<link href="../style/governance.css" rel="stylesheet" type="text/css" />

<%
	String requestorOID = "";
	requestorOID = (String)request.getParameter("timescapeuserOId");
		//out.println(requestorOID);

//String DPATH = EnvironmentProperties.getValue("policycompliance", "uploadPath");
%>
<html>
<!-- <script Language="JavaScript" src="../jscripts/savechklist.js"></script> -->

<head>
<%@ include file="../includes/headerMenu.jsp"%>

<body>
<form name="frmSaveChklist" method = "post" action = "">
 
<%
	ArrayList feedbackResult = new ArrayList(); 
	
	feedbackResult = governanceApprover.viewFeedback(timescapeUserOId,requestorOID);
	//out.println("feedbackResult :" + feedbackResult.size());
	
	//out.println(timescapeUserOId);
%>
<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">
<%
	if (feedbackResult.size() > 0){
%>
  <tr>
    <td width="6%" height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">No.</td>
    <td width="49%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">POLICY</td>
    <td width="15%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">COMPLIANCE ASSURED </td>
    <td width="18%" align="left" valign="middle" bgcolor="#74CAD3"><span class="style1">Remarks (iF ANY) <img src="../image/remark_head.png" width="14" height="13" /></span></td>
    <td width="12%" align="left" valign="middle" bgcolor="#74CAD3" class="style1"> ATTACHMENT<img src="../image/attachment_head.gif" width="21" height="15" /></td>
  </tr>

	<%
		
		for(int i = 0; i< feedbackResult.size(); i++)
			{
				 
				 //out.println("qqqqqqqqqqq" +timescapeuserOId);
				 String[] tmpArr = (String [] )feedbackResult.get(i);
				 String feedback = (String)tmpArr[2];
				 String remarks = "remark"+i;
				 String remarkopt = (String)tmpArr[6];
				 String userEmailid = "";
				 userEmailid = tmpArr[7];
					//out.println(userEmailid);
				 if (userEmailid.indexOf("@") > -1) {
                  userEmailid = userEmailid.substring(0, userEmailid.indexOf("@")); 
				 }
				
%>
		<input type="hidden" name="remarks<%=i%>" value="<%=tmpArr[6]%>"> 
		<tr>
			<td bgcolor="#f8f8f8" width="6%" align="left" valign="middle" class="style3"><%=tmpArr[0]%> </td>
			<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[1]%> </td>
			<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[2]%> </td>
			<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[3]%> </td>
			<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3">
<%		if(!tmpArr[4].equals("NA")){
				//System.out.println("eeeeee"+tmpArr[4]);
%>
		<a href="../common/download.jsp?f=D:/programs/Tomcat 5.5/webapps/timescape/logs/timescape/governancecodelogs/uploadedfiles/<%=userEmailid%>/<%=tmpArr[4]%>"><img src="../image/attachment.gif" border="0" title="Attachment"></a>&nbsp;/&nbsp;
<%   }else{
%>
       &nbsp;&nbsp;&nbsp;-&nbsp;/&nbsp;   
<%
	 }
%>
		</tr>

	<%

			}
			
	%>
	<%
}

	else 
	{


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
  <tr>
    <td width="100%" height="17" colspan="4" align="center" valign="middle" bgcolor="#CBECEF" class="style4">
      <div align="center">
        <input type="button" name="Back" value="Back" onclick = "javascript:history.back()">
</div></td>
  </tr>
</table>	
