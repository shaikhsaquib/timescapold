
function getselectedCompanies(){
	var content = $(".selectpicker").val();
	
	if(content == null){
		alert("Select atleast one company...");
		return;
	}
	var str = content.toString();
	str = str.replace(/,/g,'_');
	//alert(str);
	
	if(str.indexOf('1000') > -1){
		if(str !== '1000'){
			alert('\'BENNETT COLEMAN & CO. LTD\' company should be selected as single entity.');
			return;
		}
	}
	
	var yearSelected = $("#year").val();
	if(yearSelected == 0){
		alert("Year not selected.");
		return;
	}
	
	//alert(yearSelected);
	
	makeJqueryAjaxCall("loadUploadTable","../upload/displayUploadedFiles.jsp?comp="+str+"&year="+yearSelected);
}

function getZipFile(){
	var content = $(".selectpicker").val();
	var str = content.toString();
	str = str.replace(/,/g,'_');
	
	var yearSelected = $("#year").val();
	//load("../upload/zipDownload.jsp?comp="+str+"&year="+yearSelected);
	var url	= "../upload/zipDownload.jsp?comp="+str+"&year="+yearSelected;
	
	window.location.href = url;
}