function validate(what){

	frmObj = document.priceApproval;
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

    if(what=='group'){
        loadFragment('includes/members.jsp?name='+name+'&selectedOpt='+selectedOption,'members','Members');
    }else if(what=='mail'){
        loadFragment('includes/contacts.jsp?name='+name+'&selectedOpt='+selectedOption,'members','Members');
    }

}

function clear() {
	frmObj = document.priceApproval;
	frmObj.reset();
}

function show(emailId){

    loadFragment('includes/empInfo.jsp?emailId='+emailId, 'tooltip','Info');
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

function add(){
    junk1= "!~+%<>?;`:#$%^&*()=|[]{}\\";
    frmObj= document.priceApproval;
    value= frmObj.outputText.value;
    userOId= frmObj.userOId.value;

    // Check Members List for Null
    stat = checkNull("Members List", value);

    if(!stat){
        frmObj.outputText.focus();
        return;
    }

   // Check Members List for Junk
    stat = checkJunk("Members List",  value ,junk1);
    if(!stat){
        frmObj.outputText.focus( );
        return;
    }
    
    //frmObj.members.value=value;
    self.opener.document.getElementById("mailingList").value += value; 
    self.opener.document.getElementById("userOId").value += userOId;
    self.close();
}

function showDetails(groupId){
loadFragment('includes/viewMembers.jsp?groupId='+groupId,'viewMembers','Members');
}

function addNew(groupId,size){
    junk1= "!~+%<>?;`:#$%^&*()=|[]{}\\";
    frmObj= document.priceApproval;
    value= frmObj.outputText.value;

    // Check Members List for Null
    stat = checkNull("Members List", value);

    if(!stat){
        frmObj.outputText.focus();
        return;
    }

   // Check Members List for Junk
    stat = checkJunk("Members List",  value ,junk1);
    if(!stat){
        frmObj.outputText.focus( );
        return;
    }
    
    //create this function
    String.prototype.count=function(s1) { 
        return (this.length - this.replace(new RegExp(s1,"g"), '').length) / s1.length;
    }

    numberOfCommas = value.count(',');

    size+=numberOfCommas;
    if(size > 500){
        alert("You have exceeded the size limit(250) \n Please remove some members from List !!");
        frmObj.outputText.focus( );
        return;
    }

    frmObj.action="../requestor/addMembersSubmit.jsp?groupId="+groupId;
	frmObj.submit( );

}

function sendMail(){
    junk1= "!~+%<>?`:#$%^&*()=|[]{}\\";
    frmObj= document.priceApproval;
    value= frmObj.outputText.value;

    // Check Members List for Null
    stat = checkNull("Members List", value);

    if(!stat){
        frmObj.outputText.focus();
        return;
    }

   // Check Members List for Junk
    stat = checkJunk("Members List",  value ,junk1);
    if(!stat){
        frmObj.outputText.focus( );
        return;
    }

    frmObj.action="utils/sendMail.jsp";
    frmObj.submit();
}