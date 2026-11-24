function go11()
{
	//frmObj = document.frmViewTopupAmt;
	frmObj = document.frmTopupAmt;
	//alert("hi"+frmObj);

	//fromYear = document.getElementById('year');
	currYear1 = document.getElementById('testYear').value;
	//alert("currYear1"+currYear1);
	fromYear   = frmObj.year.value;
	window.loacation.reload();
	//alert(fromYear);
	//window.open('../profile/bcclViewHistoty.jsp?&option=yes','','resizable=yes,status=yes,toolbars=no,scrollbars=yes,width=900,height=600,top=50,left=20');
	//window.loacation.reload();
}

function submitAmount()

{
frmObj = document.frmTopupAmt;


//alert("11");
var amt = 0;
amt = document.getElementById('amt');
var x = document.getElementById("addedAmt").value;

if(document.getElementById('addedAmt').selectedIndex == 0)
	{

	alert("Please select Top-Up amount");
	return;

	}
else if(amt.checked == false )
		{
			
			alert("Please submit the declaration by clicking on the checkbox.");
			return;
		}
		
	
		var amswer = confirm("Do you wish to submit your declaration for Top-Up Insurance Scheme?");
	
	if(amswer){
	var paymentOpt = document.getElementById("paymentOpt").value;

	if (x==8 || x==10 || x==15)
	{
		frmObj.action="../profile/bcclApplyAmtSubmit.jsp?paymentOpt=3";
		frmObj.submit();
	}else{
		frmObj.action="../profile/bcclApplyAmtSubmit.jsp?paymentOpt=1";
		frmObj.submit();
	}
	

	}

}

function myFunction()
{
	frmObj = document.frmTopupAmt;
	var amt = document.getElementById('addedAmt').value;
	var compCode = document.getElementById('compCode').value;

	//alert("ki"+compCode);
	//var x = document.getElementById("addedAmt").value;
	if (compCode=='1009')
	{
		document.getElementById("paymentOpt").innerHTML = "3 monthly instalments " ;
		 document.getElementById("paymentOption").innerHTML = "3 monthly instalments " ;
	} else 	if (!compCode=='1009')
	{
		if (amt==8 || amt==10 || amt==15)
		{
			  document.getElementById("paymentOpt").innerHTML = "3 monthly instalments " ;
			  document.getElementById("paymentOption").innerHTML = "3 monthly instalments " ;
		}else{
			  document.getElementById("paymentOpt").innerHTML = "One Time Payment" ;
			  document.getElementById("paymentOption").innerHTML = "One Time Payment" ;
		}
	}
}


