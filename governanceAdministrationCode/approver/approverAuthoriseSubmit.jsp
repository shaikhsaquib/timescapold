<%@ page language="java" %>
<%@ include file="../includes/empHeader.jsp" %>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.Calendar, java.util.Date" %>
<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>

<%
	String index	 = (String)request.getParameter("index");
	String userId	 = (String)request.getParameter("userId");
	
	boolean updateFlag = false;
	Hashtable detailsHash = new Hashtable();

	detailsHash.put("USEROID", userId);
	detailsHash.put("STATUS", "C");
	detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	detailsHash.put("MODIFIEDBY", timescapeUserOId+"");

	updateFlag = governanceadministrationcode.updateApproverAuthorise(detailsHash);

 if(updateFlag)
 {
 //out.println("<span class = \"hrblue\">The user has been deteled successfully for this Question.</span>");
 %>

 <p align="center" class="style4">Acknowledgement</p>
		<p align="center" class="style3">User has been<span class="style4"> deleted</span> successfully. </p>
	<table width="100%" border="0" cellspacing="2" cellpadding="0">

		<tr bgcolor="#FFFFFF">
       <td colspan="3" align="center" class="normal">&nbsp;Click here to 
            <a href="approverAuthorise.jsp">Return</a>
       </td>
    </tr>

	</table>  
		<%
 }
 else
{
	 //out.println("<span class = \"hrblue\">There was an error while deleting user for this Question. Kindly try again.</span>");
 %>
	 <p align="center" class="style4">Error</p>
<p align="center" class="style3">There is an error while updating<span class="style4">  </span>. Please try again.</p>

<table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tr bgcolor="#FFFFFF">
      <td colspan="3" align="center" class="normal">&nbsp;Click here to 
            <a href="approverAuthorise.jsp">Return</a>
       </td>	
    </tr>

</table>
<%
 }
%>      

