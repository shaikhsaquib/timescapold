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
 <!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    $(".tip-bottom").tooltip({
        placement : 'bottom'
    });
   

	});
	</script>	
    </head>

    <body>
<%String ltaRoleId	= (String) session.getAttribute("ltaRoleId");%>
<%@ include file="../includes/relatedlinks.jsp" %>

<% String optionValue ="ARC";//A-annual,R-requestor,C-checkstatus
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%@ include file="../includes/annualmenutabs.jsp" %>
<!-- <hr>
<div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default" href="../requestor/annualltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default active" href="../requestor/annualcheckstatus.jsp"><font color="#4586BD">Mylist <i class="fa fa-list-ol"></i> </font></a></div>
</div> -->
</div>
  <br>
<%
    String flag = "";
	String faYear= "";
	String queryDate ="";
	
    //String roleId =  "";

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );
	//String date = (Stri ng)request.getParameter("date");
	//System.out.println("requestdate"+ date);

	String day2 = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));

	if ( day2.length() == 1) {

		day2	=	"0" + day2;
	}
	int currMonth1		= thisDay.get(Calendar.MONTH);
	String currMonth	= monthArr[currMonth1]  + "";	
	faYear = thisDay.get(Calendar.YEAR) + "";
	String nextYear		=	thisDay.get(Calendar.YEAR) + 1 + "";
	if(currMonth.equals("JAN") || currMonth.equals("FEB")||currMonth.equals("MAR") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
		nextYear = (Integer.parseInt(nextYear)-1)+"";
	}
Hashtable annualChkSta = new Hashtable();
String  timescapeUid			= Long.toString(timescapeUserOId);
 annualChkSta.put("TIMESCAPEUID",timescapeUid);
 annualChkSta.put("FAYEAR",faYear);

    ArrayList result	= new ArrayList();
    result		= ltaController.annualLtaLst(annualChkSta);
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
				|  <img src="../images/cancel1.png"> :    Cancel 
			</p>  
			</td>																	
		</tr>									
	</table>
        <table class="table table-bordered">
        <thead>
            <tr class="info">
              
                <th class="text-center">Application ID</th>
                <th class="text-center">Name</th>
                <th class="text-center">SAP Number</th>
				<th class="text-center">Financial Year</th> 
                <th class="text-center">Tax Exemption</th>
                <th class="text-center">Tax Exemption Taken On</th>
                <th class="text-center">Requested On</th>
                <th class="text-center">Status</th>
			             
                <th class="text-center">Action</th>		

            </tr>
        </thead>
<%
String txnIds = ""; 
 for ( int i = 0; i < result.size(); i++ ) {

			String tmpArr[] = (String[]) result.get(i);
String faYear1 =tmpArr[4];
int nextYear1 = Integer.parseInt(faYear1)+1;
txnIds += tmpArr[0]+",";
%>
			
        <tbody>

        	<tr >
                <td class="text-center"><a href="../common/requestDetails.jsp?applicationId=<%=i%>"><%= tmpArr[0] %></a></td>
                <td class="text-center"><%= tmpArr[14] %></td>
                <td class="text-center"><%= tmpArr[16] %></td>
                <td class="text-center"><%= tmpArr[4] +"-"+ nextYear1%></td>
<%
if(tmpArr[1].equals("Y") || tmpArr[1].equals("YPB") || tmpArr[1].equals("YTB")){
%>
<%if(tmpArr[10].equals("C")){%>
        
                <td class="text-center">NA</td>
<%}else
    {
    if(tmpArr[10].equals("A")){%>
                <td class="text-center"><font color="red">Claimed</font></td>
<%
            }else if(tmpArr[10].equals("L")){
%>
<td class="text-center"><font color="red">Claim In-Process</font></td>
<%
            }else if(tmpArr[10].equals("R")){
%>
            <td class="text-center">NA</td>
<%
            }
        %>
<%
    }
}else if(tmpArr[1].equals("N")){
%>  
<%if(tmpArr[10].equals("C")){%>
                <td class="text-center">NA</td>
<%}else{%>
                
                <!-- <td class="text-center">Transferred</td>
 --><%
    
%>
                <td class="text-center"><a href="../common/claimexemption.jsp?applicationId=<%= tmpArr[0] %>"><font color="green">Claim Exemption</font></a></td>
<%
    }
}
%>
<%
if(tmpArr[1].equals("Y") ){
%>

                <td class="text-center"><%= tmpArr[9] %></td>
<%
}else if(tmpArr[1].equals("YTB") ){
%>
                <td class="text-center"><%= tmpArr[7] %></td>
<%}else{
%>
                <td class="text-center">-</td>
<%}%>
   <input type="hidden" name="partorfull" id="partorfull" value="<%=tmpArr[22]%>">


                <td class="text-center"><%=tmpArr[7]%></td>

                
<%
    if(tmpArr[10].equals("A")){
%>
				<td class="text-center"><img src="../images/process.png"></td>              
<%  
    }else if(tmpArr[10].equals("L")){
%>
                <td class="text-center"><img src="../images/inprocess.png"></td>     
<%
    }else if(tmpArr[10].equals("R")){
%>
                <td class="text-center"><img src="../images/rejected.png"></td>  
<%}else if(tmpArr[10].equals("C")){%>

                <td class="text-center"><img src="../images/cancel1.png"></td> 
<%}%>
<%  
    if(tmpArr[10].equals("L")){
%>	
                <td class="text-center" ><a href="#"  onClick = "cancelRequestUser('<%=tmpArr[0]%>')" class="tip-bottom" data-toggle="tooltip" data-original-title="Cancel" ><i class="fa fa-times fa-2x"  ></i></a></td>
<%
    }else{
%>
                <td align="center">-</td>
</tr>

<%	
    }  
 }//end of for
	txnIds = txnIds.substring(0,txnIds.length()-1);
	session.setAttribute("LTA_IDS", txnIds);
 
%>  
    </tbody>
    </table>
		</div>	
		</div>		
	</div>	
	<div class="col-xs-1"></div>	
<%
}else{

 %>        
   <div class="row">
	<div class="col-xs-3"></div>
    <div class="col-xs-6 bs-example" style="margin-top:60px;">
    <div class="note1 note-info" style="width:auto;">

	<p style="text-align:center;margin-top:5px;">No applications found</p>
</div>
</div>
<div class="col-xs-3"></div>
</div>

<%
    } 
%>
		