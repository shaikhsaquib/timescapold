<%
	String day = (String)fireClaimDetailHash.get("weekDay-");
%>
<select name = "weekDay" class="style3" >
<%
	if(day.equals("Monday")){
%>
	<option value = "Monday" selected>Monday</option>
<%
	}
	else{
%>
	<option value = "Monday" >Monday</option>
<%
	}
	if(day.equals("Tuesday")){
%>
	<option value = "Tuesday" selected>Tuesday</option>
<%
	}
	else{
%>
	<option value = "Tuesday" >Tuesday</option>
<%
	}
	if(day.equals("Wednesday")){
%>
	<option value = "Wednesday" selected>Wednesday</option>
<%
	}
	else{
%>
	<option value = "Wednesday" >Wednesday</option>
<%
	}
	if(day.equals("Thusday")){
%>
	<option value = "Thusday" selected>Thusday</option>
<%
	}
	else{
%>
	<option value = "Thusday" >Thusday</option>
<%
	}
	if(day.equals("Friday")){
%>
	<option value = "Friday" selected>Friday</option>
<%
	}
	else{
%>
	<option value = "Friday" >Friday</option>
<%
	}
	if(day.equals("Saturday")){
%>
	<option value = "Saturday" selected>Saturday</option>
<%
	}
	else{
%>
	<option value = "Saturday" >Saturday</option>
<%
	}
	if(day.equals("Sunday")){
%>
	<option value = "Sunday" selected>Sunday</option>
<%
	}
	else{
%>
	<option value = "Sunday" >Sunday</option>
<%
	}
%>
</select>
