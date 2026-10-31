<%--
 -- @(#)promptPage.jsp	15/3/2008
 -- Copyright 2004 BCCL. All Rights Reserved.
 -- 
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 -- 
 --%>

 <%--
 -- @author		Manisha Wadhawane
 -- @version 	1.00, 15/3/2008
 --%>

<%@page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%@page import="com.bccl.workflow.web.util.Constants"%>

<%
String message = "";
String param = (String) request.getParameter("msg");

if(param ==  null){
    param  = "2";
}

String currUrl = "";
/**View Request**/
//User
if(param.equals("1")){
    currUrl = "../requestor/checkRequestStatus.jsp";
	message = "Your OB Claim Request was cancelled sucessfully." +
			" <br><br> It will be published online shortly after approval by " +
			" <br><br> Timescape Administrator "+
			" <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to check requests. ";

}

if(param.equals("2")){
    currUrl = "../requestor/checkRequestStatus.jsp";
	message = "Sorry, There was an error while cancelling your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again ";
}


/**Post Request**/
//User
if(param.equals("3")){
    currUrl = "../requestor/checkRequestStatus.jsp";
	message = "Your OB Claim request was filed successfully." +
			" <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view the status of your OB Claim request(s). ";

}


if(param.equals("4")){
    currUrl = "../requestor/apply.jsp";
	message = "Sorry, There was an error while processing your request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again ";
}



/**View Request**/
//Approver
if(param.equals("5")){
    currUrl = "../common/viewHistory.jsp";
	message = "Your request was sucessfully processed." +
			" <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view all approved request(s). ";

}

if(param.equals("6")){
    currUrl = "../approver/approveTour.jsp";
	message = "Sorry, There was an error while processing the request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again ";
}

/**View Request**/
//Processor
if(param.equals("7")){
    currUrl = "../approver/approveRequest.jsp";
	message = "Your request was sucessfully processed." +
			" <br><br>  <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view remaining request(s). ";

}

if(param.equals("8")){
    currUrl = "../approver/approveRequest.jsp";
	message = "Sorry, There was an error while processing the request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again ";
}

/**Add Fields**/
//Processor
if(param.equals("9")){
    currUrl = "../processor/processFields.jsp";
	message = "Your request was sucessfully processed." +
			" <br><br>  <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to view remaining request(s). ";

}

if(param.equals("10")){
    currUrl = "../processor/processFields.jsp";
	message = "Sorry, There was an error while processing the request." +
			  " <br><br> <a href = \"" +currUrl+ "\" class = \"boldunderline\">Click here</a> to try again ";
}
%>

<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name  = "b2e" method = "post">
		<!-- Outer most table -->
			<table width = "100%" border = "0"  align="center" cellspacing="0" cellpadding="0">
                        
					  <tr>
						<td height="25" bgcolor="#CC0000" class="style2"><div align="center" class="style5White">TIMES GLOBAL BROADCASTING COMPANY LTD</div></td>
					  </tr>
					  <tr>
						<td height="32" bgcolor="#666666" class="style2"><div align="center" class="style5Copy">Out Broadcasting (OB) Engineers Expenses Claim Form</div></td>
					  </tr>
					  <tr>
						<%@ include file="../includes/obClaimMenu.jsp" %> 
						<td>&nbsp;</td>
					  </tr>
			</table>
                        
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