
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Arrays" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" scope="session"/>
<jsp:useBean id ="xmlUtility" class = "com.bccl.util.XMLUtility"/>

<%
	Hashtable userMediClaimDetails = (Hashtable) session.getAttribute("medicalimDataHash");
	Hashtable dataHash = new Hashtable();
	Hashtable detailsHash = new Hashtable();
	ArrayList resultList  = new ArrayList();
	ArrayList UserIdForTOPUP = new ArrayList();

	String finalamt = "";

	String emailid = (String) userMediClaimDetails.get("emailId");
	String amount = (String) userMediClaimDetails.get("amount");

	//String createdby = (String) userMediClaimDetails.get("createdby");
	//String createdby = (String)request.getParameter("emailid");
	
	String createdby1 = (String) session.getAttribute("setEmailId");
	String premiumamt = (String) userMediClaimDetails.get("premiumamt");
	String existingAmt = (String) userMediClaimDetails.get("existingAmt");
	
	//out.println(createdby1);

	//String status = (String) userMediClaimDetails.get("status");
	//String commentsStr = (String)request.getParameter("txtComments");

	UserIdForTOPUP = mediclaimController.getUserIdForTOPUP(createdby1); 

	String createdby = ((String[])UserIdForTOPUP.get(0))[0];
	//out.println(createdby);
	//String createdby = idNew[0];

	String testYear = "2018";

	detailsHash.put("timescapeUserOID",createdby);
	detailsHash.put("currYear",testYear);
	
	resultList = mediclaimController.viewTopupAmount(detailsHash); 

	if(resultList.size() == 0 ){

		int totalCoverValue = Integer.parseInt(existingAmt) + Integer.parseInt(amount);
		//out.println(totalCoverValue);

		dataHash.put("FINALAMT",amount);
		dataHash.put("PREAMT",premiumamt);
		dataHash.put("FINALTOTALCOVER",totalCoverValue+"");
		dataHash.put("CURRYEAR1","2018");
		dataHash.put("TIMESCAPEUSEROID",createdby);

		boolean chkStatus = false;
		chkStatus = mediclaimController.createAmtRecord(dataHash);
		out.println(chkStatus);
	}else{
		out.println("already done");
	}
%>