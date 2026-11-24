<%--
 -- @(#)noEmpNominees.jsp	12/3/2008
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
 -- @comment	Download List of Employees and their Nominees
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.io.PrintWriter, java.util.*, java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.profile.web.util.Constants, com.bccl.util.Utility"%>

<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController"/>
<%
	ArrayList nomineesLst = new ArrayList();
	String targetDate;
	String fileName = "List Of Employees who have not given the nominations.csv";
	String compCode = (String)session.getAttribute("compCode");
	//int iCompany = Integer.parseInt(companyCode);

	//out.println("Company Code = "+companyCode);

	//out.println("targetDate  = "+targetDate);
	//System.out.println("Company Code : "+iCompany);
	//List Of Employees who have not given the nominations
	//nomineesLst = mediclaimController.noNominations(companyCode);
	//nomineesLst = mediclaimController.noNominations(compCode);  Commented on 04-SEP-2017
	nomineesLst = mediclaimController.noNominations(sapId);
	out.println(nomineesLst.size());

	try {
		//Put the index of numbers in Hashtable
		ArrayList numIndex = new ArrayList();
		numIndex.add(new Integer(0));

		//Convert details in StringBuffer to write through PrintWriter
		String headerStr = "\"EMPLOYEE NAME\",\"COMPANY\",\"BRANCH\",\"LOCATION\",\"DEPARTMENT\",\"SAP NUMBER\",\"EMAIL ID\",\"JOINING DATE\"" + "\n";
		
		/*String str="";

        for(int i = 0; i < nomineesLst.size(); i++)
        {

            String row[] = (String[])(String[])nomineesLst.get(i);

           // String str2="";
            for(int j = 0; j < row.length; j++)
            {
           /*     if(j != 0)
                {
                   str2+=",";
                }
				if(numIndex.contains(new Integer(j)))
                {
                    str2+="=";
                }
				str+=row[j];
            }
			//str+=str2+"\n";
			
        }

		//out.println(str);*/
		
		StringBuffer nominees = Utility.toStringBuffer(nomineesLst, numIndex);
		//out.println(nominees.toString());
		StringBuffer csvContent = new StringBuffer();
		csvContent.append(headerStr).append(nominees);
		PrintWriter writer = null;
		response.setContentType("text/csv");
		response.setHeader("Content-disposition","attachment;filename="+fileName);

		writer = response.getWriter();
		writer.println(csvContent);
		//writer.println(csvContent);

		writer.flush();
		writer.close();
	
	} 
	catch (Exception e)
    {
		out.println(e);
	}
%>
