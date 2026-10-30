<%--
 -- @(#)submitmonthlylta.jsp	09-09-15
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
 -- @version 	1.00, 09-09-15
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 
     <!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	
	});
	
	</script>
    </head>

<%
	//String redirectURL1	= "../common/claimMaintenancePageNew.html";
	//response.sendRedirect(redirectURL1);
%>

<%
    String ltaRoleId	= (String) session.getAttribute("ltaRoleId");
%>
<%@ include file="../includes/relatedlinks.jsp" %>
<% String optionValue ="MRA";//M-monthly,R-requestor,A-apply
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%@ include file="../includes/monthlymenutabs.jsp" %>
<body>
</div>
<div class="row ">
<div class="col-xs-2 "></div>
    <div class="col-xs-8 bs-example" style="margin-top:80px;">
    <div class="note1 note-info" style="margin-left:120px;">
<%
	String faYear= "";
  
	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};


    boolean status = false;
	GregorianCalendar thisDay = new GregorianCalendar( );
	
    int currMonth1		= thisDay.get(Calendar.MONTH);
    String currMonth	= monthArr[currMonth1]  + "";	

    faYear = thisDay.get(Calendar.YEAR) + "";
	if(currMonth.equals("JAN") || currMonth.equals("FEB")||currMonth.equals("MAR") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
	}
    
    ArrayList result		= new ArrayList();
        String criteria		=	"user";
            result			= ltaController.viewLtaRecord(timescapeUserOId, faYear, criteria);
        String remarks	=	"";
  if(result.size() > 0) 
    {
%>
	    <p style="text-align:center;margin-top:5px;padding-top:2px;">You have already applied for Monthly LTA for current financial year. <br>Click <a href="../common/checkstatus.jsp"> here</a> for status</p>
<%
    }else{   

    status = ltaController.insertLtaRecord(timescapeUserOId, faYear);

    if (status) {

		//response.sendRedirect("monthlyltaapply.jsp");
		//return;
%> 
	    <p style="text-align:center;margin-top:5px;padding-top:2px;">Your request has been submitted successfully.<br>Click <a href="../common/checkstatus.jsp"> here</a> for status</p>
</div>
</div>
<div class="col-xs-2"></div>
</div>
</div>
</body>
</html>

<%	
    }//end of if
}//end of else
%>
