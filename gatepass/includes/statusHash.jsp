<%
	Hashtable statusHash = new Hashtable();
	Hashtable statusInHash = new Hashtable();
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
	statusImg.put("R", "../images/arrow_returnable1.png");

	statusImg.put("PA", "../images/arrow_partiallyReturned.png");
	statusImg.put("PAR", "../images/arrow_notReturned.png");
	statusImg.put("CL", "../images/arrow_returnable.png");

	statusInHash.put("UC","In Process");
	statusInHash.put("UR","Cancelled");
	statusInHash.put("CL","Closed");
	statusInHash.put("RA","Received");
	statusInHash.put("RR","Receiver Rejected");
	statusInHash.put("MA","Modified");
	statusInHash.put("MR","Modifier Rejected");
	statusInHash.put("AA","Approved");
	statusInHash.put("AR","Approver Rejected");
	statusInHash.put("PA","Processed (Goods Pending)");
	statusInHash.put("PR","Processor Rejected");

%>