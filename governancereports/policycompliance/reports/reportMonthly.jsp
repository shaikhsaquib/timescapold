<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date,java.util.StringTokenizer" %>
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
    String startDate = "";
    String endDate = "";

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );

	String date = (String)request.getParameter("fromDate");
	String funct = (String) request.getParameter("funct");
	
	if(funct == null){
		funct = "";
	}
	
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
	if (department==null){
        department = (String)session.getAttribute("department");
        }
    System.out.println("department--"+department);

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

		//String dt = date;
		String newDate = date;
							
		//Conversion of String to Date format.....
		DateFormat formatter2 ; 
		Date date1 ; 
		formatter2 = new SimpleDateFormat("dd-MMM-yy");
		date1 = (Date)formatter2.parse(date);  
		//out.println("date1"+date1);

		
		//Conversion of Date to String format.....
		Date dateNow = date1;
		SimpleDateFormat str = new SimpleDateFormat("MMM-yyyy");
		String date5 = new String( str.format( dateNow ) );
		//out.println("date5-----"+date5);

		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
        //out.println(calendar.MONTH);
		Date processDate = sdf.parse(date5);
		calendar.setTime(processDate);
		calendar.add(Calendar.MONTH, -1);
		String previousMonth = sdf.format(calendar.getTime());
		//String previousMonth1 = previousMonth.substring(0,previousMonth.indexOf("-"));*/
       
         Calendar cal = new GregorianCalendar();

      
         //out.println ("old date--"+day+"--"+monthArr[month]+"--"+year);

         //if (selectedDay < 6 ) {
         if (selectedDay < 11 ) {

            selMonth = selMonth - 2;

         } else {

            selMonth = selMonth -1;
         }


         if (selMonth < 0) {

            selMonth = selMonth + 12;
            selectedYear = selectedYear -1;
         } 
        
        //out.println("selectedDay----"+selectedDay);
        startDate = "01"+"-"+monthArr[selMonth]+"-"+selectedYear;

          // Create a calendar object of the desired month
        Calendar calLastDay = new GregorianCalendar(selectedYear, selMonth, 1);

        // Get the number of days in that month
        int lastDay = calLastDay.getActualMaximum(Calendar.DAY_OF_MONTH);

        endDate = lastDay+"-"+monthArr[selMonth]+"-"+selectedYear;


		//String fromDate1 = "";

		int frequency = 4; //frequency 2 stands for Weekly controls

		String createdDate ="26-"+monthArr[selMonth]+"-"+selectedYear;
	    //out.println(createdDate);
		//String compCode = "1004";//comCode;//
        
        //String dept = (String) session.getAttribute("department");

		String dept = department;//"1004";

        session.setAttribute("department",dept);

		String usrFdbk =""; 
		String usrFdbk1 =""; 

		String reportOrderBy = "report";

        if(timescapeUserOId == 23048 || timescapeUserOId == 23732 || timescapeUserOId == 23028){

        compCode = "1001";

        }
		if(timescapeUserOId == 38140){
			
		compCode = "1023";
		}
		
        if (timescapeUserOId == 23789 || timescapeUserOId == 32280) {

        compCode = "1017";

        }

        if(timescapeUserOId == 27623 || timescapeUserOId == 43133 || timescapeUserOId == 43833){

        compCode = "1009";

        }

        if((timescapeUserOId == 29238 || timescapeUserOId == 38695)&& compCode.equals("1000")){

        compCode = "1003";
		 }else {

            compCode = compCode;


        }
        
		if(timescapeUserOId == 44377 || timescapeUserOId == 44378){

        compCode = "1030";

        }
        if(timescapeUserOId == 5180 || timescapeUserOId == 1343 || timescapeUserOId == 11072 || timescapeUserOId == 24866 || timescapeUserOId == 1851 || timescapeUserOId == 26670 || timescapeUserOId == 93 || timescapeUserOId == 21069){

        compCode = "1000";
        dept = deptName;

        }

        if((timescapeUserOId == 26602 || timescapeUserOId == 38330 || timescapeUserOId == 35372 || timescapeUserOId == 38963 || timescapeUserOId == 38571)&& compCode.equals("1000")){

            compCode = "1005";

        }else {

            compCode = compCode;

        }
		//reportResult = policyController.dashBoardReportVertical(compCode, frequency, createdDate, reportOrderBy, dept);
          reportResult = policyController.NewDashBoardReportVertical(compCode, frequency, createdDate, reportOrderBy, dept, funct);


//out.println("Size: "+ reportResult.size());


	//includes the control tabs for reviewer
	session.setAttribute("currLink","REPORT");
	session.setAttribute("leftLink","0");

	//includes the frequency tabs for reviewer
	session.setAttribute("currLink","MONTHLY");
	session.setAttribute("leftLink","4");
	session.setAttribute("funct", funct);
	
    

	session.setAttribute("reportArray", reportResult);
	session.setAttribute("reportMonthlyDate",createdDate);
    session.setAttribute("frequency", "4");
    response.sendRedirect("../reports/showFunction.jsp?startDate="+startDate+"&compCode="+compCode+"&endDate="+endDate+"&date="+date+"&createdDate="+createdDate);
    
%>

