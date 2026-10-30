<!--<%--
 -- Comments....
 -- @author		Ashutosh Joshi
 -- @version 	1.00, May 2012.
 --%> -->

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
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

	

	ArrayList requestsList = new ArrayList();
	ArrayList requestDetailsList = new ArrayList();
	ArrayList reviewersOptionalList = new ArrayList();
	ArrayList unitsList = new ArrayList();
	ArrayList locationsList = new ArrayList();
	ArrayList approversList = new ArrayList();
	ArrayList reviewersList = new ArrayList();

	
	Hashtable requestsHash = new Hashtable();
	Hashtable criteriaHash = new Hashtable();
	
	unitsList = GatepassController.getUnits();
	locationsList = listDomainObjectsController.listLocations(criteriaHash);

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

	reviewersOptionalList = GatepassController.getReviewersOptionList(branchCode,locationCode);

	criteriaHash.remove("ROLECODE");
	criteriaHash.put("ROLECODE", "3");
	//out.println(criteriaHash);

	approversList = GatepassController.getApprovers(criteriaHash);

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

	requestsHash.put("GATEPASSID",gatepassId);
	requestsHash.put("CREATEDBY",createdBy);
	requestsHash.put("REQTYPE",reqType);

	requestsList = GatepassController.getMyRequests(requestsHash);
	requestDetailsList = GatepassController.getGatepassDetails(gatepassId,reqType);

	String tmpOptList[] = (String[])reviewersOptionalList.get(0);
	//out.println(tmpOptList[3]);

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
</head>
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
<body onLoad="hideEditCols()" >
<form name="frmEditRequest" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<%@ include file="../includes/statusHash.jsp" %>
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

		for(int ii=0; ii< requestsList.size(); ii++){

			String tmpArr[] = (String [])requestsList.get(0);

			/*String preparedBy = tmpArr[11];
			 type = tmpArr[1];
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
			}*/

%>	

<table border="0" cellspacing="2" cellpadding="0" width="100%" align="center">
          <tr>
<%
		if("N".equals(reqType)) {
%>
           <td colspan="100%" height="40px" align="center" valign="middle" class="greyBG"><input type="radio" name="gatePassType" id="gatePassType" value="R" onclick="showMyeditCols();"/>&nbsp;RETURNABLE GATE PASS&nbsp; | &nbsp; <input type="radio" name="gatePassType" id="gatePassType" value="N" onclick="showMyeditCols();" checked/>NON- RETURNABLE GATE PASS
             </td>

<%	
		} else {	
%>
		 <td colspan="100%" height="40px" align="center" valign="middle" class="greyBG"><input type="radio" name="gatePassType" id="gatePassType" value="R" onclick="showMyeditCols();" checked/>&nbsp;RETURNABLE GATE PASS&nbsp; | &nbsp; <input type="radio" name="gatePassType" id="gatePassType" value="N" onclick="showMyeditCols();" />NON- RETURNABLE GATE PASS
           </td>
<%
		}	

%>
          </tr>
		 <tr class="normal">
            <td width="40%" height="25px" align="right" class="normal" valign="middle">Gatepass ID</td>
            <td width="3%" align="center" class="normal" valign="middle"> : </td> 
            <td align="left" valign="middle" class="normal" class="normal"><input type="text" name="gatepassId" value="<%=tmpArr[0]%>"></td>
          </tr>
		   <tr >
            <td height="25px" align="right" class="normal" valign="middle">From Address</td>
            <td align="center" class="normal" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><input type="text" name="fromAddress" value="<%=tmpArr[33]%>" class="normal" size="30"> (Max 200 chars)<img src="../images/tick.png" width="20" height="20" /></td>
		  </tr>
		  <tr>
            <td height="25px" align="right" class="normal" valign="middle">Party's Name</td>
            <td align="center" class="normal" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><input type="text" name="partyName" value="<%=tmpArr[2]%>" class="normal" size="30">(Please put complete name of party)
            <img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
		   <tr >
            <td height="25px" align="right" class="normal" valign="middle">To Address</td>
            <td align="center" class="normal" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><input type="text" name="partyToAddress" value="<%=tmpArr[3]%>" class="normal" size="30">(Max 200 chars)<img src="../images/tick.png" width="20" height="20" /></td>
		  </tr>
		  <tr >
            <td height="25px" align="right" class="normal" valign="middle">Represented By</td>
            <td align="center" class="normal" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><input type="text" name="partyPersonName" value="<%=tmpArr[4]%>" class="normal" size="30"> (Name of Person)<img src="../images/tick.png" width="20" height="20" /></td>
		  </tr>
		  <tr>
            <td height="25px" align="right" class="bold" valign="middle" class="normal">SAP Number</td>
            <td align="center" class="bold" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><%=tmpArr[34]%></td>
          </tr>
		  <tr >
            <td height="25px" align="right" class="normal" valign="middle">Mobile No</td>
            <td align="center" class="normal" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><input type="text" name="mobileNumber" value="<%=tmpArr[32]%>" class="normal" size="30"> <img src="../images/tick.png" width="20" height="20" /></td>
		  </tr>
		  <tr >
            <td height="25px" align="right" class="normal" valign="middle">Vehicle No</td>
            <td align="center" class="normal" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><input type="text" name="vehicleNumber" value="<%=tmpArr[35]%>" class="normal" size="30"></td>
		  </tr>
        
		<tr>
		  <td align="center" colspan="100%" height="10px" valign="middle">&nbsp;</td>
		</tr>   
         <tr class="normal">
            <td colspan="100%" height="30" align="left" valign="middle" class="greyBG">MATERIAL DETAILS :</td>
        </tr>
<%
		if("Company's Own".equals(tmpArr[5])) {
	
%>
     <tr>
            <td align="right" valign="middle" class="normal">Ownership</td>
            <td align="center" valign="middle" class="normal"> : </td>
            <td align="left" valign="middle"><select name="ownership" class="normal" onChange="showMyeditCols();">
              <option value="0">Select</option>
              <option value="Company's Own" selected>Company's Own</option>
              <option value="Party's Own">Party's Own</option>
            </select>
            <img src="../images/tick.png" width="20" height="20" /></td>
      </tr>
<%
		  } else {
%>
	<tr>
            <td align="right" valign="middle" class="normal">Ownership</td>
            <td align="center" valign="middle" class="normal"> : </td>
            <td align="left" valign="middle"><select name="ownership" class="normal" onChange="showMyeditCols();">
              <option value="0">Select</option>
              <option value="Company's Own" >Company's Own</option>
              <option value="Party's Own" selected>Party's Own</option>
            </select>
            <img src="../images/tick.png" width="20" height="20" /></td>
      </tr>
<%
		}
		if("Capital Item".equals(tmpArr[6])) {
%>


             <tr>
            <td align="right" valign="middle" class="normal">Item Category</td>
            <td align="center" valign="middle" class="normal"> : </td>
            <td align="left" valign="middle"><select name="itemCategory"  class="normal" onChange="showMyeditCols()">
              <option value="0">Select</option>
              <option value="Capital Item" selected>Capital Item</option>
              <option value="Non-Capital Item">Non-capital Item</option>
            </select>
            <img src="../images/tick.png" width="20" height="20"/></td>
          </tr>
      
<%
		  } else {
%>
	 <tr>
            <td align="right" valign="middle" class="normal">Item Category</td>
            <td align="center" valign="middle" class="normal"> : </td>
            <td align="left" valign="middle"><select name="itemCategory"  class="normal" onChange="showMyeditCols()">
              <option value="0">Select</option>
              <option value="Capital Item">Capital Item</option>
              <option value="Non-Capital Item" selected>Non-capital Item</option>
            </select>
            <img src="../images/tick.png" width="20" height="20"/></td>
          </tr>
		   
<%
		} if(!tmpArr[7].equals("")){
%>
         <tr id="showThisDate" name="showThisDate" class="normal">
            <td height="25px" align="right" class="normal" valign="middle">Probable Date of Return</td>
            <td align="center" class="normal" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><input id="returnDate" size="15" name="returnDate" class="normal"  onfocus="showCalendarControl(this);" value="<%=tmpArr[7]%>"/></td>
          </tr>
<%
		} 

		if(!tmpArr[8].equals("")){ 	
%>
          <tr class="normal">
            <td height="25px" align="right" class="normal" valign="middle">Purchase Order / Job order No.</td>
            <td align="center" class="normal" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><input maxlength="20" size="30" name="purchaseOrderJobNo"  value="<%=tmpArr[8]%>"/> </td>
          </tr>

		  <tr class="normal">
            <td height="25px" align="right" class="normal" valign="middle">Purchase Order / Job order Date :</td>
            <td align="center" class="normal" valign="middle"> : </td>
            <td align="left" valign="middle" class="normal"><input id="purchaseOrderDate" readonly="readonly" size="10" name="purchaseOrderDate" class="normal" onfocus="showCalendarControl(this);" value="<%=tmpArr[9]%>"/>  </td>
          </tr>
        
<%
	}
%>
	<tr class="normal">
	   <td colspan="100%" valign="top">&nbsp;</td>
    </tr>
	</table>  

	<table border="1" cellspacing="0" cellpadding="0" width="100%">
		<tr class="greyBG">
			<td width="1%" height="30">Sr.No.</td>
			<td width="15%">Material Description</td>
			<td width="5%">Serial No.</td>
			<td width="7%">Quantity</td>
			<td width="7%">UOM</td>
<%
		//if("N".equals(reqType) && "Company's Own".equals(tmpArr[5]) && "Capital Item".equals(tmpArr[6]) ) {
%>

			<td width="12%"  id="showThis" name = "showThis" >Asset Transfer Note no.</td>
			<td width="12%"  id="showThis" name = "showThis" >Asset Transfer Date</td>
			<td width="17%"  id="showThis" name = "showThis" >Location</td>
<%
		//}	
			
%>
			<td width="24%">Reason for taking the material</td>	
		</tr>   
<%
	int rows = requestDetailsList.size();
		for( ii=0; ii< requestDetailsList.size(); ii++){
		
		String tmpDetArr[] = (String [])requestDetailsList.get(ii);
		//out.println(tmpDetArr[2]);		
%>

		<tr class="normal">
			<td height="30" align="center" class="normal"><%=ii+1%></td>
			<td><input maxlength="50" size="20" name="materialDesc" class="normal" value="<%=tmpDetArr[3]%>"/></td>
			<td><input maxlength="25" size="5"  name="serialNum" class="normal"  value="<%=tmpDetArr[11]%>"/></td>
			<td><input maxlength="10" size="5" name="quantity" class="normal" value="<%=tmpDetArr[4]%>"/></td>

			<td> <select name="uomId" class="normal">
<%
			for(int jj=0; jj< unitsList.size(); jj++)
			{
		
				String tmpArrUL[] = (String[])unitsList.get(jj);
				
				if ( (tmpArrUL[1]).equals(tmpDetArr[5]) ) {
%>	
			
				<option value="<%=tmpArrUL[1]%>" selected><%=tmpArrUL[1]%></option>
<%
			}else {

%>
			<option value="<%=tmpArrUL[1] %>" ><%=tmpArrUL[1]%></option>
		
<%
			}	
		}
%>	
			</select></td>
	<td id="showThis" name = "showThis"><input maxlength="10" size="10" class="normal" name="transferNoteNo" value="<%=tmpDetArr[6]%>"/></td>
			<td id="showThis" name = "showThis"> <input id="assetransferdate" readonly maxlength="38" size="10" class="normal" name="assetransferdate" onfocus="showCalendarControl(this);" value="<%=tmpDetArr[7]%>"/></td>
			

			<td id="showThis" name = "showThis"> 
			
			<select name="location" class="normal">

				<option value="0">Select Location</option>
<%
				for(int kk=0; kk< locationsList.size(); kk++)
				{
		
						String tmpArrLL[] = (String[])locationsList.get(kk);

						if ( (tmpArrLL[8]).equals(tmpDetArr[2]) )
						{
%>	
							<option value="<%=tmpArrLL[8]%>" selected><%=tmpArrLL[5]%></option>
<%
						}	else {
%>
							<option value="<%=tmpArrLL[8]%>" ><%=tmpArrLL[5]%></option>
<%
						}
				}
%>
			</select></td>
			<td><input maxlength="100" size="25" name="remarks" class="normal" value="<%=tmpDetArr[8]%>"/></td>

		</tr>
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
                 <td>
					<div align="left">
                    <input maxlength="100" size="35" name="preparedBy" value="<%=emailId%>" readOnly/>
					 </div>
				  </td>

                  <td> <div align="left">
				  <select name="reviewedBy" class="normal">
                      <option value="0">Select Authority</option>
<%
					int mm;
					for(mm=0; mm< reviewersList.size(); mm++)
					
					{
			
					String tmpArrRL[] = (String[])reviewersList.get(mm);
					
					if ( (tmpArrRL[0]).equals(tmpArr[16]) )
					{
%>	
					<option value="<%=tmpArrRL[0]%>" selected><%=tmpArrRL[6]%></option>

<%
					}	else {

%>
						<option value="<%=tmpArrRL[0]%>" ><%=tmpArrRL[6]%></option>
<%
							}
					}
%>
				   </select>
                   </td>
			<td><div align="left">
 			<select name="authorisedBy" class="normal">
            <option value="0">Select Authority</option>

<% 
			for(mm=0 ; mm< approversList.size(); mm++){
				
			String tmpArrAL[] = (String[])approversList.get(mm);
		    if ( (tmpArrAL[0]).equals(tmpArr[13]) )
			{
%>	
				<option value="<%=tmpArrAL[0]%>" selected><%=tmpArrAL[6]%></option>

<%
			}	else {

%>
			<option value="<%=tmpArrAL[0]%>" ><%=tmpArrAL[6]%></option>
<%
			}
		}
%>
			</select> </td>
		</tr>
     </tbody>
	 </tr>
          <tr>
            <td colspan="4" valign="top">&nbsp;</td>
          </tr>
		  <tr>
            <td colspan="4" valign="top">&nbsp;</td>
          </tr>
        </tbody>

	</table>
<%			
		}
	 }//end of else
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr><td  align="center">
  <input type="button" name ="button" value="U P D A T E" onclick="javascript:validateEditRequest();">&nbsp;&nbsp;<input type="button" name="clear" value="R E S E T " onClick="javascript:reset();">&nbsp;&nbsp;<input type="button" name="button" value="C L O S E " onclick="window.close();">
 </td> </tr>
</table>
<input type="hidden" name="currentSysdate" value="<%=dayMonYear%>">
<input type="hidden" name="reviewerOptList" value="<%=tmpOptList[3]%>">
<input type = "hidden" name = "reqType" value="<%=reqType%>">
</form>


 </body>
</html>