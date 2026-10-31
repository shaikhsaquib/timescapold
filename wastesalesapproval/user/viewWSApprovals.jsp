<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,org.json.simple.JSONObject, java.io.*, org.json.simple.parser.JSONParser" %>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
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
	<style> 
.fixed-table-body {
  overflow-x: auto; 
  overflow-y: auto;
  height: auto;}
</style>
<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>		
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

		ArrayList userLogDetailsList		= new ArrayList();

		Hashtable userLogDetailsHash		= new Hashtable();

		ArrayList headerList	= new ArrayList();
		Hashtable detailsHash	= new Hashtable();
//		detailsHash.put("EMAILID", emailId);
       detailsHash.put("STATUS","L");
        detailsHash.put("DOCUMENTOID", "DOC1001','DOC1002','DOC1003','DOC1004");
		detailsHash.put("EMAILID", emailId);
		detailsHash.put("ORDER", "desc");
		headerList = docChangeLogController.search("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailsHash);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm");

		//SimpleDateFormat datOfAgreformat = new SimpleDateFormat("yyyy-MM-dd");
		//SimpleDateFormat datOfAgreformat = new SimpleDateFormat("dd-MM-yyyy"); 
		//SimpleDateFormat datOfAgreformat1 = new SimpleDateFormat("dd-MMM-yyyy");
     
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
									<th>Request No.</th>																	
									<th>Created By</th>
									<th>Created On</th>
									<th>Modified By</th>
									<th>Modified On</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
                            <%
                       
							for (int ii=0; ii<headerList.size(); ii++)
							{
								String strArr[] = (String[])headerList.get(ii);
								String strStatus = "";
								String createdBy = "";
								String createdOn = "";
								String modifiedBy = "";
								String modifiedOn = "";
								userLogDetailsList		= new ArrayList();
								userLogDetailsHash		= new Hashtable();
								userLogDetailsHash.put("REQUESTOID", strArr[1]);
								userLogDetailsHash.put("DOCUMENTOID", "DOC1001','DOC1002','DOC1003','DOC1004");
								userLogDetailsList = wasteSalesHeaderController.viewAll("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",userLogDetailsHash);

								for (int jj=0; jj<userLogDetailsList.size(); jj++)
								{
									String strArr1[] = (String[])userLogDetailsList.get(jj);

									createdBy	= strArr1[4];
									createdOn	= strArr1[5];
									modifiedBy	= strArr1[6];
									modifiedOn	= strArr1[7];

									try 
									{
										Date date = (Date) format.parseObject(strArr1[5]);
										Date date1 = (Date) format.parseObject(strArr1[7]);

										createdOn = format2.format(date);	
										modifiedOn = format2.format(date1);	
										 						 
									} catch (ParseException e) {
										
										e.printStackTrace();
									}

								}
								if(strArr[7].equals("L")) 
								{
									//strStatus = "Pending For Approvals";

								}  
                          %>
								<tr class="active">
                                    <td><a href="#" onclick="showApprovalForm('<%=strArr[1]%>','<%=strArr[0]%>','<%=strArr[7]%>')" class="boldunderline" ><%=strArr[1]%></a></td>								
                                    <!-- <td>-</td>
                                    <td>-</td> -->
                                    <td><%=createdBy%></td>
                                    <td><%=createdOn%></td>
                                    <td><%=modifiedBy%></td>
                                    <td><%=modifiedOn%></td> 
                                    <td><img src="<%=statusImg.get(strArr[7])%>" border="0"></td>
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