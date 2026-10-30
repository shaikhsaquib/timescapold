<%--
 -- @(#)processorviewallrequest.jsp	01-10-15
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
 -- @version 	1.00, 01-10-15
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>

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

	});
	</script>	
    </head>


<% 
	ArrayList result = new ArrayList();
    
    String bgcolor      = "";
	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};


	GregorianCalendar thisDay = new GregorianCalendar( );
   
   // String ltaRoleId	= (String) session.getAttribute("ltaRoleId");
    String month	    = (String) request.getParameter("month");
    String faYear       = (String) request.getParameter("faYear");
	String status		= (String) request.getParameter("criteria");
	String monthStr		= "";
    String sapCheck     = "";
    String appCheck     = "";
    String yearCheck     = "";
	int currMonth		=	0;
	int selYear			=	0;
	
	if ( faYear == null && month	==	null ) {

		currMonth		= thisDay.get(Calendar.MONTH)	+	1;
		faYear          = thisDay.get(Calendar.YEAR)	+	"";
		status			=	"A";
		month			= currMonth + "";

	} else {

		selYear = Integer.parseInt(faYear);
		currMonth = Integer.parseInt(month);
		
	}
	
	monthStr		= currMonth + "";	
  
    status			=	"A";
    Hashtable ltaIdHash	=	new Hashtable();
    sapCheck = (String) request.getParameter("id");
    appCheck = (String) request.getParameter("applicationId");
    yearCheck = (String) request.getParameter("year");
	String yearCheck1 = (yearCheck == null ?"":yearCheck);
//out.println("yearCheck1##==="+yearCheck1);
	String idForRecord		= (String) request.getParameter("id");
    String  timescapeUid			= Long.toString(timescapeUserOId);
    if(sapCheck == null && appCheck == null ){
        //sapCheck     = "";
        //appCheck     = "";
          ltaIdHash.put("TIMESCAPEUID",timescapeUid);

        result = ltaController.getAllrequests(ltaIdHash);
    }else{

  //  String idForRecord		= (String) request.getParameter("id");
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
      ltaIdHash.put("YEAR",yearCheck);
    }
      ltaIdHash.put("TIMESCAPEUID",timescapeUid);
      ltaIdHash.put("YEAR",yearCheck);
	  //out.println(timescapeUid);
	 // out.println(idForRecord);


result = ltaController.getAllrequests(ltaIdHash);
}
	
%>
<%

//out.println(ltaRoleId);
%>
<body>
    <form name = "processorviewallrequest" method = "post" >
<%String ltaRoleId	= (String) session.getAttribute("ltaRoleId");%>
<%@ include file="../includes/relatedlinks.jsp" %>
<% String optionValue ="APS";//A-annual,P-processor,S-search
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%@ include file="../includes/annualmenutabs.jsp" %>

<!-- <hr>
<div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default" href="../processor/annualltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default " href="../processor/annualcheckstatus.jsp"><font color="#4586BD">Mylist <i class="fa fa-list-ol"></i> </font></a></div>
<div class="col-xs-1">
<a class="btn btn-default " href="../processor/pendingforapproval.jsp"><font color="#4586BD">Pending for approvals <i  class="fa fa-exclamation-triangle"></i> </font></a></div>
<div class="col-xs-1" >
<a class="btn btn-default active" href="../processor/processorviewallrequest.jsp" style="margin-left:100px;"><font color="#4586BD">Search All <i  class="fa fa-search"></i> </font></a></div>
 -->
  <%
	int currYear1 = 0;
	int preYear1 = 0;
	int years = 0;
	String currYear = "";
	String preYear = "";
	GregorianCalendar today = new GregorianCalendar();	
	currYear1 = today.get(Calendar.YEAR);
	preYear1 = currYear1 - 1;
	currYear = currYear1 + "";
	preYear = preYear1 + "";
	
	%> 
<%//out.println("yearCheck"+yearCheck);%>	
<div class="col-xs-1">
	 <div id="imaginary_container"> 
       <div class="form-group ">	
	 <select   name="year" id = "year" class="form-control input-xs pqr mode ">
	<option value="0" >Select Year</option>
	<%if("".equals(yearCheck1)){%>
	 <option value="<%=currYear%>"><%=currYear%></option>
	  <option value="<%=preYear%>"><%=preYear%></option>
	
	 <%}else if(!("".equals(yearCheck1))){%>
	 <%if((currYear.equals(yearCheck1))){%>
	 <option value="<%=yearCheck%>" selected><%=currYear%></option> 
	 <option value="<%=preYear%>"><%=preYear%></option>
<%}if((preYear.equals(yearCheck1))){%>

 <option value="<%=yearCheck%>" ><%=currYear%></option> 
	 <option value="<%=preYear%>" selected><%=preYear%></option>
	 
	<% }}%>
	  </select>
	
        </div>
    </div>
