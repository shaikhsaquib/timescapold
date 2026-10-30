<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat" %>

<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="capexkeyWordController" class="com.bccl.workflows.web.controller.DocumentKeywordsController"/>
 <!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> Review History</title>	
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
	<script src="../jscript/common.js"></script>
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
			{ 'sWidth': '1px' },
			{ 'sWidth': '90px' },
			{ 'sWidth': '20px' },
			{ 'sWidth': '20px' },
			{ 'sWidth': '25px' },
			{ 'sWidth': '10px' },
			{ 'sWidth': '15px' }
		  ]
	
	});
	
	$("#example_info").detach().prependTo('#example_wrapper');
	$("#example_paginate").detach().prependTo('#example_wrapper');
});
	</script>	
</head>
<%
	Hashtable hstable = new Hashtable(); 
	ArrayList arrList = new ArrayList();
	String headerData[] = null;
	String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Project Manager","Background","Reviewed By List", "Approved By List","compAttachment","attachmentFolderName" };

	hstable.put("HEADERSECTION1", headerSection);
	hstable.put("DOCUMENTOID", "DOC1005");
	hstable.put("CREATEDBY", emailId);
	hstable.put("SERCHCONTAINT", "reviewedBy");
	hstable.put("STATUS", "A','RR','RJ");


	ArrayList headerDataList =  docChangeLogController.viewList(hstable);
	int headerSize = headerDataList.size();
	//out.println("headerSize : "+ headerSize);
	if( headerSize > 0){  
		for (int eee = 0; eee < headerSize; eee++){
			headerData = (String[]) headerDataList.get(eee);
			 //out.println("headerData length : "+ headerData.length);
			//for (int eee1 = 0; eee1 < headerData.length; eee1++){                
			//	out.println (" headerData [ "+ eee1 +"] : " + headerData[eee1]);
			//	} 
		//	out.println (" headerData [5] : " + headerData[5]);
		}
	}  
	




%>
<body> 
<%@ include file="../includes/relatedLinksnew.jsp" %>

<div class="container-fluid ">
	<div class="row">
	
	<div class="col-xs-12 bs-example">
	<div class="portlet box blue">
	<div class="portlet-title">
	<div class="caption">
		<i class="fa fa-th"></i>  Review History
	</div>			
	</div>
	<div class="portlet-body">
		<form action="#" class="form-horizontal" role="form">
			<div class="form-body">
				<table id="example" class="display table table-striped table-bordered"  cellspacing="0" width="100%" >
							<thead>
								<tr class="active">						
									<th class="text-center">ID.</th>								
									<th class="text-center">Project Title</th>
									<th class="text-center">Capex (Rs. in Lakhs)</th>
									<th class="text-center">Opex (Rs. in Lakhs)</th>
									<th class="text-center">Project Category</th>
									<th class="text-center">Submitted On</th>
									<th class="text-center">Status</th>									
								</tr>
							</thead>
							<tbody>
							<%
							if( headerSize > 0){  
								for (int eee = 0; eee < headerSize; eee++){
									headerData = (String[]) headerDataList.get(eee);
									//out.println("headerData length : "+ headerData.length);
							%>
							<tr >
								<td><%=(eee+1)%></td>								
								<td class="text-left"><a href="../view/dashboard.jsp?id=<%=headerData[0]%>&status=RA"><%=headerData[7]%></a></td>
								<td class="text-right"><%=headerData[10]%></td>
								<td class="text-right"><%=headerData[11]%></td>
								<td class="text-left"><%=headerData[9]%></td>
								<%
									String  createdOn = headerData[19];
									SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
									SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
									try {
										Date date = (Date) format.parseObject(createdOn);
										createdOn = format2.format(date);										
																			
									} catch (ParseException e) { 
									e.printStackTrace();
									}
									
								%>
								<td class="text-center"><%=createdOn%></td>
								<% 
                                    if("I".equals(headerData[22])){  
                                %>
								<td class="text-center">New</td>
                                <% } 
                                 if("R".equals(headerData[22])){   %>
                                 <td class="text-center">Reviewed</td>
                                <% } 
                                 if("A".equals(headerData[22])){   %>
                                 <td class="text-center">Approved</td>
                                <% }if("CL".equals(headerData[22])){   %>
                                 <td class="text-center">Closed</td>
                                <% } 
					if("RJ".equals(headerData[22])){   %>
                                 <td class="text-center">Rejected</td>
                                <% } %>  
							</tr>
                            <%
                                   }
                            }else{
                            %>
                            <tr class="text-center"><td colspan="7">No Record found</td></tr>	
                            <% } 
                            %>
							
							</tbody>
						</table>
			</div>
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
