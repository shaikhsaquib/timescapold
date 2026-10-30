<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable,java.util.HashMap, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>

<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="OtaController" class="com.bccl.ota.web.controllerbeans.OtaWebController"/>

<!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<title> OTA </title>	
	 
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/ota.css" rel="stylesheet"/>	
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script Language="JavaScript" src="../js/ota.js"></script> 
     
     
	<style>
		

	@media (min-width: 992px){
		.col-md-offset-2 {
			margin-left: 16.66666667% !important;
		}
	}
	</style>
</head>
	
	<script>
	/*$(document).ready(function() {
	$('.RelatedLinks ul li.RelLinks').hover(function() {
		$(this).find('.dropdownmenu').show();
	}, function(){
		$(this).find('.dropdownmenu').hide();
	});
	$(".tip-bottom").tooltip({
	placement :
	'bottom'
	});
	
	 $("#help").hide();

	 $(".autoSelect").select2({ width: '100%'  });

	});*/

	</script>
	<%
	String status = "";
	String myFile = "";
	String remarks = "";
	String reviseTargetDate = null;
	String txnId ="";
	String sizeHidden= "";
	String attachment= "";
	

	Hashtable subordinateHash = new Hashtable();
	boolean subordinateStatus = false;
	String size = null;
	 size = (String)request.getParameter("size");
	int size1 = 0;
	ArrayList aList = new ArrayList();
	Date date1 = null;
	
	SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
	

		if(size != null){
			size1 = Integer.parseInt(size);
		}

	for(int i = 0;i < size1; i++){

		txnId = (String)request.getParameter("txnId"+i);
		reviseTargetDate = (String)request.getParameter("reviseTargetDate"+i);
		status = (String)request.getParameter("Status"+i);		
		remarks = (String)request.getParameter("Remarks"+i);

		out.println(reviseTargetDate);

		
		String hiddFilesName1 = null;
		int sizeHidd = 0;
		sizeHidden = "";
		hiddFilesName1 = (String)request.getParameter("hiddDirectorySize"+txnId);

		if(hiddFilesName1 != null){
			sizeHidd = Integer.parseInt(hiddFilesName1);
		}

		for(int k =0;k< sizeHidd; k++){
			sizeHidden += (String) request.getParameter("hiddFilesName1"+txnId+k)+",";
		}
		if(sizeHidden.trim() != "" && sizeHidden.trim() != null && sizeHidden.length()>0){
			sizeHidden = sizeHidden.substring(0,sizeHidden.length()-1);
		}	
		if(sizeHidden == null || "".equals(sizeHidden)){
			//sizeHidden = (String)request.getParameter("fileName"+txnId);
			sizeHidden = (String)request.getParameter("fileName"+txnId)==null?"":(String)request.getParameter("fileName"+txnId);
		}
			/* if(reviseTargetDate != null && !"NI".equals(status) && remarks != null){
				//out.println("pranita------------------------------------------");
			String qList[] = {txnId,reviseTargetDate,remarks,sizeHidden,status};
			aList.add(qList);
			} */
			if(reviseTargetDate != null && remarks != null){
				String qList[] = {txnId,reviseTargetDate,remarks,sizeHidden,status};
				aList.add(qList);
			}
		//}

			
				
	}
				subordinateHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
				subordinateHash.put("DEPTNAME",deptName);
				subordinateHash.put("Subordinate",aList);

				subordinateStatus =  OtaController.updateSubDetails(subordinateHash);

				//out.println("subordinateStatus:"+subordinateStatus );
String message = "";

if(subordinateStatus){
				
		
				message = "<h5>Transaction has been completed successfully."
				+"<br> Click <a href=\"../user/subordinate.jsp\">here</a> to go back.</h5>";

}else
	 {

		 message = "<h5>Some error occured while processing request ."
				+"<br> Click <a href=\"javascript:history.back()\">here</a> to go back.</h5>";
	 }
%>

		
<body>
	<div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0;">
		<img src="../images/header.png" style="width: 100%;">
	</div>

	<div class="container">
		<div class="col-md-12" style="margin-top: 4%;">
			<div class="col-md-8 col-md-offset-2  well">
				<div class="col-md-12" style="background: #44bfe5; padding: 1% 2%; font-size: 1.2em; color: #fff;">
					<i class="fa fa-th"></i><strong>&nbsp;&nbsp;Submit Request</strong>
				</div>
		
				<div class="col-md-12" style="background: #fff;">
					
						<form class="" role="form" id="demo_form" name ="frmRequestSubmit" method="post">
							<div class="text-center" style="margin: 2% 0%;">
								<p><%=message%></p>
							</div>
						</form>
					
				</div>
			</div>
		</div>
	</div>

					

</body> 
<%
	 
%>
</html>

