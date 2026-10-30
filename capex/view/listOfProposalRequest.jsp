<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable,java.util.HashMap,java.util.Map, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
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
	 
}
	</style>
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../jscript/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../jscript/select2.min.js"></script>	
	<script src="../jscript/bootstrap-maxlength.min.js"></script>
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
/*
Hashtable ht = new Hashtable();
ArrayList arrList = new ArrayList();
String headerData[] = null;
ht.put("DOCUMENTOID", "DOC1005");
ht.put("EMAILID",emailId);
ht.put("STATUS","L','CA','CR");
ArrayList searchList =  capexHeaderController.searchRequest(ht);
int searchSize = searchList.size();
//out.println(" searchSize :"+searchSize);
if (searchSize> 0) {
        for (int eee = 0; eee < searchSize; eee++) {
            headerData = (String[]) searchList.get(eee);      
            String requestNumber = headerData[1];
            String strData = headerData[4];
            String createdBy = headerData[8];
            String status = headerData[12];  
		//	out.println(" strData " +strData);
			JSONObject jObject  = new JSONObject(strData);			
			String projectTitle = (String)jObject.get("Project Title");
			projectTitle = projectTitle.replaceAll(";", ",");	
			String capexAmt = (String)jObject.get("Proposal Amount");				
			String opexAmt =  (String)jObject.get("Opex Amount");
            String projectCategory =  (String)jObject.get("Project Category");
            String showData [] = { requestNumber,projectTitle,capexAmt,opexAmt,projectCategory,createdBy,status};
            arrList.add(showData);        
        }
    }
	
*/
	String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal Date", "Proposal Amount", "Opex Amount","Location","Function","Project Manager","Project Category" ,"Financial Year","Budget Amount","Project Start Date","Project End Date", "Reason If Unbudgeted","Project Closed Out Report","Rationale","Project Description","Particulars","Estimated Cost","Total","Asset Disposal","Savings Envisaged","Payback Period","Project Sponsor","Project Coordinator","compAttachment","attachmentFolderName" ,"Opex Particulars", "Opex Estimated Cost","Total Opex"};
	
	Hashtable ht = new Hashtable();
	ArrayList arrList = new ArrayList();
	String headerData[] = null;
	ht.put("HEADERSECTION1", headerSection);
	ht.put("DOCUMENTOID", "DOC1005");
	ht.put("HEADER", emailId);
	ht.put("STATUS","L','A','R");
	//ht.put("SEARCH", "Project Coordinator");
		
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
			//	out.println(" createdOn " +createdOn);
            String status = headerData[40];  
		//	out.println(" strData " +strData);
		
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
			try {
			Date date = (Date) format.parseObject(createdOn);
			//out.println(" date " +format2.format(date));
			createdOn = format2.format(date);
			//System.out.println(date);
			//System.out.println("date : "+);
			} catch (ParseException e) { 
			e.printStackTrace();
			}
		
		
            String showData [] = { requestNumber,projectTitle,capexAmt,opexAmt,projectCategory,createdOn,status};
            arrList.add(showData);        
			
        }
    }
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
%>
<body  > 
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
								<tr class="active" >						
									<!--th class="text-center">ID.</th-->								
									<th class="text-center">Project Title</th>
									<th class="text-center">Capex<br/>(Rs. in Lakhs)</th>
									<th class="text-center">Opex <br/>(Rs. in Lakhs)</th>
									<th class="text-center">Project Category</th>
									<!--th class="text-center">Submitted on</th-->
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
								<td class="text-center"><a href="editProposalform.jsp?id=<%=strArray[0]%>"><%=strArray[1]%></a></td>
								<td class="text-center"><%=strArray[2]%></td>
								<td class="text-center"><%=strArray[3]%></td>
								<td class="text-center"><%=strArray[4]%></td>
								<!--td><%=strArray[5]%></td-->
                                <% 
                                    if("L".equals(strArray[6])){  
                                %>
								<td class="text-left"><b>New</b></td>
                                <% } else { %>
                                 <td class="text-left">Approved</td>
                                <% } %>
							</tr>
                            <%
                                   }
                            }else {
                            %>
                            <tr class="active"><td colspan="6">No Record found for given criteria</td></tr>	
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
