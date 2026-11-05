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
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>

<%
String message = "";
String param = (String) request.getParameter("msg");

if(param ==  null){
    param  = "ERR_REQ";
}

String currUrl = "";

/*--------------------------------User Error Message Ends-----------------------------------*/
if(param.equalsIgnoreCase("suc_rem")){
    currUrl = "javascript:window.close();opener.location.reload(true);";
	message = "Your request has been posted successfully." +
			 " <br><br> Click<a href = \"" +currUrl+ "\" class = \"boldunderline\"> here</a> to view assets. ";
}
/*--------------------------------User Success Message Ends---------------------------------*/

/*--------------------------------User Error Message Begins---------------------------------*/
if(param.equalsIgnoreCase("err_rem")){
    //currUrl = "../user/createAsset.jsp";
    currUrl = "javascript:history.back(-1);";
	message = "Sorry, There was an error while submitting your request." +
			  " <br><br>Click <a href = \"" +currUrl+ "\" class = \"boldunderline\">here</a> to try again ";
}
/*--------------------------------User Error Message Ends-----------------------------------*/

/*--------------------------------User Error Message Ends-----------------------------------*/
if(param.equalsIgnoreCase("success_pro")){
    currUrl = "javascript:window.close();opener.location.reload(true);";
	message = "Your request has been processed successfully." +
			 " <br><br>Click <a href = \"" +currUrl+ "\" class = \"boldunderline\">here</a> to view pending Request(s). ";
}
/*--------------------------------User Success Message Ends---------------------------------*/
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>ASSET MANAGEMENT</title>
	<style>
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	.normal {
		FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 8pt; FONT-WEIGHT: normal; TEXT-DECORATION: none
	}
</style>
</head>
<body>
<form name="b2e" method="post" >
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
				<td class="normal" align="right"width="15%" >
					&nbsp;
				</td>
				<td class="normal" align="center" width="70%">
					<%=message%><br>
				</td>
				<td class="normal" align="left" width="15%">
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