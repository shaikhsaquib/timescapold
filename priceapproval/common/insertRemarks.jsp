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
<title>PRICE APPROVAL  - REMARKS</title>
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
</head>
<body onload="onLoadDetail('1','postRemarksForm','<%=priceId%>');">
<center>
<table cellpadding="0" cellspacing="0" width="40%">
<form name="postRemarksForm" method="post" action="#">
<tr><td><textarea name="remarksContainer" id = "remarksContainer" cols="60" rows="12" maxlength="2000" onkeydown="textCounter(document.postRemarksForm.remarksContainer,'lineCountDescription',2000)" onkeyup="textCounter(document.postRemarksForm.remarksContainer,'lineCountDescription',2000)" onfocus="onLoadDetail('1','postRemarksForm','<%=priceId%>');" ></textarea>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="lineCountDescription" width="10%" class="small">2000</td><td align="left" class="small">&nbsp;Characters Left</td></tr></table></div>
</td></tr>
<tr><td height="10"></td></tr>
<%
	if (userOId.equals("45450")){
		//out.println("statusType: "+approverType );
%>
<!-- 	<tr><td align="left" class="small">Attach MD approval mail</td></tr>
 -->	<!-- <td height="22" align="left" valign="top"><textarea name="attach1" type="text" cols="20" class="small" id="attach1" value="" readonly="readonly"></textarea><a href="#" onclick="uploadMD('attach1','<%=priceId%>')"><img src="../images/attachment.gif" border="0" /></a><span class="redsmall" valign="top">&#42&nbsp;</span><a href="javascript:void(0)" onclick="delAttach1('1')"><img src="../images/delete.gif" border="0" /></a><input name="attach1New" type="hidden" id="attach1New" value="" /></td> -->
	<tr><td colspan="2"  align="left" class="small" > Click on image to MD approval mail <a href="javascript:attachmentFile('additional','0','postRemarksForm','<%=priceId%>');" name = "mdapproval" ><img src="../images/attachment.gif" border="0" /></a> </td><td colspan="2" ></td></tr>
	<tr align="left" class="small" id="attachment1"></tr>
<%	}
%>
<tr>
    <td height="20" align="center">
        <%if(statusType.equals("X")){%><input name="remarksPost" onclick="postRemarks('<%=priceId%>',<%=userOId%>,'<%=approverType%>','<%=statusType%>','<%=company%>')"
  type="button" class="bold" id="remarksPost" value="Post"/>
<%}else{%><input name="remarksPost" onclick="postRemarks('<%=priceId%>',<%=userOId%>,'<%=approverType%>','<%=statusType%>','<%=company%>')"
  type="button" class="bold" id="remarksPost" value="Post"/><%}%></tr>
<tr><td height="5"></td></tr>
<tr><td height="15" class="small" id="poststatus" align="center"></td></tr>
<input type="hidden" name="remarks" value="">
</form>
</table>
</center>
</body>