<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 

<%

   ArrayList reportResult = new ArrayList();

   String userOid = "0";
   ArrayList userAllOid = new ArrayList();
   ArrayList userPartOid = new ArrayList();
   ArrayList userNtActOid = new ArrayList();

//  ArrayList approverOid = new ArrayList();
   ArrayList approverResult = new ArrayList();
   ArrayList apprAllOid = new ArrayList();
   ArrayList apprPartOid = new ArrayList();
   ArrayList apprNtActOid = new ArrayList();
   ArrayList functionResult = new ArrayList();
   ArrayList userResult = new ArrayList();



	String approverOid      = "0";
	String userFdbk           ="";
    String userFdbk1         ="";
	String approverFdbk     ="";
    String approverFdbk1    ="";
	String function             = "";
	//int frequency = 2;
    
    int l               =0;
    int colorCnt     =0;
    String ans        = "";
    String notAct    = "";
    String  no        = "";
    String yes        = "";
    String notAppl  = ""; 
    String orderBy = "";
    
    int qusActCnt = 0;
	int qusYesCnt = 0;
	int qusNoCnt = 0;
	int qusNotAppl = 0;
	int qusNotActCnt = 0;
	
    int totalUsers = 0; 
	
    int totalApprovers = 0;
	
    int functionCnt    = 0;
    int fYesCnt         = 0;
    int fNoCnt          = 0;
    int fNotApplCnt   = 0;
    int fNotActCnt     = 0;

    int aYesCnt         = 0;
    int aNoCnt          = 0;
    int aNotApplCnt     = 0;
    int aNotActCnt      = 0;
    int aNoActReqCnt    = 0;

	int dayOfWeek = 0;
	//String company2="";

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );
	String roleId = (String)session.getAttribute("roleId"); // rolecode of the user
	String date = (String)request.getParameter("date");
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

	String dt = date;
	if(date == null || date.equals("")){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
		if(date.length() == 1){
			date = "0" + date;
		}
		date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	
		//date ="30-MAR-2011";
	}
	String newDate = date;
							
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
		
		String fromDate1 = "";

		 int val1 = 0;
        int val2 = 0;

        if (dayOfWeek < 5) {

            val1 = 0 - (dayOfWeek + 8);
            val2 = 0 - (dayOfWeek + 12);

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

        SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
        Calendar calendar = Calendar.getInstance();
        //calendar.setTime(formatter.parse(dt)); 
        calendar.setTime(formatter.parse(fromDate1)); 
        calendar.add(Calendar.DATE, 6);  
        dt = formatter.format(calendar.getTime());
        //out.println(fromDate1);
			
	String fromDate = date;
	////(fromDate);
    String toDate = dt;
	////(toDate);

	if(fromDate == null || fromDate.equals("")){
		
        fromDate = "";
		toDate = "";
        orderBy		= "weeklyTxnReport";
       
       } else {

           orderBy		= "txnReport";

       }


	int frequency = 2; //frequency 2 stands for Weekly controls

	String createdDate = newDate.toUpperCase();//date;
    //String compCode = "1004";//comCode;//"1004"; //companyCode;

	String usrFdbk =""; 
    String usrFdbk1 =""; 
	  

//	reportResult = policyController.dashBoardReport(compCode, frequency, fromDate, toDate, orderBy);

    if(timescapeUserOId == 23048){

        compCode = "1001";

        }

    if((timescapeUserOId == 26602 || timescapeUserOId == 38330 )&& compCode.equals("1000")){

            compCode = "1005";

        }else {

            compCode = compCode;

        }

   
	String userOrderby = "user";
	userResult = policyController.getRecords(compCode, frequency, createdDate, userOrderby, department);

	String approverOrderby = "approver";
	approverResult = policyController.getRecords(compCode, frequency, createdDate,  approverOrderby, department);

	String functionOrderby = "function";
	functionResult = policyController.getRecords(compCode, frequency, createdDate,  functionOrderby, department);
	

	/*String userOrderby = "user";
	userResult = policyController.getRecords(compCode, frequency, createdDate, userOrderby);

	String approverOrderby = "approver";
	approverResult = policyController.getRecords(compCode, frequency, createdDate,  approverOrderby);

	String functionOrderby = "function";
	functionResult = policyController.getRecords(compCode, frequency, createdDate,  functionOrderby);*/
    
%>

<html>
<head>
<title>OCA Report</title>
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />
<link href="../style/calendarControl.css"rel="stylesheet">
<script src="../jscripts/calendarControl.js"language="javascript"></script>
<!-- <script Language="JavaScript" src="../jscripts/approveDaily.js"></script> -->
<script Language="JavaScript" src="../jscripts/common.js"></script>
<script Language="JavaScript" src="../jscripts/allReports.js"></script>
<script Language="JavaScript" src="../../jscripts/allModuleReports.js"></script>

</title>
</head>

<!-- <body onLoad="showDepartments();">
 --><form name="frmReport" method = "post" action = "">
<%@ include file="../includes/headerMenu.jsp" %>
 <%@ include file="../../common/allModulePageOca.jsp" %>
 
<%
	//includes the control tabs for reviewer
	session.setAttribute("currLink","CONTROLS");
	session.setAttribute("leftLinkA","0");
%>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr width="100%" >
		<td width="10%" class="style4" height = "30" align = "left">Select Date :</td>
		<td><input type="text" class="style2" id="date" name="date" onfocus="showCalendarControl(this);" readOnly value="<%=date%>">&nbsp;&nbsp;
		<img src="../images/orangearrow.gif" border="0" onclick="changeDate1(<%=frequency%>,<%=dayOfWeek%>)"></td>
		<td width = "20%" border = "0" align="right"><%@ include file="../includes/allDashBoardTabs.jsp" %></td>
     </tr> 
</table>

<%
	//includes the frequency tabs for reviewer
	session.setAttribute("currLink","WEEKLY");
	session.setAttribute("leftLink","1");
%>
<!-- <%//@ include file="../includes/dashBoardFrequencyTabs.jsp" %> -->
	 <%@ include file="../includes/allDashBoardFrequencyTabs.jsp" %>
		 <table width="100%" align="center" cellpadding="0" cellspacing="0">
				  <col width="151" />
				  <col width="196" />
					<tr>
						<td height="27" colspan="8" bgcolor="#E0E78F"  class="nameHEAD"> OCA - Self Assessment Status For The Week <%=fromDate1%> - <%=toDate%> (Report For The Last Closed Week For The Selected Date) </td>
					</tr>
			</table>



 <%
	if ( userResult.size() > 0){
  
	for(int i = 0; i< userResult.size(); i++){
		
		String[] tmpArr = (String [] )userResult.get(i); 
      
	if(!userOid.equals(tmpArr[0])) {
	  userOid = tmpArr[0];
	   totalUsers += 1;
	 
	 if(!tmpArr[1].equals("Not Acted")){
	  userAllOid.add(tmpArr[0]);

	 }

     if(tmpArr[1].equals("Not Acted")){
		  userNtActOid.add(tmpArr[0]);
	 }

    }else{
        
		   if(tmpArr[1].equals("Not Acted") && (userAllOid.indexOf(tmpArr[0])>-1)) {
             if(userAllOid.contains(tmpArr[0])){
			  userAllOid.remove(userAllOid.indexOf(tmpArr[0]));
			   userPartOid.add(tmpArr[0]);
			 }
		    } else if(!tmpArr[1].equals("Not Acted") && (userNtActOid.indexOf(tmpArr[0])>-1 )){
                if(userNtActOid.contains(tmpArr[0])){
				 userNtActOid.remove(userNtActOid.indexOf(tmpArr[0]));
                 userPartOid.add(tmpArr[0]);
			}
		}
	}

		if(tmpArr[1].equals("Yes")){
				qusYesCnt += 1;
			}else if(tmpArr[1].equals("No")){
				qusNoCnt += 1;
			} else if(tmpArr[1].equals("Not Applicable")){
				qusNotAppl += 1;
			}else{
				qusNotActCnt += 1;
			}


		
	} // end of userResut for loop

session.setAttribute("userAllOid",userAllOid);
session.setAttribute("userPartOid",userPartOid);
session.setAttribute("userNtActOid",userNtActOid);

		qusActCnt += qusYesCnt + qusNoCnt + qusNotAppl;
  } // end of userResut if 


  if( approverResult.size() > 0){
	  for(int i = 0; i< approverResult.size(); i++){
		
		String[] tmpArr = (String [] )approverResult.get(i); 

         if(!approverOid.equals(tmpArr[2])) {
	        approverOid = tmpArr[2];
			totalApprovers += 1;
////(tmpArr[3]);	 
	 if(!tmpArr[3].equals("Not Acted")){
	  apprAllOid.add(tmpArr[2]);
	 }

     if(tmpArr[3].equals("Not Acted")){
		  apprNtActOid.add(tmpArr[2]);
	 }

    }else{
		   if(tmpArr[3].equals("Not Acted") && (apprAllOid.indexOf(tmpArr[2])>-1)) {
             if(apprAllOid.contains(tmpArr[2])){
			  apprAllOid.remove(apprAllOid.indexOf(tmpArr[2]));
			   apprPartOid.add(tmpArr[2]);
			 }
		    } else if(!tmpArr[3].equals("Not Acted") && (apprNtActOid.indexOf(tmpArr[2])>-1 )){
                if(apprNtActOid.contains(tmpArr[2])){
				 apprNtActOid.remove(apprNtActOid.indexOf(tmpArr[2]));
                 apprPartOid.add(tmpArr[2]);
			}
		}
	}
	  
		
	} // end of approverResut for loop

session.setAttribute("apprAllOid",apprAllOid);
session.setAttribute("apprPartOid",apprPartOid);
session.setAttribute("apprNtActOid",apprNtActOid);

	
  
  } // end of approverResult if


   %>

<table width="70%" border="0" cellpadding="4" cellspacing="1" align="center">
  <tbody>
    <tr height="25px">
      <td width="16%" align="left" valign="middle" bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr>
      <td width="16%" align="left" valign="middle" bgcolor="#E0E78F"><span class="name">Functions</span></td>
      <td width="15%" align="left" valign="middle" bgcolor="#E0E78F" class="name">No. of Questions</td>
      <td width="11%" align="left" valign="middle" bgcolor="#E0E78F" class="name">User Answered / Approver Answered </td>
      <td width="13%" align="left" valign="middle" bgcolor="#E0E78F" class="name">User Unanswered / Approver Unanswered </td>
      <td width="14%" align="left" valign="middle" bgcolor="#E0E78F" class="name">User Answered 'No' / Approver Answered 'No' </td>
      <td width="14%" align="left" valign="middle" bgcolor="#E0E78F" class="name">User Answered 'Yes' / Approver Answered 'Yes'</td>
      <td width="17%" align="left" valign="middle" bgcolor="#E0E78F" class="name">User Answered 'Not Applicable' / Approver Answered 'Not Applicable' </td>
    </tr>
      
    
   <%
           String functionName = "";
	       String bgColor = "#F3F5D6";
		   if (functionResult.size()>0) {
////(functionResult.size());	#E0E78F	   #F3F5D6
		   for( int f = 0; f< functionResult.size(); f++){

			   String tmpArr[] =  (String [] )functionResult.get(f);
              
			    if (l !=0) {
                       //System.out.println(functionName);
					 if (!functionName.equals(tmpArr[5])) {
                     %>				
                        <td bgcolor="<%=bgColor%>" class="style3"><%=functionCnt%></td>
                        <td align="left" valign="middle" bgcolor="#FBFCEF"><a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="1"%>')" class="style3Underline"><%=fYesCnt+fNoCnt+fNotApplCnt%></a> / <a href="#" onclick="functionReport('<%=compCode%>','<%=frequency%>','<%=createdDate%>','<%=function%>','<%="2"%>')" class="style3Underline"><%=aYesCnt+aNoCnt+aNotApplCnt+aNoActReqCnt%></a></td>

                        <td align="left" valign="middle" bgcolor="#FBFCEF" ><a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="3"%>')"class="style3Underline"><%=fNotActCnt%></a> / <a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="7"%>')" class="style3Underline"><%=aNotActCnt%></a></td>

                        <td align="left" valign="middle" bgcolor="#FBFCEF" ><a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="4"%>')"class="style3Underline"><%=fNoCnt%></a> / <a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="8"%>')" class="style3Underline"><%=aNoCnt%></a></td>

                        <td align="left" valign="middle" bgcolor="#FBFCEF" ><a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="5"%>')"class="style3Underline"><%=fYesCnt%></a> / <a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="9"%>')" class="style3Underline"><%=aYesCnt%></a></td>

                        <td align="left" valign="middle" bgcolor="#FBFCEF" ><a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="6"%>')"class="style3Underline"><%=fNotApplCnt %></a> / <a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="10"%>')" class="style3Underline"><%=aNotApplCnt%></a></td>

<%				     functionCnt   = 0;

					 fYesCnt        = 0;
					 fNoCnt         = 0;
					 fNotApplCnt  = 0;
					 fNotActCnt    = 0;
                     
					 aYesCnt        = 0;
					 aNoCnt         = 0;
					 aNotApplCnt    = 0;
                     aNoActReqCnt    = 0;
					 aNotActCnt     = 0;

                   }
                 }
				
				if (!functionName.equals(tmpArr[5])) {

                      functionName = tmpArr[5];
                      function = Utility.replaceAmparsandURL(tmpArr[5]);
					  functionCnt++;
					  l = 1;
					
                    if (colorCnt%2==0) {

				        bgColor="#F5F8E0";

					} else {

						bgColor = "#FBFCEF";
					}
					  
					colorCnt++;

                    if (tmpArr[1].equals("Yes")) {

                            fYesCnt += 1;
                            //aYesCnt += 1;

                        }else if (tmpArr[1].equals("No")) {

                            fNoCnt += 1;
                            //aNoCnt += 1;

                        } else if (tmpArr[1].equals("Not Applicable")) {

                            fNotApplCnt += 1;
                            //aNotApplCnt += 1;

                        }else {

                            fNotActCnt += 1;
                            //aNotActCnt += 1;
                        }


                        if (tmpArr[3].equals("Yes")) {

                            //fYesCnt += 1;
                            aYesCnt += 1;

                        }else if (tmpArr[3].equals("No")) {

                           // fNoCnt += 1;
                            aNoCnt += 1;

                        } else if (tmpArr[3].equals("Not Applicable")) {

                           // fNotApplCnt += 1;
                            aNotApplCnt += 1;

                        } else if (tmpArr[3].equals("No Action Required")) {

                           // fNotApplCnt += 1;
                            aNoActReqCnt += 1;
                           }
                        else {

                            //fNotActCnt += 1;
                            aNotActCnt += 1;
                        }

					  
%>
				 <tr>
					<td	width="10%" align="left" valign="middle" bgcolor="<%=bgColor%>" class="style3"><%=functionName%></td>
                    
						
<%			 
	                 
	            }else {
					  
                      functionCnt++;
					  l = 1;

                       if (tmpArr[1].equals("Yes")) {

                            fYesCnt += 1;
                            //aYesCnt += 1;

                        }else if (tmpArr[1].equals("No")) {

                            fNoCnt += 1;
                            //aNoCnt += 1;

                        } else if (tmpArr[1].equals("Not Applicable")) {

                            fNotApplCnt += 1;
                            //aNotApplCnt += 1;

                        }else {

                            fNotActCnt += 1;
                            //aNotActCnt += 1;
                        }


                        if (tmpArr[3].equals("Yes")) {

                            //fYesCnt += 1;
                            aYesCnt += 1;

                        }else if (tmpArr[3].equals("No")) {

                            //fNoCnt += 1;
                            aNoCnt += 1;

                        } else if (tmpArr[3].equals("Not Applicable")) {

                            //fNotApplCnt += 1;
                            aNotApplCnt += 1;

                        } else if (tmpArr[3].equals("No Action Required")) {

                           // fNotApplCnt += 1;
                            aNoActReqCnt += 1;
                           }else {

                            //fNotActCnt += 1;
                            aNotActCnt += 1;
                        }
	               }      
		   }
		  }
