
<%
		String option[]		= new String[4];
		String aLink[]		= new String[4];
        String roleCode = "4";
		int noOfColumns		= 5;

	if(roleCode.equals("4")) {

		
		option[0] = "USERWISE NON COMPLIANCE REPORT";
		option[1] = "POLICY WISE NON COMPLIANCE REPORT";
		option[2] = "POLICY OVERRIDDEN REPORT";
		option[3] = "TOTAL COUNT REPORT";


		aLink[0] = "../reports/reports.jsp";
		aLink[1] = "../reports/policyReports.jsp";
		aLink[2] = "../reports/overriddenReports.jsp";
		aLink[3] = "../reports/countReport.jsp";
 
 }else if(roleCode.equals("3")) {

		
		option[0] = "USERWISE NON COMPLIANCE REPORT";
		//option[1] = "DEPARTMENT WISE REPORT";
		option[1] = "POLICY WISE NON COMPLIANCE REPORT";
		//option[3] = "POLICY HEADER REPORT";
		option[2] = "POLICY OVERRIDDEN REPORT";
		option[3] = "TOTAL COUNT REPORT";


		aLink[0] = "../reviewer/reports.jsp";
		//aLink[1] = "../reviewer/deptReports.jsp";
		aLink[1] = "../reviewer/policyReports.jsp";
        //aLink[3] = "../reviewer/policyHeaderReports.jsp";  
		aLink[2] = "../reviewer/overriddenReports.jsp";
		aLink[3] = "../reviewer/countReport.jsp";
 
 }else if(roleCode.equals("1")) {
		
        option[0] = "MY CODE COMPLIANCE";
		option[1] = "REPORT";

		aLink[0] = "../requestor/governanceCode.jsp";
		aLink[1] = "../requestor/userReports.jsp";
 
 }else if(roleCode.equals("2")) {
	
		
		option[0] = "VIEW COMPLIANCE";
		option[1] = "NON-COMPLIANCE REPORT";
		option[2] = "STATUS REPORT";

        aLink[0] = "../approver/governanceAppr.jsp";
		aLink[1] = "../approver/approverReports.jsp";
		aLink[2] = "../approver/statusReports.jsp";
 }

	

		String litecolor2 			= "#99DADF";
		String darkcolor2			= "#808080";

		String leftLinkTab = (String) session.getAttribute("leftLink");

		String cellColorTab[ ] = new String[option.length];
		String styleTab[] = new String[option.length];
%>
<table width="100%" border="0" cellspacing="1px" cellpadding="0" align = "center">

		<tr class="greyBG">
		<%
		    int size = 0;
			int j;


			if (roleCode.equals("4")) {

				size = 4;

			}else if (roleCode.equals("3")) {

				size = 4;

			} else if(roleCode.equals("2")){

				size = 3;

			}else {

				size = 2;
			}

			for(j = 0; j < size; j++)
			{	
				//cnt1++;
				

				String s = j +"";
			    //System.out.println(s);
				//out.println("sasa " + leftLinkTab);

			
				if(leftLinkTab.equals(s))
				{ //out.println(j +"first" + aLink[j]);
					cellColorTab[j] = litecolor2;
					styleTab[j] = "greyBG";
				}
				else
				{	//out.println(j +"second" + aLink[j]);
					cellColorTab[j] = "";
					styleTab[j] = "greyBG";
				}


		%>
			<td align = "center"  height="21" bgcolor="<%=cellColorTab[j]%>">
				&nbsp;<a href="<%=aLink[j]%>" class="<%=styleTab[j]%>" ><%=option[j]%></a>
			</td>
			<!-- <td align = "left" bgColor = "#FFFFFF" class = "normal" height="20"><img src="../images/spacer.gif" height="2"></td> -->
		<%

	
			}


%>
	</tr>
</table>