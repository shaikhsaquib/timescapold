function courierProcessorRequest(kk,id)

{
	frmObj = document.frmSearchRequest;
	exp = "frmObj.action"+kk+".options[frmObj.action"+kk+".selectedIndex].value";
	actionVal = eval(exp);
	frmObj.actionN.value = actionVal;

	frmObj.requestId.value = id;

	frmObj.action="../processor/processorCourierContainer.jsp";
	frmObj.submit( );

}
