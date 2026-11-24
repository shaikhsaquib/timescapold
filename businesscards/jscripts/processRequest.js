function validate(listSize){

	frmObj = document.frmProcessRequest;

	for (ii=0;ii<listSize;ii++)
	{
		var select = eval("frmObj.select"+ii);

		if (select.checked)
		{	
			break;
		}
	}
	if(ii==listSize)
	{
		alert("plesae select atleast one request to submit !!");
		return;
	}

/*	for (ii=0;ii<listSize;ii++)
	{
		var remark = eval("frmObj.remarks"+ii);
		var select = eval("frmObj.select"+ii);

		if (select.checked){
			if (remark.value==null || remark.value=='')
			{
				alert("plesae select Remark field !!");
				remark.focus();
				return;
			}
		}
	}
*/
	frmObj.action="../processor/processRequestPreview.jsp";
	frmObj.submit( );

}

function clear( ){
	frmObj = document.frmProcessRequest;
	frmObj.reset( );
}


function validateVendor(listSize){

	frmObj = document.frmProcessRequest;	
	var valSelected = 0;	

	for (ii=0;ii<listSize;ii++)
	{
		var select = eval("frmObj.select"+ii);
		if (select.checked)
		{
			valSelected = 1;      
			var cardType = eval("frmObj.cardType"+ii).value;
		
			if(cardType=='0')
			{
				alert("Please select Card Type !!!");
				eval("frmObj.cardType"+ii).focus();
				return;
			}
			eval("frmObj.crdType"+ii).value=cardType;
			//alert(eval("frmObj.crdType"+ii).value);

			var challanNo = eval("frmObj.chlNo"+ii).value;			
			if (challanNo==null || challanNo=='')
			{
				alert("Please select Challan Number !!!");
				eval("frmObj.chlNo"+ii).focus();
				return;
			}

			var challandate = eval("frmObj.date"+ii).value;			
			if (challandate==null || challandate=='')
			{
				alert("Please select Challan Date !!!");
				eval("frmObj.date"+ii).focus();
				return;
			}
		}
	}

	if(valSelected==0)
	{
		alert("Please select atleast one request to submit !!!");
		return;
	}
	
	frmObj.action="../vendor/processRequestPreview.jsp";
	frmObj.submit( );

}