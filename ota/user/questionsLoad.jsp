<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set,java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>

<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="OtaController" class="com.bccl.ota.web.controllerbeans.OtaWebController"/>

<!DOCTYPE html>
<html>
<head>
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.css" rel="stylesheet">
	<link href="../css/ota.css" rel="stylesheet">
	<script src="../js/jquery.min.js">
	</script>
	<script src="../js/bootstrap.min.js">
	</script>
	<script language="JavaScript" src="../js/ota.js">
	</script>
	<script language="JavaScript" src="../js/util.js">
	</script>
	<script language="JavaScript" src="../js/common.js">
	</script>
	<title>Audit Recommendations | Supervisor</title>
	<style>
	       label{
	       color: #2F6C87;
	       font-size: 12px;
	   }
	   
	   body{
	       font-size: 12px !important;
	   }

	   a{
	       text-decoration: none;
	       color: #2F6C87;
	       cursor: pointer;
	   }
	   
	   @media only screen and (max-width: 600px){
	       .mob_pad{
	           padding: 0 !important;
	       }
	   }   
	   @media only screen and (min-width: 601px){
	       .mob_pad{
	           padding-left: 0 !important;
	       }
	   }   

		.customborder{
			border: 1px solid #c6c6c6;
			font-size: 1.1	em;
			font-weight: bold;
			padding: 0.5%;
			text-align: center;
			background-color: rgba(0, 135, 167, 0.11);
		}

		.customborder1{
			border: 1px solid #c6c6c6;
			font-size: 1em;
			padding: 0.5%;
			text-align: center;
		}
		.customborder2{
			
			font-size: 1.2em;
			margin: 0.3% 0%;
			text-align: left;
		}
		.customborder3{
			border: 1px solid #c6c6c6;
			font-size: 1em;
			padding: 0.5%;
			
		}
		td{
			padding: 0% 0.5%;
		}
		.report {
		  width: 100%;
		  border-spacing: 0;
		  border-collapse: collapse;
		}
		.report thead tr th {
		  background: #e3f1f5;
		  /*background : rgba(0, 157, 194, 0.36);*/
		}
		.report tr td,.report tr th {
		  padding: 6px 8px;
		  border: 1px solid #ddd;
		  font-size: 14px;
		}
	</style>
	
</head>

		<div class="col-md-12 col-sm-12 col-xs-12 customborder2"><b>Detail Report</b></div>


		<table class="report">
		<thead>
				<tr>
					<th >Total Recommendations</th>
					<th>Severity</th>
					<th >Management Comments</th>
					<th>Subordinate Remarks</th>
					<th>Supervisor Remarks</th>
					<th>Status</th>
					<th>Year</th>
				</tr>
			</thead>
			
<%
	
	Hashtable questionHash = new Hashtable();
	ArrayList reportQuestioList = new ArrayList();
	ArrayList reportNameList = new ArrayList();

	String area = "";
	String recommendation = "";
	String severety = "";
	String mangComments = "";
	String userStatus ="";
	String userId ="";
	String userRemark ="";
	String superRemark ="";
	String mychoice ="";
	String year = "";
	
	 userId = (String)request.getParameter("userId");
	 mychoice = (String)request.getParameter("stat") == null?"":(String)request.getParameter("stat");
		System.out.println("mychoice:"+mychoice);
	 if("NI".equals(mychoice) || "IP".equals(mychoice) || "I".equals(mychoice) || "NMA".equals(mychoice)){
		questionHash.put("USERSTATUS",mychoice);
	 }
	 questionHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
	 questionHash.put("DEPTNAME",deptName);
	 questionHash.put("EMAILID",emailId);
	 questionHash.put("USERID",userId);	
	 
	 reportQuestioList =  OtaController.displayReportQue(questionHash);	

	 for(int i=0 ; i<reportQuestioList.size();i++){

						String [] arr = (String[])reportQuestioList.get(i);	
						
						
						recommendation="";
						userStatus= "";
						severety="";
						mangComments="";
						userRemark="";
						superRemark="";
						
						recommendation = arr[2];
						severety = arr[4];
						mangComments = arr[7];
						userRemark = arr[12];
						superRemark = arr[13];
						userStatus = arr[15];
						year = arr[16];
						
						String statusDescription = "";
						//out.println("userRemark"+userRemark);
						if((userRemark == null || "".equals(userRemark))){
							userRemark="-";
						}
						if((superRemark == null || "".equals(superRemark))){
							superRemark="-";
						}
						if("I".equals(userStatus)){
							statusDescription = "Implemented";
						}else if("IP".equals(userStatus)){
							statusDescription = "In Progress";
						}else if("NI".equals(userStatus)){
							statusDescription = "Not Implemented";
						}else if("NMA".equals(userStatus)){
							statusDescription = "No More Applicatble";
						}
	
%>

			
			
			
			<tbody>
					<tr>
						<td width="15%"> 
						<textarea class="form-control"  maxlength="1000" rows="10" style="height:100%;resize: none;max-width:300px;max-height:100%;" readonly ><%=recommendation%></textarea>
						</td>
						<td> <%=severety%></td>
						<td width="20%"> 
						<textarea class="form-control"  maxlength="1000" rows="10"  style="resize: none;max-width:300px;max-height:100%;" readonly  ><%=mangComments%></textarea>
						</td>
						<td>
							<textarea class="form-control"  maxlength="1000" rows="10" style="height:100%;resize: none;max-width:300px;max-height:100%;" readonly ><%=userRemark%></textarea>
						</td>
						<td>
							<textarea class="form-control"  maxlength="1000" rows="10"  style="resize: none;max-width:300px;max-height:100%;" readonly  ><%=superRemark%></textarea>
						</td>
						<!-- <td width="16.66666667%" class="customborder1"> <//%=userRemark%></td>
						<td width="16.66666667%" class="customborder1"> <//%=superRemark%></td> -->
						<td> <%=statusDescription%></td>
						<td> <%=year%></td>
					</tr>
				</tbody>
				
<%
	 }%></table>