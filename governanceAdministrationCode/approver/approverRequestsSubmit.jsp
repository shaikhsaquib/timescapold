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

	String flag              = (String)request.getParameter("flag");
	String requestoremailid	 = (String)request.getParameter("requestoremailid");
	String remarks	         = (String)request.getParameter("remarks");

	String unremarks = remarks.equals("NA") || remarks == null || remarks.equals("NA")? "-" : remarks;

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
		detailsHash.put("REQUESTOREMAILID", requestoremailid);
		detailsHash.put("MODIFIEDBY", timescapeUserOId+"");
		detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");

	updateFlag = governanceadministrationcode.updateApprover(detailsHash);

if(updateFlag){
%>      
<body>
<p align="center" class="style4">Acknowledgement</p>
		<p align="center" class="style3">your request has been processed successfully.</p>
	<table width="100%" border="0" cellspacing="2" cellpadding="0">

		<tr bgcolor="#FFFFFF">
       <td colspan="3" align="center" class="normal">&nbsp;Click here to 
            <a href="approverRequest.jsp">Return</a>
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
	
