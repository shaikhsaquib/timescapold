<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@page import="com.bccl.workflow.web.util.HtmlUtil"%>
<script Language="JavaScript" src="../jscripts/bcclViewNomineeDetails.js"></script>
<script Language="JavaScript" src="../jscripts/bcclTopupAmt.js"></script>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setDateHeader("Expires", 0); // Proxies.
%>

<%
	int lastYear = 0;
	int currYear = 0;
	int selYear = 0;
	int preYear = 0;
	int currMonth = 0;
	
	String exstingAmt = "500000";
	GregorianCalendar today = new GregorianCalendar();	
	currYear = today.get(Calendar.YEAR) ;
	currMonth = today.get(Calendar.MONTH) ;

	String currYear1     = today.get(Calendar.YEAR)	+	"";
	//out.println("currYear"+currMonth);
	//out.println("currYear"+currYear);
	//if((today.get(Calendar.MONTH))==0 || (today.get(Calendar.MONTH))==1 || (today.get(Calendar.MONTH))==2){
	if(currMonth==0 || currMonth==1 || currMonth==2){
		lastYear = currYear - 1;	
	}
	else{
		lastYear = currYear;	
	}

	preYear = lastYear - 1;

	//out.println("JJ"+deptName);

%>

<!-- <form name="frmBcclAmount" method="post" action=""> -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Top Up Insurance Scheme</title>
<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
        <link href="../style/style.css" rel="stylesheet" type="text/css" />
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
<body>
<form name  = "frmTopupAmt" method = "post">

 <!-- <table border = "0" cellspacing="2" cellpadding="0" width = "100%">
<tr>
			<td align="right" class="small">
			View History - For Year <select id="year" name="year" class="small" >
				<%= HtmlUtil.getYearList(preYear,lastYear, selYear,"desc") %>
			</select>	
			<td    ><input name="go" type="button" class="small" id="go" value="Go" onclick = "javascript:go11();" /></td>
			
			<!-- &nbsp;<a href="javascript:go1( )"><img src="../images/grey_arrow.gif" border="0" align="absmiddle"></a>	 -->
<!-- </tr> 
</table>  -->
	<br/>
	<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
		<!-- <tr height = "20">
			<td class="normal" align = "left" width="40%" height = "10" >&nbsp; Original Insured Amount (INR):</td>
			<td class="normal" align = "left" width="60%">5 lacs</td>
		</tr> -->
		<tr>
			<td class="normal" align = "left" width="40%" height="30px">&nbsp; Top-Up Insured Amount (INR):</td>
			<!-- <td class="normal" align = "left" width="60%">5 lacs</td> -->
<%
	if (!(deptName.equals("1296")|| deptName.equals("1297")|| deptName.equals("1298")|| deptName.equals("1299")|| deptName.equals("1300")|| deptName.equals("1498")|| deptName.equals("1499")|| deptName.equals("1500")|| deptName.equals("1501")|| deptName.equals("1559")|| deptName.equals("1560")|| deptName.equals("1581")|| deptName.equals("1582")|| deptName.equals("1784")|| deptName.equals("1785")|| deptName.equals("1786")|| deptName.equals("1787")|| deptName.equals("1859"))){
%>
			<td class="small" align = "left" >
				<select class="normal"   name = "addedAmt" id = "addedAmt" onchange = "preamount();myFunction()" >
					<option value = "">Select</option>
					<option value = "2">2 lacs &nbsp; </option>
					<option value = "3">3 lacs &nbsp; </option>
					<option value = "4">4 lacs &nbsp; </option>
					<option value = "5">5 lacs &nbsp; </option>
					<option value = "6">6 lacs &nbsp; </option>
					<option value = "8">8 lacs &nbsp; </option>
					<option value = "10">10 lacs &nbsp; </option>
					<option value = "15">15 lacs &nbsp; </option>
				</select>
			</td>
<%
	} else{
%>
		
			<td class="small" align = "left" >
				<select class="normal"   name = "addedAmt" id = "addedAmt" onchange = "preamount()" >
					<option value = "">Select</option>
					<option value = "4">4 lacs &nbsp; </option>
					<option value = "5">5 lacs &nbsp; </option>
					<option value = "6">6 lacs &nbsp; </option>
				</select>
			</td>
<%	
	}
