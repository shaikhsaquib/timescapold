<%--
 -- Admin Services
 -- @(#)promptPage.jsp	14/7/2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Amruta Gangan
 -- @version 	1.00, 14/7/2008
 --%>

<%@page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@page import="com.bccl.workflow.web.util.Constants"%>


<%
String message = "";
String param = (String) request.getParameter("msg");

if(param ==  null){
    param  = "ERR_REQ";
}

String currUrl = "";
/*--------------------------------Requestor Success Message Begins-------------------------------*/
if(param.equalsIgnoreCase("SUC_REQ")){
    currUrl = "../requestor/checkRequestStatus.jsp";
	message = "Your Business Card request was filed successfully." +
			 " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view your Business Card request(s)";
}
/*--------------------------------Requestor Success Message Ends---------------------------------*/

/*--------------------------------Requestor Error Message Begins---------------------------------*/
if(param.equalsIgnoreCase("ERR_REQ")){
    currUrl = "../requestor/requestCards.jsp";
	message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again";
}
/*--------------------------------Requestor Error Message Ends-----------------------------------*/


/*--------------------------------Approver Success Message Begins-------------------------------*/
if(param.equalsIgnoreCase("suc_pro")){
    currUrl = "../approver/approveRequest.jsp";
	message = "Your request was processed sucessfully." +
			" <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view pending request(s)";

}
/*--------------------------------Approver Success Message Ends---------------------------------*/

/*--------------------------------Approver Error Message Begins-------------------------------*/
if(param.equalsIgnoreCase("err_pro")){
currUrl = "../approver/approveRequest.jsp";
message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again";
}
/*--------------------------------Approver Error Message Ends---------------------------------*/

/*--------------------------------Reviewer Success Message Begins-------------------------------*/
if(param.equalsIgnoreCase("success_pro")){
    currUrl = "../reviewer/reviewRequest.jsp";
	message = "Your request was processed sucessfully." +
			" <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view pending request(s)";

}
/*--------------------------------Reviewer Success Message Ends---------------------------------*/

/*--------------------------------Reviewer Error Message Begins-------------------------------*/
if(param.equalsIgnoreCase("error_pro")){
currUrl = "../reviewer/reviewRequest.jsp";
message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again";
}
/*--------------------------------Reviewer Error Message Ends---------------------------------*/

/*--------------------------------Reviewer PBChecker Success Message Begins-------------------------------*/
if(param.equalsIgnoreCase("success_propb")){
    currUrl = "../pbchecker/reviewRequest.jsp";
	message = "Your request was processed sucessfully." +
			" <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view pending request(s)";

}
/*--------------------------------Reviewer PBChecker Success Message Ends---------------------------------*/

/*--------------------------------Reviewer PBChecker Error Message Begins-------------------------------*/
if(param.equalsIgnoreCase("error_propb")){
currUrl = "../pbchecker/reviewRequest.jsp";
message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again";
}
/*--------------------------------Reviewer PBChecker Error Message Ends---------------------------------*/

/*------------------------------------Cancel Success Message Begins----------------------------------*/
if(param.equalsIgnoreCase("REQ_CNCL")){
    currUrl = "../requestor/checkRequestStatus.jsp";
	message = "Your request was cancelled sucessfully." +
			" <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view your request(s)";

}
/*-----------------------------------Cancel Success Message Ends-------------------------------------*/

/*-----------------------------------Cancel Error Message Begins-----------------------------------*/
if(param.equalsIgnoreCase("REQ_ERR")){
currUrl = "../requestor/cancelRequest.jsp";
message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again";
}
/*------------------------------------Cancel Error Message Ends------------------------------------*/

/*------------------------------------Close Success Message Begins----------------------------------*/
if(param.equalsIgnoreCase("REQ_CLS")){
    currUrl = "../requestor/checkRequestStatus.jsp";
	message = "Your request was closed sucessfully." +
			" <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view your request(s)";

}
/*-----------------------------------Close Success Message Ends-------------------------------------*/

/*-----------------------------------Close Error Message Begins-----------------------------------*/
if(param.equalsIgnoreCase("ERR_CLS")){
currUrl = "../requestor/cancelRequest.jsp";
message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again";
}
/*------------------------------------Close Error Message Ends------------------------------------*/


/*------------------------------------Update contact Success Message Begins----------------------------------*/
if(param.equalsIgnoreCase("REQ_UPDT")){
    currUrl = "../requestor/checkRequestStatus.jsp";
	message = "Your request was processed sucessfully.";

}
/*-----------------------------------Update contact Success Message Ends-------------------------------------*/

/*-----------------------------------Update contact Error Message Begins-----------------------------------*/
if(param.equalsIgnoreCase("ERR_UPDT")){
currUrl = "../requestor/cancelRequest.jsp";
message = "Sorry, There was an error while processing your request.";
}
/*------------------------------------Update contact Error Message Ends------------------------------------*/


/*------------------------------------Update processor Success Message Begins----------------------------------*/
if(param.equalsIgnoreCase("REQ_PRO_UPDT")){
    currUrl = "../processor/processRequest.jsp";
	message = "Your request was processed sucessfully." +
			" <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view pending request(s)";

}
/*-----------------------------------Update processor Success Message Ends-------------------------------------*/

/*-----------------------------------Update processor Error Message Begins-----------------------------------*/
if(param.equalsIgnoreCase("ERR_PRO_UPDT")){
currUrl = "../processor/processRequest.jsp";
message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again";
}
/*------------------------------------Update processor Error Message Ends------------------------------------*/


/*------------------------------------Update vendor Success Message Begins----------------------------------*/
if(param.equalsIgnoreCase("REQ_VEN_UPDT")){
    currUrl = "../vendor/processRequest.jsp";
	message = "Your request was processed sucessfully." +
			" <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view pending request(s)";

}
/*-----------------------------------Update vendor Success Message Ends-------------------------------------*/

/*-----------------------------------Update vendor Error Message Begins-----------------------------------*/
if(param.equalsIgnoreCase("ERR_VEN_UPDT")){
currUrl = "../vendor/processRequest.jsp";
message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again";
}
/*------------------------------------Update vendor Error Message Ends------------------------------------*/

%>

<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

		<form name  = "b2e" method = "post">

		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>

<!------------------------------ Table To Display Message Begins -------------------------------->
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center"  >

			<tr> 
				<td colspan="3" bgcolor="#FFFFFF"><img src="../images/spacer.gif"></td>
            </tr>
			
			<tr> 
				<td class="normal" colspan="3" align="right"height = "30">
					<img src = "../images/spacer.gif">
                </td>
			</tr>

            <tr> 
				<td class="normal" align="right"width="20%" >
					&nbsp;
				</td>
				<td class="normal" align="center" width="60%">
					<%=message%><br>
				</td>
				<td class="normal" align="left" width="20%">
					&nbsp;
				</td>
			</tr>

			<tr> 
				<td colspan = "3" height="30">
					<img src = "../images/spacer.gif">
				</td>
			</tr>
		</table>
<!------------------------------ Table To Display Message Ends ---------------------------------->

		</form>
	</body>
</html>