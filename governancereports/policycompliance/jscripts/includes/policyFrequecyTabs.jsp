<%
	String option[]		= new String[7];
	String aLink[]		= new String[7];


		option[0] = "DAILY";
		option[1] = "WEEKLY";
		option[2] = "FORTNIGHTLY";
		option[3] = "MONTHLY";
		option[4] = "QUARTERLY";
		option[5] = "HALF YEARLY";
		option[6] = "ANNUALLY";

		aLink[0] = "../requestor/daily.jsp";
		aLink[1] = "../requestor/weekly.jsp";
		aLink[2] = "../requestor/fortNightly.jsp";
        aLink[3] = "../requestor/monthly.jsp";  
		aLink[4] = "../requestor/quarterly.jsp";
		aLink[5] = "../requestor/halfYearly.jsp";
		aLink[6] = "../requestor/annually.jsp";
	

	/* if (session.getAttribute("roleId").equals("1")) {

		option[0] = "DAILY";
		option[1] = "WEEKLY";
		option[2] = "MONTHLY";
		option[3] = "HALF YEARLY";
		option[4] = "ANNUALLY";

		aLink[0] = "../requestor/daily.jsp";
		aLink[1] = "../requestor/weekly.jsp";
		aLink[2] = "../requestor/monthly.jsp";
		aLink[3] = "../requestor/halfYearly.jsp";
		aLink[4] = "../requestor/annually.jsp";

	} 
	 else if (session.getAttribute("roleId").equals("2")) {

		option[0] = "DAILY";
		option[1] = "WEEKLY";
		option[2] = "MONTHLY";
		option[3] = "HALF YEARLY";
		option[4] = "ANNUALLY";

		aLink[0] = "../approver/approveDaily.jsp";
		aLink[1] = "../approver/approveWeekly.jsp";
		aLink[2] = "../approver/approveMonthly.jsp";
		aLink[3] = "../approver/approveHalfYearly.jsp";
		aLink[4] = "../approver/approveAnnually.jsp";

	} else {
		response.sendRedirect("/timescape/login/logout.jsp");
		return;
	} */ 
	String litecolor2 			= "#000000";
	String darkcolor2			= "#999999";

	String leftLink = (String) session.getAttribute("leftLink");
	String cellColor[ ] = new String[option.length];
	String style[] = new String[option.length];
%>
<table width="100%" border="0" cellspacing="1" cellpadding="0" align = "center">
		<!-- <tr>
			<td class = "normal" colspan="100%"><img src="../images/spacer.gif" height="2"></td>
		</tr> -->

		<tr>
		<%
			int j;
			for(j = 0; j < option.length; j++)
			{
				//System.out.println("lenght" + option.length);

				String s = j +"";
			   // System.out.println(s);
				//System.out.println("sasa " + leftLink);

				
				if(leftLink.equals(s))
				{
					cellColor[j] = litecolor2;
					style[j] = "style1";
				}
				else
				{
					cellColor[j] = darkcolor2;
					style[j] = "style1";
				}
		%>
			<td align = "center" bgColor = "<%=cellColor[j]%>" class = "small" height="30" width = "150px">
				&nbsp;<a href="<%=aLink[j]%>" class="<%=style[j]%>"><%=option[j]%></a>
			</td>
			<!-- <td align = "left" bgColor = "#FFFFFF" class = "normal" height="20"><img src="../images/spacer.gif" height="2"></td> -->
		<%
			}
		%>
	</tr>
</table>