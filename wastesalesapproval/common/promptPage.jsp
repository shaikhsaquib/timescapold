<%--
 -- Asset Management
 -- @(#)promptPage.jsp	20/03/2009
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Sachin Kale
 -- @version 	1.00, 20/03/20009
 --%>

<%@page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>

<%
String message = "";
String param = (String) request.getParameter("msg");

if(param ==  null){
    param  = "ERR_REQ";
}

String currUrl = "";
/*--------------------------------User Success Message Begins-------------------------------*/
if(param.equalsIgnoreCase("SUC_REQ")){
    currUrl = "../user/viewRequests.jsp";
	message = "Your request has been posted successfully." +
			 " <br><br> Click<a href = \"" +currUrl+ "\" class = \"boldunderline\"> here</a> to view your request. ";
}
/*--------------------------------User Success Message Ends---------------------------------*/

/*--------------------------------User Error Message Begins---------------------------------*/
if(param.equalsIgnoreCase("ERR_REQ")){
    currUrl = "../user/createRequest.jsp";
	message = "Sorry, There was an error while submitting your request." +
			  " <br><br>Click <a href = \"" +currUrl+ "\" class = \"boldunderline\">here</a> to try again ";
}
/*--------------------------------User Error Message Ends-----------------------------------*/

/*--------------------------------User Success Message Begins-------------------------------*/
if(param.equalsIgnoreCase("ALR_EXIST")){
    //currUrl = "../user/createAsset.jsp";
    currUrl = "javascript:history.back(-1);";
	message = " Sorry, Request with same asset no has already been created. Kindly check the requests!!!."
	+"<br><br>Click <a href = \"" +currUrl+ "\" class = \"boldunderline\">here</a> to try again.";
}
/*--------------------------------Sender Success Message Ends---------------------------------*/


/*--------------------------------Reviewer Success Message Begins-------------------------------*/
if(param.equalsIgnoreCase("suc_pro")){
    currUrl = "../reviewer/reviewRequests.jsp";
	message = "Your request has been sucessfully processed." +
			" <br><br>Click <a href = \"" +currUrl+ "\" class = \"boldunderline\">here</a> to view pending Request(s). ";

}
/*--------------------------------Reviewer Success Message Ends---------------------------------*/

/*--------------------------------Reviewer Error Message Begins-------------------------------*/
if(param.equalsIgnoreCase("err_pro")){
    currUrl = "../reviewer/reviewRequests.jsp";
    message = "Sorry, There was an error while processing your request." +
			  " <br><br>Click <a href = \"" +currUrl+ "\" class = \"boldunderline\">here</a> to try again ";
}
/*--------------------------------Reviewer Error Message Ends---------------------------------*/

/*--------------------------------Administrator Success Message Begins-------------------------------*/
if(param.equalsIgnoreCase("success_pro")){
    currUrl = "../administrator/publish.jsp";
	message = "Your request has been sucessfully processed." +
			" <br><br>Click <a href = \"" +currUrl+ "\" class = \"boldunderline\">here</a> to view pending Request(s). ";

}
/*--------------------------------Administrator Success Message Ends---------------------------------*/

/*--------------------------------Administrator Error Message Begins-------------------------------*/
if(param.equalsIgnoreCase("error_pro")){
currUrl = "../administrator/publish.jsp";
message = "Sorry, There was an error while processing your request." +
			  " <br><br>Click <a href = \"" +currUrl+ "\" class = \"boldunderline\">here</a> to try again ";
}
/*--------------------------------Administrator Error Message Ends---------------------------------*/


/*------------------------------------Cancel Success Message Begins----------------------------------*/
if(param.equalsIgnoreCase("REQ_CNCL")){
    currUrl = "../requestor/outbox.jsp";
	message = "Your message has been recalled sucessfully." +
			" <br><br>Click <a href = \"" +currUrl+ "\" class = \"boldunderline\">here</a> to view your Message(s). ";

}
/*-----------------------------------Cancel Success Message Ends-------------------------------------*/

/*-----------------------------------Cancel Error Message Begins-----------------------------------*/
if(param.equalsIgnoreCase("REQ_ERR")){
    currUrl = "../requestor/outbox.jsp";
    message = "Sorry, There was an error while recalling your message." +
			  " <br><br>Click <a href = \"" +currUrl+ "\" class = \"boldunderline\">here</a> to try again ";
}
/*------------------------------------Cancel Error Message Ends------------------------------------*/

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>ASSET MANAGEMENT</title>
		<link href="../style/global.css" rel="stylesheet" type="text/css" />
		<script src="../jscripts/reviewRequests.js" type="text/javascript"></script>
		<style type="text/css">
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			background-image: url('../images/header_BG.jpg');
			background-repeat: repeat-x;
		</style>
	</head>

<body>
<form name="b2e" method="post" >
<%@ include file="../includes/relatedLinks.jsp"%>
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