<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%> 
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 

<%
	String roleId = (String)request.getParameter("roleId");
	String mainRoleId = (String)request.getParameter("mainRoleId");

	String currLink = "";
%>
<html>
<head>
<meta http-equiv="Cache-control" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Daily Controls</title>
	<link href="../style/compliance.css" rel="stylesheet" type="text/css" />
	<link href="../style/calendarControl.css"rel="stylesheet">
	<script Language="JavaScript" src="../jscripts/jquery-1.3.2.min.js"></script>
	<script Language="JavaScript" src="../jscripts/daily.js"></script>
	<script Language="JavaScript" src="../jscripts/common.js"></script>
	<script src="../jscripts/calendarControl.js"language="javascript"></script>
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript">
    $(document).ready(function(){
		
		var role = $('#roleId').val();
		var mainRole = $('#mainRoleId').val();
		
		if(role == 2)
		{
			//showHeader('../approver/approveDaily.jsp','DAILY','2');
			
			dispReportHeader('ENSURE COMPLIANCE',mainRole,2,2);

		}else if(role == 3)
		{
			dispReportHeader('REPORT',mainRole,3,3);

		}
		else if(role == 1)
		{
			//alert("hi");
			//showHeader('../requestor/daily.jsp','DAILY','1');
			dispReportHeader('MY COMPLIANCE',mainRole,1,1);
		}

	});
	</script>

</head>
<body>

<form name="frmCreateRequest" method = "post" action = "">
<input type="hidden" name="roleId" id="roleId" value="<%=roleId%>">
<input type="hidden" name="mainRoleId" id="mainRoleId" value="<%=mainRoleId%>">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#98BF00" colspan="2" ><img src="../images/header.jpg" width="519px" height="39"/></td>
  </tr>
  <tr>
  <td bgcolor="FFFFFF" align="right" width="70%" class="style2"><a href="/player/ocavideo.html">WATCH THIS VIDEO ON OPERATIONAL CONTROL</a></td>
  <td bgcolor="FFFFFF" align="center" class="style2" width="10%"><a href="../common/download.jsp?f=OperationalControls_FAQs.pdf" >Help</a></td>
  </tr> 
</table>

<%
	int noOfColumns = 7;

	//String currLink		= (String) session.getAttribute("currLink");
	//String topLink		= (String) session.getAttribute("topLink");
	String topLink		= roleId;

	String darkcolor 			= "#000000";
	String litecolor 			= "#999999";

	ArrayList menus = (ArrayList) session.getAttribute("policyComplianceMenu");

%>
<table width="100%" border="0" cellspacing="1" cellpadding="0" align="center">
	<tr>
		<td  class="normal" colspan="100%" align="left" height="20px">
<%
	int cnt = 0;
	for(int kk=0; kk<menus.size(); kk++)
	{
		String headerName ="";
		String[] arr = (String[])menus.get(kk);
	
		if(arr[0].equals(arr[1]))
		{
			cnt++;
			//out.println("topLink---"+topLink+"----arr[1]--"+arr[1]);
			if(topLink.equals(arr[1])) 
			{
			
%>
			<a href="#" onclick="javascript:dispReportHeader('<%=arr[2]%>','<%=mainRoleId%>','<%=topLink%>','<%=arr[1]%>');" id = "head1" class="style4" ><%=arr[2]%></a>&nbsp;&nbsp;|&nbsp;&nbsp;
<%
			}
			else
			{
				

						if("REPORT".equals(arr[2])) 
						{
							//out.println("arr[3]--"+arr[3]);
%>
							<a href="#" onclick="javascript:dispReportHeader('<%=arr[2]%>','<%=mainRoleId%>','<%=topLink%>','<%=arr[1]%>');" id = "head2" class="style4" ><%=arr[2]%></a>&nbsp;&nbsp;|&nbsp;&nbsp;
<%
						}else
						{	
%>
							<a href="#" onclick="javascript:dispReportHeader('<%=arr[2]%>','<%=mainRoleId%>','<%=topLink%>','<%=arr[1]%>');" id = "head0" class="style2" ><%=arr[2]%></a>&nbsp;&nbsp;|&nbsp;&nbsp;

<%
						}
			}
		}
	}
%>
		</td>

<%
	//for(; cnt<noOfColumns;cnt++)
	//{
%>
	<!-- 	<td class="normal" width="150px" align="center" height="20px">
		</td> -->
<%
	//}
%>
	</tr>
	</table>
<table width="100%" border="0" cellspacing="1" cellpadding="0" align="center">
	<tr>
<%
	for(int kk=0; kk<menus.size(); kk++)
	{
		String[] arr = (String[])menus.get(kk);

		String name ="";

		//if(!arr[0].equals(arr[1]) && topLink.equals(arr[1]))
		if(!arr[0].equals(arr[1]))
		{			
			name = arr[2].replaceAll("\\s","");

			//if(arr[3].equalsIgnoreCase(currLink))
			if(arr[1].equals("2"))
			{

				//out.println("--aaa----");
				name = name+"1";
%>
		<td class="default1" align="center" width="150px" height="15px" id="<%=name%>">
<!-- 			<a href="<%//=arr[3]%>" class="freqMenu"><strong><%//=arr[2]%></strong></a>  -->
 			<a href="#" onclick="javascript:showHeader('<%=arr[3]%>','<%=name%>','2');" class="freqMenu"><strong><%=arr[2]%></strong></a>
		</td>
<%
			}
			else if(arr[1].equals("1"))
			{

%>
		<td class="default0" align="center" valign="middle" width="150px" height="15px" id="<%=name%>">
			<a href="#" onclick="javascript:showHeader('<%=arr[3]%>','<%=name%>','1');" class="freqMenu"><%=arr[2]%></a>
		</td>
<%
			}
			
		}
	}
%>
</tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="0" align="center">
<tr><td align="center">
<div id="showdetails"></div>
</td></tr></table>

</form>
</body>
</html>