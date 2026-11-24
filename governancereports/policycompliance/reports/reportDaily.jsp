<%@ page language="java" %>
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
	int dayOfWeek = 0;
    String department = (String)request.getParameter("dept");
    
    

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );

    //System.out.println("TESTING----"+timescapeUserOId);

	String date = (String)request.getParameter("fromDate");
	String funct = (String) request.getParameter("funct");
	
	if(funct == null){
		funct = "";
	}

    String selectedCompany  = (String) request.getParameter("selectedCompany");
    session.setAttribute("selectedCompany",selectedCompany);
	String selectedModule  = (String) request.getParameter("selectedModule");
    session.setAttribute("selectedModule",selectedModule);
     
	String compCode = (String)request.getParameter("compCode");
    //out.println("compCode=="+compCode);
    if((compCode == null) || (compCode == "" ))
				{
					compCode = "1000";
				} else {
                    
                    session.setAttribute("compCode",compCode);
                }
    

    
    department = (String)request.getParameter("dept");
    if (department==null){
        department = (String)session.getAttribute("department");
        }
    System.out.println("department=="+department);
    compCode = (String) session.getAttribute("compCode");

    if((department == null) || (department == "" ) || (department == "NaN" )|| (department.equals("0") ))
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

    String newDate = date;

    System.out.println("newDate---"+newDate);
                        
    //Conversion of String to Date format.....
    DateFormat formatter2 ; 
    Date date1 ; 
    formatter2 = new SimpleDateFormat("dd-MMM-yy");
    date1 = (Date)formatter2.parse(date);  
   // out.println("date1"+date1);
    
    //Conversion of Date to String format.....
    Date dateNow = date1;
    SimpleDateFormat str = new SimpleDateFormat("dd-MMM-yyyy");

    //To find day from selected date....
    Calendar cal = Calendar.getInstance();
    cal.setTime(date1);
    dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
    //out.println("dayOfWeek==="+dayOfWeek);

    
    String fromDate1 = Integer.toString(dayOfWeek);
    fromDate1 += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);

    
		//out.println("date1: "+ date);
	
			int frequency = 1; //frequency 2 stands for Weekly controls

			String createdDate = newDate.toUpperCase();//date2;//"11-AUG-2011";//date;
            String dept = department;

			String usrFdbk =""; 
			String usrFdbk1 =""; 

			String reportOrderBy = "report";

            if(timescapeUserOId == 23048 || timescapeUserOId == 23028){

                compCode = "1001";

            }
			if(timescapeUserOId == 43833){

                compCode = "1009";

            }

            if((timescapeUserOId == 26602 || timescapeUserOId == 38330 )&& compCode.equals("1000")){

                compCode = "1005";

            }else {

                compCode = compCode;

            }

            //reportResult = policyController.dashBoardReportVertical(compCode, frequency, createdDate, reportOrderBy,dept);
            reportResult = policyController.NewDashBoardReportVertical(compCode, frequency, createdDate, reportOrderBy, dept, funct);

			//out.println("Size: "+ reportResult.size());

			//includes the control tabs for reviewer
			session.setAttribute("currLink","REPORT");
			session.setAttribute("leftLink","0");
			//includes the frequency tabs for reviewer
			session.setAttribute("currLink","DAILY");
			session.setAttribute("leftLink","0");
			session.setAttribute("funct", funct);


	


    session.setAttribute("reportArray", reportResult);
	session.setAttribute("reportArrayDate",newDate);
    session.setAttribute("frequency", "1");
		

   response.sendRedirect("../reports/showFunction.jsp?frequency="+frequency+"&date="+date+"&fromDate1="+fromDate1+"&createdDate="+createdDate+"&compCode="+compCode);
    
%>

