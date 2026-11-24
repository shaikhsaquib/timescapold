function cancel(reqNo)
{
	frmObj = document.frmRequestCards;

	val = confirm("Do you wish to cancel this Business Card request ? ");

	if(val){
		//If "yes" then submit the page
		frmObj.action="../requestor/cancelRequestSubmit.jsp?id="+reqNo;
		frmObj.submit( );
	}else{
		return;
	}
}