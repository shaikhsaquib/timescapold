<%@ page language="java" %>
 <link href="../style/compliance.css" rel="stylesheet" type="text/css" />
 <%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/headerMenu.jsp" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.Calendar, java.util.Date" %>
<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>
<script src="../jscripts/admin.js" type="text/javascript"></script>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />

<%
	
	Hashtable detailsHash = new Hashtable();
	ArrayList policyResult = new ArrayList();   

	detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	detailsHash.put("MODIFIEDBY", timescapeUserOId+"");
	detailsHash.put("STATUS", "L");
		
	policyResult = governanceadministrationcode.getMyAdminRequest(detailsHash);

%>

<body>
<table width ="100%" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td>
			<%@ include file="../includes/menu.jsp" %>
		</td>
	<tr>
<table>
<form name="frmAdminEdit" method="post" >
<table width="99%" align="center" cellpadding="4" cellspacing="2" border="0">
	<tr class="travelMenuBG">
		<td width="1%"  height="20px" align="left" valign="middle">NO</td>
		<td width="20%"  height="20px" align="left" valign="middle">QUESTION</td>
		<td width="10%"  height="20px" align="left" valign="middle">ACTION</td>
	</tr>
<%
if(policyResult.size()>0)
{
	for(int i=0; i<policyResult.size(); i++)
	{
		String[] resultData = (String[])policyResult.get(i); 
%>
<input type="hidden" name="questionno<%=i%>" id="questionno<%=i%>" value="<%=resultData[1]%>">
	<tr bgcolor="#f6f6f6" height="30px">
		  <td align="left"  class="normal"><%=i+1%></td>
		  <td align="left" class="normal"><div id ="text<%=i%>" name ="text<%=i%>"><%=resultData[0].trim()%></div>
		 <textarea class="textArea" style="display:none;" rows="3" cols="65" name ="myTextBox<%=i%>" id ="myTextBox<%=i%>" ><%=resultData[0].trim()%></textarea></td>
		 <td align="left" class="normal big"><%if (resultData[2].equals("EXISTS")){%>In Process<%}else{%><a href="javascript:void(0)" onClick ="editdelete('<%=i%>')" id="edit<%=i%>" class="normal big">EDIT</a><%}%></td>
	</tr>
	<tr>
		<td colspan="100%" ></td>
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
</body>
</html>
