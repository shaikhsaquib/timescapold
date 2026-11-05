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
	String compCode1       = (String)request.getParameter("compCode1");
	String existApprover   = (String)request.getParameter("existAppr");
	String deptCode1	   = (String)request.getParameter("deptCode1");
	String newApprover	   = (String)request.getParameter("inputString");

	String status = "A";

	Hashtable detailsHash = new Hashtable();

	detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	detailsHash.put("COMPCODE1", compCode1);
	detailsHash.put("DEPTCODE1", deptCode1);
	detailsHash.put("EXISTAPPROVER", existApprover);
	detailsHash.put("NEWAPPROVER", newApprover);
	detailsHash.put("STATUS", status);

	boolean approveFlag = false;

	approveFlag = governanceadministrationcode.getUpdateRequest(detailsHash);

	//out.println("approverResult=="+approveFlag);

if(approveFlag){
%>      
<body>
<p align="center" class="style4">Acknowledgement</p>
		<p align="center" class="style3">Your Approver has been processed successfully. </p>
	<table width="100%" border="0" cellspacing="2" cellpadding="0">
	<tr bgcolor="#FFFFFF">
       <td colspan="3" align="center" class="normal">&nbsp;Click here to 
            <a href="compDeptRequest.jsp">Return</a>
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
	