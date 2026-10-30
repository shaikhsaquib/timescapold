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

	String emailid1 = (String)request.getParameter("emailid1");

	String userName = emailid1.substring(0,emailid1.indexOf("."));

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
	
//	String[] purchaseOrderNo = (String[])request.getParameterValues("purchaseOrderNo");

//		out.println("purchaseOrderNo---"+purchaseOrderNo);


	//String[] dcInvoice = (String[])request.getParameterValues("dcInvoice");

	//	out.println("dcInvoice---"+dcInvoice);


	//String[] materialDesc = (String[])request.getParameterValues("materialDesc");

	//	out.println("materialDesc---"+materialDesc);

	
	//String[] uomId = (String[])request.getParameterValues("uomId");

	//out.println("uomId---"+uomId);


	//String[] quantity = (String[])request.getParameterValues("quantity");

//	String[] remarks = (String[])request.getParameterValues("remarks");

	//	out.println("remarks---"+remarks);

	//out.println("ww--"+purchaseOrderNo.length);
	
	int counter = 0;

	for(int ii=1; ii <= rowCount1 ; ii++){

	String	purchaseOrderNo = (String) request.getParameter("purchaseOrderNo"+ii);

	String	dcInvoice = (String) request.getParameter("dcInvoice"+ii);

	String	materialDesc = (String) request.getParameter("materialDesc"+ii);

	String	uomId = (String) request.getParameter("uomId"+ii);

	String	remarks = (String) request.getParameter("remarks"+ii);

	String	quantity = (String) request.getParameter("quantity"+ii);
	
	String	rejectQuan = (String) request.getParameter("rejectQuan"+ii);

	String	receivedQuan = (String) request.getParameter("receivedQuan"+ii);

		if(!purchaseOrderNo.trim().equals("")){

			counter++;

			String valArr[] = new String [11];

			valArr[0] = gatePassType;

			valArr[1] = counter+"";
			
			valArr[2] = Utility.replaceQuoteOracle(purchaseOrderNo);

			valArr[3] = Utility.replaceQuoteOracle(dcInvoice);

			valArr[4] = Utility.replaceQuoteOracle(materialDesc);

			valArr[5] = uomId;

			valArr[6] = quantity;

			valArr[7] = Utility.replaceQuoteOracle(remarks);

			valArr[8] = rejectQuan;

			valArr[9] = receivedQuan;

			valArr[10] = receivedQuan;
	
			detailsList.add(valArr);

		} 

	}
	Hashtable resultHash = new Hashtable();
	resultHash = GatepassController.createInwardRequest(headerHash, detailsList);
	Boolean flag = (Boolean)resultHash.get("FLAG");
	String reqgatepassid = (String)resultHash.get("REQGATEPASSID");
 
	//boolean flag = GatepassController.createInwardRequest(headerHash, detailsList);
	//boolean flag =  true;

	if(flag == true)
	{	
		String content="" ;
		//String emailid2=emailId;
		String emailid2="timescape.admin@timesgroup.com";
		String subject = "Inward Gatepass Request";
		boolean mailStatus = true;
		
		content  = "Dear "+userName+", \n\n";
		content += "You have "+reqgatepassid+" Inward GatePassID is still pending for accepting.\n\n";
		content += "To browse these applications please click the Application Services ---> GatePass ---> Related links ---> View Incoming IW Requests link on the home page of TIMESCAPE.\n\n";
		content += "Thank you,\n\n";
		content += "Regards,\n\n";
		content += ""+firstName+" "+surName+" ";

		//mailStatus =  GatepassController.sendIndividualMail("vishal.kshirsagar@timesgroup.com"/*apprv[0]*/,content,emailid2);
		mailStatus =  GatepassController.sendIndividualMail(emailid1,content,emailid2,subject);

	}
	
	if(flag){
		
		response.sendRedirect("../common/promptPage.jsp?msg=SUC_INWARDREQ");
	
	}else{

		response.sendRedirect("../common/promptPage.jsp?msg=ERR_INWARDREQ");
	}

%>

