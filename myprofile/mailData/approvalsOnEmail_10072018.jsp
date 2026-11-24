<%@page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar" %>

<jsp:useBean id="tActiveDirectory" class="com.bccl.util.TActiveDirectory" />
<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" scope="session"/>

<%
	String getEmailId = "Not";
	
	Cookie[] theCookies = request.getCookies();
	
	if(theCookies != null) {
		for(Cookie tempCookie : theCookies) {
			if("email_Id".equals(tempCookie.getName())) {
				getEmailId = tempCookie.getValue();
			}
		}
	} 

		
	//out.println(varUser);
%>

<%
	Hashtable userDetails = new Hashtable();
	userDetails = (Hashtable) session.getAttribute("approverDetailsHash");
	
	//String emailId = (String) userDetails.get("emailId");
	//String requestId = (String) userDetails.get("requestId");
	//String status = (String) userDetails.get("status");
	//String showComments = (String) userDetails.get("showComments");

	String emailId = (String) userDetails.get("emailId");
	String amount = (String) userDetails.get("amount");
	//String createdby = (String) userDetails.get("createdby");
	String premiumamt = (String) userDetails.get("premiumamt");


	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
	ArrayList resultList  = new ArrayList();
	Hashtable detailsHash = new Hashtable();
	GregorianCalendar thisDay = new GregorianCalendar( );
	int currentMonth1		= thisDay.get(Calendar.MONTH);
	String currentMonth	= monthArr[currentMonth1]  + "";	
	String faYear = thisDay.get(Calendar.YEAR) + "";		
	String nextYear		=	thisDay.get(Calendar.YEAR) + 1 + "";
	int currday1		= thisDay.get(Calendar.DAY_OF_MONTH);
	int currMonth1		= thisDay.get(Calendar.MONTH);
	String currDay		= currday1 + "";		
	String currMonth	= monthArr[currMonth1]  + "";
	String currYear     = thisDay.get(Calendar.YEAR)	+	"";
		//out.println("currYear--"+currMonth);

		//ArrayList UserIdForTOPUP = new ArrayList();
		//UserIdForTOPUP = mediclaimController.getUserIdForTOPUP(emailId); 

		//String[] idNew = (String[])UserIdForTOPUP.get(0);	
		//String createdby = idNew[0];
 
	

	//if(resultList.size() == 0 ){

		if (((currMonth.equals("APR") ||  currMonth.equals("MAY") ||  currMonth.equals("JUN") ||  currMonth.equals("JUL")))){
		
	
	if( emailId != null || emailId != ""){
%>

		<!DOCTYPE html>
		<head>
			<link rel="stylesheet" href="../style/global.css">
			<script src="../jscripts/login.js"></script>
			<script src="../jscripts/jquery.js"></script>
			<script src="../jscripts/common.js"></script>
			<script>
				$(document).ready(function(){
					$("#txtEmailId").attr("disabled",false);
				    $("#divAuthMessage").hide();

				    var varUser = localStorage.getItem("currentUser");

					//alert(varUser);
   
					<% 
						if(getEmailId.equals(emailId)){
					%>
							$("#trPassword").hide();
							$("#tramount").show();
							$("#trpremiumamt").show();
							$("#btnSubmit").val("Submit");
							$("#btnReset").show();
					<%
						} else {
					%>
							$("#trPassword").show();
							$("#tramount").hide();
							$("#trpremiumamt").hide();
							$("#btnSubmit").val("Validate");
							$("#btnReset").show();
					<%		
						}
					%>	    
				});
			</script>
		</head>
		<body>
			<form method="post" name="frmApprovals">
				<table align="center" style="text-align:center;" width="100%" cellspacing="5" cellpadding="2">
					<tr>
						<td colspan="2" align="center" valign="middle" ><img src="../images/mediclaim_part1.jpg" /></td>
					</tr>
					<tr>
						<td colspan="2" >&nbsp;</td>
					</tr>			
					<tr>
						<td width="40%" style="text-align:right;" class="bold">Email Id:</td>
						<td style="text-align:left;"><input class="normal" type="text" name="txtEmailId" id="txtEmailId" value="" size="39" ></td>
					</tr>
					<tr id="trPassword">
						<td style="text-align:right;" valign="top" class="bold">Password:</td>
						<td style="text-align:left;">
							<input type="password" name="txtPassword" id="txtPassword" class="normal" autocomplete="off" size="39" >
							<br><span id="divAuthMessage"></span>							
						</td>
						
					</tr>
					<tr id="tramount">
						<!-- <td width="40%" style="text-align:right;" class="bold">Email Id:</td>
						<td style="text-align:left;" class="normal">
							<td style="text-align:left;"><input class="normal" type="text" name="txAmount" id="txAmount" value="<%=amount %>" size="39" disabled></td> -->
							<td width="40%" style="text-align:right;" class="bold">Topup Amount:</td>
						<td style="text-align:left;"><input class="normal" type="text" name="txAmount" id="txAmount" value="<%=amount %>" size="39" disabled></td>
					</tr>
					<tr id="trpremiumamt">
						<!-- <td width="40%" style="text-align:right;" class="bold">Email Id:</td>
						<td style="text-align:left;" class="normal">
							<td style="text-align:left;"><input class="normal" type="text" name="txpremiumamt" id="txpremiumamt" value="<%=premiumamt%>" size="39" disabled></td> -->
							<td width="40%" style="text-align:right;" class="bold">Premium Amount:</td>
						<td style="text-align:left;"><input class="normal" type="text" name="txpremiumamt" id="txpremiumamt" value="<%=premiumamt %>" size="39" disabled></td>
					</tr>
					<tr>
						<td colspan="2" align="center" valign="middle" >
							<input type="button" name="btnSubmit" id="btnSubmit" value="Validate" onClick="javascript:fnFormAction()">
							<input type="reset" name="btnReset" id="btnReset" value="Reset" onClick="javascript:fnFormReset()">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" valign="middle" ><img src="../images/mediclaim_part2.jpg" /></td>
					</tr>
				</table>
			
			</form>
		</body>
		</html>
<%
	}
	}else {
		%>
					<tr>
						<td colspan="2" >&nbsp;</td>
					</tr>			
					<tr>
						<td width="40%" align="center" valign="middle" class="normal">Valid Period is over to Submit the Top Up Amount!! <br /><br /><a href="javascript:window.top.close();">Close</a></td>
					</tr>
<%	}%>