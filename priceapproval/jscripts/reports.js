function isEmpty(length)
{
  	if(parseInt(length)==0)
	{
		return true;
	}
}



function getData1()
{
	
	
	var error = "";
	var flag  = 0;
	var status1="";

	var frmObj = document.priceApprovalReports;

	var category = document.getElementById("category").value;
	var fromdate = document.getElementById("fromdate").value;
	//alert("fromdate--"+fromdate);
	var todate = document.getElementById("todate").value;
	var status = document.getElementById("status").value;
	var month = document.getElementById("month").value;
	var year = document.getElementById("year").value;
	//var flag3 = document.getElementById("flag3").value;
	//alert("flag3--"+flag3);
	
	status1 = status;



	/*if( status.toString().indexOf(',') != -1 )
	{
		var strs = status.toString().split(',');
		for(var i =0; i<strs.length; i++)
		{
			StatStr = strs[i];
			status1 = status1+"'"+StatStr+"',"
		}
	}else
	{
		status1 = "'"+status+"',";
	}*/

	//status1 = status1.substring(0, status1.length - 1);
	



	

	/*var e = document.getElementById("month");
        var optionSelIndex = e.options[e.selectedIndex].value;


		var e1 = document.getElementById("year");
        var optionSelIndex1 = e.options[e.selectedIndex].value;*/

	//if((isEmpty(document.priceApprovalReports.category.value.length)) || (isEmpty(document.priceApprovalReports.fromdate.value.length)) || (isEmpty(document.priceApprovalReports.todate.value.length)) || (isEmpty(document.priceApprovalReports.status.value.length)) )
	//if(((document.priceApprovalReports.category.value == "0")) && ((document.priceApprovalReports.fromdate.value == "0")) && ((document.priceApprovalReports.todate.value == "0")) && (isEmpty(document.priceApprovalReports.status.value == "0")) )
	//{

//	document.getElementById("status").selectedIndex = "0";
		

		//if( category == "0")
		if( document.getElementById("category").selectedIndex == 0)
			{		
			//error += "Please Select  criteria\n";
			alert("Please select Category\n");		
			document.getElementById("category").focus();
			//frmObj.category.focus();
			return ;
			}

		 if(status == "0"){
				//error += "Please Select  criteria\n";
				alert("Please select Status\n");
				document.getElementById("status").focus();
				return ;
			}

			if((fromdate == "" || fromdate == null)  && (todate == "" || todate == null) && month  == "0"  && year == "0" )
			{
				alert("Please select either From date and To date Or Month and Year Combination");
				document.getElementById("fromdate").focus();
				return ;

			}

			// if((!fromdate == "" || !fromdate == null)  && (todate == "" || todate == null) && (month  == "" || month == null)  && (year == "" || year == null))
			 if(!fromdate == ""   && todate == ""  )
			{
				alert("Please select To Date");
				//alert("Please Select either From date and To date Or Month and Year Combination");
				document.getElementById("todate").focus();
				return ;
				

			}

			//else if( todate != ""  && month  == "" || month == null  && year == "" || year == null)
			else if( todate != "" && fromdate == "" )
			{
				alert("Please select From Date");
				//alert("Please Select either From date and To date Or Month and Year Combination");
				document.getElementById("fromdate").focus();
				return ;

			}


			//else if (fromdate == "" || fromdate == null  && todate == "" || todate == null && month  != "" || month != null  && year == "" || year == null)
			else if  ((fromdate == "" || fromdate == null) && (todate == "" || todate == null) && !month  == "0"    && year == "0" )
			//else if  (optionSelIndex  != "0"    && optionSelIndex1 == "0" )
			{
				alert("Please select Year");
				//alert("Please Select either From date and To date Or Month and Year Combination");
				document.getElementById("year").focus();
				return ;
			}

			//else if  (optionSelIndex  == "0"  && optionSelIndex1 != "0"  )
			else if((fromdate == "" || fromdate == null) && (todate == "" || todate == null) && month  == "0"    && !year == "0" )
			{
				alert("Please select Month");
				//alert("Please Select either From date and To date Or Month and Year Combination");
				document.getElementById("month").focus();
				return ;
			}

			/*if(!fromdate == ""   && !todate == "")
			{

				var frmDate = dateFormat(fromdate);//new Date();
				var	toDate 	=  dateFormat(todate);
				//alert("frmDate"+frmDate);
				//alert("toDate"+toDate);

				
				var dayDiff = validatePeriod(toDate, frmDate);
			//	alert(dayDiff);
				

				
				//if(todate > fromdate )
				if(dayDiff < 0)
				{
					alert("From date can not be greater than To date. ");
					document.getElementById("fromdate").focus();
				return ;
				}

					
				}*/


				//function isFromBiggerThanTo(dtmfrom, dtmto){
					



			/*else (fromdate == ""   && todate == ""  && month  == "0"   && year == "0" )
			{
				alert("Please Select either From date and To date Or Month and Year Combination");
				document.getElementById("fromdate").focus();
				return ;
			}*/






			/*if(fromdate ==""    || month == "" )
			{
				//alert("month--"+month);
				
			alert("Please Select either From date and To date Or Month and Year Combination");
			document.getElementById("fromdate").focus();
			return ;
			}




			 if(todate == "" || todate == null   ){
				
				alert("Please enter To Date ");
				document.getElementById("todate").focus();
				return  ;
			}
			


			/*if( todate == '' || todate == null){
				alert("Please enter To Date");
				document.getElementById("todate").focus();
				return false;
			}*/

			/*else if(month == "" || month == null &&  year == "" || year == null){
				alert("3");
				alert("Please select Month And Year");
				return;

			}*/


			/*else(fromdate =="" ||fromdate == null || todate == "" || todate == null  && month == "" ||  year == "" )
	{
			alert("Please Select either From date and To date Or Month and Year Combination");
			document.getElementById("fromdate").focus();
				return false;
	}*/

	

			if(!fromdate == ""   && !todate == "")
			{
				//alert("hii"+fromdate);
				//alert("todate"+todate);
			fromDates       = dateFormat(fromdate);
            toDates         = dateFormat(todate);
		//	alert("fromDates--"+fromDates);
		//	alert("toDates--"+toDates);
			  if(toDates < fromDates ){
				  alert("To Date cannot be earlier than From Date! ");
				document.getElementById("fromdate").focus();
				return ;
			  }
			}
			

	//else
//	{
		
		//randome = Math.random();
		//alert("Hello");
		///loadFragment("getReportData.jsp?randome="+randome+"&category="+category+"&fromdate="+fromdate+"&todate="+todate+"&status="+status,'showRequests','Showing All Fields');
		loadFragment1("getReportData.jsp?category="+category+"&fromdate="+fromdate+"&todate="+todate+"&status="+status1+"&month="+month+"&year="+year,'showRequests','Showing All Fields');

		
		
		
//	}



}


