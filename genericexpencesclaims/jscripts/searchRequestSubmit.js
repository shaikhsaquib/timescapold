function legacyData(txnId,compCode,payId,effMonth,claimAmt)
{
	frmObj = document.frmSearchRequestSubmit;

	frmObj.txnId.value			= txnId;
	frmObj.compCode.value	= compCode;
	frmObj.payId.value			= payId;
	frmObj.effectiveMonth.value = effMonth;
	frmObj.claimAmount.value	= claimAmt;

	frmObj.action = "../processor/viewRequest.jsp";
	frmObj.submit( );
}