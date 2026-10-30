function showData(frm,pageName){

	//alert(frm+'--'+pageName);

	frmObj = document.frmViewRequests;

	params="arg=0";

	if(frm==1){

		params ="arg=1";
		//gatepassId = document.getElementById("gatepassId").value;
		gatepassId = trim(frmObj.gatepassId.value);
		fromDate = trim(frmObj.fromDate.value);
		toDate = trim(frmObj.toDate.value);
		type = trim(frmObj.type.value);
		reqStatus = trim(frmObj.reqStatus.value);
		department = trim(frmObj.department.value);

		if(gatepassId!=''){
			params+="&gatepassId="+gatepassId;
		}

		if(fromDate!=''){
			params+="&fromDate="+fromDate;
		}

		if(toDate!=''){

			if(fromDate==''){
				
				alert("Please select From Date!!");
				return;
			}

			params+="&toDate="+toDate;
		}

		if(type!=''){
			params+="&type="+type;
		}

		if(reqStatus!=''){
			params+="&reqStatus="+reqStatus;
		}

		if(department!=''){
			params+="&department="+department;
		}
		
	}

	if(pageName =='user'){

		//alert("rand="+Math.random());

		loadURL("../user/viewRequestsContainer.jsp?"+params, "showRequests", "Requests Loading...");

	}else if(pageName =='reviewer'){

		//alert("rand="+Math.random());

		loadURL("../reviewer/reviewRequestsContainer.jsp?"+params, "showRequests", "Requests Loading...");

	}else if(pageName =='approver'){

		//alert("rand="+Math.random());
		loadURL("../approver/approveRequestsContainer.jsp?"+params, "showRequests", "Requests Loading...");

	}
	/*else if(pageName =='4'){

		loadURL("../reviewer/reviewRequestsContainer.jsp?"+params+"&rand="+Math.random(), "showRequests", "Requests Loading...");

	}*/
	else if(pageName =='processor'){

		//alert("rand="+Math.random());
		loadURL("../processor/processRequestsContainer.jsp?"+params, "showRequests", "Requests Loading...");
	} else if(pageName =='report'){

		//alert("rand="+Math.random());
		loadURL("../processor/reportContainer.jsp?"+params, "showRequests", "Requests Loading...");
	} else if(pageName =='viewInwardUser'){

		//alert("rand="+Math.random());
		loadURL("../user/viewInwardRequestsContainer.jsp?"+params, "showRequests", "Requests Loading...");
	}else if(pageName =='approveInwardRequest'){

		//alert("rand="+Math.random());
		loadURL("../approver/approveInwardRequestsContainer.jsp?"+params, "showRequests", "Requests Loading...");
	}else if(pageName =='processorInwardRequest'){

		//alert("rand="+Math.random());
		loadURL("../processor/processInwardRequestsContainer.jsp?"+params, "showRequests", "Requests Loading...");
	}
	else if(pageName =='processorViewInwardRequest'){

		//alert("rand="+Math.random());
		loadURL("../processor/viewInwardRequestsContainer.jsp?"+params, "showRequests", "Requests Loading...");
	}
	
}



function loadURL(fragment_url, element_id, for_what){

	//alert("rand="+Math.random());

    var xmlhttp = "";
    if (window.XMLHttpRequest){
        // code for Mozilla, etc.
        xmlhttp=new XMLHttpRequest();
    }else if (window.ActiveXObject){ 
        // code for IE
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        alert("Sorry Your Browser is not Supported");
    }
    var element = document.getElementById(element_id);

	//document.getElementById(element_id).style.display = 'none';
	//alert(element);


    var message = "";
    var processingRequest='<table width="100%" height="100%"><tr><td align="center" height="20" class="bigblue"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+'</td></tr></table>';
        
    //alert(processingRequest+"rand="+Math.random());
    element.innerHTML = processingRequest;
	//element.innerHTML = '<td colspan=8 align="center" height="20" class="bigblue"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+'</td>';

    try{
        xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){

				//alert("true");
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
                   
				//alert(message);
				/*if(for_what=="Status Loading..."){
					//alert("true");
					id = element_id.substring(element_id.length-2);
					alert(id);
					element = document.getElementById("updateInfo"+id);
					alert(element);

				}*/

				element.innerHTML = message;

             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){

		alert("Can't connect to server:\n" + e.toString());
	 }
}


