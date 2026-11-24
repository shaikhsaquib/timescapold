function validate(size){

   var i = 0;
  
   frmObj = document.frmSaveChklist;
	while (i < size )
		{ 
		temp = eval("frmObj.feedBackOptions"+i).value;
		//temp1 = eval("frmObj.remarks"+i).value;
		//temp2 = eval("frmObj.isAttach"+i).value;
		//alert(temp2);
		
			i++;	
		}
		frmObj.action="../requestor/governanceSubmit.jsp?action=Save";
		frmObj.submit();
}

function validateAppr(size){
 
   var i = 0;
   //alert(size);

   frmObj = document.frmSaveChklist;
	/*while (i < size )
		{ 
		
		//temp = eval("document.frmSaveChklist.overriddenRemarks"+1);
		
		
		i++;	
		}*/
		  /*for(i=0;i<size;i++){
	
				eval("frmObj.overriddenRating"+i).disabled = false;
				eval("frmObj.overriddenRemarks"+i).disabled = false;
		  }*/
		frmObj.action="../approver/governanceApproverSubmit.jsp?action=Save";
		frmObj.submit();
}


//?action"+Save

function signoff(size){

   var i = 0;
   var error = "";

   frmObj = document.frmSaveChklist;
	while (i < size )
		{ 
		temp = eval("frmObj.feedBackOptions"+i).value;

		temp1 = eval("frmObj.remark"+i).value;

		temp2 = eval("frmObj.noncompliancetext"+i).value;

		if (temp == "Not Rated")
		{  
			error += "Please provide Yes/No/NA for Question " + (i+1) + "\n";
		}
				
		else if (temp == temp2 && temp1 == "")
		{  
			error += "Please Enter Remarks for Noncompliance for Question no: " + (i+1) + "\n";
			eval("frmObj.remark"+i).style.backgroundColor = "yellow";

		}
		else
			{
			     eval("frmObj.remark"+i).style.backgroundColor = "white";
			}
		
			i++;	
		}
		if(error=="")
			{

				frmObj.action="../requestor/governanceSubmit.jsp?action=SignOff";
				frmObj.submit();
			}
		  else
			{
				alert(error); 
			}
	}
	


function signoffAppr(size){

   var i = 0;
   var error = "";
  
   frmObj = document.frmSaveChklist;
		
	while (i < size )
		{ 
		temp = eval("frmObj.feedBackOptions"+i).value;
		
		//temp1 = eval("frmObj.overriddenRating"+i).value;
		
		temp2 = eval("frmObj.remark"+i).value;
		
		temp3 = eval("frmObj.noncomplianceText"+i).value;

		//temp4 = eval("frmObj.overriddenRemarks"+i).value;
      
		//temp5 = eval("frmObj.notRated").value;
		
	
		
		if (temp == "Not Rated")
		{  
			error += "Please provide Yes/No/NA for Question: " + (i+1) + "\n";
		}
		/*else if (temp5 == "NR")
		{  
			error += "Please ask user to enter feedback for Question no: " + (i+1) + "\n";
		}*/
		else if (temp == temp3 && (temp2 == "" || temp2 == "NA"))
		{  
			error += "Please Enter Remarks for Noncompliance for Question no: "+ (i+1) +" \n";
			eval("frmObj.remark"+i).style.backgroundColor = "yellow";
		}
		/*else if( eval("frmObj.overriddenRating"+i).checked &&( eval("frmObj.overriddenRemarks"+i).value == '' || eval("frmObj.overriddenRemarks"+i).value == "-") )
		{
			error += "Please Enter Overriden Remarks for Question: " + (i+1) + "\n";
			
		}*/
		else
			{
			     eval("frmObj.remark"+i).style.backgroundColor = "white";
			}
		
			i++;	
		} 
					/*for(i=0;i<size;i++){
	
						eval("frmObj.overriddenRating"+i).disabled = false;
						eval("frmObj.overriddenRemarks"+i).disabled = false;
								}*/
			if(error=="")
			{
				frmObj.action="../approver/governanceApproverSubmit.jsp?action=SignOff";
				frmObj.submit();
			}
			else
			{
				alert(error); 
			}
	}

function viewfeedback(timescapeuserOId)
	
	{
		//alert("timescapeuserOId--------- :"+timescapeuserOId);
		frmObj = document.frmSaveChklist;

		frmObj.action="../approver/governanceReview.jsp?timescapeuserOId="+timescapeuserOId;
		frmObj.submit();
	}
	

	
	function submitFeedback()
	
	{
		//alert("timescapeuserOId--------- :");
		 frmObj = document.frmSaveChklist;
		 approverRemarks = frmObj.approverRemarks.value;
		 //alert(approverRemarks);
		if(approverRemarks == '	') { 
			
			alert("Please enter your remarks");  
			frmObj.approverRemarks.focus();
			return;
		} 
		
		
		frmObj.action="../approver/userDetailsSubmit.jsp";
			frmObj.submit();
		
	}

function checkStatus()
{
         frmObj = document.frmSaveChklist;
		 var i,flag=1;
		 var check;
         var error = "";
		 var size = document.frmSaveChklist.counter.value;

		 for(i=0;i<size;i++)
			{
			 if(eval("frmObj.check"+i))
				{  
				var length1 = eval("frmObj.check"+i).value.length;
				var data1 = eval("frmObj.check"+i).value;
				var ch = data1.substring((length1-1));
				data1 = data1.substring(0,(length1-1));
			
					//alert(eval("document.frmSaveChklist.check"+i).value);
				if((ch=="Y"))
					{
					      if(eval("frmObj.overriddenRemarks"+i).value.length==0)
						{
							error = "Please Enter Overridden Remarks";
							eval("frmObj.overriddenRemarks"+i).style.backgroundColor = "yellow";flag=0;}
						  else{flag=1;eval("frmObj.overriddenRemarks"+i).style.backgroundColor = "white";}
		            }
					
				  }
				}
			if(parseInt(flag)==1)
			{
				
				frmObj.action = "processGovernanceApprover.jsp";
				frmObj.submit();
			}else{alert(error);}
				return;
}

function callValidate()
{
	var r=confirm("Assuming you have read all documents...");
	if (r)
	{
		document.location.href = "governanceCode.jsp";
	}
}