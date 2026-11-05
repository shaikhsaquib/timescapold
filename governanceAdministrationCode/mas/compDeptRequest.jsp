<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
<%@ page language="java" %>
<%@page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar, java.util.Date, java.text.*" %>
<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>

    <title>OCA Report</title>
	<%@ include file="../includes/headerMenu.jsp" %>
	<%@ include file="../includes/empHeader.jsp" %>
	<link href="../style/global.css" rel="stylesheet" type="text/css" />
	 <link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
	 <link href="../style/ajaxDropDown.css" rel="stylesheet" type="text/css" />	
    <script Language="JavaScript" src="../jscripts/mas.js"></script>
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
<form name="frmAdminRequest" method = "post" action = "">
<%@ include file="../includes/menu.jsp"%>
<%
 ArrayList companiesList = new ArrayList();
 companiesList   = governanceadministrationcode.getCompanyList();

 //out.println("companiesList-"+companiesList.size());
%>

  
   <table width="100%" border="0" cellpadding="1" cellspacing="1">
   <tr>
	<td align="left" height="5" colspan="2"></td>
	
	</tr>
   <tr class="travelMenuBG">
	<td width="20%" height="26" align="left"  bgcolor="#E9F3E8" class="nav" bgcolor="#E9F3E8">ACTIVITY : </td>
		<td width="80%" align="left" class="underlineBig" bgcolor="#E9F3E8" >SELECT APPROVER COMPANY NAME
		</td>
	</tr>
	<!-- <tr>
	<td><div align="left" class="style3"><a href="../common/checkStatus.jsp?frequency=ALL" class="style4">View History</a></div></td>
	</tr>
		<tr> -->
	<tr>	
	<td width="20%" height="26" align="left" bgcolor="#FFFFFF" class="nav"></td>
	<td width="80%" align="left" bgcolor="#FFFFFF" class="underlineBig" ></td>
	</tr>
		
		
	<tr bgcolor="#F8F8F8">
		<td width="20%" height="26" align="left" class="nav" >COMPANY NAME : </td>
			<td width="80%" align="left" >
						<select name="compCode" class="normal" onchange="showAll(1)">
						 <option value="0">Select a Company</option>
						   
<%						for (int ii=0; ii<companiesList.size(); ii++){
				
				String companyArr[] = (String[])companiesList.get(ii);
%>
					<option value = "<%=companyArr[0]%>|<%=companyArr[1]%>"><%=companyArr[1]%></option>
<%
		    }
%>  
				</select>  
				</td>
			</td>
	<tr>	
		<td width="20%" height="26" align="left" bgcolor="#FFFFFF" class="nav"></td>
		<td width="80%" align="left" bgcolor="#FFFFFF" class="underlineBig" >
		</td>
	</tr>
	 <tr bgcolor="#F8F8F8">
		<td width="20%" height="26" align="left" class="nav" >DEPARTMENT NAME : </td>
		<td class="normal" align="left" width="80%">
			<div id="departments" style="height:30px;padding:1px;padding-bottom:1px;text-align:left;"></div> 
		</td>
		
		
	</tr>
		<tr>
		<td colspan="100%" height="20px"></td>
		</tr>
		
	</table>
	
	<table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr><td  width ="30%" height="1px" align="right" colspan="3"> </td>
	</tr>
	</table>
<!-- 	<div id="details"></div>  -->

	<table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td  width ="30%" height="1px" align="center"> <input type="button" name="Submit" value="Submit"  align="center" onclick="subDetails()"/> </td>
		<!-- <td  height="1px" align="left"> <input type="button" name="Back" value="Back"  align="center" onclick="javascript:history.back()"/> </td> -->
	</tr>
	</table>

		<input type ="hidden" value ="<%=companyCode%>" name ="company" id ="companyCode">
</body>
</html>