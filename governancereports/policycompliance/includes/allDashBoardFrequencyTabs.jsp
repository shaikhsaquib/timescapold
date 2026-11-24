<%
	String option[]		= new String[7];
	String aLink[]		= new String[7];
	String selComp = (String) session.getAttribute("selectedCompany");
	String selMod = (String) session.getAttribute("selectedModule");

		option[0] = "DAILY";
		option[1] = "WEEKLY";
		option[2] = "FORTNIGHTLY";
		option[3] = "MONTHLY";
		option[4] = "QUARTERLY";
		option[5] = "HALF YEARLY";
		option[6] = "ANNUALLY";

		aLink[0] = "../reports/dashBoardDaily.jsp?selectedCompany="+selComp+"&selectedModule="+selMod;
		aLink[1] = "../reports/dashBoardWeekly.jsp?selectedCompany="+selComp+"&selectedModule="+selMod;
		aLink[2] = "../reports/dashBoardFortNightly.jsp?selectedCompany="+selComp+"&selectedModule="+selMod;
        aLink[3] = "../reports/dashBoardMonthly.jsp?selectedCompany="+selComp+"&selectedModule="+selMod; 
		aLink[4] = "../reports/dashBoardQuarterly.jsp?selectedCompany="+selComp+"&selectedModule="+selMod;
		aLink[5] = "../reports/dashBoardHalfYearly.jsp?selectedCompany="+selComp+"&selectedModule="+selMod;
		aLink[6] = "../reports/dashBoardAnnually.jsp?selectedCompany="+selComp+"&selectedModule="+selMod;
	

	/* if (session.getAttribute("roleId").equals("1")) {

		option[0] = "DAILY";
		option[1] = "WEEKLY";
		option[2] = "MONTHLY";
		option[3] = "HALF YEARLY";
		option[4] = "ANNUALLY";

		aLink[0] = "../reviewer/daily.jsp";
		aLink[1] = "../reviewer/weekly.jsp";
		aLink[2] = "../reviewer/monthly.jsp";
		aLink[3] = "../reviewer/halfYearly.jsp";
		aLink[4] = "../reviewer/annually.jsp";

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

	String leftLinkTab = (String) session.getAttribute("leftLink");
	String cellColorTab[ ] = new String[option.length];
	String styleTab[] = new String[option.length];
%>
<table width="100%" border="0" cellspacing="1px" cellpadding="0" align = "center">
		<!-- <tr>
			<td class = "normal" colspan="100%"><img src="../images/spacer.gif" height="2"></td>
		</tr> -->

		<tr>
		<%
			int j;
			for(j = 0; j < 7; j++)
			{
				System.out.println("leftLinkTab" + leftLinkTab);

				String s = j +"";
			    System.out.println(s);
				System.out.println("sasa " + leftLinkTab);

				
				if(leftLinkTab.equals(s))
				{
					cellColorTab[j] = litecolor2;
					styleTab[j] = "style1";
				}
				else
				{
					cellColorTab[j] = darkcolor2;
					styleTab[j] = "style1";
				}
		%>
			<td align = "center" bgColor = "<%=cellColorTab[j]%>" class = "small" height="15px" width = "150px">
				&nbsp;<a href="<%=aLink[j]%>" class="<%=styleTab[j]%>"><%=option[j]%></a>
			</td>
			<!-- <td align = "left" bgColor = "#FFFFFF" class = "normal" height="20"><img src="../images/spacer.gif" height="2"></td> -->
		<%
			}
		%>
	</tr>
</table>