/*function update(id, status){

	frmObj = document.frmReviewRequests;

	//alert(status);

	exp = eval("frmObj.updateStatus"+id);
	exp.value = status;
	frmObj.counter.value = id;
	size = frmObj.size.value;

	//alert(size);
	//alert(status+"__"+"rem"+id);
	//alert(document.getElementById("rem"+id).style.visibility);

	//alert(eval("frmObj.updateStatus"+id+".value"));

	if(status=='Reject'){

		for(i=0;i<size;i++){
			document.getElementById("rem"+i).style.visibility ="hidden"; 
        	document.getElementById("rem"+i).style.display = "none"; 
		}
		document.getElementById("rem"+id).style.visibility ="visible"; 
        document.getElementById("rem"+id).style.display = "block"; 
		return;
	}

	if(status=='RR'){

		remarks = document.getElementById("rejectRem"+id).value;
		document.getElementById("remarks"+id).value = remarks;
		//alert(document.getElementById("remarks"+id).value);
		if(remarks==''){
			alert("please enter remarks!");
			document.getElementById("rejectRem"+id).focus();
			return;
		}
	}

	
	//frmObj.action="../reviewer/reviewRequestsSubmit.jsp";
	frmObj.action="../reviewer/reviewRequestsSubmit.jsp?counter="+id;
	frmObj.submit();
}*/
function update(rows){

	frmObj = document.frmReviewRequests;
    var acceptarr = new Array();
	var rejectarr = new Array();
	var remarr = new Array();
	var a =0, r =0, rem = 0;
	
	for( i=0; i<rows;i++){
		
		if(document.getElementById('accept'+i).checked == true){
			document.getElementById("rem"+i).style.visibility ="visible";
			
			var requestId = document.getElementById("requestId"+i).value;
			acceptarr[a++] = requestId ;
			
		}
		if(document.getElementById('reject'+i).checked == true){
	    
	
			var requestId = document.getElementById('requestId'+i).value;
			
			 var remarr1  = document.getElementById('rejectRem'+i).value;
			
			
	
			if(remarr1.length == 0){
				alert("please enter remarks!");
				document.getElementById('rejectRem'+i).focus();
				return;
			
		}
		rejectarr[r++] = requestId;
		remarr [rem++] = remarr1;

	}
   			
   } 
   
	frmObj.acounter.value = acceptarr ;
	frmObj.rcounter.value = rejectarr;
	frmObj.remarr.value = remarr;
	frmObj.action="../reviewer/reviewRequestsSubmit.jsp?counter="+rows;
	frmObj.submit();
	
}

function showRemarksBox(index)
{
	if(document.getElementById('reject'+index).checked == true)
	{
		document.getElementById('rem'+index).style.display = "block";
	}
	else
	{
		document.getElementById('rem'+index).style.display = "none";
	}
}


function showRemarksBox1(index)
{
	
	if(document.getElementById('reject'+index).checked == true)
	{
		document.getElementById('req'+index).style.display = "block";
	}
	else
	{
		document.getElementById('req'+index).style.display = "none";
	}
}

function showDetails(requestId){
	
	
	url = "../common/requestDetails.jsp?requestId="+requestId;
	win = window.open(url, "RequestDetails", "width=600,height=600,scrollbars=yes,status=no,resizable=yes");
}


/*
function processRequest(id, status){
	frmObj = document.frmProcessRequests;

	//exp = eval("frmObj.requestId"+id);
	//requestId = exp.value ;
	//alert(id+"--"+status);
	//alert(frmObj.updateStatus);

	exp = eval("frmObj.updateStatus"+id);
	exp.value = status;
	frmObj.counter.value = id;
	size = frmObj.size.value;

	//alert(frmObj.userRole.value);
	//alert(status);
	//alert(eval("frmObj.updateStatus"+id+".value"));
	
	if(status=='Reject'){

		for(i=1;i<=size;i++){
			document.getElementById("req"+i).style.visibility ="hidden"; 
        	document.getElementById("req"+i).style.display = "none"; 
		}
		document.getElementById("req"+id).style.visibility ="visible"; 
        document.getElementById("req"+id).style.display = "block"; 
		return;
	}

	 if(status=='DVR' || status=='DPR' || status=='DAR' || status=='DAHR' || status=='DBHR' || status=='DBHR' || status=='TVR' || status=='TPR' || status=='TAR' || status=='TAHR'){
		 remarks = document.getElementById("rejectReq"+id).value;
		document.getElementById("remarks"+id).value = remarks;
		document.getElementById("action"+id).value = 'Reject';
		if(remarks==''){
			alert("please enter remarks!");
			document.getElementById("rejectReq"+id).focus();
			return;
		}
	}

	frmObj.action="../processor/processRequestsSubmit.jsp?counter="+id;
	frmObj.submit();
}*/

/*function toggle(source) {
  alert(source);
  checkboxes = document.getElementsByName('accept');
  for each(var checkbox in checkboxes)
  checkbox.checked = source.checked;
}*/


