function settleClaim1(){
	frmObj = document.frmSettleInsuranceClaim;
	var num = "0123456789";
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";

	/* check for cheque name begins */
		chequeName = frmObj.chequeName.value;

		stat = checkNull("Cheque Name", chequeName);

		if(!stat){
			frmObj.chequeName.focus();
			return;
		}

		/*stat = checkJunk("Cheque Name" , chequeName, junk);
	
		if(!stat){
			frmObj.chequeName.focus();
			return;
		}*/
/* 7/11/2012 checkNum is commented for 'A2Z Company'   */
		/*stat = checkNumInName("Cheque Name" , chequeName, num);
		
		if(!stat){
			frmObj.chequeName.focus();
			return;
		}*/
	/* check for chequeNumber ends */

	/* check for chequeNumber begins */
		chequeNumber = frmObj.chequeNumber.value;

		stat = checkNull("Cheque Number", chequeNumber);

		if(!stat){
			frmObj.chequeNumber.focus();
			return;
		}

		stat = checkAmt("Cheque Number" , chequeNumber , num);
	
		if(!stat){
			frmObj.chequeNumber.focus();
			return;
		}
	/* check for chequeNumber ends */

	/* check for chequeAmount begins */
		chequeAmount = frmObj.chequeAmount.value;

		stat = checkNull("Cheque Amount", chequeAmount);

		if(!stat){
			frmObj.chequeAmount.focus();
			return;
		}

		stat = checkAmt("Cheque Amount" , chequeAmount , num);

		if(!stat){
			frmObj.chequeAmount.focus();
			return;
		}

		stat1= parseFloat(frmObj.chequeAmount.value);
		
		if(stat1 < 1){
			alert("The Amount must be greater than 0");
			frmObj.chequeAmount.focus();
			return;
		}
	/* check for chequeAmount ends */

	/* check for chequeDate begins */
		chequeDate = frmObj.chequeDate.value;

		stat = checkNull("Cheque Date", chequeDate);

		if(!stat){
			frmObj.chequeDate.focus();
			return;
		}
	/* check for chequeDate ends */

	/* check for settleRemark begins */
		settleRemark = frmObj.settleRemark.value;

		stat = checkNull("Remark", settleRemark);

		if(!stat){
			frmObj.settleRemark.focus();
			return;
		}
	/* check for settleRemark ends */


	frmObj.action = "../approver/settleInsuranceClaimSubmit.jsp";
	frmObj.submit();


}

