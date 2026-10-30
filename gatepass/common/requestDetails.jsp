<!--<%--
 -- Comments....
 -- @author		Ashutosh Joshi
 -- @version 	1.00, May 2012.
 --%> -->

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>

<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar,java.text.*,java.util.Date" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>

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
	//out.println(requestsHash);

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
<script src="../jscripts/viewRequests.js"language="javascript"></script>

<script> 
    function hideImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'hidden'; 
           // document.getElementById('button').style.visibility = 'hidden'; 
        } 
    }
    function showImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'visible'; 
            //document.getElementById('button').style.visibility = 'visible'; 
        } 
    } 
     </script>
</head>
<body>
<form name="frmViewRequests" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
      <td colspan="100%" height="20px" bgcolor="#E7EAEF" class="budgetMenuBG">&nbsp;&nbsp;REQUEST DETAILS</td>
	</tr>
</table>


<%

   // DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
	//Date date = new Date();
	//out.println(dateFormat.format(date));

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
			String reviewedByName = tmpArr[17];
			
			String printedDate = "-";
			String status = (String)statusHash.get(tmpArr[25]);
			
			String createdDate = "-";
			String reviewedDate = "-";
			String approvedDate = "-";
			String printedBy = "-";
	
			if("AA".equals(tmpArr[25])|| "AR".equals(tmpArr[25]) || "PA".equals(tmpArr[25]) || "PR".equals(tmpArr[25]) || "CL".equals(tmpArr[25]) || "UC".equals(tmpArr[25]) ){				
				 authorisedBy = tmpArr[14];
				
			}

			if("RA".equals(tmpArr[25])|| "RR".equals(tmpArr[25]) || "AA".equals(tmpArr[25])|| "AR".equals(tmpArr[25]) || "PA".equals(tmpArr[25]) || "PR".equals(tmpArr[25]) || "CL".equals(tmpArr[25]) || "UC".equals(tmpArr[25]) ){
				
				 reviewedBy	  = tmpArr[16].equals("0")? "-" : tmpArr[17];
				
			}

			if("PA".equals(tmpArr[25]) || "PR".equals(tmpArr[25]) || "CL".equals(tmpArr[25])){
				
				 printedBy    = tmpArr[19].equals("0")? "-" : tmpArr[20];
				
			}

			
			if("UC".equals(tmpArr[25]))
			{
				 createdDate  = tmpArr[36];
				 reviewedDate = "-";
				 approvedDate = "-";
				 printedDate   = "-";

			}else if("AA".equals(tmpArr[25])|| "AR".equals(tmpArr[25])){
				
				 createdDate  = tmpArr[36];
				 reviewedDate = tmpArr[38];
				 approvedDate = tmpArr[37];
				 printedDate    = "-";

			}else
			if("RA".equals(tmpArr[25])|| "RR".equals(tmpArr[25])){
				
				 createdDate  = tmpArr[36];
				 reviewedDate = tmpArr[38];
				 approvedDate = "-";
				 printedDate  = "-";

			}else
			if("PA".equals(tmpArr[25]) || "PR".equals(tmpArr[25]) || "CL".equals(tmpArr[25])){
				
				 createdDate  = tmpArr[36];
				 reviewedDate = tmpArr[38];
				 approvedDate = tmpArr[37];
				 printedDate  = tmpArr[39];
			}

%>	


<table width="90%" border="0" align="center" cellpadding="5" cellspacing="0"  class="normalBig" id="1" name="1">
	<tr>
<td colspan="100%" align="right" class="redbold">
<input name="printbutton" type="submit" class="style4" id="printbutton" value="Print" onclick="javascript:hideImage();window.print();showImage();"/>
</td>
	</tr>
</table>
		
<table border="0" cellspacing="2" cellpadding="0" width="100%" align="center">
	<input type="hidden" name="createdBy" value="<%=createdBy%>">
		  <tr>
            <td height="25px" align="right" class="bold" valign="middle"></td>
            <td align="center" class="bold" valign="middle"></td>
            <td align="left" valign="middle" class="bold"><%=statusHash.get(tmpArr[1])%> Gatepass </td>
          </tr>
<%
		if (!(tmpArr[26].equals ("FOURTH ESTATE LTD") || tmpArr[26].equals ("FORTH ESTATE LIMITED")) ){
%>
		  <tr>
		  <td height="25px" align="right" class="bold" valign="middle">Company Name</td>
		  <td align="center" class="bold" valign="middle"> : </td>
		  <td align="left" valign="middle" class="normal"><%=tmpArr[26]%> </td>
		  </tr>
		  
		  <tr>
            <td width="40%" height="25px" align="right" class="bold" valign="middle"></td>
            <td width="3%" align="center" class="bold" valign="middle"> </td> 
            <td align="left" valign="middle" class="normal" class="normal"> <%=tmpArr[27]%> <br> <%=tmpArr[28]%> </td>
          </tr>
<%
		  }
