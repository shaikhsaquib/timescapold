<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" %>
<%@page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar, java.util.Date, java.text.*" %>
<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>
<%@ include file="../includes/headerMenu.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
 <link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
<script Language="JavaScript" src="../jscripts/approver.js"></script>
<script src="../jscripts/ajaxDropDown.js"language="javascript"></script>
<script type="text/javascript" src="../jscripts/jquery-1.3.2.min.js"></script>
</head>
<%

	String addUser = (String)request.getParameter("addUser");
//	String replaceuser = (String)request.getParameter("replaceuser");

	Hashtable detailsHash = new Hashtable();
	boolean updateFlag = false;

	detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	detailsHash.put("ADDUSER", addUser);
  //  detailsHash.put("REPLACEUSER", replaceuser);
	detailsHash.put("MODIFIEDBY", timescapeUserOId+"");
	detailsHash.put("STATUS", "A");


	updateFlag = governanceadministrationcode.addNewUserDetails(detailsHash);

if(updateFlag){
%>      
<body>
<p align="center" class="style4">Acknowledgement</p>
		<p align="center" class="style3">New User has been processed successfully. </p>
	<table width="100%" border="0" cellspacing="2" cellpadding="0">

		<tr bgcolor="#FFFFFF">
       <td colspan="3" align="center" class="normal">&nbsp;Click here to 
            <a href="approverAuthorise.jsp">Return</a>
       </td>
    </tr>

	</table>                   
<% 

}else{                

%>                   

<p align="center" class="style4">Error</p>
<p align="center" class="style3">There is an error while updating<span class="style4">  </span>. Please try again.</p>

<table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tr bgcolor="#FFFFFF">
       <td colspan="3" align="center" class="normal">&nbsp;
            <input type="button" name="Back" value="Back" onclick="javascript:history.back()">
       </td>
    </tr>

</table>
<%
}
%>
</body>
</html>
	
