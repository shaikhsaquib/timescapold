function showData(str)
{	
	var frmObj							= document.frmCreateFixedAsset;
	if(str == '0'){
		loadFragment1("../user/showFixedAssetDisposalRequest.jsp?type=Fixed Asset Disposal","showRequests","Form");

	}else if(str == '1')
	{
		var approvalsForm					= document.getElementById("approvalsForm").value;
		
		if(approvalsForm == 'Process Waste Sales')
		{
			loadFragment1("../user/showFixedAssetDisposalRequest.jsp","showRequests","Show Form");

		}else if(approvalsForm == 'Fixed Asset Disposal' || approvalsForm == 'One-off Miscellaneous' || approvalsForm == 'Damaged Newsprint Disposal')
		{
			
			loadFragment1("../user/showFixedAssetDisposalRequest.jsp?type="+approvalsForm,"showRequests","Form");
		}


	}
}

function loadFragment1(fragment_url, element_id, for_what) {
	var xmlhttp = "";
	if (window.XMLHttpRequest) {
		// code for Mozilla, etc.
		xmlhttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		// code for IE
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else {
		alert("Sorry Your Browser is not Supported");
	}
	var element = document.getElementById(element_id);
	//alert(element);
	var message = "";
	var processingRequest = '<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
	+ for_what + ' Loading...</span></div></td></tr></table>';
	$("#"+element_id).html(processingRequest);
	//element.innerHTML = processingRequest;
	try {
		xmlhttp.open("GET", fragment_url);
		xmlhttp.onreadystatechange = function(){
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var gotresponse = xmlhttp.responseText;
				message = gotresponse;
				//alert(message);
				$("#"+element_id).html(message);
				//element.innerHTML = message;
			}
		}
		xmlhttp.send(null);
	}// display an error in case of failure
	catch (e) {
		alert("Can't connect to server:\n" + e.toString());
	}
}