%>
		  <tr>
		  <td height="25px" align="right" class="bold" valign="middle">Branch Name</td>
		  <td align="center" class="bold" valign="middle"> : </td>
		  <td align="left" valign="middle" class="normal"><%=tmpArr[30]%> </td>
		  </tr>
		  <tr>
		  <td height="25px" align="right" class="bold" valign="middle">Location Name</td>
		  <td align="center" class="bold" valign="middle"> : </td>
		  <td align="left" valign="middle" class="normal"><%=tmpArr[31]%> </td>
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
			<td width="11%">Asset Transfer Note no.</td>
			<td width="11%">Asset Transfer Date</td>
			<td width="8%">Location</td>
			<td width="15%">Reason for taking the material</td>
			
<%
	if(tmpArr[25].equals("PA"))
	{
%>
		<td width="3%">Pending Quantity</td>
<%
	}
%>
<td width="10%">Remarks</td>
		</tr>
<%
// Details Display part starts here 

		int rows = requestDetailsList.size();
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


<%
	if(tmpArr[25].equals("PA"))
	{
%>
	<td><%=tmpDetArr[10]%></td>
<%
	}
%>
<%
			String securityRemarks =(tmpDetArr[13] == null) ? "NA" : tmpDetArr[13];
%>
			<td><%=securityRemarks%></td>
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
	<td width="20%" height="30">REQUESTED BY</td>
	<td width="20%" >RECOMMENDED/AUTHORISED BY</td>
	<td width="20%">APPROVED BY</td>
	<td width="25%">PROCESSED BY SECURITY</td>
	<td width="15%">STATUS</td>
</tr>
<tr>
	<td height="30" class="normal"><%=preparedBy%></td>
	<td class="normal"><%=reviewedBy%></td>
	<td class="normal"><%=authorisedBy%></td>
	<td class="normal"><%=printedBy%></td>
	<td class="normal"><%=status%></td>
</tr>
<tr>
		  <td align="left" valign="middle" class="normal"><%=createdDate%></td>
		  <td align="left" valign="middle" class="normal"><%=reviewedDate%> </td>
		  <td align="left" valign="middle" class="normal"><%=approvedDate%> </td>
		  <td align="left" valign="middle" class="normal"><%=printedDate%> </td>
</tr>

<tr class="normal">
	<td colspan="100%" height="5px">&nbsp;</td>
</tr>

</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
 
  <tr>
