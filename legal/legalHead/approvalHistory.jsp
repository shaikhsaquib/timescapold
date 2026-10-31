<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, org.json.simple.JSONObject, java.io.*, org.json.simple.parser.JSONParser,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility" %>
<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
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
	$('body').on('focus',".textarea", function(){
			$(this).maxlength({alwaysShow: true});		
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
	
		ArrayList headerList	= new ArrayList();
		Hashtable detailsHash	= new Hashtable();
//		detailsHash.put("EMAILID", emailId);
		detailsHash.put("HEADERSTATUS","CL','ACK','R','A");
		detailsHash.put("CHANGELOGSTATUS","CL','ACK','R','A");
        detailsHash.put("DOCUMENTOID", "DOC1006");
		detailsHash.put("EMAILID", emailId);
		detailsHash.put("ORDER", "DESC");
		detailsHash.put("APPLICATION_NAME", "legalContractManagement");
		detailsHash.put("HEADERSECTION1", headerSection1);
		headerList = docChangeLogController.searchDetails("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailsHash);

		session.setAttribute("docId","DOC1006");
		session.setAttribute("whom","Approver");


		String ApplicationName				= "";
		String statusType					= "";
		String createdby					= "";
		String documentstate				= "";

		String typeOfAgreement				= "";
		String partyName					= "";
		String reasonForSingAgreement		= "";
		String dateOfAgreement				= "";
		String valueOfAgreement				= "";
		String agreement					= "";
		String natureOfParties				= "";
		String address						= "";
		String jurisdiction					= "";
		String terminationFromDate			= "";
		String terminationToDate			= "";
		String userDeptEmailid				= "";
		String legalHeadEmailid				= "";
		String mainComments					= "";
		String createdOn					= "";
		String requestId					= "";
		String createdByTab					= "";
		String createdOnTab					= "";
		String status1						= "";
		String requestNo					= "";

		
		//	out.println("userDeptEmailid---"+strArr[1]);
		//	out.println("createdOnTab---"+createdOnTab);
		//	out.println("createdByTab---"+createdByTab);
		//	out.println("legalHeadEmailid---"+legalHeadEmailid);

		String statusName[] = {"In-Process","Draft","Cancel","Pending for Approval","In-Review","Approved","Acknowledged","Rejected"};
		String statusVal[] = {"I","D","C","A","R","CL","ACK","AR"};
			

%>
<body >
<form class="form-horizontal" role="form" id="" name="frmViewRequest" method="post">
<%@ include file="../includes/relatedLinks.jsp" %>
<hr style="margin-bottom:10px;">
	<div class="container-fluid ">
	<div class="row">
	<div class="col-xs-1"></div>	
	<div class="col-xs-12 bs-example">
	<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-bars"></i>Approval History
			</div>			
		</div>
		<div class="portlet-body">
			
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
						<th width="12%">Name Of Parties</th>
						<th width="16%">Type Of Agreement</th>
						<th width="10%">Agreement</th >
						<th width="10%">Nature Of Parties</th >
						<th width="10%">Value</th >
						<th width="10%">Created By</th >
						<th width="10%">Created On</th >
						<th width="11%">Status</th >
						
					</tr>
					<tr id="filterrow">
					<th>Document No.</th>
					<th>Name Of Parties</th>
					<th>Type Of Agreement</th>
					<th>Agreement</th>
					<th>Nature Of Parties</th>
					<th>Value</th>
					<th>Created By</th>
					<th>Created On</th>
					<td>&nbsp;</td>				
				</tr>
				</thead>
				<tbody>
	 
<%           
		for (int ii=0; ii<headerList.size(); ii++)
		{
			String strArr[] = (String[])headerList.get(ii);

			requestId					= strArr[1];
			ApplicationName				= strArr[4];
			statusType					= strArr[5];
			createdby					= strArr[6];
			documentstate				= strArr[7];
			typeOfAgreement				= strArr[8];
			partyName					= strArr[9];
			reasonForSingAgreement		= strArr[10];
			dateOfAgreement				= strArr[11];
			valueOfAgreement			= strArr[12];
			agreement					= strArr[13];
			natureOfParties				= strArr[14];
			address						= strArr[15];
			jurisdiction				= strArr[16];
			terminationFromDate			= strArr[17];
			terminationToDate			= strArr[18];
			userDeptEmailid				= strArr[19];
			legalHeadEmailid			= strArr[20];
			mainComments				= strArr[21];
			//createdOn					= strArr[22];
			createdByTab				= strArr[22];
			createdOnTab				= strArr[23];
			status1						=strArr[26];

			createdByTab				= createdByTab.substring(0,createdByTab.indexOf("@"));

			//out.println("status1---"+status1);
			//out.println("strArr[22]---"+strArr[22]);
			//out.println("strArr[23]---"+strArr[23]);
			//out.println("strArr[25]---"+strArr[25]);

			AESencrp testEncrpt = new AESencrp();

			requestNo = testEncrpt.encrypt(strArr[1]);
			requestNo = requestNo.replaceAll("\\s+", "");

			String encrptStatus = testEncrpt.encrypt(status1);
			encrptStatus = encrptStatus.replaceAll("\\s+", "");
				
%>

		<tr >
			<td class="text-left col-xs-1"><a href="#" onclick="showDetails1('<%=requestNo%>','<%=status1%>','Approver','<%=encrptStatus%>')" class="boldunderline" ><%=strArr[1]%></a></td>
			<td class="text-left col-xs-1"><%=partyName%> </td>
			<td class="text-left col-xs-1"><%=typeOfAgreement%></td>
			<td class="text-left col-xs-1"><%=agreement%></td>
			<td class="text-left col-xs-1"><%=natureOfParties%></td>
			<td class="text-left col-xs-1"><%=valueOfAgreement%></td>
			<td class="text-left col-xs-1"><%=createdByTab%></td>
			<td class="text-left col-xs-1"><%=createdOnTab%></td>
			<td class="text-left col-xs-1">&nbsp;&nbsp;<%//=strArr[25]%><img src="<%=statusImg.get(status1)%>"></td>

	
				<!-- <i class="fa fa-ban" ><input type="button"  class="btn btn-danger"  value="cancel" name="cancelButton" id="cancel" height="20" onclick = "javascript:validate();"/></i> -->
<%					//if("C".equals(strArr[25]))  
			//{
%>
				<!-- <td class="text-left col-xs-1">&nbsp;&nbsp;Cancelled<img src="<%//=statusImg.get(strArr[25])%>" border="0"></td>-->
<% 
		//	}else if("I".equals(strArr[25]) || "D".equals(strArr[25])) 
		//	{
%>
				<!-- <td class="text-left col-xs-1">&nbsp;&nbsp;<button class="btn btn-danger" onclick = "javascript:cancelRequest('<%//=strArr[0]%>','<%//=strArr[26]%>');"><i class="fa fa-ban" >&nbsp;&nbsp;Cancel</i></button></td> -->
<%
		//	}
%>
				<input type="hidden" name="reqStatus" id="reqStatus" value="" />
				<input type="hidden" name="requestId" id="requestId" value="<%=requestId%>" />					
					
				</tr>	
				
					<!-- 	<input type="text"  name="requestId" id="requestId" value="<%//=strArr[0]%>"  />
						<input type="hidden"  name="docId" id="docId" value="<%//=strArr[26]%>"  /> -->
<%

				}
					
%>				
				
				</tbody>
				</table>
		
		</div>
	</div>			
	</div>
	<div class="col-xs-1"></div>
	</div>
	</div>
</form>
<footer class="footer text-center">
	<div class="container">
		<p style="margin-bottom:2px;" class="ex">Copyright @ 2016 Bennett, Coleman & Co. Ltd. All rights reserved. </p>
	</div>
</footer>
</body>
</html>
