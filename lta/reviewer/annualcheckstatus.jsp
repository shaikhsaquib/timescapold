<%--
 -- @(#)annualcheckstatus.jsp	24-09-15
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
 -- @version 	1.00, 24-09-15
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<title> LTA </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/lta.css" rel="stylesheet"/>	
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    <script Language="JavaScript" src="../jscripts/apply.js"></script>
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

    <body>
<%String ltaRoleId	= (String) session.getAttribute("ltaRoleId");%>
<%@ include file="../includes/relatedlinks.jsp" %>

<% String optionValue ="AVC";//A-annual,V-reviewer,C-checkstatus
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%@ include file="../includes/annualmenutabs.jsp" %>
<!-- <hr>
<div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default " href="../reviewer/annualltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default active" href="../reviewer/annualcheckstatus.jsp"><font color="#4586BD">Mylist <i class="fa fa-list-ol"></i> </font></a></div>

<div class="col-xs-1" >
<a class="btn btn-default " href="../reviewer/reviewerviewallrequest.jsp" style="margin-left:100px;"><font color="#4586BD">Search All <i  class="fa fa-search"></i> </font></a></div>
</div> -->
</div>
  <br>
<%
	String faYear= "";
  
    boolean status = false;
	GregorianCalendar thisDay = new GregorianCalendar( );
	
    faYear = thisDay.get(Calendar.YEAR) + "";
     
    //status = ltaController.insertLtaRecord(timescapeUserOId, faYear);
Hashtable annualChkSta = new Hashtable();
String  timescapeUid			= Long.toString(timescapeUserOId);
 annualChkSta.put("TIMESCAPEUID",timescapeUid);
 annualChkSta.put("FAYEAR",faYear);

    ArrayList result	= new ArrayList();
    result		= ltaController.annualLtaCheckStatus(annualChkSta);
    String remarks	=	"";
//out.println("result== "+result.size());


if(result.size() > 0) {
%> 
<form name="annualltacheckstatus"   method="post" class="form-horizontal" role="form" style="margin-top:15px;" id="ann_lta">
<div class="container">
<div class="row">
    <div class="col-xs-1"></div>	
	<div class="col-xs-10 bs-example">	
		<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i>  Annual LTA
			</div>			
		</div>
		<div class="portlet-body">
		<table>									
		<tr>																									 									
			<td  style="text-align:center ">
			<p>
				 TIP :  
				 <img src="../images/inprocess.png"> :  In Process 
				|  <img src="../images/process.png"> :  Processed
				|  <img src="../images/rejected.png"> :    Rejected 
			</p>  
			</td>																	
		</tr>									
	</table>
        <table class="table table-bordered">
        <thead>
            <tr class="info">
              
                <th>Transaction ID</th>
                <th>Name</th>
                <th>SAP Number</th>
				<!-- <th>Remarks</th> -->
                <th>Tax Exemption</th>
                <th>Requested On</th>
                <th>Status</th>
			             
                <th>Action</th>		

            </tr>
        </thead>
<%
  for ( int i = 0; i < result.size(); i++ ) {

			String tmpArr[] = (String[]) result.get(i);
%>
			
        <tbody>

        	<tr >
                <td><a href="../requestor/requestDetails.jsp?applicationId=<%= tmpArr[0] %>"><%= tmpArr[0] %></a></td>
                <td><%= tmpArr[14] %></td>
                <td><%= tmpArr[16] %></td>
<%
if(tmpArr[1].equals("Y")){
%>
                <td><font color="red">Already Claimed</font></td>
<%
    }else if(tmpArr[1].equals("N")){
%>  
                <td><a href="../requestor/claimexemption.jsp?applicationId=<%= tmpArr[0] %>"><font color="green">Claim Tax Exemption</font></a></td>
<%
}
%>
                <td><%= tmpArr[7] %></td>
                <!-- <td><%//= remarks %></td> -->
                
<%
    if(tmpArr[10].equals("A")){
%>
				<td><img src="../images/process.png"></td>              
<%  
    }else if(tmpArr[10].equals("L")){
%>
                <td><img src="../images/inprocess.png"></td>     
<%
    }else if(tmpArr[10].equals("R")){
%>
                <td><img src="../images/rejected.png"></td>  
<%}else if(tmpArr[10].equals("C")){%>

                <td><img src="../images/rejected.png"></td> 
<%}%>
<%  
    if(tmpArr[10].equals("L")){
%>	
                <td><a href="#"  onClick = "cancelRequestUser('<%=tmpArr[0]%>')"><font color="blue">Cancel</font></a></td>
<%
    }else{
%>
                <td><font color="blue">-</td>
</tr>

<%	
    }  
 }//end of for
%>  
    </tbody>
    </table>
		</div>	
		</div>		
	</div>
<%
}else{

 %>           
    <div class="row">
	<div class="col-xs-3"></div>
    
    <div class="col-md-6 bs-example" style="align:center;">
    <div class="note1 note-info" style="width:auto;">
	    <p style="text-align:center;margin-top:5px;">No application found</p>
    </div>
    </div>
    <div class="col-xs-3"></div>
    </div>
</div>
</div>
<%
    } 
%>
		