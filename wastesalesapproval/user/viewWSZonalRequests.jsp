<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, org.json.simple.JSONObject, java.io.*, org.json.simple.parser.JSONParser" %>
<%@ page import="com.bccl.claim.web.util.Constants"%>
<%@ page import="com.bccl.claim.web.util.Utility,org.json.simple.JSONArray,org.json.simple.JSONObject,org.json.simple.JSONValue"%>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="wasteSalesDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>


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
	<style>
.fixed-table-body {
  overflow-x: auto;
  overflow-y: auto;
  height: auto;}
</style>
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/bootstrap-multiselect.js"></script>	
	<script src="../js/bootstrap-table.min.js"></script>
	<script src="../js/bootstrap-table-export.js"></script>
	<script src="../js/bootstrap-table-toolbar.js"></script>
	<script src="../js/wasteSales.js"></script>			
	<script>
	$(document).ready(function(){	
	$('.RelatedLinks ul li.RelLinks').hover(function() {
	$(this).find('.dropdownmenu').show();
	}, function(){
	$(this).find('.dropdownmenu').hide();
	});	
	});
  </script>
</head>
<%@ include file="../includes/statusHash.jsp" %>

<% 
		Hashtable attributeHash = new Hashtable();
       
       /* attributeHash.put("docId", "DOC1001");
        attributeHash.put("emailId",emailId);
        attributeHash.put("profileText", "ZONE HEAD");
        ArrayList listAttribute = wasteSalesHeaderController.listOfAtrributes(attributeHash);
   
        for (int kk = 0; kk<listAttribute.size(); kk++){
			String strArray[] = (String[]) listAttribute.get(kk);                   
			zone = strArray[0];
			       
				   		out.println("zone---"+zone);

	    }*/


		Hashtable locHash1 = new Hashtable();
		locHash1.put("DOCUMENTOID", "DOC1001");
        locHash1.put("EMAILID",emailId);
        locHash1.put("PROFILETEXT","ZONE HEAD");
		ArrayList locationAttributelist = wasteSalesDetailsController.listLocation(locHash1);

		String strLoc="";
		String zoneType="";

		ArrayList headerList	= new ArrayList();
		Hashtable detailsHash	= new Hashtable();
		detailsHash.put("EMAILID", emailId);
    //    detailsHash.put("STATUS","STATUS");
        detailsHash.put("DOCUMENTOID", "DOC1001");
		detailsHash.put("CREATEDBY", emailId);
//		headerList = docChangeLogController.search("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailsHash);
       	headerList = wasteSalesHeaderController.searchRequest(detailsHash);

		//String statusName[] = {"In Process","Pending for Approval","In-Review","Closed","Approved"};
		String statusName[] = {"In Process","Pending for Approval","In-Review","Approved","Pending for Approval"};
		String statusVal[] = {"I","AI","R","CL","A"}; 
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
				<i class="fa fa-th"></i> View Pending Request(s)   
			</div>			
			</div>
				<div class="portlet-body">
					<form class="form-horizontal" role="form" id="" name="viewAllApprovalRequest" method="post">
					<%@ include file="../includes/legand.jsp" %>

					<div class="form-body">
					 <div class="table-responsive">
						<table id="table" class="table table-bordered"  data-toggle="table" data-pagination="true"  data-query-params="queryParams" >	
							<thead>
								<tr class="warning" >						
									<th width="20px">Request No.</th>								
									<th width="20px">Zone/Type</th>									
									<th width="15px">Created On</th>					
									<th width="20px">Modified By</th>									
									<th width="15px">Modified On</th>									
									<th width="10px">Status</th>
								</tr>
							</thead>
							<tbody>
                            <%
                       
							for (int ii=0; ii<headerList.size(); ii++)
							{
								String strArr[] = (String[])headerList.get(ii);
								
								String jsString = strArr[4];
								
                          %>
								<tr class="active">
                                    <td><a href="#" onclick="showAppForm('<%=strArr[1]%>','<%=strArr[12]%>')" class="boldunderline" ><%=strArr[1]%></a></td>

<%
								 for (int kk = 0; kk<locationAttributelist.size(); kk++)
								 {
										String locArray1[] = (String[]) locationAttributelist.get(kk); 
										String  zone = locArray1[9];
										 if(jsString.contains(zone))
										 {

											 zoneType =zone;
										 }
									
								  }
	

%>
							        <td><%=zoneType%></td> 
							        <td><%=strArr[9]%></td> 
							        <td><%=strArr[10]%></td> 
							        <td><%=strArr[11]%></td> 

							  
<%
									/*for(int i=0; i < statusVal.length; i++) 
									{								 
										if ((strArr[12]).equals(statusVal[i]) ) {*/
 %>
										<td><img src="<%=statusImg.get(strArr[12])%>"></td>
<%
											//} 

									//}
%>
                                    
                                 	<input type="hidden" name="requestId" id="requestId" value="<%=strArr[1]%>">
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