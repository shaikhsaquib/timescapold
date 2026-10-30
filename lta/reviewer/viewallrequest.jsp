<%--
 -- @(#)viewallrequest.jsp	10-09-15
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
 -- @version 	1.00, 10-09-15
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>

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
	<script src="../js/jquery.placeholder.js"></script>
    <script Language="JavaScript" src="../jscripts/approve.js"></script>
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
	$('input, textarea').placeholder();

	});
	</script>	
    </head>


<% 
	ArrayList result = new ArrayList();
    
    String bgcolor      = "";
	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};


    String status       ="";
    String faYear       = "";
	String monthStr		= "";
    String sapCheck     = "";
    String appCheck     = "";
	int selYear			=	0;

   	GregorianCalendar thisDay = new GregorianCalendar( );
	
    int currMonth1		= thisDay.get(Calendar.MONTH);
    String currMonth	= monthArr[currMonth1]  + "";	

    faYear = thisDay.get(Calendar.YEAR) + "";
	if(currMonth.equals("JAN") || currMonth.equals("FEB")||currMonth.equals("MAR") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
	}	
	/*if ( faYear == null && month	==	null ) {

		currMonth		= thisDay.get(Calendar.MONTH)	+	1;
		faYear          = thisDay.get(Calendar.YEAR)	+	"";
		status			=	"A";
		month			= currMonth + "";

	} else {

		selYear = Integer.parseInt(faYear);
		currMonth = Integer.parseInt(month);
		
	}
	
	monthStr		= currMonth + "";	
  */
    status			=	"A";
    Hashtable ltaIdHash	=	new Hashtable();
    sapCheck = (String) request.getParameter("id");
    appCheck = (String) request.getParameter("applicationId");
    String  timescapeUid			= Long.toString(timescapeUserOId);


    if(sapCheck == null && appCheck == null ){
        //sapCheck     = "";
        //appCheck     = "";
      ltaIdHash.put("FAYEAR",faYear);
      ltaIdHash.put("TIMESCAPEUID",timescapeUid);

        result = ltaController.getLtarecord(ltaIdHash);
    }else{

    String idForRecord		= (String) request.getParameter("id");
    String flag		= (String) request.getParameter("app");
           
    if(idForRecord == null)
    {  
        idForRecord     = (String) request.getParameter("applicationId");
    }

if(idForRecord == null)
    {
        idForRecord="0";
    }

if(flag == null)
{
  ltaIdHash.put("SAPID",idForRecord);
}
else{
      ltaIdHash.put("APPLICATIONID",idForRecord);
    }

      ltaIdHash.put("FAYEAR",faYear);
      ltaIdHash.put("TIMESCAPEUID",timescapeUid);

result = ltaController.getLtarecord(ltaIdHash);
}
%>
<%
String ltaRoleId	= (String) session.getAttribute("ltaRoleId");
//out.println(ltaRoleId);
%>
<body>
    <form name = "viewallrequest" method = "post" >
 <%@ include file="../includes/relatedlinks.jsp" %>
<% String optionValue ="MVS";//M-monthly,V-reviewer,S-search
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%@ include file="../includes/monthlymenutabs.jsp" %>
<!-- <hr>
<div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default " href="../reviewer/reviewermltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default " href="../reviewer/reviwercheckstatus.jsp"><font color="#4586BD">Mylist <i class="fa fa-list-ol"></i> </font></a></div>
<div class="col-xs-1">
<a class="btn btn-default tip-bottom active" data-toggle="tooltip" data-original-title="Click to see all requests" href="../reviewer/viewallrequest.jsp"><font color="#4586BD">Search All <i class="fa fa-search"></i></font></a></div>

 <div class="col-xs-1">
</div> -->
<div class="col-xs-3"></div>

<div class="col-xs-2 ">
     <div id="imaginary_container"> 
        <div class="input-group ">
            <input type="text" class="form-control" name="sapId" id="sapId" placeholder="SAP Number" onKeydown="Javascript:if (event.keyCode==13) searchLtaRecord( );" value="<%=sapCheck == null ? "" : sapCheck%>">
           
        </div>
    </div>
</div>



<div class="col-xs-1" style="width:20px;margin-top:8px;">OR</div>

<div class="col-xs-2  "style="margin-left:20px;">
     <div id="imaginary_container"> 
        <div class="input-group">
            <input type="text" class="form-control" name="applicationId" id="applicationId" placeholder="Application ID" onKeydown="Javascript:if (event.keyCode==13) getApplicationId( );" value="<%=appCheck == null ? "" : appCheck%>">
          
        </div>
    </div>
</div>

<div class="col-xs-1"><a href="#" class="btn btn-info btn-sm tip-bottom" data-toggle="tooltip" data-original-title="Please enter either SAP Number or Application ID then press GO" onClick = "getMonthlyLtaRecord( )"><span class="glyphicon glyphicon-search" style="margin-top:4px;"></span> GO</a></div>
</div>
<%
	if(result.size() > 0) {

%>
<div class="row" style="margin-left:8px;margin-right:8px;">
    
	<div class="col-xs-12 bs-example"  >	
		<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i>  Monthly LTA
			</div>	
        <div class="actions pull-right">
        <a href="#" class="btn btn-default btn-sm" onClick = "getMonthlyLtaRecord1()">
        <img src="../images/icon_excel.gif"> <strong>Open/Save</Strong></a>
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
<div class="table-responsive">
   	<table class="table table-bordered">
        <thead>
            <tr class="info">
                <th style="width:9%">Application ID</th>
                <th style="width:9%">Employee Name</th>
                <th style="width:9%">SAP Number</th>
				<th style="width:9%">Department</th>
                <th style="width:7%">Designation</th>				             
                <th style="width:10%">Branch</th>				             
                <!-- <th style="width:10%">Remarks</th> -->				             
                <th style="width:10%">Date of Joining</th>				             
                <th style="width:10%">Requested On</th>				             
                <th style="width:9%" >Processed On</th>				             
                <th style="width:7%">Status</th>				             
            </tr>
        </thead>
   <input type="hidden" name="listSize" value="<%=result.size()%>">
   <input type="hidden" name="sapCheck" value="<%=sapCheck%>">
   <input type="hidden" name="aapCheck" value="<%=appCheck%>">
    <tbody>
<%
    for (int i = 0; i < result.size(); i++) {

        String tmpArr[] = (String [])result.get(i); 
        
%>
        
        	<tr >
                <td><%= tmpArr[0] %></td>
                <td><%= tmpArr[3] %></td>
                <td><%= tmpArr[5] %></td>
                <td><%= tmpArr[6] %></td>
                <td><%= tmpArr[7] %></td>
                <td><%= tmpArr[12] %></td>
                <!-- <td><%//= tmpArr[9] %></td> -->
                <td><%= tmpArr[13] %></td>
                <td><%= tmpArr[10] %></td>
                <td><%= tmpArr[11] %></td>
<%
    if(tmpArr[8].equals("A")){
%>
				<td><img src="../images/process.png"></td>              
<%
    }else if(tmpArr[8].equals("L")){
%>
                <td><img src="../images/inprocess.png"></td>  
<%
    }else if(tmpArr[8].equals("R")){
%>
                <td><img src="../images/rejected.png"></td>  
<%}%>
            </tr>
<%
    }//FOR ENDS HERE
%>
        </tbody>
    </table>
	</div>
<%
	} else {
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

</div>	
		</div>		
	</div>
	
</div>

</body>
</html>