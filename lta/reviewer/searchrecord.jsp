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
	});
	</script>	
    </head>


<% 
    String bgcolor      = "";
	String weekArr[]    = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[]   = {"0","JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );
   
    String ltaRoleId	= (String) session.getAttribute("ltaRoleId");
    String month	    = (String) request.getParameter("month");
    String faYear       = (String) request.getParameter("faYear");
	String status		= (String) request.getParameter("criteria");
	String getSapId		= (String) request.getParameter("id");
	String monthStr		= "";
	status			=	"A";

    ArrayList result = new ArrayList();
        
    Hashtable ltaIdHash	=	new Hashtable();

    ltaIdHash.put("SAPID",	getSapId);
    ltaIdHash.put("STATUS",	status);

    result = ltaController.getLtarecord(ltaIdHash);
   // out.println(result.size());
	
%>
<body>
    <form name = "viewallrequest" method = "post" action = "">
    <div class="row" style="margin-right:5px;">
	<div class="RelatedLinks">
		<ul>
			<li class="RelLinks"><a href="#">Related Links</a>
			<ul class="dropdownmenu">
					<li><a href="landing.html">Home</a></li>					
					<li><a href="../requestor/monthlyltaapply.jsp">Monthly LTA Application</a></li>
					<li><a href="annual_lta.html">Annual LTA Application</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

<hr>      
<div class="row"> 
 <div class="col-xs-1 col-xs-offset-2" >
<button type="button" class="btn btn-default  "><a href="annual_lta4.html">Apply  <i class="fa fa-check"></i></a></button></div>
 <div class="col-xs-1">
<button type="button" class="btn btn-default " ><a href="annual_norecords.html">Mylist   <i class="fa fa-list-ol"></i></a></button></div>
<div class="col-xs-3  "style="margin-left:50px;">
             <div id="imaginary_container"> 
                <div class="input-group stylish-input-group">
                    <input type="text" class="form-control" name="sapId" id="sapId" placeholder="Search"  >
                   <div class="input-group-addon">
                        <button type="submit" onClick = "javascript:searchLtaRecord( )">
                            <i class="fa fa-search"></i>
                        </button>  
                    </div>
                </div>
            </div>
        </div>

</div>
<div class="row" style="margin-left:8px;margin-right:8px;">
    
	<div class="col-xs-12 bs-example"  >	
		<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i>  Monthly LTA
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
<%
	if(result.size() > 0) {

%>
   	<table class="table table-bordered">
        <thead>
            <tr class="info">
                <th style="width:9%">Transaction ID</th>
                <th style="width:10%">Employee Name</th>
                <th style="width:9%">SAP Number</th>
				<th style="width:9%">Department</th>
                <th style="width:8%">Designation</th>				             
                <th style="width:10%">Branch</th>				             
                <th style="width:10%">Remarks</th>				             
                <th style="width:10%">Date of Joining</th>				             
                <th style="width:10%">Requested On</th>				             
                <th style="width:9%" >Processed On</th>				             
                <th style="width:8%">Satus On</th>				             
            </tr>
        </thead>
   <input type="hidden" name="listSize" value="<%=result.size()%>">
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
                <td><%= tmpArr[9] %></td>
                <td><%= tmpArr[13] %></td>
                <td><%= tmpArr[10] %></td>
                <td><%= tmpArr[11] %></td>
<%
    if(tmpArr[8].equals("A")){
%>
				<td><img src="../images/process.png"> </td>              
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
    <div class="note1 note-info" >

	<p style="text-align:center;margin-top:5px;">No applications processed for FA-Year: <%= faYear %></p>
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