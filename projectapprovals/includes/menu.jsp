<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="bg.png">
	<tr bgcolor="#CCCCCC">
		<td align="left" valign="top" bgcolor="#FFFFFF">
			<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
			  <tr>
				<td bgcolor="#F4F2F2"><div align="center"><img src="../images/header.jpg" width="798" height="78" /></div></td>
				</tr>
			</table>
		</td>
	</tr>
<%
	Hashtable menuToShow = (Hashtable)session.getAttribute("dataHash");

	String linkId = (String)request.getParameter("linkId");

	//out.println("linkId =="+linkId);
	
	String linkIdstyle1 = "1".equals(linkId) ? "style4" : "";
	String linkIdstyle2 = "2".equals(linkId) ? "style4" : "";
	String linkIdstyle3 = "3".equals(linkId) ? "style4" : "";
	String linkIdstyle4 = "4".equals(linkId) ? "style4" : "";
	String linkIdstyle5 = "5".equals(linkId) ? "style4" : "";
	
	String userlinkId1 ="<a href=\"../user/projectApprovalsApply.jsp?linkId=1\" class=\"menu1\"><span class="+linkIdstyle1+">CREATE SANCTION NOTE</span></a>";
	String userlinkId2 ="<a href=\"../user/viewProjectApprovals.jsp?linkId=2\" class=\"menu1\"><span class="+linkIdstyle2+">VIEW STATUS</span></a>";

	String recommendlinkId = "&nbsp;";
	String approvelinkId = "&nbsp;";
	String rejectlinkId = "&nbsp;";

	if(menuToShow.containsKey("approvedByList"))
	{
		approvelinkId ="<a href=\"../approver/approveRequest.jsp?linkId=4\" class=\"menu1\"><span class="+linkIdstyle4+">APPROVE SANCTION NOTE</span></a>";
		rejectlinkId ="<a href=\"../approver/rejectRequest.jsp?linkId=5\" class=\"menu1\"><span class="+linkIdstyle5+">REJECT SANCTION NOTE</span></a>";
	}

	if(menuToShow.containsKey("recommendedByList"))
	{

		recommendlinkId ="<a href=\"../reviewer/recommendRequest.jsp?linkId=3\" class=\"menu1\"><span class="+linkIdstyle3+">RECOMMEND SANCTION NOTE</span></a>";
		rejectlinkId ="<a href=\"../reviewer/rejectRequest.jsp?linkId=5\" class=\"menu1\"><span class="+linkIdstyle5+">REJECT SANCTION NOTE</span></a>";
	}

		
%>
	<tr>
		<td bgcolor="#FFFFFF"><table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#EDE9E8">
	<tr>
		<td width="200" height="25" background="../images/menubg.jpg" bgcolor="#E1DAD9"><div align="left" class="menu1">
		  <div align="center"><span class="menu1"><%=userlinkId1%></span></div>
		</div></td>
		<td width="150" background="../images/menubg.jpg" bgcolor="#E1DAD9"><div align="left" class="menu1">
		  <div align="center"><span class="style4"><%=userlinkId2%></span></div>
		</div></td>
		<td width="150" background="../images/menubg.jpg" bgcolor="#E1DAD9"><div align="left" class="menu1">
		  <div align="center"><%=recommendlinkId%></div>
		</div></td>
		<td width="150" background="../images/menubg.jpg" bgcolor="#E1DAD9"><div align="center"><span class="menu1"><%=approvelinkId%></span></div></td>
		<td width="150" background="../images/menubg.jpg" bgcolor="#E1DAD9"><div align="center"><span class="menu1"><%=rejectlinkId%></span></div></td>
	</tr>
	<tr>
		<td align="left" bgcolor="#cccccc" colspan="6" height="1"><img height="1" src="../images/spacer.gif" width="1" /></td>
	</tr>
</table>