function selectAll1(what) {

	frmObj = document.frmProcessRequests;

	var listSize = frmObj.size.value;
	

	for (var i = 1; i <=listSize;i++) 
	{
		if (what == "accept")
		{
			expr =  "frmObj.accept"+i+".checked=true";
			expr1 =  "frmObj.reject"+i+".checked=false";
			document.getElementById('req'+i).style.display = "none";
			
		}else{

			expr =  "frmObj.reject"+i+".checked=true";
			expr1 =  "frmObj.accept"+i+".checked=false";
			document.getElementById('req'+i).style.display = "block";
		}
		
		eval(expr);
		eval(expr1);
		
		
	}

}




function selectAll(what) {

	frmObj = document.frmReviewRequests;
	
	var listSize = frmObj.count.value;
	
	for (var i =0; i <listSize;i++) 
	{	
		if (what == "accept")
		{ 
			expr =  "frmObj.accept"+i+".checked=true";
			expr1 =  "frmObj.reject"+i+".checked=false";
			document.getElementById('rem'+i).style.display = "none";
			
		}else{

			expr =  "frmObj.reject"+i+".checked=true";
			expr1 =  "frmObj.accept"+i+".checked=false";
			document.getElementById('rem'+i).style.display = "block";
		}
		
		eval(expr);
		eval(expr1);
		
		
	}
}





function processRequest(rows){

	frmObj = document.frmProcessRequests;
	var acceptarr = new Array();
	var rejectarr = new Array();
	var remarr = new Array();
	var ast = new Array();
	var rst = new Array();
	var a =0;var r =0;var rem = 0;var astv = 0;var rstv = 0;
	
	for( i=1; i<=rows;i++){
		
		if(document.getElementById("accept"+i).checked == true && document.getElementById("reject"+i).checked == true)
		{
			alert("You Cannot Select Both The Options");
		}

		if(document.getElementById("accept"+i).checked == true)
		{

			document.getElementById("req"+i).style.visibility ="visible";

			var requestId = document.getElementById("requestId"+i).value;

			var aStatus  = document.getElementById("accept"+i).value;
			
	        acceptarr[a++] = requestId ;
			ast[astv++] = aStatus;
			
		}
		if(document.getElementById('reject'+i).checked == true){
	    
	
			var requestId = document.getElementById('requestId'+i).value;			
			var remarr1  = document.getElementById('rejectReq'+i).value;			
			var rStatus  = document.getElementById('reject'+i).value;
			
	
			if(remarr1.length == 0){
				alert("please enter remarks!");
				document.getElementById('rejectReq'+i).focus();
				return;			
			}
			rejectarr[r++] = requestId;
			remarr [rem++] = remarr1;
			rst[rstv++] = rStatus;

		}
   			
	}
	frmObj.acceptArr.value = acceptarr ;
	frmObj.rejectArr.value = rejectarr  ;
	frmObj.aStArr.value = ast ;
	frmObj.rStArr.value = rst ;
	frmObj.remArr.value = remarr ;
	frmObj.action="../processor/processRequestsSubmit.jsp?counter="+rows;
	frmObj.submit();

	
}



function rejectRequest(id, status, userRole, userRemarks)
{
	frmObj = document.frmProcessRequests;
	exp = eval("frmObj.requestId"+id);
	requestId = exp.value ;
	exp = eval("frmObj.noteType"+id);
	noteType = exp.value ;

	url = "../user/createRejectRemark.jsp?counter="+id+"&requestId="+requestId+"&updateStatus="+status+"&noteType="+noteType+"&userRole="+userRole+"&userRemarks="+userRemarks;

	win = window.open(url, "UserRemark", "top=200,left=500,width=450,height=150,scrollbars=no,status=no,resizable=no");
	
}

function processRejectRequest(counter){
	frmObj = document.frmCreateRejectRemark;
	exp = eval("frmObj.remarks"+counter);
	val = exp.value;
	stat = checkNull("remarks", val)
	if(!stat){
		exp.focus();
		return;
	}

	frmObj.action="../processor/processRequestsSubmit.jsp";
	frmObj.submit();
}

function call(obj){
	            var res=obj.value;
				exp = eval("document.frmReviewRequests.counter");
                for(var i=0;i<exp;i++)
                {
                      if(document.getElementById("accept"+i).value!=res )
                      {alert();
                       document.getElementById("reject"+i).checked=false;
                      }
				}
			}

function atoggle(index)
{
		if((document.getElementById("accept"+index).checked == true)){
			document.getElementById("reject"+index).checked = false;
			document.getElementById('rem'+index).style.display = "none";
		}
	
}

function rtoggle(index)
{
		if((document.getElementById("reject"+index).checked == true)){
			document.getElementById("accept"+index).checked = false;
			document.getElementById('rem'+index).style.display = "block";
		}
	
}


function atoggle1(index)
{
		if((document.getElementById("accept"+index).checked == true)){
			document.getElementById("reject"+index).checked = false;
			document.getElementById('req'+index).style.display = "none";
		}
	
}

function rtoggle1(index)
{
		if((document.getElementById("reject"+index).checked == true)){
			document.getElementById("accept"+index).checked = false;
			document.getElementById('req'+index).style.display = "block";
		}
	
}