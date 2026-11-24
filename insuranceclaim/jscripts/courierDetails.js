function checkCourierDetail(){
	frmObj = document.frmCourierDetails;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
/*--------------Courier Number check begins--------------*/
	courierNumber = Trim(frmObj.courierNumber.value);
	stat = checkNull("POD Number",courierNumber);

	if(!stat){
	frmObj.courierNumber.focus();
	return;
	}

	stat = checkAmt("POD Number" , courierNumber , num);
	
	if(!stat){
		frmObj.courierNumber.focus();
		return;
	}
/*--------------Courier Number check Ends--------------*/

/*--------------Courier Name check begins--------------*/
	courierName = Trim(frmObj.courierName.value);
	stat = checkNull("Courier Name",courierName);

	if(!stat){
	frmObj.courierName.focus();
	return;
	}

	stat = checkJunk("Courier Name" , courierName, junk);
	
	if(!stat){
		frmObj.courierName.focus();
		return;
	}

	stat = checkNumInName("Courier Name" , courierName, num);
	
	if(!stat){
		frmObj.courierName.focus();
		return;
	}
/*--------------Courier Name check Ends--------------*/

/*--------------Courier Date check begins--------------*/
	courierDate = Trim(frmObj.courierDate.value);
	stat = checkNull("Courier Date",courierDate);

	if(!stat){
	frmObj.courierDate.focus();
	return;
	}
/*--------------Courier Date check Ends--------------*/

/*--------------Courier Remark check begins--------------*/
	courierRemark = Trim(frmObj.courierRemark.value);
	stat = checkNull("Courier Remark",courierRemark);

	if(!stat){
	frmObj.courierRemark.focus();
	return;
	}
/*--------------Courier Remark check Ends--------------*/

	
	frmObj.action = "../common/courierDetailsSubmit.jsp";
	frmObj.submit();
}

function next(){
	frmObj = document.frmUpdateCourierDetails;

	frmObj.action = "../approver/processCourierDetails.jsp";
	frmObj.submit();

}

function return_to_user(){
	frmObj = document.frmProcessCourierDetails;

	approverRemark = frmObj.approverRemark.value;

	stat = checkNull("Remark",approverRemark);
	if(!stat){
		frmObj.approverRemark.focus();
		return;
	}
	frmObj.hiddButtonValue.value = "0";

	frmObj.action = "../approver/processCourierDetailsSubmit.jsp";
	frmObj.submit();

}

function processClaim(){
	frmObj = document.frmProcessCourierDetails;

	approverRemark = frmObj.approverRemark.value;

	stat = checkNull("Remark",approverRemark);
	if(!stat){
		frmObj.approverRemark.focus();
		return;
	}
	frmObj.hiddButtonValue.value = "1";

	frmObj.action = "../approver/processCourierDetailsSubmit.jsp";
	frmObj.submit();

}