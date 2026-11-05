<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" %>
<%@page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar, java.util.Date, java.text.*" %>
<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>
<%@ include file="../includes/headerMenu.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<title>OCA Report</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
<link href="../style/ajaxDropDown.css" rel="stylesheet" type="text/css" />	
<script Language="JavaScript" src="../jscripts/report.js"></script>
<script src="../jscripts/ajaxDropDown.js"language="javascript"></script>
<script type="text/javascript" src="../jscripts/jquery.js"></script>
<link href="../style/popup.css" rel="stylesheet" type="text/css" />
<script  type="text/javascript" language="javascript">
$(document).ready(function(){
		$(".closeBtn").click(function(){			
			$(".QTPopup").css('display', 'none');
		})
})
</script>
</head>
<%

	ArrayList detailsList = new ArrayList();

	detailsList = governanceadministrationcode.getMyCurrentManager(timescapeUserOId);
	
	String approverName = "";
	
	if(detailsList.size() == 0)
	{
		 approverName="You dont have any approving authority, Kindly Create request for new Manager";
	}
	else
	{
       String[] resultData = (String[])detailsList.get(0); 
	   approverName=resultData[0];
	}

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
	<%@ include file="../includes/menu.jsp" %>
	<tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../user/allCheckStatus.jsp" class="style2">View History</a>  </div>
		</td>
  </tr>
<table>
 <form name="frmActivity" method = "post" action = "">
<table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr	class="travelMenuBG">
		<td width="20%" height="26" align="left" class="nav"><b>ACTIVITY : </b></td>
		<td width="" align="left" >Change Manager</td>
	</tr>
	<tr>
		<td width="20%" height="26" align="left" bgcolor="#FFFFFF" class="nav"></td>
		<td width="" align="left" bgcolor="#FFFFFF" class="underlineBig"></td>
	</tr>
	<tr bgcolor="#F8F8F8">
		<td width="20%" height="26" align="left" class="nav" >CURRENT MANAGER : </td>
		<td width="" align="left"><%=approverName%></td>
	</tr>
	<tr>
		<td colspan="100%" height="20px"></td>
	</tr>
	<tr bgcolor="#F8F8F8">
		<td width="20%" height="26" align="left" class="nav" >MANAGER NAME : </td>
		<td width="" align="left">
			<input name="projectname1" type="text" class="normal" id="inputString" style="width:245px;height:16px;" onkeyup="lookup(this, this.value ,'','approver');" onkeydown="lookup(this, this.value,'','approver');" maxlength="50" value="" />
			<div class="suggestionsBox" id="suggestions" style="display: none;">
			<div class="suggestionList" id="autoSuggestionsList"></div>
			</div>&nbsp;&nbsp;&nbsp;<span><a href ="javascript:void(0)" onClick="addUser()" id="addUser" class="underlineBig">Add Manager </a></span><span class="normal"> (If not exists in drop down)</span> 
		</td>
	</tr>
	<tr>
			<td colspan="100%" height="20px"></td>
	</tr>
	<tr bgcolor="#F8F8F8">
		<td width="20%" height="26" align="left" class="nav" >REMARKS : </td>
		<td align="left" class="normal"valign="middle" ><textarea rows="5" cols="30" class = "style3" name = "remarks" id ="remarks" style ="height:30px;width:160px;"></textarea></td>
	</tr>
	<tr>
		<td colspan="100%" height="20px"></td>
	</tr>
</table>

<table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td  width ="30%" height="1px" align="right"> </td>
		<td  height="1px" align="left"></td>
	</tr>
	<tr>
		<td  width ="30%" height="1px" align="right"> <input type="button" name="Submit" value="Submit"  align="center" onclick="change()"/> </td>
		<td  height="1px" align="left"> <input type="button" name="Back" value="Back"  align="center" onclick="javascript:history.back()"/> </td>
	</tr>
</table>
	<input type ="hidden" value ="<%=companyCode%>" name ="company" id ="companyCode">
	<input type ="hidden" value ="<%=approverName%>" name ="currentapproveremailid" id ="currentapproveremailid">
</form>
</body>
</html>