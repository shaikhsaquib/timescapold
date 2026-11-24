<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%> 
    <%@ include file="../includes/sessionCheck.jsp" %>
    <%//@ page errorPage="../common/errorPage.jsp"%>
    <%@ include file="../includes/empHeader.jsp" %>
    <%@ page import="java.util.Hashtable, java.util.ArrayList" %>
    <%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
    <%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
	<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
	<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 
	<jsp:useBean id="domainObjectsWebController" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" scope="session"/>


    <html>
    <head>
	<meta http-equiv="Cache-control" content="no-cache">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>OCA Report</title>

    <link href="../style/compliance.css" rel="stylesheet" type="text/css" />
	<link href="../style/calendarControl.css"rel="stylesheet">
	<script src="../jscripts/calendarControl.js"language="javascript"></script>
<!-- <script Language="JavaScript" src="../jscripts/approveDaily.js"></script> -->
	<script Language="JavaScript" src="../jscripts/common.js"></script>
     <script Language="JavaScript" src="../jscripts/report.js"></script>

    </title>
    </head>


    <form name="frmMainFunciton" method = "post" action = "">


<%
	
	//int frequency = 2;
	int dayOfWeek = 0;
	int frequency = Integer.parseInt(session.getAttribute("frequency")+"");
	String date1 = (String)request.getParameter("date1");
	String date5 = (String)request.getParameter("date5");
	
        int yesCount  = 0;
    int noCount   = 0;
    int naCount   = 0;
    int ntaCount  = 0; 
    String colour = "";
    double  noPercent = 0.0;
	//String company ="";
	//String department ="";
	String selected="";
	//String company1="";
	
	//ArrayList companyList = policyController.getCompanyNames();
	//ArrayList departmentList = policyController.getDepartmentNames();
	//ntln(companyList.size());
	
	//int frequency = Integer.parseInt(freq);
	//out.println("frequency"+frequency);

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

		GregorianCalendar thisDay = new GregorianCalendar( );

		String date = (String)request.getParameter("date");
        String startDate = (String)request.getParameter("startDate");
        String endDate = (String)request.getParameter("endDate");
		//out.println("date==="+date);
		String fromDate1 = (String)request.getParameter("fromDate1");
		//String previousMonth = (String)request.getParameter("previousMonth");
		String previousMonth1 = (String)request.getParameter("previousMonth1");
		String selectedDate = (String)request.getParameter("selectedDate");
		String subMonth = (String)request.getParameter("subMonth");
		String monthDashboard = (String)request.getParameter("month");
		String createdDatedashboard = (String)request.getParameter("createdDatedashboard");
		String previousMonth3 = (String)request.getParameter("previousMonth3");
		//out.println("subMonth==="+subMonth);
		String roleId = (String)session.getAttribute("roleId");
		String comCode1 = (String)request.getParameter("comCode");
        String compCode = (String)request.getParameter("compCode");
		String createdDate = (String)request.getParameter("createdDate");
		String dt = date;
		String newDate = date;
        String process = "";

%>
		<input type = "hidden" name = "newDate" value = "<%=newDate%>">	
		
