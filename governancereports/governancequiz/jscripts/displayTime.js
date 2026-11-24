//include("governanceQuiz.js");
//<script src="governanceQuiz.js"></script>
var a = 1;
var d = 1;
var timer1 = 1800000;//59000;
var timer2 = 0;
function postRequest(strURL) {

		var xmlHttp;

			if (window.XMLHttpRequest) 
			{ // Mozilla, Safari, ...

				var xmlHttp = new XMLHttpRequest();

			} 
			else if (window.ActiveXObject) 
			{ // IE

				var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");

			}

				xmlHttp.open('POST', strURL, true);

				xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

				xmlHttp.onreadystatechange = function() 
											{

												if (xmlHttp.readyState == 4) 
												{
													updatepage(xmlHttp.responseText);
												}

											}
				xmlHttp.send(strURL);

        }

        function updatepage(str){
			if(timer2 == timer1)
			{
				var questionSize = document.governanceQuiz.queNoSize.value;
				var optionSize = document.governanceQuiz.optNoSize.value;
				var opt = document.governanceQuiz.OptionsField1.value;
				a = 2;
				submit(questionSize,optionSize,opt);
								
			}
		document.getElementById("result").innerHTML =
		"<font color='#ffffff' size='4'>" + str + "</font>";
		timer2 = parseInt(timer2) + 1000;
		//alert(timer2+"  "+timer1);
        }

        function showCurrentTime(){
			var c=0
			var t

			var url="../time/date.jsp"
			postRequest(url);
			c=c+1;
			t=setTimeout("showCurrentTime()",1000);

        }

		function submit(questionSize,optionSize,opt)
		{
		
		frmObj = document.governanceQuiz;
		var url     = ''
		var counter = 0; 
		//alert(questionSize);
	
				
	
		for(var i=1;i<=questionSize;i++)
		{ 
			//temp1 = eval("frmObj.QField"+i).value;
			//alert(temp1);
			temp1 = eval("frmObj.optionsHash"+i).value;
			//alert(temp1);
			
			for(var j=1;j<=temp1;j++)
			{
				
				//alert("frmObj.option"+i+j);
				if (eval('frmObj.option'+i+j).checked == true)
				{   
					counter++;   
					url = url + '-' + eval('frmObj.option'+i+j).value;   
					//alert(url);
				}
				else
				{
					//alert("test");
				}
				if (counter == 0)
				{ 
					url="";
				} 
			//return url;

			}
			//alert(url);
			eval("frmObj.selectedOptionsHash"+i).value = url;
			url='';
			
		}
	
		d = 2;
		frmObj.action="governanceQuizSubmit.jsp";
		frmObj.submit();
}