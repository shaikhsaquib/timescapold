<%
//out.println(companyCode);
Hashtable statusHash = new Hashtable();

statusHash.put("L","Pending with Dept Approver");
statusHash.put("H","Pending with Dept Approver");
statusHash.put("LP","Pending with Dept Approver");
statusHash.put("HP","Pending with Dept Approver");
statusHash.put("A","Approved");
statusHash.put("LD","Dept Approved");
statusHash.put("HD","Pending with HR");
statusHash.put("HA","Pending with HR");
statusHash.put("C","Cancelled");
statusHash.put("R","Rejected");
statusHash.put("P","Pending with Printer");
if (companyCode.equals("1000")){
	statusHash.put("V","Cards in Printing Stage");
}else
statusHash.put("V","Card Dispatched");
statusHash.put("D","Card Received");
%>