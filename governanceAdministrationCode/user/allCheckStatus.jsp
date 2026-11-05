<%@ page language="java" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/headerMenu.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>	
<html>
<head>
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
<link href="../style/global.css" rel="stylesheet" type="text/css" />	
<script Language="JavaScript" src="../jscripts/report.js"></script>
</head>
<%

     Hashtable detailsHash = new Hashtable();
     String status = "'L','A','R'";

	 detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId);
	 detailsHash.put("STATUS", status);
	 ArrayList result= new ArrayList();
 
	 result = governanceadministrationcode.selectCheckStatus(detailsHash);
	
%>
<body>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
		<td align="right" class="normal">In Process <img src="../images/inProcess.png" width="20" height="20"/>Approved <img src="../images/approved.png" width="20" height="20"/>Rejected<img src="../images/rejected.jpg" width="20" height="20"/></td>
  </tr>
</table>
<table width="99%" align="center" cellpadding="0" cellspacing="2" border ="0">
  <tr class="travelMenuBG">
	<td width="15%"   height="29" align="center" >USER</td>
	<td width="15%" align="center" >CURRENT APPROVER</td>
	<td width="15%" align="center" >CHANGE APPROVER</td>
	<td width="15%" align="center" >REMARKS</td>
	<td width="15%" align="center" >APPROVER REMARKS</td>
	<td width="5%" align="center" >STATUS</td>
  </tr>
<%
if(result.size()>0)
{
	for(int i=0; i<result.size(); i++)
	{
		String[] resultData = (String[])result.get(i); 
%>
 <tr bgcolor="#f6f6f6">
	<td align="center" class="normal" height="29"><%=resultData[0]%></td>
	<td align="center" class="normal" ><%if(resultData[5].equals("0")){%>-<%}else{%><%=resultData[5]%><%}%></td>
	<td align="center" class="normal" ><%=resultData[2]%></td>
	<td align="center" class="normal" ><%=resultData[6]%></td>
	<td align="center" class="normal" ><%if(resultData[9].equals("NA")){%>-<%}else{%><%=resultData[9]%><%}%></td>
	<td align="center" class="normal" ><%if(resultData[7].trim().equals("L")) {%><img src="../images/inProcess.png" width="21" height="20" /><%}else if(resultData[7].trim().equals("A")) {%><img src="../images/approved.png" width="21" height="20" /><%}else if(resultData[7].trim().equals("R")) {%><img src="../images/rejected.jpg" width="21" height="20" /><%}%></td>

 </tr>
<%	
	    }//end of if for self

%>	
  <tr>
	<td colspan="100%" height="20px"></td>
  </tr>
  <tr>
	<td  height="1px" align="center" colspan ="100%"> <input type="button" name="Back" value="Back"  align="center" onclick="javascript:history.go(-2)"/> </td>
  </tr>
<%
	 }//end of for

   if(result.size()==0){
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