function updateAction(spId, flag, gatepassId, pageName, type){
	//alert("jkhk");
	frmObj = document.frmViewRequests;

	if(pageName == 'reviewer')
	{
		authrisedemailid = frmObj.authrisedemailid.value;
	}else
	{
		authrisedemailid = '0';
	}

	if(flag == 'PA')

	{  
		remarks = "NA"
	}
	else
	{
		remarks = frmObj.remarks.value;
		
	   stat = checkNull("remarks", remarks);
		
		if(!stat){
		frmObj.remarks.focus();
		return;
		}
	}

	
	

	loadURL("../common/updateAction.jsp?gatepassId="+gatepassId+"&pageName="+pageName+"&flag="+flag+"&spId="+spId+"&type="+type+"&remarks="+remarks+"&authrisedemailid="+authrisedemailid, "result"+spId, "Status Loading...");
	
	//showData('1',pageName);
	//var t = setTimeout("hideRow("+spId+")",2000);
	if(spId=='0'){
		//alert("true");
		createdBy = frmObj.createdBy.value;
		//alert(createdBy);
       // printDetails('0','<%=accept%>', '<%=tmpArr[0]%>', '<%=pageName%>', '<%=type%>', '<%=createdBy%>');

		window.setTimeout("location.reload(true);opener.location.reload(true);",1500);

	}else{
		window.setTimeout("showData('1','"+pageName+"')",1500);
	}

}




function updatePrintAction(spId, gatepassId, pageName, flag, type){
	//alert("spId"+spId);
	//alert("gatepassId"+gatepassId);
	//alert("pageName"+pageName);
	//alert("flag"+flag);
	//alert("type"+type);
	
	
	//........................//.........................//..........////////////.......
	
	var size = document.getElementById('size').value;
	for(i =0; i< size; i++){
		
		var serialno = document.getElementById("serialno"+i).value;
		//alert("serialno"+serialno);
		var securityRemarks = document.getElementById("securityRemarks"+i).value;
		document.getElementById("securityRemarks" +i).disabled = false;
		//alert("securityRemarks"+securityRemarks);
		
	}

	frmObj.action = "../common/updatePrintAction.jsp?spId="+spId+"&gatepassId="+gatepassId+"&pageName="+pageName+"&flag="+flag+"&type="+type+"&serialno="+serialno+"&securityRemarks="+securityRemarks;

	frmObj.submit();

}


function doEvent(spId, gatepassId,pageName,flag){ 

	loadURL("../common/updateAction.jsp?gatepassId="+gatepassId+"&pageName="+pageName+"&flag="+flag, "result"+spId, "Status Loading...");
}

function hideRow(id){

	//alert("hello"+id);

	document.getElementById("updateinfo").style.display = 'none';
}

function showDetails1(gatepassId, pageName, createdBy){
	
	
	alert("abc"+gatepassId);
	url = "../common/retRequestDetails.jsp?gatepassId="+gatepassId+"&pageName="+pageName+"&createdBy="+createdBy;
	win = window.open(url, "RequestDetails", "top=50,left=100,width=800,height=600,scrollbars=yes,status=no,resizable=yes");
}


function showDetails(gatepassId, pageName, createdBy, status, type){
	
	//alert("xyz"+gatepassId);
	if(pageName == 'processor' && status == 'PA')
	{
		url = "../common/retRequestDetails.jsp?gatepassId="+gatepassId+"&pageName="+pageName+"&createdBy="+createdBy+"&type="+type;
	}
	else{
	url = "../common/requestDetails.jsp?gatepassId="+gatepassId+"&pageName="+pageName+"&createdBy="+createdBy+"&type="+type;
	
	}
	win = window.open(url, "RequestDetails", "top=10,left=100,width=800,height=650,scrollbars=yes,status=no,resizable=yes");
}


function printDetails(spId, flag, gatepassId, pageName, type,createdBy) {


	url = "../common/printRequestDetails.jsp?gatepassId="+gatepassId+"&pageName="+pageName+"&flag="+flag+"&spId="+spId+"&type="+type+"&createdBy="+createdBy;
	win = window.open(url,'RequestDetails','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=700,height=650,top=10,left=100');

}

