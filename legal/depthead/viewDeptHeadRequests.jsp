<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, org.json.simple.JSONObject, java.io.*, org.json.simple.parser.JSONParser" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility" %>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

<!DOCTYPE >
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>View Request</title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/legal.css" rel="stylesheet"/>
	<link href="../css/jquery.dataTables.min.css" rel="stylesheet"/> 	
	<link href="../css/dataTables.bootstrap.min.css" rel="stylesheet"/> 	
	<style>
		
		.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
      color: #000;
      font-family: ...;
      font-size: 16px;
      font-weight: bold;
	 
}
.fixed-table-body {
  overflow-x: auto;
  overflow-y: auto;
  height: auto;}
  
	thead input {
		width: 100%;
		padding: 3px;
		box-sizing: border-box;
		font-size:12px;
		color:grey;
		font-weight:normal;
	}
	/* hide filter and length select box for this example */
	#example_filter, #example_length {
		margin-top:6px;
		margin-left:20px;
	}

	/* avoid info to be misaligned to pagination buttons */
		#example_info {
		clear: none;
	}
	</style>
	
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>	
	<script src="../js/bootstrap-maxlength.min.js"></script>
	<script src="../js/jquery.dataTables.min.js"></script>
	<script src="../jscript/legal.js"></script>	
	<script>
	$(document).ready(function() {
	
	$('body').on('focus',".datepicker", function(){
			$(this).datepicker({ dateFormat: 'dd-mm-yy' });	
	});
	
	$('[data-toggle="tooltip"]').tooltip({placement:'top'});
	
	
    $('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
	
	$('#example thead tr#filterrow  th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder=" '+title+'" />' );
    } );
 
   
    // DataTable
    var table = $('#example').DataTable({ sPaginationType: "full_numbers","autoWidth": false, "bSort" : false});
     
    // Apply the filter
    $("#example thead input").on( 'keyup change', function () {
        table
            .column( $(this).parent().index()+':visible' )
            .search( this.value )
            .draw();
    } );
	$("#example_info").detach().prependTo('#example_wrapper');
	$("#example_paginate").detach().prependTo('#example_wrapper');

});
	</script>	
</head>

<%@ include file="../common/leagalHeaderDetailsConfig.jsp" %>
<% 

		//String headerSection1 [ ]	= {"statusType","createdby","documentstate","reference","period","date","branch"};
		Hashtable statusImg = new Hashtable( );
		statusImg.put("D",  "../images/draft.png");
		statusImg.put("I",  "../images/inProcess.png");
		statusImg.put("A",  "../images/half_process.png");
		statusImg.put("R",  "../images/review.png");
		statusImg.put("CL",  "../images/approved.png");
	
		ArrayList headerList	= new ArrayList();
		Hashtable detailsHash	= new Hashtable();
//		detailsHash.put("EMAILID", emailId);
       detailsHash.put("STATUS","L");
        detailsHash.put("DOCUMENTOID", "DOC1006");
		detailsHash.put("EMAILID", emailId);
		detailsHash.put("ORDER", "desc");
		headerList = docChangeLogController.search("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailsHash);

		//out.println("----"+headerList.size());
%>
