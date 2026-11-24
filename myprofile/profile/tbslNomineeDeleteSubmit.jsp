<%--
 -- @(#)zenNomineeAddSubmit.jsp	Monday, October 05, 2009
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

<%--
 -- Comments...
 -- @author  Manisha Wadhawane
 -- @version 1.00, Monday, October 05, 2009
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Enumeration,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,com.bccl.util.Breadcrumbs,com.bccl.util.HtmlUtil"%>

<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" scope="session"/>

<%@ include file="../includes/empHeader.jsp" %>
<% 

	long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");		

    long nomineeId = Long.parseLong(request.getParameter("nomineeId"));

    out.println(request.getParameter("nomineeId"));

	boolean status = mediclaimController.purgeNominee(timescapeUserOID,nomineeId,sapId);
    
    if(status)
	{	
		String nomineeNameStr = (String)request.getParameter("nomineeNameHidden");
		String nomineeLocationStr = (String)request.getParameter("nomineeLocationHidden");
		String nomineeRelationshipStr = (String)request.getParameter("nomineeRelationHidden");
		String nomineeDOBStr = (String)request.getParameter("nomineeDOBHidden");
		String nomineeGenderStr = (String)request.getParameter("nomineeGenderHidden");
%>
		<%//@ include file="../includes/sendMail.jsp"%>
<%
	}

	//out.println(timescapeUserOID+"--"+nomineeId);
	//out.println("Done "+status);
	
	response.sendRedirect("viewNomineeDetails.jsp");

%>



