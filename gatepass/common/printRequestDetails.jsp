<!--<%--
 -- Comments....
 -- @author		Kavita Yadav
 -- @version 	1.00, May 2012.
 --%> -->

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>
<script src="../jscripts/viewRequests.js"language="javascript"></script>
<script src="../jscripts/common.js"language="javascript"></script>
<%


	ArrayList requestsList = new ArrayList();
	ArrayList requestDetailsList = new ArrayList();
	Hashtable requestsHash = new Hashtable();

	
	String gatepassId = (String)request.getParameter("gatepassId");
	String createdBy = (String)request.getParameter("createdBy");
	String pageName = (String)request.getParameter("pageName");
	String reqType = (String)request.getParameter("type");

	String accept = "";
	String reject = "";
	
	if(pageName.equals("user")){
	
		reject = "UR";

	}else if(pageName.equals("reviewer")){

		accept = "RA";
		reject = "RR";

	}else if(pageName.equals("approver")){

		accept = "AA";
		reject = "AR";

	}else if(pageName.equals("processor")){

		accept = "PA";
		reject = "PR";
	} 

	//out.println(pageName);
	requestsHash.put("GATEPASSID",gatepassId);
	requestsHash.put("CREATEDBY",createdBy);
	requestsHash.put("REQTYPE",reqType);

	requestsList = GatepassController.getMyRequests(requestsHash);
	requestDetailsList = GatepassController.getGatepassDetails(gatepassId,reqType);

	//out.println(requestDetailsList.size());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Request Details</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/calendarControl.css"rel="stylesheet">
<script src="../jscripts/calendarControl.js"language="javascript"></script>
<script src="../jscripts/common.js"language="javascript"></script>
<script src="../jscripts/util.js"language="javascript"></script>
<script src="../jscripts/addRows.js"language="javascript"></script>
<script src="../jscripts/createRequest.js"language="javascript"></script>


</head>
<body onload="printNClose();">
<form name="frmViewRequests" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	
	<tr>
      <td colspan="100%" height="20px" bgcolor="#E7EAEF" class="budgetMenuBG">&nbsp;&nbsp;REQUEST DETAILS</td>
	</tr>
