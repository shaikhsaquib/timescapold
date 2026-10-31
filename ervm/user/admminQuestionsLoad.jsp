<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set,java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>

<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>

<!DOCTYPE html>
<html>
<head>
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.css" rel="stylesheet">
	<link href="../css/ervm.css" rel="stylesheet">
	<script src="../js/jquery.min.js">
	</script>
	<script src="../js/bootstrap.min.js">
	</script>
	<script language="JavaScript" src="../js/ervm.js">
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
			font-size: 1.1em;
			padding: 0.5%;
			/* vertical-align: top; */

			
		}
		.customborder2{
			
			font-size: 1.2em;
			margin: 0.3% 0%;
			text-align: left;
			/* vertical-align: top; */
			
		}
		.customborder3{
			border: 1px solid #c6c6c6;
			font-size: 1em;
			padding: 0.5%;
			
		}

		td{
			padding: 0% 0.5%;
		}
	</style>
	
</head>

		<div class="col-md-12 col-sm-12 col-xs-12 customborder2"><b>Detailed Report</b></div>
		 <div class="col-md-12 col-sm-12 col-xs-12 ">
			
			<!-- <div class="col-md-4 col-sm-3 col-xs-12 customborder" >Recommendation</div>
			<div class="col-md-1 col-sm-3 col-xs-12 customborder">Severity</div>
			<div class="col-md-2 col-sm-3 col-xs-12 customborder">Management Comments</div>
			<div class="col-md-2 col-sm-3 col-xs-12 customborder">User Remark</div>
			<div class="col-md-2 col-sm-3 col-xs-12 customborder">Supervisor Remark</div>
			<div class="col-md-1 col-sm-3 col-xs-12 customborder"> Status</div>
 -->
			<table width="100%" style="border: 1px solid #c6c6c6;" >
				<tr width="100%" class="customborder">
					<td width="15.33333333% " class="customborder">Number of Recommendations</td>
					<td width="8.33333333%" class="customborder">Severity</td>
					<td width="20.66666667%" class="customborder">Management Comments</td>
					<td width="20.66666667%" class="customborder">Subordinate Remarks</td>
					<td width="20.66666667%" class="customborder">Supervisor Remarks</td>
					<td width="8.33333333%" class="customborder">Status</td>
					<td width="6.67%" class="customborder">Year</td>
				</tr>
			</table> 
			
			
		</div>
<%
	
	Hashtable questionHash = new Hashtable();
	ArrayList reportQuestioList = new ArrayList();
	ArrayList reportNameList = new ArrayList();

	String deptCode = "";
	String area = "";
	String year = "";
	String deptCondition = "";
	String areaCondition = "";
	String yearCondition = "";
	String recommendation = "";
	String severety = "";
	String mangComments = "";
	String userStatus ="";
	String userId ="";
	String userRemark ="";
	String superRemark ="";
	String mychoice ="";
	
	deptCode = (String)request.getParameter("deptCode");
	area = (String)request.getParameter("area");
	year = (String)request.getParameter("year");
	userId = (String)request.getParameter("userId");
	mychoice = (String)request.getParameter("stat") == null?"":(String)request.getParameter("stat");
	System.out.println("mychoice:"+mychoice);
	deptCondition = (String)session.getAttribute("deptCondition");
	areaCondition = (String)session.getAttribute("areaCondition");
	yearCondition = (String)session.getAttribute("yearCondition");
		
	 if("NI".equals(mychoice) || "IP".equals(mychoice) || "I".equals(mychoice)|| "NMA".equals(mychoice)){
		questionHash.put("USERSTATUS",mychoice);
	 }
	 questionHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
	 questionHash.put("DEPTNAME",deptName);
	 questionHash.put("EMAILID",emailId);
	 questionHash.put("USERID",userId);	
	 questionHash.put("DEPTCODE",deptCode);
	 questionHash.put("AREA",area);
	 questionHash.put("YEAR",year);
	 questionHash.put("DEPTCONDITION",deptCondition);
	 questionHash.put("AREACONDITION",areaCondition);
	 questionHash.put("YEARCONDITION",yearCondition);
	 
	 reportQuestioList =  ERVMController.displayAdminReportQue(questionHash);	

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

			<br><br>
			
			<div class="col-md-12 col-sm-12 col-xs-12" >
				
				 <table width="100%" style="border: 1px solid #c6c6c6;" >
					<tr style="width:100%;height:100%">
					<!-- style="padding: 0% 0.5%;" -->
						<td width="15.33333333%" style="padding: 0% 0.5%;" class="customborder2">
						<textarea class="form-control" maxlength="100" rows="10"  style="resize: none;" readonly  ><%=recommendation%></textarea>
						</td>
						<td width="8.33333333%"  class="customborder1"> <%=severety%></td>
						<td align="center" width="20.66666667%" class="customborder1"> 						
						<textarea class="form-control" maxlength="100" rows="10"  style="resize: none;" readonly  ><%=mangComments%></textarea>
						</td>
						<%-- <td align="left" width="16.66666667%" class="customborder1"> <%=userRemark%></td>
						<td align="left" width="16.66666667%" class="customborder1"> <%=superRemark%></td> --%>
						<td width="20.66666667%" class="customborder1">
					<textarea class="form-control" maxlength="100" rows="10"  style="resize: none;" readonly ><%=userRemark%></textarea>
				</td>
				<td width="20.66666667%" class="customborder1">
					<textarea class="form-control"  maxlength="100" rows="10"  style="resize: none;" readonly  ><%=superRemark%></textarea>
				</td> 
				<%-- <td width="16.66666667%" style="padding: 0% 0.5%;" class="customborder1"><%=userRemark%></td>
				<td width="16.66666667%" style="padding: 0% 0.5%;" class="customborder1"><%=superRemark%></td> --%>
						<!-- <td align="center" width="16.66666667%" class="customborder1"> <%=userRemark%></td>
						<td align="center" width="16.66666667%" class="customborder1"> <%=superRemark%></td> -->
						<td align="center" width="8.33333333%" class="customborder1"> <%=statusDescription%></td>
						<td align="center" width="6.67%" class="customborder1"> <%=year%></td>
					</tr>
				</table>
			</div>
<%
	 }%>
	 
	 <script>
function onScrolling() {
    var elmnt = document.getElementById("myDIV");
    var content = document.getElementById("cont");
    var x = elmnt.scrollLeft;
    var y = elmnt.scrollTop;
    var z = content.getBoundingClientRect().top;
    var w = elmnt.getBoundingClientRect().top;
    document.getElementById ("demo").innerHTML = "Horizontally: " + x + "px<br>Vertically: " + y + "px" + z+"  "+w;
    if(z<w){
    //alert("hi");
    alert(document.getElementById("abc") !== null);
    	elmnt.classList.add(".divv");
        content.style.position = "absolute";
        content.style.top = w+"px";
		//alert(w+"px");
         
    }else{
    	content.style.position = "relative";
        content.style.top = "0px";
    }
}
</script>