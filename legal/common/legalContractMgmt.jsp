<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<jsp:useBean id="legalController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>

<%
		String redirectURL = "";
		
		Hashtable attributeHash = new Hashtable();
		attributeHash.put("docId", "DOC1006");
        attributeHash.put("emailId",emailId);
		ArrayList listAttribute = legalController.listOfAtrributes(attributeHash);
		String profilestr="";
		
		for (int kk = 0; kk<listAttribute.size(); kk++){
			String strArray[] = (String[]) listAttribute.get(kk);  
			if("DEPT HEAD".equals(strArray[4]) || "LEGAL HEAD".equals(strArray[4]))
			{
				profilestr = strArray[4];
			}
	   }
		//   out.println("profilestr---"+profilestr);

		/*if("DEPT HEAD".equals(profilestr) )
		{  
			redirectURL = "/timescape/sapep/collaboration/workflow/legal/depthead/viewDeptHeadRequests.jsp";

		}else*/ if("LEGAL HEAD".equals(profilestr)){

			//redirectURL = "/timescape/sapep/collaboration/workflow/wastesalesapproval/user/viewWSZonalRequests.jsp";
			redirectURL = "/timescape/sapep/collaboration/workflow/legal/legalHead/viewPendingRequests.jsp";

		}else
		{
			redirectURL = "/timescape/sapep/collaboration/workflow/legal/user/createRequest.jsp";
		}
		 //redirectURL = "/timescape/sapep/collaboration/workflow/legal/user/createRequest.jsp";
			
			
		//out.println("userRole="+userRole);
		//out.println(redirectURL);
		response.sendRedirect(redirectURL);

%>