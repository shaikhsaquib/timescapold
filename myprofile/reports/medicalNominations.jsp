<%--
 -- @(#)medicalNominations.jsp	12/3/2008
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
	ArrayList resultList = new ArrayList();
	String targetDate;
	String compCode = "";
	String sapIdNew = "";
	String timescapeuseroid = "";
	String fileName = "List Of Employees and Nominees.csv";

	int iCompany = Integer.parseInt(companyCode);

	out.println("Company Code = "+iCompany);

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

	//out.println("targetDate  = "+targetDate);
	//System.out.println("Company Code : "+iCompany);
	//Get the List of Employees and their Nominees
	
	//for(int i=0;i < resultList.size();i++){
	
	
	 //compCode = (String)session.getAttribute("compCode");
	 //sapIdNew = (String)session.getAttribute("sapId");
	 
	 //String test1 =  compCode.substring(0, compCode.length()-1) ;
	//out.println("test-"+test1);
	//String test2 [] = test1.split(",");
	//out.println("test2--"+test2[0]);
	// }
	out.println("sapId---"+sapId);
	nomineesLst = mediclaimController.getEmpNominationDetails(targetDate, sapId);
	
	
	//out.println(nomineesLst.size());
	
	try {
		//Put the index of numbers in Hashtable
		ArrayList numIndex = new ArrayList();
		numIndex.add(new Integer(0));

		//Convert details in StringBuffer to write through PrintWriter
		//String headerStr = "\"PAY ID NO.\",\"BRANCH\",\"EMPLOYEE NAME\",\"DESIGNATION\",\"DEPARTMENT\",\"DATE OF JOINING\",\"DEPENDENT NAME\",\"LOCATION\",\"RELATION\",\"NO. OF YEARS COMPLETED\",\"TARGET DATE\",\"YEARS IN SERVICE\",\"DATE OF BIRTH\",\"AGE\",\"GENDER\"" + "\n";
		String headerStr = "\"PAY ID NO.\",\"BRANCH\",\"EMPLOYEE NAME\",\"DESIGNATION\",\"DEPARTMENT\",\"DATE OF JOINING\",\"NO. OF YEARS COMPLETED\",\"TARGET DATE\",\"YEARS IN SERVICE\",\"INSURED NAME\",\"LOCATION\",\"RELATION\",\"DATE OF BIRTH\",\"AGE\",\"GENDER\"" + "\n";
		
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
