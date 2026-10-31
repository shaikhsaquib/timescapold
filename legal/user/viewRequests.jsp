<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>

<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>

<!DOCTYPE >
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>View Requests</title>	
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
		statusImg.put("C",  "../images/cancelled.png");
		statusImg.put("ACK",  "../images/acknowledge.png");
		statusImg.put("A",  "../images/approved1.png");
		statusImg.put("UA",  "../images/half_process.png");
		statusImg.put("US",  "../images/half_process.png");
		statusImg.put("R",  "../images/reviewed.png");
		statusImg.put("CL",  "../images/closed.png");
		statusImg.put("AR",  "../images/rejected1.png");
	
		ArrayList headerList		= new ArrayList();

		Hashtable detailsHash		= new Hashtable();

		detailsHash.put("CREATEDBY", emailId);
		detailsHash.put("DOCUMENTOID", "DOC1006");
		detailsHash.put("HEADERSECTION1", headerSection1); 
		detailsHash.put("APPLICATION_NAME", "legalContractManagement"); 
		 
		session.setAttribute("docId","DOC1006");
		session.setAttribute("whom","User");

		//String whom = testEncrpt.encrypt("User");

		headerList = docHeaderController.viewAll("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailsHash);

		//out.println("---"+headerList.size());

		//String statusName[] = {"In-Process","Draft","Cancel","Approved","In-Review","Closed"};
		String statusName[] = {"In-Process","Draft","Cancel","Pending for Approval","In-Review","Approved","Acknowledged","Rejected"};
		String statusVal[] = {"I","D","C","A","R","CL","ACK","AR"};
		String reqStatus = "C";
		String canStatus = "C";
		String requestNo = "";

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");

		//SimpleDateFormat datOfAgreformat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat datOfAgreformat = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat datOfAgreformat1 = new SimpleDateFormat("dd-MMM-yyyy");
%>
<body >
<%@ include file="../includes/relatedLinks.jsp" %>
<hr style="margin-bottom:10px;">
	<div class="container-fluid ">
	<div class="row">
	<div class="col-xs-1"></div>	
	<div class="col-xs-12 bs-example">
	<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-bars"></i>View Request(s)
			</div>			
		</div>
		<div class="portlet-body">
			<form class="form-horizontal" role="form" id="frmViewRequest" name="frmViewRequest" method="post">
				<table>									
				<tr>																									 									
					<td  style="text-align:right;" colspan="2">
					<p style="text-align:right;">
						 LEGEND : <img src="../images/draft.png"> : Draft | <img src="../images/inProcess.png"> : In Process | <img src="../images/acknowledge.png"> : Acknowledged | <img src="../images/half_process.png"> : Pending for approval | <img src="../images/approved1.png"> : Approved | <img src="../images/reviewed.png"> : Reviewed | <img src="../images/rejected1.png"> : Rejected | <img src="../images/cancelled.png"> : Cancelled | <img src="../images/closed.png"> : Closed
					</p>
					</td>																	
				</tr>									
			</table>
			<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%" >	
				<thead>						
					<tr style="background-color: #d9edf7;">				
						<th width="10%">Document No.</th>								
						<th width="14%">Name Of Parties</th>
						<!-- <th width="10%">Date Of Agreement</th> -->
						<th width="10%">Request Date</th>
						<th width="10%">Agreement</th >
						<th width="14%">Nature Of Parties</th >
						<th width="10%">Value</th >
						<th width="12%">Created On</th >
						<th width="5%">Status</th >
						<th width="5%">Action</th >
					</tr>
					<tr id="filterrow">
						<th>Document No.</th>
						<th>Name Of Parties</th>
						<!-- <th>Date Of Agreement</th> -->
						<th>Request Date</th>
						<th>Agreement</th>
						<th>Nature Of Parties</th>
						<th>Value</th>
						<th>Created On</th>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</thead>
				<tbody>
	
<%
                       
				for (int ii=0; ii<headerList.size(); ii++) 
				{
					String strArr[] = (String[])headerList.get(ii);	
					String createdOn ="";
					String dateOfAgr ="";
	
					try {
						Date date = (Date) format.parseObject(strArr[22]);

						Date date1 = (Date) datOfAgreformat.parseObject(strArr[10]);

						 createdOn = format2.format(date);	
						 
						 dateOfAgr = datOfAgreformat1.format(date1);
						 
					} catch (ParseException e) {
						
						e.printStackTrace();
					}
			
%>
				<tr>
<%
					AESencrp testEncrpt = new AESencrp();

					requestNo = testEncrpt.encrypt(strArr[0]);
					requestNo = requestNo.replaceAll("\\s+", "");

					String encrptStatus = testEncrpt.encrypt(strArr[25]);
					encrptStatus = encrptStatus.replaceAll("\\s+", "");

%>
					
					<td class="text-left col-xs-1"><a href="#" onclick="showDetails1('<%=requestNo%>','<%=strArr[25]%>','User','<%=encrptStatus%>')" class="boldunderline" ><%=strArr[0]%></a></td>
					<td class="text-left col-xs-1"><%="".equals(strArr[8]) ? "-" : strArr[8] %> </td>
					<td class="text-left col-xs-1"><%=dateOfAgr%></td>
					<td class="text-left col-xs-1"><%="0".equals(strArr[12]) ? "-" : strArr[12]%></td>
					<td class="text-left col-xs-1"><%="0".equals(strArr[13]) ? "-" : strArr[13]%></td>
					<td class="text-left col-xs-1"><%="".equals(strArr[11]) ? "-" : strArr[11]%></td>
					<td class="text-left col-xs-1"><%=createdOn%></td>
					<td class="text-left col-xs-1">&nbsp;&nbsp;<%//=strArr[25]%><img src="<%=statusImg.get(strArr[25])%>"></td>
					
						<!-- <i class="fa fa-ban" ><input type="button"  class="btn btn-danger"  value="cancel" name="cancelButton" id="cancel" height="20" onclick = "javascript:validate();"/></i> -->
<%					if("I".equals(strArr[25]) || "D".equals(strArr[25])) 
					{
						String canStatus1 = testEncrpt.encrypt(canStatus);
						canStatus1 = canStatus1.replaceAll("\\s+", "");
%>
						<td class="text-left col-xs-1"><a class="btn btn-danger" onclick = "javascript:actionOnRequest('<%=requestNo%>','<%=strArr[26]%>','<%=canStatus1%>');" style="padding:2px;" title="Cancel">Cancel</a></td>

						<input type="hidden" name="reqStatus" id="reqStatus" value="" />
						<input type="hidden" name="reqId<%=ii%>" id="reqId<%=ii%>" value="<%=strArr[0]%>">
<%
					}else 
					{
%>
						<td class="text-left col-xs-1">&nbsp;&nbsp;-</td>
<%
					}
%>
				</tr>	
<%
				}//end of for
%>				
					<input type="hidden" name="requestId" id="requestId" value=""/>
					<input type="hidden" name="docId" id="docId" value="DOC1006" />				
					<input type="hidden" name="whom" id="whom" value="User" />				
				
				</tbody>
				</table>
		</form>
		</div>
	</div>			
	</div>
	<div class="col-xs-1"></div>
	</div>
	</div>

<footer class="footer text-center">
	<div class="container">
		<p style="margin-bottom:2px;" class="ex">Copyright @ 2016 Bennett, Coleman & Co. Ltd. All rights reserved. </p>
	</div>
</footer>
</body>
</html>
