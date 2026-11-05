 <%@ page language="java" %>
 <html>
    <head>
    <title>OCA Report</title>
	<%@ include file="../includes/headerMenu.jsp" %>
	 <link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
    <script Language="JavaScript" src="../jscripts/report.js"></script>
<%
String roleId = (String)session.getAttribute("roleId");

%>
  </head>
  <body>
   <form name="frmActivity" method = "post" action = "">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
	<td width="12%"  align="left" bgcolor="#FFFFFF" class="nav">ACTIVITY : &nbsp;&nbsp;&nbsp;: </td>
		<td  align="left" bgcolor="#FFFFFF" class="underlineBig">Change manager Frequency wise</td>
 </tr>
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
  }//else{
  %>
 <!--  <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../common/governanceAdministration.jsp" class="style2">CREATE REQUEST</a> | <a href="../approver/approverWeekly.jsp" class="style2">APPROVE REQUEST </a> | <a href="../mas/masWeekly.jsp" class="style2">SANCTION REQUEST </a>  </div>
		</td>
  </tr> -->
<%
//}
	else if(roleId.equals("3")){
  %>
 <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../admin/adminCreateRequest.jsp" class="style2">CREATE REQUEST</a> | <a href="../admin/adminRequest.jsp" class="style2">APPROVE REQUEST </a> </div>
		</td>
  </tr>
<%
else{
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
</table>
</body>
   <%
	String option[]		= new String[8];
	String aLink[]		= new String[8];


		option[0] = "DAILY";
		option[1] = "WEEKLY";
		option[2] = "FORTNIGHTLY";
		option[3] = "MONTHLY";
		option[4] = "QUARTERLY";
		option[5] = "HALF YEARLY";
		option[6] = "ANNUALLY";
		option[7] = "ALL";

		aLink[0] = "../user/reportDaily.jsp";
		aLink[1] = "../user/reportWeekly.jsp";
		aLink[2] = "../user/reportFortNightly.jsp";
        aLink[3] = "../user/reportMonthly.jsp";  
		aLink[4] = "../user/reportQuarterly.jsp";
		aLink[5] = "../user/reportHalfYearly.jsp";
		aLink[6] = "../user/reportAnnually.jsp";
		aLink[7] = "../common/allCheckStatus.jsp";
	

	
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
			for(j = 0; j < option.length; j++)
			{
				//System.out.println("lenght" + option.length);

				String s = j +"";
			   // System.out.println(s);
				//System.out.println("sasa " + leftLinkTab);

				
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
</html>