function downloadReport()
{
	
	frmObj = document.priceApprovalReportsData;

	var status = document.getElementById("status").value;
	var category = document.getElementById("category").value;
	var fromdate = document.getElementById("fromdate").value;
	var todate = document.getElementById("todate").value;
	var month = document.getElementById("month").value;
	//alert("month--"+month);
	var year = document.getElementById("year").value;
	//var searchDate = document.getElementById("searchDate").value;
	var year = document.getElementById("year").value;
	//alert("searchDate"+searchDate);
	//var test = document.getElementById("totalrequest").value;
	//alert("test---"+test);
//alert("hi");


	//url = "downloadPriceReport.jsp?category="+category+"&fromdate="+fromdate+"&todate="+todate+"&status="+status;
	url = "downloadPriceReport.jsp?category="+category+"&fromdate="+fromdate+"&todate="+todate+"&status="+status+"&month="+month+"&year="+year;

	win = window.open(url, "ReportDetails", "top=10,left=100,width=800,height=750,scrollbars=yes,status=no,resizable=yes"); 
}

function downloadPriceIdReport()
{
//alert("99");
frmObj = document.frmPriceApprovalPriceIdReports;
	
	
var category = document.getElementById("category").value
	alert("category-"+category);
	var mainCategory = document.getElementById("mainCategory").value
	alert("mainCategory--"+mainCategory);
var status = document.getElementById("status").value
var fromdate = document.getElementById("fromdate").value;
var todate = document.getElementById("todate").value;
var month = document.getElementById("month").value;
var finalDate = document.getElementById("finalDate").value;
var newStatus = document.getElementById("newStatus").value;
var year = document.getElementById("year").value;
//var price2 = document.getElementById("price2").value;
//alert("fromdate--"+fromdate);
//alert("todate--"+todate);
//alert("finalDate--"+finalDate);
//alert("status--"+status);


	
	//}else{
		 //if(category != null ){
		// 
			// alert("1234");
			//if(category != null){
	

	/*if( category != null ){
	//if(mainCategory == "All" && category != null ){
		alert("ana");
		
		url = "downloadPriceIdReport.jsp?category="+category+"&status="+status+"&month="+month+"&year="+year+"&fromdate="+fromdate+"&todate="+todate+"&finalDate="+finalDate;
	}
	else */
		if(mainCategory == "All"){
	//	alert("Hello");
		url = "downloadPriceIdReport.jsp?mainCategory="+mainCategory+"&status="+status+"&month="+month+"&year="+year+"&fromdate="+fromdate+"&todate="+todate+"&finalDate="+finalDate;
	}else{
	if(mainCategory == category ){
		alert("44")
			//url = "downloadPriceIdReport.jsp?mainCategory="+category+"&category="+category+"&status="+status+"&month="+month+"&year="+year+"&finalDate="+finalDate;
		//url = "downloadPriceIdReport.jsp?category="+category+"&status="+status+"&fromdate="+fromdate+"&todate="+todate+"&finalDate="+finalDate;
		url = "downloadPriceIdReport.jsp?category="+category+"&status="+status+"&finalDate="+finalDate;
		 }
	}

	//url = "downloadPriceIdReport.jsp?category="+category+"&status="+status+"&fromdate="+fromdate+"&todate="+todate;
		win = window.open(url, "ReportDetails", "top=10,left=100,width=800,height=750,scrollbars=yes,status=no,resizable=yes"); 

	//}
}

