<!--<%--
 -- Comments....
 -- @author		Ashutosh Joshi
 -- @version 	1.00, May 2012.
 --%> -->

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
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
	ArrayList detailsList1 = new ArrayList();

	String gatePassType = (String)request.getParameter("gatePassType");
	gatePassType = Utility.replaceQuoteOracle(gatePassType);

	String partyName = (String)request.getParameter("partyName");
	partyName = Utility.replaceQuoteOracle(partyName);

	String partyAddress = (String)request.getParameter("partyAddress");
	partyAddress = Utility.replaceQuoteOracle(partyAddress);

	String partyPersonName = (String)request.getParameter("partyPersonName");
	partyPersonName = Utility.replaceQuoteOracle(partyPersonName);

	String ownership = (String)request.getParameter("ownership");
	ownership = Utility.replaceQuoteOracle(ownership);

	String itemCategory = (String)request.getParameter("itemCategory");
	itemCategory = Utility.replaceQuoteOracle(itemCategory);

	String returnDate = (String)request.getParameter("returnDate");
	returnDate = Utility.replaceQuoteOracle(returnDate);

	String purchaseOrderJobNo = (String)request.getParameter("purchaseOrderJobNo");
	purchaseOrderJobNo = Utility.replaceQuoteOracle(purchaseOrderJobNo);

	String purchaseOrderDate = (String)request.getParameter("purchaseOrderDate");
	purchaseOrderDate = Utility.replaceQuoteOracle(purchaseOrderDate);

	String preparedBy = (String)request.getParameter("preparedBy");
	preparedBy = Utility.replaceQuoteOracle(preparedBy);

	String authorisedBy = (String)request.getParameter("authorisedBy");
	authorisedBy = Utility.replaceQuoteOracle(authorisedBy);

	String reviewedBy = (String)request.getParameter("reviewedBy");
	reviewedBy = Utility.replaceQuoteOracle(reviewedBy);

	String mobileNumber = (String)request.getParameter("mobileNumber");
	mobileNumber = Utility.replaceQuoteOracle(mobileNumber);

	String vehicleNumber = (String)request.getParameter("vehicleNumber");
	vehicleNumber = Utility.replaceQuoteOracle(vehicleNumber);
	
	String fromAddress = (String)request.getParameter("fromAddress");
	fromAddress = Utility.replaceQuoteOracle(fromAddress);

	//out.println("authorisedBy==="+authorisedBy);
