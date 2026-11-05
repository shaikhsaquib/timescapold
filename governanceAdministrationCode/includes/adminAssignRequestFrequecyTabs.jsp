<%@ page language="java" %>
 <html>
    <head>
    <title>OCA Report</title>
	<%@ include file="../includes/headerMenu.jsp" %>
	 <link href="../style/compliance.css" rel="stylesheet" type="text/css" />	

  </head>
  
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

		
		aLink[0] = "../admin/adminAssignRequestDaily.jsp";
		aLink[1] = "../admin/adminAssignRequestWeekly.jsp";
		aLink[2] = "../admin/adminAssignRequestFortNightly.jsp";
        aLink[3] = "../admin/adminAssignRequestMonthly.jsp";  
		aLink[4] = "../admin/adminAssignRequestQuarterly.jsp";
		aLink[5] = "../admin/adminAssignRequestHalfYearly.jsp";
		aLink[6] = "../admin/adminAssignRequestAnnually.jsp";
	

	String litecolor2 			= "#000000";
	String darkcolor2			= "#999999";

	String leftLink = (String) session.getAttribute("leftLink");
	String cellColor[ ] = new String[option.length];
	String style[] = new String[option.length];
%>
 <body>
   <form name="frmActivity" method = "post" action = "">
<tr>
	<td width="12%"  align="left" bgcolor="#FFFFFF" class="nav"></td>
	<td width="" align="left" bgcolor="#FFFFFF" class="underlineBig"></td>
 </tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">

 <%
  if (roleId.equals("1")){
%>
   <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../common/governanceAdministration.jsp" class="style2">CREATE REQUEST</a>  </div>
		</td>
  </tr>
 <%
 }else if(roleId.equals("2")){
 %>
 <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../common/governanceAdministration.jsp" class="style2">CREATE REQUEST</a> | <a href="../approver/approverWeekly.jsp" class="style2">APPROVE REQUEST </a> | <a href="../approver/approverAuthorise.jsp" class="style2">AUTHORISE REQUEST </a> </div>
		</td>
  </tr>
  <%
   }else if(roleId.equals("3")){
  %>
 <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../admin/adminCreateRequest.jsp" class="style2">CREATE REQUEST</a> | <a href="../admin/adminWeekly.jsp" class="style2">APPROVE REQUEST </a> </div>
		</td>
  </tr>
<%
}else{
 %>
	 <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../mas/masRequest.jsp" class="style2">APPROVE REQUEST</a>&nbsp; | &nbsp;<a href="../mas/governanceAdmin.jsp" class="style2">ADMIN</a></div>
		</td>
  </tr>
<%
  }
%>
<tr>
  <td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
 </tr>
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
	</body>
</table>
</html>