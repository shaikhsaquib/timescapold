function validate(todayDay)
 {
	frmObj = document.frmcreaterequest;

	selectApprover = frmObj.email.value;

	currentSysdate = frmObj.currentSysdate.value;

	if(!selectApprover)
	{
        alert("Please enter/select approver authority !!!!");
        //cannot be greater than the Current Date
        frmObj.email.focus( );
		return;	
    }
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\";
	var num = "0123456789";
	var cnum = "0123456789()-";
	var anum = ".0123456789";
	var payid = "0123456789";

/*--------------Checkin the Array Inputs----------------*/

    selectMonth         =frmObj.selectMonth.value;
    selectYear          =frmObj.selectYear.value;


	incomingData	    = currentSysdate.split("-");
	var currday			= incomingData[0];
	var currmonth		= incomingData[1];
	var curryear		= incomingData[2];

	
	if(eval(currmonth)>2)
	 {
	    if((eval(selectMonth) == eval(currmonth)) || (eval(selectMonth) > eval(currmonth))||(eval(selectMonth) < eval(currmonth-2))||(eval(selectYear) > eval(curryear))||(eval(selectYear) < eval(curryear)))
			{
				alert("Reimbursement applications are allowed only for the previous two months.\n Please select month & year accordingly.");
				//cannot be greater than the Current Date
				frmObj.selectMonth.focus( );
				return;	

			 } 
	 }
	 if(eval(currmonth)==1)
	 {
		 if((eval(selectMonth) == eval(currmonth)) || (eval(selectMonth) < 11) || (eval(selectYear) >= eval(curryear))||(eval(selectYear)<eval(curryear-2)))
			{
				alert("Reimbursement applications are allowed only for the previous two months.\n Please select month & year accordingly.");
			 //cannot be greater than the Current Date
			 frmObj.selectMonth.focus( );
			 return;	
			 }
	 }
	 if(eval(currmonth)==2)
	 {		 
		 if((eval(selectMonth) == eval(currmonth)) || (eval(selectMonth) > 1 && eval(selectMonth) < 12) || (eval(selectYear) > eval(curryear)) || (eval(selectYear) < eval(curryear-1)))
			 {
				alert("Reimbursement applications are allowed only for the previous two months.\n Please select month & year accordingly.");
				//cannot be greater than the Current Date
				frmObj.selectMonth.focus( );
				return;	

			} else if((eval(selectMonth) == 1) && (eval(selectYear) < eval(curryear)))
			{
				alert("Reimbursement applications are allowed only for the previous two months.\n Please select month & year accordingly.");
				//cannot be greater than the Current Date
				frmObj.selectMonth.focus( );
				return;	
			 }
	  }
		 
      days=returnDays(frmObj.selectMonth,frmObj.selectYear);

		var val = frmObj.noOfRows.value;
		for(ii=0; ii<val; ii++)
		{
		
			frmObj.weekday[ii].disabled=false;

			frmObj.fromDay[ii].disabled=false;

			//frmObj.type[ii].disabled=false;

		
	    	//var type = document.getElementById('type'+ii).value;
	    	var type = eval('frmObj.type'+ii+'.value');			
			var chkParticluars = eval('frmObj.particularsChk'+ii+'.checked');

		//var type = frmObj.type[ii].value;

			
			if(chkParticluars == true) 
			{
				if(type=='0')
				{						
					//stat = checkNull("Allowance Type", type);
					//if(!stat)
					//{
						//document.getElementById('type'+ii).focus();
						alert("Please select Allowance Type");
						eval('frmObj.type'+ii).focus();
						//frmObj.approverRemarks[i].focus();
						return;
					//}					
					
				}
			}

			if(ii>0)
			{
				frmObj.particularsChk[ii-1].disabled=false;
			}
		//frmObj.type[ii].disabled=false;		
		//}


  }
	   
	frmObj.action = "../requestor/previewRequest.jsp?noOfRows="+days+"&todayDay="+todayDay;
	frmObj.submit( );
}//  end of validate function