function downloadPriceIdReport1()
{
	
alert("55");
frmObj = document.frmPriceApprovalPriceIdReports;
	
	
var category = document.getElementById("category").value
	
var mainCategory = document.getElementById("mainCategory").value
	
var status = document.getElementById("status").value
	
var fromdate = document.getElementById("fromdate").value;
var todate = document.getElementById("todate").value;
var month = document.getElementById("month").value;
var finalDate = document.getElementById("finalDate").value;
var newStatus = document.getElementById("newStatus").value;
//alert("category--"+category);
//alert("status"+status);
//alert("fromdate--"+fromdate);
//alert("todate--"+todate);
//alert("finalDate--"+finalDate);
var year = document.getElementById("year").value;
//var test = document.getElementById("test").value;
//alert("test--"+test);
	
	//if(test == 1)
	//{
		/*if(mainCategory == "All"  ){
			alert("11")
		url = "downloadPriceIdReport.jsp?mainCategory="+mainCategory+"category="+category+"&status="+status+"&fromdate="+fromdate+"&todate="+todate+"&finalDate="+finalDate+"&allCategory1=1";
		
	} */ if(category != null ){
		
	
	alert("bb");
		//url = "downloadPriceIdReport.jsp?category="+category+"&status="+status+"&fromdate="+fromdate+"&todate="+todate+"&finalDate="+finalDate;
		url = "downloadPriceIdReport.jsp?category="+category+"&status="+status+"&finalDate="+finalDate;
		
		 
		//url = "downloadPriceIdReport.jsp?category="+category+"&status="+status+"&fromdate="+fromdate+"&todate="+todate;
		win = window.open(url, "ReportDetails", "top=10,left=100,width=800,height=750,scrollbars=yes,status=no,resizable=yes"); 

	}
}



