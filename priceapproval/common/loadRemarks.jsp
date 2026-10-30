<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%

		 long tOId		     = Long.parseLong(request.getParameter("userId"));

		 //long priceid	     = Long.parseLong(request.getParameter("priceId"));
		 String priceid	     = (String) request.getParameter("priceId");

		 String approverType = request.getParameter("approverType");

		// long      userId	 = Long.parseLong(request.getParameter("userId"));

		 ArrayList remarks   = new ArrayList();

		 remarks   = priceApprovalWebController.showRemarks(tOId,priceid,approverType);
				
		 String    str       = "<table width='300px' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						int i = 0;

						for(i = 0; i<remarks.size(); i++)
						{
							String data[] = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>Remarks : ";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + data[2] + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						out.println(str);
				   }
				   else
				   {
					  out.println("No Remarks");	
				   }
%>