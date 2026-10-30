<!--<%--
 -- Comments....
 -- @author		Ashutosh Joshi
 -- @version 	1.00, May 2012.
 --%> -->

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>
<jsp:useBean id="listDomainObjectsController" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" />
<jsp:useBean id="groupwareWebController" class="com.bccl.groupware.web.controller.GroupwareWebController" /> 


<%

	ArrayList locationsList = new ArrayList();
	ArrayList companiesList = new ArrayList();
	ArrayList approversList = new ArrayList();
	ArrayList reviewersList = new ArrayList();
	ArrayList unitsList		= new ArrayList();
	Hashtable criteriaHash  = new Hashtable();

	locationsList	= listDomainObjectsController.listLocations(criteriaHash);
	companiesList   = groupwareWebController.getCompanyList();
	unitsList	    = GatepassController.getUnits();

	/*criteriaHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	criteriaHash.put("ROLECODE", "2");
	criteriaHash.put("WORKFLOWTYPE", "10");
	criteriaHash.put("COMPANYCODE", companyCode);
	criteriaHash.put("BRANCHCODE", branchCode);
	criteriaHash.put("LOCATIONCODE", locationCode);
	criteriaHash.put("DEPARTMENT", deptGroup);
	criteriaHash.put("STATUS", "A");

	//out.println(criteriaHash);

	reviewersList = GatepassController.getReviewers(criteriaHash);
	
	criteriaHash.remove("ROLECODE");
	criteriaHash.put("ROLECODE", "3");
	//out.println(criteriaHash);

	approversList = GatepassController.getApprovers(criteriaHash);

	//out.println(reviewersList.size());
	//out.println(approversList.size());*/

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Create Gatepass Request</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/calendarControl.css"rel="stylesheet">
<script src="../jscripts/calendarControl.js"language="javascript"></script>
<script src="../jscripts/common.js"language="javascript"></script>
<script src="../jscripts/util.js"language="javascript"></script>
<script src="../jscripts/jquery.js"language="javascript"></script>
<script src="../jscripts/addRows.js"language="javascript"></script>
<script src="../jscripts/createRequest.js"language="javascript"></script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url('../images/header_BG.jpg');
	background-repeat: repeat-x;
}
</style>
</head>

<form name="frmCreateInwordRequest" method="post">
<body onload ="showAll(0)">
<%@ include file="../includes/relatedLinks.jsp" %>
<table width="100%" border="0" cellpadding="0" cellspacing="0">

    <tr>
      <td colspan="100%" height="20px" bgcolor="#E7EAEF" class="budgetMenuBG">&nbsp;&nbsp;REQUEST GATEPASS</td>
    </tr>
    <tr>
      <td align="center" colspan="100%" height="10px" valign="middle">&nbsp;</td>
	</tr>   