function downloadPriceIdMonthlyReport()
{

frmObj = document.frmPriceApprovalPriceIdReports;
var category = document.getElementById("category").value
var status = document.getElementById("status").value
var fromdate = document.getElementById("fromdate").value;
var todate = document.getElementById("todate").value;
var month = document.getElementById("month").value;
var year = document.getElementById("year").value;
var finalDate = document.getElementById("finalDate").value;
	
		url = "downloadMonthlyDataReport.jsp?category="+category+"&status="+status+"&fromdate="+fromdate+"&todate="+todate+"&month="+month+"&year="+year+"&finalDate="+finalDate;
		//url = "downloadPriceIdReport.jsp?category="+category+"&status="+status+"&fromdate="+fromdate+"&todate="+todate;
		win = window.open(url, "ReportDetails", "top=10,left=100,width=800,height=750,scrollbars=yes,status=no,resizable=yes"); 

	//}
}

function  getPriceData(flag)
{

	frmObj = document.priceApprovalMonthlyData;
	//alert("flag---"+flag);

	if (flag == 1)
	{
		var mainCategory = document.getElementById("mainCategory").value;
		var fromdate = document.getElementById("fromdate").value;
		var todate = document.getElementById("todate").value;
		var status = document.getElementById("status").value;
		var month = document.getElementById("month").value;
		var year = document.getElementById("year").value;
		var page = document.getElementById("page").value;
		//alert("page"+page);

		//alert("page--"+page);

		/*if(status == "'L','CL'")
		{
			status1 = "All";

		}else if(status == "'L'")
		{
			status1 = "In Process";

		}else if(status == "'CL'")
		{
			status1 = "'Approved'";

		} */

		

		if(page == "1"){
		//	alert("555");
		frmObj.action = "reports.jsp?category="+mainCategory+"&fromdate="+fromdate+"&todate="+todate+"&status="+status+"&month="+month+"&year="+year+"&flag1=2";
		}else if(page == "2"){
			frmObj.action = "reportsApprover.jsp?category="+mainCategory+"&fromdate="+fromdate+"&todate="+todate+"&status="+status+"&month="+month+"&year="+year+"&flag1=2";
		}
		else if(page == "3"){
			frmObj.action = "reportsUser.jsp?category="+mainCategory+"&fromdate="+fromdate+"&todate="+todate+"&status="+status+"&month="+month+"&year="+year+"&flag1=2";
		}
		frmObj.submit();

	//	alert("month--"+month);
		//alert("year--"+year);
		//loadFragment1("reports.jsp?category="+category+"&fromdate="+fromdate+"&todate="+todate+"&status="+status+"&month="+month+"&year="+year,'showRequests','Showing All Fields');

	}
}

 /*function doSomething(elem) {
		var projectname = document.getElementById('projectname').value;
        elem.href = 'projectname';
    }*/




function loadFragment1(fragment_url, element_id, for_what){
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
    // alert(fragment_url);

    var element = document.getElementById(element_id);
    
    var message = "";
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
        
    element.innerHTML = processingRequest;

    try{
       	xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
                   
                element.innerHTML = message;
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}



function reportWin(url)
{
	//alert("test");
    win = window.open(url,"PAR"); 

}




	function validatePeriod(date1, date2) {

    // The number of milliseconds in one day
    var ONE_DAY = 1000 * 60 * 60 * 24;

    // Convert both dates to milliseconds
    var date1_ms = date1.getTime();
    var date2_ms = date2.getTime();
    // Calculate the difference in milliseconds
	//alert(date1_ms);
	//alert(date2_ms);
    var difference_ms = Math.abs(date1_ms - date2_ms);
	//alert(difference_ms);
    // Convert back to days and return
    return Math.round(difference_ms/ONE_DAY)
}


	function dateFormat(incomingData) { 
	
	var monthName	= new Array( "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");
	incomingData	= incomingData.split("-");
	var day			= incomingData[0];
	var month		= incomingData[1];
	var year		= incomingData[2];
	var monthValue	= 0;

	if (month >= 1 || month <= 12) {


		month = monthName[month-1];

	}

	for(var i=0; i < monthName.length ;i++)	{

		if(monthName[i] == month) {

			var monthValue = i;

		}

	}
	var revisedFormat = new Date(year, monthValue ,day);
	return revisedFormat;
}	// end of function
