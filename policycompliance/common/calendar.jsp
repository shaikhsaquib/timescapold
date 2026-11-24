<%@page import="java.util.Hashtable, java.util.Calendar, java.util.GregorianCalendar, java.util.Enumeration, java.util.Vector" %>
<%@page import="com.bccl.util.HtmlUtil"%>

<jsp:useBean id="calendarController" class="com.bccl.util.ViewCalendar" />
<jsp:useBean id="leaveController" class="com.bccl.leave.web.controllerbeans.LeaveController" />

<%
    //String companyCode 		= (String) profile.get("companyCode");
	//String payId 			= (String) profile.get("payId");
%>

<%
	String bgColor = "#FFFFFF";
	String hyperLink = "";
	String calendarObj[ ] = new String[42];
	int index = 0;
	String stylecolor = "normal";
	String bgcolor = "#FFFFFF";
	int currMonth = 0;
	int currYear	  = 0;
	String day = "";
	GregorianCalendar today = null;
%>



<%
	// Step 1. Check if the currMonth & currYear is available in the session
	String paramMonth = (String) request.getParameter("month");

	if(paramMonth == null){
		// Step 2. Make a Gregorian Calendar with the current date and populate the currMonth and currYear variables
		today = new GregorianCalendar( );
		currMonth = today.get(Calendar.MONTH);
		currYear = today.get(Calendar.YEAR);
	}else{
		// Step 3. Check if the currMonth & currYear is available in the URL
		currMonth = Integer.parseInt((String) request.getParameter("month"));

		String paramYear = (String) request.getParameter("year");

		if(paramYear == null){
			currYear = Integer.parseInt((String) session.getAttribute("currYear"));
		}else{
			currYear = Integer.parseInt(paramYear);
		}

		// Step 4. Check for the last month of a year (i.e. month  > 11) when next is clicked
		if(currMonth > 11){
			currMonth = 0;
			currYear++;
		}

		// Step 5. Check for the last month of a year (i.e. month  < 0) when next is clicked
		if(currMonth < 0){
			currMonth = 11;
			currYear--;
		}

		today = new GregorianCalendar(currYear, currMonth, 1);
	}

	session.setAttribute("currMonth",new String(currMonth+""));
	session.setAttribute("currYear",new String(currYear+""));
	String currDate = today.get(Calendar.DAY_OF_MONTH) + "";


	String dateLine = weekArr[thisDay.get(Calendar.DAY_OF_WEEK)]+", "+monthArr[thisDay.get(Calendar.MONTH)]+" "+ thisDay.get(Calendar.DAY_OF_MONTH)+", "+thisDay.get(Calendar.YEAR) ;


	calendarObj = calendarController.genCalendar(currMonth, currYear);

	String strMonth = (monthArr[currMonth].substring(0,3)).toUpperCase();

	//Determine whether to highlight day or not
	boolean showGray=true;
	if(strMonth.equalsIgnoreCase(parameterMonth))
	{	showGray=true;
	}
	else
	{	showGray=false;
	}
	
//	out.println("strMonth, Calendar.jsp: "+strMonth);
//	out.println("showGray, Calendar.jsp: "+showGray);
%>

<html>
    <head>
      <title>B2E</title>
      <link rel="stylesheet" href="../style/global.css">
    </head>
    <body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad = "window.focus()">
      <form name="frmCalendar" method="post">
        <table width = "100%" border = "0"  align="center" cellspacing="0" cellpadding="0">
