<html>
<head>
<%@ page language="java" %>
<%@ include file="../includes/headerMenu.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
<script src="../jscripts/admin.js" type="text/javascript"></script>

<%
	String status = "'L','A','R'";
	ArrayList policyResult = new ArrayList();   
   
	Hashtable detailsHash = new Hashtable();

	detailsHash.put("COMPANYCODE", companyCode);
	detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	detailsHash.put("DEPTNAME", deptName);
	detailsHash.put("LOCATION", locationCode);
	detailsHash.put("STATUS", status);

	policyResult = governanceadministrationcode.getAdminRequest(detailsHash);
	
%>
</head>
<body>
<table width="85%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<%@ include file="../includes/menu.jsp" %>
		</td>
	<tr>
</table>
<form name="frmAdminRequests" method="post" >
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td align="right" class="normal">In Process <img src="../images/inProcess.png" width="20" height="20"/>Approved <img src="../images/approved.png" width="20" height="20"/>Rejected<img src="../images/rejected.jpg" width="20" height="20"/></td>
	</tr>
</table>
<table width="99%" align="center" cellpadding="0" cellspacing="2" border="0">
   <tr class="travelMenuBG">
		<td width="10%"  height="25" align="left" valign="middle" >USER</td>
		<td width="10%" align="left" valign="middle" >CURRENT APPROVER</td>
		<td width="10%" align="left" valign="middle" >CHANGE APPROVER</td>
		<td width="10%" align="left" valign="middle"  >USER REMARKS</td>
		<td width="10%" align="left" valign="middle"  >REMARKS</td>
		<td width="5%" align="left" valign="middle" >ACTION</td>
  </tr>
<%
if(policyResult.size()>0)
{
	for(int i=0; i<policyResult.size(); i++)
	{
		String[] resultData = (String[])policyResult.get(i); 
%>
<input type="hidden" name="requestoroid<%=i%>" id="requestoroid<%=i%>" value="<%=resultData[1]%>">
<input type="hidden" name="approveroid<%=i%>" id="approveroid<%=i%>" value="<%=resultData[3]%>">
	<tr bgcolor="#f6f6f6">
	    <td align="left" class="normal"valign="middle" ><%=resultData[0]%></td>
		<td align="left" class="normal"valign="middle" ><%if (resultData[5].equals("0")){%>-<%}else{%><%=resultData[5]%><%}%></td>
		<td align="left" class="normal"valign="middle" ><%=resultData[2]%></td>
		<td align="left" class="normal"valign="middle" ><%=resultData[6]%></td>
		<td align="left" class="normal"valign="middle" ><%if (resultData[7].equals("A") || resultData[7].equals("R")){%><%=resultData[9]%><%}else{%><textarea rows="5" cols="30" class = "style3" name = "remarks<%=i%>" id ="remarks<%=i%>" style ="height:30px;width:160px;"></textarea><%}%></td>

		<td height="30" align="center" valign="middle" class="normal"><span><%if(resultData[7].trim().equals("L")) {%><img src="../images/inProcess.png" width="21" height="20" /><%}else if(resultData[7].trim().equals("A")) {%><img src="../images/approved.png" width="21" height="20" /><%}else if(resultData[7].trim().equals("R")) {%><img src="../images/rejected.jpg" width="21" height="20" /><%}%></span><%if(resultData[7].trim().equals("L")) {%><span><a href="javascript:void(0);" onclick="update('<%=i%>','AC' )" class="normal underline" id="accept<%=i%>">Accept</a>&nbsp;/&nbsp;<a href="javascript:void(0);" onclick="update('<%=i%>','RJ')" class="normal underline">Reject</a><%}%></td>
	</tr>
<%	
			}//end of if for self

		}//end of for

	if(policyResult.size()==0){
%>
	<tr>
		<td height="30" align="center" valign="middle" class="bold" colspan="100%">There are no data to view!!</td>
	</tr>

<%	
	}//end of else
%> 
</table>
</form>
</body>
</html>