<%
	Hashtable statusHash = new Hashtable();
	Hashtable statusImg = new Hashtable();

	statusHash.put("N","Non Returnable");
	statusHash.put("R","Returnable");
	statusHash.put("UC","In Process");
	statusHash.put("UR","Cancelled");
	statusHash.put("CL","Closed");
	statusHash.put("RA","Reviewed");
	statusHash.put("RR","Reviewer Rejected");
	statusHash.put("AA","Approved");
	statusHash.put("AR","Approver Rejected");
	statusHash.put("PA","Processed (Goods Pending)");
	statusHash.put("PR","Processor Rejected");
	
	statusImg.put("N", "../images/arrow_nonreturnable.png");
	statusImg.put("R", "../images/arrow_returnable.png");
	statusImg.put("UC", "../images/ico_inprocess.png");
	statusImg.put("UR", "../images/ico_rejected.png");
	statusImg.put("PA", "../images/ico_processed.png");
	statusImg.put("RA","../images/ico_approved.png");
	statusImg.put("RR","../images/ico_brejected.png");
	statusImg.put("AA", "../images/ico_bapproved.png");
	statusImg.put("AR", "../images/ico_brejected.png");
	statusImg.put("PR","../images/ico_brejected.png");
	statusImg.put("CL","../images/ico_processed.png");

%>