</div>
<div class="col-xs-2">
     <div id="imaginary_container"> 
        <div class="input-group stylish-input-group">
            <input type="text" class="form-control" name="sapId" id="sapId" placeholder="SAP Number" onKeydown="Javascript:if (event.keyCode==13) getSapId( );" value="<%=sapCheck == null ? "" : sapCheck%>">
           <div class="input-group-addon">
            </div>
        </div>
    </div>
</div>

<div class="col-xs-1" style="width:20px;margin-top:8px;">OR</div>

<div class="col-xs-2  "style="margin-left:20px;">
     <div id="imaginary_container"> 
        <div class="input-group stylish-input-group">
            <input type="text" class="form-control" name="applicationId" id="applicationId" placeholder="Application ID" onKeydown="Javascript:if (event.keyCode==13) getAppId( );" value="<%=appCheck == null ? "" : appCheck%>">
           <div class="input-group-addon">
            </div>
        </div>
    </div>
</div>

<div class="col-xs-1"><a href="#" class="btn btn-info btn-sm tip-bottom" data-toggle="tooltip" data-original-title="Please enter either SAP Number or Application ID then press GO" onClick = "getAnnualRecord( )"><i class="fa fa-search"></i> GO</a></div>


<div class="col-xs-1"></div>
</div>
<%
	if(result.size() > 0) {

%>
<div class="row" style="margin-left:8px;margin-right:8px;">
    
	<div class="col-xs-12 bs-example"  >	
		<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i>  Annual LTA
			</div>	
        <div class="actions pull-right">
        <a href="#" class="btn btn-default btn-sm" onClick = "getAnnualRecord1()">
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

   	<table class="table table-bordered">
        <thead>
            <tr class="info">
                <th style="width:7%;">Application ID</th>
                <th style="width:8%">Employee Name</th>
                <th style="width:6%">SAP Number</th>
                <th style="width:5%">Financial Year</th>
                <th style="width:8%">Location</th>
				<th style="width:5%">Tax Exemption</th>
                <th style="width:5%">Proposed Amount</th>				             
                <th style="width:5%">Approved Amount</th>				             
                <!-- <th style="width:10%">Remarks</th> -->				             
                <th style="width:10%">Remarks</th>				             
                <th style="width:7%">Requested On</th>				             
                <th style="width:6%" >Processed On</th>				             
                <th style="width:1%">Status</th>				             
            </tr>
        </thead>
   <input type="hidden" name="listSize" value="<%=result.size()%>">
   <input type="hidden" name="sapCheck" value="<%=sapCheck%>">
   <input type="hidden" name="aapCheck" value="<%=appCheck%>">
    <tbody>
<%
    for (int i = 0; i < result.size(); i++) {

        String tmpArr[] = (String [])result.get(i); 
String faYear1 =tmpArr[4];
int nextYear = Integer.parseInt(faYear1)+1;
        
%>
        
        	<tr >
                <td class="text-center"><a href="../common/requestDetails1.jsp?applicationId=<%= tmpArr[0] %>"><%= tmpArr[0] %></a></td>
                <td><%= tmpArr[14] %></td>
                <td><%= tmpArr[16] %></td>
                <td><%= tmpArr[4] +"-"+ nextYear%></td>
                <td><%= tmpArr[22] %></td>
<%
                if(tmpArr[1].equals("Y")){
%>
                <td><font color="red">Yes</font><br><%= tmpArr[9] %></td>
<%
    }else if(tmpArr[1].equals("N")){
%>  
                <td><font color="green">No</font></td>
<%
}
%>
                <td><%= tmpArr[2] %></td>
                <td><%= tmpArr[3] %></td>
                <!-- <td><%//= tmpArr[9] %></td> -->
                <td><%= tmpArr[5] %></td>
                <td><%= tmpArr[7] %></td>
<%
    if(tmpArr[10].equals("A")|| tmpArr[10].equals("R") ||  tmpArr[10].equals("C")){
%>
                <td><%= tmpArr[9] %></td>
<%
    }else {
%>
                <td>-</td>
<%
    }
%>
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
<%}%>
            </tr>
<%
    }//FOR ENDS HERE
%>
        </tbody>
    </table>
<%
	} else {
%>
    <div class="col-md-6 bs-example" style="margin-top:60px;margin-left:300px;">
    <div class="note1 note-info" style="width:auto;">

	<p style="text-align:center;margin-top:5px;">No applications found</p>
</div>
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