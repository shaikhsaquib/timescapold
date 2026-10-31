function createRequest()
{
	frmObj = document.frmprojectApprovalsApplyPreview;
	alert("test");


	frmObj.action = "../user/projectApprovalsSubmit.jsp";
	frmObj.submit( );
}