<%

	if(pageName.equals("user")){

		  if("UC".equals(tmpArr[25]) || "AA".equals(tmpArr[25])|| "RA".equals(tmpArr[25])){
%>	

	<tr class="normal">
	    <td align="right" valign="middle" class="bold"  height="25px">&nbsp;Remarks :&nbsp;<input name="remarks" maxlength="100"></td>
	</tr>

	<tr class="normal">
		<td colspan="100%" valign="top">&nbsp;</td>
	</tr>

    <td align="center" class="bold"><span id="result0"><a href="#" onClick="updateAction('0','<%=reject%>', '<%=tmpArr[0]%>', '<%=pageName%>', '<%=type%>')" class="normal underline"><input type="button" class="button" value="C A N C E L"></a> </span> &nbsp; <a href="#" onclick="window.close();" class="normal underline"><input type="button" class="button" value="C L O S E"></a>
    </td>
<%
		  }else{
%>

	<tr class="normal">
		<td align="right" valign="middle" class="bold"  height="25px">Remarks :
	    <td align="left" valign="middle" height="25px"><%=tmpArr[29]%></td>
	</tr>

	<tr class="normal">
		<td colspan="100%" valign="top">&nbsp;</td>
	</tr>
		<td align="center" class="bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="window.close();" class="normal underline"><input type="button" class="button" value="C L O S E"></a>
		</td>

<%		}

	}else if(pageName.equals("reviewer")){

		  if("UC".equals(tmpArr[25])){
%>
	<tr class="normal">
	    <td align="right" valign="middle" class="bold"  height="25px">&nbsp;Remarks :&nbsp;<input name="remarks" maxlength="100"></td>
		<input type="hidden" name ="authrisedName" value="<%=tmpArr[14]%>">
		<input type="hidden" name ="authrisedemailid" value="<%=tmpArr[41]%>">
	</tr>

	<tr class="normal">
		<td colspan="100%" valign="top">&nbsp;</td>
	</tr>

	  <td align="center" class="bold"><span id="result0"><a href="#" onClick="updateAction('0','<%=accept%>', '<%=tmpArr[0]%>', '<%=pageName%>', '<%=type%>')" class="normal underline"><input type="button" class="button" value="A C C E P T"></a>&nbsp;<a href="#" onClick="updateAction('0','<%=reject%>', '<%=tmpArr[0]%>', '<%=pageName%>', '<%=type%>')" class="normal underline"><input type="button" class="button" value="R E J E C T"></a> </span> &nbsp; <a href="#" onclick="window.close();" class="normal underline"><input type="button" class="button" value="C L O S E"></a>
      </td>
<%
		  }else{
%>

	<tr class="normal">
	  <td align="right" valign="middle" class="bold"  height="25px">Remarks :
	  <td align="left" valign="middle" height="25px"><%=tmpArr[29]%></td>
	</tr>

	<tr class="normal">
	  <td colspan="100%" valign="top">&nbsp;</td>
	</tr>
	   <td align="center" 	  class="bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <a href="#" onclick="window.close();" class="normal underline"><input type="button" class="button" value="C L O S E"></a>
	   </td>
	
	<tr>

<%		}
	}else if(pageName.equals("approver")){

		  if("UC".equals(tmpArr[25])|| "RA".equals(tmpArr[25])){
%>
			
	
			<tr class="normal">
				 <td align="right" valign="middle" class="bold"  height="25px">&nbsp;Remarks :&nbsp;<input name="remarks" maxlength="100"></td>
	        </tr>

			<tr class="normal">
				<td colspan="100%" valign="top">&nbsp;</td>
			</tr>

		<td align="center" class="bold">
			<span id="result0"><a href="#" onClick="updateAction('0','<%=accept%>', '<%=tmpArr[0]%>', '<%=pageName%>', '<%=type%>')" class="normal underline"><input type="button" class="button" value="A C C E P T"></a>&nbsp;<a href="#" onClick="updateAction('0','<%=reject%>', '<%=tmpArr[0]%>', '<%=pageName%>', '<%=type%>')" class="normal underline"><input type="button" class="button" value="R E J E C T"></a> </span> &nbsp; <a href="#" onclick="window.close();" class="normal underline"><input type="button" class="button" value="C L O S E"></a>
		</td>
<%
			}else{
%>

	<tr class="normal">
		<td align="right" valign="middle" class="bold"  height="25px">Remarks :
	    <td align="left" valign="middle" height="25px"><%=tmpArr[29]%></td>
	</tr>

	<tr class="normal">
		<td colspan="100%" valign="top">&nbsp;</td>
	</tr>
		<td align="center" class="bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" onclick="window.close();" class="normal underline"><input type="button" class="button" value="C L O S E"></a>
		</td>

<%		}
	}else if(pageName.equals("processor")){

		  if("AA".equals(tmpArr[25])){
%>
	 <tr class="normal">
	  <td align="right" valign="middle" class="bold"  height="25px">&nbsp;Remarks :&nbsp;<input name="remarks" maxlength="100"></td>
	  </tr>

	<tr class="normal">
		<td colspan="100%" valign="top">&nbsp;</td>
	</tr>
	  <td align="center" class="bold"><span id="result0"><a href="#" onClick="javascript:updateAction('0','<%=accept%>', '<%=tmpArr[0]%>', '<%=pageName%>','<%=type%>');" class="normal underline"><input type="button" class="button" value="APPROVE"></a>
	  &nbsp;<a href="#" onClick="updateAction('0','<%=reject%>', '<%=tmpArr[0]%>', '<%=pageName%>', '<%=type%>')" class="normal underline"><input type="button" class="button" value="R E J E C T"></a> </span> &nbsp;<a href="#" onclick="window.close();" class="normal underline"><input type="button" class="button" value="C L O S E"></a>
	  </td>

<%
		}else{
%>
	<tr class="normal">
		<td align="right" valign="middle" class="bold"  height="25px">Remarks :
	    <td align="left" valign="middle" height="25px"><%=tmpArr[29]%></td>
	</tr>

	<tr class="normal">
		<td colspan="100%" valign="top">&nbsp;</td>
	</tr>

      <td align="center" valign="middle" height="25px"><a href="#" onclick="printDetails('0','<%=accept%>', '<%=tmpArr[0]%>', '<%=pageName%>', '<%=type%>', '<%=createdBy%>');" class="normal underline"><input type="button" class="button" value="P R I N T"></a>&nbsp;&nbsp;&nbsp;&nbsp;
	  <a href="#" onclick="window.close();" class="normal underline"><input type="button" class="button" value="C L O S E"></a>
	</td>

<%		}
	} 
%>

  </tr>
</table>

<%
	  	}//end of else
%>
</form>
</body>
</html>
