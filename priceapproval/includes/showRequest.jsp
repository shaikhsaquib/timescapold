<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>PURCHASE APPROVAL</title>

<link href="style/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/util.js"></script>
<script Language="JavaScript" src="../jscripts/common.js"></script>
<script Language="JavaScript" src="../jscripts/search.js"></script>
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>

<body>
<%
	String projectName= request.getParameter("projectName");
	String budget= request.getParameter("budget");
	
	ArrayList projectList = priceApprovalWebController.getProjectData("Projects",projectName);
	//ArrayList totalBudg = priceApprovalWebController.totalBug("Projects",projectName);
	//String totalBudget[ ] = (String[ ]) totalBudg.get(0);
	int totalBug = Integer.parseInt(budget);
    //String = "hi";
	int negAmt=0;
	

%>

<table width="100%" border="0">

	<tr>
		<td width ="10%" class="travelMenuBG" bgcolor="#fbf9f9" >PAR No.</td>
		<td width ="45%" class="travelMenuBG" bgcolor="#fbf9f9">Description</td>
		<td width ="25%" class="travelMenuBG" bgcolor="#fbf9f9">Value(Negotiated value)</td>
		<td width ="20%" class="travelMenuBG" bgcolor="#fbf9f9">Status(Approved/In process)</td>
	</tr>

	<%
		for(int ii=0 ; ii < projectList.size( ); ii++) {

		String project[ ] = (String[ ]) projectList.get(ii); 
					
		negAmt =negAmt+Integer.parseInt(project[1]);
	%>
		<tr>
		<td width ="10%" bgcolor="#fbf9f9"><%=ii+1%></td>
		<td width ="45%" bgcolor="#fbf9f9"><%=project[0]%></td>
		<td width ="25%" bgcolor="#fbf9f9">&nbsp;&nbsp;<%=project[1]%></td>
<!-- 		<td width ="20%"><%=project[2]%></td> -->
		<td width ="20%" bgcolor="#fbf9f9">&nbsp;&nbsp;<%if(project[2].equals("UC")||project[2].equals("L")){%><img src="images/inprocess.png"><%}else if(project[2].equals("R")){%><img src="images/rejected.png"><%}else if(project[2].equals("URE")){%><span class="small"> Review </span><%}else if(project[2].equals("CL")){%><img src="images/approved.png"><%}%></td>
		</tr>
		
	<%
		}
	%>



	
<!-- 	<tr>
		<td width ="10%">&nbsp;</td>
		<td width ="45%">&nbsp;</td>
		<td width ="25%">&nbsp;</td>
		<td width ="20%">&nbsp;</td>
	</tr>

	<tr>
		<td width ="10%">&nbsp;</td>
		<td width ="45%">&nbsp;</td>
		<td width ="25%">&nbsp;</td>
		<td width ="20%">&nbsp;</td>
	</tr>

 --><tr>
		<td width ="10%" bgcolor="#fbf9f9">Total:</td>
		<td width ="25%" bgcolor="#fbf9f9">&nbsp;</td>
		<td width ="20%" bgcolor="#fbf9f9">&nbsp;&nbsp;<%=negAmt%>&nbsp;</td>
		<td width ="35%" bgcolor="#fbf9f9">&nbsp;</td>
	</tr>
		
	<tr>
		<td width ="10%" bgcolor="#fbf9f9" >Balance:</td>
		<td width ="25%" bgcolor="#fbf9f9">&nbsp;</td>
		<td width ="20%" bgcolor="#fbf9f9">&nbsp;&nbsp;<% int bal= totalBug-negAmt; out.println(bal);%></td>
		<td width ="35%"bgcolor="#fbf9f9">&nbsp;</td>
	</tr>


</table>
</body>
</html>
