function downloadReport( faYear, month, criteria ) {

	frmObj	=	document.frmCheckDetails;

	frmObj.action	=	"../common/downloadReport.jsp?faYear="+faYear+"&month="+month+"&criteria="+criteria;


	frmObj.submit();
}


function downloadPendingReport( faYear, month, criteria ) {

	frmObj	=	document.frmApproveLta;

	frmObj.action	=	"../common/downloadReport.jsp?faYear="+faYear+"&month="+month+"&criteria="+criteria;


	frmObj.submit();
}