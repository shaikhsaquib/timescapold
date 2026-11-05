<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
<%@ page language="java" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/headerMenu.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
<script src="../jscripts/approver.js" type="text/javascript"></script>
<script type="text/javascript" src="../jscripts/jquery.js"></script>
<link href="../style/popup.css" rel="stylesheet" type="text/css" />
</head>
<%

	String status = "'L','A','R'";
	ArrayList policyResult = new ArrayList();   
   
	Hashtable detailsHash = new Hashtable();

	detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId);

	policyResult = governanceadministrationcode.getSubordinateRequest(detailsHash);
%>

<body>
<div class="QTPopup" style="display:none">
	<div class="popupGrayBg"></div>
	<div class="QTPopupCntnr">
		<div class="gpBdrLeft">
			<div class="gpBdrRight">
				<a href="#" class="closeBtn" title="Close"></a>
				<div style="width:645px" id="msg"></div>
			</div>
		</div>
	</div>
</div>
<table width ="100%" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td>
			<%@ include file="../includes/menu.jsp" %>
		</td>
	<tr>
<table>
<form name="frmApproverAuthorise" method="post" >
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
		<td align="right" class="normal">In Process <img src="../images/inProcess.png" width="20" height="20"/>Approved <img src="../images/approved.png" width="20" height="20"/>Rejected<img src="../images/rejected.jpg" width="20" height="20" /></td>
  </tr>
</table>
<table width="99%" align="center" cellpadding="0" cellspacing="2" border="0">
   <tr class="travelMenuBG">
		<td width="2%"  height="29" align="left" valign="middle" >NO</td>
		<td width="40%"  height="29" align="left" valign="middle" colspan ="2" >&nbsp;&nbsp;USERS</td>
   </tr>
<%
String style2="style3";

if(policyResult.size()>0)
{
	//int rows= policyResult.size();
	for(int i=0; i<policyResult.size(); i++)
	{
		String[] resultData = (String[])policyResult.get(i); 

%>
   <tr bgcolor="#f6f6f6">
		<td align="left" valign="middle" bgcolor=""><%=i+1%></td>
		<td align="left" width="10%" valign="middle" height ="50%" class="<%=style2%>"> <!--&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/widraw.jpg" border="0" id ="delete" style="cursor:pointer;" onClick ="daleteUser(<%//=i%>,'<%//=resultData[0]%>');">&nbsp;&nbsp; --><%=resultData[1]%></td>
	    <td align="left" valign="middle" bgcolor="">
<input name="replaceuser<%=i%>" type="text" class="normal" id="replaceuser<%=i%>" style="width:245px;height:16px;" maxlength="50" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#"  onClick="javascript:addNewUser('R','replaceuser<%=i%>')" class="normalBig">Replace User</a>&nbsp;&nbsp;
<a href="#"  onClick="javascript:replacingUser(<%=i%>)" class ="normalBig">Submit</a>
  </tr> 
  <tr>
		<td colspan="100%" height="20px"></td>
  </tr>
<input type ="hidden" value ="<%=resultData[0]%>" name ="userId<%=i%>" id ="userId<%=i%>">
<input type="hidden"  value ="" name="OIdreplaceuser<%=i%>" id ="OIdreplaceuser<%=i%>">

<%
  }//end of for
%>

	<!-- <tr>  -->

<%
	
}//end of if for self

%> 
	
	<tr>
		<td align="left" valign="middle" bgcolor=""></td>
		<td align="left" valign="middle" bgcolor="">
		<input name="addUser" type="text" class="normal" id="addUser" style="width:245px;height:16px;" width = "5%" maxlength="50" value=""/>&nbsp;&nbsp;
    	<a href ="#" onClick="javascript:addNewUser('N')" class ="normalBig">&nbsp;&nbsp;Add New User </a>&nbsp;&nbsp;
		<td align="left" valign="middle" bgcolor="">
		<a href ="#" onClick="javascript:changeUser()" class ="normalBig">&nbsp;&nbsp;Submit </a>
		</td>
		</td>
	</tr>
	<tr>
		<td colspan="100%" height="20px"></td>
	</tr>
	 <tr>
		<td align="left" valign="middle" bgcolor=""></td>
   <!--     <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="Submit" value="Submit" align="center"  onclick="changeUser()"/></td> -->
	<!--	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="Submit" value="SubmitReplace" align="center"  onclick="replacingUser()"/></td> -->
	</tr>
 
</table>
</form>
</body>
</html>