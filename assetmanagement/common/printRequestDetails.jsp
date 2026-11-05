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
<%@ page import="java.util.Hashtable,java.util.ArrayList" %>

<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController"/>
<%
	String requestId	= (String)request.getParameter("requestId");

	ArrayList reqList = new ArrayList();
	Hashtable detailsHash = new Hashtable();

	detailsHash.put("REQUESTID", requestId);

	reqList = assetMgmt.getMyRequests(detailsHash);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>SURPLUS ASSET MANAGEMENT</title>
		<link href="../style/common.css" rel="stylesheet" type="text/css"/>
		<script src="../jscripts/util.js" type="text/javascript"></script>
		<script src="../jscripts/common.js" type="text/javascript"></script>
		<script src="../jscripts/characterCount.js" type="text/javascript"></script>
		<script src="../jscripts/viewDetails.js" type="text/javascript"></script>
	</head>
<body onload="printNClose();">
<form name="frmViewDetails" method="post" >
 <table width="100%" border="0" cellpadding="2" cellspacing="2">
    <tr>
      <td colspan="100%" height="20" bgcolor="#E7EAEF" class="budgetMenuBG underline">SURPLUS ASSET DETAILS</td>
    </tr>
</table>
 <table width="100%" border ="0" cellspacing="0" cellpadding="1">
