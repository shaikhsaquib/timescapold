<%--
 -- @(#)search.jsp	15/07/2009
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Sachin Kale
 -- @version 	1.00, 15/07/2009
 --%>
<%@ page language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Purchase Approval</title>
<link rel="stylesheet" href="../style/global.css">
<link rel="stylesheet" href="../style/common.css">
<script Language="JavaScript" src="../jscripts/util.js"></script>
<script Language="JavaScript" src="../jscripts/common.js"></script>
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<script language="javascript" type="text/javascript">
function addtext(userOId,emailId) {

/*    document.getElementById('outputtext').value+= "'"+emailId+"',\n";
    document.getElementById('userOId').value+= "'"+userOId+"',";
*/		

		forWhom	=	document.getElementById('forWhom').value;
		//alert(forWhom);
		//alert(userOId);
		var ff = document.priceApproval;
		//var temp = ff.uploadFileName.value;
        // var temp1 = ff.isUpload.value; is attach? yes or no
        //alert(temp);
       
		field= eval("self.opener.document.priceApproval."+forWhom); 
		field2= eval("self.opener.document.priceApproval."+forWhom+"OId"); 
       
		//isUpload= (String)eval("self.opener.document.frmCreateRequest.isUpload"+i);  



		field.value=emailId;
		field2.value=userOId;
       
//        isUpload.value = temp1;

		self.close();
        self.opener.focus();
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<% 
	String forWhom = (String) request.getParameter("forWhom");
%>
<form name  = "priceApproval" method = "post">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		
		<input type ="hidden" name = "forWhom" value = "<%=forWhom%>" />
		<tr>
			<td colspan="100%" class="bold" align="left" height="30">SEARCH FOR USERS </td>
		</tr>

		<tr>
			<td colspan="100%" class="normal" align="left" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>		
        <tr>
			<td class = "bold" height = "30" colspan = "100%" align = "left">Search By Name / Email-Id </td>
		</tr>

		<tr>
			<td class = "normal" height = "30" width = "30%" align = "right">Enter Name / Email-Id</td>
			<td class = "bold" height = "30"   width = "5%" align = "center">:</td>
			<td class = "normal" height = "30" width="30%" align="left"><input type = "text" name = "email" id="email" class = "normal" size="30"></td>
			<td align = "left">
				<a href="javascript:validateUser()"><img src="../images/but_go.gif" alt="go" border="0" valign = "absbottom"><a/>&nbsp;&nbsp;
				<a href="javascript:clear()"><img src="../images/but_reset.gif" alt="reset" border="0" valign = "absbottom"></a>
			</td>
		</tr>
		<tr>
			<td colspan="100%" class="normal" align="left" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>		
       <!-- 	<tr>
			<td colspan="100%" class="normal" align="left">
            <table border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td><textarea name="outputText" id="outputText" rows="5" cols="37"></textarea>
                    <input type="hidden" class="normal" name="userOId" id="userOId" ></td>
                    <td><a href="#" onclick="add()" class="underline" valign="middle">Add to Members List<td>
                </tr>
            </table>
        </td>
		</tr>	 -->	
		<tr>
			<td colspan="100%" class="normal" align="left" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>		
		<tr>
			<td colspan="100%" class="normal" align="left" height = "15px">List of Members</td>
		</tr>		
		<tr>
			<td colspan="100%" class="normal" align="left" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>		
        <tr>
			<td class = "normal" colspan="100%" align = "right">
                <div id="members" style="padding:1px;padding-top:1px;text-align:left;"></div>
            </td>
		</tr>
    </table>
</form>
</html>