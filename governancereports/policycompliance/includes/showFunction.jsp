    <%@ page language="java" %>
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
    <title>OCA Report</title>

    <link href="../style/compliance.css" rel="stylesheet" type="text/css" />
	<link href="../style/calendarControl.css"rel="stylesheet">
	<script src="../jscripts/calendarControl.js"language="javascript"></script>
<!-- <script Language="JavaScript" src="../jscripts/approveDaily.js"></script> -->
	<script Language="JavaScript" src="../jscripts/common.js"></script>
     <script Language="JavaScript" src="../jscripts/report.js"></script>

    </title>
    </head>

<body onLoad="showDepartmentsDashboard();">
    <form name="frmMainFunciton" method = "post" action = "">


<%
	
	//int frequency = 2;
	int dayOfWeek = 0;
	int frequency = Integer.parseInt(session.getAttribute("frequency")+"");
	String date1 = (String)request.getParameter("date1");
	String date5 = (String)request.getParameter("date5");

	String selected="";
	String company2="";
	
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
		String dt = date;
		String newDate = date;

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
       
  <%
    
    if(roleId.equals("4")) {

  %>
   <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../requestor/daily.jsp" class="style2">MY COMPLIANCE</a> |<a href="../approver/approveDaily.jsp" class="style2"> ENSURE COMPLIANCE</a> | REPORT |  </div>
		</td>
  </tr>

  <%
    } else{
%>
    <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../requestor/daily.jsp" class="style2">MY COMPLIANCE</a>| REPORT |  </div>
		</td>
  </tr>

  <%
  }
  %>
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
	
	<table width="100%" border="0" cellpadding="1" cellspacing="1">
		<tr>
		<td width="30%" class="style4" style="border-bottom:1px solid #EFEFEF">Select Date : &nbsp;&nbsp;
		<input type="text" class="style2" id="date" name="date" onfocus="showCalendarControl(this);" readOnly value="<%=date%>">&nbsp;&nbsp;<img src="../images/orangearrow.gif" border="0" onclick="reportChange(<%=frequency%>)">
        <td width="70%" align="right"><%@ include file="../includes/dashBoardTabs.jsp" %>
		</table>
	
    <%@ include file="../includes/reportFrequencyTabs.jsp" %>

    <br />
    <table width="100%" align="left" cellpadding="1" cellspacing="1">

       <tr>
      <td height="27"  class="style3">
      
      <table width="100%" align="center" cellpadding="1" cellspacing="1">
        <tr colspan = "10">
              <td align="left" valign="bottom" class="name" ><img src="../images/legend.jpg"   /> 
              <td>&nbsp;</td>
        </tr> 
      </table>

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
        String bgColor        = "";
        int colorCnt = 0;
       
        ArrayList  reportArray = (ArrayList) session.getAttribute("reportArray");
		//out.println(reportArray.size());
		//out.println("tttt"+reportArray.size());
		if (reportArray.size()== 1)
		{
%>			<%
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

        for ( int i =1; i< reportArray.size(); i++) {
			   
           String tmpArr[] = (String []) reportArray.get(i);

           if (!function.equals(tmpArr[0]) && tmpArr[0] != "") {

                  if (colorCnt%2==0)
			        bgColor="#F5F8E0";
                    else
					bgColor = "#FBFCEF";
					  
					colorCnt++;

               function = tmpArr[0];
%>
         <tr bgcolor= "<%=bgColor%>">               

         <td width="3%" class="style3Underline" > <a href="javascript:subProcess('<%=function%>')" class="style3Underline"><%=function%></a></td>

	        
<%            
            if (tmpArr[1].equals("green")) {

%>       
         
             <td width="10%"><img src="../images/green.png" width="50" height="25"   /></td>
             </tr>
<%
                } else if (tmpArr[1].equals("yellow")) {

%>

            <td width="10%"><img src="../images/yellow.png" width="50" height="25" /></td>
             </tr>

<%                
                } else if (tmpArr[1].equals("red")) {

%>
                <td width="10%"><img src="../images/red.png" width="50" height="25"  /></td>
             </tr>

<%
                }
%>

<%
           }
        } 
		}	
 %>

            
</form>
    </table>