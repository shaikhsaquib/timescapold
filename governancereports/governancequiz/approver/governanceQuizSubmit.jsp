<html>
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

<head>
</head>
<body>

<%
	boolean status=false;
	boolean scoreStatus=false;
	boolean userStatus=false;
	Hashtable optionsHash = new Hashtable();
	String temp = (String) request.getParameter("questionSize");
	String timescapeuserOId =(String)request.getParameter("timescapeUserOId");
	String emailId1 =(String)request.getParameter("emailId1");
	ArrayList correctOptions = new ArrayList();
	
	int questionSize = Integer.parseInt(temp);
	
	//out.println("questionSize"+questionSize);
	int finalScore = 0;
	String answers="";
	
	String ANS="";
	
	//System.out.println("How many questions="+questionSize);
	String correctAns="";
	
	for(int k=1;k<=questionSize;k++)
	{	
		
		String questionID =(String) request.getParameter("questionID"+k);
		//out.println(questionID);
		answers = (String) request.getParameter("selectedOptionsHash"+k);	
		//out.println("answers========"+answers);
		optionsHash.put("question"+k,answers);
		
		String pipe = "-";
		String[] answers1 = answers.split(pipe);
		

		status = governancequizWebController.insertFeedback(timescapeuserOId,questionID,answers1,emailId1);		
		
		//get the correct options
		correctOptions = governancequizWebController.correctAnswers(questionID);
	
		String[] correctOptionArr = (String[])correctOptions.get(0);
		
		for(int i=0;i<correctOptionArr[0].length();i++)
		{
			correctAns = correctAns+"-"+correctOptionArr[0];
			
		}
		ANS = ANS+answers;
		
		//compare with correct options
		if(correctAns.equals(ANS))
			{
				finalScore= finalScore+10;
				//out.println("%%%%"+finalScore);
			}
			else
			{
				System.out.println("no change");	

			}


	}

	scoreStatus = governancequizWebController.insertScore(timescapeuserOId,finalScore,emailId1);

	//function to update the status from N to A

	userStatus = governancequizWebController.updateStatus(timescapeuserOId);

	if(userStatus)
	{
		response.sendRedirect("../requestor/scorePage.jsp?score="+finalScore);

	}
	else
	{
		out.println
			("<td clospan=\"100%\" class=\"normal\" align=\"center\">Sorry, <br> There was an error while submitting your feedback, Please Try again !!</td></tr><tr><td clospan=\"100%\" class=\"normal\" align=\"center\">Click <a href=\"#\" onclick=\"javascript:history.back();\">here</a> to return.</td>");

	}
%>


  



</body>
</html>