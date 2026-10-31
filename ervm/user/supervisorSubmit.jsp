<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable,java.util.HashMap, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>

<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>

<!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<title> ERVM </title>	
	 
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/ervm.css" rel="stylesheet"/>	
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script Language="JavaScript" src="../js/ervm.js"></script> 
     
     

	
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
	String reviseTargetDate = "";
	String superStatus = "";
	String superRemarks = "";
	String txnId ="";
	Hashtable superviserHash = new Hashtable();
	boolean superviserStatus = false;
	String size = null;

	size = (String)request.getParameter("size");
	int size1 = 0;
	ArrayList aList = new ArrayList();
	//out.println("size1:----------"+size1 );

		if(size != null){
			size1 = Integer.parseInt(size);
		}

	for(int i = 0;i < size1; i++){

		txnId = (String)request.getParameter("txnId"+i);
		superStatus = (String)request.getParameter("Status"+i);		
		superRemarks = (String)request.getParameter("supRemarks"+i);
		reviseTargetDate = (String)request.getParameter("reviseTargetDate"+i);
		//out.println(txnId);
		
		if(reviseTargetDate == null)
			reviseTargetDate = "";
		if(!"0".equals(superStatus)&& superRemarks != null){
			//out.println(txnId+" -> "+reviseTargetDate+";; ");
			String qList[] = {txnId,superRemarks,superStatus,reviseTargetDate};
			aList.add(qList);

		}
	}
		superviserHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
		superviserHash.put("DEPTNAME",deptName);
		superviserHash.put("SUPERVISER",aList);

		//out.println("aList==========="+aList);
				
	
				superviserStatus =  ERVMController.updateSupDetails(superviserHash);

				//out.println("superviserStatus:"+superviserStatus);


				String message = "";
				if(superviserStatus)
		{
				message = "<h5>Transaction has been completed successfully."
				+"<br> Click <a href=\"../user/supervisor.jsp\">here</a> to go back.</h5>";
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
	<!-- <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 " style="padding-top:20px;"> -->
		<%//@ include file="../includes/relatedLinks.jsp" %>
	<!-- </div> -->

	<%//@ include file="../includes/relatedLinks.jsp" %>
		
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

