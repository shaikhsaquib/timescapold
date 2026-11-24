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
    String roleId = (String)session.getAttribute("roleId");
    
    

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );


	String date = (String)request.getParameter("fromDate");
    
	//out.println("date value is="+date);
    
    Calendar today = Calendar.getInstance();
// Subtract 1 day
    today.add(Calendar.DATE, -1);
// Make an SQL Date out of that
   java.sql.Date yesterday = new java.sql.Date(today.getTimeInMillis());
    
    //out.println("prevDate :" + yesterday);

		
	String selectedCompany  = (String) request.getParameter("selectedCompany");
    session.setAttribute("selectedCompany",selectedCompany);
	String selectedModule  = (String) request.getParameter("selectedModule");
    session.setAttribute("selectedModule",selectedModule);
     
	//String compCode = (String)request.getParameter("compCode");
    String compCode = companyCode;
    
    if((compCode == null) || (compCode == "" ))
				{
					compCode = "1000";
				} else {
                    
                    session.setAttribute("compCode",compCode);
                }

     //out.println("compCode=="+compCode);

    //String department = (String)request.getParameter("dept");
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

    

    String newDate = date;
    //out.println("newDate---"+newDate);
                        
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

			String createdDate =newDate.toUpperCase();//date2;//"11-AUG-2011";//date;
            String dept = deptName;//department;

			String usrFdbk =""; 
			String usrFdbk1 =""; 

			String reportOrderBy = "report";


      /*if (companyCode.equals("1004") || companyCode.equals("1005") || companyCode.equals("1017")){

                 dept = "all";

                }

		reportResult = policyController.dashBoardReportVerticalDept(compCode, frequency, createdDate, reportOrderBy, dept,roleId,timescapeUserOId);

       if (timescapeUserOId == 12756 || timescapeUserOId == 19098 || timescapeUserOId ==23789) {

            reportResult = policyController.dashBoardReportVertical(compCode, frequency, createdDate, reportOrderBy, dept);

            }*/

			//out.println("Size: "+ reportResult.size());

			//includes the control tabs for reviewer
			session.setAttribute("currLink","REPORT");
			session.setAttribute("leftLink","0");
			//includes the frequency tabs for reviewer
			session.setAttribute("currLink","DAILY");
			session.setAttribute("leftLink","0");


	String function     = "";
    String subProcess = ""; //stores policy id
    String process = ""; //stores SubFunction
    String policyHead = ""; //stores policyHead
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

    out.println("reportResult.size"+reportResult.size());

    if (reportResult.size() > 0) {

        for (int ii = 0; ii< reportResult.size(); ii++) { //294
			
            tmpArr = (String [] )reportResult.get(ii); 

            
            if ((!"".equals(control) && !tmpArr[7].equals(control)) || control.equals(tmpArr[7]))  {  //269
              //if ((!"".equals(control) && !tmpArr[7].equals(control)) || useroid.equals(tmpArr[16])){

                tmpArr3 = (String []) reportResult.get(ii-1);

            //System.out.println("HIII");

                ctArr  = new String [16];
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

                noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
                ctArr [12] = noPercent+"";
                ctArr [13] = tmpArr3[6];   //SubFunction
                ctArr [14] = tmpArr3[3];   //PolicyHead
				ctArr [15] = tmpArr3[19];   //Yes/No/Not Acted/NA

                if (noPercent > 60) {

                    ctArr [6] = "red";

                } else if (noPercent < 40) {
                
                    ctArr [6] = "green";

                } else {

                    ctArr [6] = "yellow";
                
                }
                
                reportArray.add(ctArr);     

               

       }
			
            
            if (tmpArr[19].equals("Yes")) {
                
                yesCount = yesCount + 1;
                //System.out.println("yesCount" + "^^^^ " +yesCount);

            } else if (tmpArr[19].equals("No")) {

                noCount = noCount + 1;
                //System.out.println("noCount" + " ^^^^" +noCount);
                            
            } else if (tmpArr[19].equals("Not Acted")) {

                ntaCount = ntaCount +1;
               //System.out.println("ntaCount======" +ntaCount);
                
            } else {

                naCount = naCount + 1;
                //System.out.println("naCount" + "^^^^ " +naCount);
                
            }

            
            control = tmpArr[7];
            
                       
            
        } // end of userResult for loop //223

        ctArr  = new String [16];

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
        noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
        
        ctArr [12] = noPercent+"";
        ctArr [13] = tmpArr[6];   //SubFunction
        ctArr [14] = tmpArr[3];   //policyHead
		ctArr [15] = tmpArr[19];   //Yes/No/Not Acted/NA

        if (noPercent > 60) {

            ctArr [6] = "red";

        } else if (noPercent < 40) {
        
            ctArr [6] = "green";

        } else {

            ctArr [6] = "yellow";
        
        }
            
        reportArray.add(ctArr);
            
        



        //Control Status ends here.    
        //Process Status starts here.    
        
        int fromStatus = 0;

        int l		   = 0;
        tmpArr = null;

//-------------------------------------------------------------------------------------------------------------------------------------------------------

        for (int ii = 0; ii< reportArray.size(); ii++) {    //391
            
            tmpArr = (String [] )reportArray.get(ii);      
            //out.println("<br>"+ii+"----"+tmpArr[0]+"--"+tmpArr[1]+"--"+tmpArr[2]+"--"+tmpArr[3]+"--"+tmpArr[4]+"--"+tmpArr[5]+"--"+tmpArr[6]+"--"+tmpArr[7]+"--"+tmpArr[8]+"--"+tmpArr[9]+"--"+tmpArr[10]+"--"+tmpArr[11]+"--"+tmpArr[12]+"--"+tmpArr[13]+"--tttttt"+tmpArr[14]+"tttt--");		

            if (!"".equals(subProcess) && (!tmpArr[2].equals(subProcess) || !tmpArr[0].equals(function) || !tmpArr[13].equals(process) || !tmpArr[14].equals(policyHead))) {  //378
                noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;

                if (noPercent > 60) {

                    spStatus = "red";

                } else if (noPercent < 40) {
                
                    spStatus = "green";

                } else {

                    spStatus = "yellow";
                
                }			
                
                for (int jj=fromStatus; jj<ii; jj++) {

                    String tmpArr1 [] = (String[]) reportArray.get(jj);
                    tmpArr1[3] = spStatus;
                }

                yesCount  = 0;
                noCount   = 0;
                naCount   = 0;
                ntaCount  = 0;
                fromStatus = ii;

            } //	END OF SUBPROCESS IF    //349
            

            yesCount = yesCount + Integer.parseInt(tmpArr[7]);
            noCount  = noCount  + Integer.parseInt(tmpArr[8]);
            naCount  = naCount  + Integer.parseInt(tmpArr[9]);
            ntaCount = ntaCount + Integer.parseInt(tmpArr[10]);

            subProcess = tmpArr[2];
            function   = tmpArr[0];	
            process   = tmpArr[13];	
            policyHead   = tmpArr[14];	

            //out.println("<br>function==="+function);
            //out.println("<br>subProcess==="+subProcess);
            //out.println("<br>policyHead==="+policyHead);
            

        } // for (int ii=0 .. reportArray  //344
        noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;

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

//--------------------------------------------------------------------------------------------------------------------------------------------------------



//-------------------------------------------------------------------------------------------------------------------------------------------------------

        for (int ii = 0; ii< reportArray.size(); ii++) {    //391
            
            tmpArr = (String [] )reportArray.get(ii);      
            //out.println("<br>"+ii+"----"+tmpArr[0]+"--"+tmpArr[1]+"--"+tmpArr[2]+"--"+tmpArr[3]+"--"+tmpArr[4]+"--"+tmpArr[5]+"--"+tmpArr[6]+"--"+tmpArr[7]+"--"+tmpArr[8]+"--"+tmpArr[9]+"--"+tmpArr[10]+"--"+tmpArr[11]+"--"+tmpArr[12]+"--"+tmpArr[13]+"--tttttt"+tmpArr[14]+"tttt--");		

            if (!"".equals(subProcess) && (!tmpArr[2].equals(subProcess) || !tmpArr[0].equals(function) || !tmpArr[13].equals(process))) {  //378
                noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;

                if (noPercent > 60) {

                    spStatus = "red";

                } else if (noPercent < 40) {
                
                    spStatus = "green";

                } else {

                    spStatus = "yellow";
                
                }			
                
                for (int jj=fromStatus; jj<ii; jj++) {

                    String tmpArr1 [] = (String[]) reportArray.get(jj);
                    tmpArr1[3] = spStatus;
                }

                yesCount  = 0;
                noCount   = 0;
                naCount   = 0;
                ntaCount  = 0;
                fromStatus = ii;

            } //	END OF SUBPROCESS IF    //349
            

            yesCount = yesCount + Integer.parseInt(tmpArr[7]);
            noCount  = noCount  + Integer.parseInt(tmpArr[8]);
            naCount  = naCount  + Integer.parseInt(tmpArr[9]);
            ntaCount = ntaCount + Integer.parseInt(tmpArr[10]);

            subProcess = tmpArr[2];
            function   = tmpArr[0];	
            process   = tmpArr[13];	
            //policyHead   = tmpArr[14];	

            //out.println("<br>function==="+function);
            //out.println("<br>subProcess==="+subProcess);
            //out.println("<br>policyHead==="+policyHead);
            

        } // for (int ii=0 .. reportArray  //344
        noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;

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
        }


        //Process Status ends here.

        //Function status starts here.

        yesCount  = 0;
        noCount   = 0;
        naCount   = 0;
        ntaCount  = 0;
        fromStatus = 0;
        function = "";
        //int n =0;

