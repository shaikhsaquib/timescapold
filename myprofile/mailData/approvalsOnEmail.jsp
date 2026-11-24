

<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar" %>
<jsp:useBean id="tActiveDirectory" class="com.bccl.util.TActiveDirectory" />
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" scope="session"/>
<%@ page errorPage="../common/errorPage.jsp"%>
<%
	String getEmailId = "";
	
	Cookie[] theCookies = request.getCookies();
	
	if(theCookies != null) {
		for(Cookie tempCookie : theCookies) {
			if("email_Id".equals(tempCookie.getName())) {
				getEmailId = tempCookie.getValue();
			}
		}
	} 
	//out.println(getEmailId);
	session.setAttribute("setEmailId", getEmailId);
	Hashtable userDetails = new Hashtable();
	userDetails = (Hashtable) session.getAttribute("medicalimDataHash");
	//out.println(session.getAttribute("setEmailId"));
	String topupNewAmount = "";
	String preNewAmount = "";
	
	String emailId = (String) userDetails.get("emailId");
	String amount = (String) userDetails.get("amount");
	String premiumamt = (String) userDetails.get("premiumamt");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mediclaim Top Up</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap-4.0.0.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="../jscripts/login.js"></script>
	<script src="../jscripts/jquery.js"></script>
	<script src="../jscripts/jquery.min.js"></script>
	<script src="../jscripts/jquery-1.11.3.min.js"></script>
	<script src="../jscripts/common.js"></script>
	<script>
		$(document).ready(function(){
			
			//$("#txtEmailId1").attr("disabled",false);
			$("#divAuthMessage").hide();
			$("#divAuthTickSucc").hide();
			$("#divAuthTickFail").hide();
			
			var varUser = localStorage.getItem("currentUser");
			//alert(varUser);
   
<% 
	if(getEmailId.equals(emailId)){
	
%>
			//alert("ji");
			$("#trPassword1").hide();			
			$("#btnSubmit1").click(function(){
				//alert("am in if");
				if ($("#btnSubmit1").val()=="Submit")
				{
					submitOnConfirm();
				}else if ($("#btnSubmit1").val()=="Close")
				{
					window.close();
				}
			}); 
<%
	} else {
%>
			$("#trPassword1").show();
			$("#btnSubmit1").val("Submit");
			$("#btnSubmit1").click(function(){
			
				if ($("#btnSubmit1").val()=="Submit")
				{
					fnFormAction();

				}else if ($("#btnSubmit1").val()=="Close")
				{
					window.close();
				}
			}); 
<%		
	}
%>	    
		});
	</script>
  </head>
  <body> 

<%
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
	int currDay		= currday1;		
	String currMonth	= monthArr[currMonth1]  + "";
	String currYear     = thisDay.get(Calendar.YEAR)	+	"";
		//out.println("currDay--"+currDay);

	if (getEmailId != null && ! getEmailId.trim().equals("")){
		
		ArrayList UserIdForTOPUP = new ArrayList();
		UserIdForTOPUP = mediclaimController.getUserIdForTOPUP(getEmailId); 

		String createdby = ((String[])UserIdForTOPUP.get(0))[0];	
		String testYear = "2018";

		//out.println(testYear);
		//long timescapeUserOID = Long.parseLong(createdby+"");
		
		detailsHash.put("timescapeUserOID",(createdby));
		detailsHash.put("currYear",testYear);
		
		resultList = mediclaimController.viewTopupAmount(detailsHash); 

	}
	else{
		getEmailId = "";
	}

%>
	<input type="hidden" id="amount" name="amount" value="<%=amount %>">
	<input type="hidden" id="premiumamt" name="premiumamt" value="<%=premiumamt %>">
<!--      <img src="https://tsweb.timesgroup.com/timescape/images/1-topup.jpg" width="450" height="360" class="control-label align-self-center"/>
 -->
