<%!
	String [] months = {"0", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
	GregorianCalendar today = new GregorianCalendar();
	ArrayList myClaimRequest = new ArrayList();
	String option = "";
	int currMonth = 0;
	int lastYear = 0;
	int currYear = 0;
	int selYear = 0;
	String monYear = "";
	String monthStr = "";
	String reqStatus = "All";

	Hashtable claimRequestHash = new Hashtable( );
%>
<%
	option  = (String) request.getParameter("option");

	Object objArr[] = new Object[4];
	objArr[0] = "'DD-MON-YYYY'"; 
	objArr[1] = "'MON-YYYY'";
	objArr[2] = "'S'";

	if(option == null){
		// Fetching the claim requests for the current month
		currYear = today.get(Calendar.YEAR)+1;
		selYear = currYear-1;
		lastYear = currYear - 2;
		currMonth = today.get(Calendar.MONTH)+1 ;
		monthStr = currMonth + "";
		monYear = months[currMonth]+"-"+selYear;
		monYear = monYear.toUpperCase( );
		objArr[3] = "'" + monYear + "'" ;
	}else{
		// Fetching the claim requests for the selected period
		String fromYear = (String) request.getParameter("year");
		String fromMonth = (String) request.getParameter("month");

		// This section is used to display the selected month and year in the dropdown
		currYear = today.get(Calendar.YEAR)+1;
		lastYear = currYear - 2;
		selYear = Integer.parseInt(fromYear);
		currMonth = Integer.parseInt(fromMonth);
		monthStr = currMonth + "";
		monYear = months[currMonth]+"-"+selYear;
		monYear = monYear.toUpperCase( );
		objArr[3] = "'" + monYear + "'" ;
	}
	
	claimRequestHash.put("queryId", "1003");
	claimRequestHash.put("arguments", objArr);

	myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);
%>
<input type="hidden" name="option">

<table width="100%" border="0" cellspacing="1" cellpadding="2" >
	<tr>
		
		<td align="right" class="normal">
		Year <select id="year" name="year" class="normal">
				<%= HtmlUtil.getYearList(lastYear,currYear, selYear,"desc") %>
			</select>
			Month<select id="month" name="month" class="normal">
				<%= HtmlUtil.getMonthList(monthStr) %>
			</select>
			&nbsp;<a href="javascript:go( )"><img src="../images/greyarrow.gif" border="0" align="absmiddle"></a>
		</td>

	</tr>
</table>

<table width="98%"  align="center" cellpadding="0" cellspacing="2">
	<tr height="20">
		<td height="20" bgcolor="#EFEFEF" class="style5" align="left" width="10%">Request No</td>
	    <td bgcolor = "#EFEFEF" class="style5" align="left" width="10%">Item Name</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="12%">Date of Loss</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="14%">Cause of Damage</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="8%">Estimated Loss</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="7%">Status</td>
	</tr>
<%
	
	if(myClaimRequest!=null && myClaimRequest.size()>0)
	{
		for (int i = 0; i < myClaimRequest.size(); i++)
		{
			String myClaimRequestDetail[] = (String[]) myClaimRequest.get(i);

			Hashtable userClaimDetailHash = xmlObj.readSubNode(myClaimRequestDetail[3], "userClaimDetails");

			String idDisplay = myClaimRequestDetail[9].substring(myClaimRequestDetail[9].lastIndexOf("-")+1)+myClaimRequestDetail[9].substring(myClaimRequestDetail[9].indexOf("-")+1,myClaimRequestDetail[9].lastIndexOf("-"))+myClaimRequestDetail[9].substring(0,myClaimRequestDetail[9].indexOf("-")); 

%>
				<tr height="20">

					<td class = "style3Underline" width = "20%" height = "20" align = "left">
					<a href="javascript:void window.open('../common/checkRequestDetails.jsp?requestno=<%=myClaimRequestDetail[0]%>','','resizable=yes,toolbars=no,scrollbars=yes,width=1024,height=768,top=100,left=50')" 			
					class="style3Underline"><%=idDisplay.toLowerCase()%><%=myClaimRequestDetail[0]%></a>
					</td>
					<td class = "style3" height = "20" align = "left"><%=(String)userClaimDetailHash.get("claimItemName-")%>
					<td class = "style3" height = "20" align = "left"><%=(String)userClaimDetailHash.get("damageDate-")%></a></td>
					<td class = "style3" height = "20" align = "left"><%=(String)userClaimDetailHash.get("damageCause-")%></td>
					<td class = "style3" height = "20" align = "left"><%=(String)userClaimDetailHash.get("damageAmount-")%></td>
					<td class = "style3" height = "20" align = "left"><img src="../images/<%=(String)requestStatus.get(myClaimRequestDetail[12])%>" width="20" height="20" /></td>
<%
		}
	}
%>
	<tr>
		<td bgcolor = "FFFFFF"><img src = "../images/spacer.gif" width = "1" height = "1"></td>
</table>



