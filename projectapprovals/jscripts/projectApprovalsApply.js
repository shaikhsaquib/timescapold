function validate()
{
	frmObj = document.frmprojectApprovalsApply;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";
    var goodchars="0123456789";
	//alert("test");
	var isok = true;
	subject					=	frmObj.subject.value;	
	project					=	frmObj.project.value;
	description				=	frmObj.description.value;
	justification			=	frmObj.justification.value;
	cost					=	frmObj.cost.value;
	workdone				=	frmObj.workdone.value;
	projecthead				=	frmObj.projecthead.value;
	recommendedby1			=	frmObj.recommendedby1.value;
	//recommendedby2			=	frmObj.recommendedby2.value;
	approvedby				=	frmObj.approvedby.value;

	// Check for Null
		stat = checkNull("Subject ", subject);
		if(!stat){
			frmObj.subject.focus();
			isok=false;
			disable_enable();
			return;
		}

       // Check Name for Junk
        stat = checkJunk("Subject ",  subject ,junk);
        if(!stat){
            frmObj.subject.focus( );
			disable_enable();
			isok=false;
            return;
        }

	if (project == "select") {
		
		alert("Please select a Project");
		project.focus();
		disable_enable();
		return;
	}
	
	// Check for Null
		stat = checkNull("Description ", description);
		if(!stat){
			frmObj.description.focus();
			isok=false;
			disable_enable();
			return;
		}

       // Check Name for Junk
        stat = checkJunk("Description ",  description ,junk);
        if(!stat){
            frmObj.description.focus( );
			isok=false;
			disable_enable();
            return;
        }
	
	// Check for Null
		stat = checkNull("Justification ", justification);
		if(!stat){
			frmObj.justification.focus();
			isok=false;
			disable_enable();
			return;
		}

       // Check Name for Junk
        stat = checkJunk("Justification ",  justification ,junk);
        if(!stat){
            frmObj.justification.focus( );
			isok=false;
			disable_enable();
            return;
        }

		// Check for Null
		stat = checkNull("Value of Work Done ", cost);
		if(!stat){
			frmObj.cost.focus();
			isok=false;
			disable_enable();
			return;
		}

       // Check Name for Junk
        stat = checkJunk("Value of Work Done ",  cost ,junk);
        if(!stat){
            frmObj.cost.focus( );
			isok=false;
			disable_enable();
            return;
        }

		// Check for Null
		stat = checkNull("Work Done ", workdone);
		if(!stat){
			frmObj.workdone.focus();
			isok=false;
			disable_enable();
			return;
		}

       // Check Name for Junk
        stat = checkJunk("Work Done ",  workdone ,junk);
        if(!stat){
            frmObj.workdone.focus( );
			isok=false;
			disable_enable();
            return;
        }

		// Check for Null
		stat = checkNull("Project Head ", projecthead);
		if(!stat){
			frmObj.projecthead.focus();
			isok=false;
			disable_enable();
			return;
		}

       // Check Name for Junk
        stat = checkJunk("Project Head ",  projecthead ,junk);
        if(!stat){
            frmObj.projecthead.focus( );
			isok=false;
			disable_enable();
            return;
        }

		// Check for Null
		stat = checkNull("Recommended By ", recommendedby1);
		if(!stat){
			frmObj.recommendedby1.focus();
			isok=false;
			disable_enable();
			return;
		}

	// Check for Null
		stat = checkNull("Approved By ", approvedby);
		if(!stat){
			frmObj.approvedby.focus();
			isok=false;
			disable_enable();
			return;
		}
	
	if(isok==true)
	{
		
		frmObj.action = "../user/projectApprovalsSubmit.jsp";
		frmObj.submit( );
	}	
		
}

function addUser(forWhom) {

	frmObj = document.frmprojectApprovalsApply;
	
	window.open('../common/search.jsp?forWhom='+forWhom,'','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=600,height=600,top=70,left=100');

}


function validateUser(){

	frmObj = document.frmSearchRequest;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";
    var goodchars="0123456789";
	var selectedOption = '';
	var choice = 0;

    var name			= trim(frmObj.email.value);

    if((name.indexOf('@')) > -1||(name.indexOf('.')) > -1){

        // Check for valid email address
        stat = checkEmail('email')

        if(!stat){
            return;
        }

        selectedOption = "emailId";
    }else{
      
 		// Check Name for Null
		stat = checkNull("Name / Email-Id", name);

		if(!stat){
			frmObj.email.focus();
			return;
		}

       // Check Name for Junk
        stat = checkJunk("Name",  name ,junk);
        if(!stat){
            frmObj.email.focus( );
            return;
        }
        // Check Name for Numbers
        stat = checkNum("Name", name, goodchars);
        if(!stat){
            frmObj.email.focus( );
            return;
        }

        selectedOption = "name";
    }

    
    loadFragment('../includes/contacts.jsp?name='+name+'&selectedOpt='+selectedOption,'members','Members');
    

}

function show(emailId){

    loadFragment('../includes/empInfo.jsp?emailId='+emailId, 'tooltip','Info');
}

function loadFragment(fragment_url, element_id, for_what){
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
    
    var message = "";
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
        
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


function clear()
{
	frmObj = document.frmprojectApprovalsApply;
	frmObj.reset();
}

function checkNumeric()
{
	var goodchars="0123456789";
//alert(cost.length);
	frmObj = document.frmprojectApprovalsApply;
	cost = frmObj.cost.value;
	for (var i = 0; i < cost.length;i++)
	{
		//alert(cost.length);
		num = cost.charAt(i);
		//alert(num);
		//Look for each character in the goodChars string
		pos = goodchars.indexOf(num);
		//alert(pos);
		if(pos=='-1')
		{
			alert("Value of Work should contain "+goodchars+" only!" );
			frmObj.cost.focus();
			return;
		}
	}
}

function disable_enable(){
//alert("test");
if (document.all || document.getElementById){
	if (document.frmprojectApprovalsApply.button.disabled==true)
		document.frmprojectApprovalsApply.button.disabled=false
	else
		document.frmprojectApprovalsApply.button.disabled=true
	}
}
