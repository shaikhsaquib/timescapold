<html>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.SQLUtility,com.bccl.mail.SendMessage"%>
<%@ page import="com.bccl.governancequiz.domain.GovernancequizUser"%>
<%@ page import=" java.util.StringTokenizer"%>
<jsp:useBean id="governancequizWebController" class="com.bccl.governancequiz.web.controllerbeans.GovernancequizWebController" /> 

<head>
</head>
<body>

<%

	//	out.println(request.getParameter("option11"));
	///	out.println(request.getParameter("option21"));
	//	out.println(request.getParameter("option31"));
	boolean status=false;
	boolean scoreStatus=false;
	boolean userStatus=false;

	Hashtable optionsHash = new Hashtable();
	String temp = (String) request.getParameter("questionSize");
	String timescapeuserOId =(String)request.getParameter("timescapeUserOId");
	String emailId1 =(String)request.getParameter("emailId1");
	String toDate = (String) request.getParameter("toDate");
	String startDate = (String) request.getParameter("startDate");

	ArrayList correctOptions = new ArrayList();
    ArrayList correctQuestionAnswers = new ArrayList();
     ArrayList statusList = new ArrayList();
    String correctQuesAnsList = "";

    int questionSize = Integer.parseInt(temp);
	
	//out.println("questionSize"+questionSize);
	int finalScore = 0;
	String answers="";
	
	String ANS="";
	String correctAns="";
	
	for(int k=1;k<=questionSize;k++)
	{	
		ANS="";
	    correctAns="";
		String questionID =(String) request.getParameter("questionID"+k);
		//out.println(questionID);
		answers = (String) request.getParameter("selectedOptionsHash"+k);	
		//out.println("answers========"+answers);
		optionsHash.put("question"+k,answers);
		StringTokenizer st2 = new StringTokenizer(answers,"-");
		//String pipe = "-";
		String[] answers1 = new String[10];//answers.split(pipe);
		int count=0;
		while(st2.hasMoreElements()){
    		answers1[count] = (String) st2.nextElement();
			System.out.println("Options===="+answers1[count]);

            if(timescapeuserOId!=null && questionID!=null && answers1!=null && emailId1!=null)
            {
                status = governancequizWebController.insertFeedback(timescapeuserOId,questionID,answers1[count],emailId1);		
            }
		
			count++;
			
    	}
	
        
		//get the correct options
		correctOptions = governancequizWebController.correctAnswers(questionID);

        System.out.println("correctOptions size=="+correctOptions.size());
	
		//String[] correctOptionArr = (String[])correctOptions.get(0);
		
		//for(int i=0;i<correctOptionArr[0].length();i++)
		for(int i=0;i<correctOptions.size();i++)
		{
			String[] correctOptionArr = (String[])correctOptions.get(i);
            correctAns = correctAns+"-"+correctOptionArr[0];
			
		}
       // System.out.println("correctAns=="+correctAns);

		ANS = ANS+answers;

        //System.out.println("ANS=="+ANS);
		
		//compare with correct options
		if(correctAns.equals(ANS))
			{
				finalScore= finalScore+10;

				//System.out.println("%%%%"+finalScore);
			}
			else
			{
				System.out.println("no change");
                correctQuestionAnswers = governancequizWebController.viewQuestionAnswers(questionID,companyCode,deptName);
                System.out.println(correctQuestionAnswers.size());
                String ques = "";
                for(int ii=0;ii<correctQuestionAnswers.size();ii++)
                {   
                    String[] correctQuestionAnswersArr = (String[])correctQuestionAnswers.get(ii);
                    if(!(ques.equals(correctQuestionAnswersArr[0]))){
                        correctQuesAnsList = correctQuesAnsList + "Question:  " + correctQuestionAnswersArr[0] + "<br><br>";
                        correctQuesAnsList = correctQuesAnsList + "Correct Option(s): <br><br>";
                        correctQuesAnsList = correctQuesAnsList + (ii+1)+ ":  " + correctQuestionAnswersArr[1] + "<br>";
                        
                    }else{
                        correctQuesAnsList = correctQuesAnsList +(ii+1)+ ":  " + correctQuestionAnswersArr[1] + "<br>";
                    }
                    ques = correctQuestionAnswersArr[0];                    
                    
                }
                correctQuesAnsList = correctQuesAnsList + "-------------------------------<br>";
                

			}
	}
    System.out.println(correctQuesAnsList);

	scoreStatus = governancequizWebController.insertScore(timescapeuserOId,finalScore,emailId1);
	
	String sDate = (String)session.getAttribute("startTime");  
	String eDate = (String)session.getAttribute("endTime");
	String date = "";
	String createdDate = ""; 

	status = governancequizWebController.insertStartEndTime(timescapeuserOId,sDate,eDate);

	userStatus = governancequizWebController.updateStatus(timescapeuserOId);

    statusList = governancequizWebController.checkDate(timescapeUserOId,finalScore);

    for(int ii=0;ii<statusList.size();ii++)
	{
		String[] tmpArr = (String[])statusList.get(ii);

		date = tmpArr[0];
		createdDate = tmpArr[2];

	}

	if(userStatus)
	{
        SendMessage postMan = new SendMessage( );

			String fromAddr = "timescape.admin@timesgroup.com";
			String toAddr = emailId1;
			String content = "<html>"            
                                +"<head>"
                                +"<title></title>"
                                +"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">"
                                +"</head>"
                                +"<body style=\"background-color:LightGray;\">"
                                +"<font color=\"black\">";
				content = content + "<p><h2><font color=\"black\" face=\"arial\">Your Governance Quiz Score is: "+finalScore+"</font></h2></b><br>";
				if (!(finalScore==100)){
					content = content + "<p><h5>Details of questions incorrectly answered and their correct answers are as follows:</h5></p><br>";
					content = content + "<h5>"+correctQuesAnsList+"</h5><br><br><br><br>";
				}
				else if (finalScore==100){
					content = content + "<p><h5>Congratulations! You have successfully answered the Governance Quiz!</h5></p><br><br>";
				}
                	content = content + "<h4>Regards,</h4><br>";
			content = content + "<h4>TIMESCAPE Admin.</h4></font></body></html>";
			String emailsubject = "Governance Quiz Score & Correct Answer Details.";
			Hashtable mailer = new Hashtable();

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", emailsubject);
			mailer.put("content", content);
            	boolean mailSendStatus = false;
			postMan.sendEMail(fromAddr,toAddr,emailsubject,content);

		/*if(finalScore==100)
		{
			response.sendRedirect("../requestor/certificatePage.jsp?toDate="+toDate+"&startDate="+startDate+"&date="+date+"&score="+finalScore);
		}
		else {*/

				response.sendRedirect("../requestor/scorePage.jsp?toDate="+toDate+"&startDate="+startDate+"&date="+date+"&score="+finalScore+"&createdDate="+createdDate);
		//}
	}
	else
	{
		out.println
			("<td clospan=\"100%\" class=\"normal\" align=\"center\">Sorry, <br> There was an error while submitting your feedback, Please Try again !!</td></tr><tr><td clospan=\"100%\" class=\"normal\" align=\"center\">Click <a href=\"#\" onclick=\"javascript:history.back();\">here</a> to return.</td>");

	}
%>
</body>
</html>