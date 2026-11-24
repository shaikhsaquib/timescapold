<%@ page import="java.util.TimeZone, java.util.Date, java.util.Calendar"%>
<%
	String errMsg = "The age of Nominee exceeds the eligibility criteria";
	
	int day = Integer.parseInt(request.getParameter("day"));
	int month = Integer.parseInt(request.getParameter("month"));
	int year = Integer.parseInt(request.getParameter("year"));

	Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());

	Date currentTime = localCalendar.getTime();

	int currentDay = localCalendar.get(Calendar.DATE);
    int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
    int currentYear = localCalendar.get(Calendar.YEAR);

	if(currentYear - year == 85)
	{
		if(currentMonth>month)
		{
			out.println(errMsg);
		}
		else if(currentMonth==month)
		{
			if(currentDay>=day)
			{
				out.println(errMsg);
			}
			else
			{
				out.println("OK");
			}
		}
		else
		{
			out.println("OK");
		}
	}
	else if(currentYear - year > 85)
	{
		out.println(errMsg);
	}
	else
	{
		out.println("OK");
	}
%>