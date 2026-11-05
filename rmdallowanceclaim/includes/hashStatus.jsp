<%@ page language="java" %>


<%
		Hashtable leaveDesc	=	new Hashtable();
		leaveDesc.put("SL", "Sick Leave");
		leaveDesc.put("PL", "Privilege Leave");
		leaveDesc.put("CL", "Casual Leave");
		leaveDesc.put("OD", "Outdoor Duty");
		leaveDesc.put("CO", "Compensatory Off");
		leaveDesc.put("OH", "Optional Holiday");
		leaveDesc.put("ML", "Maternity Leave");
		leaveDesc.put("NL", "Nursing Leave");
		leaveDesc.put("LP", "Leave Without Pay");
		leaveDesc.put("LWP", "Leave Without Pay");
		leaveDesc.put("CO", "Comp Off");
		leaveDesc.put("AL", "Accident Leave");
		leaveDesc.put("PE", "Privilege Leave Quota Extension");
		leaveDesc.put("CA", "Comp Off Accrual");
		leaveDesc.put("PLE", "Privilege Leave Encashment");
		leaveDesc.put("APL", "Advance Privilege Leave");
		leaveDesc.put("ASL", "Advance Sick Leave");
		leaveDesc.put("TL", "Transfer Leave");
		leaveDesc.put("PLEX", "Privilege Leave Extension");
		leaveDesc.put("SLEX", "Sick Leave Extension");

		Hashtable quantumDesc =	new Hashtable();
		quantumDesc.put("FH", "First Half");
		quantumDesc.put("SH", "Second Half");
		quantumDesc.put("FD", "Full Day");

		Hashtable status =	new Hashtable();
		status.put("L", "IN PROCESS");
		status.put("A", "APPROVED");
		status.put("CA", "APPROVED");
		status.put("CAX", "APPROVED");
		status.put("R", "REJECTED");
		status.put("X", "CANCELLED");
		status.put("RC", "REQUEST FOR CANCELLATION");
		status.put("RCA", "CANCELLATION APPROVED");
		status.put("RCR", "CANCELLATION REJECTED");


		Hashtable statusImg = new Hashtable();
		statusImg.put("L", "../images/inProcess.png");
		statusImg.put("A", "../images/approved.png");
		statusImg.put("CA", "../images/accrual.png");
		statusImg.put("CAX", "../images/approved.png");
		statusImg.put("R", "../images/rejected.jpg");
		statusImg.put("X", "../images/deleted.png");
		statusImg.put("RC", "../images/inProcess.png");
		statusImg.put("RCA", "../images/approved.png");
		statusImg.put("CAA", "../images/approved.png");
		statusImg.put("RCR", "../images/rejected.jpg");

		Hashtable statusCancelImg = new Hashtable();
		statusCancelImg.put("RC", "../images/cancellation.png");
		statusCancelImg.put("RCA", "../images/cancellation.png");

		Hashtable holidayimg = new Hashtable();
		holidayimg.put("O", "../images/optional.png");
		holidayimg.put("G", "../images/general.png");

%>