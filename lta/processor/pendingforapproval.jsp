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
	 String faYear		  = "";
	 String yearCheck     = "";
  
    boolean status = false;
	GregorianCalendar thisDay = new GregorianCalendar( );
	
    faYear = thisDay.get(Calendar.YEAR) + "";
     
	Hashtable pendingHash = new Hashtable();
	String  timescapeUid			= Long.toString(timescapeUserOId);

	 yearCheck = (String) request.getParameter("year");
	String yearCheck1 = (yearCheck == null ?"":yearCheck);
	//out.println("yearCheck"+yearCheck);

	 pendingHash.put("TIMESCAPEUID",timescapeUid);
	 pendingHash.put("WORKFLOWTYPE","13");
	 pendingHash.put("STATUS","L");
	 if(!"".equals(yearCheck1)){
	 pendingHash.put("YEAR",yearCheck);
	 }

    ArrayList result	= new ArrayList();
    result		= ltaController.getAllPendingRequest(pendingHash);
    String remarks	=	"";
//out.println("result== "+result.size());



%> 

    <body>
	<form name="annualltacheckstatus"   method="post" role="form" style="margin-top:15px;" id="ann_lta">
<%String ltaRoleId	= (String) session.getAttribute("ltaRoleId");%>
<%@ include file="../includes/relatedlinks.jsp" %>

<% String optionValue ="APP";//A-annual,P-processor,P-pending
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%@ include file="../includes/annualmenutabs.jsp" %>
<!-- <div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default" href="../processor/annualltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default " href="../processor/annualcheckstatus.jsp"><font color="#4586BD">Mylist <i class="fa fa-list-ol"></i> </font></a></div>
<div class="col-xs-1">
<a class="btn btn-default active" href="../processor/pendingforapproval.jsp"><font color="#4586BD">Pending for approvals <i  class="fa fa-exclamation-triangle"></i> </font></a></div>
<div class="col-xs-1" >
<a class="btn btn-default " href="../processor/processorviewallrequest.jsp" style="margin-left:100px;"><font color="#4586BD">Search All <i  class="fa fa-search"></i> </font></a></div>
</div>
</div> -->
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
<div class="col-xs-2">
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
<div class="col-xs-1"><a href="#" class="btn btn-info btn-sm tip-bottom" data-toggle="tooltip" data-original-title="Please enter year then press GO" onClick = "getPendingRecord( )"><i class="fa fa-search"></i> GO</a></div>
</div> 

  <br>


<%
	if(result.size() > 0) {

%>
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
              
                <th>Application ID</th>
                <th>Name</th>
                <th>SAP Number</th>
				<th>Financial Year</th> 
				<th>Location</th> 
                <th>Tax Exemption</th>
                <th>Requested On</th>
                <th>Status</th>
                <th>Action</th>		
            </tr>
        </thead>
 <tbody>
<%
  for ( int i = 0; i < result.size(); i++ ) {

			String tmpArr[] = (String[]) result.get(i);

String faYear1 =tmpArr[4];
int nextYear = Integer.parseInt(faYear1)+1;
%>
       

        	<tr>
                <td><%= tmpArr[0] %></td>
                <td><%= tmpArr[14] %></td>
                <td><%= tmpArr[16] %></td>
                <td><%= tmpArr[4] +"-"+ nextYear%></td>
                <td><%= tmpArr[21] %></td>
<%
if(tmpArr[1].equals("Y")){
%>
<%if(tmpArr[10].equals("C")){%>
        
                <td class="text-center">NA</td>
<%}else
    {
    if(tmpArr[10].equals("A")){%>
                <td class="text-center"><font color="red">Claimed</font></td>
<%
            }else{if(tmpArr[10].equals("L")){
%>
<td class="text-center"><font color="red">Claim In-Process</font></td>
<%
            }
        }%>
<%
    }
}else if(tmpArr[1].equals("N")){
%>  
                <td><a href="../requestor/claimexemption.jsp?applicationId=<%= tmpArr[0] %>"><font color="green">Claim Tax Exemption</font></a></td>
<%
}
%>
                <td><%= tmpArr[7] %></td>
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
                <td><a href="#"  onClick="pendingDetails('<%= tmpArr[0] %>')" ><font color="blue">Accept / Reject</font></a></td>
</tr>

<%	
   }//end of for
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