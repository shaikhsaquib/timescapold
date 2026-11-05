<%
	Hashtable statusHash = new Hashtable();
	Hashtable statusImg = new Hashtable();

	statusHash.put("UC","User Created");
	statusHash.put("UD","User Deleted");
	statusHash.put("CL","User Closed");
	statusHash.put("UR","User Retained");
	statusHash.put("RA","Reviewed");
	statusHash.put("RR","Reviewer Rejected");

	statusHash.put("TS", "Transfer Note Created");
	statusHash.put("TSR", "Note Deleted");
	statusHash.put("TA",  "Transferor Dept. Head Approved");
	statusHash.put("TAR", "Transferor Dept. Head Rejected");
	statusHash.put("TP",  "Branch Head Approved");
	statusHash.put("TPR", "Branch Head Rejected");
	statusHash.put("TRR", "Transferee Dept. Head Rejected");
	statusHash.put("UR","User Retained");
	statusHash.put("CL", "Closed");

	statusHash.put("DS", "Disposal Created");
	statusHash.put("DSR", "Disposal Rejected");
	statusHash.put("DV", "Verified");
	statusHash.put("DVR", "Verifier Rejected");
	statusHash.put("DP", "Proposed");
	statusHash.put("DPR", "Proposor Rejected");
	statusHash.put("DA", "Approved");
	statusHash.put("DAR", "Approver Rejected");
	statusHash.put("DAH", "Admin Head Approved");
	statusHash.put("DAHR", "Admin Head Rejected");
	statusHash.put("DBH", "Branch Head Approved");
	statusHash.put("DBHR", "Branch Head Rejected");
	statusHash.put("CL", "Closed");
	statusHash.put("DIAR", "Internal Audit Rejected");

	
	statusImg.put("UC","../images/inProcess.png");
	statusImg.put("UD","../images/widraw.jpg");
	statusImg.put("UR","../images/retain.png");
	statusImg.put("CL","../images/closed.png");
	statusImg.put("RA","../images/available.png");
	statusImg.put("RR","../images/rejected.jpg");

	statusImg.put("TS", "../images/ATN_Process.png");
	statusImg.put("TSR", "../images/rejected.jpg");
	statusImg.put("TV",  "../images/ATN_Process.png");
	statusImg.put("TVR", "../images/rejected.jpg");
	statusImg.put("TP",  "../images/ATN_Process.png");
	statusImg.put("TPR", "../images/rejected.jpg");
	statusImg.put("TA",  "../images/ATN_Process.png");
	statusImg.put("TAR", "../images/rejected.jpg");
	statusImg.put("TCL", "../images/ATN_com.png");
	statusImg.put("TAHR", "../images/rejected.jpg");

	statusImg.put("DS", "../images/ADN_Process.png");
	statusImg.put("DSR", "../images/rejected.jpg");
	statusImg.put("DV",  "../images/ADN_Process.png");
	statusImg.put("DVR", "../images/rejected.jpg");
	statusImg.put("DP",  "../images/ADN_Process.png");
	statusImg.put("DPR", "../images/rejected.jpg");
	statusImg.put("DA",  "../images/ADN_Process.png");
	statusImg.put("DAR", "../images/rejected.jpg");
	statusImg.put("DAH",  "../images/ADN_Process.png");
	statusImg.put("DAHR", "../images/rejected.jpg");
	statusImg.put("DBH",  "../images/ADN_Process.png");
	statusImg.put("DBHR", "../images/rejected.jpg");
	statusImg.put("DCL",  "../images/ADN_com.png");
	statusImg.put("DIAR", "../images/rejected.jpg");
%>