</table>
<%

	if(requestsList.size()==0){
%>
	<tr>
		<td height="20" colspan="100%"><hr></td>
	</tr>
	<tr>
		<td height="30" align="center" valign="middle" class="bold" colspan="100%">There are no details to view!!</td>
	</tr>
	<tr>
		<td height="20" colspan="100%"><hr></td>
	</tr>

<%
	}else{

		//for(int ii=0; ii< requestsList.size(); ii++){

			String tmpArr[] = (String [])requestsList.get(0);

			String preparedBy = tmpArr[11];
			String type = tmpArr[1];
			String authorisedBy = "-";
			String reviewedBy = "-";
			String printedBy = "-";
			String status = (String)statusHash.get(tmpArr[25]);

			if("AA".equals(tmpArr[25])|| "AR".equals(tmpArr[25]) || "PA".equals(tmpArr[25]) || "PR".equals(tmpArr[25]) || "CL".equals(tmpArr[25])){
				
				authorisedBy = tmpArr[14];
			}

			if("RA".equals(tmpArr[25])|| "RR".equals(tmpArr[25]) || "AA".equals(tmpArr[25])|| "AR".equals(tmpArr[25]) || "PA".equals(tmpArr[25]) || "PR".equals(tmpArr[25]) || "CL".equals(tmpArr[25])){
				
				reviewedBy = tmpArr[16].equals("0")? "-" : tmpArr[17];
			}

			if("PA".equals(tmpArr[25]) || "PR".equals(tmpArr[25]) || "CL".equals(tmpArr[25])){
				
				printedBy = tmpArr[19].equals("0")? "-" : tmpArr[20];
			}
%>	
<table border="0" cellspacing="2" cellpadding="0" width="100%" align="center">
		  
		  <tr>
		  <td height="25px" align="right" class="bold" valign="middle"></td>
		  <td align="center" class="bold" valign="middle"></td>
		  <td align="left" valign="middle" class="normal"><img src="../images/TOIlogo.jpg" width="60" height="50" /></td>
		  </tr>
		  <tr>
            <td height="25px" align="right" class="bold" valign="middle"> </td>
            <td align="center" class="bold" valign="middle"> </td>
            <td align="left" valign="middle" class="bold"><%=statusHash.get(tmpArr[1])%> Gatepass</td>

			<td height="25px" align="right" class="bold" valign="middle">Date</td>
		    <td align="center" class="bold" valign="middle"> : </td>
		    <td align="left" valign="middle" class="normal"><%=tmpArr[21]%></td>
          </tr>
<%
		if (!(tmpArr[26].equals ("FOURTH ESTATE LTD") || tmpArr[26].equals ("FORTH ESTATE LIMITED")) ){
%>
		   <tr>
		  <td height="25px" align="right" class="bold" valign="middle">Company Name</td>
		  <td align="center" class="bold" valign="middle"> : </td>
		  <td align="left" valign="middle" class="normal"><%=tmpArr[26]%></td>
		  </tr>
		  <tr>
            <td width="40%" height="25px" align="right" class="bold" valign="middle"></td>
            <td width="3%" align="center" class="bold" valign="middle"> </td> 
            <td align="left" valign="middle" class="normal" class="normal"> <%=tmpArr[27]%> <br> <%=tmpArr[28]%></td>
          </tr>
<%
		  }
%>
		   <tr>
		  <td align="center" class="greyBG" colspan="100%" height="10px" valign="middle">&nbsp;</td>
		</tr>   

		  <tr>
            <td width="40%" height="25px" align="right" class="bold" valign="middle">Gatepass ID</td>
            <td width="3%" align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal" class="normal"><%=tmpArr[0]%></td>
          </tr>
          <tr>
            <td height="25px" align="right" class="bold" valign="middle">Party's Name</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[2]%></td>
          </tr>
          <tr class="normal">
            <td height="25px" align="right" class="bold" valign="middle">From Address</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[33]%></td>
          </tr>
		  <tr class="normal">
            <td height="25px" align="right" class="bold" valign="middle">To Address</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[3]%></td>
          </tr>
          <tr>
            <td height="25px" align="right" class="bold" valign="middle" class="normal">Represented By</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[4]%></td>
          </tr>
		  <tr>
            <td height="25px" align="right" class="bold" valign="middle" class="normal">SAP Number</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[34]%></td>
          </tr>
		  <tr>
            <td height="25px" align="right" class="bold" valign="middle" class="normal">Mobile No</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[32]%></td>
          </tr>
		 <tr>
            <td height="25px" align="right" class="bold" valign="middle" class="normal">Vehicle No</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[35]%></td>
         </tr>
		<tr>
		  <td align="center" class="bold" colspan="100%" height="10px" valign="middle">&nbsp;</td>
		</tr>   
          <tr class="normal">
            <td colspan="100%" height="30" align="left" valign="middle" class="greyBG">MATERIAL DETAILS :</td>
          </tr>
          <tr class="normal">
            <td height="25px" align="right" class="bold" valign="middle">Ownership</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[5]%></td>
          </tr>
          <tr class="normal">
            <td height="25px" align="right" class="bold" valign="middle">Item Category</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[6]%></td>
          </tr>
<%
	if(tmpArr[1].equals("R")){
%>
          <tr id="showThisDate" name="showThisDate" class="normal">
            <td height="25px" align="right" class="bold" valign="middle">Probable Date of Return</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[7]%></td>
          </tr>
<%
	}
	if(!tmpArr[8].equals("")){
%>
          <tr class="normal">
            <td height="25px" align="right" class="bold" valign="middle">Purchase Order / Job order No.</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[8]%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="bold">Date :</span> &nbsp;&nbsp;<%=tmpArr[9]%></td>
          </tr>
         <!--  <tr class="normal">
            <td height="25px" align="right" class="bold" valign="middle">Purchase Order / Job order Date</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%//=tmpArr[9]%></td>
          </tr> -->
<%
	}
%>
          <tr class="normal">
            <td colspan="100%" valign="top">&nbsp;</td>
          </tr>
	</table>
			 
<%
		//}//end of for
%>
	<table border="1" cellspacing="0" cellpadding="0" width="100%">
		<tr class="greyBG">
			<td width="1%" height="30">Sr.No.</td>
			<td width="19%">Material Description</td>
			<td width="13%">Serial no. </td>
			<td width="6%">Quantity</td>
			<td width="6%">UOM</td>
			<td width="11%">Asset Transfer Note NO.</td>
			<td width="11%">Asset Transfer Date</td>
			<td width="15%">Location</td>
			<td width="18%">Remarks/Reason for taking the material</td>
		</tr>
<%
// Details Display part starts here 

		for(int ii=0; ii< requestDetailsList.size(); ii++){

			String tmpDetArr[] = (String [])requestDetailsList.get(ii);

	
%>
		<tr class="normal">
			<td height="30" align="center" class="normal"><%=ii+1%></td>
			<td><%=tmpDetArr[3]%></td>
			<td><%=tmpDetArr[12]%></td>
			<td><%=tmpDetArr[4]%></td>
			<td><%=tmpDetArr[5]%></td>
			<td><%=tmpDetArr[6]%></td>
			<td> <%=tmpDetArr[7]%></td>
			<td><%=tmpDetArr[2].indexOf("-")>-1?tmpDetArr[2].substring(tmpDetArr[2].indexOf("-")+1).trim():tmpDetArr[2]%></td>
			<td><%=tmpDetArr[8]%></td>
		</tr>


<%
		}
%>

 </table>
<table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
<tr class="normal">
	<td colspan="100%" valign="top">&nbsp;</td>
</tr>
<tr class="greyBG">
	<td width="20%" height="30">PREPARED BY</td>
	<td width="30%">RECOMMENDED/AUTHORISED BY</td>
	<td width="20%" >APPROVED BY</td>
	<td width="20%">APPROVED/PROCESSED BY</td>
	<td width="10%">STATUS</td>
</tr>
<tr>
	<td height="30" class="normal"><%=preparedBy%></td>
	<td class="normal"><%=reviewedBy%></td>
	<td class="normal"><%=authorisedBy%></td>
	<td class="normal"><%=printedBy%></td>
	<td class="normal"><%=status%></td>
</tr>
<tr class="normal">
	<td colspan="100%" height="5px">&nbsp;</td>
</tr>

</table>



<%
	  	}//end of else
%>
</form>
</body>
</html>
