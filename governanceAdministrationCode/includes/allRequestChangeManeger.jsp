<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" %>
<%@page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar, java.util.Date, java.text.*" %>
<jsp:useBean id="governanceadministration" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>

    <title>OCA Report</title>
	<%@ include file="../includes/headerMenu.jsp" %>
	<%@ include file="../includes/empHeader.jsp" %>
	 <link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
	 <link href="../style/ajaxDropDown.css" rel="stylesheet" type="text/css" />	
    <script Language="JavaScript" src="../jscripts/report.js"></script>
	<script src="../jscripts/ajaxDropDown.js"language="javascript"></script>
	<script type="text/javascript" src="../jscripts/jquery-1.3.2.min.js"></script>
	

 </head>

<body>
   <form name="frmActivity" method = "post" action = "">
   <table width="100%" border="0" cellpadding="1" cellspacing="1">
	<td width="20%" height="26" align="left" bgcolor="#FFFFFF" class="nav">Select Activity : </td>
		<td width="" align="left" bgcolor="#FFFFFF" class="underlineBig">Change manager for all Questions
			</td>
		</tr>
		<tr>
		
		<td width="20%" height="26" align="left" bgcolor="#FFFFFF" class="nav"></td>
			<td width="" align="left" bgcolor="#FFFFFF" class="underlineBig">
			</td>
		</tr>
		
		
	<tr>
		<td width="20%" height="26" align="left" bgcolor="#FFFFFF" class="nav">Manager Name:</td>
			<td width="" align="left" bgcolor="#FFFFFF" class="underlineBig">
				<input name="projectname1" type="text" class="normal" id="inputString" style="width:245px;height:16px;" onkeyup="lookup(this, this.value ,'');" onkeydown="lookup(this, this.value,'');" maxlength="50" value="" />
				<div class="suggestionsBox" id="suggestions" style="display: none;">
					<div class="suggestionList" id="autoSuggestionsList"></div>
				</div>
			</td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td  width ="30%" height="1px" align="right"> </td>
		<td  height="1px" align="left"></td>
	</tr>
	<tr>
		<td  width ="30%" height="1px" align="right"> <input type="button" name="Submit" value="Submit"  align="center" onclick="change()"/> </td>
		<td  height="1px" align="left"> <input type="button" name="Submit" value="Submit"  align="center" onclick="validate()"/> </td>
	</tr>
	</table>
		<input type ="hidden" value ="<%=companyCode%>" name ="company" id ="companyCode">
</body>
</html>