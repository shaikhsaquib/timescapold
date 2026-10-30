<script>
function asd(priceId, userOId, approverType, statusType)
{		//alert(priceId);	
		//alert(userOId);	
		//alert(approverType);	
		//alert(statusType);	
		document.location.href = "supportApprove.jsp?priceid="+priceId+"&appType="+approverType+"&statusType="+statusType;
		//var frmObj = document.priceApprovalMain;
		//frmObj.action="../common/supportApprove.jsp?priceid="+priceId+"&appType="+approverType+"&statusType="+statusType;
		//frmObj.submit();


}
</script>
<%
	String priceId      = request.getParameter("priceId");

	String userOId      = request.getParameter("userOId");

	String approverType = request.getParameter("approverType");
	
	String statusType = request.getParameter("statusType");

	String buyerEmailaddress = request.getParameter("creatorEmailid");

	//out.println("buyerEmailaddress: "+buyerEmailaddress );
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL NEWSPRINT - REMARKS</title>
<script Language="JavaScript" src="../jscripts/newsprint.js"></script>
<script Language="JavaScript" src="jscripts/fieldCheck.js"></script>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
<table cellpadding="0" cellspacing="0" width="40%">
<form name="postRemarksForm" method="post" action="#">
<tr><td><textarea name="remarksContainer" cols="40" rows="8" maxlength="100" onkeydown="textCounter(document.postRemarksForm.remarksContainer,'lineCountDescription',100)" onkeyup="textCounter(document.postRemarksForm.remarksContainer,'lineCountDescription',100)" ></textarea>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="lineCountDescription" width="10%" class="small">100</td><td align="left" class="small">&nbsp;Characters Left</td></tr></table></div>
</td></tr>
<tr><td height="10"></td></tr>
<tr><td height="20" align="center"><%if(statusType.equals("X")){%><a href="#" onclick="postRemarksnp('<%=priceId%>',<%=userOId%>,'<%=approverType%>','<%=statusType%>','<%=buyerEmailaddress%>')"><img src="../images/post.jpg" border="0"></a></td><%}else{%><a href="#" onclick="postRemarksnp1('<%=priceId%>',<%=userOId%>,'<%=approverType%>','<%=statusType%>','<%=buyerEmailaddress%>')"><img src="../images/post.jpg" border="0"></a><%}%></tr>
<tr><td height="5"></td></tr>
<tr><td height="15" class="small" id="poststatus" align="center"></td></tr>

</form>
</table>
</center>
</body>