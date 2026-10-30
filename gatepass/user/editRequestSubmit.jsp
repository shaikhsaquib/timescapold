<!--<%--
 -- Comments....
 -- @author		Ashutosh Joshi
 -- @version 	1.00, May 2012.
 --%> -->

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
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

	String gatepassId = (String)request.getParameter("gatepassId");
	gatepassId = Utility.replaceQuoteOracle(gatepassId);

	String gatePassType = (String)request.getParameter("gatePassType");
	gatePassType = Utility.replaceQuoteOracle(gatePassType);

	String partyName = (String)request.getParameter("partyName");
	partyName = Utility.replaceQuoteOracle(partyName);

	String partyAddress = (String)request.getParameter("partyToAddress");
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

	String fromAddress = (String)request.getParameter("fromAddress");
	fromAddress = Utility.replaceQuoteOracle(fromAddress);



	headerHash.put("GATEPASSID",gatepassId);
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
	headerHash.put("AUTHORISEDBY", authorisedBy);
	headerHash.put("REVIEWEDBY", reviewedBy);
	headerHash.put("PRINTEDBY", "0");
	headerHash.put("STATUS", "UC");
	headerHash.put("REJECTEDREMARKS","-");
	headerHash.put("MOBILENUMBER",mobileNumber);




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

			String valArr[] = new String [13];


			valArr[0] = location[ii];
			valArr[1] = Utility.replaceQuoteOracle(materialDesc[ii]);
			valArr[2] = quantity[ii];
			valArr[3] = uomId[ii];
			valArr[4] = transferNoteNo[ii].trim().equals("") ? "0" : transferNoteNo[ii];
			valArr[5] = assetransferdate[ii].trim().equals("") ? todayDate : assetransferdate[ii];
			valArr[6] = Utility.replaceQuoteOracle(remarks[ii]);
			valArr[7] = "0";
			valArr[8] = gatePassType.equals("R") ? quantity[ii] : "0";
			valArr[9] = gatePassType;
			valArr[10] = serialNum[ii];
			valArr[11] = gatepassId;
			valArr[12] = counter+"";
			
			
			detailsList.add(valArr); 

		}

	}
	//out.println(headerHash);

	String showResponse = "Your request has been updated successfully.!!";
	boolean flag = false;

	flag = GatepassController.updateEditRequest(headerHash, detailsList);
	
	//out.println(headerHash);

	if(flag){
		
		response.sendRedirect("../common/promptPage.jsp?msg=SUC_REVIEWREQ");
	
	}else{

		response.sendRedirect("../common/promptPage.jsp?msg=ERR_REVIEWREQ");

	}
%>
