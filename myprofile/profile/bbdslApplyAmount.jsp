<%//out.println("hi");%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@page import="com.bccl.workflow.web.util.HtmlUtil"%>
<script Language="JavaScript" src="../jscripts/bcclViewNomineeDetails.js"></script>
<script Language="JavaScript" src="../jscripts/bcclTopupAmt.js"></script>

<%
int lastYear = 0;
	int currYear = 0;
	int selYear = 0;
	int preYear = 0;
	
	String exstingAmt = "500000";
	GregorianCalendar today = new GregorianCalendar();	
	currYear = today.get(Calendar.YEAR) ;
	String currYear1     = today.get(Calendar.YEAR)	+	"";
	//out.println("currYear"+currYear);
	if(today.get(Calendar.MONTH)==0 || today.get(Calendar.MONTH)==1 || today.get(Calendar.MONTH)==2){
			lastYear = currYear - 1;	
		}
		else{
			lastYear = currYear;	
		}

		preYear = lastYear - 1;


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
</tr>
<tr> -->
<td class="normal" align = "left" width="40%" height="20">&nbsp; Top-Up Insured Amount (INR):</td>
<!-- <td class="normal" align = "left" width="60%">5 lacs</td> -->
<td class="small" align = "left" ><select class="normal"   name = "addedAmt" id = "addedAmt" onchange = "preamount()" >
<option value = "">Select</option>
<option value = "2">2 lacs &nbsp; </option>
<option value = "3">3 lacs &nbsp; </option>
<option value = "4">4 lacs &nbsp; </option>
<option value = "5">5 lacs &nbsp; </option>
<option value = "6">6 lacs &nbsp; </option>
<option value = "8">8 lacs &nbsp; </option>
<option value = "10">10 lacs &nbsp; </option>
</select></td>
</tr>
<tr>
<!-- <td class="normal" align = "left" width="40%" height="20">&nbsp; Total Policy Covered (INR):</td> -->
<td><input type = "hidden" size = "5" class="normal" align = "left" width="60%" style="background-color:#D3D3D3;" name = "totalCover" id = "totalCover" value = "" readonly></td>
</tr>

<tr>
<td class="normal" align = "left" width="40%" height="20">&nbsp; Premium Amount Incl. of Taxes (INR) :</td>
<td><input type = text size = "5"  class="normal" align = "left" width="60%" style="background-color:#D3D3D3;" name = "preAmt" id = "preAmt" value = "" readonly></td>
</tr>
<!-- <td class="white" align = "center" height="20"> 5 lac </td> -->
</tr>
</table>
<br/>
<table border = "0" cellspacing="0" cellpadding="0" colspan = "0" width = "100%">
<tr>

	<!-- <td><input type="checkbox" valign="top" name="amt" id = "amt" value="" width = "3%"></td>
	<!-- <td class = "normal" width = "97%">I wish to apply for the Top Up Hospitalization Coverage. Additional charges would be borne by me.</td> -->
	<!-- <td class = "normal" width = "97%">I have read and understood the terms and conditions for the Top Up Insurance Scheme.<br> Premium / Any other expenses for the Top Up Insured Amount would be borne by me.<br> BCCL will not be liable for any expenses. I hereby authorize BCCL to deduct the premium amount <label id="lbltipAddedComment"></label> as a one time payment from my salary.</td>  -->

	<td><input type="checkbox" valign="top" name="amt" id = "amt" value="" width = "3%"></td>
	<!-- <td class = "normal" width = "97%">I wish to apply for the Top Up Hospitalization Coverage. Additional charges would be borne by me.</td> -->
	<td class = "normal" width = "97%">I have understood the terms and conditions for the Top Up Insurance Scheme.<br> Additional Annual Premium for this scheme will be borne by me.<br> I hereby authorize BBDSL to deduct the annual premium amount of Rs <label id="lbltipAddedComment"></label> as a onetime payment, from my salary.</td>
</tr>
</table>
<br>
<table border = "0" cellspacing="0" cellpadding="0" colspan = "0" width = "50%" align = "center" >
<tr height = "25">
  <!-- <td    ><input type = "submit"  class="normal" name = "submit" id="submit" value="Submit" onclick = "submitAmount();" /></a></td>  --> 
  <td align = "center" ><a><img src="../images/but_submit.gif" alt="submit" border="0" onclick = "submitAmount();"></a></td> 
 <!-- <td align = "center" ><a><img src="../images/but_submit.gif" alt="submit" border="0" onclick = "submitAmount();"></a></td> -->
   <!-- <td    ><input name="cancel" type="button" class="normal" id="cancel" value="Cancel" onclick = "javascript:window.close()" /></td>  --> 
  <!-- <td align = "center" ><a ><img src="../images/but_reset.gif" alt="reset" border="0"></a></td>  -->
  
</tr>
<input type = "hidden" name = "currYear1" id = "currYear1" value = "<%=currYear1%>">

</table>
<form>
</body>
</html>
