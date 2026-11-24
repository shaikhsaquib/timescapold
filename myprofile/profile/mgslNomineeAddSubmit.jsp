<%--
 -- @(#)tilNomineeAddSubmit.jsp	Wednesday, September 30, 2009
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments...
 -- @author  Amit Umbarkar
 -- @version 1.00, Wednesday, September 30, 2009

 -- Comments...
 --		Included sendMail.jsp file to send an email to HR on addition of nominee.
 -- @author		Manisha Wadhawane
 -- @version 	2.00, May 07, 2008
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Enumeration,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,com.bccl.util.Breadcrumbs,com.bccl.util.HtmlUtil, com.bccl.util.Utility"%>

<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" scope="session"/>

<%@ include file="../includes/empHeader.jsp" %>
<% 
	
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
	long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");		
	int addIndex=Integer.parseInt(request.getParameter("addIndex"));

	String [] nomineeName=request.getParameterValues("nomineeName");
	String [] nomineeLocationName=request.getParameterValues("nomineeLocationName");
	String [] nomineeRelationship=request.getParameterValues("nomineeRelationship");
	String [] dd=request.getParameterValues("day");
	String [] mon=request.getParameterValues("month");
	String [] yyyy=request.getParameterValues("year");
	String [] nomineeGender=request.getParameterValues("nomineeGender");


	ArrayList nomineeList=new ArrayList();
	Hashtable nomineeHash = new Hashtable();


    String nomineeNameStr = nomineeName[addIndex];
	nomineeNameStr = Utility.replaceQuoteOracle(nomineeNameStr);
	String nomineeLocationStr = nomineeLocationName[addIndex];
	String nomineeRelationshipStr = nomineeRelationship[addIndex];
	String nomineeDOBStr = dd[addIndex]+"-"+monthArr[(Integer.parseInt(mon[addIndex]))-1]+"-"+yyyy[addIndex];
	String nomineeGenderStr = nomineeGender[addIndex];

	//nomineeHash.put("nomineeName",nomineeName[addIndex]);
    // added to accept single quotes... for e.g. D'souza

	nomineeHash.put("nomineeName",nomineeNameStr);
	nomineeHash.put("nomineeLocationName",nomineeLocationStr);
	nomineeHash.put("nomineeRelationship",nomineeRelationshipStr);

	nomineeHash.put("nomineeDOB",nomineeDOBStr);
	nomineeHash.put("nomineeGender",nomineeGenderStr);
	nomineeHash.put("createdBy",payId);

	
	
	
	/*nomineeHash.put("nomineeName","amey");
	nomineeHash.put("nomineeLocationName","mumbai");
	nomineeHash.put("nomineeRelationship","child");
	nomineeHash.put("nomineeDOB","14-Mar-84");
	nomineeHash.put("nomineeGender","M");
	nomineeHash.put("createdBy","smozar0406");*/
	
	nomineeList.add(nomineeHash);
	
	boolean status=mediclaimController.createNominee(timescapeUserOID,nomineeList);
	if(status)
	{
%>
			<%//@ include file="../includes/sendMail.jsp"%>
<%
	}
	/*out.println("status"+status);
	out.println(nomineeName[addIndex]);
	out.println(nomineeLocationName[addIndex]);
	out.println(nomineeRelationship[addIndex]);
	out.println(dd[addIndex]);
	out.println(mon[addIndex]);
	out.println(yyyy[addIndex]);
	out.println(nomineeGender[addIndex]);*/

	//out.println(status);
	response.sendRedirect("viewNomineeDetails.jsp");

%>