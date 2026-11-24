<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Enumeration,java.util.Calendar, java.util.ArrayList" %>
<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" scope="session"/>

<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
        <link href="../style/style.css" rel="stylesheet" type="text/css" />
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
		
        <script Language="JavaScript" src="../jscripts/jquery-1.3.2.min.js"></script>
        <script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript">

		</script>
		<script Language="JavaScript" src="../jscripts/bcclTopupAmt.js"></script>
<script>

window.onunload = function(){
  window.opener.location.reload();
};

</script>
<%@ include file="../includes/empHeader.jsp" %>

<%
	Hashtable dataHash = new Hashtable();
	ArrayList sendData = new ArrayList();
	boolean flag = false;
	String topupAmt = (String)request.getParameter("addedAmt");
	String paymentOpt = (String)request.getParameter("paymentOpt");
	if((companyCode.equals("1000") && (!(deptName.equals("1296")|| deptName.equals("1297")|| deptName.equals("1298")|| deptName.equals("1299")|| deptName.equals("1300")|| deptName.equals("1498")|| deptName.equals("1499")|| deptName.equals("1500")|| deptName.equals("1501")|| deptName.equals("1559")|| deptName.equals("1560")|| deptName.equals("1581")|| deptName.equals("1582")|| deptName.equals("1784")|| deptName.equals("1785")|| deptName.equals("1786")|| deptName.equals("1787")|| deptName.equals("1859"))))){
		dataHash.put("PAYMENTOPT",paymentOpt);
	}else{
		dataHash.put("PAYMENTOPT","1");
	}
//out.println("paymentOpt--"+paymentOpt);

//out.println("topupAmt--"+topupAmt);
//out.println("deptName--"+deptName);
//out.println("companyCode--"+companyCode);

String currYear1 = "";

/*if(companyCode.equals("1000")){
	currYear1 = (String)session.getAttribute("faYear");
}else if(companyCode.equals("1037")){
	currYear1 = (String)session.getAttribute("faYearBihe");
}else if(companyCode.equals("1004")){
	currYear1 = (String)session.getAttribute("faYear");
}*/

currYear1 = (String)session.getAttribute("faYear");



int topupAmt1 = 0;
int extingAmt = 500000;
String preAmt = "";
String finalamt = "";
long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");