%>
		</tr>
		<tr>
			<!-- <td class="normal" align = "left" width="40%" height="20">&nbsp; Total Policy Covered (INR):</td> -->
			<td>
				<input type = "hidden" size = "5" class="normal" align = "left" width="60%" style="background-color:#D3D3D3;" name = "totalCover" id = "totalCover" value = "" readonly>
			</td>
		</tr>
		<tr>
			<td class="normal" align = "left" width="40%" height="30px">&nbsp; Premium Amount Incl. of Taxes (INR) :</td>
			<td>
				<input type = text size = "5"  class="normal" align = "left" width="60%" style="background-color:#D3D3D3;" name = "preAmt" id = "preAmt" value = "" readonly>
			</td>
		</tr>
<% 
	if((companyCode.equals("1000") || companyCode.equals("1009") || companyCode.equals("1035") || companyCode.equals("1034") || companyCode.equals("1042")) && (!(deptName.equals("1296")|| deptName.equals("1297")|| deptName.equals("1298")|| deptName.equals("1299")|| deptName.equals("1300")|| deptName.equals("1498")|| deptName.equals("1499")|| deptName.equals("1500")|| deptName.equals("1501")|| deptName.equals("1559")|| deptName.equals("1560")|| deptName.equals("1581")|| deptName.equals("1582")|| deptName.equals("1784")|| deptName.equals("1785")|| deptName.equals("1786")|| deptName.equals("1787")|| deptName.equals("1859")) )){ 
%>
		<tr>
			<td class="normal" align = "left" width="40%" height="30px">&nbsp; Payment Option :</td>
			<td class="normal" align = "left">
				<span id = "paymentOpt" value="1">- &nbsp; </span>
			</td>
			<!-- <td>
				<select class="normal"   name = "paymentOpt" id = "paymentOpt"  onchange = "preamount()" >
					<option value = "1">One-Time Payment &nbsp; </option> -->
<% 
				//if(!companyCode.equals("1000")) { 
%>
					<!-- <option value = "6">6 Interest-Free Monthly Instalments &nbsp; </option> -->
<%	
				//}
%>
				<!-- </select>
			</td> -->
		</tr> 
<% 
	} 
%>
<!-- <td class="white" align = "center" height="20"> 5 lac </td> -->
	</table>
	<br/>
	<table border = "0" cellspacing="0" cellpadding="0" colspan = "0" width = "100%">


	<!-- <td><input type="checkbox" valign="top" name="amt" id = "amt" value="" width = "3%"></td>
	<!-- <td class = "normal" width = "97%">I wish to apply for the Top Up Hospitalization Coverage. Additional charges would be borne by me.</td> -->
	<!-- <td class = "normal" width = "97%">I have read and understood the terms and conditions for the Top Up Insurance Scheme.<br> Premium / Any other expenses for the Top Up Insured Amount would be borne by me.<br> BCCL will not be liable for any expenses. I hereby authorize BCCL to deduct the premium amount <label id="lbltipAddedComment"></label> as a one time payment from my salary.</td>  -->
