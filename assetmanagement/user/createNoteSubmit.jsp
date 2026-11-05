<!--
	Author : Sachin Kale
	Version : 2.0
	Date : 11 Dec 2012
	Change : Removal of MAS Head from ADN workflow
-->

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.ArrayList"%>
<%@ page import="com.bccl.util.Utility" %>

<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController" />

  
<%
	String requestId	= (String)request.getParameter("requestId");
	String optValue		= (String)request.getParameter("optValue");

	String redirectURL	= "";
	String noteType ="";
	String mailToWhom = "";


	ArrayList reqList = new ArrayList();

	Hashtable dataHash = new Hashtable();

	dataHash.put("REQUESTID", requestId);
	dataHash.put("OPTVALUE", optValue);


	if("ATN".equals(optValue)){

		noteType = "Asset Transfer Note";

        String transferCompany	= (String)request.getParameter("transferCompany");
		transferCompany = Utility.replaceQuoteOracle(transferCompany);

		String transferBranch	= (String)request.getParameter("transferBranch");
		transferBranch = Utility.replaceQuoteOracle(transferBranch);

		String transferLocation	= (String)request.getParameter("transferLocation");
		transferLocation = Utility.replaceQuoteOracle(transferLocation);

		String transferDept	= (String)request.getParameter("transferDept");
		transferDept = Utility.replaceQuoteOracle(transferDept);
	
        /*--------------------------------------------------------------------*/
		String ATNJustification	= (String)request.getParameter("ATNJustification");
		ATNJustification = Utility.replaceQuoteOracle(ATNJustification);
		
		/*--------------------------------------------------------------------*/
		String senderDeptHead	= (String)request.getParameter("senderDeptHead");
		senderDeptHead = Utility.replaceQuoteOracle(senderDeptHead);

		mailToWhom = senderDeptHead;

		String senderDeptHeadOId	= (String)request.getParameter("senderDeptHeadH");
		senderDeptHeadOId = Utility.replaceQuoteOracle(senderDeptHeadOId);

		String senderDeptHeadName	= (String)request.getParameter("senderDeptHeadN");
		senderDeptHeadName = Utility.replaceQuoteOracle(senderDeptHeadName);

		/*--------------------------------------------------------------------*/
		String receiverDeptHead = (String)request.getParameter("receiverDeptHead");
		receiverDeptHead = Utility.replaceQuoteOracle(receiverDeptHead);

		String receiverDeptHeadOId = (String)request.getParameter("receiverDeptHeadH");
		receiverDeptHeadOId = Utility.replaceQuoteOracle(receiverDeptHeadOId);

		String receiverDeptHeadName = (String)request.getParameter("receiverDeptHeadN");
		receiverDeptHeadName = Utility.replaceQuoteOracle(receiverDeptHeadName);

		/*--------------------------------------------------------------------*/
		String branchHead	= (String)request.getParameter("branchHead");
		branchHead = Utility.replaceQuoteOracle(branchHead);

		String branchHeadOId	= (String)request.getParameter("branchHeadH");
		branchHeadOId = Utility.replaceQuoteOracle(branchHeadOId);

		String branchHeadName	= (String)request.getParameter("branchHeadN");
		branchHeadName = Utility.replaceQuoteOracle(branchHeadName);

		/*--------------------------------------------------------------------*/
		String receiverBranchHead	= (String)request.getParameter("receiverBranchHead");
		receiverBranchHead = Utility.replaceQuoteOracle(receiverBranchHead);

		String receiverBranchHeadOId	= (String)request.getParameter("receiverBranchHeadH");
		receiverBranchHeadOId = Utility.replaceQuoteOracle(receiverBranchHeadOId);

		String receiverBranchHeadName	= (String)request.getParameter("receiverBranchHeadN");
		receiverBranchHeadName = Utility.replaceQuoteOracle(receiverBranchHeadName);

		/*--------------------------------------------------------------------*/

		dataHash.put("REASON", ATNJustification);
		dataHash.put("COMPANY", transferCompany);
		dataHash.put("BRANCH", transferBranch);
		dataHash.put("LOCATION", transferLocation);
		dataHash.put("DEPARTMENT", transferDept);
		dataHash.put("VERIFIEDBY", senderDeptHeadOId);
		dataHash.put("VERIFIERNAME", senderDeptHeadName);
		dataHash.put("VERIFIEREMAILID", senderDeptHead);
		dataHash.put("VERIFIERREMARKS", "-");
		dataHash.put("PROPOSEDBY", branchHeadOId);
		dataHash.put("PROPOSORNAME", branchHeadName);
		dataHash.put("PROPOSOREMAILID", branchHead);
		dataHash.put("PROPOSORREMARKS", "-");
		dataHash.put("APPROVEDBY", receiverBranchHeadOId);
		dataHash.put("APPROVERNAME", receiverBranchHeadName);
		dataHash.put("APPROVEREMAILID", receiverBranchHead);
		dataHash.put("APPROVERREMARKS", "-");
		dataHash.put("ADMINHEAD", receiverDeptHeadOId);
		dataHash.put("ADHEADNAME", receiverDeptHeadName);
		dataHash.put("ADHEADEMAILID", receiverDeptHead);
		dataHash.put("ADHEADREMARKS", "-");
		dataHash.put("BRANCHHEAD", "0");
		dataHash.put("BRHEADNAME", "-");
		dataHash.put("BRHEADEMAILID", "-");
		dataHash.put("BRHEADREMARKS", "-");
		dataHash.put("AUDITOR", "0");
		dataHash.put("AUDITORNAME", "-");
		dataHash.put("AUDITOREMAILID", "-");
		dataHash.put("AUDITORREMARKS", "-");
		dataHash.put("CREATEDBY", timescapeUserOId+"");
		dataHash.put("MODIFIEDBY", timescapeUserOId+"");
		dataHash.put("STATUS", "TS");

	

	}else if("ADN".equals(optValue)){

		noteType = "Asset Disposal Note";

		String reasonForDisposal = (String)request.getParameter("reasonForDisposal");
		reasonForDisposal = Utility.replaceQuoteOracle(reasonForDisposal);
	
		/*--------------------------------------------------------------------*/
		String verifiedBy	= (String)request.getParameter("verifiedBy");
		verifiedBy = Utility.replaceQuoteOracle(verifiedBy);

		mailToWhom = verifiedBy;

		String verifiedByOId	= (String)request.getParameter("verifiedByH");
		verifiedByOId = Utility.replaceQuoteOracle(verifiedByOId);

		String verifiedByName	= (String)request.getParameter("verifiedByN");
		verifiedByName = Utility.replaceQuoteOracle(verifiedByName);

		/*--------------------------------------------------------------------*/
		String proposedBy	= (String)request.getParameter("proposedBy");
		proposedBy = Utility.replaceQuoteOracle(proposedBy);

		String proposedByOId	= (String)request.getParameter("proposedByH");
		proposedByOId = Utility.replaceQuoteOracle(proposedByOId);

		String proposedByName	= (String)request.getParameter("proposedByN");
		proposedByName = Utility.replaceQuoteOracle(proposedByName);
		/*--------------------------------------------------------------------*/
		String approvedBy	= (String)request.getParameter("approvedBy");
		approvedBy = Utility.replaceQuoteOracle(approvedBy);

		String approvedByOId	= (String)request.getParameter("approvedByH");
		approvedByOId = Utility.replaceQuoteOracle(approvedByOId);

		String approvedByName	= (String)request.getParameter("approvedByN");
		approvedByName = Utility.replaceQuoteOracle(approvedByName);

		/*--------------------------------------------------------------------*/
		String adminHead  = (String)request.getParameter("adminHead");
		//adminHead = Utility.replaceQuoteOracle(adminHead);

		String adminHeadOId  = (String)request.getParameter("adminHeadH");
		//adminHeadOId = Utility.replaceQuoteOracle(adminHeadOId);

		String adminHeadName	= (String)request.getParameter("adminHeadN");
		//adminHeadName = Utility.replaceQuoteOracle(adminHeadName);

		/*--------------------------------------------------------------------*/
		String branchHead	= (String)request.getParameter("branchHead");
		branchHead = Utility.replaceQuoteOracle(branchHead);

		String branchHeadOId	= (String)request.getParameter("branchHeadH");
		branchHeadOId = Utility.replaceQuoteOracle(branchHeadOId);

		String branchHeadName	= (String)request.getParameter("branchHeadN");
		branchHeadName = Utility.replaceQuoteOracle(branchHeadName);
		/*--------------------------------------------------------------------*/
		String internalAudit  = (String)request.getParameter("internalAudit");
		internalAudit = Utility.replaceQuoteOracle(internalAudit);

		String internalAuditOId  = (String)request.getParameter("internalAuditH");
		internalAuditOId = Utility.replaceQuoteOracle(internalAuditOId);

		String internalAuditName  = (String)request.getParameter("internalAuditN");
		internalAuditName = Utility.replaceQuoteOracle(internalAuditName);
		/*--------------------------------------------------------------------*/
		if(internalAudit == null || "".equals(internalAudit))
		{
			internalAudit = "-";
			internalAuditOId = "0";
			internalAuditName = "-";
		}

		if(adminHead == null || "".equals(adminHead))
		{
			adminHead = "-";
			adminHeadOId = "0";
			adminHeadName = "-";
		}


		dataHash.put("REASON", reasonForDisposal);
		dataHash.put("COMPANY", "-");
		dataHash.put("BRANCH", "-");
		dataHash.put("LOCATION", "-");
		dataHash.put("DEPARTMENT", "-");
		dataHash.put("VERIFIEDBY", verifiedByOId);
		dataHash.put("VERIFIERNAME", verifiedByName);
		dataHash.put("VERIFIEREMAILID", verifiedBy);
		dataHash.put("VERIFIERREMARKS", "-");
		dataHash.put("PROPOSEDBY", proposedByOId);
		dataHash.put("PROPOSORNAME", proposedByName);
		dataHash.put("PROPOSOREMAILID", proposedBy);
		dataHash.put("PROPOSORREMARKS", "-");
		dataHash.put("APPROVEDBY", approvedByOId);
		dataHash.put("APPROVERNAME", approvedByName);
		dataHash.put("APPROVEREMAILID", approvedBy);
		dataHash.put("APPROVERREMARKS", "-");
		dataHash.put("ADMINHEAD", adminHeadOId);
		dataHash.put("ADHEADNAME", adminHeadName);
		dataHash.put("ADHEADEMAILID", adminHead);
		dataHash.put("ADHEADREMARKS", "-");
		dataHash.put("BRANCHHEAD", branchHeadOId);
		dataHash.put("BRHEADNAME", branchHeadName);
		dataHash.put("BRHEADEMAILID", branchHead);
		dataHash.put("BRHEADREMARKS", "-");
		dataHash.put("AUDITOR", internalAuditOId);
		dataHash.put("AUDITORNAME", internalAuditName);
		dataHash.put("AUDITOREMAILID", internalAudit);
		dataHash.put("AUDITORREMARKS", "-");
		dataHash.put("CREATEDBY", timescapeUserOId+"");
		dataHash.put("MODIFIEDBY", timescapeUserOId+"");
		dataHash.put("STATUS", "DS");

	}


		boolean createFlag = true;

		//mailToWhom = "sachin.kale@timesgroup.com";

		String subject = "Approval pending for "+noteType;

		createFlag = assetMgmt.createNote(dataHash);

		//out.println("mailToWhom = "+mailToWhom);

		Hashtable requestHash = new Hashtable();

		requestHash.put("REQUESTID", requestId);

		if(createFlag){
%>
			<%@ include file="../includes/mailContent.jsp"%>
<%
			if(mailFlag){

				redirectURL="../common/promptPage.jsp?msg=SUC_NOTE";
		
			}
			else{

				redirectURL="../common/promptPage.jsp?msg=SUC_NOTE";

			}
		}else{

			redirectURL="../common/promptPage.jsp?msg=ERR_NOTE";

		}
		
	response.sendRedirect(redirectURL);
	//location.href = redirectURL;
%>