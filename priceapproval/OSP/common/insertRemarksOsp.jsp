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
	String company = request.getParameter("company");
    //String flag   ="N";
	//System.out.println("statusType: "+approverType );
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL  - REMARKS</title>
<link href="/timescape/sapep/employeeselfservice/priceapproval/OSP/css/global.css" rel="stylesheet" type="text/css" />
<script src="/timescape/sapep/employeeselfservice/priceapproval/OSP/jscripts/jquery.js"language="javascript"></script>
<script src="/timescape/sapep/employeeselfservice/priceapproval/jscripts/osp.js"language="javascript"></script>
</head>
<body>
<center>
<table cellpadding="0" cellspacing="0" width="40%">
<form name="postRemarksForm" method="post" action="#">
<tr><td><textarea name="remarksContainer" cols="60" rows="12" maxlength="2000" onkeydown="textCounter(document.postRemarksForm.remarksContainer,'lineCountDescription',2000)" onkeyup="textCounter(document.postRemarksForm.remarksContainer,'lineCountDescription',2000)" ></textarea>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="lineCountDescription" width="10%" class="small">2000</td><td align="left" class="small">&nbsp;Characters Left</td></tr></table></div>
</td></tr>
<tr><td height="10"></td></tr>
<tr><td height="20" align="center"><%if(statusType.equals("X")){%><a href="#" onclick="postRemarksOsp('<%=priceId%>',<%=userOId%>,'<%=approverType%>','<%=statusType%>','<%=company%>')"><img src="../images/post.jpg" border="0"></a></td><%}else{%><a href="#" onclick="postRemarksOsp1('<%=priceId%>',<%=userOId%>,'<%=approverType%>','<%=statusType%>','<%=company%>')"><img src="../images/post.jpg" border="0"></a><%}%></tr>
<tr><td height="5"></td></tr>
<tr><td height="15" class="small" id="poststatus" align="center"></td></tr>
<!-- <input type="hidden" name="flag" value="<%//=flag%>"> -->
</form>
</table>
</center>
</body>