<%
		if (frequency==2) {
			if(date == null || date.equals("")) {
				date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
				if(date.length() == 1) {
					date = "0" + date;
				}
				date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
				//out.println("date444"+date);
			} 
			if (dt == null){
				//out.println(date);
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(formatter.parse(fromDate1)); 
				calendar.add(Calendar.DATE, 6);  
				dt = formatter.format(calendar.getTime());
				} else {
				//out.println(dt);
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				Calendar calendar = Calendar.getInstance();
				//calendar.setTime(formatter.parse(dt)); 
				calendar.setTime(formatter.parse(fromDate1)); 
				calendar.add(Calendar.DATE, 6);  
				dt = formatter.format(calendar.getTime());
				//out.println("dt---"+dt);
			}

		}else if (frequency==3){
		if(date == null || date.equals("")){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
		if(date.length() == 1){
			date = "0" + date;
		}
		date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	
		//date ="30-MAR-2011";
	}if (dt == null){
							//out.println(date);
							SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
							Calendar calendar = Calendar.getInstance();
							calendar.setTime(formatter.parse(date)); 
							calendar.add(Calendar.DATE, 13);  
							dt = formatter.format(calendar.getTime());
							
							//dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
							//out.println(dayOfWeek);
						 }
		else {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(formatter.parse(dt)); 
		calendar.add(Calendar.DATE, 14);  
		dt = formatter.format(calendar.getTime());
		//dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		//out.println(dayOfWeek);
		 }
		}else if (frequency==4){
		if(date == null || date.equals("")){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
		if(date.length() == 1){
			date = "0" + date;
		}
		date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	
		//date ="30-MAR-2011";
	}if (dt == null){
							//out.println(date);
							SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
							Calendar calendar = Calendar.getInstance();
							calendar.setTime(formatter.parse(date)); 
							calendar.add(Calendar.DATE, 30);  
							dt = formatter.format(calendar.getTime());
							//out.println("dt----"+dt);
						
						 }
	else {
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(formatter.parse(dt)); 
		calendar.add(Calendar.DATE, 30);  
		dt = formatter.format(calendar.getTime());
		//out.println("dt1----"+dt);
	 }
		}else if (frequency==5){
		if(date == null || date.equals("")){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
		if(date.length() == 1){
			date = "0" + date;
		}
		date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	
		//date ="30-MAR-2011";
	}if (dt == null){
							//out.println(date);
							SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
							Calendar calendar = Calendar.getInstance();
							calendar.setTime(formatter.parse(date)); 
							calendar.add(Calendar.DATE, 90);  
							dt = formatter.format(calendar.getTime());
							
							//dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
							//out.println(dayOfWeek);
						 }
	else {
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(formatter.parse(dt)); 
		calendar.add(Calendar.DATE, 90);  
		dt = formatter.format(calendar.getTime());
		//dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		//out.println(dayOfWeek);
		 }
		}else if (frequency==6){
		if(date == null || date.equals("")){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
		if(date.length() == 1){
			date = "0" + date;
		}
		date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	
		//date ="30-MAR-2011";
	}if (dt == null){
							//out.println(date);
							SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
							Calendar calendar = Calendar.getInstance();
							calendar.setTime(formatter.parse(date)); 
							calendar.add(Calendar.DATE, 180);  
							dt = formatter.format(calendar.getTime());
							
							//dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
							//out.println(dayOfWeek);
						 }
	else {
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(formatter.parse(dt)); 
		calendar.add(Calendar.DATE, 180);  
		dt = formatter.format(calendar.getTime());
		//dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		//out.println(dayOfWeek);
		 }
		}else if (frequency==7){
		if(date == null || date.equals("")){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
		if(date.length() == 1){
			date = "0" + date;
		}
		date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	
		//date ="30-MAR-2011";
	}if (dt == null){
							//out.println(date);
							SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
							Calendar calendar = Calendar.getInstance();
							calendar.setTime(formatter.parse(date)); 
							calendar.add(Calendar.DATE, 365);  
							dt = formatter.format(calendar.getTime());
							
							//dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
							//out.println(dayOfWeek);
						 }
	else {
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(formatter.parse(dt)); 
		calendar.add(Calendar.DATE, 365);  
		dt = formatter.format(calendar.getTime());
		//dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		//out.println(dayOfWeek);
		 }
		}else {
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(formatter.parse(dt)); 
		calendar.add(Calendar.DATE, 365);  
		dt = formatter.format(calendar.getTime());
		//dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		//out.println(dayOfWeek);
		 }
	String fromDate = date;
	//out.println("fromdate"+fromDate);
    String toDate = dt;
	//out.println(toDate);
	