</table>
<table border="0" cellspacing="2" cellpadding="0" width="100%" align="center">
          <tr>
           <td colspan="100%" height="40px" align="center" valign="middle" class="greyBG"><input type="radio" name="gatePassType" id="gatePassType" value="R" checked/>&nbsp;RETURNABLE GATE PASS&nbsp; | &nbsp; <input type="radio" name="gatePassType" id="gatePassType" value="N" />NON- RETURNABLE GATE PASS
             </td>
          </tr>

		 <tr class="normal">
            <td width="35%" align="right" valign="middle">VMS ReferenceID</td>
            <td width="3%" align="center" valign="middle"> : </td>
            <td width="62%" align="left" valign="middle"><input maxlength="50" size="30" name="vmsReferenceId" class="normal"/>
            <img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
         
          <tr class="normal">
            <td width="35%" align="right" valign="middle">Party's Name</td>
            <td width="3%" align="center" valign="middle"> : </td>
            <td width="62%" align="left" valign="middle"><input maxlength="60" size="30" name="partyName" class="normal"/>(Please put complete name of party)
            <img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
          <tr class="normal">
            <td align="right" valign="middle">Address</td>
            <td align="center" valign="middle"> : </td>
            <td align="left" valign="middle"><textarea rows="4" cols="30" name="partyAddress" class="normal"></textarea>
            (Max 200 chars)<img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
		  <tr>
            <td align="right" valign="middle" class="normal">Mobile No</td>
            <td align="center" valign="middle"> : </td>
            <td align="left" valign="bottom" class="normal"><input maxlength="12" size="30" name="mobileNumber" class="normal"/><img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
		<tr>
		  <td align="center" colspan="100%" height="10px" valign="middle">&nbsp;</td>
		</tr>   

          <tr class="normal">
            <td colspan="100%" valign="top">&nbsp;</td>
          </tr>
	</table>
	<table border="0" cellspacing="3" cellpadding="0" width="100%">
		<tr class="greyBG">
			<td width="1%" height="30">Sr.No.</td>
			<td width="15%">Purchase Order No.</td>
			<td width="13%">DC/Invoice</td>
			<td width="10%">Material Description</td>
			<td width="5%">UOM</td>
			<td width="5%">Quantity</td>
			<td width="10%">Location</td>
			<td width="10%">Department</td>
			<td width="10%">EmailID</td>
			<td width="5%">Pending Quantity</td>
			<td width="5%">Received Quantity</td>
			<td width="10%">Reason for taking the material</td>
		</tr>

<%
	int count = 5;
	for(int ii=0; ii< count; ii++){
%>
	<tr>
			<td height="30" class="normal" ><%=ii+1%></td>
			<td>
				<input maxlength="50" name="purchaseOrderNo" class="normal"/>
			</td>
			<td>
				<input maxlength="50" name="dcInvoice" class="normal"/>
			</td>
			<td>
				<input maxlength="50" name="materialDesc" class="normal" />
			</td>
			<td >
				<select name="uomId" class="normal">

<%
				for(int jj=0; jj< unitsList.size(); jj++){
				String tmpArr[] = (String[])unitsList.get(jj);
%>	
				<option value="<%=tmpArr[1]%>"><%=tmpArr[1]%></option>
<%
			}
%>
				</select>
			</td>
			<td>
				<input name="quantity" size ="5" class="normal"/>
			</td>
			<!-- <td>
				<select name="location" class="normal">
				<option value="0">Select Location</option>
<%
				for(int kk=0; kk< locationsList.size(); kk++){
		
				String tmpArr[] = (String[])locationsList.get(kk);
%>	
				<option value="<%//=tmpArr[8]%>"><%//=tmpArr[5]%></option>
<%
				}
%>
		</select>
		</td> -->

		 <td>
				<select name="companyCode" class="normal" onchange="showAll(1)">
				 <option value="0">Select a Company</option>
                   
<%
				for(int kk=0; kk< companiesList.size(); kk++){
		
				String tmpArr[] = (String[])companiesList.get(kk);
%>	
				<option value = "<%=tmpArr[0]%>"><%=tmpArr[1]%></option>
<%
	
	
				}
%>
		</select>
		</td> 

		<td>
			<div id="departments" style="height:30px;padding:1px;padding-top:1px;text-align:left;"> </div>
		</td>
		<td>
		    <div id="emailid" class="normal" > </div>
			
		</td>
		<td>
			<input  name="pendingQuan" class="normal" size ="5" />
		</td>
		<td>
			<input name="receivedQuan" class="normal" size ="5" />
		</td>
		<td>
			<input  name="remarks" class="normal"/>
		</td>
		</tr>



<%
	}
%>
	</table>


	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	  <td  align="center"><input type="button"  value="S U B M I T" onclick="javascript:validateRequest();">&nbsp;&nbsp;<input type="button" name="clear" value="R E S E T " onClick="javascript:reset();">
	  </td>

	  </tr>
	</table>
</form>
 </body>
</html>