<!-- Day of Week population -->
          <tr>
            <td class="normal" align-="center">
                <table width = "100%" border = "0"  align="center" cellspacing="0" cellpadding="0">
				<tr>
					<td class="white" colspan="14" align="left" bgcolor="#000000"  height="30">
						&nbsp;Today : <%=dateLine%>
					</td>
				</tr>

                 <tr>
					<td colspan="14" align="left"  class="normal">
						<table width = "100%" border = "0"  align="center" cellspacing="0" cellpadding="0">
							<tr>
								<td class="normal" align="center" width="20%" bgcolor="#CCCCCC">
										<!--
										<a href="javascript:prevMonth(<%=currMonth%>)" class="boldunderline">
											<img src = "images/prev.jpg" border = "0">prev
										</a>
										-->
								</td>

								<td class="normal" align="center" width="60%" bgcolor="#CCCCCC">
									<!--
									<strong>Select Year</strong>
										<select name="selectYear" class="normal" onChange="currentYear(<%=currMonth%>)">
								                  <%//= HtmlUtil.getYearList(1900,2050,today.get(Calendar.YEAR),"desc") %>
							             </select>
									-->
								</td>


								<td class="normal" align="center" width="20%" bgcolor="#CCCCCC">
									<!--
									<a href="javascript:nextMonth(<%=currMonth%>)" class="boldunderline">
										next<img src = "images/next.jpg" border = "0">
									</a>
									-->
								</td>

							</tr>
						</table>

					</td>
                  </tr>

				<tr>
					<td colspan="14" bgcolor="#000000" height="1"><img src = "../images/spacer.gif" width="1" height="1"></td>
				</tr>

				<tr>
					<td class="bold" colspan="14" align="left" bgcolor="#CCCCCC"  height="30">
						&nbsp;<%=monthArr[currMonth]%>, <%=currYear%>
					</td>
				</tr>

				<tr>
					<td colspan="14" bgcolor="#000000" height="1"><img src = "../images/spacer.gif" width="1" height="1"></td>
				</tr>

                  <tr>
<%
for(int ii=1; ii < weekArr.length; ii++){
  String weekDay = weekArr[ii];
%>

                      <td class="normal" align="center" height="20" bgcolor="#EFEFEO" width = "14%">
                        <strong><%=weekDay.substring(0,3)%></strong>
                      </td>
						<%
						if(ii == weekArr.length-1){
							bgColor = "#EFEFEO";
						} else {
							bgColor = "#FFFFFF";
						}
						%>
					<td bgcolor = "<%=bgColor%>">
						<img src = "../images/spacer.gif" height = "0" width = "2">
					</td>

<%
}
%>
                  </tr>



<%
int startIndex =  0;
int endIndex = 6;

int flag=0;

	String tempDate = date.substring(0,2).trim();
	tempDate = tempDate.trim();
	if(tempDate.startsWith("0")){
		tempDate = tempDate.substring(1,tempDate.length());
	}
	

for(int aa=0; aa < 6; aa++){


%>

          <tr>
<%


for(int ii=startIndex; ii <= endIndex; ii++){

	if(endIndex > calendarObj.length){
		break;
	}

	if(currDate.equals(calendarObj[ii]) && showGray){
		bgcolor="#CCCCCC";
		stylecolor= "white";
	}else{
		bgcolor = "#EFEFEO";
		stylecolor = "normal";
	}
	if(calendarObj[ii].equals("-")){
		calendarObj[ii] = " ";
	}


	if(calendarObj[ii].equals(tempDate) && showGray){
		bgcolor="#CCCCCC";
		stylecolor = "rednormal";
	} else {
		bgcolor = "#EFEFEO";
		stylecolor="normal";
	}
%>

                <td class="<%=stylecolor%>" align="center" bgcolor="<%=bgcolor%>" height="20">
					<%
						if(calendarObj[ii].length() == 1){
							day = "0"+calendarObj[ii];
						} else {
							day = calendarObj[ii];
						}
					
					%>
					<a href="javascript:sendWish('<%=day%>-<%=monthArr[currMonth].substring(0,3)%>')" class="boldunderline"><%=calendarObj[ii]%></a>
                </td>

				<%
				if(ii == endIndex){
					bgColor = "#EFEFEO";
				} else {
					bgColor = "#FFFFFF";
				}
				%>

				<td bgcolor = "<%=bgColor%>">
					<img src = "../images/spacer.gif" height = "0" width = "2">
				</td>
<%
  flag++;
}
%>
            </tr>
<%
    flag=0;
    startIndex=startIndex+7;
    endIndex = endIndex +7;
}
%>

                </table>
            </td>
          </tr>
<!-- Day of Week population ends-->
        </table>
      </form>
    </body>
</html>