//out.println("reviewedBy==="+reviewedBy);
	String[] reviewedName = null;
	String[] authorisedName = null;

	String authorisedId = "0";
	String reviewedId = "0";
	String emialID = "";
	String text = "";
	String recepientEmailID = "";

	if(reviewedBy.equals("0") && authorisedBy!=null && !authorisedBy.equals("0"))
	{
		 authorisedName = authorisedBy.split(",");

		 authorisedId = authorisedName[0];

		 emialID = authorisedName[1].substring(0,authorisedName[1].indexOf("."));

		 text = "Approve Requests";

		 recepientEmailID = authorisedName[1];
		 

	}else if(!reviewedBy.equals("0") && authorisedBy!=null && !authorisedBy.equals("0"))
	{
		authorisedName = authorisedBy.split(",");

		reviewedName = reviewedBy.split(",");

		emialID = reviewedName[1].substring(0,reviewedName[1].indexOf("."));

		authorisedId = authorisedName[0];

		reviewedId = reviewedName[0];

		text = "Review Requests";

		recepientEmailID = reviewedName[1];
	}

	headerHash.put("TYPE",gatePassType);
	headerHash.put("FROMADDRESS",fromAddress);
	headerHash.put("PARTYNAME",partyName);
	headerHash.put("ADDRESS",partyAddress);
	headerHash.put("REPRESENTEDBY",partyPersonName);
	headerHash.put("MATERIALOWNER",ownership);
	headerHash.put("MATERIALCATEGORY",itemCategory); 	

	if(returnDate == null || returnDate.trim().equals("")){

		returnDate = todayDate;
	}
	
	headerHash.put("DATEOFRETURN",returnDate);

	if(purchaseOrderJobNo == null || purchaseOrderJobNo.trim().equals("")){

		purchaseOrderJobNo = "0";
	}

	headerHash.put("PONO",purchaseOrderJobNo);
	
	if(purchaseOrderDate == null || purchaseOrderDate.trim().equals("") ){

		purchaseOrderDate = todayDate;
	}

	headerHash.put("PODATE", purchaseOrderDate);

	headerHash.put("CREATEDBY", timescapeUserOId+"");
	headerHash.put("MODIFIEDBY", timescapeUserOId+"");
	headerHash.put("AUTHORISEDBY", authorisedId);
	headerHash.put("REVIEWEDBY", reviewedId);
	headerHash.put("PRINTEDBY", "0");
	headerHash.put("STATUS", "UC");
	headerHash.put("REJECTEDREMARKS","-");
	headerHash.put("MOBILENUMBER",mobileNumber);
	headerHash.put("VEHICLENUMBER",vehicleNumber); 	


	String[] materialDesc = (String[])request.getParameterValues("materialDesc");

	String[] quantity = (String[])request.getParameterValues("quantity");

	String[] uomId = (String[])request.getParameterValues("uomId");

	String[] transferNoteNo = (String[])request.getParameterValues("transferNoteNo");

	String[] assetransferdate = (String[])request.getParameterValues("assetransferdate");

	String[] location = (String[])request.getParameterValues("location");

	String[] remarks = (String[])request.getParameterValues("remarks");

	String[] serialNum = (String[])request.getParameterValues("serialNum");


	int counter = 0;

	for(int ii=0; ii < materialDesc.length ; ii++){


		if(!materialDesc[ii].trim().equals("")){

			counter++;

			String valArr[] = new String [12];
			String valArrLog[] = new String [6];

			valArr[0] = counter+"";
			valArr[1] = location[ii];
			valArr[2] = Utility.replaceQuoteOracle(materialDesc[ii]);
			valArr[3] = quantity[ii];
			valArr[4] = uomId[ii];
			valArr[5] = transferNoteNo[ii].trim().equals("") ? "0" : transferNoteNo[ii];
			valArr[6] = assetransferdate[ii].trim().equals("") ? todayDate : assetransferdate[ii];
			valArr[7] = Utility.replaceQuoteOracle(remarks[ii]);
			valArr[8] = "0";
			valArr[9] = gatePassType.equals("R") ? quantity[ii] : "0";
			valArr[10] = gatePassType;
			valArr[11] = serialNum[ii];
			
			detailsList.add(valArr);

		} 

	}
	
	Hashtable resultHash = new Hashtable();

	resultHash = GatepassController.createRequest(headerHash, detailsList);

	Boolean flag		= (Boolean)resultHash.get("FLAG");
	String gatepassId	= (String)resultHash.get("GATEPASSID");


	if(flag == true)
	{
		String content="" ;
		String emailid2=emailId;
		String subject = "Outward Gatepass Request";
		boolean mailStatus = true;
		
		content  = "Dear "+emialID+", \n\n";
		content += "You have "+gatepassId+" Outward GatePassID is still pending for accepting.\n\n";
		content += "To browse these applications please click the Application Services ---> GatePass ---> Related links ---> "+text+" link on the home page of TIMESCAPE.\n\n";
		content += "Thank you,\n\n";
		content += "Regards,\n\n";
		content += ""+firstName+" "+surName+" ";

		mailStatus =  
		//GatepassController.sendIndividualMail(authorisedName[1],content,emailid2,subject);//commented by Sachin R Mehta on 09-11-2015 due to issue in mail recepient
		GatepassController.sendIndividualMail(recepientEmailID,content,emailid2,subject);
		//mailStatus =  GatepassController.sendIndividualMail(emailId,content,emailid2);*/
	}

	if(flag){
		
		response.sendRedirect("../common/promptPage.jsp?msg=SUC_REQ");
	
	}else{

		response.sendRedirect("../common/promptPage.jsp?msg=ERR_REQ");

	}
%>