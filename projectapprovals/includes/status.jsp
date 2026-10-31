<%
	Hashtable requestStatus = new Hashtable( );

	requestStatus.put("P", "inProcess.png");
	requestStatus.put("RR", "unitApproved.png");
	requestStatus.put("R", "depApproved.png");
	requestStatus.put("A", "finalised.png");
	requestStatus.put("C", "rejected.jpg");

	//String[][] stageNStatus = {{"REQ", "00"}, {"APP", "01"}, {"REQ", "00"}, {"REQ", "00"}, {"REQ", "00"}, {"REQ", "00"}};
%>