function preamount()
{
	//alert(deptName);
	var addedAmt = document.getElementById('addedAmt').value;
	var deptName = document.getElementById('deptName').value;
	var compCode = document.getElementById('compCode').value;
	var paymentOption = "";


	if ( (compCode == '1000') && (!(deptName==("1296")|| deptName==("1297")|| deptName==("1298")|| deptName==("1299")|| deptName==("1300")|| deptName==("1498")|| deptName==("1499")|| deptName==("1500")|| deptName==("1501")|| deptName==("1559")|| deptName==("1560")|| deptName==("1581")|| deptName==("1582")|| deptName==("1784")|| deptName==("1785")|| deptName==("1786")|| deptName==("1787")|| deptName==("1859") || compCode==("1005")|| compCode==("1006")))){
	paymentOption = document.getElementById('paymentOpt').value;
	if(paymentOption == '1'){
		document.getElementById('paymentOption').innerHTML = "a onetime payment";
	}else if(paymentOption == '6'){
		document.getElementById('paymentOption').innerHTML = "6 monthly instalments";
	}
	}
	//alert("deptName = "+ deptName);
	//alert(compCode);

	var addedAmt1 = parseInt(addedAmt); 
	//alert("addedAmt1"+addedAmt1);
	var basicAmt = 5;
	var totalCover = 0;
	 
	//alert("addedAmt"+addedAmt);
	if(addedAmt == "")
	{
		document.getElementById('preAmt').value = "";
		document.getElementById('totalCover').value = "";
		document.getElementById('lbltipAddedComment').innerHTML = "";


	}
	else if(addedAmt == "1")
	{
		document.getElementById('preAmt').value = "11000";
		totalCover = basicAmt + addedAmt1;
		//alert("totalCover--"+totalCover);
		document.getElementById('totalCover').value = totalCover + " " + "lacs";



	}else if(addedAmt == "2")
	{
		//document.getElementById('preAmt').value = "4034";
		//document.getElementById('preAmt').value = "3026";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('preAmt').value = "3725";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('preAmt').value = "3651";---- Commented by Tejas For New change on 13-07-2020
		document.getElementById('preAmt').value = "4930";
		
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 4034 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 3026 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 2017 ";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('lbltipAddedComment').innerHTML = "3725 ";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('lbltipAddedComment').innerHTML = "3651"; ---- Commented by Tejas For New change on 13-07-2020
		document.getElementById('lbltipAddedComment').innerHTML = "4930";
		totalCover = basicAmt + addedAmt1;
		document.getElementById('totalCover').value = totalCover + " " + "lacs";

	}else if(addedAmt == "3")
	{
		//document.getElementById('preAmt').value = "4549";
		//document.getElementById('preAmt').value = "3412";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('preAmt').value = "4201";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('preAmt').value = "4117";---- Commented by Tejas For New change on 13-07-2020
		document.getElementById('preAmt').value = "5773";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 4549 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 3412 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 2275 ";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('lbltipAddedComment').innerHTML = "4201 ";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('lbltipAddedComment').innerHTML = "4117";---- Commented by Tejas For New change on 13-07-2020
		document.getElementById('lbltipAddedComment').innerHTML = "5773";

		totalCover = basicAmt + addedAmt1;
		document.getElementById('totalCover').value = totalCover + " " + "lacs";

	}else if(addedAmt == "4")
	{
		//document.getElementById('preAmt').value = "5475";
		//document.getElementById('preAmt').value = "4106";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('preAmt').value = "5056";---- Commented by Shreedhar for New change on 28-06-2018
		if ((deptName==("1296")|| deptName==("1297")|| deptName==("1298")|| deptName==("1299")|| deptName==("1300")|| deptName==("1498")|| deptName==("1499")|| deptName==("1500")|| deptName==("1501")|| deptName==("1559")|| deptName==("1560")|| deptName==("1581")|| deptName==("1582")|| deptName==("1784")|| deptName==("1785")|| deptName==("1786")|| deptName==("1787")|| deptName==("1859") || compCode==("1005")|| compCode==("1006")) )
		{
			document.getElementById('preAmt').value = "28935";
		}else {
			//document.getElementById('preAmt').value = "4955";---- Commented by Tejas For New change on 13-07-2020
			document.getElementById('preAmt').value = "7408";
		}
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 5475 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 4106 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 2738 ";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('lbltipAddedComment').innerHTML = "5056 ";---- Commented by Shreedhar for New change on 28-06-2018
		

		if ((deptName==("1296")|| deptName==("1297")|| deptName==("1298")|| deptName==("1299")|| deptName==("1300")|| deptName==("1498")|| deptName==("1499")|| deptName==("1500")|| deptName==("1501")|| deptName==("1559")|| deptName==("1560")|| deptName==("1581")|| deptName==("1582")|| deptName==("1784")|| deptName==("1785")|| deptName==("1786")|| deptName==("1787")|| deptName==("1859") || compCode==("1005")|| compCode==("1006")) )
		{
			document.getElementById('lbltipAddedComment').innerHTML = "28935";
		}else {
			//document.getElementById('lbltipAddedComment').innerHTML = "4955";---- Commented by Tejas For New change on 13-07-2020
			document.getElementById('lbltipAddedComment').innerHTML = "7408";
		}

		totalCover = basicAmt + addedAmt1;
		document.getElementById('totalCover').value = totalCover + " " + "lacs";

	}
	else if(addedAmt == "5")
	{
		//document.getElementById('preAmt').value = "6549";
		//document.getElementById('preAmt').value = "4912";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('preAmt').value = "6048";---- Commented by Shreedhar for New change on 28-06-2018
		
		if ((deptName==("1296")|| deptName==("1297")|| deptName==("1298")|| deptName==("1299")|| deptName==("1300")|| deptName==("1498")|| deptName==("1499")|| deptName==("1500")|| deptName==("1501")|| deptName==("1559")|| deptName==("1560")|| deptName==("1581")|| deptName==("1582")|| deptName==("1784")|| deptName==("1785")|| deptName==("1786")|| deptName==("1787")|| deptName==("1859") || compCode==("1005")|| compCode==("1006")) )
		{
			document.getElementById('preAmt').value = "32816";
		}else {
			//document.getElementById('preAmt').value = "5927";---- Commented by Tejas For New change on 13-07-2020
			document.getElementById('preAmt').value = "9597";
		}
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 6549 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 4912 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 3275 ";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('lbltipAddedComment').innerHTML = "6048 ";---- Commented by Shreedhar for New change on 28-06-2018
		
		if ((deptName==("1296")|| deptName==("1297")|| deptName==("1298")|| deptName==("1299")|| deptName==("1300")|| deptName==("1498")|| deptName==("1499")|| deptName==("1500")|| deptName==("1501")|| deptName==("1559")|| deptName==("1560")|| deptName==("1581")|| deptName==("1582")|| deptName==("1784")|| deptName==("1785")|| deptName==("1786")|| deptName==("1787")|| deptName==("1859") || compCode==("1005")|| compCode==("1006")) )
		{
			document.getElementById('lbltipAddedComment').innerHTML = "32816";
		}else {
			//document.getElementById('lbltipAddedComment').innerHTML = "5927";---- Commented by Tejas For New change on 13-07-2020
			document.getElementById('lbltipAddedComment').innerHTML = "9597";
		}

		totalCover = basicAmt + addedAmt1;
		document.getElementById('totalCover').value = totalCover + " " + "lacs";

	}
	else if(addedAmt == "6")
	{
		//document.getElementById('preAmt').value = "6549";
		//document.getElementById('preAmt').value = "4912";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('preAmt').value = "6048";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('preAmt').value = "6048";---- Commented by Shreedhar for New change on 28-06-2018
		
		if ((deptName==("1296")|| deptName==("1297")|| deptName==("1298")|| deptName==("1299")|| deptName==("1300")|| deptName==("1498")|| deptName==("1499")|| deptName==("1500")|| deptName==("1501")|| deptName==("1559")|| deptName==("1560")|| deptName==("1581")|| deptName==("1582")|| deptName==("1784")|| deptName==("1785")|| deptName==("1786")|| deptName==("1787")|| deptName==("1859") || compCode==("1005")|| compCode==("1006")) )
		{
			document.getElementById('preAmt').value = "36007";
		}else {
			//document.getElementById('preAmt').value = "7112";---- Commented by Tejas For New change on 13-07-2020
			document.getElementById('preAmt').value = "12484";
		}
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 6549 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 4912 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 3275 ";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('lbltipAddedComment').innerHTML = "6048 ";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('lbltipAddedComment').innerHTML = "6048 ";---- Commented by Shreedhar for New change on 28-06-2018
		

		if ((deptName==("1296")|| deptName==("1297")|| deptName==("1298")|| deptName==("1299")|| deptName==("1300")|| deptName==("1498")|| deptName==("1499")|| deptName==("1500")|| deptName==("1501")|| deptName==("1559")|| deptName==("1560")|| deptName==("1581")|| deptName==("1582")|| deptName==("1784")|| deptName==("1785")|| deptName==("1786")|| deptName==("1787")|| deptName==("1859") || compCode==("1005")|| compCode==("1006")) )
		{
			document.getElementById('lbltipAddedComment').innerHTML = "36007";
		}else {
			//document.getElementById('lbltipAddedComment').innerHTML = "7112";---- Commented by Tejas For New change on 13-07-2020
			document.getElementById('lbltipAddedComment').innerHTML = "12484";
		}


		totalCover = basicAmt + addedAmt1;
		document.getElementById('totalCover').value = totalCover + " " + "lacs";

	}
	else if(addedAmt == "8")
	{
		//document.getElementById('preAmt').value = "6549";
		//document.getElementById('preAmt').value = "4912";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('preAmt').value = "6048";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('preAmt').value = "6048";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('preAmt').value = "9957";---- Commented by Tejas For New change on 13-07-2020
		
		if ((deptName==("1296")|| deptName==("1297")|| deptName==("1298")|| deptName==("1299")|| deptName==("1300")|| deptName==("1498")|| deptName==("1499")|| deptName==("1500")|| deptName==("1501")|| deptName==("1559")|| deptName==("1560")|| deptName==("1581")|| deptName==("1582")|| deptName==("1784")|| deptName==("1785")|| deptName==("1786")|| deptName==("1787")|| deptName==("1859") || compCode==("1005")|| compCode==("1006")) )
		{
			document.getElementById('preAmt').value = "9957";
		}else {
			document.getElementById('preAmt').value = "18928";
		}
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 6549 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 4912 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 3275 ";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('lbltipAddedComment').innerHTML = "6048 ";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('lbltipAddedComment').innerHTML = "6048 ";---- Commented by Shreedhar for New change on 28-06-2018
		
		//document.getElementById('lbltipAddedComment').innerHTML = "9957";---- Commented by Tejas For New change on 13-07-2020


		if ((deptName==("1296")|| deptName==("1297")|| deptName==("1298")|| deptName==("1299")|| deptName==("1300")|| deptName==("1498")|| deptName==("1499")|| deptName==("1500")|| deptName==("1501")|| deptName==("1559")|| deptName==("1560")|| deptName==("1581")|| deptName==("1582")|| deptName==("1784")|| deptName==("1785")|| deptName==("1786")|| deptName==("1787")|| deptName==("1859") || compCode==("1005")|| compCode==("1006")) )
		{
			document.getElementById('lbltipAddedComment').innerHTML = "9957";
		}else {
			document.getElementById('lbltipAddedComment').innerHTML = "18928";
		}

		totalCover = basicAmt + addedAmt1;
		document.getElementById('totalCover').value = totalCover + " " + "lacs";

	}
	else if(addedAmt == "10")
	{
		//document.getElementById('preAmt').value = "6549";
		//document.getElementById('preAmt').value = "4912";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('preAmt').value = "6048";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('preAmt').value = "6048";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('preAmt').value = "13939";---- Commented by Tejas For New change on 13-07-2020
		
		if ((deptName==("1296")|| deptName==("1297")|| deptName==("1298")|| deptName==("1299")|| deptName==("1300")|| deptName==("1498")|| deptName==("1499")|| deptName==("1500")|| deptName==("1501")|| deptName==("1559")|| deptName==("1560")|| deptName==("1581")|| deptName==("1582")|| deptName==("1784")|| deptName==("1785")|| deptName==("1786")|| deptName==("1787")|| deptName==("1859") || compCode==("1005")|| compCode==("1006")) )
		{
			document.getElementById('preAmt').value = "13939";
		}else {
			document.getElementById('preAmt').value = "25347";
		}
		
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 6549 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 4912 ";
		//document.getElementById('lbltipAddedComment').innerHTML = "Rs. 3275 ";---- Commented by Shreedhar for New change on 04-07-2017
		//document.getElementById('lbltipAddedComment').innerHTML = "6048 ";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('lbltipAddedComment').innerHTML = "6048 ";---- Commented by Shreedhar for New change on 28-06-2018
		//document.getElementById('lbltipAddedComment').innerHTML = "13939";---- Commented by Tejas For New change on 13-07-2020

		if ((deptName==("1296")|| deptName==("1297")|| deptName==("1298")|| deptName==("1299")|| deptName==("1300")|| deptName==("1498")|| deptName==("1499")|| deptName==("1500")|| deptName==("1501")|| deptName==("1559")|| deptName==("1560")|| deptName==("1581")|| deptName==("1582")|| deptName==("1784")|| deptName==("1785")|| deptName==("1786")|| deptName==("1787")|| deptName==("1859") || compCode==("1005")|| compCode==("1006")) )
		{
			document.getElementById('lbltipAddedComment').innerHTML = "13939";
		}else {
			document.getElementById('lbltipAddedComment').innerHTML = "25347";
		}

		totalCover = basicAmt + addedAmt1;
		document.getElementById('totalCover').value = totalCover + " " + "lacs";

	}else if(addedAmt == "15")
	{
		
			document.getElementById('preAmt').value = "48468";
		
			document.getElementById('lbltipAddedComment').innerHTML = "48468";
		

		totalCover = basicAmt + addedAmt1;
		document.getElementById('totalCover').value = totalCover + " " + "lacs";

	}




}