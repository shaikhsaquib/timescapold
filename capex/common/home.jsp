<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

<%
		String redirectURL	= "";
		Hashtable attributeHash1 = new Hashtable();
		Hashtable attributeHash2 = new Hashtable();
		attributeHash1.put("docId", "DOC1005");
        attributeHash1.put("emailId",emailId);
        attributeHash1.put("APPLICATION_NAME","capex");
		ArrayList listAttribute1 = capexHeaderController.listOfAtrributes(attributeHash1);
		String profilestr1 = "";
		String userProfile = "";
		//out.println( " ------------ "+ listAttribute1.size());
		
		for (int kk = 0; kk<listAttribute1.size(); kk++){
			   String strArray1[] = (String[]) listAttribute1.get(kk);  	
				 profilestr1 = 	((strArray1[4]==null) ||(strArray1[4]==""))?"" :strArray1[4];			 
		   }
		//out.println( " ------------ "+ profilestr1);
		
		attributeHash2.put("DOCUMENTOID", "DOC1005");
		attributeHash2.put("EMAILID",emailId);
		attributeHash2.put("APPLICATION_NAME","capex");
		ArrayList reviewerList = docChangeLogController.view("","",attributeHash2);	
				
		if(reviewerList.size() > 0){			
			userProfile = "REVIEWER";
		}else{			
			userProfile = "USER";
		}					
			
		if("COORDINATOR".equals(profilestr1) && "REVIEWER".equals(userProfile)){
			redirectURL="../view/reviewDashboard.jsp";
			profilestr1 = "MULTIUSER";			
		}else if("COORDINATOR".equals(profilestr1)){
			redirectURL="../view/listOfPendingProposalRequest.jsp";
		}else if("APPROVALS".equals(profilestr1)){
			redirectURL="../view/newapprovalDashboard.jsp";				
		}else if("REVIEWER".equals(userProfile)){
			redirectURL="../view/reviewDashboard.jsp";
			profilestr1 = "REVIEWER";
		}else {			
				redirectURL="../view/listOfMyProposalRequest.jsp";
				profilestr1 = "USER";					
			} 
		  session.setAttribute("profilestr1",profilestr1);
		  response.sendRedirect(redirectURL);
%>











