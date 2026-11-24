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

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );


	String date = (String)request.getParameter("fromDate");
	String compCode = (String)request.getParameter("compCode");
	String department = (String)request.getParameter("dept");

	//out.println("department is="+department);
	//out.println("compCode is="+compCode);

		
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
    
    out.println("dayOfWeek---"+dayOfWeek);

    if (dayOfWeek < 5) {

        val1 = 0 - (dayOfWeek + 8);
        //val2 = 0 - (dayOfWeek + 12);
        val2 = 0 - (dayOfWeek + 5);

     } else {

        val1 = 0 - (dayOfWeek + 1);
        val2 = 0 - (dayOfWeek + 5);
     }

     out.println("val1-->"+val1);
     out.println("val2--->"+val2);


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
    out.println("^^^^^^"+fromDate1);

	
    int frequency = 2; //frequency 2 stands for Weekly controls

    String createdDate =newDate.toUpperCase();//date2;//"11-AUG-2011";//date;
    out.println("createdDate----"+createdDate);
    //String compCode ="1004";// comCode;//
    String dept = department;//"1004";

    String usrFdbk =""; 
    String usrFdbk1 =""; 

    String reportOrderBy = "report";

    reportResult = policyController.dashBoardReport(compCode, frequency, createdDate, reportOrderBy, dept);

    //out.println("Size: "+ reportResult.size());

    //includes the control tabs for reviewer
    session.setAttribute("currLink","REPORT");
    session.setAttribute("leftLink","0");
    //includes the frequency tabs for reviewer
    session.setAttribute("currLink","WEEKLY");
    session.setAttribute("leftLink","1");

    String function     = "";
    String subProcess = ""; //stores policy id
    String control       = ""; //stores policy id

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

    //out.println("reportResult.size"+reportResult.size());

    if (reportResult.size() > 0) {

        for (int ii = 0; ii< reportResult.size(); ii++) {

            tmpArr = (String [] )reportResult.get(ii); 
            //out.println("<BR>control--"+control+"------tmpArr[7]--"+tmpArr[7]);

            //out.println(tmpArr[19]);

            if (!"".equals(control) && !tmpArr[7].equals(control)) {
                
                //out.println(ii+"--"+ntaCount);

                tmpArr3 = (String []) reportResult.get(ii-1);

                ctArr  = new String [13];
                //out.println(tmpArr3[8]);
                ctArr [0] = tmpArr3[5]; //function
                ctArr [1] = "";
                ctArr [2] = tmpArr3[4]; // Policy SubHead
                ctArr [3] = "";
                ctArr [4] = tmpArr3[7]; // PolicyId
                ctArr [5] = tmpArr3[8]; // Questions
                ctArr [6] = "";
                ctArr [7] = yesCount+"";
                ctArr [8] = noCount+"";
                ctArr [9] = naCount+"";
                ctArr [10] = ntaCount+"";
                ctArr [11] = yesCount + noCount + naCount + ntaCount+"";
                //out.println(control+"ctArr [11]" + "-" +ctArr [11]);

               //out.println("<br>"+tmpArr3[5]);
               //out.println(tmpArr3[7]);
               //out.println(ctArr [11]);
               //out.println(ntaCount);
               //out.println(noCount);
               //out.println(yesCount);
               //out.println(naCount);

                noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
                //out.println(control+"noPercent" + "-"+noPercent);
                ctArr [12] = noPercent+"";
               // out.println("======%"+ctArr [12]);

                if (noPercent > 60) {

                    ctArr [6] = "red";

                } else if (noPercent < 40) {
                
                    ctArr [6] = "green";

                } else {

                    ctArr [6] = "yellow";
                
                }
                
                //out.println(ctArr);
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
           // out.println("control" + " " +control);
                
        } // end of userResult for loop

        ctArr  = new String [13];

        ctArr [0] = tmpArr[5];
        ctArr [1] = "";
        ctArr [2] = tmpArr[4];
        ctArr [3] = "";
        ctArr [4] = tmpArr[7];
        ctArr [5] = tmpArr[8];
        ctArr [6] = "";
        ctArr [7] = yesCount+"";
        ctArr [8] = noCount+"";
        ctArr [9] = naCount+"";
        ctArr [10] = ntaCount+"";
        ctArr [11] = yesCount + noCount + naCount + ntaCount+"";

        //out.println("<br>"+tmpArr3[5]);
       //out.println("<br>"+ctArr [11]);
       //out.println(ntaCount);
       //out.println(noCount);
       //out.println(yesCount);
       //out.println(naCount);

        //out.println(ctArr [11]);
        noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
        
        ctArr [12] = noPercent+"";
        //out.println(control+"noPercent" + "-"+noPercent);

        if (noPercent > 60) {

            ctArr [6] = "red";

        } else if (noPercent < 40) {
        
            ctArr [6] = "green";

        } else {

            ctArr [6] = "yellow";
        
        }
            
        //out.println("new count"+ctArr [6]);
        reportArray.add(ctArr);
        //out.println(reportArray);
            
        yesCount  = 0;
        noCount   = 0;
        naCount   = 0;
        ntaCount  = 0; 

        //Control Status ends here.    
        //Process Status starts here.    
        
        int fromStatus = 0;
        //out.println("reportArray.size==="+reportArray.size());

        int l		   = 0;
        tmpArr = null;

        for (int ii = 0; ii< reportArray.size(); ii++) {
            
            tmpArr = (String [] )reportArray.get(ii); 

            //out.println("<br>subProcess--"+subProcess+"--"+tmpArr[2]);        
      
            //out.println("<br>"+ii+"----"+tmpArr[0]+"--"+tmpArr[1]+"--"+tmpArr[2]+"--"+tmpArr[3]+"--"+tmpArr[4]+"--"+tmpArr[5]+"--"+tmpArr[6]+"--"+tmpArr[7]+"--"+tmpArr[8]+"--"+tmpArr[9]+"--"+tmpArr[10]+"--"+tmpArr[11]+"--"+tmpArr[12]+"--");		

            if (!"".equals(subProcess) && (!tmpArr[2].equals(subProcess) || !tmpArr[0].equals(function))) {

                 //out.println("here---------<br>"+tmpArr[5] );
                //out.println("colour"+tmpArr[6]);

                noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
                //out.println(control+"noPercent" + "-"+noPercent);

                if (noPercent > 60) {

                    spStatus = "red";

                } else if (noPercent < 40) {
                
                    spStatus = "green";

                } else {

                    spStatus = "yellow";
                
                }			
                
                //out.println("fromStatus==="+fromStatus);
                for (int jj=fromStatus; jj<ii; jj++) {

                    String tmpArr1 [] = (String[]) reportArray.get(jj);
                    tmpArr1[3] = spStatus;

                    //out.println("<br>"+spStatus);
                    //  reportArray.remove(jj);
                    // reportArray.add(jj, tmpArr1);
                }

                yesCount  = 0;
                noCount   = 0;
                naCount   = 0;
                ntaCount  = 0;
                fromStatus = ii;

            } //	END OF SUBPROCESS IF
            
            //out.println("<br>tmpArr[6]==="+tmpArr[6]);

            yesCount = yesCount + Integer.parseInt(tmpArr[7]);
            noCount  = noCount  + Integer.parseInt(tmpArr[8]);
            naCount  = naCount  + Integer.parseInt(tmpArr[9]);
            ntaCount = ntaCount + Integer.parseInt(tmpArr[10]);

            subProcess = tmpArr[2];
            function   = tmpArr[0];	
            //out.println("<br>subProcess==="+subProcess);
            //out.println("function==="+function);

        } // for (int ii=0 .. reportArray


        //out.println("ctRed1 count"+ctRed);
        //out.println("ctYellow1 count"+ctYellow);
        //out.println("ctGreen1 count"+ctGreen);

        noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
        //out.println(control+"noPercent" + "-"+noPercent);

        if (noPercent > 60) {

            spStatus = "red";

        } else if (noPercent < 40) {
        
            spStatus = "green";

        } else {

            spStatus = "yellow";
        
        }			

        for (int jj=fromStatus; jj<reportArray.size(); jj++) {

            String tmpArr1 [] = (String[]) reportArray.get(jj);
            tmpArr1[3] = spStatus;

            //out.println("<br>"+spStatus);
          //  reportArray.remove(jj);
           // reportArray.add(jj, tmpArr1);

        }


        //Process Status ends here.

        //Function status starts here.

        yesCount  = 0;
        noCount   = 0;
        naCount   = 0;
        ntaCount  = 0;
        fromStatus = 0;
        function = "";
        int n =0;

        //out.println("<br><br>------------------<br><br>");

        for (int ii = 0; ii<reportArray.size();    ii++) {
            
            tmpArr = (String [] )reportArray.get(ii); 

           //out.println("<br>subProcess--"+subProcess);        

            //out.println("<br>"+tmpArr[0]+"--"+tmpArr[1]+"--"+tmpArr[2]+"--"+tmpArr[3]+"--"+tmpArr[4]+"--"+tmpArr[5]+"--"+tmpArr[6]+"--"+tmpArr[7]+"--"+tmpArr[8]+"--"+tmpArr[9]+"--"+tmpArr[10]+"--"+tmpArr[11]+"--"+tmpArr[12]+"--");

            if  (!"".equals(function) && !tmpArr[0].equals(function)) {

               // out.println("<br>"+function+"----"+"<br>--ctGreen--" + ctGreen + "--ctRed--" +ctRed+ "--"+ "--ctYellow--"+ctYellow);


                noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
                //out.println(control+"noPercent" + "-"+noPercent);

                if (noPercent > 60) {

                    funcStatus = "red";

                } else if (noPercent < 40) {
                
                    funcStatus = "green";

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
                yesCount  = 0;
                noCount   = 0;
                naCount   = 0;
                ntaCount  = 0;
                fromStatus = ii;
            }

            yesCount = yesCount + Integer.parseInt(tmpArr[7]);
            noCount  = noCount  + Integer.parseInt(tmpArr[8]);
            naCount  = naCount  + Integer.parseInt(tmpArr[9]);
            ntaCount = ntaCount + Integer.parseInt(tmpArr[10]);

            function = tmpArr[0];
       } 



        noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
        //out.println(control+"noPercent" + "-"+noPercent);

        if (noPercent > 60) {

            funcStatus = "red";

        } else if (noPercent < 40) {
        
            funcStatus = "green";

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

        yesCount  = 0;
        noCount   = 0;
        naCount   = 0;
        ntaCount  = 0;


        //Function status ends here



        //out.println("<br><br>------------------<br><br>");




        /*for (int ii = 0; ii< reportArray.size(); ii++) {
            
            tmpArr = (String [] )reportArray.get(ii); 

           out.println("<br>"+ii+"--"+tmpArr[0]+"--<b><font color="+tmpArr[1]+">"+tmpArr[1]+"</font></b>--"+tmpArr[2]+"--<b><font color="+tmpArr[3]+">"+tmpArr[3]+"</font></b>--"+tmpArr[4]+"--"+tmpArr[5]+"--<b><font color="+tmpArr[6]+">"+tmpArr[6]+"</font></b>--"+tmpArr[7]+"--"+tmpArr[8]+"--"+tmpArr[9]+"--"+tmpArr[10]+"--"+tmpArr[11]+"--"+tmpArr[12]+"--");
        
        }*/

    }

	session.setAttribute("reportArray", reportArray);
	session.setAttribute("reportArrayDate", newDate);
	session.setAttribute("frequency", "2");

   response.sendRedirect("../includes/showFunction.jsp?date="+date+"&fromDate1="+fromDate1+"&compCode="+compCode+"&department="+department+"&newDate="+newDate);
    
%>

