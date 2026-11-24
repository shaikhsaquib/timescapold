<%--
 -- Governance Code
 -- @(#)governanceApprover.jsp	11/02/2011
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
<jsp:useBean id="governanceApprover" class="com.bccl.governancecode.web.controllerbeans.GovernanceAppWebController" />

<%
	String questionPara = (String)request.getParameter("questionNo");
	session.setAttribute("question",questionPara);
	String userfdbk = (String)request.getParameter("userFeedback");
	String chkLst = (String)request.getParameter("checklist");
	//out.println(chkLst);
	//out.println(questionPara);
	String approverOId = Long.toString(timescapeUserOId); 
	int count = 0;

	GregorianCalendar thisDay = new GregorianCalendar( );

	String currYear = thisDay.get(Calendar.YEAR)+"";
	String prevYear = thisDay.get(Calendar.YEAR)-1+"";

%>
<%
	ArrayList userDetails = new ArrayList(); 
	userDetails = governanceApprover.viewUsers(questionPara, approverOId, prevYear, currYear);
	//out.println("userDetails :" + userDetails.size());
%>


<html>

	<head>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
			<title>Untitled Document</title>
			<link href="../style/governance.css" rel="stylesheet" type="text/css" />
		<style type="text/css">

			body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			}

		</style>
			<link href="../style/governance.css" rel="stylesheet" type="text/css" />
			<script Language="JavaScript" src="../jscripts/savechklist.js"></script>

	</head>

<%
	String roleIds = "";
	String isAttach="";
	String name = "";
	String userFeedback = "";
	String approverRemarks = "";
	String tOId = "";
	String tOIdVal = "";
	String nonCompliance = "";
	String overriddenRemarks = "";
	String isoverridden = "";
	String size = "";
    int flag= 0;
	int p=0;

%> 


	<body>
		<form name="frmSaveChklist" method = "post" action = "processGovernanceApprover.jsp">


			<%@ include file="../includes/headerMenu.jsp"%>
			<table width="100%" height="59" border="0" cellpadding="2" cellspacing="2">
			<!-- 	<tr>
					<td height="17" colspan="6" align="center" valign="middle" class="style4"><div align="left" class="headCompliance">My Code Compliance | View Governance Code</div></td>
				</tr> -->
				<tr>
					<td height="17" colspan="3" align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> From  01-04-2024 to 31-03-2025 </span></div></td>
					<td width="72%" colspan="3" align="center" valign="middle" class="style1"><div align="right">&nbsp;</div></td>
					</tr>
					<td bgcolor="#f8f8f8" class="style4" ><%=questionPara%></td>
					<td bgcolor="#f8f8f8" class="style4" width="90%" align="left"><%=chkLst%></td>
					<!-- <td width="50%" align="center" class> 
						<input type="button" value="Back" onclick="javascript:history.go(-1);" title="Click to go back without saving">&nbsp;&nbsp;				
						<input type="button" value="Submit" onclick="checkStatus()" title="Click to save the details">
				</td> -->

			</table>

			<table width="100%" border="0" cellpadding="1" cellspacing="0" bordercolor="#000000">
				<tr height="30px">
				<td width="20%"  align="left" valign="middle" bgcolor="#74CAD3" class="style1">TEAM MEMBER</td>
					<td width="10%"  align="left" valign="middle" bgcolor="#74CAD3" class="style1">USER FEEDBACK</td>
					<td width="10%"  align="left" valign="middle" bgcolor="#74CAD3" class="style1">APPROVER OVERRIDDEN STATUS</td>
					<td width="20%"  align="left" valign="middle" bgcolor="#74CAD3" class="style1">OVERRIDDEN REMARKS</td>
					<td width="25"  align="left" valign="middle" bgcolor="#74CAD3" class="style1" maxlength="255">USER REMARKS</td>
					<td width="15"  align="left" valign="middle" bgcolor="#74CAD3" class="style1">USER ATTACHMENT</td>
					
				</tr>

