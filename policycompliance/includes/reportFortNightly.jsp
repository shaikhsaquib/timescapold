<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%//@ include file="../includes/empHeader.jsp" %>
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
	String subMonth = "";

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );

	String date = (String)request.getParameter("fromDate");
	String comCode = (String)request.getParameter("compCode");
	String department = (String)request.getParameter("dept");
	String createdDate = "";
	/*if (date == null){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
		if(date.length() == 1){
			date = "0" + date;
		}
		date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	}
		//out.println("date=======2"+date);
		String dt = date;

		String newDate = date;

		DateFormat formatter2 ; 
		Date date1 ; 
		formatter2 = new SimpleDateFormat("dd-MMM-yy");
		date1 = (Date)formatter2.parse(date);  
		//out.println("date1"+date1);
		
		//Conversion of Date to String format.....
		Date dateNow = date1;
		SimpleDateFormat str = new SimpleDateFormat("dd-MMM-yyyy");
		String date5 = new String( str.format( dateNow ) );
		//out.println("date5-----"+date5);

		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("dd-MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
		Date processDate = sdf.parse(date5);
		calendar.setTime(processDate);
		//calendar.add(Calendar.MONTH);
		String dateSelected = sdf.format(calendar.getTime());
		String selectedDate = dateSelected.substring(0,dateSelected.indexOf("-"));
		int selectedDate1 = Integer.parseInt(selectedDate);
		//out.println("selectedDate-----"+selectedDate1);

		if (selectedDate1 >= 01 && selectedDate1 <= 13){
			selectedDate1 = 26;

			
		} else if (selectedDate1 >= 13 && selectedDate1 <= 31){
			selectedDate1 = 13;
		}
			
		
		SimpleDateFormat SDF = new SimpleDateFormat();
		SDF.applyPattern("dd-MMM-yyyy");
		Calendar calendar1 = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();
		Date processDate1 = SDF.parse(date5);
		calendar1.setTime(processDate1);
		calendar1.add(Calendar.MONTH, -1);
		calendar2.add(Calendar.MONTH, 0);
		String previousMonth = SDF.format(calendar1.getTime());
		String previousMonth2 = SDF.format(calendar2.getTime());
		String previousMonth1 = previousMonth.substring(previousMonth.indexOf("-")+1);
		String previousMonth3 = previousMonth2.substring(previousMonth2.indexOf("-")+1);
		selectedDate = Integer.toString(selectedDate1);
		int frequency = 3; //frequency 3 stands for Weekly controls
		
		if (selectedDate.equals("26")){
		createdDate =selectedDate+"-"+previousMonth1.toUpperCase();//"11-AUG-2011";//
		}else if (selectedDate.equals("13")){
		createdDate =selectedDate+"-"+previousMonth3.toUpperCase();//"11-AUG-2011";//
		}*/

        if (date == null){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
		if(date.length() == 1){
			date = "0" + date;
		}
		date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	}
	String fromDate = date;
    //String toDate = dt;
	//String createdDate = "";

		String newDate = date;

		DateFormat formatter2 ; 
		Date date1 ; 
		formatter2 = new SimpleDateFormat("dd-MMM-yy");
		date1 = (Date)formatter2.parse(date);  
		
		//Conversion of Date to String format.....
		Date dateNow = date1;
		SimpleDateFormat str = new SimpleDateFormat("dd-MMM-yyyy");
		String date5 = new String( str.format( dateNow ) );

		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("dd-MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
		Date processDate = sdf.parse(date5);
		calendar.setTime(processDate);
		String dateSelected = sdf.format(calendar.getTime());
		String selectedDate = dateSelected.substring(0,dateSelected.indexOf("-"));
		int selectedDate1 = Integer.parseInt(selectedDate);

		if (selectedDate1 >= 1 && selectedDate1 <= 15){
			selectedDate1 = 13;

			
		} else if (selectedDate1 >= 16 && selectedDate1 <= 31){
			selectedDate1 = 26;
		}
			
		
		SimpleDateFormat SDF = new SimpleDateFormat();
		SDF.applyPattern("dd-MMM-yyyy");
		Calendar calendar1 = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();
		Date processDate1 = SDF.parse(date5);
		//System.out.println("processDate1....."+processDate1);
		calendar1.setTime(processDate1);
		calendar1.add(Calendar.MONTH, -1);
		calendar2.add(Calendar.MONTH, 0);
		String previousMonth = SDF.format(calendar1.getTime());
		String previousMonth2 = SDF.format(calendar2.getTime());
		String previousMonth1 = previousMonth.substring(previousMonth.indexOf("-")+1);
		String previousMonth3 = previousMonth2.substring(previousMonth2.indexOf("-")+1);
		selectedDate = Integer.toString(selectedDate1);

		int frequency = 3; //frequency 3 stands for Weekly controls
		
		if (selectedDate.equals("13")){
		createdDate = selectedDate+"-"+previousMonth1.toUpperCase();//"11-AUG-2011";//
		}else if (selectedDate.equals("26")){
		createdDate = selectedDate+"-"+previousMonth1.toUpperCase();//"11-AUG-2011";//
		}

        //out.println("<br>createdDate"+createdDate);
 
    String createdDatedashboard = createdDate.substring(0,createdDate.indexOf("-"));
    String month = previousMonth1.substring(0,previousMonth1.indexOf("-"));

		String compCode = "1004";//comCode;//"1004";
		//String dept = department;//"1004";

		String usrFdbk =""; 
		String usrFdbk1 =""; 

		String reportOrderBy = "report";

		reportResult = policyController.dashBoardReport(compCode, frequency, createdDate, reportOrderBy);

%>

<%
	//includes the control tabs for reviewer
	session.setAttribute("currLink","REPORT");
	session.setAttribute("leftLink","0");
%>

<%
	//includes the frequency tabs for reviewer
	session.setAttribute("currLink","FORTNIGHTLY");
	session.setAttribute("leftLink","3");
%>
<%

    String function     = "";
    String subProcess = "";
    String control       = "";

    int yesCount  = 0;
    int noCount   = 0;
    int naCount   = 0;
    int ntaCount  = 0;
    
    int funcGreen  = 0;
    int funcYellow = 0;
    int funcRed     = 0;

    int spGreen  = 0;
    int spYellow = 0;
    int spRed     = 0;

    int ctGreen  = 0;
    int ctYellow = 0;
    int ctRed     = 0;

    double  noPercent = 0.0;

    String ctStatus = "";
    String spStatus = "";
    String funcStatus = "";


    Hashtable tempHash1 = null; 
    Hashtable tempHash2 = null; 
    Hashtable tempHash3 = null; 


    String ctArr [] = null;
    Object tmpObjArr [] = null;
    Object tmpObjArr1 [] = null;
    String[] tmpArr = null;

    String[] tmpArr3 = null;

    ArrayList reportArray = new ArrayList();

    //Control Status starts here.    

	for (int ii = 0; ii< reportResult.size(); ii++) {


        tmpArr = (String [] )reportResult.get(ii); 
        //out.println("<BR>control--"+control+"--"+tmpArr[7]);

        //out.println(tmpArr[19]);

        if (!"".equals(control) && !tmpArr[7].equals(control)) {
            
            //out.println(ii+"--"+ntaCount);

            tmpArr3 = (String []) reportResult.get(ii-1);

            ctArr  = new String [13];

            ctArr [0] = tmpArr3[5]; //function
            ctArr [1] = "";
            ctArr [2] = tmpArr3[4]; // Policy SubHead
            ctArr [3] = "";
            ctArr [4] = tmpArr3[7]; // PolicyId
            ctArr [5] = tmpArr3[8]; // Questions
            ctArr [6] = "";

            //out.println(control+"yesCount" + "-" +yesCount);
            ctArr [7] = yesCount+"";
            ctArr [8] = noCount+"";
            ctArr [9] = naCount+"";
            ctArr [10] = ntaCount+"";
            ctArr [11] = yesCount + noCount + naCount + ntaCount+"";

           //out.println(ntaCount);
            noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;

            ctArr [12] = noPercent+"";

            if (noPercent > 60) {

                ctArr [6] = "red";

            } else if (noPercent < 40) {
            
                ctArr [6] = "green";

            } else {

                ctArr [6] = "yellow";
            
            }
            

            reportArray.add(ctArr);

            yesCount  = 0;
            noCount   = 0;
            naCount   = 0;
            ntaCount  = 0; 

        }
        

        //out.println(tmpArr[19]);
        if (tmpArr[19].equals("Yes")) {
            
            yesCount = yesCount + 1;
            //out.println("yesCount" + " " +yesCount);

        } else if (tmpArr[19].equals("No")) {

            noCount = noCount + 1;
            
        } else if (tmpArr[19].equals("Not Acted")) {

            ntaCount = ntaCount +1;

        } else {

            naCount = naCount + 1;

        }
        
        control = tmpArr[7];

            
    } // end of userResut for loop

    ctArr  = new String [13];

    ctArr [0] = "";//tmpArr[5];
    ctArr [1] = "";
    ctArr [2] = "";//tmpArr[4];
    ctArr [3] = "";
    ctArr [4] = "";//tmpArr[7];
    ctArr [5] = "";//tmpArr[8];
    ctArr [6] = "";
    ctArr [7] = yesCount+"";
    ctArr [8] = noCount+"";
    ctArr [9] = naCount+"";
    ctArr [10] = ntaCount+"";
    ctArr [11] = yesCount + noCount + naCount + ntaCount+"";

    noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;

    ctArr [12] = noPercent+"";

    if (noPercent > 60) {

        ctArr [6] = "red";

    } else if (noPercent < 40) {
    
        ctArr [6] = "green";

    } else {

        ctArr [6] = "yellow";
    
    }
        
    //out.println(ctArr [6]);
    reportArray.add(ctArr);
        
    yesCount  = 0;
    noCount   = 0;
    naCount   = 0;
    ntaCount  = 0; 



    //Control Status ends here.    


    //Process Status starts here.    
    
    int fromStatus = 0;

    for (int ii = 0; ii< reportArray.size(); ii++) {
		
        tmpArr = (String [] )reportArray.get(ii); 

        //out.println("<br>subProcess--"+subProcess);        

        //out.println("<br>"+tmpArr[0]+"--"+tmpArr[1]+"--"+tmpArr[2]+"--"+tmpArr[3]+"--"+tmpArr[4]+"--"+tmpArr[5]+"--"+tmpArr[6]+"--"+tmpArr[7]+"--"+tmpArr[8]+"--"+tmpArr[9]+"--"+tmpArr[10]+"--"+tmpArr[11]+"--"+tmpArr[12]+"--");

        if (!"".equals(subProcess) && !tmpArr[4].equals(subProcess)) {

            //out.println("<br>ctGreen"+ctGreen);

           if (ctRed == ctYellow && ctRed == ctGreen) {

                spStatus = "red";

            } else if ((double)ctRed/(ctRed+ctYellow+ctGreen)*100 > 49) {
                
                spStatus = "red";

            } else if ((double)ctYellow/(ctRed+ctYellow+ctGreen)*100 > 49) {
                
                spStatus = "yellow";

            } else if ((double)ctGreen/(ctRed+ctYellow+ctGreen)*100 > 80) {
                
                spStatus = "green";

            } else if (ctRed == ctYellow || ctRed == ctGreen) {

                spStatus = "red";

            } else {

                 spStatus="yellow";   

            }

            for (int jj=fromStatus; jj<ii; jj++) {

                String tmpArr1 [] = (String[]) reportArray.get(jj);
                tmpArr1[3] = spStatus;

                //out.println("<br>"+spStatus);
               //  reportArray.remove(jj);
               // reportArray.add(jj, tmpArr1);

            }

            ctRed = 0;
            ctYellow = 0;
            ctGreen = 0;
            fromStatus = ii;

        }

        if (tmpArr[6].equals("red")) {
            
            ctRed = ctRed + 1;

        } else if (tmpArr[6].equals("yellow")) {

            ctYellow = ctYellow + 1;
            
        } else if (tmpArr[6].equals("green")) {

            ctGreen = ctGreen +1;

        }

        subProcess = tmpArr[2];

    } // for (int ii=0 .. reportArray



    if (ctRed == ctYellow && ctRed == ctGreen) {

        tmpArr[3] = "red";

    } else if ((double)ctRed/(ctRed+ctYellow+ctGreen)*100 > 49) {
        
        tmpArr[3] = "red";

    } else if ((double)ctYellow/(ctRed+ctYellow+ctGreen)*100 > 49) {
        
        tmpArr[3] = "yellow";

    } else if ((double)ctGreen/(ctRed+ctYellow+ctGreen)*100 > 80) {
        
        tmpArr[3] = "green";

    } else if (ctRed == ctYellow || ctRed == ctGreen) {

        tmpArr[3] = "red";

    }

    for (int jj=fromStatus; jj<reportArray.size(); jj++) {

        String tmpArr1 [] = (String[]) reportArray.get(jj);
        tmpArr1[3] = spStatus;

        //out.println("<br>"+spStatus);
      //  reportArray.remove(jj);
       // reportArray.add(jj, tmpArr1);

    }

    ctRed = 0;
    ctYellow = 0;
    ctGreen = 0;



    //Process Status ends here.


    //Function status starts here.

    fromStatus = 0;
    function = "";
    //reportArray.size(); 
	int n =0;
    //for (int ii = 0; ii<18;    ii++) {
    for (int ii = 0; ii<reportArray.size();    ii++) {
		
        tmpArr = (String [] )reportArray.get(ii); 

       //out.println("<br>subProcess--"+subProcess);        

        //out.println("<br>"+tmpArr[0]+"--"+tmpArr[1]+"--"+tmpArr[2]+"--"+tmpArr[3]+"--"+tmpArr[4]+"--"+tmpArr[5]+"--"+tmpArr[6]+"--"+tmpArr[7]+"--"+tmpArr[8]+"--"+tmpArr[9]+"--"+tmpArr[10]+"--"+tmpArr[11]+"--"+tmpArr[12]+"--");

        

        if  (!"".equals(function) && !tmpArr[0].equals(function) && n != 1) {

           // out.println("<br>"+function+"----"+"<br>--ctGreen--" + ctGreen + "--ctRed--" +ctRed+ "--"+ "--ctYellow--"+ctYellow);


            if (ctRed == ctYellow && ctRed == ctGreen) {
                 
                funcStatus = "red";

            } else if ((double)ctRed/(ctRed+ctYellow+ctGreen)*100 > 49.0) {
               
                funcStatus = "red";

            } else if( (double)ctYellow/(ctRed+ctYellow+ctGreen)*100  > 49.0) {
                
                funcStatus = "yellow";

            } else if ((double)ctGreen/(ctRed+ctYellow+ctGreen)*100 > 80.0) {
               
                funcStatus = "green";

            } else if (ctRed == ctYellow || ctRed == ctGreen) {
                
                funcStatus = "red";

            } else {

                funcStatus = "yellow";

            }


             //out.println("<br>--"+funcStatus);
            for (int jj=fromStatus; jj<ii; jj++) {

                String tmpArr1 [] = (String[]) reportArray.get(jj);
             
                tmpArr1[1] = funcStatus;

              // reportArray.remove(jj);
             //   reportArray.add(jj, tmpArr1);

            }
            //out.println("<br>--"+ "function--"+function+"--"+funcStatus); 
            ctRed = 0;
            ctYellow = 0;
            ctGreen = 0;
            fromStatus = ii;

        }

        if (tmpArr[3].equals("red")) {
            
            ctRed = ctRed + 1;

        } else if (tmpArr[3].equals("yellow")) {

            ctYellow = ctYellow + 1;
            
        } else if (tmpArr[3].equals("green")) {

            ctGreen = ctGreen +1;
          //  out.println("AT Function" + ctGreen);

        }

        function = tmpArr[0];

    } // for (int ii=0 .. reportArray



    if (ctRed == ctYellow && ctRed == ctGreen) {

        funcStatus = "red";

    } else if ((double)ctRed/(ctRed+ctYellow+ctGreen)*100 > 49) {
        
        funcStatus = "red";

    } else if ((double)ctYellow/(ctRed+ctYellow+ctGreen)*100 > 49) {
        
        funcStatus = "yellow";

    } else if ((double)ctGreen/(ctRed+ctYellow+ctGreen)*100 > 80.0) {
        
        funcStatus = "green";

    } else if (ctRed == ctYellow || ctRed == ctGreen) {

        funcStatus = "red";

    } else {

                funcStatus = "yellow";

            }

    //out.println("-- Size--"+reportArray.size());
    for (int jj=fromStatus; jj<reportArray.size(); jj++) {

        String tmpArr1 [] = (String[]) reportArray.get(jj);
        tmpArr1[1] = funcStatus;

        //out.println("<br>"+spStatus);
        reportArray.remove(jj);
        //out.println("-- Size2--"+reportArray.size());
        reportArray.add(jj, tmpArr1);
       

    }

    ctRed = 0;
    ctYellow = 0;
    ctGreen = 0;



    //Function status ends here







    for (int ii = 0; ii< reportArray.size(); ii++) {
		
        tmpArr = (String [] )reportArray.get(ii); 

       //out.println("<br>"+tmpArr[0]+"--<b>"+tmpArr[1]+"</b>--"+tmpArr[2]+"--<b>"+tmpArr[3]+"</b>--"+tmpArr[4]+"--"+tmpArr[5]+"--<b>"+tmpArr[6]+"</b>--"+tmpArr[7]+"--"+tmpArr[8]+"--"+tmpArr[9]+"--"+tmpArr[10]+"--"+tmpArr[11]+"--"+tmpArr[12]+"--");
    
    }

		session.setAttribute("reportArray", reportArray);
		session.setAttribute("date", date);

           response.sendRedirect("../includes/showFunction.jsp?frequency="+frequency+"&selectedDate="+selectedDate+"&previousMonth1="+previousMonth1+"&comCode="+comCode+"&department="+department+"&createdDatedashboard="+createdDatedashboard+"&month="+month+"&previousMonth3="+previousMonth3);
    
%>

