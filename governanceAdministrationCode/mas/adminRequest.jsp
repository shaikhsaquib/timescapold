<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" %>
<%@page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar, java.util.Date, java.text.*" %>
<%@ page import="com.bccl.util.Utility" %>

<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>
<%@ include file="../includes/headerMenu.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<title>OCA Report</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
<link href="../style/ajaxDropDown.css" rel="stylesheet" type="text/css" />	
<script Language="JavaScript" src="../jscripts/mas.js"></script>
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

 <form name="frmadminReq" method = "post" action = "">
  <table width ="100%" border="0" cellpadding="1" cellspacing="1">
	<%@ include file="../includes/menu.jsp" %>
<table>
<%
	String companyCode1 = (String)request.getParameter("companyCode");

	String deptCode = (String)request.getParameter("deptCode");

	//out.println("companyCode1--"+companyCode1+"--deptCode--deptCode"+deptCode);

	String compCode1 ="";
	String companyName1 ="";
	String deptCode1 ="";
	String deptName1 ="";

	compCode1 = companyCode1.substring(0,companyCode1.indexOf("|"));

	companyName1 = companyCode1.substring(companyCode1.indexOf("|")+1);

	//companyName1 = Utility.replaceQuoteOracle(companyName1);

	if(compCode1.equals("1000"))
	{
		companyName1 = "BENNETT, COLEMAN & CO. LTD.";
		deptCode1 = deptCode.substring(0,deptCode.indexOf("|"));

		deptName1 = deptCode.substring(deptCode.indexOf("|")+1);

	}else
	{
		 deptCode1 ="NA";
	     deptName1 ="NA";
		
	}

	Hashtable detailsHas = new Hashtable();
	detailsHas.put("COMPCODE1",compCode1);
	detailsHas.put("DEPTCODE1",deptCode1);

	ArrayList apprList = new ArrayList();
	apprList = governanceadministrationcode.getApproverDetails(detailsHas);

%>

<table width="100%" border="0" cellpadding="1" cellspacing="1">
   <tr>
	<td align="left" height="5" colspan="3"></td>
	</tr>
   <tr	class="travelMenuBG">
	<td width="15%" height="26" align="left"  bgcolor="#E9F3E8" class="nav" >COMAPNYNAME </td>
		<td width="15%" align="left" class="nav" bgcolor="#E9F3E8">DEPARTMENT</td>
		<td width="30%" align="left" class="nav" bgcolor="#E9F3E8">EXISTING APPROVER</td>
		<td width="30%" align="left" class="nav" bgcolor="#E9F3E8">NEW APPROVER</td>
		<td width="10%" align="left" class="nav" bgcolor="#E9F3E8">ACTION</td>
	</tr>
<%
	for (int ii=0; ii<apprList.size(); ii++)
	{
	
	String approverArr[] = (String[])apprList.get(ii);
%>
	
	<tr>
	<td width="15%" height="26" align="left"  class="normal" ><%=companyName1%> </td>
	

	<td width="15%" align="left" class="normal"><%=deptName1%></td>


	<td width="30%" align="left" class="normal" ><%=approverArr[4]%></td>
	<td width="30%" align="left" class="normal" >
	<input type="text" name = "inputString" id = "inputString" onClick="javascript:addUser();" size="35" ></td>
	<td width="10%" align="left" ><span><a href="javascript:void(0)" onClick="replaceAppr()"  class="underlineBig">REPLACE</a></span></td>
	</tr>

	<input type ="hidden" value ="<%=compCode1%>" name ="compCode1" id ="compCode1">
	<input type ="hidden" value ="<%=approverArr[4]%>" name ="existAppr" id ="existAppr">
	<input type ="hidden" value ="<%=deptCode1%>" name ="deptCode1" id ="deptCode1">

			
<% 

	}
%>
</table>

<%
 
if(apprList.size()==0){
%>
	<table width="100%" border="0" cellpadding="1" cellspacing="1">
   <tr>
		<td height="30" align="center" valign="middle" class="bold" colspan="100%">There are no data to view!!</td>
   </tr>
   </table>

<%	
	}//end of else
%> 



</form>
<body>