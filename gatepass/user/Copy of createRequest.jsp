<!--<%--
 -- Comments....
 -- @author		Ashutosh Joshi, Kavita Yadav
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

<%

	ArrayList locationsList			= new ArrayList();
	ArrayList approversList			= new ArrayList();
	ArrayList reviewersList         = new ArrayList();
	ArrayList reviewersOptionalList = new ArrayList();
	ArrayList unitsList				= new ArrayList();
	Hashtable criteriaHash			= new Hashtable();

	locationsList = listDomainObjectsController.listLocations(criteriaHash);
	unitsList = GatepassController.getUnits();

	criteriaHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	criteriaHash.put("ROLECODE", "2");
	criteriaHash.put("WORKFLOWTYPE", "10");
	criteriaHash.put("COMPANYCODE", companyCode);
	criteriaHash.put("BRANCHCODE", branchCode);
	criteriaHash.put("LOCATIONCODE", locationCode);
	criteriaHash.put("DEPARTMENT", deptName);
	criteriaHash.put("STATUS", "A");

	//out.println(criteriaHash);

	reviewersList = GatepassController.getReviewers(criteriaHash);
	
	criteriaHash.remove("ROLECODE");
	criteriaHash.put("ROLECODE", "3");
	//out.println(criteriaHash);

	approversList = GatepassController.getApprovers(criteriaHash);

	reviewersOptionalList = GatepassController.getReviewersOptionList(branchCode,locationCode);

	//out.println(reviewersList.size());

	String tmpOptList[] = (String[])reviewersOptionalList.get(0);
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
<body onLoad="hideCols()">
<%
	
	String months[ ] ={"0","JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
	GregorianCalendar today = new GregorianCalendar();
	int todayDay = today.get(Calendar.DAY_OF_MONTH);
	//String  todayMon = String.valueOf(today.get(Calendar.MONTH)+1);
	String todayMon = months[today.get(Calendar.MONTH)+1];
	int  todayYear = today.get(Calendar.YEAR);

	String dayMonYear			= todayDay + "-" + todayMon + "-" + todayYear;
   
   // out.println("aaaadayMonYear=="+dayMonYear);

%>
<form name="frmCreateRequest" method="post">
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
           <td colspan="100%" height="40px" align="center" valign="middle" class="greyBG"><input type="radio" name="gatePassType" id="gatePassType" value="R" onclick="showMyCols();"/>&nbsp;RETURNABLE GATE PASS&nbsp; | &nbsp; <input type="radio" name="gatePassType" id="gatePassType" value="N" onclick="showMyCols();" checked/>NON- RETURNABLE GATE PASS
             </td>
          </tr>
		  </tr>
		   <tr class="normal">
            <td width="37%" align="right" valign="middle">GatePass Reference</td>
            <td width="3%" align="center" valign="middle"> : </td>
            <td width="60%" align="left" valign="middle"><input maxlength="20" size="20" name="gatepassReferenceNum" class="normal" value = "0"/><a href="#" onClick="getData()"><img src="../images/go_button.png" border="0" ><a/>
            </td>
          </tr>

		   <tr class="normal">
            <td width="37%" align="right" valign="middle">From Address</td>
            <td width="3%" align="center" valign="middle"> : </td>
           <td width="60%" align="left" valign="middle"><textarea rows="4" cols="30" name="fromAddress" class="normal"></textarea>
            (Max 200 chars)<img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
         <!--  <tr class="normal">
            <td height="41" colspan="2" align="right" valign="middle">Department</td>
            <td width="22%" align="left" valign="middle"><input maxlength="50" size="30" name="partyPersonName2" /></td>
            <td width="7%" align="left" valign="middle">Section/Vertical</td>
            <td width="40%" align="left" valign="middle"><input maxlength="50" size="30" name="partyPersonName3" /></td>
          </tr> -->
          <tr class="normal">
            <td width="37%" align="right" valign="middle">Party's Name</td>
            <td width="3%" align="center" valign="middle"> : </td>
            <td width="60%" align="left" valign="middle"><input maxlength="60" size="30" name="partyName" class="normal"/>(Please put complete name of party)
            <img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
          <tr class="normal">
            <td align="right" valign="middle">To Address</td>
            <td align="center" valign="middle"> : </td>
            <td align="left" valign="middle"><textarea rows="4" cols="30" name="partyAddress" class="normal"></textarea>
            (Max 200 chars)<img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
          <tr>
            <td align="right" valign="middle" class="normal">Represented By</td>
            <td align="center" valign="middle"> : </td>
            <td align="left" valign="bottom" class="normal"><input maxlength="50" size="30" name="partyPersonName" class="normal"/>(Name of Person)<img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
		  <tr>
            <td align="right" valign="middle" class="normal">Mobile No</td>
            <td align="center" valign="middle"> : </td>
            <td align="left" valign="bottom" class="normal"><input maxlength="12" size="30" name="mobileNumber" class="normal"/><img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
		  <tr>
            <td align="right" valign="middle" class="normal">Vehicle No</td>
            <td align="center" valign="middle"> : </td>
            <td align="left" valign="bottom" class="normal"><input maxlength="12" size="30" name="vehicleNumber" class="normal" value ="0"/></td>
          </tr>
		<tr>
		  <td align="center" colspan="100%" height="10px" valign="middle">&nbsp;</td>
		</tr>   
          <tr class="normal">
            <td colspan="100%" height="30" align="left" valign="middle" class="greyBG">MATERIAL DETAILS :</td>
          </tr>
          <tr>
            <td align="right" valign="middle" class="normal">Ownership</td>
            <td align="center" valign="middle" class="normal"> : </td>
            <td align="left" valign="middle"><select name="ownership" class="normal" onChange="showMyCols();">
              <option value="0">Select</option>
              <option value="Company's Own">Company's Own</option>
              <option value="Party's Own">Party's Own</option>
            </select>
            <img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
          <tr>
            <td align="right" valign="middle" class="normal">Item Category</td>
            <td align="center" valign="middle" class="normal"> : </td>
            <td align="left" valign="middle"><select name="itemCategory"  class="normal" onChange="showMyCols()">
              <option value="0">Select</option>
              <option value="Capital Item">Capital Item</option>
              <option value="Non-Capital Item">Non-capital Item</option>
            </select>
            <img src="../images/tick.png" width="20" height="20"/></td>
          </tr>
          <tr id="showThisDate" name="showThisDate" class="normal">
            <td align="right" valign="middle">Probable Date of Return</td>
            <td align="center" valign="middle"> : </td>
            <td align="left" valign="middle"><input id="returnDate" size="10" name="returnDate" class="normal"  onfocus="showCalendarControl(this);"/><img src="../images/tick.png" width="20" height="20" /></td>
            <!-- <img src="../images/calendar.png" width="26" height="26"/> -->
          </tr>
          <tr class="normal">
            <td align="right" valign="middle">Purchase Order / Job order No.</td>
            <td align="center" valign="middle"> : </td>
            <td align="left" valign="middle"><input maxlength="20" size="30" name="purchaseOrderJobNo" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Purchase Order / Job order Date : <input id="purchaseOrderDate" readonly="readonly" size="10" name="purchaseOrderDate" class="normal" onfocus="showCalendarControl(this);"/> 
			<!-- <img src="../images/calendar.png" width="26" height="26" /> --></td>
          </tr>
          <tr class="normal">
            <td colspan="100%" valign="top">&nbsp;</td>
          </tr>
	</table> 
	<table border="0" cellspacing="3" cellpadding="0" width="100%">
		<tr class="greyBG">
			<td width="1%" height="30">Sr.No.</td>
			<td width="15%">Material Description</td>
			<td width="4%">Serial No.</td>
			<td width="5%">Quantity</td>
			<td width="9%">UOM</td>
			<td id="showThis" name = "showThis" width="12%">Asset Transfer Note NO.</td>
			<td id="showThis" name = "showThis" width="10%">Asset Transfer Date</td>
			<td id="showThis" name = "showThis" width="18%">Location to be Transfered</td>
			<td width="26%">Reason for taking the material</td>
		</tr>
<%
int count = 5;
	for(int ii=0; ii< count; ii++){
%>
		<tr>
			<td height="30" align="center" class="normal"><%=ii+1%></td>
			<td><input maxlength="50" size="20" name="materialDesc" class="normal"/></td>
			<td><input maxlength="25" size="5"  name="serialNum" class="normal" value="0"/></td>
			<td>
				<input maxlength="10" size="5" name="quantity" class="normal"/>
			</td>
			<td>
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
			<td id="showThis" name = "showThis"><input maxlength="10" size="10" class="normal" name="transferNoteNo"/></td>
			<td id="showThis" name = "showThis"><input id="assetransferdate" readonly maxlength="38" size="10" class="normal" name="assetransferdate" onfocus="showCalendarControl(this);"/>
                    <!-- <img src="../images/calendar.png" width="26" height="26" /> --></td>
			<td id="showThis" name = "showThis">
			<select name="location" class="normal">
				<option value="0">Select Location</option>
<%
	for(int kk=0; kk< locationsList.size(); kk++){
		
		String tmpArr[] = (String[])locationsList.get(kk);
%>	
		<option value="<%=tmpArr[8]%>"><%=tmpArr[5]%></option>
<%
	}
%>
	</select>
</td>
			<td><input maxlength="100" size="40" name="remarks" class="normal"/></td>
		</tr>

<%
	}
%>
	 </table>
<table border="0" cellspacing="2" cellpadding="0" width="100%" align="center">
			<!--  <tr class="normal">
            <td colspan="100%" valign="top" align="right">&nbsp;<a href="javascript:addRow('dataTable')"><img src="../images/but_addMoreBills.gif" border="0"><a/></td>
          </tr> -->
          <tr class="normal">
            <td colspan="4" valign="top"><table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
              <tbody>
                <tr class="greyBG">
                  <td width="33%" height="30"><div align="left"><strong>&nbsp;&nbsp;REQUESTED BY</strong></div></td>
                 <td width="33%"><div align="left">RECOMMENDED/AUTHORISED BY</div></td>
				   <td valign="center" width="34%" align="middle"><div align="left">APPROVED BY  <img src="../images/tick.png" width="20" height="20" /></div></td>
                  </tr>
                <tr>
                  <td><div align="left">
                    <input maxlength="100" size="35" name="preparedBy" value="<%=emailId%>" readOnly/>
      
                    </div></td>
                  <td>
 			<select name="reviewedBy" class="normal">
                      <option value="0">Select Authority</option>
<%
	int mm;
	for(mm=0; mm< reviewersList.size(); mm++){
		
		String tmpArr[] = (String[])reviewersList.get(mm);
%>	
		<option value="<%=tmpArr[0]%>"><%=tmpArr[6]%></option>
<%
	}
%>
	</select>
   </td>
   <td>
   <div align="left">
 	<select name="authorisedBy" class="normal">
    <option value="0">Select Authority</option>

<%
	
	for(mm=0 ; mm< approversList.size(); mm++){
		
		String tmpArr[] = (String[])approversList.get(mm);
%>	
		<option value="<%=tmpArr[0]%>"><%=tmpArr[6]%></option>
<%
	}
%>
	</select>                  </td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
  <tr>
       <td colspan="4" valign="top">&nbsp;</td>
   </tr>
     </tbody>
  </table>        
  </table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td  align="center"><input type="button"  value="S U B M I T" onclick="javascript:validate();">&nbsp;&nbsp;<input type="button" name="clear" value="R E S E T " onClick="javascript:reset();">
  </td>

  </tr>
</table>
<input type="hidden" name="currentSysdate" value="<%=dayMonYear%>">
<input type="hidden" name="reviewerOptList" value="<%=tmpOptList[3]%>">
</form>

<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="45%" bgcolor="#F8F8F8"><img src="../images/gatePass_footer.jpg" width="351" height="25" /></td>
    <td width="55%" bgcolor="#F8F8F8"> <img src="../images/related_links.png" width="18" height="18" /><span class="boldsmall">Related links&nbsp;</span>&nbsp;&nbsp;&nbsp;</td>
	 

  </tr>
</table>
 -->
 </body>
</html>