function getWeekDay(www)
{	
	frmObj = document.frmcreaterequest;
    days=returnDays(frmObj.selectMonth,frmObj.selectYear);
	//alert(days);
	var val = frmObj.noOfRows.value;
	if(www<val)
	{
		if(www>0)
		{						
			frmObj.fromDay[www].disabled=true;
			frmObj.particularsChk[www].disabled=false;
			frmObj.type[www].disabled=false;
			
		}

		 if(www >=days)
		{
			frmObj.fromDay[www].disabled=true;
			frmObj.particularsChk[www].disabled=true;
			frmObj.particularsChk[www].checked=false;
			frmObj.type[www].disabled=true;
         }
					 
		valDate = frmObj.fromDay[www].options[frmObj.fromDay[www].selectedIndex].value;
		

		valMonth= (frmObj.selectMonth.selectedIndex - 1);
		
		valYear = frmObj.selectYear.options[frmObj.selectYear.selectedIndex].value;
		
		var d = new Date();
		d.setYear(valYear);
		d.setMonth(valMonth,valDate);
		var days=new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");
		frmObj.weekday[www].value = days[d.getDay()];
		if(www<(val-1))
		{ 
		var nextDate = eval(frmObj.fromDay[www].options[frmObj.fromDay[www].selectedIndex].value);
		nextDate = eval(nextDate+1);
		d.setDate(nextDate);
		frmObj.fromDay[www+1].selectedIndex = d.getDate(); 
		//alert(frmObj.fromDay[www+1].selectedIndex);
		getWeekDay(www+1);
		}
		else{return;}
	}//end of if
}
	

function changeDate()
{
	frmObj = document.frmcreaterequest;
    // Checking for null (month)
	value1 = frmObj.selectMonth.selectedIndex;
	valid = checkNull("Month", value1);
	if(!valid)
	{
		frmObj.selectMonth.focus( );
		return 
	} 
	// Checking for null (year)
	value1 = frmObj.selectYear.selectedIndex;
	valid = checkNull("Year", value1);
	if(!valid)
	{
		frmObj.selectYear.focus( );
		return 
	}  
	     
	var months=new Array("Month","January","February","March","April","May","June","July","August","September","October","November","December");

    var val = frmObj.noOfRows.value;
	//alert(val);
    kkk=0;
	getWeekDay(kkk);
	//alert(getWeekDay(kkk));
	for(; kkk<val ; kkk++)
	{
		
		frmObj.fromMonth[kkk].value = months[frmObj.selectMonth.value]; 
		
		frmObj.fromYear[kkk].value = frmObj.selectYear.value;
		

    }
	//frmObj.thisMonth.value =  months[frmObj.selectMonth.value];  
	//frmObj.thisYear.value = frmObj.selectYear.value;
    //addAll();
}

function checkNextNull(fieldName, val)
{
	frmObj = document.frmcreaterequest;
	// Checking for null
	if((val == null) || (val== "") || (val =="0"))
	{
		return false;
	}
	return true;
}

function clear()
{	
	frmObj = document.frmcreaterequest;
	frmObj.reset();
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



function validatePeriod(date1, date2) {
  // The number of milliseconds in one day
    var ONE_DAY = 1000 * 60 * 60 * 24;

    // Convert both dates to milliseconds
    var date1_ms = date1.getTime();
    var date2_ms = date2.getTime();
    // Calculate the difference in milliseconds
	
    var difference_ms = Math.abs(date1_ms - date2_ms);
    // Convert back to days and return
    return Math.round(difference_ms/ONE_DAY)
}


function noSelection(listSize) {

	frmObj = document.frmcreaterequest;

	for (var i = 0; i <listSize;i++) {

			expr =  "frmObj.particularsChk"+i+".checked=false";
			eval(expr);
	}
}

function selectAll(listSize, index) {

	frmObj = document.frmcreaterequest;

	for (var i = 0; i <listSize;i++) 
	{
		expr =  "frmObj.particularsChk"+i+".checked=true";

		eval(expr);

	}

}
