<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Utility" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>

<%
	String todayDate = Utility.returnCurrentDate();
	//out.println(todayDate);

	Hashtable headerHash = new Hashtable();
	ArrayList detailsList = new ArrayList();

	String compCode = (String)request.getParameter("comp");

	String locnCode = (String)request.getParameter("locn");

	String deptCode = (String)request.getParameter("deptCode");

	String timescapUserOID = (String)request.getParameter("timescapUserOID");

	String rowCount = (String)request.getParameter("rowCount");

	int  rowCount1  = Integer.parseInt(rowCount);

	String gatePassType = (String)request.getParameter("gatePassType");
	gatePassType = Utility.replaceQuoteOracle(gatePassType);

	String vmsReferenceId = (String)request.getParameter("vmsReferenceId");
	vmsReferenceId = Utility.replaceQuoteOracle(vmsReferenceId);

	String outReferenceNum = (String)request.getParameter("outReferenceNum");
	outReferenceNum = Utility.replaceQuoteOracle(outReferenceNum);

	String partyName = (String)request.getParameter("partyName");
	partyName = Utility.replaceQuoteOracle(partyName);

	String mobileNumber = (String)request.getParameter("mobileNumber");
	mobileNumber = Utility.replaceQuoteOracle(mobileNumber);

	String partyAddress = (String)request.getParameter("partyAddress");
	partyAddress = Utility.replaceQuoteOracle(partyAddress);

	String returnDate = (String)request.getParameter("returnDate");
	returnDate = Utility.replaceQuoteOracle(returnDate);

	String totalPendingQuan = (String)request.getParameter("totalPendingQuan");
	totalPendingQuan = Utility.replaceQuoteOracle(totalPendingQuan);

	String vehicleNo = (String)request.getParameter("vehicleNo");
	vehicleNo = Utility.replaceQuoteOracle(vehicleNo);

	headerHash.put("INWARDTYPE",gatePassType);
	headerHash.put("VMSREFNO",vmsReferenceId);
	headerHash.put("OUTWARDREFNO",outReferenceNum);
	headerHash.put("PARTYNAME",partyName);
	headerHash.put("MOBILENO",mobileNumber);
	headerHash.put("ADDRESS",partyAddress);
	

	if(returnDate == null || returnDate.trim().equals("")){

		returnDate = todayDate;
	}
	
	headerHash.put("DATEOFRETURN",returnDate);
	headerHash.put("COMPANYCODE",compCode);
	headerHash.put("LOCATIONID",locnCode);
	headerHash.put("DEPARTMENT",deptCode);
	headerHash.put("USERTIMECAPEUSEROID",timescapUserOID);
	headerHash.put("CREATEDBY",timescapeUserOId+"");
	headerHash.put("RECEIVEDBY",'0');
	headerHash.put("MODIFIEDBY",'0');
	headerHash.put("ACCEPTEDBY",'0');
	headerHash.put("APPROVEDBY",'0');
	headerHash.put("STATUS", "UC");
	headerHash.put("TOTALPENDINGQUANTITY", totalPendingQuan);
	headerHash.put("VEHICLENO", vehicleNo);

	
	//out.println(headerHash);
	
	//String[] purchaseOrderNo = (String[])request.getParameterValues("purchaseOrderNo");

	
	//String[] dcInvoice = (String[])request.getParameterValues("dcInvoice");


	//String[] materialDesc = (String[])request.getParameterValues("materialDesc");


	//String[] uomId = (String[])request.getParameterValues("uomId");

	//String[] quantity = (String[])request.getParameterValues("quantity");

	//String[] remarks = (String[])request.getParameterValues("remarks");

	
	int counter = 0;

	out.println("purchaseOrderNo.length---"+rowCount);

	for(int ii=0; ii < rowCount1; ii++){

	String	purchaseOrderNo = (String) request.getParameter("purchaseOrderNo"+ii);

	out.println("purchaseOrderNo---"+purchaseOrderNo);

	String	dcInvoice = (String) request.getParameter("dcInvoice"+ii);

	out.println("dcInvoice---"+dcInvoice);

	String	materialDesc = (String) request.getParameter("materialDesc"+ii);

	out.println("materialDesc---"+materialDesc);

	String	uomId = (String) request.getParameter("uomId"+ii);

	out.println("uomId---"+uomId);

	String	remarks = (String) request.getParameter("remarks"+ii);

	out.println("remarks---"+remarks);

	String	quantity = (String) request.getParameter("quantity"+ii);

	out.println("quantity---"+quantity);

	String	rejectQuan = (String) request.getParameter("rejectQuan"+ii);

	out.println("rejectQuan---"+rejectQuan);

	String	receivedQuan = (String) request.getParameter("receivedQuan"+ii);
	out.println("receivedQuan---"+receivedQuan);

		/*if(!purchaseOrderNo[ii].trim().equals("")){

			counter++;

			String valArr[] = new String [11];

			valArr[0] = gatePassType;

			valArr[1] = counter+"";
			
			valArr[2] = Utility.replaceQuoteOracle(purchaseOrderNo[ii]);

			valArr[3] = Utility.replaceQuoteOracle(dcInvoice[ii]);

			valArr[4] = Utility.replaceQuoteOracle(materialDesc[ii]);

			valArr[5] = uomId[ii];

			valArr[6] = quantity;

			valArr[7] = Utility.replaceQuoteOracle(remarks[ii]);

			valArr[8] = rejectQuan;

			valArr[9] = receivedQuan;

			valArr[10] = receivedQuan;
	
			detailsList.add(valArr);

		} */

	}


	/*boolean flag = GatepassController.createInwardRequest(headerHash, detailsList);
	
	//out.println(flag);

	if(flag){
		
		response.sendRedirect("../common/promptPage.jsp?msg=SUC_INWARDREQ");
	
	}else{

		response.sendRedirect("../common/promptPage.jsp?msg=ERR_INWARDREQ");

	}*/

%>

