<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%//@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 
<%
   ArrayList reportResult = new ArrayList();

    String userOid = "0";
	String approverOid = "0";
	String userFdbk ="";
    String userFdbk1 ="";
	String approverFdbk ="";
    String approverFdbk1 ="";
     int qusActCnt = 0;
	int qusYesCnt = 0;
	int qusNoCnt = 0;
	int qusNotAppl = 0;
	int qusNotActCnt = 0;
	int totalUsers = 0; 
	int totalApprovers = 0;
	int functionCnt = 0;
    String startDate = "";
    String endDate = "";

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );

	String date = (String)request.getParameter("fromDate");

	String compCode = (String)request.getParameter("compCode");
    String selectedCompany  = (String) request.getParameter("selectedCompany");
    session.setAttribute("selectedCompany",selectedCompany);
	String selectedModule  = (String) request.getParameter("selectedModule");
    session.setAttribute("selectedModule",selectedModule);

    if((compCode == null) || (compCode == "" ))
				{
					compCode = "1000";
				} else {
                    
                    session.setAttribute("compCode",compCode);
                }

	String department = (String)request.getParameter("dept");

    compCode = (String) session.getAttribute("compCode");

    if((department == null) || (department == "" ))
				{
					department = "all";
				}
    
        session.setAttribute("compCode",compCode);
	
	if (date == null){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
		if(date.length() == 1){
			date = "0" + date;
		}
		date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	}

        int selectedDay = Integer.parseInt(date.substring(0,date.indexOf("-")));
        String selectedMonth = date.substring(3,6);
        int selMonth = 0;
        for(int i=0;i<monthArr.length;i++)
        {
            if(monthArr[i].equals(selectedMonth))
            {
                selMonth = i;
                break;
            }
        }
        int selectedYear = Integer.parseInt(date.substring(7));

        Calendar cal = new GregorianCalendar();

        
        //if ((selMonth < 4) && (selectedDay < 6)) {
        if ((selMonth < 4) && (selectedDay < 11)) {

            selectedYear = selectedYear - 1;

        }

        startDate = "01-APR-"+(selectedYear - 1);
        endDate = "31-MAR-"+selectedYear;

    /*out.println("selectedDay---"+selectedDay);
    out.println("selectedMonth---"+selectedMonth);
    out.println("selectedYear1---"+(selectedYear -1));
    out.println("selectedDay---"+selectedDay);
    out.println("selMonth---"+selMonth);*/

	int frequency = 7; //frequency 2 stands for Weekly controls

    String createdDate = "26-MAR-"+selectedYear; 

    //String compCode = comCode;//"1004";
	String dept = (String) session.getAttribute("department");

		//String dept = department;//"1004";

        session.setAttribute("department",dept);

	String usrFdbk =""; 
    String usrFdbk1 =""; 

    String reportOrderBy = "report";

        	

    reportResult = policyController.NewDashBoardReportVerticalDept(compCode, frequency, createdDate, reportOrderBy, dept,timescapeUserOId);

//out.println("Size: "+ reportResult.size());

	//includes the control tabs for reviewer
	session.setAttribute("currLink","REPORT");
	session.setAttribute("leftLink","0");

	//includes the frequency tabs for reviewer
	session.setAttribute("currLink","QUARTERLY");
	session.setAttribute("leftLink","5");

    
	session.setAttribute("reportArray", reportResult);
    session.setAttribute("reportAnnuallyDate", createdDate);
    session.setAttribute("frequency", "7");
    response.sendRedirect("../includes/showFunction.jsp?frequency="+frequency+"&date="+date+"&startDate="+startDate+"&endDate="+endDate+"&compCode="+compCode+"&createdDate="+createdDate);
    
%>

