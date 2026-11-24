<%--
 -- Business Card Requestor
 -- @(#)requestCardSubmit.jsp	13-NOV-2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Amruta Gangan
 -- @version 	1.00, 13-NOV-2008
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date" %>
<%@ page import="com.bccl.util.Utility,com.bccl.util.HtmlUtil,com.bccl.tsenvironment.EnvironmentProperties"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>
  

<%
	Utility util = new Utility();

//Get the parameters from previewRequest.jsp
	String fstName			= (String)request.getParameter("firstName");
	String lstName			= (String)request.getParameter("lastName");
	String dsgn				= (String)request.getParameter("designation");
	String workArea			= (String)request.getParameter("workArea");
	String userBoardNumber	= (String)request.getParameter("userBoardNumber");
	String directPhoneNo	= (String)request.getParameter("directPhoneNo");
	String fax				= (String)request.getParameter("fax");
	String mobileNumber		= (String)request.getParameter("mobileNumber");
	String extensionNumber	= (String)request.getParameter("extensionNumber");
	String website			= (String)request.getParameter("website");
	String cardTemplate		= (String)request.getParameter("cardTemplate");
	System.out.println("--------------------"+cardTemplate);
	String addressCode		= (String)request.getParameter("addressCode");
	String changedLocnCode	= (String)request.getParameter("changedLocnCode");
	String quantity			= (String)request.getParameter("quantity");
	System.out.println("=------------------"+quantity);
	String approverEmailId	= (String)request.getParameter("approverEmailId");

	String dept				= (String)request.getParameter("department");
	String actName			= (String)request.getParameter("activityName");
	String addressLine1		= (String)request.getParameter("addressLine1");
	out.println(addressLine1);
	String addressLine2		= (String)request.getParameter("addressLine2");
	String email			= (String)request.getParameter("emailId");
	String personalBelief	= (String)request.getParameter("personalBelief");
	String personalBeliefDropdn	= "NA";//(String)request.getParameter("personalBeliefDropdn");

	personalBelief			= Utility.replaceQuoteOracle(personalBelief);
	personalBeliefDropdn	= Utility.replaceQuoteOracle(personalBeliefDropdn);

	String overallRemarks	= "Please print the personal belief on back of the card.";
	boolean change = true;

if(cardTemplate.equals("LH")){
int counter = 0;
int quantityLH = 0;

int result = Integer.parseInt(quantity);
quantityLH= result*5;
quantity=Integer.toString(quantityLH); 

//System.out.println("----------------------"+quantityLH+"===="+quantity);

}
	if(companyCode.equals("1003") || companyCode.equals("1024") || companyCode.equals("1025") || companyCode.equals("1026")  || companyCode.equals("1031") || companyCode.equals("1032") || companyCode.equals("1027") || companyCode.equals("1029") || companyCode.equals("1028") || companyCode.equals("1030") || companyCode.equals("1000") || companyCode.equals("1036") || companyCode.equals("1040") || companyCode.equals("1041") || companyCode.equals("1043")|| companyCode.equals("1039") || companyCode.equals("1007") || companyCode.equals("1049"))
	{
			String backDesign			= (String)request.getParameter("backDesign");
			//out.println("---------------------->>"+backDesign);
			cardTemplate =cardTemplate + "-" +backDesign;
			System.out.println("-----------------------"+cardTemplate);
			
	}
	out.println(cardTemplate);
	Hashtable createHash = new Hashtable();

	if (((firstName.equals(fstName)) && (surName.equals(lstName)) && (designation.equals(dsgn)) && (locationCode.equals(changedLocnCode))) || (companyCode.equals("1003") || companyCode.equals("1024") || companyCode.equals("1025") || companyCode.equals("1026")  || companyCode.equals("1027") || companyCode.equals("1030") || companyCode.equals("1032") || companyCode.equals("1036")|| companyCode.equals("1040") || companyCode.equals("1041") || companyCode.equals("1043") || companyCode.equals("1039")) ){
		change = false;
	}

	String insertStatus = "H";
	if(companyCode.equals("1003")){
			createHash.put("personalBelief","-");
	}
	if(companyCode.equals("1000")){
		if(!change && (personalBelief==null||personalBelief.equals(""))) {

			insertStatus = "L";
			createHash.put("personalBelief",personalBeliefDropdn);

		}else if(!change && !personalBelief.equals("")){

			insertStatus = "LP";
			createHash.put("personalBelief",personalBelief);

		}else if(change && (personalBelief==null||personalBelief.equals(""))) {

			insertStatus = "H";
			createHash.put("personalBelief",personalBeliefDropdn);

		}else if(change && !personalBelief.equals("")){

			insertStatus = "HP";
			createHash.put("personalBelief",personalBelief);
		}
	}else if(!change){
			insertStatus = "L";
			createHash.put("personalBelief","-");
	}



	createHash.put("timescapeuserOid",Long.toString(timescapeUserOId));
	createHash.put("requestorName",(util.replaceQuoteOracle(fstName)).trim()+" "+(util.replaceQuoteOracle(lstName)).trim());
	createHash.put("requestorDesignation",(util.replaceQuoteOracle(dsgn)).trim());
	createHash.put("requestorWorkArea",(util.replaceQuoteOracle(workArea)).trim());
	createHash.put("requestorBoardNumber",userBoardNumber);
	createHash.put("requestorDirectNumber",directPhoneNo);
	createHash.put("requestorFaxNumber",fax);
	createHash.put("requestorMobileNumber",mobileNumber);
	createHash.put("requestorExtensionNumber",extensionNumber);
	createHash.put("requestorWebsite",website);
	createHash.put("cardTemplate",cardTemplate);
	createHash.put("cardType","-");
	createHash.put("addressCode",addressCode);
	createHash.put("requestedQuantity",quantity);
	createHash.put("challanNumber","-");
	createHash.put("approvedBy",approverEmailId);
	createHash.put("approverRemarks","-");
	createHash.put("pbcheckedBy","timescape.admin@timesgroup.com");
	createHash.put("pbcheckerRemarks","-");
	createHash.put("reviewedBy","timescape.admin@timesgroup.com");
	createHash.put("reviewerRemarks","-");
	createHash.put("processedBy","timescape.admin@timesgroup.com");
	createHash.put("processorRemarks","-");
	createHash.put("vendorId","timescape.admin@timesgroup.com");
	createHash.put("vendorRemarks","-");
	createHash.put("status",insertStatus);
	createHash.put("overallRemarks",overallRemarks);
	createHash.put("createrRemarks","NA");

//call "create" method to insert request details into "SERVICEREQUEST" and "SERVICEATTACHMENT" tables
	boolean status = false;
	status = businessCardUserWebController.create(createHash);


		
//Depending on the Status; display the message from prompt page

	if(status)
	{
		response.sendRedirect("../common/promptPage.jsp?msg=SUC_REQ");
	}
	else
	{
		response.sendRedirect("../common/promptPage.jsp?msg=ERR_REQ");
	}

%>