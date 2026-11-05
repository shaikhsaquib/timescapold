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

<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController" />


<%!
private int getPreviousYear(int prevVal) {
    Calendar prevYear = Calendar.getInstance();
    prevYear.add(Calendar.YEAR, -prevVal);
    return prevYear.get(Calendar.YEAR);
}
%>

<%
	ArrayList reqList = new ArrayList();
	Hashtable detailsHash = new Hashtable();

	detailsHash.put("CREATEDBY", timescapeUserOId+"");
	
	
	/*  Dropdown Code Starts */
	
	String statusName[] = {"All","In Process","Available","Retained","Rejected","ATN In Process","ATN Completed","ADN In Process","ADN Completed","ATN/ADN Rejected"};

	String statusVal[] = {"'ALL'","'UC'","'RA'","'UR'","'RR'","'TS','TV','TP','TA'","'TCL'",
						  "'DS','DV','DP','DA','DAH','DBH'",
						  "'DCL'",
						  "'TSR','TVR','TPR','TAR','DSR','DVR','DPR','DAR','DAHR','DBHR'"};
	
	
	String status = (String)request.getParameter("selectedStatus");
	String month = (String)request.getParameter("selectedMonth");	
	String year = (String)request.getParameter("selectedYear");
	
	int mon = 0;
	if(month != null){
		mon = Integer.valueOf(month);
	}
	
	if(mon == 0){
		java.util.Date date= new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		mon = cal.get(Calendar.MONTH) + 1;
		
		if(mon == 13){
			mon = 1;
		}
		
		//month = String.valueOf(mon);
	}
	
	if(status==null || status.trim().equals("")){
		status = "'RA'";
	}

	//out.println(status);
	if(status.equals("'UC'")|| status.equals("'RA'")|| status.equals("'UR'")|| status.equals("'RR'")){
		
		detailsHash.put("STATUS", status);

	}else if(status.equals("'ALL'")){
		
		detailsHash.put("STATUS","'UC','RA','UR','RR','CL'");
		
	}else{

		detailsHash.put("NOTESTATUS", status);
	}
 	//detailsHash.put("REVIEWEDBY", timescapeUserOId+"");
	//out.println(detailsHash);
	
	
	if(month == null && year == null){
		detailsHash.put("MONTH",""+mon);
		detailsHash.put("YEAR",""+getPreviousYear(0));
	}else{
		detailsHash.put("MONTH",month);
		detailsHash.put("YEAR",year);
	}
	
	/*  Dropdown Code Ends */


	reqList = assetMgmt.getMyRequests(detailsHash);

	//out.println(reqList.size());
	String roleCode = (String)session.getAttribute("roleCode");

	int count = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>SURPLUS ASSET MANAGEMENT</title>
		<link href="../style/global.css" rel="stylesheet" type="text/css" />
		<script src="../jscripts/viewDetails.js" type="text/javascript"></script>
		<script src="../jscripts/jquery.js"language="javascript"></script>
	</head>

