<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
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

	String statusName[] = {"All","In Process","Available","Retained","Rejected","ATN In Process","ATN Completed","ADN In Process","ADN Completed","ATN/ADN Rejected"};

	String statusVal[] = {"'ALL'","'UC'","'RA'","'UR'","'RR'","'TS','TV','TP','TA'","'TCL'",
						  "'DS','DV','DP','DA','DAH','DBH'",
						  "'DCL'",
						  "'TSR','TVR','TPR','TAR','DSR','DVR','DPR','DAR','DAHR','DBHR'"};
	
	ArrayList reqList = new ArrayList();
	Hashtable detailsHash = new Hashtable();

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
	
	//out.println("month : "+mon);
	//out.println("year : "+year);
	
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

	reqList = assetMgmt.getMyRequests(detailsHash);

	String roleCode = (String)session.getAttribute("roleCode");
	//out.println(reqList.size());
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>SURPLUS ASSET MANAGEMENT</title>
		<link href="../style/global.css" rel="stylesheet" type="text/css" />
		<script src="../jscripts/reviewRequests.js" type="text/javascript"></script>
		<script src="../jscripts/viewDetails.js" type="text/javascript"></script>
		<script src="../jscripts/jquery.js" type="text/javascript"></script>
	</head>

<body>
<form name="frmViewAllRequests" id="frmViewAllRequests" method="post" >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%"><img src="../images/SAM_header.jpg" width="576" height="72" /></td>
			<td width="50%" valign="bottom">
					<%@ include file="../includes/relatedLinks.jsp" %>
		</td>
 </tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">
    <tr>
      <td height="20" bgcolor="#E7EAEF" class="budgetMenuBG">&nbsp;VIEW  ALL  ASSETS</td>
    </tr>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
    <td align="left" class="normal">In Process <img src="../images/inProcess.png" width="13" height="13"/> | Available<img src="../images/available.png" width="20" height="20" /> | Retained <img src="../images/retain.png" width="13" height="13"/> | Deleted <img src="../images/widraw.jpg" width="13" height="13"/><!-- | Closed <img src="../images/closed.png" width="13" height="13"/> -->| ATN In Process <img src="../images/ATN_Process.png" width="50" height="20"/>| ATN Completed <img src="../images/ATN_com.png" width="50" height="20"/>| ADN In Process <img src="../images/ADN_Process.png" width="50" height="20"/>| ADN Completed <img src="../images/ADN_com.png" width="50" height="20"/></td>
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
		<option value="<%= statusVal[i] %>" ><%= statusName[i] %></option>	
<%
		}

	}
%>
	</select>
	</td>
	
	<td height="30" colspan="3" align="right" valign="middle" class="normal">
	<img src="../images/arrow3.png" style="margin: 0 20px 0 10px; cursor: pointer;"width="20" height="20" onclick="updateStatus('viewAllRequest')"/>
	</td>
</tr>
</table>
<table width="99%" align="center" cellpadding="0" cellspacing="2" border="0">
  <tr class="greyBG">
    <td width="4%" height="29" align="center" valign="middle" >NO.</td>
    <td width="12%" align="left" valign="middle">ASSET</td>
    <td width="5%" align="left" valign="middle">ASSET NO</td>
    <td width="10%" align="center" valign="middle"> CATEGORY</td>
    <td width="8%" align="center" valign="middle">TYPE</td>
    <td width="16%" align="center" valign="middle">LOCATION</td>
    <td width="10%" align="center" valign="middle">POSTING  DATE</td>
    <td width="15%" align="center" valign="middle">OWNERSHIP</td>
    <td width="9%" align="left" valign="middle">&nbsp;STATUS</td>
    <td width="5%" align="left" valign="middle">REQUESTS</td>
    <td width="8%" align="left" valign="middle">REQUESTS ID</td>
   </tr>
<%

	if(reqList.size()==0){
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

		for(int ii=0; ii< reqList.size(); ii++){

			String tmpArr[] = (String [])reqList.get(ii);

			String showCheckbox = tmpArr[31].equals("0")? "-" : "<a href=javascript:void(0); onclick=void(0);showUsers("+tmpArr[0]+") class=underline>"+tmpArr[31]+" Request(s)</a>";


%>
  <tr>
	<input type="hidden" name="updateStatus<%=ii%>" value="">
	<input type="hidden" name="requestId<%=ii%>" value="<%=tmpArr[0]%>">
	<input type="hidden" name="count" value="">
	<input type="hidden" name="review" value="review">

    <td height="30" align="center" valign="middle" class="normal"><%=ii+1%></td>
    <td height="30" align="left" valign="middle" class="boldunderline"><a href="javascript:void(0);" onclick="showDetails('<%=tmpArr[0]%>')" class="boldunderline" ><%=tmpArr[3]%></a></td>
    <td height="30" align="left" valign="middle" class="normal"><%=tmpArr[1]%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[4]%></td>
    <td align="center" valign="middle" class="normal"><%=tmpArr[5]%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[9].indexOf("-")>-1?tmpArr[9].substring(tmpArr[9].indexOf("-")+1).trim():tmpArr[9]%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[20].substring(0,tmpArr[20].indexOf(" "))%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[19]%></td>
    <td height="30" align="center" valign="middle" class="normal"><img src="<%=statusImg.get(tmpArr[30].equals("CL")? tmpArr[69] : tmpArr[30])%>" border="0"></td>
    <td height="30" align="center" valign="middle" class="normal"><%=showCheckbox%></td>
	<td height="30" align="left" valign="middle" class="normal"><%=tmpArr[0]%></td>
  </tr>
  <tr>
    <td height="1" colspan="9" align="left" valign="middle" bgcolor="#F7F7F7"><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
<%	
		}//end of for
	}//end of else
		
	
%>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="54" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
   
			<td width="49%" valign="bottom">
					
		</td>
  </tr>
</table>
</form>
</body>
</html>
