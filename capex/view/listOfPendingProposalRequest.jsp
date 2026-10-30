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
	<link href="../css/select2.min.css" rel="stylesheet">
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
"sDom": '<"top"pifl>rt<"bottom"><"clear">',

	sPaginationType: "full_numbers",
	"autoWidth": false, 
	"bSort" : false,
	"pageLength": 10,
	
		'aoColumns' : [
			{ 'sWidth': '70px' },
			{ 'sWidth': '7px' },
			{ 'sWidth': '7px' },
			{ 'sWidth': '21px' },
			{ 'sWidth': '7px' },
			{ 'sWidth': '7px' },
			{ 'sWidth': '4px' }			
		  ]	
	});
    
	$("#example_info").detach().prependTo('#example_wrapper');
	$("#example_paginate").detach().prependTo('#example_wrapper');
});
	</script>	
</head>

<%


	String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal Date", "Proposal Amount", "Opex Amount","Location","Function","Project Manager","Project Category" ,"Financial Year","Budget Amount","Project Start Date","Project End Date", "Reason If Unbudgeted","Project Closed Out Report","Rationale","Project Description","Particulars","Estimated Cost","Total","Asset Disposal","Savings Envisaged","Payback Period","Project Sponsor","Project Coordinator","compAttachment","attachmentFolderName" ,"Opex Particulars", "Opex Estimated Cost","Total Opex"};
	
	Hashtable ht = new Hashtable();
	ArrayList arrList = new ArrayList();
	String headerData[] = null;
	ht.put("HEADERSECTION1", headerSection);
	ht.put("DOCUMENTOID", "DOC1005");
	ht.put("HEADER", emailId);
	ht.put("STATUS","L");
	ht.put("SEARCH", "Project Coordinator");
		
    ArrayList searchList =  capexHeaderController.viewAll("sdf","sdfsd",ht);

int searchSize = searchList.size();
//out.println(" searchSize " +searchSize) ;  
	if (searchSize> 0) {
        for (int eee = 0; eee < searchSize; eee++) {
           headerData = (String[]) searchList.get(eee);  
			//	for (int eee1 = 0; eee1 < headerData.length; eee1++) {
				//	out.println(" headerData["+eee1+ "] " +headerData[eee1]) ;  
		//	}
			//	break;
			
            String requestNumber = headerData[0];			
			String projectTitle = headerData[7];
			String capexAmt = headerData[9];
			String opexAmt = headerData[10];
			String projectCategory = headerData[14];          
            String createdOn = headerData[37];
            String modifiedOn = headerData[39];	
            String status = headerData[40];  
		//	out.println(" strData " +strData);
		
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
			try {
			Date date = (Date) format.parseObject(createdOn);
			Date date1 = (Date) format.parseObject(modifiedOn);
			//out.println(" date " +format2.format(date));
			createdOn = format2.format(date);
			modifiedOn = format2.format(date1);
			//System.out.println(date);
			//System.out.println("date : "+);
			} catch (ParseException e) { 
			e.printStackTrace();
			}
		
		
            String showData [] = { requestNumber,projectTitle,capexAmt,opexAmt,projectCategory,createdOn,modifiedOn,status};
            arrList.add(showData);        
			
        }
    }
	
	
%>
<body  > 
<%@ include file="../includes/relatedLinksnew.jsp" %>

<div class="container-fluid">
		<div class="row" style="margin-top:10px;">
	<div class="col-xs-12 bs-example">
	<div class="portlet box blue">
	<div class="portlet-title">
	<div class="caption">
		<i class="fa fa-th"></i>  List of Pending Proposals
	</div>			
	</div>
	<div class="portlet-body">
		<form class="form-horizontal" role="form" name="viewList2" method="Post">
			<div class="form-body">
				<table id="example" class="display table table-striped table-bordered"  cellspacing="0" width="100%" >
							<thead>
								<tr class="active" >						
									<!--th class="text-center">ID.</th-->								
									<th class="text-center">Project Title</th>
									<th class="text-center">Capex<br>(Rs. in Lakhs)</th>
									<th class="text-center">Opex<br>(Rs. in Lakhs)</th>
									<th class="text-center">Project Category</th>
									<th class="text-center">Submitted On</th>
									<th class="text-center">Modified On</th>
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
								<!--td><%=strArray[0]%></td-->								
							<td class="text-left"><a href="#" onclick="javascript:clickHere('<%=strArray[6]%>','<%=strArray[0]%>')"><%=strArray[1]%></a></td>
								<td class="text-right"><%=strArray[2]%></td>
								<td class="text-right"><%=strArray[3]%></td>
								<td class="text-left"><%=strArray[4]%></td>
								<td class="text-left"><%=strArray[5]%></td>
								<td class="text-left"><%=strArray[6]%></td>
                                <% 
                                    if("L".equals(strArray[7])){  
                                %>
								<td class="text-center">New</td>
                                <% } 
                                 if("CR".equals(strArray[7])){   %>
                                 <td class="text-center">Rejected</td>
                                <% } 
                                 if("CA".equals(strArray[7])){   %>
                                 <td class="text-center">Accepted</td>
                                <% } %>
							</tr>
                            <%
                                   }
                            }else {
                            %>
                            <tr class="text-center"><td colspan="6">No Record found</td></tr>	
                            <% } 
                            %>
							</tbody>
						</table>
			</div>
			<input type="hidden" name="id" id="id"  value="" > 
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
