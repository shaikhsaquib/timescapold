function add( )
	{
	frmObj = document.frmPreviewAdd;
	val = confirm("Do you wish to add these Vehicle Lease Reimbursement Bills? ");

	if(val){
		frmObj.action="../requestor/createRequest.jsp"
		frmObj.submit( );
			}
	else{
		return;
		}
}