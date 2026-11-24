<%--
 -- @(#)nomineeSubmit.jsp	8/6/2002
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author  Amey Divekar
 -- @version 	1.00, April 29, 2007

 -- Comments...
 --		Included sendMail.jsp file to send an email to HR on deletion of nominee from the nominee list.
 -- @author		Manisha Wadhawane
 -- @version 	2.00, May 07, 2008
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Enumeration,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,com.bccl.util.Breadcrumbs,com.bccl.util.HtmlUtil"%>

<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" scope="session"/>

<%@ include file="../includes/empHeader.jsp" %>
<% 
	
	String actionBy = (String)request.getParameter("actionBy");	

	if(actionBy!=null && actionBy.equalsIgnoreCase("HR")){

		long nomtimescapeUserOID = Long.parseLong(request.getParameter("userOIddhidden"));	
		long nomineeId = Long.parseLong(request.getParameter("nomineeId"));
		boolean status = mediclaimController.purgeNominee(nomtimescapeUserOID,nomineeId, sapId);
		//boolean status1 = mediclaimController.purgeNominee(nomtimescapeUserOID,hrSapId);
		long sapNo = Long.parseLong(request.getParameter("sapNumber"));
		

		//out.println(nomtimescapeUserOID+"--"+nomineeId+"--"+sapNo+"--"+status);

		if(status)
		{	
			String nomineeNameStr = (String)request.getParameter("nomineeNameHidden");
			String nomineeLocationStr = (String)request.getParameter("nomineeLocationHidden");
			String nomineeRelationshipStr = (String)request.getParameter("nomineeRelationHidden");
			String nomineeDOBStr = (String)request.getParameter("nomineeDOBHidden");
			String nomineeGenderStr = (String)request.getParameter("nomineeGenderHidden");
			//String hrSapId = (String)request.getParameter("hrSapId");
		}
		response.sendRedirect("searchNomineeDetails.jsp?sapNumber="+sapNo);
	}else{

		String userOId = (String) profile.get("timescapeUserOID");	
		long timescapeUserOID = Long.parseLong(userOId);			
		long nomineeId = Long.parseLong(request.getParameter("nomineeId"));
		boolean status = mediclaimController.purgeNominee(timescapeUserOID,nomineeId, sapId);
		//out.println(timescapeUserOID+"--"+nomineeId);
		//out.println("Done "+status);
		response.sendRedirect("viewNomineeDetails.jsp");
	}

%>
		<%//@ include file="../includes/sendMail.jsp"%>