<%--
 -- Governance Code
 -- @(#)processGovernanceApprover.jsp	11/02/2011
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Nitin Sharma
 -- @version 	1.00, 11-FEB-2011
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<jsp:useBean id="governanceApprover" class="com.bccl.governancecode.web.controllerbeans.GovernanceAppWebController" />
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<body>


			<%@ include file="../includes/headerMenu.jsp"%>
			<table width="100%" height="59" border="0" cellpadding="2" cellspacing="2">
				<tr>
					<td height="17" colspan="6" align="center" valign="middle" class="style4"><div align="left" class="headCompliance">My Code Compliance | View Governance Code</div></td>
				</tr>
				<tr>
					<td height="17" colspan="3" align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> From  01-04-2024 to 31-03-2025 </span></div></td>
					<td width="72%" colspan="3" align="center" valign="middle" class="style1"><div align="right">&nbsp;</div></td>
					</tr>
                    

			</table>
<%
	String tOIdVal = "";
    String isoverRidden = "";
	String overriddenRemarks = ""; 
	int size=Integer.parseInt(session.getAttribute("size")+"");
	boolean fdbkStatus= false;
			//feedback.put(size+"", action);
			
			
	
for(int i=0; i<size; i++)
		{
	       tOIdVal = (String) request.getParameter("check"+i);
		   overriddenRemarks = (String)request.getParameter("overriddenRemarks"+i);
		  
		   String questionno = (String)session.getAttribute("question");
		    //out.println(overriddenRemarks);
		   if(overriddenRemarks == ""){overriddenRemarks = "No Remarks";}
		  
	         if((tOIdVal!=null) && !(tOIdVal.equals("select")) && !(tOIdVal.equals("No")) )
			{
				 isoverRidden = (String)request.getParameter("check"+i);
				 isoverRidden = isoverRidden.substring(tOIdVal.length()-1);		
				 if(isoverRidden.equals("Y")){isoverRidden="Yes";}else{isoverRidden="No";}
				 tOIdVal = tOIdVal.substring(0,((tOIdVal.length())-1));	
				 fdbkStatus = governanceApprover.updateApproverFeedback(isoverRidden, overriddenRemarks, tOIdVal, questionno);
			  // out.println(tOIdVal);
		}
		}
%>
<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">

<%
if(fdbkStatus == true)

{

		out.println("<td clospan=\"100%\" class=\"normal\" align=\"center\">Thank You, <br>Your Feedback has been saved successfully!!</td></tr><tr><td clospan=\"100%\" class=\"normal\" align=\"center\">Click <a href=\"../approver/governanceAppr.jsp\">here</a> to return.</td>");
		//response.sendRedirect("../approver/governanceApprover.jsp");

	}

	else if(fdbkStatus == false){

		out.println("<td clospan=\"100%\" class=\"normal\" align=\"center\">Sorry, <br> There was an error while submitting your feedback, Please Try again !!</td></tr><tr><td clospan=\"100%\" class=\"normal\" align=\"center\">Click <a href=\"#\" onclick=\"javascript:history.go(-1);\">here</a> to return.</td>");
	}
	
	//out.println(feedback); 

%>
</tr>
</table>
</body>

