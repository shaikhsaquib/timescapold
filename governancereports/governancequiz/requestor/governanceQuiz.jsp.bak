<% if(session.getAttribute("reload")== ""){session.setAttribute("reload","1");}%>
<% if(((String)session.getAttribute("reload"))=="2"){response.sendRedirect("landingPage.jsp");}%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.SQLUtility"%>
<%@ page import="com.bccl.governancequiz.domain.GovernancequizUser"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Calendar, java.text.SimpleDateFormat,java.util.Calendar" %>
<jsp:useBean id="governancequizWebController" class="com.bccl.governancequiz.web.controllerbeans.GovernancequizWebController" /> 
<% session.setAttribute("flag","1"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Governance Quiz</title>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(../images/Q.png);
	background-repeat: no-repeat;
}
-->
</style>

<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<link href="../style/popup.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/governanceQuiz.js"></script>
<script Language="JavaScript" src=" ../jscripts/jquery-1.2.6.min.js"></script>
<script Language="JavaScript" src=" ../jscripts/ajax.js"></script>
<script Language="JavaScript" src="../jscripts/displayTime.js"></script>
<script Language="JavaScript" src="../jscripts/popup.js"></script>
<script type="text/javascript">
	javascript:window.history.forward(1);
</script>

<style type="text/css">
.style11 {font-size: 80%}
</style>
</head>
<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../requestor/governanceQuiz.jsp");
	session.setAttribute("topLink", "1");
	String date = "";
%>

<!--<body onload="JavaScript:showCurrentTime()">-->
<body onunload = "javascript.history.go(1)">
<!-- Start Quiz popup window -->
	<div id="popupContact">
		<!--<a id="popupContactClose">x</a>-->
		<div id="showData">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr><td height="10"></td></tr>
		<tr><td height="20" class="style3"><B>Instructions</B></td></tr>
		<tr><td height="10"></td></tr>
		<tr><td height="20" class="style3">1. You have to complete Quiz within 30 minutes</td></tr>
		<tr><td height="10"></td></tr>
		<tr><td height="20" class="style3">2. After 30 minutes your answers will automatically get submitted</td></tr>
		<tr><td height="10"></td></tr>
		<tr><td height="20" class="style3">3. Don't refresh your quiz page</td></tr>
		<tr><td height="30"></td></tr>
		<tr><td align="center">
		<a id="startQuiz">Start Quiz</a>
		</td></tr>
		</table>
		</div>
	</div>
	<div id="backgroundPopup"></div>
<!-- Login popup ends here -->

<%
	 SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
	 Date now = new Date();    
     String currentDate = sdfDate.format(now);
%>	 

<form name="governanceQuiz" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#74cad3" colspan="4"><img src="../images/governanceCodeQuiz.jpg" width="615" height="64" /></td>
  </tr>
  <tr>
  <tr><td height="8" colspan="4"></td></tr>
  <tr><td width="60%"></td>
  <td height="79" width="40%">
	<div align="left" style="height:57px; width:340px;position:fixed;background-image:url(../images/time.png);">
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr><td height="13" colspan="2"></td></tr>
	<tr><td width="4%"></td><td height="10" width="96%" id="result" style="color:#ffffff"></td></tr>
	</table>
	</div>
  </td>
  </tr>
</table>

<table width="100%" height="15" border="0" cellpadding="2" cellspacing="2">

   <br>
  <%@ include file="../includes/governanceQuizMenu.jsp"%>

</table>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="2" background="../images/tableBG.png" class="style3">
	
