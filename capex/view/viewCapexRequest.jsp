<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable,java.util.HashMap,java.util.Map, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="org.json.JSONObject"%>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
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
	<link href="../css/bootstrap-table.min.css" rel="stylesheet"/> 
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
	</style>
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../jscript/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../jscript/select2.min.js"></script>	
	<script src="../jscript/bootstrap-maxlength.min.js"></script>
	<script src="../jscript/bootstrap-table.min.js"></script>
	<script src="../jscript/bootstrap-table-toolbar.js"></script>
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
});
	</script>	
</head>
<%
Hashtable ht = new Hashtable();
ArrayList arrList = new ArrayList();
String headerData[] = null;
ht.put("DOCUMENTOID", "DOC1005");
//ht.put("HEADER", emailId);
//ht.put("SEARCH", "Reviewed By List");
ht.put("HEADER", "I");
ht.put("SEARCH", "Status Type");
ArrayList searchList =  capexHeaderController.searchRequest(ht);
int searchSize = searchList.size();

		 if (searchSize> 0) {
        for (int eee = 0; eee < searchSize; eee++) {
            headerData = (String[]) searchList.get(eee);      
            String requestNumber = headerData[1];
            String strData = headerData[4];
            String createdBy = headerData[9];
            String status = headerData[12];  
		//	out.println(" strData " +strData);
			JSONObject jObject  = new JSONObject(strData);			
			String projectTitle = (String)jObject.get("Project Title");
			projectTitle = projectTitle.replaceAll(";", ",");	
			String capexAmt = (String)jObject.get("Capex Amount");			
            String opexAmt =  (String)jObject.get("Opex Amount");
            String projectCategory =  (String)jObject.get("Project Category");
            String showData [] = { requestNumber,projectTitle,capexAmt,opexAmt,projectCategory,createdBy,status};
            arrList.add(showData);	
			
        }
    }
%>
<body> 
<%@ include file="../includes/relatedLinksnew.jsp" %>

<div class="container-fluid ">
	<div class="row">
	<div class="col-xs-2"></div>	
	<div class="col-xs-8 bs-example">
	<div class="portlet box blue">
	<div class="portlet-title">
	<div class="caption">
		<i class="fa fa-th"></i>  View
	</div>			
	</div>
	<div class="portlet-body">
		<form action="#" class="form-horizontal" role="form">
			<div class="form-body">
				<table id="table" class="table table-bordered"  data-toggle="table" data-pagination="true"  data-query-params="queryParams" >	
							<thead>
								<tr class="warning" >						
									<th class="text-center">ID.</th>								
									<th class="text-center">Project Title</th>
									<th class="text-center">Capex<br/>(Rs. in Lakhs)</th>
									<th class="text-center">Opex <br/>(Rs. in Lakhs)</th>
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
							<tr class="active">
								<td class="text-Left"><%=strArray[0]%></td>								
								<td class="text-left"><a href="../creation/viewCapexWizard.jsp?status=<%=strArray[6]%>&id=<%=strArray[0]%>"><%=strArray[1]%></a></td>
								<td class="text-right"><%=strArray[2]%></td>
								<td class="text-right"><%=strArray[3]%></td>
								<td class="text-left"><%=strArray[4]%></td>
								<td class="text-left"><%=strArray[5]%></td>
								<% 
                                    if("I".equals(strArray[6])){  
                                %>
								<td class="text-center"><button type="button" class="btn btn-success btn-xs" style="width:80px;">New</button></td>
                                <% } 
                                 if("R".equals(strArray[6])){   %>
                                 <td class="text-center"><button type="button" class="btn btn-danger btn-xs" style="width:80px;">Rejected</button></td>
                                <% } 
                                 if("A".equals(strArray[6])){   %>
                                 <td class="text-center"><button type="button" class="btn btn-primary btn-xs" style="width:80px;">Accepted</button></td>
                                <% } %>
							</tr>
							<%
                                   }
                            }else {
                            %>
                            <tr class="text-center"><td colspan="7">No Record Found</td></tr>	
                            <% } 
                            %>
							</tbody>
						</table>
			</div>
		</form>	
	</div>
	</div>			
	</div>
	<div class="col-xs-2"></div>
  </div>   
</div>
<footer class="footer ">
	<div class="container text-center">
		<p style="margin-bottom:2px; margin-left:80px;" class="ex ">Copyright @ 2016 Bennett, Coleman & Co. Ltd. All rights reserved. </p>
	</div>
</footer>
</body>
</html>
