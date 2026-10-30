<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.Calendar, java.util.Date" %>


<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>


<%
	ArrayList requestsList = new ArrayList();
	Hashtable requestsHash = new Hashtable();

	requestsHash.put("REVIEWEDBY", timescapeUserOId+"");

	requestsList = GatepassController.getMyRequests(requestsHash);

//out.println(requestsList.size());

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View Requests</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/calendarControl.css"rel="stylesheet">
<script src="../jscripts/calendarControl.js"language="javascript"></script>
<script src="../jscripts/common.js"language="javascript"></script>
<script src="../jscripts/util.js"language="javascript"></script>
<script src="../jscripts/viewRequests.js"language="javascript"></script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/header_BG.jpg);
	background-repeat: repeat-x;
</style>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="44%"><img src="../images/gatePass.jpg" width="365" height="50" /></td>
    <td width="56%" valign="bottom"><img src="../images/related_links.png" width="18" height="18" /><span class="boldsmall">Related links&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="100%" bgcolor="#E7EAEF" class="budgetMenuBG">&nbsp;&nbsp;REVIEW REQUESTS</td>
    </tr>
    <tr>
      <td width="30%" align="center" valign="middle">      
      <td align="left" valign="middle" class="normal">Returnable :      
		<img src="../images/arrow_returnable1.png" width="20" height="19" /> | Non Returnable :      
        <img src="../images/arrow_nonreturnable.png" width="20" height="19" />  | Goods Returned :      
        <img src="../images/arrow_returnable.png" width="20" height="19" />
   |  Goods Partially Returned :      
        <img src="../images/arrow_partiallyReturned.png" width="20" height="19" />
   | Not Returned:      
        <img src="../images/arrow_notReturned.png" width="20" height="19" />
	  </td>
  </tr>
</table>
<table width="99%" border="0" bordercolor="#9999999" align="center" cellpadding="0" cellspacing="0">
    <tr>
		  <td colspan="100%" height="1px"><hr></td>
    </tr>
	<tr>
		<td colspan="100%" height="15px" class="boldsmall"><U>SEARCH REQUESTS BY</U> :</td>
	</tr>
    <tr>
		  <td colspan="100%" height="1px"><hr></td>
    </tr>
	<tr class="normal" align="left">
		<td width="3%" height="20px">&nbsp;</td>
		<td width="10%" align="left" valign="middle" class="normal">Gatepass ID :  </td>
		<td width="20%" align="left" valign="middle" class="normal"><input maxlength="60" size="15" name="gatepassId" onblur="javascript:validate();"/> </td>

		<td width="10%" align="left" valign="middle">From Date: </td>
		<td width="20%" align="left" valign="middle" class="normal"><input id="fromDate" readonly="readonly" size="15" name="fromDate" onfocus="showCalendarControl(this);"/></td>

		<td width="10%" align="left" valign="middle">To Date: </td><td width="20%" align="left" valign="middle" class="normal"><input id="toDate" readonly="readonly" size="15" name="toDate" onfocus="showCalendarControl(this);"/>
		</td>
	</tr>
    <tr>
		  <td colspan="100%" height="1px">&nbsp;</td>
    </tr>
	<tr class="normal" align="left">
		<td height="20px">&nbsp;</td>
		<td align="left" valign="middle" class="normal">Type :  </td>
		<td align="left" valign="middle">
			<select name="selectType" class="normal">
			<option value="0">Select Gatepass Type</option>
			<option value="0">Returnable Requests</option>
			<option value="0">Non-Returnable Requests</option>
			</select>
	</td>
		<td align="left" valign="middle" class="normal">Status :  </td>
		<td align="left" valign="middle" class="normal">
			<select name="status" class="normal">
			<option value="0">Select Status</option>
			<option value="UC">Pending for Approval</option>
			<option value="'AA','RA','PA','CL'">Processed</option>
			<option value="'UR','AR','RR','PR'">Rejected</option>
			<option value="'PA'">Not Returned Requests</option>
			</select>
		</td>

		<td align="left" valign="middle" class="normal">Department :  </td>
		<td align="left" valign="middle" class="normal">
			<select name="department" class="normal">
			<option value="0">Select Department</option>
			<option value="<%=deptGroup%>"><%=deptName%></option>
		</td>
		<td width="5%" height="20px"><input type="button" name="go" value="Submit"></td>
	</tr>
    <tr>
		  <td colspan="100%" height="1px"><hr></td>
    </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" class="normal">
<tr class="greyBG">
	<td width="11%" height="30px">Request ID </td>
	<td width="10%" align="left">Date </td>
	<td width="10%">Type </td>
	<td width="19%">Party Name </td>
	<td width="14%">Date Of Return</td>
	<td width="15%">Approver</td>
	<td width="13%">Reviewer</td>
	<td width="14%">Request Status</td>
</tr>
<tr>
	<td height="1" colspan="100%" bgcolor="#f8f8f8"><img src="../images/spacer.gif" width="1" height="1" /></td>
</tr>
<%

	if(requestsList.size()==0){
%>
	<tr>
		<td height="20" colspan="100%"><hr></td>
	</tr>
	<tr>
		<td height="30" align="center" valign="middle" class="bold" colspan="100%">There are no request(s) to view!!</td>
	</tr>
	<tr>
		<td height="20" colspan="100%"><hr></td>
	</tr>

<%
	}else{

		for(int ii=0; ii< requestsList.size(); ii++){

			String tmpArr[] = (String [])requestsList.get(ii);

%>	

	<tr>
		<td height="20px" align="left" valign="middle" class="normal"><a href="#" onclick="showDetails('<%=tmpArr[0]%>')" class="boldunderline"><%=tmpArr[0]%></a></td>
		<td align="left" valign="middle" class="normal"><%=tmpArr[12]%></td>
		<td align="left" valign="middle" class="normal"><img src="<%=statusImg.get(tmpArr[1])%>" border="0"></td>
		<td align="left" valign="middle" class="normal"><%=tmpArr[2]%></td>
		<td align="left" valign="middle" class="normal"><%=tmpArr[7]%></td>
		<td align="left" valign="middle" class="normal"><%=tmpArr[14]%></td>
		<td align="left" valign="middle" class="normal"><%=tmpArr[16].equals("0")? "-" : tmpArr[16]%></td>
		<td align="left" valign="middle" class="normal"><img src="<%=statusImg.get(tmpArr[25])%>" border="0"></td>
	</tr>

<%
		}
	}
%>