<%
	if (!(companyCode.equals("1000")|| companyCode.equals("1005") || companyCode.equals("1006") || companyCode.equals("1042") || companyCode.equals("1009"))){
%>
		<tr>
			<td><input type="checkbox" valign="top" width = "3%" name="amt" id = "amt" value="" ></td>
			<!-- <td class = "normal" width = "97%">I wish to apply for the Top Up Hospitalization Coverage. Additional charges would be borne by me.</td> -->
			<td class = "normal" width = "97%">I have understood the terms and conditions for the Top Up Insurance Scheme.<br> Additional Annual Premium for this scheme will be borne by me.<br> I hereby authorize BCCL to deduct the annual premium amount of Rs <label id="lbltipAddedComment"></label> &nbsp;as <span id="paymentOption">- </span>, from my salary.
			</td>
		</tr>
		<tr>
			<td width="50%" height="25" class="normal" colspan = "2">
				<a class="underline style1" href="https://tsweb.timesgroup.com/timescape/common/Guidelines for Top Up Insurance Option - 2020.pdf" target="_blank" height="10"><strong>Terms and Conditions for the Top Up Insurance Scheme</strong></a>
			</td>
		</tr>
<%
	} else if(companyCode.equals("1042") ){
%>
		<tr>
			<td valign="top" align="right"><input type="checkbox" width="1%" name="amt" id="amt" value=""></td>
			<td width="99%" align="left">
				<ul>
					<li class="normal">I have understood the terms and conditions for the Top Up Insurance Scheme.</li>
					<li class="normal">Additional Annual Premium for this scheme will be borne by me.</li>
					<li class="normal">I hereby authorize Bennett University to deduct the annual premium amount of Rs <span id="lbltipAddedComment"> - </span>&nbsp;as <span id="paymentOption">- </span>, from &nbsp;my salary.</li>
					<!-- <li class="normal"><font color = "red">*</font>On opting for Top Up of Rs 8 lacs, Rs 10 lacs or Rs 15 lacs, 3 month EMI on payment of premium will be applied automatically<font color = "red">*</font></li> -->
				</ul>
			</td>

			<!-- <td class = "normal" width = "97%">I wish to apply for the Top Up Hospitalization Coverage. Additional charges would be borne by me.</td>
			<td class = "normal" width = "97%">I have understood the terms and conditions for the Top Up Insurance Scheme.<br> Additional Annual Premium for this scheme will be borne by me.<br> I hereby authorize BCCL to deduct the annual premium amount of Rs <span id="lbltipAddedComment"> - </span>&nbsp;as <span id="paymentOption">a onetime payment </span>, from &nbsp;my salary.</td> -->
		</tr>
		<tr>
			<td class="normal" colspan = "2">
				<a class="underline style1" href="https://tsweb.timesgroup.com/timescape/common/BU Guidelines for Top Up Insurance Option - 2022.pdf" target="_blank" height="10"><strong>Terms and Conditions for the Top Up Insurance Scheme</strong></a>
			</td>
		</tr>
	
<%	
	} else if(companyCode.equals("1009") ){
%>
		<tr>
			<td valign="top" align="right"><input type="checkbox" width="1%" name="amt" id="amt" value=""></td>
			<td width="99%" align="left">
				<ul>
					<li class="normal">I have understood the terms and conditions for the Top Up Insurance Scheme.</li>
					<li class="normal">Additional Annual Premium for this scheme will be borne by me.</li>
					<li class="normal">I hereby authorize BCCL to deduct the annual premium amount of Rs <span id="lbltipAddedComment"> - </span>&nbsp;as <span id="paymentOption">- </span>, from &nbsp;my salary.</li>
					<!-- <li class="normal"><font color = "red">*</font>On opting for Top Up of Rs 8 lacs, Rs 10 lacs or Rs 15 lacs, 3 month EMI on payment of premium will be applied automatically<font color = "red">*</font></li> -->
				</ul>
			</td>

			<!-- <td class = "normal" width = "97%">I wish to apply for the Top Up Hospitalization Coverage. Additional charges would be borne by me.</td>
			<td class = "normal" width = "97%">I have understood the terms and conditions for the Top Up Insurance Scheme.<br> Additional Annual Premium for this scheme will be borne by me.<br> I hereby authorize BCCL to deduct the annual premium amount of Rs <span id="lbltipAddedComment"> - </span>&nbsp;as <span id="paymentOption">a onetime payment </span>, from &nbsp;my salary.</td> -->
		</tr>
		<tr>
			<td class="normal" colspan = "2">
				<a class="underline style1" href="https://tsweb.timesgroup.com/timescape/common/OMSL Guidelines for Top Up Insurance Option - 2022.pptx" target="_blank" height="10"><strong>Terms and Conditions for the Top Up Insurance Scheme</strong></a>
			</td>
		</tr>
	
<%	
	} else if(companyCode.equals("1000") && (!(deptName.equals("1296")|| deptName.equals("1297")|| deptName.equals("1298")|| deptName.equals("1299")|| deptName.equals("1300")|| deptName.equals("1498")|| deptName.equals("1499")|| deptName.equals("1500")|| deptName.equals("1501")|| deptName.equals("1559")|| deptName.equals("1560")|| deptName.equals("1581")|| deptName.equals("1582")|| deptName.equals("1784")|| deptName.equals("1785")|| deptName.equals("1786")|| deptName.equals("1787")|| deptName.equals("1859")) )){
%>
		<tr>
			<td valign="top" align="right"><input type="checkbox" width="1%" name="amt" id="amt" value=""></td>
			<td width="99%" align="left">
				<ul>
					<li class="normal">I have understood the terms and conditions for the Top Up Insurance Scheme.</li>
					<li class="normal">Additional Annual Premium for this scheme will be borne by me.</li>
					<li class="normal">I hereby authorize BCCL to deduct the annual premium amount of Rs <span id="lbltipAddedComment"> - </span>&nbsp;as <span id="paymentOption">- </span>, from &nbsp;my salary.</li>
					<!-- <li class="normal"><font color = "red">*</font>On opting for Top Up of Rs 8 lacs, Rs 10 lacs or Rs 15 lacs, 3 month EMI on payment of premium will be applied automatically<font color = "red">*</font></li> -->
				</ul>
			</td>

			<!-- <td class = "normal" width = "97%">I wish to apply for the Top Up Hospitalization Coverage. Additional charges would be borne by me.</td>
			<td class = "normal" width = "97%">I have understood the terms and conditions for the Top Up Insurance Scheme.<br> Additional Annual Premium for this scheme will be borne by me.<br> I hereby authorize BCCL to deduct the annual premium amount of Rs <span id="lbltipAddedComment"> - </span>&nbsp;as <span id="paymentOption">a onetime payment </span>, from &nbsp;my salary.</td> -->
		</tr>
		<tr>
			<td class="normal" colspan = "2">
				<a class="underline style1" href="https://tsweb.timesgroup.com/timescape/common/Guidelines for Top Up Insurance Option - 2020.pdf" target="_blank" height="10"><strong>Terms and Conditions for the Top Up Insurance Scheme</strong></a>
			</td>
		</tr>
	
<%	
	} else if(companyCode.equals("1005") || companyCode.equals("1006") || (deptName.equals("1296")|| deptName.equals("1297")|| deptName.equals("1298")|| deptName.equals("1299")|| deptName.equals("1300")|| deptName.equals("1498")|| deptName.equals("1499")|| deptName.equals("1500")|| deptName.equals("1501")|| deptName.equals("1559")|| deptName.equals("1560")|| deptName.equals("1581")|| deptName.equals("1582")|| deptName.equals("1784")|| deptName.equals("1785")|| deptName.equals("1786")|| deptName.equals("1787")|| deptName.equals("1859"))){
%>
		<tr>
		<span id = "paymentOpt" value="1">- &nbsp; </span>
			<td><input type="checkbox" valign="top" name="amt" id = "amt" value="" width = "3%"></td>
			<td class = "normal" width = "97%">I have understood the terms and conditions for the Top Up Insurance Scheme.<br> Additional Annual Premium for this scheme will be borne by me.<br> I hereby authorize Times Network to deduct the annual premium amount of Rs <label id="lbltipAddedComment"> </label> &nbsp; in 3 instalments, from my salary.
			</td>
		</tr> 
		<tr> <td width = "3%"></td> <td class = "normal" width = "97%">•	Top up Scheme nomination will be available for New Joinees for 45 days from their Joining date. Mid-Year enrolment for existing employees would not admissible.</td> </tr>
		<tr> <td width = "3%"></td> <td class = "normal" width = "97%">•	Once Top up Insurance scheme is opted for, withdrawal from the scheme is not permitted during the year.</td> </tr>
		<tr> <td width = "3%"></td> <td class = "normal" width = "97%">•	The Top Up policy will stand withdrawn if employee exits the company during the policy period. Employee will also, not be eligible for any refund.</td> </tr>
		<tr> <td width = "3%"></td> <td class = "normal" width = "97%">•	The employee understands and agrees that the Medical Insurance Scheme including top up scheme is a facility extended by the company for his/her personal benefit for which the employee agrees that he/she shall not hold the company and its official responsible in any manner for any unsettled claims or untoward/unpleasant experience with the insurance company or its TPA.</td> </tr>
	
<%	
	}
%>
	
	</table>
	<br>
	<table border = "0" cellspacing="0" cellpadding="0" colspan = "0" width = "50%" align = "center" >
		<tr height = "25">
			<!-- <td    ><input type = "submit"  class="normal" name = "submit" id="submit" value="Submit" onclick = "submitAmount();" /></a></td>  --> 
			<td align ="center" ><a><img src="../images/but_submit.gif" alt="submit" border="0" onclick = "submitAmount();"></a></td> 
			<!-- <td align = "center" ><a><img src="../images/but_submit.gif" alt="submit" border="0" onclick = "submitAmount();"></a></td> -->
			<!-- <td    ><input name="cancel" type="button" class="normal" id="cancel" value="Cancel" onclick = "javascript:window.close()" /></td>  --> 
			<!-- <td align = "center" ><a ><img src="../images/but_reset.gif" alt="reset" border="0"></a></td>  -->
		</tr>
		<input type = "hidden" name = "currYear1" id = "currYear1" value = "<%=currYear1%>">
		<input type = "hidden" name = "deptName" id = "deptName" value = "<%=deptName%>">
		<input type = "hidden" name = "compCode" id = "compCode" value = "<%=companyCode%>">
	</table>
<form>
</body>
</html>
