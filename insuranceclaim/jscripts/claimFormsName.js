function selectClaimForm()
{
	frmObj = document.frmClaimForms;

	for (i=frmObj.claimForm.length-1; i > -1; i--) 
	{		
		if (frmObj.claimForm[i].checked) 
		{
			claimFormName = frmObj.claimForm[i].value;
			i = -1;	
		}		
	}
	self.opener.document.frmAcceptInsuranceClaim.claimFormValue.value = claimFormName;
    self.close();
    self.opener.focus();
}