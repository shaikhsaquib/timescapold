<%--
 -- @(#)empNomineesDeleted.jsp	12/3/2008
 --
 -- Copyleft 2004 BCCL. All lefts Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Manisha Wadhawane
 -- @version 	1.00, 12/3/2008
 -- @comment	Download List of Employees and Nominees dis-engaged in select Month and Year
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.io.PrintWriter, java.util.*, java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.profile.web.util.Constants, com.bccl.util.Utility"%>

<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" >
<%
	String [] months = {"0", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
	ArrayList nomieesLst = new ArrayList();
	String yearMon = "";
	String targetDate;
	String status="C";

	int iCompany = Integer.parseInt(companyCode);

	//out.println("Company Code = "+iCompany);

			switch(iCompany){
			case 1:
			targetDate="31-MAY-2010";
			break;

			case 20:
			targetDate="31-MAY-2009";
			break;

			case 27:
			targetDate="31-MAY-2009";
			break;

			case 42:
			targetDate="02-SEP-2010";
			break;

			default:
			targetDate="31-MAY-2009";
			}
	
	//System.out.println("Company Code : "+iCompany);

	//Fetching year and month from request
	String forYear = (String) request.getParameter("year");
	String forMonth = (String) request.getParameter("month");
    int selYear = Integer.parseInt(forYear);
	int currMonth = Integer.parseInt(forMonth);
	//String company = (String) profile.get("companyCode");
	String fileName = "Emp and Nominees disengaged in "+months[currMonth]+" "+forYear+".csv";
	String compCode = "";
	 compCode = (String)session.getAttribute("compCode");
	//Get the List of Nominees deleted in the given Month and Year
	forMonth = "0" + forMonth;
	forMonth = forMonth.substring(forMonth.length()-2);
	yearMon = forYear + forMonth + "%";
	//nomieesLst = mediclaimController.viewEmpNomineesDisEngaged(yearMon,targetDate, compCode);  commented on 04-SEP-2017
	nomieesLst = mediclaimController.viewEmpNomineesDisEngaged(yearMon,targetDate, sapId);

	//Put the index of numbers in Hashtable
	ArrayList numIndex = new ArrayList();
	numIndex.add(new Integer(0));

	//Convert details in StringBuffer to write through PrintWriter
	String headerStr = "\"PAY ID NO.\",\"BRANCH\",\"EMPLOYEE NAME\",\"DESIGNATION\",\"DEPARTMENT\",\"DATE OF JOINING\",\"NO. OF YEARS COMPLETED\",\"TARGET DATE\",\"YEARS IN SERVICE\",\"INSURED NAME\",\"LOCATION\",\"RELATION\",\"DATE OF BIRTH\",\"AGE\",\"GENDER\"" + "\n";
	StringBuffer nominees = Utility.toStringBuffer(nomieesLst, numIndex);
	StringBuffer csvContent = new StringBuffer();
	csvContent.append(headerStr).append(nominees);
	PrintWriter writer = null;
	response.setContentType("text/csv");
	response.setHeader("Content-disposition","attachment;filename="+fileName);

	writer = response.getWriter();
	writer.println(csvContent);

	writer.flush();
	writer.close();
%>
</jsp:useBean>
