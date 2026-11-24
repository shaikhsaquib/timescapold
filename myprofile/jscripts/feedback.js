function feedback()
{
	var junk = "~+%<>`\"';#$%^*=|[]{}\\";
	frmObj = document.frmFeedback;

	content = frmObj.content.value;
	subject = frmObj.subject.value;
//	alert("Val: "+firstName);
//	alert("Val: "+lastName);


/*--------------Subject check begins--------------*/
	/*
		Checks on subject
		1) It should not be null/ space contained
		2) It should not contain junk
	*/

	/*stat = checkNull("Subject",subject);
	if(!stat){
		frmObj.subject.focus();
		return;
	}

	stat = checkJunk("Subject", subject, junk);
	if(!stat){
		frmObj.subject.focus();
		return;
	}*/

/*--------------Subject check Ends--------------*/

/*--------------Content check begins--------------*/
	/*
		Checks on Content
		1) It should not be null/ space contained
		2) It should not contain junk

	*/

	stat = checkNull("Comments ",content);
	if(!stat){
		frmObj.content.focus();
		return;
	}

	stat = checkJunk("Comments ", content, junk);
	if(!stat){
		frmObj.content.focus();
		return;
	}
/*--------------Content check Ends--------------*/

	frmObj.action = "../profile/exception.jsp";
	frmObj.submit();
}
