<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<%@ page errorPage="../includes/error.jsp" %>  
<%
/*
	ArrayList searchList = (ArrayList) session.getAttribute("dataList");
	String headerData [] = null;
	if(searchList != null){
	int searchSize = searchList.size();
	//out.println(" searchSize5 " +searchSize) ;  
	if (searchSize > 0){
		for (int eee = 0; eee < searchSize; eee++) {
			 headerData = (String[]) searchList.get(eee);  
			for (int eee1 = 0; eee1 < headerData.length; eee1++) {
				//out.println(" headerData["+eee1+ "] " +headerData[eee1]) ;  
			}
			String requestNumber = headerData[0];				
		}
	}
	*/

	String requestId3 = (String)request.getParameter("requestId");
	String requestNumber = (String) session.getAttribute("requestNumber");
	String savingEnvisaged = (String)session.getAttribute("savingEnvisaged");			
	String paybackPeriod = (String)session.getAttribute("paybackPeriod");
	
	if (!requestNumber.equals(requestId3)){
			//	out.println(" requestNumber :"+ requestNumber + " : "+ requestId3);
		Hashtable htMy = new Hashtable();	
		String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal Date", "Proposal Amount", "Opex Amount","Location","Function","Project Manager","Project Category" , "Financial Year" ,"Budget Amount","Project Start Date","Project End Date", "Reason If Unbudgeted" , "Project Closed Out Report", "Rationale" , "Project Description" ,"Particulars" , "Estimated Cost" , "Asset Disposal" , "Savings Envisaged","Payback Period" , "Project Sponsor" , "Project Coordinator" ,"Total","compAttachment","attachmentFolderName"};

		session.removeAttribute("requestNumber");		
		session.removeAttribute("savingEnvisaged");
		session.removeAttribute("paybackPeriod");

		htMy.put("HEADERSECTION1", headerSection);
		htMy.put("DOCUMENTOID", "DOC1005");	
		htMy.put("REQUESTOID",requestId3);
		String headerData [] = null;
		String headerData5 [] = null;
		ArrayList searchList =  capexHeaderController.viewAll("sdf","sdfsd",htMy);
		session.removeAttribute("dataList");

		String proposalList = "";
		int searchSize = searchList.size();

		if (searchSize> 0){
		for (int eee = 0; eee < searchSize; eee++) {
		headerData = (String[]) searchList.get(eee);  
		for (int eee1 = 0; eee1 < headerData.length; eee1++) {
		
		}
		requestNumber = headerData[0];		
		savingEnvisaged	= headerData[26];		 
		paybackPeriod = headerData[27];
			
		}
		}
		session.setAttribute("requestNumber",requestNumber);					
		session.setAttribute("savingEnvisaged",savingEnvisaged);			
		session.setAttribute("paybackPeriod",paybackPeriod);	
		
	}		
	
%>
	<div class="tab-pane" id="tab5">
		<table class="table table-bordered">
		<tbody>
			<tr>
				<td class="text-center"><b>Savings Envisaged</b></td>
				<td class="text-center"><input type="text" class="form-control text-right " placeholder="Savings Envisaged " name="savingsEnvisaged"    id="savingsEnvisaged" onblur = "javascript:checkBlankNumber('Savings Envisaged','savingsEnvisaged'); " maxlength="7" value="<%=savingEnvisaged%>"></td>
				</tr>
			<tr>
				<td class="text-center"><b>Payback Period(Yrs/Month)</b></td>
				<td class="text-center"><input type="text" class="form-control text-right " name="paybackPeriod" id="paybackPeriod"  placeholder="Like 1 year 2 months / 8 months" maxlength="20" value="<%=paybackPeriod%>"></td>
			</tr>                                   
		</tbody>
		</table>
	</div>
	