//out.println("topuoAmt--"+timescapeUserOID);
if(topupAmt.equals("1"))
{
 finalamt = "100000"; 
 preAmt = "11000";
topupAmt1 = Integer.parseInt(finalamt);
dataHash.put("FINALAMT",finalamt);
dataHash.put("PREAMT",preAmt);
}
else if (topupAmt.equals("2")){
	 finalamt = "200000";
	 //preAmt = "4034";
	// preAmt = "3026";
	// preAmt = "2017";---- Commented by Shreedhar for New change on 04-07-2017
	 preAmt = "4930";
	 topupAmt1 = Integer.parseInt(finalamt);
	dataHash.put("FINALAMT",finalamt);
	dataHash.put("PREAMT",preAmt);
}
else if (topupAmt.equals("3")){
	 finalamt = "300000";
	 //preAmt = "4549";
	// preAmt = "3412";
	// preAmt = "2275";---- Commented by Shreedhar for New change on 04-07-2017
	 preAmt = "5773";
	 topupAmt1 = Integer.parseInt(finalamt);
	dataHash.put("FINALAMT",finalamt);
	dataHash.put("PREAMT",preAmt);
}
else if (topupAmt.equals("4")){
	 finalamt = "400000";
	 //preAmt = "5475";
	// preAmt = "4106";
	// preAmt = "2738";---- Commented by Shreedhar for New change on 04-07-2017
	if (deptName.equals("1296")|| deptName.equals("1297")|| deptName.equals("1298")|| deptName.equals("1299")|| deptName.equals("1300")|| deptName.equals("1498")|| deptName.equals("1499")|| deptName.equals("1500")|| deptName.equals("1501")|| deptName.equals("1559")|| deptName.equals("1560")|| deptName.equals("1581")|| deptName.equals("1582")|| deptName.equals("1784")|| deptName.equals("1785")|| deptName.equals("1786")|| deptName.equals("1787")|| deptName.equals("1859") || companyCode.equals("1005")|| companyCode.equals("1006"))
	{
	 preAmt = "28935";
	}else {
		preAmt = "7408";
	}
	 topupAmt1 = Integer.parseInt(finalamt);
	dataHash.put("FINALAMT",finalamt);
	dataHash.put("PREAMT",preAmt);
}
else if (topupAmt.equals("5")){
	 finalamt = "500000";
	 //preAmt = "6549";
	// preAmt = "4912";
	// preAmt = "3275";---- Commented by Shreedhar for New change on 04-07-2017
	if (deptName.equals("1296")|| deptName.equals("1297")|| deptName.equals("1298")|| deptName.equals("1299")|| deptName.equals("1300")|| deptName.equals("1498")|| deptName.equals("1499")|| deptName.equals("1500")|| deptName.equals("1501")|| deptName.equals("1559")|| deptName.equals("1560")|| deptName.equals("1581")|| deptName.equals("1582")|| deptName.equals("1784")|| deptName.equals("1785")|| deptName.equals("1786")|| deptName.equals("1787")|| deptName.equals("1859") || companyCode.equals("1005")|| companyCode.equals("1006"))
	{
	 preAmt = "32816";
	}else {
		preAmt = "9597";
	}
	 
	 topupAmt1 = Integer.parseInt(finalamt);
	dataHash.put("FINALAMT",finalamt);
	dataHash.put("PREAMT",preAmt);
}
else if (topupAmt.equals("6")){
	 finalamt = "600000";
	 //preAmt = "6549";
	// preAmt = "4912";
	// preAmt = "3275";---- Commented by Shreedhar for New change on 04-07-2017
	 
	 if (deptName.equals("1296")|| deptName.equals("1297")|| deptName.equals("1298")|| deptName.equals("1299")|| deptName.equals("1300")|| deptName.equals("1498")|| deptName.equals("1499")|| deptName.equals("1500")|| deptName.equals("1501")|| deptName.equals("1559")|| deptName.equals("1560")|| deptName.equals("1581")|| deptName.equals("1582")|| deptName.equals("1784")|| deptName.equals("1785")|| deptName.equals("1786")|| deptName.equals("1787")|| deptName.equals("1859") || companyCode.equals("1005")|| companyCode.equals("1006"))
	{
	 preAmt = "36007";
	}else {
		preAmt = "12484";
	}
	 topupAmt1 = Integer.parseInt(finalamt);
	dataHash.put("FINALAMT",finalamt);
	dataHash.put("PREAMT",preAmt);
}
else if (topupAmt.equals("8")){
	 finalamt = "800000";
	 //preAmt = "6549";
	// preAmt = "4912";
	// preAmt = "3275";---- Commented by Shreedhar for New change on 04-07-2017
	 preAmt = "18928";
	 topupAmt1 = Integer.parseInt(finalamt);
	dataHash.put("FINALAMT",finalamt);
	dataHash.put("PREAMT",preAmt);
}else if (topupAmt.equals("10")){
	 finalamt = "1000000";
	 //preAmt = "6549";
	// preAmt = "4912";
	// preAmt = "3275";---- Commented by Shreedhar for New change on 04-07-2017
	 preAmt = "25347";
	 topupAmt1 = Integer.parseInt(finalamt);
	dataHash.put("FINALAMT",finalamt);
	dataHash.put("PREAMT",preAmt);
}else if(topupAmt.equals("15")){
	 finalamt = "1500000";
	 preAmt = "48468";
	 topupAmt1 = Integer.parseInt(finalamt);
	dataHash.put("FINALAMT",finalamt);
	dataHash.put("PREAMT",preAmt);
}

//String finalamt = "500000";
topupAmt1 = Integer.parseInt(finalamt);
// preAmt = "15000";
int totalcover = 0;
String test = "0";
totalcover = (topupAmt1 + extingAmt);
//out.println("totalcover--"+totalcover);
String finaltotalcover = Integer.toString(totalcover);
dataHash.put("FINALTOTALCOVER",finaltotalcover);

dataHash.put("CURRYEAR1",currYear1);
dataHash.put("TIMESCAPEUSEROID",timescapeUserOID+"");
//dataHash.put("FINALAMT",finalamt);
//out.println("dataHash--"+dataHash);

flag = mediclaimController.createAmtRecord(dataHash); 
//flag = true;
//out.println("flag==="+flag);

if(flag == true)
{

	test = "1";	
	////response.sendRedirect("viewNomineeDetails.jsp");

%>
<html>
<head>
<title>Top Up Insurance Amount Alert</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
</head>
	<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
			<tr>
				<td valign = "top">
					<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
						<tr>
							<td><img src = "../images/spacer.gif" height = "50"></td>
						</tr>
						<tr>
							<td colspan="100%" align="center" class="normal">&nbsp;Your request for Top Up Insurance Amount has been submitted successfully!<br>Click <a href="javascript:window.close();">here</a> to return to home page.</td>
						</tr>
						<tr>
							<td><img src = "../images/spacer.gif" height = "50"></td>
						</tr>
						</table>
				</td>
			</tr>
		</table>

<%
	//response.setHeader("Refresh", "10; URL=viewNomineeDetails.jsp");


	
}

%> 
<input type = "hidden" name = "test" id = "test" value ="<%=test%>" >
</body>
</html>

