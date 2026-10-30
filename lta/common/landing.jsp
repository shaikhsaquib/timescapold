<%--
 -- @(#)landing.jsp	22-09-15
 --
 -- Copyright 2012 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments....
 -- @author		Krishna Vishwakarma
 -- @version 	1.00, 22-09-15
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../../../common/adirData.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.io.*" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 


  <!DOCTYPE html>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	   
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> LTA </title>
	<link href="../css/reset.css" rel="stylesheet"/>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/lta.css" rel="stylesheet"/>	
<style>
body{
background-color:#FCF8EA;
}
	.note 
	{
	width:auto;
	margin: 0 0 20px 0;
	padding: 15px 30px 15px 15px;
	border-left: 5px solid #eee;
	-webkit-border-radius: 0 4px 4px 0;
	-moz-border-radius: 0 4px 4px 0;
	-ms-border-radius: 0 4px 4px 0;
	-o-border-radius: 0 4px 4px 0;
	border-radius: 0 4px 4px 0;
	}
.note.note-info
                {
                background-color:#DCF0F7;
                border-color: #91d9e8;
                color: #3c763d, 80%;
                }
a{
color:#0B066D;
}
	</style>
    <title>LTA Application</title>
	<!-- <script Language="JavaScript" src="../jscripts/jquery.js">
	</script> -->
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/bootstrap-maxlength.min.js"></script>	
	<script Language="JavaScript" src="../jscripts/apply.js">
	</script>
    
	<script>
	$(document).ready(function() {
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
	
	});
	
	</script>

    </head>

 
<form name  = "frmLtaApplication" method = "post"">
 <%@ include file="../includes/relatedlinks.jsp" %>
<%
String redirectURL	= "";
//if (companyCode.equals("1021")){
			//redirectURL = "maintenance.html";
			//response.sendRedirect(redirectURL);
		//}else{
			
		
%>

<body >   
<hr>
	<div class="container"> 

<div class="row" class="text-center">	
			<div class="col-xs-6">
			<div class="note note-info">
				<h4 class="block"><b>Annual LTA</b></h4><br>
				<p style="text-align:justify;font-size:13px; " >
					Please use this section to claim Annual LTA (only if you have not opted for Monthly Taxable LTA).</p>
        <p style="text-align:justify;font-size:13px;">If no exemption from tax is being claimed, claim made through this section is sufficient. No print out is necessary.</p>
        <p style="text-align:justify;font-size:13px;">For claiming exemption from tax, please fill in the necessary details in this section, print the form and submit the same to local finance team together with            the necessary proof of travel.</p>
	<p style="text-align:justify;font-size:13px;">Employees not availing the Monthly LTA Option, will continue to get their LTA on an annual basis. <br></p>
	<p style="text-align:justify;font-size:18px;text-decoration:underline;"><a href="../common/lta.jsp?flag=A"> Click here for claiming Annual LTA</a> </p>
				</p>
			</div>
			</div>
<%
	if (companyCode.equals("1000") && (!(deptGroup.equals("1296") || deptGroup.equals("1297") || deptGroup.equals("1298") || deptGroup.equals("1299") || deptGroup.equals("1300") || deptGroup.equals("1498") || deptGroup.equals("1499") || deptGroup.equals("1500") || deptGroup.equals("1501") || deptGroup.equals("1559") || deptGroup.equals("1560") || deptGroup.equals("1581") || deptGroup.equals("1582") || deptGroup.equals("1739") || deptGroup.equals("1740") || deptGroup.equals("1741") || deptGroup.equals("1742") || deptGroup.equals("1743") || deptGroup.equals("1744") || deptGroup.equals("1745") || deptGroup.equals("1746") || deptGroup.equals("1747") || deptGroup.equals("1748") || deptGroup.equals("1749") || deptGroup.equals("1750") || deptGroup.equals("1751") || deptGroup.equals("1752") || deptGroup.equals("1753") || deptGroup.equals("1754") || deptGroup.equals("1755") || deptGroup.equals("1756") || deptGroup.equals("1757") || deptGroup.equals("1758") || deptGroup.equals("1759") || deptGroup.equals("1760") || deptGroup.equals("1761") || deptGroup.equals("1762") || deptGroup.equals("1763") || deptGroup.equals("1764") || deptGroup.equals("1765") || deptGroup.equals("1766") || deptGroup.equals("1767") || deptGroup.equals("1784") || deptGroup.equals("1785") || deptGroup.equals("1786") || deptGroup.equals("1787") || deptGroup.equals("1859") || usersList.contains(sapId)))){
%>
	<div class="col-xs-6">
			<div class="note note-info ">
				<h4 class="block"><b>Monthly Taxable LTA</b></h4><br>
				<!-- <p style="text-align:justify;font-size:13px;">
				On selection of Monthly LTA option, your LTA entitlement will be added to your special pay allowance and your LTA reimbursement amount will be reduced to 0  	 
				</p> -->

				<p style="text-align:justify;font-size:13px;">
				Dear Applicant, Please note that, Claims are being migrated to My-HR. You shall receive a communication soon with further updates. 	 
				</p>
<!-- <p style="text-align:justify;font-size:13px;">An alternative option of claiming such amount will be available from next month which will be retrospectively effective April<sup>'</sup>21.  

</p> -->
                <!-- <p style="text-align:justify;font-size:18px;text-decoration:underline;"><a href="../common/lta.jsp?flag=M"> Click here for opting for Monthly Taxable LTA</a> </p> -->
			</div>
			</div>
<%
		//String redirectURL	= "/timescape/common/maintenance.html";
		//response.sendRedirect(redirectURL);

	}else {
%>
		<div class="col-xs-6">
			<div class="note note-info ">
				<h4 class="block"><b>Monthly Taxable LTA</b></h4><br>
				<p style="text-align:justify;font-size:13px;">
				Please use this section to claim Monthly Taxable LTA.  	 
				</p>
<p style="text-align:justify;font-size:13px;">Please note that this option can be exercised only once in a year in the Month of May (latest by 17th May provided Annual LTA has not been claimed).  New Joinees can opt for this option within one month of joining.  

</p>
                <p style="text-align:justify;font-size:18px;text-decoration:underline;"><a href="../common/lta.jsp?flag=M"> Click here for opting for Monthly Taxable LTA</a> </p>
			</div>
			</div>
<%}%>
		</div>

	
	</div>
<%
		//}
		%>
  
</body>
</html>