<%	
		String toDate = "";
		String status = "";
		
		ArrayList questionNo = new ArrayList();
		ArrayList minmaxNo = new ArrayList();
		ArrayList questionList = new ArrayList();
		ArrayList optionsList = new ArrayList();
		ArrayList queNo = new ArrayList();
		ArrayList optNo = new ArrayList();
		ArrayList statusList = new ArrayList();
		Hashtable questionIDHash = new Hashtable();
		Hashtable optionsHash = new Hashtable();
		int totalNo=16;
		int startNo = 1;
		int endNo=11;
		int OptionsField1 = 1;
		int minNo = 1;
		int maxNo = 1;

		minmaxNo = governancequizWebController.minmaxNumber(companyCode,deptName);
		String[] minmaxArr = (String[])minmaxNo.get(0);	
		String minNumber = minmaxArr[0];
		String maxNumber = minmaxArr[1];
		
		minNo = Integer.parseInt(minNumber);
		maxNo = Integer.parseInt(maxNumber);

		questionNo = GovernancequizUser.stringGenerator(minNo,maxNo,startNo,endNo);	
		int i=0;
		int k=0;
		
		// Check if the status is active or not

		statusList = governancequizWebController.checkStatus(timescapeUserOId);

			String[] statusArr = (String[])statusList.get(0);
			//String status = "A";
				status = statusArr[2];
				String startdate = statusArr[0];
             toDate = statusArr[1];
			Date sdftoDate = sdfDate.parse(toDate);
			Date sdfcurrentDate = sdfDate.parse(currentDate);
			
		if((sdfcurrentDate.before(sdftoDate) || sdfcurrentDate.equals(sdftoDate))){

		if(statusArr[2].equals("N") )
		{
		
		for(k=0;k<questionNo.size();k++)
		{			
			String count = Integer.toString(k);
		
			queNo.add(count);
		
			//Integer questionnumber = (Integer)(questionNo.get(k));		
			//questionIDHash.put("questionID"+(k+1),questionnumber+"");
			String tmpNumber = (String)(questionNo.get(k));
			//out.println(tmpNumber);
			int questionnumber = Integer.parseInt(tmpNumber);
			//out.println(questionnumber);
			questionIDHash.put("questionID"+(k+1),questionnumber+"");
			//out.println(questionIDHash);

			questionList = governancequizWebController.viewQuestions(questionnumber,companyCode,deptName);

			String[] QuesArr = (String[])questionList.get(0);
				
	%>
	<input type="hidden" value="<%=startdate%>" name="startDate">
		<input type="hidden" value="<%=toDate%>" name="toDate">
	<input type="hidden" name="timescapeUserOId" value="<%=timescapeUserOId%>">
		<input type="hidden" name="emailId1" value="<%=emailId%>">
			<tr>
				<td valign="top"><b><%=(k+1)%>.<b></td>
				<td><b><%=QuesArr[1]%><b></td>			
			</tr>

	<%
			optionsList = governancequizWebController.viewOptions(questionnumber,companyCode,deptName);
			optionsHash.put("question"+(k+1),optionsList.size()+"");
			
			for( i=0;i<optionsList.size();i++)
			{
				String count1 = Integer.toString(i);
				
			
				optNo.add(count1);
				String[] tmpArr = (String[])optionsList.get(i);	
				//optionsHash.put("options"+i,i+"");
				
	%>
				
				<tr>
					<td></td>
					<td>
					<input type="checkbox" name="option<%=k+1%><%=i+1%>" value="<%=i+1%>"><%=tmpArr[0]%>					
					</td>					
				</tr>
<%		
			}
%>		
		<input type="hidden" name="QField<%=k+1%>" value="<%=k+1%>">
	<%	}
		session.setAttribute("sessionVarQuesNo", queNo);
		session.setAttribute("sessionVarOptNo", optNo);
			
		for(k=0;k<questionNo.size();k++)
		{
			//System.out.println("\nQuestion Number"+(k+1)+" has "+optionsHash.get("question"+(k+1))+" options...");
%>	
			<input type="hidden" name="questionID<%=k+1%>" value="<%=questionIDHash.get("questionID"+(k+1))%>">
			<input type="hidden" name="optionsHash<%=k+1%>" value="<%=optionsHash.get("question"+(k+1))%>">
			<input type="hidden" name="selectedOptionsHash<%=k+1%>" value="">
<%
		}
%>
	<input type="hidden" name="questionSize" value="<%=questionNo.size()%>">
	<%//@ include file = "../includes/checkRequestorDate.jsp"%>
  <tr>
    <td colspan="6" bgcolor="#587DAB"><img src="../01EmailSurvey/images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
    <td colspan="6">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6" align="center" bgcolor="#CBECEF">
	  <input type="hidden" name="queNoSize" value="<%=queNo.size()%>">
	  <input type="hidden" name="optNoSize" value="<%=optNo.size()%>">
	  <input type="hidden" name="OptionsField1" value="<%=OptionsField1%>">
	<a href="javascript:submit(<%=queNo.size()%>,<%=optNo.size()%>,<%=OptionsField1%>)"><img src="../images/but_submit.gif" alt="submit" valign = "absmiddle" border="0" onclick="setValue()"></a>&nbsp;&nbsp;
	
	<a href="javascript:clear()"><img src="../images/but_reset.gif" alt="reset" valign = "absmiddle" border="0"></a>
	 </td>
  </tr>
</table>
<%
		}
		else
		{
%>
	<br><br><br><br><br><br>
<table align="center" valign="middle">
	<tr>
	<td height="17" colspan="6" align="center" valign="middle" class="style3">
	<h3>
	
<%
			out.println("you have already given the quiz...");
		}
	}else{
		
%>
<br><br><br><br><br><br>
<table align="center" valign="middle">
	<tr>
	<td height="17" colspan="6" align="center" valign="middle" class="style3">
	<h3>	
<%
		out.println("Your time for this Quiz is expired...");

	}
%>
	
</h3>
</td>
</tr>
</table>
<p>&nbsp;</p>

</form>

</body>
</html>
