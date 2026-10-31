<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>

<%
		String redirectURL = "";
		Hashtable attributeHash = new Hashtable();
		attributeHash.put("docId", "DOC1001");
        attributeHash.put("emailId",emailId);
		ArrayList listAttribute = wasteSalesHeaderController.listOfAtrributes(attributeHash);
		String profilestr="";

		for (int kk = 0; kk<listAttribute.size(); kk++){
                String strArray[] = (String[]) listAttribute.get(kk);  
				if("PLANT HEAD".equals(strArray[4]))
				{
					profilestr = strArray[4];

				}else if("ZONE HEAD".equals(strArray[4]))
				{
					profilestr = strArray[4];
				}
	       }
		 //  out.println("profilestr---"+profilestr);

		if("PLANT HEAD".equals(profilestr) )
		{  
			//redirectURL = "/timescape/sapep/collaboration/workflow/wastesalesapproval/user/wscreateForms.jsp";
			redirectURL = "/timescape/sapep/collaboration/workflow/wastesalesapproval/user/viewWSProcess.jsp";


		}else if("ZONE HEAD".equals(profilestr)){

			redirectURL = "/timescape/sapep/collaboration/workflow/wastesalesapproval/user/viewWSZonalRequests.jsp";

		}else
		{
			redirectURL = "/timescape/sapep/collaboration/workflow/wastesalesapproval/user/viewWSApprovals.jsp";


		}
		 //redirectURL = "/timescape/sapep/collaboration/workflow/wastesalesapproval/user/createProcessWasteSalesRequest.jsp";
			
		//out.println("userRole="+userRole);
		//out.println(redirectURL);
		response.sendRedirect(redirectURL);

%>