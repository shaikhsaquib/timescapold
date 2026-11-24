<%
	Hashtable formsHeaders = new Hashtable();
	//out.println(formsHeaderValue);
	if(!formsHeaderValue.equals("1"))
		formsHeaders.put("fireclaimdetailXML", "<fireclaimdetails />");
	if(!formsHeaderValue.equals("2"))
		formsHeaders.put("marineclaimdetailXML", "<marineclaimdetails />");
	if(!formsHeaderValue.equals("3"))
		formsHeaders.put("allriskclaimdetailXML", "<allriskclaimdetails />");
	if(!formsHeaderValue.equals("4"))
		formsHeaders.put("bajajmotorclimdetailXML", "<bajajmotorclaimdetails />");
	if(!formsHeaderValue.equals("5"))
		formsHeaders.put("burglaryclaimdetailXML", "<burglaryclaimdetails />");
	if(!formsHeaderValue.equals("6"))
		formsHeaders.put("eeclaimdetailXML", "<eeclaimdetails />");
	if(!formsHeaderValue.equals("7"))
		formsHeaders.put("erectionclaimdetailXML", "<erectionclaimdetails />");
	if(!formsHeaderValue.equals("8"))
		formsHeaders.put("fidelityclaimdetailXML", "<fidelityclaimdetails />");
	if(!formsHeaderValue.equals("9"))
		formsHeaders.put("hdclaimdetailXML", "<hdclaimdetails />");
	if(!formsHeaderValue.equals("10"))
		formsHeaders.put("machineryclaimdetailXML", "<machineryclaimdetails />");
	if(!formsHeaderValue.equals("11"))
		formsHeaders.put("moneytclaimdetailXML", "<moneytclaimdetails />");
	if(!formsHeaderValue.equals("12"))
		formsHeaders.put("motorclaimdetailXML", "<motorclaimdetails />");
	if(!formsHeaderValue.equals("13"))
		formsHeaders.put("accidentclaimdetailXML", "<accidentclaimdetails />");
	if(!formsHeaderValue.equals("14"))
		formsHeaders.put("pliabilityclaimdetailXML", "<pliabilityclaimdetails />");
	if(!formsHeaderValue.equals("15"))
		formsHeaders.put("genericclaimdetailXML", "<genericclaimdetails />");

%>