function go()
{
	
	
		frmObj = document.frmSelectClaim;
		//alert("hii"+frmObj);
		
		//var url = ../requestor/createRequest.jsp;
		frmObj.action = "../requestor/createRequest.jsp";
		frmObj.submit();

}