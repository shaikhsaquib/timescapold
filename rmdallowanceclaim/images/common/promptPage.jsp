<%@page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%@page import="com.bccl.claim.web.util.Constants"%>


<%
String message = "";
String param = (String) request.getParameter("msg");
String compCode = (String) request.getParameter("compCode");

if(param ==  null){
    param  = "ERR_REQ";
}

String currUrl = "";

/**Post Request**/
//User

//On successful
if(param.equalsIgnoreCase("SUC_REQ")){
    currUrl = "../requestor/createClaimrequest.jsp";
	message = "Your Request was saved sucessfully." +
			 " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view your request. ";
}


if(param.equalsIgnoreCase("SUC_REQ_PROCESS")){
    currUrl = "../processor/processRequest.jsp";
	message = "Your Request was saved sucessfully." +
			 " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view your request. ";
}


if(param.equalsIgnoreCase("ERR_REQ")){
    currUrl = "../requestor/createRequest.jsp";
	message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again ";
}

if(param.equalsIgnoreCase("ERR_REQ_PROCESSOR")){
    currUrl = "javascript:window.close();";
	message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again ";
}

if(param.equalsIgnoreCase("OPN_SUC_REQ")){
    currUrl = "../requestor/checkRequest.jsp";
	message = "Your Request was saved sucessfully." +
			" <br><br>Please note that you need to release the request in order to submit it to the Finance Department"+
	"<br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view your request. ";

}

if(param.equalsIgnoreCase("OPN_ERR_REQ")){
    currUrl = "../requestor/createRequest.jsp";
	message = "Sorry, There was an error while saving your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again ";
}

if(param.equalsIgnoreCase("DEL_SUC_REQ")){
	
    currUrl = "../requestor/checkRequest.jsp";
	message = "The bill was succesfully deleted" +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to check the status ";
}

if(param.equalsIgnoreCase("DEL_ERR_REQ")){
	
    currUrl = "../requestor/checkRequest.jsp";
	message = "Sorry, There was an error while deleting your bill(s)." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again ";
}

/**View Request**/
//Processor
if(param.equalsIgnoreCase("suc_pro")){
    currUrl = "../processor/processRequest.jsp?compCode="+compCode;
	message = "Your request was sucessfully processed." +
			" <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view pending Request(s). ";

}

if(param.equalsIgnoreCase("err_pro")){
currUrl = "../processor/processRequest.jsp?compCode="+compCode;
message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again ";
}

if(param.equals("suc_email")){
currUrl = "../processor/processRequest.jsp?compCode="+compCode;
message = "The email has been send successfully." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view pending Request(s). ";
}

if(param.equals("17")){
   	session.removeAttribute("claimRequests");
    currUrl = "../processor/processRequest.jsp?compCode="+compCode;
	message = "You have processed the applications successfully. "+
						 "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("7")){
   	session.removeAttribute("claimRequests");
    currUrl = "../processor/processRequest.jsp?compCode="+compCode;
	message = "Sorry, There was an error while processing one of the applications. "
						+"<br>Please try again later. "
						+"<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

/*------------------------------------Cancel Success Message Begins----------------------------------*/
if(param.equalsIgnoreCase("REQ_CNCL")){
    currUrl = "../requestor/checkRequest.jsp";
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
%>

<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name  = "b2e" method = "post">
		<!-- Outer most table -->
		<%//@ include file="../includes/technicalClaimHeader.html" %>
		 <%//@ include file="../includes/technicalClaimMenu.jsp" %>   

			<table width = "99%" border = "0"  align="center" cellspacing="0" cellpadding="0">
                        <%//@ include file="../includes/workflowMenu.jsp" %>
                        
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
                                <td class="normal" align="right"width="20%" >&nbsp;</td>
                                <td class="normal" align="center" width="60%"> <%=message%><br>
                                </td>
                                <td class="normal" align="left" width="20%">&nbsp;</td>
                            </tr>

                            <tr> 
                                <td colspan = "3" height="30"><img src = "../images/spacer.gif"></td>
                            </tr>
                        </table>

					</td>
				</tr>
			</table>
		<!-- Outer most table ends here -->
		</form>
	</body>
</html>