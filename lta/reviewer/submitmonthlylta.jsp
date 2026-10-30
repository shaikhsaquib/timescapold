<%--
 -- @(#)submitmonthlylta.jsp	15-09-15
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
 -- @version 	1.00, 15-09-15
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 
    <html >
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> LTA </title>
	<link href="../css/reset.css" rel="stylesheet"/>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/lta.css" rel="stylesheet"/>	
    <title>LTA Application</title>
	<script Language="JavaScript" src="../jscripts/jquery.js">
	</script>
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="js/bootstrap-maxlength.min.js"></script>	
	<script Language="JavaScript" src="../jscripts/apply.js">
	</script>
    
    
<script>
	$(document).ready(function() {
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
    $(".tip-bottom").tooltip({
        placement : 'bottom'
    });

	});
	</script>	
</head>
<%String ltaRoleId	= (String) session.getAttribute("ltaRoleId"); %>    
 <%@ include file="../includes/relatedlinks.jsp" %>
<% String optionValue ="MVA";//M-monthly,V-reviewer,A-apply
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%@ include file="../includes/monthlymenutabs.jsp" %>
<!-- <hr>
<div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<button type="button" class="btn btn-default active "><a href="../reviewer/reviewermltaapply.jsp">Apply  <i class="fa fa-check"></i></a></button></div>
 <div class="col-xs-1">
<button type="button" class="btn btn-default " ><a href="../reviewer/reviwercheckstatus.jsp">Mylist   <i class="fa fa-list-ol"></i></a></button></div>
<div class="col-xs-1">
<button type="button" class="btn btn-default  tip-bottom" data-toggle="tooltip" data-original-title="To see all requests"><a href="../reviewer/viewallrequest.jsp">Search All <i class="fa fa-search"></i></a></button></div>

 <div class="col-xs-1">
</div>
</div> -->

<body>
<div class="col-md-1 "></div>
    <div class="col-md-8 col-md-ofset-2 bs-example" style="margin-top:150px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">
<%
	String faYear= "";
  
    boolean status = false;
	GregorianCalendar thisDay = new GregorianCalendar( );
	
    faYear = thisDay.get(Calendar.YEAR) + "";
    
    ArrayList result		= new ArrayList();
        String criteria		=	"user";
            result			= ltaController.viewLtaRecord(timescapeUserOId, faYear, criteria);
        String remarks	=	"";
  if(result.size() > 0) 
    {
%>
	    <p style="text-align:center;margin-top:5px;padding-top:2px;">you have already applied for monthly LTA in this year. <br>Click <a href="../reviewer/reviwercheckstatus.jsp"> here</a> for status</p>
<%
    }else{   

    status = ltaController.insertLtaRecord(timescapeUserOId, faYear);

    if (status) {

		//response.sendRedirect("monthlyltaapply.jsp");
		//return;
%> 
	    <p style="text-align:center;margin-top:5px;padding-top:2px;">Your request has been submitted successfully. <br>Click<a href="../reviewer/reviwercheckstatus.jsp"> here</a> for status</p>
</div>
</div>
<div class="col-md-1 "></div>
</div>
</body>
</html>

<%	
    }
}//end of else
%>
