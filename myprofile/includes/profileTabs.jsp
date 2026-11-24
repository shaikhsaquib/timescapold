<%
	String option[]		= new String[7];
	String aLink[]		= new String[7];

	if (session.getAttribute("profileRoleId").equals("1")) {

		option[0] = "nominations for comprehensive medical insurance";
        option[1] = "";
		option[2] = "";
		option[3] = ""; 
		option[4] = "";
		option[5] = "";
		option[6] = "";

		/*aLink[0] = "../profile/viewProfile.jsp";		
		aLink[1] = "../profile/viewQualifications.jsp";
		aLink[2] = "../profile/viewExperience.jsp";
		aLink[3] = "../profile/viewNomineeDetails.jsp";
		aLink[4] = "";
		aLink[5] = "";
		aLink[6] = "";*/

		aLink[0] = "../profile/viewNomineeDetails.jsp";
        aLink[1] = "";
		aLink[2] = "";
		aLink[3] = "";  
		aLink[4] = "";
		aLink[5] = "";
		aLink[6] = "";

	} else if (session.getAttribute("profileRoleId").equals("2")) {

		option[0] = "nominations for comprehensive medical insurance";
        option[1] = "search";
        option[2] = "medical insurance reports";
		option[3] = "Admin";
        option[4] = "";
		option[5] = "";
		option[6] = "";
		
		//option[5] = "";
		

		/*aLink[0] = "../profile/viewProfile.jsp";
		aLink[1] = "../profile/viewQualifications.jsp";
		aLink[2] = "../profile/viewExperience.jsp";
		aLink[3] = "../profile/viewNomineeDetails.jsp";
		aLink[4] = "../search/search.jsp";
		//aLink[5] = "";
		aLink[5] = "../reports/nominationReports.jsp";
		aLink[6] = "../profile/searchNomineeDetails.jsp";*/

		aLink[0] = "../profile/viewNomineeDetails.jsp";
        aLink[1] = "../search/search.jsp";
        aLink[2] = "../reports/nominationReports.jsp";
		aLink[3] = "../profile/searchNomineeDetails.jsp";
        aLink[4] = "";
		aLink[5] = "";
		aLink[6] = "";
		
		
		//aLink[5] = "";
		

	} else {
		response.sendRedirect("/timescape/login/logout.jsp");
		return;
	}

	String leftLink = (String) session.getAttribute("leftLink");
	String cellColor[ ] = new String[option.length];
	String style[] = new String[option.length];
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align = "center">
		<tr>
			<td class = "normal" colspan="100%"><img src="../images/spacer.gif" height="2"></td>
		</tr>

		<tr>
		<%
			int j;
			for(j = 0; j < option.length; j++)
			{
				
				String s = j +"";
			    System.out.println(s);
				System.out.println("sasa " + leftLink);

				
				if(leftLink.equals(s))
				{
					cellColor[j] = litecolor;
					style[j] = "boldsmall";
				}
				else
				{
					cellColor[j] = darkcolor;
					style[j] = "whitesmall";
				}
		%>

			<td align = "left" bgColor = "<%=cellColor[j]%>" class = "small" height="30" width = "14%">
				&nbsp;<a href="<%=aLink[j]%>" class="<%=style[j]%>"><%=option[j]%></a>
			</td>
			<td align = "left" bgColor = "#FFFFFF" class = "normal" height="20"><img src="../images/spacer.gif" height="2"></td>
		<%
			}
		%>
	</tr>
</table>