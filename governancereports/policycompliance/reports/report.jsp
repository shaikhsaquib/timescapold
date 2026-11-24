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
    String department = "";

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

    //out.println("newDate---"+newDate);
                        
    //Conversion of String to Date format.....
    DateFormat formatter2 ; 
    Date date1 ; 
    formatter2 = new SimpleDateFormat("dd-MMM-yy");
    date1 = (Date)formatter2.parse(date);  
    //out.println("date1"+date1);
    
    //Conversion of Date to String format.....
    Date dateNow = date1;
    SimpleDateFormat str = new SimpleDateFormat("dd-MMM-yyyy");
    //StringBuilder date2 = new StringBuilder( str.format( dateNow ) );
    //out.println("date2-----"+date2);

    //To find day from selected date....
    Calendar cal = Calendar.getInstance();
    cal.setTime(date1);
    dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
    //out.println(dayOfWeek);

    
    String fromDate1 = "";

    int val1 = 0;
    int val2 = 0;
    
    //out.println("dayOfWeek---"+dayOfWeek);

    if (dayOfWeek < 5) {

        val1 = 0 - (dayOfWeek + 8);
        val2 = 0 - (dayOfWeek + 12);
        //val2 = 0 - (dayOfWeek + 5);

     } else {

        val1 = 0 - (dayOfWeek + 1);
        val2 = 0 - (dayOfWeek + 5);
     }

    SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy");

    Calendar calendar1 = Calendar.getInstance();
    calendar1.setTime(formatter1.parse(date)); 
    calendar1.add(Calendar.DATE, val1);  
    newDate = formatter1.format(calendar1.getTime());
    //out.println("newDate1==="+newDate);

    SimpleDateFormat formatter4 = new SimpleDateFormat("dd-MMM-yyyy");
    Calendar calendar4 = Calendar.getInstance();
    calendar4.setTime(formatter4.parse(date)); 
    calendar4.add(Calendar.DATE, val2);  
    fromDate1 = formatter4.format(calendar4.getTime());
    //out.println("^^^^^^"+fromDate1);

	
    int frequency = 2; //frequency 2 stands for Weekly controls

    String createdDate =newDate.toUpperCase();//date2;//"11-AUG-2011";//date;
    //out.println("createdDate----"+createdDate);
    //String compCode ="1004";// comCode;//
    String dept = department;//"1004";

    session.setAttribute("department",dept);

    //System.out.println("dept----"+dept);

    String usrFdbk =""; 
    String usrFdbk1 =""; 

    String reportOrderBy = "report";

	if(timescapeUserOId == 23048 || timescapeUserOId == 23732 || timescapeUserOId == 23028){

        compCode = "1001";

        }
		if(timescapeUserOId == 38140){
			
		compCode = "1023";
		}

        if(timescapeUserOId == 27623 || timescapeUserOId == 43133 || timescapeUserOId == 43833){

        compCode = "1009";

        }

        if (timescapeUserOId == 23789 || timescapeUserOId == 32280) {

        compCode = "1017";

        }

        /*if(timescapeUserOId == 16666){

        compCode = "1004";

        }*/
		if(timescapeUserOId == 44377 || timescapeUserOId == 44378){

        compCode = "1030";

        }

         if((timescapeUserOId == 29238 || timescapeUserOId == 38695)&& compCode.equals("1000")){

        compCode = "1003";
		 }else {

            compCode = compCode;


        }

    if((timescapeUserOId == 26602 || timescapeUserOId == 38330 || timescapeUserOId == 35372 || timescapeUserOId == 38963 || timescapeUserOId == 38571)&& compCode.equals("1000")){ 

        compCode = "1005";

    }else {

        compCode = compCode;

    }
    if(timescapeUserOId == 5180 || timescapeUserOId == 1343 || timescapeUserOId == 11072 || timescapeUserOId == 24866 || timescapeUserOId == 1851 || timescapeUserOId == 26670 || timescapeUserOId == 93 || timescapeUserOId == 21069){

        compCode = "1000";
        dept = deptName;

        }
    //dept="1002";

    //reportResult = policyController.dashBoardReportVertical(compCode, frequency, createdDate, reportOrderBy, dept);
    //reportResult = policyController.NewDashBoardReportVertical(compCode, frequency, createdDate, reportOrderBy, //dept);
	
	if(!compCode.equals("1000") && dept.equalsIgnoreCase("all") || compCode.equals("1000") && !dept.equalsIgnoreCase("all")){

		reportResult = policyController.NewDashBoardReportVertical(compCode, frequency, createdDate, reportOrderBy, dept, funct);	
	}
    //System.out.println("Size: "+ reportResult.size());

    //includes the control tabs for reviewer
    session.setAttribute("currLink","REPORT");
    session.setAttribute("leftLink","0");
    //includes the frequency tabs for reviewer
    session.setAttribute("currLink","WEEKLY");
    session.setAttribute("leftLink","1");
	session.setAttribute("funct", funct);



	session.setAttribute("reportArray", reportResult);
	session.setAttribute("reportArrayDate", newDate);
	session.setAttribute("frequency", "2");

   response.sendRedirect("../reports/showFunction.jsp?date="+date+"&fromDate1="+fromDate1+"&compCode="+compCode+"&newDate="+newDate+"&createdDate="+createdDate);
    
%>

