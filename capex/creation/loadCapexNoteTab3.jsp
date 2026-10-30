<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<%@ page errorPage="../includes/error.jsp" %>  
<%
	
	
	/*
	session.removeAttribute("dataList");
	ArrayList searchList = (ArrayList) session.getAttribute("dataList");
	String headerData [] = null;
	if(searchList != null){
	int searchSize = searchList.size();
	//out.println(" searchSize3 " +searchSize) ;  
	if (searchSize> 0){
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
	String background = (String)session.getAttribute("background");			
	String rationale = (String)session.getAttribute("rationale");
	
	if (!requestNumber.equals(requestId3)){
			//	out.println(" requestNumber :"+ requestNumber + " : "+ requestId3);
		Hashtable htMy = new Hashtable();	
		String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal Date", "Proposal Amount", "Opex Amount","Location","Function","Project Manager","Project Category" , "Financial Year" ,"Budget Amount","Project Start Date","Project End Date", "Reason If Unbudgeted" , "Project Closed Out Report", "Rationale" , "Project Description" ,"Particulars" , "Estimated Cost" , "Asset Disposal" , "Savings Envisaged","Payback Period" , "Project Sponsor" , "Project Coordinator" ,"Total","compAttachment","attachmentFolderName"};

		session.removeAttribute("requestNumber");
		session.removeAttribute("background");
		session.removeAttribute("rationale");
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
	//	String requestNumber = "";
	//	String background = "";
	//	String rationale = "";
		String savingEnvisaged = "";
		String paybackPeriod = "";

		int searchSize = searchList.size();

		if (searchSize> 0){
		for (int eee = 0; eee < searchSize; eee++) {
		headerData = (String[]) searchList.get(eee);  
		for (int eee1 = 0; eee1 < headerData.length; eee1++) {
		//out.println(" headerData["+eee1+ "] " +headerData[eee1]) ;  
		}
		requestNumber = headerData[0];	
		background	= headerData[22];
		rationale = headerData[21];
		savingEnvisaged	= headerData[26];		 
		paybackPeriod = headerData[27];
		//proposalList+="<option value=\""+requestNumber+"\"  style='normal' selected>"+requestNumber+"</option>";		
		}
		}
		session.setAttribute("requestNumber",requestNumber);			
		session.setAttribute("background",background);			
		session.setAttribute("rationale",rationale);			
		session.setAttribute("savingEnvisaged",savingEnvisaged);			
		session.setAttribute("paybackPeriod",paybackPeriod);	
		
	}	

%>

	<div class="tab-pane" id="tab3">
		<table class="table table-bordered">
		<tbody>			
			<tr>
				<td class="text-center"><b>Rationale</b></td>
				<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="2" maxlength="500" id="rationale" name= "rationale"><%=rationale%></textarea></div></td>
			</tr>
			<tr>
				<td class="text-center" width="17%"><b>Recommendation</b></td>
				<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="2" maxlength="500" id="background" name= "background"><%=background%></textarea></div></td>
			</tr>
			<tr>
				<td class="text-center"><b>Project Scope</b></td>
				<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="2" maxlength="500" id="projectScope" name="projectScope"></textarea></div></td>
			</tr>
			<tr>
				<td class="text-center"><b>Alternatives Considered</b></td>
				<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="2" maxlength="500" id="alternativesConsidered" name="alternativesConsidered"></textarea></div></td>
			</tr>
			<tr>
				<td class="text-center"><b>Risks</b></td>
				<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="2" maxlength="500" id="risks" name = "risks"> </textarea></div></td>
			</tr>
		</tbody>
		</table>
	</div>
	