<body>
<form name="frmViewMyRequest" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td width="50%"><img src="../images/SAM_header.jpg" width="576" height="72" /></td>
			<td width="50%" valign="bottom">
					<%@ include file="../includes/relatedLinks.jsp" %>
		</td>
 </tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">
    <tr>
      <td height="20" bgcolor="#E7EAEF" class="budgetMenuBG">&nbsp;VIEW MY SURPLUS ASSETS</td>
    </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left" class="normal">In Process <img src="../images/inProcess.png" width="13" height="13"/> | Available<img src="../images/available.png" width="20" height="20" /> | Retained <img src="../images/retain.png" width="13" height="13"/> | Deleted <img src="../images/widraw.jpg" width="13" height="13"/>| Closed <img src="../images/closed.png" width="13" height="13"/>| ATN In Process <img src="../images/ATN_Process.png" width="50" height="20"/>| ATN Completed <img src="../images/ATN_com.png" width="50" height="20"/>| ADN In Process <img src="../images/ADN_Process.png" width="50" height="20"/>| ADN Completed <img src="../images/ADN_com.png" width="50" height="20"/></td>
  </tr>
 <tr>
	
	</td>
 
	<td height="30" colspan="100%" align="right" valign="middle" class="normal">Month : 
	<input type ="hidden" name="selectedMonth">
	<select name="month" class="small" id="month" >
	<option value="01" <%if(mon==1){%>selected<%}%>>January</option>
	<option value="02" <%if(mon==2){%>selected<%}%>>February</option>
	<option value="03" <%if(mon==3){%>selected<%}%>>March</option>
	<option value="04" <%if(mon==4){%>selected<%}%>>April</option>
	<option value="05" <%if(mon==5){%>selected<%}%>>May</option>
	<option value="06" <%if(mon==6){%>selected<%}%>>June</option>
	<option value="07" <%if(mon==7){%>selected<%}%>>July</option>
	<option value="08" <%if(mon==8){%>selected<%}%>>August</option>
	<option value="09" <%if(mon==9){%>selected<%}%>>September</option>
	<option value="10" <%if(mon==10){%>selected<%}%>>October</option>
	<option value="11" <%if(mon==11){%>selected<%}%>>November</option>
	<option value="12" <%if(mon==12){%>selected<%}%>>December</option>
	</select>
	</td>
	
	<td height="30" colspan="100%" align="right" valign="middle" class="normal">Year : 
	<input type ="hidden" name="selectedYear">
	<select name="year" class="small" id="year">
	<% for(int i=10; i>=0; i--){ 
		int numYear = getPreviousYear(i);
	%>
	
	<option value="<%=numYear%>" <%if(i==0 && year==null){%>selected<%}else if(year != null && year.equals(String.valueOf(numYear))){%>selected<%}%>><%=numYear%></option>
	<%}%>
	</select>
 
	<td height="30" colspan="100%" align="right" valign="middle" class="normal">Status :
	<input type ="hidden" name="selectedStatus">
	<select name="reqStatus" class="small" id="reqStatus" >
		<!-- <option value="0" >Select </option> -->
<%
	for(int i=0; i < statusVal.length; i++) {
 
		if ( (statusVal[i]).equals(status) ) {
%>
		<option value="<%= statusVal[i] %>" selected><%= statusName[i] %></option>
<%
		} else {
%>
		<option value="<%= statusVal[i] %>"><%= statusName[i] %></option>	
<%
		}

	}
%>
	</select>
	</td>
	
	<td height="30" colspan="3" align="right" valign="middle" class="normal">
	<img src="../images/arrow3.png" style="margin: 0 5px 0 10px; cursor: pointer;"width="20" height="20" onclick="updateStatus('viewRequest')"/>
	</td>
	
	<td height="30" colspan="3" align="right" valign="middle" class="normal" style="font-weight: bold;text-align: center;">
	Open/Save Report
	</td>
	<td height="30" colspan="3" align="right" valign="middle" class="normal">
	<img src="../images/excel.png" alt="Open/Save Report" width="15" height="15" border="0" style="cursor:pointer;" onclick="downloadData()" />
	</td>
</tr>

</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="2">
  <tr class="greyBG">
    <td width="2%" height="29" align="center" valign="middle" >NO.</td>
    <td width="12%" align="left" valign="middle">ASSET</td>
    <td width="5%" align="left" valign="middle">ASSET NO</td>
    <td width="10%" align="center" valign="middle"> CATEGORY</td>
    <td width="8%" align="center" valign="middle">TYPE</td>
    <td width="17%" align="center" valign="middle">LOCATION</td>
    <td width="10%" align="center" valign="middle">POSTING  DATE</td>
    <td width="16%" align="center" valign="middle">OWNERSHIP</td>
    <td width="11%" align="left" valign="middle">&nbsp;ACTION</td>
    <td width="12%" align="left" valign="middle">&nbsp;REQUESTS</td>
    <td width="5%" align="left" valign="middle">REQUESTS ID</td>
   </tr>