function reloadWin()
{
	//alert("m in");
	self.opener.reload();
	self.reload();
}

function printNClose() {

	self.opener.location.reload();
	window.print();
	self.close();
}

function printMe(flag, gatepassId, pageName, type, createdBy){
	window.setTimeout("printDetails('0','"+flag+"','"+gatepassId+"','"+pageName+"','"+type+"','"+createdBy+"')",500);
}

function editDetails(gatepassId,type, pageName, createdBy, status){
	
	//alert(status);
	if(status == 'UC')
	{
		url = "../user/editUserRequestDetails.jsp?gatepassId="+gatepassId+"&type="+type+"&pageName="+pageName+"&createdBy="+createdBy+"&status="+status;

		win = window.open(url, "RequestDetails", "top=10,left=100,width=800,height=650,scrollbars=yes,status=no,resizable=yes");
	
	}else if(status == 'RA')
	{
		url = "../user/editReviewerRequest.jsp?gatepassId="+gatepassId+"&type="+type+"&pageName="+pageName+"&createdBy="+createdBy+"&status="+status;

		win = window.open(url, "RequestDetails", "top=10,left=100,width=800,height=650,scrollbars=yes,status=no,resizable=yes");

	}
}


/*function showReport()
{

	frmObj = document.frmViewRequests;
	
	fromDate = frmObj.fromDate.value;
	toDate = frmObj.toDate.value;
	type = frmObj.type.value;
	reqStatus = frmObj.reqStatus.value;	

	loadURL("../processor/reportContainer.jsp?fromDate="+fromDate+"&toDate="+toDate+"&type="+type+"&reqStatus="
	+reqStatus, "showRequests", "Requests Loading...");

	//frmObj.action ="../processor/reportContainer.jsp?fromDate="+fromDate+"&toDate="+toDate+"&type="+type+"&reqStatus="+reqStatus;

	//frmObj.submit();
  
}*/


function downloadReport(fromDate,toDate,type,reqStatus,locnCode)
{
	frmObj = document.frmViewRequests;

	url = "../common/downloadReportsAll.jsp?fromDate="+fromDate+"&toDate="+toDate+"&type="+type+"&reqStatus="+reqStatus+"&locnCode="+locnCode;

	win = window.open(url, "ReportDetails", "top=10,left=100,width=800,height=650,scrollbars=yes,status=no,resizable=yes"); 
}

function showReport()
{
	
	frmObj = document.frmViewRequests;	
	fromDate = frmObj.fromDate.value;
	toDate = frmObj.toDate.value;
	type = frmObj.type.value;
	reqStatus = frmObj.reqStatus.value;	
	locnCode = frmObj.locnCode.value;
	
	frmObj.action ="../processor/reportContainer.jsp?fromDate="+fromDate+"&toDate="+toDate+"&type="+type+"&reqStatus="+reqStatus+"&locnCode="+locnCode;

	frmObj.submit();
  
}

function showDeptReport()
{

	frmObj = document.frmDeptReport;
	
	fromDate = frmObj.fromDate.value;
	toDate = frmObj.toDate.value;
	type = frmObj.type.value;
	reqStatus = frmObj.reqStatus.value;	

	frmObj.action ="../user/deptReportContainer.jsp?fromDate="+fromDate+"&toDate="+toDate+"&type="+type+"&reqStatus="+reqStatus;

	frmObj.submit();
  
}


function downloadDeptReport(fromDate,toDate,type,reqStatus)
{
	frmObj = document.frmUserDeptRequests;

	url = "../common/downloadDeptReportAll.jsp?fromDate="+fromDate+"&toDate="+toDate+"&type="+type+"&reqStatus="+reqStatus;

	win = window.open(url, "ReportDetails", "top=10,left=100,width=800,height=750,scrollbars=yes,status=no,resizable=yes"); 
}


function downloadUserReport(fromDate,toDate,type,reqStatus,department)
{
	//alert("hi");
	frmObj = document.frmViewRequests;

	url = "../common/downloadUserReport.jsp?fromDate="+fromDate+"&toDate="+toDate+"&type="+type+"&reqStatus="+reqStatus;

	win = window.open(url, "ReportDetails", "top=10,left=100,width=800,height=750,scrollbars=yes,status=no,resizable=yes"); 

}
