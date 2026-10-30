<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable,java.util.HashMap,java.util.Map, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*,java.text.ParseException,java.text.SimpleDateFormat" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<%@ page import="org.json.JSONObject"%>
<%@ page errorPage="../includes/error.jsp" %>  
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>





<!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> View </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/capex.css" rel="stylesheet"/>
	<link href="../css/jquery.dataTables.min.css" rel="stylesheet"/> 	
	<link href="../css/dataTables.bootstrap.min.css" rel="stylesheet"/> 		
	<style>
		.select2-container .select2-selection--single 
		{
			box-sizing: border-box;
			cursor: pointer;
			display: block;
			height: 32px;		
			border-radius: 0;
			  border: 1px solid #CCC;
		}
		.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
      color: #000;
      font-family: ...;
      font-size: 16px;
      font-weight: bold;
	 
	}.fixed-table-body {
	  overflow-x: auto;
	  overflow-y: auto;
	  height: auto;}
  

	/* avoid info to be misaligned to pagination buttons */
		#example_info {
		clear: none;
	
	}
	
	</style>
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../jscript/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../jscript/select2.min.js"></script>
	<script src="../jscript/jquery.dataTables.min.js"></script>
	<script src="../jscript/capex.js"></script>
	<script>
	$(document).ready(function() {
	$('body').on('focus',".datepicker", function(){
			$(this).datepicker({ dateFormat: 'dd-mm-yy' });	
	});
	$('body').on('focus',"#textarea", function(){
			$(this).maxlength({alwaysShow: true});		
	});	
	$(".multi").select2({ width: '100%'  });
    $('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
	  var table = $('#example').DataTable({
		//"sDom": '<"row view-filter"<"col-sm-10"<"pull-left"l><"pull-right"f><"clearfix">>>t<"row //view-pager"<"col-sm-1"<"text-center"ip>>>',
	// "rowCallback": function( row, data, index ) {
           // if(index%2 == 0){
              //  $(row).removeClass('myodd myeven');
              //  $(row).addClass('myodd');
          //  }else{
          ///      $(row).removeClass('myodd myeven');
          //       $(row).addClass('myeven');
           // }
         // },
"sDom": '<"top"pifl>rt<"bottom"><"clear">',

	sPaginationType: "full_numbers",
	"autoWidth": false, 
	"bSort" : false,
	"pageLength": 10,
	
		'aoColumns' : [
			{ 'sWidth': '5px' },
			{ 'sWidth': '85px' },
			{ 'sWidth': '7px' },
			{ 'sWidth': '7px' },
			{ 'sWidth': '21px' },
			{ 'sWidth': '7px' },
			{ 'sWidth': '3px' }
			
			
		  ]
	
	});
    
	$("#example_info").detach().prependTo('#example_wrapper');
	$("#example_paginate").detach().prependTo('#example_wrapper');
});
	</script>	
</head>
<%

String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Project Manager","Background","Reviewed By List", "Approved By List","compAttachment","attachmentFolderName" };

	Hashtable ht = new Hashtable();
    ht.put("HEADERSECTION1", headerSection);
    ht.put("DOCUMENTOID", "DOC1005");	
	ArrayList arrList = new ArrayList();
	String headerData[] = null;
	ht.put("APPLICATION_NAME", "capex");
	ht.put("CREATEDBY", emailId);
	ht.put("STATUS", "I");

    ArrayList headerDataList =  capexHeaderController.viewAll("sdf","sdfsd",ht);	
	 int searchSize = headerDataList.size();
 
	if (searchSize> 0) {
        for (int eee = 0; eee < searchSize; eee++) {
           headerData = (String[]) headerDataList.get(eee);  
			//	for (int eee1 = 0; eee1 < headerData.length; eee1++) {
				//	out.println(" headerData["+eee1+ "] " +headerData[eee1]) ;  
		//	}
			//	break;
			
            String requestNumber = headerData[0];			
			String projectTitle = headerData[7];
			String capexAmt = headerData[10];
			String opexAmt = headerData[11];
			String projectCategory = headerData[9];          
            String createdOn = headerData[19];			
            String status = headerData[22];  		
		
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
			try {
			Date date = (Date) format.parseObject(createdOn);			
			createdOn = format2.format(date);			
			} catch (ParseException e) { 
			e.printStackTrace();
			}	
		
            String showData [] = { requestNumber,projectTitle,capexAmt,opexAmt,projectCategory,createdOn,status};
            arrList.add(showData);        
			
        }
    }
	
%>
<body> 
<%@ include file="../includes/relatedLinksnew.jsp" %>

<div class="container-fluid ">
	<div class="row" style="margin-top:10px;">
	<div class="col-xs-12 ">
	<div class="portlet box blue">
	<div class="portlet-title">
	<div class="caption">
		<i class="fa fa-th"></i>  View
	</div>			
	</div>
	<div class="portlet-body">
		<form method="POST" class="form-horizontal" role="form" name="viewCapex">
			<div class="form-body">
						<table id="example" class="display table table-striped table-bordered"  cellspacing="0" width="100%" >	
							<thead>
								<tr class="active" >						
									<th class="text-center">ID</th>								
									<th class="text-center">Project Title</th>
									<th class="text-center">Capex<br>(Rs. in Lakhs)</th>
									<th class="text-center">Opex<br>(Rs. in Lakhs)</th>
									<th class="text-center">Project Category</th>
									<th class="text-center">Submitted On</th>
									<th class="text-center">Status</th>
								</tr>
							</thead>
							<tbody>
                             <% 
                                    int sizeList = arrList.size();
                                    if(sizeList > 0 ){
                                         for (int yy = 0; yy < sizeList; yy++) {
                                             String strArray[] = (String[])arrList.get(yy);
                            %>
							<tr >
								<td class="text-left"><%=strArray[0]%></td>
								<td class="text-left"><a href="#" onclick="javascript:clickViewCapex('<%=strArray[6]%>','<%=strArray[0]%>')"><%=strArray[1]%></a></td>
								<td class="text-right"><%=strArray[2]%></td>
								<td class="text-right"><%=strArray[3]%></td>
								<td class="text-left"><%=strArray[4]%></td>
								<td class="text-left"><%=strArray[5]%></td>
								<% 
                                    if("I".equals(strArray[6])){  
                                %>
								<td class="text-left">New</td>
                                <% } 
                                 if("R".equals(strArray[6])){   %>
                                 <td class="text-left">Rejected</td>
                                <% } 
                                 if("A".equals(strArray[6])){   %>
                                 <td class="text-left">Accepted</td>
                                <% } %>
							</tr>
							<%
                                   }
                            }else {
                            %>
                            <tr class="text-center"><td colspan="7">No Record found for given criteria</td></tr>	
                            <% } 
                            %>
							</tbody>
						</table>
			</div><input type="hidden" name="id" id="id"  value="" > 
			<input type="hidden" name="status" id="status"  value="" > 
		</form>	
	</div>
	</div>			
	</div>

  </div>   
</div>
<footer class="footer ">
	<div class="container text-center">
		<p style="margin-bottom:2px; margin-left:80px;" class="ex ">Copyright @ 2016 Bennett, Coleman & Co. Ltd. All rights reserved. </p>
	</div>
</footer>
</body>
</html>