//--------------------------------------------------------------------------------------------------------------------------------------------------------

        for (int ii = 0; ii< reportArray.size(); ii++) {    //391
            
            tmpArr = (String [] )reportArray.get(ii);      
            //out.println("<br>"+ii+"----"+tmpArr[0]+"--"+tmpArr[1]+"--"+tmpArr[2]+"--"+tmpArr[3]+"--"+tmpArr[4]+"--"+tmpArr[5]+"--"+tmpArr[6]+"--"+tmpArr[7]+"--"+tmpArr[8]+"--"+tmpArr[9]+"--"+tmpArr[10]+"--"+tmpArr[11]+"--"+tmpArr[12]+"--"+tmpArr[13]+"--");		

            if (!"".equals(subProcess) && (!tmpArr[2].equals(subProcess) || !tmpArr[0].equals(function))) {  //378
                noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;

                if (noPercent > 60) {

                    spStatus = "red";

                } else if (noPercent < 40) {
                
                    spStatus = "green";

                } else {

                    spStatus = "yellow";
                
                }			
                
                for (int jj=fromStatus; jj<ii; jj++) {

                    String tmpArr1 [] = (String[]) reportArray.get(jj);
                    tmpArr1[3] = spStatus;
                }

                yesCount  = 0;
                noCount   = 0;
                naCount   = 0;
                ntaCount  = 0;
                fromStatus = ii;

            } //	END OF SUBPROCESS IF    //349
            

            yesCount = yesCount + Integer.parseInt(tmpArr[7]);
            noCount  = noCount  + Integer.parseInt(tmpArr[8]);
            naCount  = naCount  + Integer.parseInt(tmpArr[9]);
            ntaCount = ntaCount + Integer.parseInt(tmpArr[10]);

            subProcess = tmpArr[2];
            function   = tmpArr[0];	
            //out.println("<br>subProcess==="+subProcess);
           //out.println("function==="+function);

        } // for (int ii=0 .. reportArray  //344
        noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;

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
        }


        //Process Status ends here.

        //Function status starts here.

        yesCount  = 0;
        noCount   = 0;
        naCount   = 0;
        ntaCount  = 0;
        fromStatus = 0;
        function = "";
        //int n =0;

        //out.println("<br><br>------------------<br><br>");

        for (int ii = 0; ii<reportArray.size();    ii++) {
            
            tmpArr = (String [] )reportArray.get(ii); 
            //out.println("<br>"+tmpArr[0]+"--"+tmpArr[1]+"--"+tmpArr[2]+"--"+tmpArr[3]+"--"+tmpArr[4]+"--"+tmpArr[5]+"--"+tmpArr[6]+"--"+tmpArr[7]+"--"+tmpArr[8]+"--"+tmpArr[9]+"--"+tmpArr[10]+"--"+tmpArr[11]+"--"+tmpArr[12]+"--"+tmpArr[13]+"--");

            if  (!"".equals(function) && !tmpArr[0].equals(function)) {

               // out.println("<br>"+function+"----"+"<br>--ctGreen--" + ctGreen + "--ctRed--" +ctRed+ "--"+ "--ctYellow--"+ctYellow);


                noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;

                if (noPercent > 60) {

                    funcStatus = "red";

                } else if (noPercent < 40) {
                
                    funcStatus = "green";

                } else {

                    funcStatus = "yellow";
                
                }			
                for (int jj=fromStatus; jj<ii; jj++) {

                    String tmpArr1 [] = (String[]) reportArray.get(jj);
                 
                    tmpArr1[1] = funcStatus;
                }
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
        if (noPercent > 60) {

            funcStatus = "red";

        } else if (noPercent < 40) {
        
            funcStatus = "green";

        } else {

            funcStatus = "yellow";
        
        }

        for (int jj=fromStatus; jj<reportArray.size(); jj++) {

            String tmpArr1 [] = (String[]) reportArray.get(jj);
            tmpArr1[1] = funcStatus;
            reportArray.remove(jj);
            reportArray.add(jj, tmpArr1);
        }

        yesCount  = 0;
        noCount   = 0;
        naCount   = 0;
        ntaCount  = 0;


        //Function status ends here
        /*for (int ii = 0; ii< reportArray.size(); ii++) {
            
            tmpArr = (String [] )reportArray.get(ii); 

           out.println("<br>"+ii+"--"+tmpArr[0]+"--<b><font color="+tmpArr[1]+">"+tmpArr[1]+"</font></b>--"+tmpArr[2]+"--<b><font color="+tmpArr[3]+">"+tmpArr[3]+"</font></b>--"+tmpArr[4]+"--"+tmpArr[5]+"--<b><font color="+tmpArr[6]+">"+tmpArr[6]+"</font></b>--"+tmpArr[7]+"--"+tmpArr[8]+"--"+tmpArr[9]+"--"+tmpArr[10]+"--"+tmpArr[11]+"--"+tmpArr[12]+"--"+tmpArr[13]+"--"+tmpArr[14]);
        
        }*/

    }

    session.setAttribute("reportArray", reportArray);
	session.setAttribute("reportDailyDate",newDate);
    session.setAttribute("frequency", "1");
		

           response.sendRedirect("../includes/showFunction.jsp?frequency="+frequency+"&date="+date+"&fromDate1="+fromDate1);
    
%>