%>
  
	<%@ include file="../includes/headerMenu.jsp" %>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
       
 	<%@ include file="../includes/dashBoardInnerTabs.jsp" %>

      <tr>
        <td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
      </tr>

      <%
        //includes the control tabs for reviewer
        session.setAttribute("currLink","CONTROLS");
        session.setAttribute("leftLinkA","1");
    %>
        

    </table>
	
    <%
		if (frequency==1){
        //includes the frequency tabs for reviewer
        session.setAttribute("currLink","DAILY");
        session.setAttribute("leftLink","0");
        session.setAttribute("leftLinkA","1");
	}else if (frequency==2){
        //includes the frequency tabs for reviewer
        session.setAttribute("currLink","WEEKLY");
        session.setAttribute("leftLink","1");
        session.setAttribute("leftLinkA","1");

          System.out.println("testing=1");
	}else if (frequency==3){
        //includes the frequency tabs for reviewer
        session.setAttribute("currLink","FORTNIGHTLY");
        session.setAttribute("leftLink","2");
        session.setAttribute("leftLinkA","1");
	}else if (frequency==4){
        //includes the frequency tabs for reviewer
        session.setAttribute("currLink","MONTHLY");
        session.setAttribute("leftLink","3");
        session.setAttribute("leftLinkA","1");
	}else if (frequency==5){
        //includes the frequency tabs for reviewer
        session.setAttribute("currLink","QUARTELY");
        session.setAttribute("leftLink","4");
        session.setAttribute("leftLinkA","1");
	}else if (frequency==6){
        //includes the frequency tabs for reviewer
        session.setAttribute("currLink","HALFYEARLY");
        session.setAttribute("leftLink","5");
        session.setAttribute("leftLinkA","1");
	}else if (frequency==7){
        //includes the frequency tabs for reviewer
        session.setAttribute("currLink","YEARLY");
        session.setAttribute("leftLink","6");
        session.setAttribute("leftLinkA","1");
	}
    %>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="10%" class="style4" height = "30" align = "left">Select Date :</td>
		<td><input type="text" class="style2" id="date" name="date" onfocus="showCalendarControl(this);" readOnly value="<%=date%>">&nbsp;&nbsp;
        <img src="../images/orangearrow.gif" border="0" onclick="reportChange(<%=frequency%>)"></td>
		<td width="70%" align="right"><%@ include file="../includes/dashBoardTabs.jsp" %>
		</tr> 
