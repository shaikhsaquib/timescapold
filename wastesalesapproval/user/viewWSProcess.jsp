<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, org.json.simple.JSONObject, java.io.*, org.json.simple.parser.JSONParser" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility" %>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<!DOCTYPE >
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0">
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="../css/style_1.css" rel="stylesheet"/>
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-multiselect.css" rel="stylesheet">
	<link href="../css/bootstrap-table.min.css" rel="stylesheet"/> 
	<!--[if lt IE 9]>
  <script type='text/javascript' src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <script type='text/javascript' src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
<![endif]-->
<style>
.fixed-table-body {
  overflow-x: auto;
  overflow-y: auto;
  height: auto;}
</style>
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/bootstrap-multiselect.js"></script>	
	<script src="../js/bootstrap-table.min.js"></script>
	<script src="../js/bootstrap-table-export.js"></script>
	<script src="../js/bootstrap-table-toolbar.js"></script>
	<script src="../js/wasteSales.js"></script>	

		
	<script>
	$(document).ready(function(){
		
	// $(document).ready(function(){:
	$('.RelatedLinks ul li.RelLinks').hover(function() {
	$(this).find('.dropdownmenu').show();
	}, function(){
	$(this).find('.dropdownmenu').hide();
	});

	
	});
  </script>
</head>
<%@ include file="../common/processHeaderDetailsConfig.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>

<% 
		//String headerSection1 [ ]	= {"statusType","createdby","documentstate","reference","period","date","branch"};

		ArrayList headerList		= new ArrayList();

		Hashtable detailsHash		= new Hashtable();

		detailsHash.put("CREATEDBY", emailId);
		detailsHash.put("DOCUMENTOID", "DOC1001");
		detailsHash.put("HEADERSECTION1", headerSection1);

		headerList = wasteSalesHeaderController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailsHash);

		//String statusName[] = {"In-Process","Draft","Cancel","Approved","In-Review","Closed"};
		String statusName[] = {"In-Process","Draft","Cancel","Pending for Approval","In-Review","Approved"};
		String statusVal[] = {"I","D","C","A","R","CL"};
		

%>
<body>
<%@ include file="../common/relatedLinks.jsp" %>
	<div class="container well">
	<div class="row ">
	<div class="col-xs-2"></div>
		<div class="col-xs-12 bs-example">
			<div class="portlet box blue">
			<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i> View Waste Sales Request(s)   
			</div>			
			</div>
				<div class="portlet-body">
					<form class="form-horizontal" role="form" id="" name="viewAllWasteSalesRequest" method="post">
					<%@ include file="../includes/legand.jsp" %>
					<div class="form-body">
					 <div class="table-responsive">
						<table id="table" class="table table-bordered"  data-toggle="table" data-pagination="true"  data-query-params="queryParams" >	
							<thead>
								<tr class="warning" >						
									<th>Req.No.</th>								
									<th>Zone/Type</th>
									<th>Reference</th>
									<th>Location</th>
									<th>Quarter</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>							
<%
                       
							for (int ii=0; ii<headerList.size(); ii++)
							{
								String strArr[] = (String[])headerList.get(ii);

							
%>
								<tr class="active">
<%
									/*for(int j=0; j < statusVal.length; j++) 
									{	
										if(strArr[32].equals("AI"))	
										{
											break;
										}
										else if ((strArr[32]).equals(statusVal[j])) 
										{
										//out.println("-------"+(strArr[4]).contains(statVal));*/
%>
                                    <td><a href="#" onclick="showDetails('<%=strArr[0]%>')" class="boldunderline" ><%=strArr[0]%></a></td>								
                                    <td><%=(strArr[7]==null)?"-":strArr[7]%></td>
                                    <td><%=(strArr[8]==null)?"-":strArr[8]%></td>
                                    <td><%=(strArr[11]==null)?"-":strArr[11]%></td>
                                    <td><%=(strArr[22]==null)?"-":strArr[22]%></td>
                                    
<%
											/*for(int i=0; i < statusVal.length; i++) 
											{								 
												if ( (strArr[32]).equals(statusVal[i]) ) {*/
								   %>
									<td class="text-center"><img src="<%=statusImg.get(strArr[32])%>"></td>
<%
												/*} 

											}*/
								   %>
									
									
                                  
									<input type="hidden" name="requestId" id="requestId" value="<%=strArr[0]%>">
<%
										/*}
									}*/
								   %>
								</tr>
<%
							}
%>				
							</tbody>
						</table>
					</div>
					</div>
					</form>
				</div>
			</div>	
		</div>
	<div class="col-xs-2"></div>
	</div>
	</div>
	</div>
	<td style="width:10px;"><input type="hidden" id="refreshed" value="no"/>
</body>
</html>