<%

	if(reqList.size()==0){
%>
  <tr>
    <td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle" class="bold" colspan="100%">There are no request(s) to view!!</td>
  </tr>
  <tr>
    <td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav"><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>

<%
	}else{

		for(int ii=0; ii< reqList.size(); ii++){

			String editStr ="../images/spacer.gif";
			String onclick = "";
			String showCheckbox = "-";

			String tmpArr[] = (String [])reqList.get(ii);
			
			/*if(tmpArr[28].equals("UC")|| tmpArr[28].equals("UR")|| tmpArr[28].equals("RA")|| tmpArr[28].equals("RR") ){
				
				editStr ="../images/edit.jpg";
				//onclick ="editRequest("+tmpArr[0]+")";
				onclick ="alert("+tmpArr[0]+")";
			}*/

			//if the request is put by logged in user then show only total count
			if(tmpArr[16].equals(timescapeUserOId+"")){

				showCheckbox = tmpArr[31].equals("0")? "-" : "<a href=javascript:void(0); onclick=showUsers("+tmpArr[0]+") class=underline>"+tmpArr[31]+" Request(s)</a>";
			}
%>
  <tr>
	<input type="hidden" name="updateStatus<%=ii%>" value="">
	<input type="hidden" name="requestId<%=ii%>" value="<%=tmpArr[0]%>">
	<input type="hidden" name="count" value="">

    <td height="30" align="left" valign="middle" class="normal"><%=ii+1%></td>
    <td height="30" align="left" valign="middle" class="boldunderline"><a href="javascript:void(0);" onclick="showDetails('<%=tmpArr[0]%>')" class="boldunderline" ><%=tmpArr[3]%></a></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[1]%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[4]%></td>
    <td align="center" valign="middle" class="normal"><%=tmpArr[5]%></td>
    <td height="30" align="center" valign="middle" class="normal">		<%=tmpArr[9].indexOf("-")>-1?tmpArr[9].substring(tmpArr[9].indexOf("-")+1).trim():tmpArr[9]%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[20].substring(0,tmpArr[20].indexOf(" "))%></td>
    <td height="30" align="left" valign="middle" class="normal"><%=tmpArr[19]%></td>
    <td height="30" align="left" valign="middle" class="normal"><span id=markResp<%=ii%>>
<%
	if(tmpArr[30].equals("UC")){
		count++;	
%>
			<select align="left" name= "assetType<%=ii%>" id= "assetType" valign="absmiddle" class="normal" onchange="updateInterest(<%=ii%>, <%=tmpArr[31]%>, <%=tmpArr[0]%>, 'request')">
				<option value="0">Select </option>
				<option value="UD">Delete</option>
				<option value="UR">Retain</option>
			</select>
<%
	}
	else if(tmpArr[30].equals("RA")){
		count++;	
%>
  <select align="left" name= "assetType<%=ii%>" id= "assetType" valign="absmiddle" class="normal" onchange="updateInterest(<%=ii%>, <%=tmpArr[31]%>, <%=tmpArr[0]%>, 'request')">
				<option value="0">Select </option>
				<option value="UD">Delete</option>
				<option value="UR">Retain</option>
				<option value="ATN">ATN</option>
				<option value="ADN">ADN</option>
			</select>  

<%	
	}
%>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=statusImg.get(tmpArr[30].equals("CL")? tmpArr[69] : tmpArr[30])%>" valign="absmiddle" border="0"></span>
	</td>
	<td height="30" align="left" valign="middle" class="normal">&nbsp;<%=showCheckbox%></td>
	<td height="30" align="left" valign="middle" class="normal">&nbsp;<%=tmpArr[0]%></td>
</tr>
  <tr>
    <td height="1" colspan="9" align="left" valign="middle" bgcolor="#F7F7F7"><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
<%	
		}//end of for
	}//end of else
%>
</table>
</form>
<script>
	function downloadData(){
		var statusObj = document.getElementById("reqStatus");
		status1 = statusObj.options[statusObj.selectedIndex].value;
		var monthObj = document.getElementById("month");
		month = monthObj.options[monthObj.selectedIndex].value;
		var yearObj = document.getElementById("year");
		year = yearObj.options[yearObj.selectedIndex].value;
		var id = document.getElementById("timesId").value;
		//alert("details : "+status1+" "+month+" "+year+" "+id);
		window.open("../includes/myRequestReport.jsp?MONTH="+month+"&YEAR="+year+"&STATUS="+status1+"&ID="+id, "_blank");
	}

</script>
</body>
</html>


