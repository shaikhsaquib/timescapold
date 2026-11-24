<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.SQLUtility"%>
<%@ page import="com.bccl.governancequiz.domain.GovernancequizUser"%>
<jsp:useBean id="governancequizWebController" class="com.bccl.governancequiz.web.controllerbeans.GovernancequizWebController" /> 

<html xmlns="http://www.w3.org/1999/xhtml">


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
<script Language="JavaScript" src="../jscripts/governanceQuiz.js"></script>
<style type="text/css">
.style11 {font-size: 80%}
</style>
</head>
<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../requestor/governanceQuiz.jsp");
	session.setAttribute("topLink", "1");
	
%>
<body>

<form name="governanceQuiz" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#74cad3"><img src="../images/governanceCodeQuiz.jpg" width="615" height="64" /></td>
  </tr>
</table>

<table width="100%" height="59" border="0" cellpadding="2" cellspacing="2">
  <!-- <tr>
    <td height="17" colspan="6" align="center" valign="middle" class="style4"><div align="left" class="headCompliance">My Governance Code Quiz | View Reports</div></td>
  </tr> -->
  <%@ include file="../includes/governanceQuizMenu.jsp"%>
  <tr>
    <td height="17" colspan="3" align="center" valign="middle" class="style1"><div align="left"></div></td>
    <td width="72%" colspan="3" align="center" valign="middle" class="style1"><div align="right"></div></td>
  </tr>
</table>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="2" background="../images/tableBG.png" class="style3">
	

<%	
		ArrayList questionNo = new ArrayList();
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
		
		questionNo = GovernancequizUser.stringGenerator(totalNo,startNo,endNo);	
		int i=0;
		int k=0;
		
		// Check if the status is active or not

		statusList = governancequizWebController.checkStatus(timescapeUserOId);

			String[] statusArr = (String[])statusList.get(0);
			//out.println("@@@@"+statusArr[0]);
			//String status = "A";

		if(statusArr[0].equals("N"))
		{
			
			
		for(k=0;k<questionNo.size();k++)
		{			
			String count = Integer.toString(k);
		
			queNo.add(count);
		
			Integer questionnumber = (Integer)(questionNo.get(k));		
			questionIDHash.put("questionID"+(k+1),questionnumber+"");

			questionList = governancequizWebController.viewQuestions(questionnumber);

			String[] QuesArr = (String[])questionList.get(0);
			//System.out.println("questionList size="+questionList.size());			
	%>
		<input type="hidden" name="timescapeUserOId" value="<%=timescapeUserOId%>">
		<input type="hidden" name="emailId1" value="<%=emailId%>">
			<tr>
				<td valign="top"><b><%=(k+1)%>.<b></td>
				<td><b><%=QuesArr[1]%><b></td>			
			</tr>

	<%
			optionsList = governancequizWebController.viewOptions(questionnumber);
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
  <tr>
    <td colspan="6" bgcolor="#587DAB"><img src="../01EmailSurvey/images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
    <td colspan="6">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6" align="center" bgcolor="#CBECEF">
	<a href="javascript:submit(<%=queNo.size()%>,<%=optNo.size()%>,<%=OptionsField1%>)"><img src="../images/but_submit.gif" alt="submit" valign = "absmiddle" border="0"></a>&nbsp;&nbsp;
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
%>
</h3>
</td>
</tr>
</table>
<p>&nbsp;</p>

</form>
</body>
</html>