</table>

	
    <%@ include file="../includes/reportFrequencyTabs.jsp" %>

    <br />
    <table width="100%" align="left" cellpadding="1" cellspacing="1">

       <tr>
      <td height="27"  class="style3">
      
      

		<%		//out.println(date);
				if (toDate==null){
		%>
			 <table width="100%" align="center" cellpadding="0" cellspacing="0">
				  <col width="151" />
				  <col width="196" />
					<tr>
						<td height="27" colspan="8" bgcolor="#E0E78F"  class="nameHEAD">OCA - Self Assessment Status For  <%=fromDate%> - <%=toDate%> </td>
					</tr>
					<tr>
						<td class="style3Underline">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
			</table>
	<%
		}else if(toDate!=null){
	%>

    

    <%	
        //System.out.println("frequency-----"+frequency);
		if (frequency==1) {
	%>
			 <table width="100%" align="center" cellpadding="0" cellspacing="0">
				  <col width="151" />
				  <col width="196" />
					<tr>
						<td height="27" colspan="8" bgcolor="#E0E78F"  class="nameHEAD"> OCA - Self Assessment Status For The day <%=fromDate1%> - <%=fromDate1%> (Report For The Last Closed Week For The Selected Date) </td>
					</tr>
			</table>
	<%
		}
	%>
	<%	
		if (frequency==2) {
	%>
			 <table width="100%" align="center" cellpadding="0" cellspacing="0">
				  <col width="151" />
				  <col width="196" />
					<tr>
						<td height="27" colspan="8" bgcolor="#E0E78F"  class="nameHEAD"> OCA - Self Assessment Status For The Week <%=fromDate1%> - <%=toDate%> (Report For The Last Closed Week For The Selected Date) </td>
					</tr>
			</table>
	<%
		}
	%>
	<%
				if (frequency==3){

	%>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                       <tr>
                            <td height="27" colspan="8" bgcolor="#E0E78F"  class="nameHEAD"> OCA - Self Assessment Status For The Fortnight <%=startDate%> - <%=endDate%> (Report For The Last Closed Fortnight For The Selected Date)</td>
                        </tr>
                        
                </table>
			 
	<%
			}	if (frequency==4){
	%>
                 <table width="100%" align="center" cellpadding="0" cellspacing="0">
                    
                        <tr>
                            <td height="27" colspan="8" bgcolor="#E0E78F"  class="nameHEAD">OCA - Self Assessment Status For The month <%=startDate%> - <%=endDate%> (Report For The Last Closed Month For The Selected Date)</td>
                        </tr>
                        
                </table>
	<%
			   }	
		if (frequency==5){
	%>
			 <table width="100%" align="center" cellpadding="0" cellspacing="0">
				  	<tr>
						<td height="27" colspan="8" bgcolor="#E0E78F"  class="nameHEAD">OCA - Self Assessment Status For The Quarter  <%=startDate%> - <%=endDate%> (Report For The Last Closed Quarter For The Selected Date)</td>
					</tr>
					
			</table>
<%
            }
			if (frequency==6){
    
%>              <table width="100%" align="center" cellpadding="0" cellspacing="0">
				    <tr>
						<td height="27" colspan="8" bgcolor="#E0E78F"  class="nameHEAD">OCA - Self Assessment Status For The Half - Year <%=startDate%> - <%=endDate%> (Report For The Last Closed Half - Year For The Selected Date)</td>
					</tr>
					
			</table>
<%
				}
	
				if (frequency==7){
	%>
			 <table width="100%" align="center" cellpadding="0" cellspacing="0">
				  <col width="151" />
				  <col width="196" />
					<tr>
						<td height="27" colspan="8" bgcolor="#E0E78F"  class="nameHEAD">OCA - Self Assessment Status For The Year <%=startDate%> - <%=endDate%> (Report For The Last Closed Year For The Selected Date)</td>
					</tr>
					
			</table>
	<%
		}}
	%>
