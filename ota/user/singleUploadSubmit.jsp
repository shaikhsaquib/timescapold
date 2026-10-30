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
	 <link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
	<link href="../css/ota.css" rel="stylesheet"/>	
	<script src="../bootstrap-3.3.2-dist/js/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script Language="JavaScript" src="../js/ota.js"></script> 
	
	<%
	String srNo = "";
	String area = "";
	String subArea = "";
	String recommendation = "";
	String severety = "";
	String mangComments = "";
	String userResp = "";
	String superResp = "";
	String targetDate = "";
	String reviseDate = "";
	String year = "";
	String dept = "";
	Hashtable singleHash = new Hashtable();
	boolean singleStatus = false;
	String message = "";
	int counter = 0;
	ArrayList aList = new ArrayList();
	

	area = (String)request.getParameter("area");
	//out.println("area"+area);
	recommendation = (String)request.getParameter("recommendation");
	severety = (String)request.getParameter("severety");
	mangComments = (String)request.getParameter("mangComments");
	userResp = (String)request.getParameter("userResp");
	superResp = (String)request.getParameter("superResp");
	targetDate = (String)request.getParameter("targetDate");
	year = (String)request.getParameter("year");
	dept = (String)request.getParameter("dept");
	

	/* if("<script>".contains(area)|| "&lt".contains(area) || "&gt".contains(area) || "&quot".contains(area) || "&apos".contains(area) || "&amp".contains(area) || "</script>".contains(area) || "<iframe>".contains(area) || "</iframe>".contains(area) || "<script>".contains(recommendation)|| "&lt".contains(recommendation) || "&gt".contains(recommendation) || "&quot".contains(recommendation) || "&apos".contains(recommendation) || "&amp".contains(recommendation) || "</script>".contains(recommendation) || "<iframe>".contains(recommendation) || "</iframe>".contains(recommendation) || "<script>".contains(mangComments)|| "&lt".contains(mangComments) || "&gt".contains(mangComments) || "&quot".contains(mangComments) || "&apos".contains(mangComments) || "&amp".contains(mangComments) || "</script>".contains(mangComments) || "<iframe>".contains(mangComments) || "</iframe>".contains(mangComments)|| "<script>".contains(severety)|| "&lt".contains(severety) || "&gt".contains(severety) || "&quot".contains(severety) || "&apos".contains(severety) || "&amp".contains(severety) || "</script>".contains(severety) || "<iframe>".contains(severety) || "</iframe>".contains(severety)|| "<script>".contains(userResp)|| "&lt".contains(userResp) || "&gt".contains(userResp) || "&quot".contains(userResp) || "&apos".contains(userResp) || "&amp".contains(userResp) || "</script>".contains(userResp) || "<iframe>".contains(userResp) || "</iframe>".contains(userResp)|| "<script>".contains(superResp)|| "&lt".contains(superResp) || "&gt".contains(superResp) || "&quot".contains(superResp) || "&apos".contains(superResp) || "&amp".contains(superResp) || "</script>".contains(superResp) || "<iframe>".contains(superResp) || "</iframe>".contains(superResp))
	{
	counter++;
	}else{

		String qList [] = {area,recommendation,mangComments,severety,userResp,superResp,targetDate,year};
		aList.add(qList);

	} */	
	
	String qList [] = {area,recommendation,mangComments,severety,userResp,superResp,targetDate,year,dept};
	aList.add(qList);

		if(counter > 0){

			message = "<h5>Some error occured while processing request .some special character."
			+"<br> Click <a href=\"javascript:history.back()\">here</a> to view the Request.</h5>";
			}else{
				
				singleHash.put("createdByEmailId",emailId);
				
				singleHash.put("Single",aList);
				singleHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
				singleStatus =  OtaController.bulkUpload(singleHash);

		if(singleStatus){							
			message = "<h5>Recommendation Uploaded Successfully"
			+"<br> Click <a href=\"../user/Single_Upload_Form.jsp;\">here</a> to create the Request.</h5>";
			}else{
				message = "<h5>Some error occured while processing request ."
				+"<br> Click <a href=\"javascript:history.back();\">here</a> to create the Request.</h5>";
		}
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

