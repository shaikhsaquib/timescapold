<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/daily.js"></script>
<script Language="JavaScript" src="../jscripts/common.js"></script>


<table width="100%" border="0" cellpadding="1" cellspacing="1">
<%
	String header = (String)request.getParameter("header");
	String subHeadId = (String)request.getParameter("subHeadId");
	int frequency = Integer.parseInt((String)request.getParameter("frequency"));
	String date = (String)request.getParameter("date");
	String roleId = (String)session.getAttribute("roleId");
	//out.println(subHeadId);
// String subHeaderArr[] =new String[10];
//	int count=0;

 ArrayList subHeaderResult = new ArrayList();
	 String search = "subHeader"; 
	 String subHeader = "";
     
     subHeaderResult = policyController.viewPolicies(search, header, subHeader, timescapeUserOId, frequency, roleId, date);


	for(int ii=0;ii<subHeaderResult.size();ii++){

		String[] tmpArr = (String [] )subHeaderResult.get(ii); 

%>
	
	<tr>
		<td height="20px" colspan = "100%" align="left" valign="middle" bgcolor="#F3F5D6" class="subHeadCompliance" onclick="displayControls('<%=Utility.replaceAmparsandURL(header)%>','<%=Utility.replaceAmparsandURL(tmpArr[0])%>',<%=subHeadId%>,<%=ii%>,<%=frequency%>, '<%=date%>')"><img src="../images/greenArrow.png" border="0" >&nbsp;<%=tmpArr[0]%></td>
	</tr>
<!-- 	<tr>
		<td colspan="100%" height="1px" bgcolor="#FFFFFF"><block type="spacer" height="1px"></td>
	</tr>
 -->	
	<tr>
		<td height="20px" align="left" id="controls<%=subHeadId%><%=ii%>"  style="display:none;" colspan = "100%"  valign="middle" bgcolor="#FFFFFF">&nbsp;</td>
	</tr>
<%
	} 
%>
</table>