<table  width="100%" align="left" cellpadding="2" cellspacing="1">
 <%

        String function     = "";
        String policyHead     = "";
        String subProcess     = "";
        String bgColor        = "";
        int colorCnt = 0;
       
        ArrayList  reportArray = (ArrayList) session.getAttribute("reportArray");
		//out.println(reportArray.size());
		System.out.println("tttt"+reportArray.size());
		if (reportArray.size()== 0)
		{
%>			
            <%
					if (frequency==1){
			%>
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td colspan="50%" align = "center" class="style4" style="border-bottom:1px solid #EFEFEF">No data available for selected day...
			</tr> 
		</table>
			<%
					}			
			%>
            <%
					if (frequency==2){
			%>
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td colspan="50%" align = "center" class="style4" style="border-bottom:1px solid #EFEFEF">No data available for selected Week...
			</tr> 
		</table>
			<%
					}			
			%>
			<%
					if (frequency==3){
			%>
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td colspan="50%" align = "center" class="style4" style="border-bottom:1px solid #EFEFEF">No data available for selected FortNight...
			</tr> 
		</table>
			<%
					}			
			%>
			<%
					if (frequency==4){
			%>
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td colspan="50%" align = "center" class="style4" style="border-bottom:1px solid #EFEFEF">No data available for selected Month...
			</tr> 
		</table>
			<%
					}			
			%>
			<%
					if (frequency==5){
			%>
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td colspan="50%" align = "center" class="style4" style="border-bottom:1px solid #EFEFEF">No data available for selected Quarter...
			</tr> 
		</table>
			<%
					}			
			%>
			<%
					if (frequency==6){
			%>
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td colspan="50%" align = "center" class="style4" style="border-bottom:1px solid #EFEFEF">No data available for selected Half-Year...
			</tr> 
		</table>
			<%
					}			
			%>
			<%
					if (frequency==7){
			%>
			<table width="100%" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td colspan="50%" align = "center" class="style4" style="border-bottom:1px solid #EFEFEF">No data available for selected Year...
			</tr> 
		</table>
			<%
					}			
			%>
<%
		}else{

        //out.println("reportArray.size()"+reportArray.size());
        int count = 0;
        
        String fr[] = new String[50]; 
        String cr[] = new String[50]; 
        String bk[] = new String[50]; 

        for ( int i =0; i< reportArray.size(); i++) {
            
            			   
           String tmpArr[] = (String []) reportArray.get(i);
             
           if ((!function.equals(tmpArr[0]) && tmpArr[0] != "")) {

                    noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
                    //System.out.println("*******"+noPercent);  
                    fr[count]=function;
                    cr[count]=Double.toString(noPercent);
                    yesCount  = 0;
                    noCount   = 0;
                    naCount   = 0;
                    ntaCount  = 0; 
                    colour = "";
                    noPercent = 0.0;
                    if (colorCnt%2==0)
			        bgColor="#F5F8E0";
                    else
					bgColor = "#FBFCEF";
					 
					colorCnt++;
                    count = count+1;
                    bk[count]=bgColor; 
                    function = tmpArr[0];

                    if (tmpArr[5].equals("Yes")) {
                
                yesCount = yesCount + 1;
            
                } else if (tmpArr[5].equals("No")) {

                    noCount = noCount + 1;
                                
                } else if (tmpArr[5].equals("Not Acted")) {
                    
                    ntaCount = ntaCount +1;
                    
                } else {

                    naCount = naCount + 1;
                    
                }
 
               //subProcess = tmpArr[2];
               //System.out.println("---"+count);
           }
           else{
                if (tmpArr[5].equals("Yes")) {
                
                yesCount = yesCount + 1;
            
                } else if (tmpArr[5].equals("No")) {

                    noCount = noCount + 1;
                                
                } else if (tmpArr[5].equals("Not Acted")) {
                    
                    ntaCount = ntaCount +1;
                    
                } else {

                    naCount = naCount + 1;
                    
                }
               }
        }
        
        noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
        //System.out.println("*******"+noPercent); 
        fr[count]=function;
        cr[count]=Double.toString(noPercent);
        bk[count]=bgColor;  
        //System.out.println("*******"+count); 
        //System.out.println("*******cr[1]"+cr[1]); 
        //System.out.println("*******cr[2]"+cr[2]); 
        
        for ( int i =1; i<count+1; i++) {
            
            //System.out.println("*******fr[1]"+i+"---"+fr[i]);
            if (Double.parseDouble(cr[i]) > 60) {

                colour = "red";

            } else if (Double.parseDouble(cr[i]) < 40) {
            
                colour = "green";

            } else {

                colour = "yellow";
            
            }
               
%>
           
         <tr bgcolor= "<%=bk[i]%>">               

         <!-- <td width="3%" class="style3Underline" > <a href="#" onClick="subProcess('<%=function%>')"  class="style3Underline"><%=function%></a></td> -->
              <td width="3%" class="style3Underline" > <a href="javascript:process('<%=fr[i]%>')" class="style3Underline"><%=fr[i]%></a></td>

	        
<%            
            if (colour.equals("green")) {

%>       
         
             <td width="10%"><img src="../images/green.png" width="50" height="25"   /></td>
             </tr>
<%
                } else if (colour.equals("yellow")) {

%>

            <td width="10%"><img src="../images/yellow.png" width="50" height="25" /></td>
             </tr>

<%                
                } else if (colour.equals("red")) {

%>
                <td width="10%"><img src="../images/red.png" width="50" height="25"  /></td>
             </tr>

<%
                } 
        }
        }
 %>
<input type = "hidden" value = "<%=frequency%>" name = "frequency">
<input type = "hidden" value = "<%=compCode%>" name = "compCode">
<input type = "hidden" value = "<%=createdDate%>" name = "createdDate">

            
</form>
    </table>
</body>
</html>