<%
    int size1 = userDetails.size();
    String size2 = Integer.toString(size1);
	session.setAttribute("size",size2);
  //  out.println( session.getAttribute("size"));
	String userAttachment = "";
	for(int i = 0; i< userDetails.size(); i++)
{
    
	String[] tmpArr = (String [] )userDetails.get(i);
	name = tmpArr[1];
	userFeedback = (String)tmpArr[3];
	//approverRemarks = (String)tmpArr[9];
	tOId = "tOId"+i;
	tOIdVal = (String)tmpArr[0];
	nonCompliance = (String)tmpArr[10];
	userAttachment = (String)tmpArr[11];
	overriddenRemarks = (String)tmpArr[14];
	isoverridden = (String)tmpArr[15];
	String userEmailid = tmpArr[6];

	//out.println(overriddenRemarks);
	if (userEmailid.indexOf("@") > -1) {
	userEmailid = userEmailid.substring(0, userEmailid.indexOf("@")); 
	}
count = count + 1;	//}
//out.println("tmpArr[15]=="+tmpArr[15]);
%>
				<tr>
					<input type="hidden" name = "tOId">
					<td width="45%" bgcolor="#f8f8f8" class="style3"><!-- <a href = "userDetails.jsp?tOIdVal=<%=tOIdVal%>"  class="style3"> --><%=tmpArr[1]%><!-- </a> --></td>
					<td width="20%" bgcolor="#f8f8f8" class="style3"><%=userFeedback%><%if(userFeedback.equals("YES")|| userFeedback.equals("NOT RATED")){flag=1;}else{flag=0;}%></td>
                    <td bgcolor="#f8f8f8" class="style3" ><%if(flag==0){if(tmpArr[15].equals("Yes")){p=1;%>
						YES<%}else{%><select name="<%="check"+i%>" class="style3">
											<!-- <option value="select">select</option> -->
											<option value="<%=tOIdVal+"N"%>">No</option>
											<option value="<%=tOIdVal+"Y"%>">Yes</option>
											</select><br><%/*count = count + 1;*/}}else{out.println("-");flag=1;}%>
                    <td bgcolor="#f8f8f8" class="style3">
						<%if(flag==0){if(p==0){%><textarea rows="2" cols="25" class="normal" name="<%="overriddenRemarks"+i%>"><%=overriddenRemarks%></textarea><%}else{out.println(tmpArr[14]);p=0;}}%>
						</td> 
					<td width="35%" bgcolor="#f8f8f8" class="style3"><%=tmpArr[4]%></td> 
					<!-- <td width="20%" bgcolor="#f8f8f8" class="style3"><%=tmpArr[10]%></td>  -->
					<td bgcolor="#f8f8f8">

<%		if(!tmpArr[11].equals("NA")){
%>
			<a href="../common/download.jsp?f=D:/programs/Tomcat 5.5/webapps/timescape/logs/timescape/governancecodelogs/uploadedfiles/<%=userEmailid%>/<%=tmpArr[11]%>"><img src="../image/attachment.gif" border="0" title="Attachment"></a>&nbsp;/&nbsp;
<%   }else{
%>
		&nbsp;&nbsp;&nbsp;-&nbsp;/&nbsp;   
<%
	}
%>
					</td>
			</tr>
<%
	}
%>
<%
                //if (!userFeedback.equals("YES") || (!userFeedback.equals("Yes"))) {
                if (!isoverridden.equals("Yes")) {
                //if (isoverridden.equals("NA") && (userFeedback==nonCompliance) ) {
%>
               <table width="100%" height="40" border="0" cellpadding="0" cellspacing="0" >
               <tr align="center">
                <td> 
                    <input type="button" value="Back" onclick="javascript:history.go(-1);" title="Click to go back without saving">&nbsp;&nbsp;				
                    <input type="button" value="Submit" onclick="checkStatus()" title="Click to save the details">
				</td>
                </tr>
                </table>
<% 
                } 
                //else if (isoverridden.equals("Yes") || isoverridden.equals("No") || isoverridden.equals("NA")) {
                else {
%>
             <table width="100%" height="40" border="0" cellpadding="0" cellspacing="0" >
               <tr align="center">
                 <td> 
                    <input type="button" value="Back" onclick="javascript:history.go(-1);" title="Click to go back without saving">&nbsp;&nbsp;		
                 <!-- <input type="button" value="Submit" onclick="checkStatus()" title="Click to save the details"> -->
				</td>
                </tr>
                </table>
<%
                }
%>
		</table>
		<p>&nbsp;</p>
		<input type="hidden" name="counter" value="<%=count%>">
		</form>
	</body>
</html>

