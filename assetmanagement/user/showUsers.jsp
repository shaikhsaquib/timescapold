<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date" %>
<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController" />

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>SURPLUS ASSET MANAGEMENT</title>
		<script src="../jscripts/viewDetails.js" type="text/javascript"></script>
	<style>
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
.greyBG {
	FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif;
	COLOR: #333333;
	FONT-SIZE: 7pt;
	FONT-WEIGHT: bolder;
	TEXT-DECORATION: none;
	background-image: url(../images/greybg.jpg);
	background-repeat: repeat-x;
	background-position: left top;
}
	.normal {
		FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 8pt; FONT-WEIGHT: normal; TEXT-DECORATION: none
	}
	.nav {
		TEXT-TRANSFORM: none; FONT-VARIANT: normal; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 10px; FONT-WEIGHT: bold; TEXT-DECORATION: none
	}
	.navnormal {
		TEXT-TRANSFORM: none; FONT-VARIANT: normal; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 10px; FONT-WEIGHT: normal; TEXT-DECORATION: none
	}
	</style>
	</head>
<body>
<table width="100%" align="center" cellpadding="0" cellspacing="2">
  <tr class="greyBG">
    <td width="3%" height="29" align="center" valign="middle" >No.</td>
    <td width="20%" align="center" valign="middle">Name</td>
    <td width="20%" align="center" valign="middle">Department</td>
    <td width="13%" align="center" valign="middle">Email-ID</td>
    <td width="14%" align="center" valign="middle">Date</td>
    <td width="15%" align="center" valign="middle">Action</td>
  </tr>
  <tr>
    <td height="1" colspan="9" align="left" valign="middle" bgcolor="#F7F7F7"><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>

<%		
	String requestId = (String) request.getParameter("requestId");
	String review = (String) request.getParameter("review");

	Hashtable detailsHash = new Hashtable();
	ArrayList usersList = new ArrayList();

	detailsHash.put("REQUESTID", requestId);     

	usersList = assetMgmt.getInterestedUsers(detailsHash);

	for(int ii=0; ii< usersList.size(); ii++){
			
		String tmpArr[] = (String[])usersList.get(ii);
%>
		
  <tr class="normal">
    <td height="29" align="center" valign="middle" ><%=ii+1%></td>
    <td align="left" valign="middle"><%=tmpArr[3]%></td>
    <td align="center" valign="middle"> <%=tmpArr[4]%></td>
    <td align="center" valign="middle"><a href="mailto:<%=tmpArr[5]%>" class="underline"><%=tmpArr[5]%></a></td>
    <td align="center" valign="middle"> <%=tmpArr[6]%></td>
    <td align="center" valign="middle">
<%
	if(review.equals("user")){
		if(tmpArr[9].equals("IA")){	  
%>
		Request Accepted.
<%
		}else if(tmpArr[9].equals("IR")){	  
%>
		Request Rejected.
<%
		}else{
%>

	  <span id=markResp<%=ii%>><a href="#" onclick="respond(<%=ii%>, <%=tmpArr[0]%>, <%=tmpArr[1]%>, 'IA', 'showUser')" class="underline">Accept</a> / <a href="#" onclick="respond(<%=ii%>, <%=tmpArr[0]%>, <%=tmpArr[1]%>, 'IR', 'showUser')" class="underline">Reject</a></span>
	  
<%
		}
	}else if(review.equals("reviewer")){
%>
	&nbsp;--&nbsp;
 <%	
	}//end of main if else	
%>
  </td>
  </tr>
  <tr>
    <td height="1" colspan="9" align="left" valign="middle" bgcolor="#F7F7F7"><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>

<%
	}//end of for
%>
</table>
</body>
</html>
