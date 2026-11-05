function validateUser(tblId){

	frmObj = document.priceApproval;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";
    var goodchars="0123456789";
	var selectedOption = '';
	var choice = 0;

    var name = trim(frmObj.email.value);

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

	loadFragment('../includes/contacts.jsp?name='+name+'&selectedOpt='+selectedOption+"&tblId="+tblId,'members','Members');

}

function clear()
{
	//alert("hi");
	frmObj = document.priceApproval;
	frmObj.reset();
}

function add(tblId,emailId,NewtblId,tOId,NewtblIdN,name)
{
	self.opener.document.getElementById(tblId).value    = emailId; 
    self.opener.document.getElementById(NewtblId).value = tOId;
    self.opener.document.getElementById(NewtblIdN).value = name;
    self.close();
}

