function validateUser(what , index){
	frmObj = document.searchUser;
	//alert(what);
	//alert(index);
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";
    var goodchars="0123456789";
	var selectedOption = '';
	var choice = 0;
		
	//name = document.getElementById('email').value;
      var name = frmObj.email.value;

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
	
	loadFragment('../includes/contacts1.jsp?name='+name+'&selectedOpt='+selectedOption+'&what='+what+'&index='+index,'members','Members');

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
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center" class="nav"><span class="bluesmall"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+'</span></div></td></tr></table>';
        
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
	//alert("hi");
	frmObj = document.priceApproval;
	frmObj.reset();
}