%>
                        <td bgcolor="<%=bgColor%>" class="style3"><%=functionCnt%></td>
                        <td align="left" valign="middle" bgcolor="#FBFCEF"><a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="1"%>')" class="style3Underline"><%=fYesCnt+fNoCnt+fNotApplCnt%></a> / <a href="#" onclick="functionReport('<%=compCode%>','<%=frequency%>','<%=createdDate%>','<%=function%>','<%="2"%>')" class="style3Underline"><%=aYesCnt+aNoCnt+aNotApplCnt+aNoActReqCnt%></a></td>

                        <td align="left" valign="middle" bgcolor="#FBFCEF" ><a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="3"%>')"class="style3Underline"><%=fNotActCnt%></a> / <a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="7"%>')" class="style3Underline"><%=aNotActCnt%></a></td>

                        <td align="left" valign="middle" bgcolor="#FBFCEF" ><a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="4"%>')"class="style3Underline"><%=fNoCnt%></a> / <a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="8"%>')" class="style3Underline"><%=aNoCnt%></a></td>

                        <td align="left" valign="middle" bgcolor="#FBFCEF" ><a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="5"%>')"class="style3Underline"><%=fYesCnt%></a> / <a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="9"%>')" class="style3Underline"><%=aYesCnt%></a></td>

                        <td align="left" valign="middle" bgcolor="#FBFCEF" ><a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="6"%>')"class="style3Underline"><%=fNotApplCnt %></a> / <a href="#" onclick="functionReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%=function%>','<%="10"%>')" class="style3Underline"><%=aNotApplCnt%></a></td>
 </tbody>
