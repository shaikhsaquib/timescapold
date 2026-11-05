<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" %>
<%@page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar, java.util.Date, java.text.*" %>
<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>

 <title>OCA Report</title>
	<%@ include file="../includes/headerMenu.jsp" %>
	<%@ include file="../includes/empHeader.jsp" %>
	<link href="../style/global.css" rel="stylesheet" type="text/css" />
	 <link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
    <script Language="JavaScript" src="../jscripts/report.js"></script>
	<script src="../jscripts/ajaxDropDown.js"language="javascript"></script>
	<script type="text/javascript" src="../jscripts/jquery-1.3.2.min.js"></script>
</head>
<%

String ApproverEmailid = (String)request.getParameter("ApproverEmailid");
String currentapproveremailid = (String)request.getParameter("currentapproveremailid");
String remarks = (String)request.getParameter("remarks");
Hashtable detailsHash = new Hashtable();
Hashtable resultHash = new Hashtable();

if (currentapproveremailid.equals("You dont have any approving authority, Kindly Create request for new Manager"))
{
 detailsHash.put("CURRENTAPPROVER", "0");
}
else
{
  detailsHash.put("CURRENTAPPROVEREMAILID", currentapproveremailid);
}

detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId);
//detailsHash.put("CURRENTAPPROVEREMAILID", currentapproveremailid);
detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId);
detailsHash.put("APPROVEREMAILID", ApproverEmailid);
detailsHash.put("REMARKS", remarks);
detailsHash.put("CREATEDBY", timescapeUserOId);
detailsHash.put("MODIFIEDBY", timescapeUserOId);
detailsHash.put("STATUS", "L");

resultHash = governanceadministrationcode.insertUserDetails(detailsHash);

String exists = (String)resultHash.get("EXISTS");
Boolean flag = (Boolean)resultHash.get("FLAG");


	if(exists.equals("0") && (flag))
	{
%>      </br>
		</br>
		<p align="center" class="style4">Acknowledgement</p>
		<p align="center" class="style3">You have Submitted<span class="style4"> your manager </span> successfully. </p>
		<table width="100%" border="0" cellspacing="2" cellpadding="0">
			<tr>
				<td><div align="center" class="style3">Click <a href="../user/allCheckStatus.jsp" class="style4">here</a> to view manager list</div></td>
			</tr>		
		</table>
   <%
	} else  if (exists.equals("0") && (!flag)){
   %>
	    </br>
		</br>
		<p align="center" class="style4">Error</p>
		<p align="center" class="style3">There is an error while updating<span class="style4">  </span>. Please try again.</p>

		<table width="100%" border="0" cellspacing="2" cellpadding="0">
			<tr>
				<td><div align="center" class="style3">Click <a href="../user/allRequestChangeManeger.jsp" class="style4">here</a> to view manager list</div></td>
			</tr>
		</table>
	<%
	} else  if (!(flag) && exists.equals("1")){
    %>
	</br>
	</br>
	 <p align="center" class="style4"></p>
		<p align="center" class="style3">You have Already Submitted<span class="style4"> your manager </span> successfully. </p>

		<table width="100%" border="0" cellspacing="2" cellpadding="0">
			<tr>
				<td><div align="center" class="style3">Click <a href="../user/allRequestChangeManeger.jsp" class="style4">here</a> to view manager list</div></td>
			</tr>
		</table>

	<%
	} else {
    %>
	</br>
	</br>
	<p align="center" class="style4">Error</p>
		<p align="center" class="style3">There is an error while updating<span class="style4">  </span>. Please try again.</p>

		<table width="100%" border="0" cellspacing="2" cellpadding="0">
			<tr>
				<td><div align="center" class="style3">Click <a href="../user/allRequestChangeManeger.jsp" class="style4">here</a> to view manager list</div></td>
			</tr>
		</table>
	<%
	}	
	%>

