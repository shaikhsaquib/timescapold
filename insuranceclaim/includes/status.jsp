<%
	Hashtable requestStatus = new Hashtable( );

	requestStatus.put("L", "inProcess.png");//User has put the claim
	requestStatus.put("W", "withdrawn.png");// User has withdrawn the claim
	requestStatus.put("HA", "unitApproved.png");//Approver has accepted the claim
	requestStatus.put("A", "unitApproved.png");//Approver has appointed the surveyor and fully accepted the claim
	requestStatus.put("UF", "inProcess.png");//User has filled the form
	requestStatus.put("AR", "rejected.png");// Approver has rejected the form
	requestStatus.put("AF", "formsApproved.png");// Approver has accepted the form
	requestStatus.put("UC", "inProcess.png");// User has filled the courier details
	requestStatus.put("P", "inProcess.png");//Approver has processed courier details
	requestStatus.put("S", "settled.png");//Insurance has settled the claim
	requestStatus.put("R", "rejected.png");//Approver has rejected the claim
	requestStatus.put("AC", "rejected.png");//Approver has rejected the courier details
	requestStatus.put("IR", "rejected.png");// Insurance company has rejected the claim
	requestStatus.put("H", "onHold.png");// Approver has put your request on hold
%>