</table>
<table width="70%" border="0" cellpadding="4" cellspacing="1" align="center">
  <tbody>
    <tr class="style3" height="25px">
      <td width="43%" align="left" valign="middle" bgcolor="#FFFFFF" class="name">&nbsp;</td>
    </tr>
    <tr>
      <td align="left" valign="middle" bgcolor="#E0E78F" class="style3"><span class="name">Users</span></td>
      <td bgcolor="#E0E78F"></td>
      <td bgcolor="#E0E78F" class="style3"><span class="name">Approvers</span></td>
      <td bgcolor="#E0E78F"></td>
    </tr>

    <tr>
      <td width="43%" align="left" valign="middle" bgcolor="#FBFCEF" class="name">Total Users</td>
      <td width="8%" bgcolor="#FBFCEF"><span class="style3"><%=totalUsers%></span></td>
      <td width="38%" bgcolor="#FBFCEF" class="name">Total Approvers </td>
      <td width="11%" bgcolor="#FBFCEF"><span class="style3"><%=totalApprovers%></span></td>
    </tr>
    <tr>
      <td align="left" valign="middle" bgcolor="#F5F8E0" class="style3">No. of users acted on all questions</td>
      <td bgcolor="#F5F8E0"><span class="style3Underline"><a href="#" class="style3" onclick="userReport('<%=compCode%>','<%=frequency%>','<%=createdDate%>','<%="userAll"%>')"><%=userAllOid.size()%></a></span></td>
      <td bgcolor="#F5F8E0" class="style3"> No. of approvers acted on all questions </td>
      <td bgcolor="#F5F8E0"><span class="style3Underline"><a href="#" class="style3" onclick="approverReport('<%=compCode%>','<%=frequency%>','<%=createdDate%>','<%="apprAll"%>')"><%=apprAllOid.size()%></a></span></td>
    </tr>
    <tr>
      <td align="left" valign="middle" bgcolor="#FBFCEF" class="style3"> No. of uesrs acted on partial questions </td>
      <td bgcolor="#FBFCEF"><span class="style3Underline"><a href="#" class="style3" onclick="userReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%="userPart"%>')"><%=userPartOid.size()%></a></span></td>
      <td bgcolor="#FBFCEF" class="style3"> No. of approvers acted on partial questions </td>
      <td bgcolor="#FBFCEF"><span class="style3Underline"><a href="#" class="style3" onclick="approverReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%="apprPart"%>')"><%=apprPartOid.size()%></a></span></td>
    </tr>
    <tr>
      <td align="left" valign="middle" bgcolor="#F5F8E0" class="style3"> No. of users not acted </td>
      <td bgcolor="#F5F8E0"><span class="style3Underline"><a href="#" class="style3" onclick="userReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%="userNtAct"%>')"><%=userNtActOid.size()%></a></span></td>
      <td bgcolor="#F5F8E0" class="style3"> No. of approvers not acted </td>
      <td bgcolor="#F5F8E0"><span class="style3Underline"><a href="#" class="style3" onclick="approverReport('<%=compCode%>', '<%=frequency%>','<%=createdDate%>','<%="apprNtAct"%>')"><%=apprNtActOid.size()%></a></span></td>
    </tr>
    <tr>
      <td width="43%" align="left" valign="middle">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>

 <tr>
	<td colspan="100%" height="3px" ><block type="spacer" height="4px"></td>
  </tr>

</table>
</table>
</form>
</body>
</html>