<style>
img {
    display: block;
    margin-left: auto;
    margin-right: auto;
}
</style>
</head>
<body>
<img src="https://tsweb.timesgroup.com/timescape/images/1-topup.jpg" alt="" style=width="450" height="293">


<!--   <table width="450" border="0">
    <tbody>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </tbody>
  </table> -->
<%
	if(resultList.size() == 0 ){

		if (((currMonth.equals("APR") ||  currMonth.equals("MAY") ||  currMonth.equals("JUN") ||  (currMonth.equals("JUL") && currDay <= 24)))){
		
	
		if( emailId != null || emailId != ""){
%>
	<div  class="text-center" >
	<label class="control-label align-self-center" id="tremailId1">For Rs. <%=amount%> - Premium Amount Rs. <%=premiumamt%> per annum</label>
	</div>
	<br>
  <div  class="text-center" id="tremailId1">
	<label class="control-label align-self-center" id="tremailId1">Email ID</label>
	<input type="text" style="font-size: 12pt; height: 30px; width:280px;" name="txtEmailId1" id="txtEmailId1" value="<%=getEmailId.trim().equals("") ? emailId : getEmailId%>">
		</div>
	  
	  <table width="450" border="0">
	    <tbody>
	      <tr>
	        <td>&nbsp;</td>
          </tr>
        </tbody>
  </table>
  <div  class="text-center" id="trPassword1">
	    <label class="control-label align-self-center" id="tremailId1">Password</label>
	    <input type="password" style="font-size: 12pt; height: 30px; width:280px; " name="txtPassword1" id="txtPassword1">&nbsp;&nbsp;<i id="divAuthTickSucc" class="fa fa-check-circle" style="font-size:30px;color:green"></i><i id="divAuthTickFail" class="fa fa-check-circle" style="font-size:30px;color:red"></i>
  </div>  
  <div width="500px" class="text-center" id="divAuthMessage"></div>
	  <table width="450" border="0">
	    <tbody>
	      <tr>
	        <td>&nbsp;</td>
          </tr>
        </tbody>
  </table>
	  <div class="text-center">
		  <input type="button" class="btn btn-primary btn-lg" name="btnSubmit1" id="btnSubmit1" value="Submit"/>
	  </div>
<%
	}
	}else {
%>
		<div  class="text-center">Valid Period is over to submit the Top Up Amount</div>  		
		<div class="text-center">
		  <input type="button"  class="btn btn-primary btn-lg" name="btnSubmit1" id="btnSubmit1" value="Close" />
		</div>
<%	}
}else {
	String[] topupAmount = (String[])resultList.get(0);	
	topupNewAmount = topupAmount[1];
	preNewAmount = topupAmount[2];	
%>
		<div class="text-center">
			<span align="justify" max-width="400px">You have already applied for Voluntary Top Up <br> insurance for the below Amount:</span><br></br>
			<span align="left">Topup Amount: Rs. <%=topupNewAmount %>/-</span><br>
			<span align="left">Premium Amount: Rs. <%=preNewAmount %>/-</span><br>
			<span align="left">Email ID : <%=getEmailId %></span>
		</div><br>
		<div class="text-center">
		  <input type="button" class="btn btn-primary btn-lg" name="btnSubmit1" id="btnSubmit1" value="Close" />
		</div>
<%	
}
%>
		<table width="450" border="0">
	      <tbody>
	        <tr>
	          <td>&nbsp;</td>
            </tr>
          </tbody>
        </table> 
<!-- <img src="https://tsweb.timesgroup.com/timescape/images/2-topup.jpg" width="450" height="110" align="center" alt=""/></div>
 -->
<style>
img {
    display: block;
    margin-left: auto;
    margin-right: auto;
}
</style>
</head>
<body>

<img src="https://tsweb.timesgroup.com/timescape/images/2-topup.jpg" alt="" style=width="450" height="110">

  </body>
</html>
