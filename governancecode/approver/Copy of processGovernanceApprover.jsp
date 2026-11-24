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
	String tOIdVal = (String) request.getParameter("tOIdVal");
	//System.out.println("----------------------------------");
	//System.out.println(tOIdVal);

	
	ArrayList userResult = new ArrayList(); 
	
	userResult = governanceApprover.viewUserDetails(tOIdVal);
	//out.println(tOIdVal);
	//System.out.println("userResult :" + userResult.size());
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
	
	String[] nameArr = (String [] )userResult.get(0);
	String userEmailid ="";
	String name ="";
	name = (String)nameArr[0];
	userEmailid = (String)nameArr[1];
%> 


<body>
<form name="frmSaveChklist" method = "post" action = "">


<%@ include file="../includes/headerMenu.jsp"%>
<table width="100%" height="59" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td height="17" colspan="6" align="center" valign="middle" class="style4"><div align="left" class="headCompliance">My Code Compliance | View Governance Code</div></td>
  </tr>
  <tr>
    <td height="17" colspan="3" align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> From  01-01-2011 to 31-12-2011 </span></div></td>
	<td width="72%" colspan="3" align="center" valign="middle" class="style1"><div align="right"></div></td>

  </tr>
</table>
<table width="100%" height="25" border="0" cellpadding="2" cellspacing="2">
	<tr>
	<td height="10" colspan="3" align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> Name: <%=name%> </span></div></td>
	<td height="10" colspan="3" align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> Email ID: <%=userEmailid%>  </span></div></td>
</tr>
</table>

<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">
<tr>   
	<td width="40%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">POLICY</td>
	<td width="12%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">FROM</td>
	<td width="12%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">TO</td>
    <td width="14%" height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">USERFEEDBACK</td>
    <td width="12%" height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">USERREMARKS</td>
    <!-- <td width="18%" align="left" valign="middle" bgcolor="#74CAD3"><span class="style1">APPROVER REMARKS(iF ANY)<img src="../image/remark_head.png" width="14" height="13" /></span></td> --> 
    <td width="10%" align="left" valign="middle" bgcolor="#74CAD3" class="style1"><img src="../image/attachment_head.gif" width="21" height="15" /></td>
  </tr>
  <%
	    
		String chkList ="";
		String userFeedback ="";
		String userRemarks ="";
		String userAttachment ="";
		String fromDate ="";
		String toDate ="";
		String approverRemarks ="";
		for(int i = 0; i< userResult.size(); i++)
			{
				 
				 String[] tmpArr = (String [] )userResult.get(i);
				 name = (String)tmpArr[0];
				 userEmailid = (String)tmpArr[1];
				 chkList = (String)tmpArr[2];
				 userFeedback = (String)tmpArr[3];
				 userRemarks = (String)tmpArr[4];
				 userAttachment = (String)tmpArr[5];
				 fromDate = (String)tmpArr[6];
				 toDate = (String)tmpArr[7];
				 approverRemarks = (String)tmpArr[8];
				 //String remarks = "remark"+i;
				 //String remarkopt = (String)tmpArr[6];
				 
				
%>
	<input type="hidden" name="tOIdVal" value="<%=tOIdVal%>">
	<tr>			
		<td bgcolor="#f8f8f8" width="40%" align="left" valign="middle" class="style3"><%=tmpArr[2]%> </td>
		<td bgcolor="#f8f8f8" width="8%" align="left" valign="middle" class="style3"><%=tmpArr[6]%> </td>
		<td bgcolor="#f8f8f8" width="8%" align="left" valign="middle" class="style3"><%=tmpArr[7]%> </td>
		<td bgcolor="#f8f8f8" width="14%" align="left" valign="middle" class="style3"><%=tmpArr[3]%> </td>
		<td bgcolor="#f8f8f8" width="16%" align="left" valign="middle" class="style3"><%=tmpArr[4]%> </td>
		<td bgcolor="#f8f8f8" width="14%" align="left" valign="middle" class="style3"><%=tmpArr[5]%> </td>
	</tr>
<%
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
<table width="100%"  >
  <tr colspan="100%">
  <td align = "centre" class="style3">Remarks: 
  <textarea name="approverRemarks" rows="3"  height="50" maxlength="255" ></textarea>
  </td>
  </tr>
</table>

<table width="100%" height="40" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td width="100%" height="17" colspan="4" align="center" valign="middle" bgcolor="#CBECEF" class="style4">
      <div align="center">
        <input type="button" name="Submit" value="Submit" onclick="submitFeedback()" >
		<input type="button" value="Back"  onclick="javascript:history.go(-1);">
</div></td>
  </tr>

</table>


</form>
</body>