<%

	if(reqList.size()==0){
%>
   <tr>
    <td height="20" colspan="100%"><hr></td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle" class="bold" colspan="100%">There are no details to show!!</td>
  </tr>
   <tr>
    <td height="20" colspan="100%"><hr></td>
  </tr>

<%
	}else {

		for(int ii=0; ii< reqList.size(); ii++){

			String tmpArr[] = (String [])reqList.get(ii);
%>
   <tr>
	 <td width="2%" align="left" valign="middle" class="nav" >&nbsp;</td>
    <td width="30%" height="25-" align="left" valign="middle" class="nav" >NAME OF ASSET :</td>
    <td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[3]%></td>
    <td width="3%" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td width="22%" height="25" align="left" valign="middle" class="nav" >AVAILABLE FROM :</td>
    <td width="25%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[15]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >ASSET NO. :</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[1]%></td>
    <td height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >DATE OF INSTALLATION :</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[6]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>

   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >TYPE :</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[5]%></td>
    <td height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >CATEGORY</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[4]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>

  <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >ORIGINAL COST :</td>
    <td height="25" align="left" valign="middle" class="normal"><img src="../images/rupee.png" width="8" height="10">&nbsp;<%=tmpArr[7]%></td>
    <td height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >CURRENT VALUE/COST :</td>
    <td height="25" align="left" valign="middle" class="normal"><img src="../images/rupee.png" width="8" height="10">&nbsp;<%=tmpArr[8]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>

    <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >LOCATION :</td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"> <%=tmpArr[9].indexOf("-")>-1?tmpArr[9].substring(tmpArr[9].indexOf("-")+1).trim():tmpArr[9]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>

   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >MODEL :</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[11]%></td>
    <td height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >SERIAL NUMBER :</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[2]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>

   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >DESCRIPTION <br> (make/capacity/specifications) : </td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"><%=tmpArr[13]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >PRESENT CONDITION : </td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"><%=tmpArr[14]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>

   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav">OWNERSHIP : </td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"><%=tmpArr[19]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
   
   <tr>
	 <td align="left" valign="middle" class="nav">&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav">POSTING DATE :</td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"><%=tmpArr[20]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav"><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
   <tr>
	<td align="left" valign="middle" class="nav">&nbsp;</td>
	<td height="25" align="left" valign="middle" class="nav">CREATED BY :</td>
	<td height="25" colspan="4" align="left" valign="middle" class="normal"><%=tmpArr[17]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >EMAILID :</td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"><a href="mailto:<%=tmpArr[18]%>" class="underline"><%=tmpArr[18]%></a></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
<%
	if(!("UC".equals(tmpArr[30])||"UR".equals(tmpArr[30]))){
%>
	<tr>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="25" align="left" valign="middle" class="nav" >REVIEWED BY :</td>
		<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[23]%></td>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="25" align="left" valign="middle" class="nav">REVIEWED ON :</td>
		<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[25]%></td>
	</tr>
	<tr>
		<td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
	<tr>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="25" align="left" valign="middle" class="nav" >REVIEWER REMARKS :</td>
		<td height="25" colspan="4" align="left" valign="middle" class="normal"><%=("NA".equals(tmpArr[26]))?"-":tmpArr[26]%></td>
	</tr>
	<tr>
		<td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
<%
	}
%>
	<tr>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="25" align="left" valign="middle" class="nav" >STATUS :</td>
		<td height="25" colspan="4" align="left" valign="middle" class="normal"><img src="<%=statusImg.get(tmpArr[30].equals("CL")? tmpArr[69] : tmpArr[30])%>" border="0"></td>
	</tr>
	<tr>
		<td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
</table>
<%
	String imgsrc="";
	if("ATN".equals(tmpArr[35])){
%>
<table width="100%" border ="0" cellspacing="0" cellpadding="1">
	<tr class="greyBG">
		<td height="20px" width="2%" align="left" valign="middle" bgcolor="#F5F5F5" class="nav">&nbsp;</td>
		<td height="20px" width="98%" align="left" valign="middle" bgcolor="#F5F5F5" class="nav underline">ATN DETAILS</td>
	</tr>
	<tr>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="25%" height="25" align="left" valign="middle" class="nav" >REASON :</td>
		<td colspan="5" height="25" align="left" valign="middle" class="normal"><%=tmpArr[74]%></td>
	</tr>
  <tr>
    <td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
	<tr>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="25%" height="25" align="left" valign="middle" class="nav" >TRANSFEREE COMPANY :</td>
		<td width="18%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[70].substring(tmpArr[70].indexOf("-")+1)%></td>
		<td width="3%" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="18%" height="25" align="left" valign="middle" class="nav" >TRANSFEREE BRANCH :</td>
		<td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[71].substring(tmpArr[71].indexOf("-")+1)%></td>
	</tr>
  <tr>
    <td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
	<tr>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="25%" height="25" align="left" valign="middle" class="nav" >TRANSFEREE LOCATION :</td>
		<td width="18%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[72].substring(tmpArr[72].indexOf("-")+1)%></td>
		<td width="3%" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="18%" height="25" align="left" valign="middle" class="nav" >TRANSFEREE DEPARTMENT :</td>
		<td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[73].substring(tmpArr[73].indexOf("-")+1)%></td>
	</tr>
  <tr>
    <td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
			
	<tr class="greyBG">
		<td height="20px" colspan="100%" align="left" valign="middle" bgcolor="#F5F5F5" class="nav underline">&nbsp;APPROVING HISTORY</td>
	</tr>
	<tr>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="25%" height="25" align="left" valign="middle" class="nav" >TRANSFEROR DEPT. HEAD :</td>
		<td width="18%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[37]%></td>
<%
		if(!"TS".equals(tmpArr[69])){

		imgsrc = "TVR".equals(tmpArr[69])? "../images/rejected.jpg" : "../images/approved.png";
%>
		<td width="3%" height="25" align="right" valign="middle" class="nav" ><img src="<%=imgsrc%>" border="0"></td>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="18%" height="25" align="left" valign="middle" class="nav" >APPROVED ON :</td>
		<td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[39]%></td>
<%
		}else{
%>
		<td colspan="4" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
<%
		}
%>
	</tr>
	<tr>
		<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
	<tr>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="25%" height="25" align="left" valign="middle" class="nav" >REMARKS :</td>
		<td colspan="5" height="25" align="left" valign="middle" class="normal"><%=tmpArr[40]%></td>
	</tr>
	<tr>
		<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
	<tr>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="25" align="left" valign="middle" class="nav">TRANSFEROR BRANCH HEAD :</td>
		<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[42]%></td>
<%
		if(!("TS".equals(tmpArr[69])|| "TVR".equals(tmpArr[69]))){

		imgsrc = "TPR".equals(tmpArr[69])? "../images/rejected.jpg" : "TV".equals(tmpArr[69])?  "../images/spacer.gif" : "../images/approved.png";

		String approvedOn = "TV".equals(tmpArr[69])?  "&nbsp;" : tmpArr[44];

%>
		<td width="3%" height="25" align="right" valign="middle" class="nav" ><img src="<%=imgsrc%>" border="0"></td>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
<%
			if(!"TV".equals(tmpArr[69])){
%>
		<td width="18%" height="25" align="left" valign="middle" class="nav" >APPROVED ON :</td>
		<td width="20%" height="25" align="left" valign="middle" class="normal"><%=approvedOn%></td>
<%
			}
		}else{
%>
		<td colspan="4" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
<%
		}
%>
	</tr>
	<tr>
		<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav underline" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
	<tr>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="25%" height="25" align="left" valign="middle" class="nav" >REMARKS :</td>
		<td colspan="5" height="25" align="left" valign="middle" class="normal"><%=tmpArr[45]%></td>
	</tr>
	<tr>
		<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
	<tr>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="25" align="left" valign="middle" class="nav">TRANSFEREE BRANCH HEAD :</td>
		<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[47]%></td>
<%
		if("TA".equals(tmpArr[69])|| "TAR".equals(tmpArr[69]) || "TCL".equals(tmpArr[69])|| "TAHR".equals(tmpArr[69])){

		imgsrc = "TAR".equals(tmpArr[69])? "../images/rejected.jpg" : "../images/approved.png";

		String approvedOn = "TV".equals(tmpArr[69])?  "&nbsp;" : tmpArr[49];

%>
		<td width="3%" height="25" align="right" valign="middle" class="nav" ><img src="<%=imgsrc%>" border="0"></td>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="18%" height="25" align="left" valign="middle" class="nav" >APPROVED ON :</td>
		<td width="20%" height="25" align="left" valign="middle" class="normal"><%=approvedOn%></td>
<%
		}else{
%>
		<td colspan="4" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
<%
		}
%>
	</tr>
	<tr>
		<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
	<tr>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="25%" height="25" align="left" valign="middle" class="nav" >REMARKS :</td>
		<td colspan="5" height="25" align="left" valign="middle" class="normal"><%=tmpArr[50]%></td>
	</tr>
	<tr>
		<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
	<tr>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="25" align="left" valign="middle" class="nav" >TRANSFEREE DEPT. HEAD :</td>
		<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[52]%></td>
<%
		if("TCL".equals(tmpArr[69])|| "TAHR".equals(tmpArr[69])){
		imgsrc = "TAHR".equals(tmpArr[69])? "../images/rejected.jpg" : "../images/approved.png";
%>
		<td width="3%" height="25" align="right" valign="middle" class="nav" ><img src="<%=imgsrc%>" border="0"></td>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="18%" height="25" align="left" valign="middle" class="nav" >APPROVED ON :</td>
		<td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[54]%></td>
<%
		}else{
%>
		<td colspan="4" height="25" align="right" valign="middle" class="nav">&nbsp;</td>
<%
		}
%>
	</tr>
	<tr>
		<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
	<tr>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="25%" height="25" align="left" valign="middle" class="nav" >REMARKS :</td>
		<td colspan="5" height="25" align="left" valign="middle" class="normal"><%=tmpArr[55]%></td>
	</tr>
	<tr>
		<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
<%	
	}else if("ADN".equals(tmpArr[35])){

%>
<table width="100%" border ="0" cellspacing="0" cellpadding="1">
	<tr class="greyBG">
		<td height="20px" width="1%" align="left" valign="middle" bgcolor="#F5F5F5" class="nav">&nbsp;</td>
		<td height="20px" width="25%" align="left" valign="middle" bgcolor="#F5F5F5" class="nav underline">ADN DETAILS</td>
		<td height="20px" colspan="5" align="left" valign="middle" bgcolor="#F5F5F5" class="nav">&nbsp;</td>
	</tr>
	<tr>
		<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
		<td width="25%" height="25" align="left" valign="middle" class="nav" >REASON :</td>
		<td colspan="5" height="25" align="left" valign="middle" class="normal"><%=tmpArr[74]%></td>
	</tr>
	  <tr>
		<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="underline" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	  </tr>
		<tr class="greyBG">
		<td height="20px" align="left" valign="middle" bgcolor="#F5F5F5" class="nav">&nbsp;</td>
		<td height="20px" align="left" valign="middle" bgcolor="#F5F5F5" class="nav underline">APPROVING HISTORY</td>
		<td height="20px" colspan="5" align="left" valign="middle" bgcolor="#F5F5F5" class="nav">&nbsp;</td>
		</tr>
		<tr>
			<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
			<td width="25%" height="25" align="left" valign="middle" class="nav" >AUTHORITY1 :</td>
			<td width="18%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[37]%></td>
<%
		if(!"DS".equals(tmpArr[69])){

		imgsrc = "DVR".equals(tmpArr[69])? "../images/rejected.jpg" : "../images/approved.png";
%>
			<td width="3%" height="25" align="right" valign="middle" class="nav" ><img src="<%=imgsrc%>" border="0"></td>
			<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
			<td width="18%" height="25" align="left" valign="middle" class="nav" >APPROVED ON :</td>
			<td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[39]%></td>
<%
		}else{
%>
			<td colspan="4" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
<%
		}
%>
	  </tr>
	  <tr>
		<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	  </tr>
	  <tr>
			<td align="left" valign="middle" class="nav" >&nbsp;</td>
			<td height="25" align="left" valign="middle" class="nav" >AUTHORITY2 :</td>
			<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[42]%></td>
<%
		if(!("DS".equals(tmpArr[69])|| "DV".equals(tmpArr[69])|| "DVR".equals(tmpArr[69]))){

			imgsrc = "DPR".equals(tmpArr[69])? "../images/rejected.jpg" : "../images/approved.png";
%>
			<td width="3%" height="25" align="right" valign="middle" class="nav" ><img src="<%=imgsrc%>" border="0"></td>
			<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
			<td width="18%" height="25" align="left" valign="middle" class="nav" >APPROVED ON :</td>
			<td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[39]%></td>
<%
		}else{
%>
			<td colspan="4" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
<%
		}
%>
		</tr>
		<tr>
			<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
		</tr>
		<tr>
			<td align="left" valign="middle" class="nav" >&nbsp;</td>
			<td height="25" align="left" valign="middle" class="nav" >FINANCE HEAD :</td>
			<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[47]%></td>
<%
		if(!("DS".equals(tmpArr[69])|| "DV".equals(tmpArr[69])|| "DVR".equals(tmpArr[69])|| "DP".equals(tmpArr[69])|| "DPR".equals(tmpArr[69]))){
		imgsrc = "DAR".equals(tmpArr[69])? "../images/rejected.jpg" : "../images/approved.png";
%>
			<td width="3%" height="25" align="right" valign="middle" class="nav"><img src="<%=imgsrc%>" border="0"></td>
			<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
			<td width="18%" height="25" align="left" valign="middle" class="nav" >APPROVED ON :</td>
			<td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[39]%></td>
<%
		}else{
%>
			<td colspan="4" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
<%
		}
%>
		</tr>
		<tr>
			<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
		</tr>
		<tr>
			<td align="left" valign="middle" class="nav" >&nbsp;</td>
			<td height="25" align="left" valign="middle" class="nav" >MAS HEAD :</td>
			<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[52]%></td>
<%
		if(!("DS".equals(tmpArr[69])|| "DV".equals(tmpArr[69])|| "DVR".equals(tmpArr[69])|| "DP".equals(tmpArr[69])|| "DPR".equals(tmpArr[69])|| "DA".equals(tmpArr[69])|| "DAR".equals(tmpArr[69]))){

		imgsrc = "DAHR".equals(tmpArr[69])? "../images/rejected.jpg" : "../images/approved.png";
%>
			<td width="3%" height="25" align="right" valign="middle" class="nav" ><img src="<%=imgsrc%>" border="0"></td>
			<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
			<td width="18%" height="25" align="left" valign="middle" class="nav" >APPROVED ON :</td>
			<td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[39]%></td>
<%
		}else{
%>
			<td colspan="4" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
<%
		}
%>
		</tr>
		<tr>
			<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
		</tr>
		<tr>
			<td align="left" valign="middle" class="nav" >&nbsp;</td>
			<td height="25" align="left" valign="middle" class="nav" >DIRECTOR :</td>
			<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[57]%></td>
<%
		if("DBH".equals(tmpArr[69])|| "DBHR".equals(tmpArr[69])|| "DCL".equals(tmpArr[69])|| "DIAR".equals(tmpArr[69])){

		imgsrc = "DBHR".equals(tmpArr[69])? "../images/rejected.jpg" : "../images/approved.png";
%>
			<td width="3%" height="25" align="right" valign="middle" class="nav" ><img src="<%=imgsrc%>" border="0"></td>
			<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
			<td width="18%" height="25" align="left" valign="middle" class="nav" >APPROVED ON :</td>
			<td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[39]%></td>
<%
		}else{
%>
			<td colspan="4" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
<%
		}
%>
		</tr>
		<tr>
			<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
		</tr>
<%
		//no director check starts
		if(!"0".equals(tmpArr[61])){

%>
		<tr>
			<td align="left" valign="middle" class="nav" >&nbsp;</td>
			<td height="25" align="left" valign="middle" class="nav" >MD/COO/CEO :</td>
			<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[62]%></td>
<%
			if("DCL".equals(tmpArr[69])|| "DIAR".equals(tmpArr[69])){

			imgsrc = "DIAR".equals(tmpArr[69])? "../images/rejected.jpg" : "../images/approved.png";
%>
			<td width="3%" height="25" align="right" valign="middle" class="nav" ><img src="<%=imgsrc%>" border="0"></td>
			<td width="1%" align="left" valign="middle" class="nav" >&nbsp;</td>
			<td width="18%" height="25" align="left" valign="middle" class="nav" >APPROVED ON :</td>
			<td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[39]%></td>
<%
			}else{
%>
			<td colspan="4" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
<%
			}
%>
		</tr>
		<tr>
			<td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
		</tr>

<%	
		}//no director check ends
	}
		} //end of for
	}//end of else
%>
</table>
</form>
</body>
</html>