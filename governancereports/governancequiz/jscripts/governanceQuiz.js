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

function clear()
	{
		frmObj = document.governanceQuiz;
		frmObj.reset();
	}

function viewUserDetail(timescapeuserOId)
	
	{
		//alert("timescapeuserOId--------- :"+timescapeuserOId);

		frmObj = document.governanceQuiz;
		//alert(username);
		frmObj.action="../approver/governancequizReview.jsp?timescapeuserOId="+timescapeuserOId;
		frmObj.submit();
	}


function viewStatusDetail()
	
	{
		//alert("timescapeuserOId--------- :"+timescapeuserOId);

		frmObj = document.governanceQuiz;
		//alert(username);
		frmObj.action="../approver/governancequizStatusReport.jsp";
		frmObj.submit();
	}

function viewFailedUsers()
	
	{
		
		//alert("Hi");
		window.navigate("../approver/governancequizFailStatusReport.jsp");
		
		
	}

function viewPassedUsers()
	
	{
		//alert("Hi");
		window.navigate("../approver/governancequizStatusReport.jsp");
	}
function viewQuestionDetail()
	
	{
		//alert("timescapeuserOId--------- :"+timescapeuserOId);

		frmObj = document.governanceQuiz;
		//alert(username);
		frmObj.action="../approver/governanceQuestionReports.jsp";
		frmObj.submit();
	}

	
function viewoverAllDetail()
	
	{
		//alert("timescapeuserOId--------- :"+timescapeuserOId);

		frmObj = document.governanceQuiz;
		//alert(username);
		frmObj.action="../approver/governanceReports.jsp";
		frmObj.submit();
	}


function viewDetail(status,deptname)
	
	{
		//alert('HI');
		
		//alert(status);	
		//alert(deptname);
		frmObj = document.governanceQuiz;
		//alert(username);
		frmObj.action="../approver/governancequizReviewDetails.jsp?status="+status+"&deptname="+deptname;
		frmObj.submit();
	}


	

function viewQuestionPerUser(userId,userName)
	
	{
		//alert("HIIIII");
		//window.open("../approver/governancequizquestionPerUserReport.jsp?userId="+userId);
		frmObj = document.governanceQuiz;
		frmObj.action="../approver/governancequizquestionPerUserReport.jsp?userId="+userId+"&userName="+userName;
		frmObj.submit();
	}


/*function viewFailQuestions()
	
	{
		//alert('HI');
		
		//alert(status);	
		//alert(deptname);
		frmObj = document.governanceQuiz;
		//alert(username);
		frmObj.action="../approver/governancequizquestionPerUserReport.jsp
		frmObj.submit();
	}*/

function callValidate()
{
	var r=confirm("Assuming you have read all documents...");
	if (r)
	{
		document.location.href = "governanceQuiz.jsp";
	}
}


function downloadReportForReviewer(status,dept){
	frmObj = document.governanceQuiz;
	//alert("1");
	//alert(dept);
	//alert(status);
	url = "../common/downloadReportsAll.jsp?status="+status+"&dept="+dept;
	win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	
}


function downloadReportPerUser(userId){
	frmObj = document.governanceQuiz;
	//alert("1");
	//alert(userId);
	//alert(status);
	url = "../common/downloadReportsPerUser.jsp?userId="+userId;
	win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	
}