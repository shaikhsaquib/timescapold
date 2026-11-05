<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.Calendar, java.util.Date" %>

<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController" />
<%
	ArrayList reqList = new ArrayList();
	Hashtable detailsHash = new Hashtable();

	detailsHash.put("STATUS", "'UC'");
	detailsHash.put("REVIEWEDBY", timescapeUserOId+"");

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
		<script src="../jscripts/common.js" type="text/javascript"></script>
		<script src="../jscripts/jquery.js" type="text/javascript"></script>
	</head>

<body>
<form name="frmReviewRequests" method="post" >
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
      <td height="20" bgcolor="#E7EAEF" class="budgetMenuBG">&nbsp;REVIEW ASSETS</td>
    </tr>
  <td height="5"></tbody>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right" class="normal">In Process <img src="../images/inProcess.png" width="13" height="13"/> | Available<img src="../images/available.png" width="20" height="20" /> | Retained <img src="../images/retain.png" width="13" height="13"/> | Deleted <img src="../images/widraw.jpg" width="13" height="13"/>| Closed <img src="../images/closed.png" width="13" height="13"/>| ATN In Process <img src="../images/ATN_Process.png" width="50" height="20"/>| ATN Completed <img src="../images/ATN_com.png" width="50" height="20"/>| ADN In Process <img src="../images/ADN_Process.png" width="50" height="20"/>| ADN Completed <img src="../images/ADN_com.png" width="50" height="20"/></td>
  </tr>
  <tr>
	<td colspan="100%" height="3px">&nbsp;</td>
  </tr>
</table>
<table width="99%" align="center" cellpadding="0" cellspacing="2" border="0">
  <tr class="greyBG">
    <td width="4%" height="29" align="center" valign="middle" >NO.</td>
    <td width="12%" align="center" valign="middle">ASSET</td>
    <td width="7%" align="center" valign="middle">ASSET NO</td>
    <td width="10%" align="center" valign="middle"> CATEGORY</td>
    <td width="8%" align="center" valign="middle">TYPE</td>
    <td width="18%" align="center" valign="middle">LOCATION</td>
    <td width="10%" align="center" valign="middle">POSTING  DATE</td>
    <td width="17%" align="center" valign="middle">OWNERSHIP</td>
	<td width="8%" align="left" valign="middle"><input  type="radio" id="accept" name="accrej" onClick="selectAll('accept')" />&nbsp;ACCEPT</td>
	<td width="8%" align="left" valign="middle"><input type="radio" id="accept" name="accrej" onClick="selectAll('reject')" />&nbsp;REJECT</td>   </tr>
	<input type="hidden" name="size" value="<%=reqList.size()%>">
<%

	if(reqList.size()==0){
%>
   <tr>
    <td height="20" colspan="100%"><hr></td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle" class="bold" colspan="100%">There are no request(s) to review!!</td>
  </tr>
   <tr>
    <td height="20" colspan="100%"><hr></td>
  </tr>

<%
	}else{

		for(int ii=0; ii< reqList.size(); ii++){

			String tmpArr[] = (String [])reqList.get(ii);
//out.println(reqList.size());

%>
  <tr>
	<input type="hidden" id="updateStatus<%=ii%>" name="updateStatus<%=ii%>" value="">
	<input type="hidden" id="requestId<%=ii%>" name="requestId<%=ii%>" value="<%=tmpArr[0]%>">
	<input type="hidden" id="counter" name="counter" value="">
	<input type="hidden" id="remarks<%=ii%>" name="remarks<%=ii%>" id="remarks<%=ii%>" value="-">
    <td height="30" align="center" valign="middle" class="normal"><%=ii+1%></td>
    <td height="30" align="left" valign="middle" class="boldunderline"><a href="javascript:void(0);" onclick="showDetails('<%=tmpArr[0]%>')" class="boldunderline" ><%=tmpArr[3]%></a></td>
    <td height="30" align="left" valign="middle" class="normal"><%=tmpArr[1]%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[4]%></td>
    <td align="center" valign="middle" class="normal"><%=tmpArr[5]%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[9].indexOf("-")>-1?tmpArr[9].substring(tmpArr[9].indexOf("-")+1).trim():tmpArr[9]%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[20].substring(0,tmpArr[20].indexOf(" "))%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[19]%></td>
    <td height="30" align="left" valign="middle" class="normal">
	<input type="checkbox" id="accept<%=ii%>" name="accept<%=ii%>" value="VR" onClick="atoggle('<%=ii%>')" ></td>
	<td height="30" align="left" valign="middle" class="normal">
	<input type="checkbox" id="reject<%=ii%>" name="reject<%=ii%>" onClick="showRemarksBox('<%=ii%>');rtoggle('<%=ii%>')" value="RR"></td>
  </tr>
	<tr id="rem<%=ii%>" style="display:none;">
		<td colspan="100%" align="right" class="normal"><textarea name="rejectRem<%=ii%>" id="rejectRem<%=ii%>" cols="30" rows="2" class="normal" onKeyDown="return imposeMaxLength(event, this, 100, 'remLen<%=ii%>');" onKeyUp="return imposeMaxLength(event, this, 100, 'remLen<%=ii%>');"></textarea><input readonly type="text" name="remLen" id="remLen<%=ii%>" size="2" maxlength="2" value="100" class="normal">characters left&nbsp;&nbsp;</td>
	</tr>
  <tr>
    <td height="1" colspan="9" align="left" valign="middle" bgcolor="#F7F7F7"><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
<%	
		}//end of for
	}//end of else
%>

<tr <% if(reqList.size()==0){%>style="display:none;"<%}else{%> style="display:block;"<%}%>><td colspan="9" align="center"><input name="button7" type="button" class="button" id="button7" value="Submit The Review" onclick="update(<%=reqList.size()%>)" /></td></tr>

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
<!-- changes start 2/20/2014 -->
	<input type="hidden" name="acounter" id="acounter" value="">
	<input type="hidden" name="rcounter" id="rcounter" value="">
	<input type="hidden" name="remarr" id="remarr" value="">
	<input type="hidden" name="count" id="count" value="<%=reqList.size()%>">
<!-- changes end  -->
</form>
</body>
</html>
