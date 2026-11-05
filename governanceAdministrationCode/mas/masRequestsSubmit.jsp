<%@ page language="java" %>
<%@ include file="../includes/headerMenu.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<link href="../style/global.css" rel="stylesheet" type="text/css" />	
 <link href="../style/compliance.css" rel="stylesheet" type="text/css" />
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.Calendar, java.util.Date" %>
<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>

<%
	String flag       = (String)request.getParameter("flag");
	String adminoid	  = (String)request.getParameter("adminoid");
	String questions  = (String)request.getParameter("questions");
	String questionno = (String)request.getParameter("questionno");
	String requestid  = (String)request.getParameter("requestid");
	String remarks	  = (String)request.getParameter("remarks");
	
	boolean updateFlag = false;
	Hashtable detailsHash = new Hashtable();

	if (flag.equals("AC")) 
		{
		detailsHash.put("FLAG", "AC");
		detailsHash.put("STATUS", "A");
		}
		else
		{
		detailsHash.put("FLAG", "RJ");
		detailsHash.put("STATUS", "R");
	}

		detailsHash.put("REMARKS", remarks);
		detailsHash.put("QUESTIONS", questions);
		detailsHash.put("QUESTIONNO", questionno);
		detailsHash.put("REQUESTID", requestid);
		detailsHash.put("ADMINOID", adminoid+"");
		detailsHash.put("MODIFIEDBY", timescapeUserOId+"");
		detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");

	updateFlag = governanceadministrationcode.updateMas(detailsHash);

if(updateFlag){
%>      
<body>
<p align="center" class="style4">Acknowledgement</p>
		<p align="center" class="style3">your request has been processed successfully. </p>
	<table width="100%" border="0" cellspacing="2" cellpadding="0">

		<tr bgcolor="#FFFFFF">
       <td colspan="3" align="center" class="normal">&nbsp;Click here to 
            <a href="masRequest.jsp">Return</a>
       </td>
    </tr>

	</table>                   
<% 
}else{                
%>                   

<p align="center" class="style4">Error</p>
<p align="center" class="style3">There is an error while updating<span class="style4">  </span>. Please try again.</p>

<table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tr bgcolor="#FFFFFF">
       <td colspan="3" align="center" class="normal">&nbsp;
            <input type="button" name="Back" value="Back" onclick="javascript:history.back()">
       </td>
    </tr>

</table>
<%
}
%>
</body>
</html>
	
     
