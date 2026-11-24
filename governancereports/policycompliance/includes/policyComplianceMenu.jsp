<%
	int noOfColumns = 7;

	String currLink		= (String) session.getAttribute("currLink");
	String topLink		= (String) session.getAttribute("topLink");
	String litecolor 			= "#000000";
	String darkcolor 			= "#999999";

	ArrayList menus = (ArrayList) session.getAttribute("policyComplianceMenu");

%>
<table width="100%" border="0" cellspacing="1" cellpadding="0" align="center">
	<tr>
		<td  class="normal" colspan="100%" align="left" height="20px">
<%
	int cnt = 0;
	for(int kk=0; kk<menus.size(); kk++)
	{
		String[] arr = (String[])menus.get(kk);
		if(arr[0].equals(arr[1]))
		{
			cnt++;
			if(topLink.equals(arr[1])) 
			{
%>
			<a href="<%=arr[3]%>" class="style4"><%=arr[2]%></a>&nbsp;&nbsp;|&nbsp;&nbsp;
<%
			}
			else
			{
%>
			<a href="<%=arr[3]%>" class="style2"><%=arr[2]%></a>&nbsp;&nbsp;|&nbsp;&nbsp;

<%
			}
		}
	}
%>
		</td>

<%
	//for(; cnt<noOfColumns;cnt++)
	//{
%>
	<!-- 	<td class="normal" width="150px" align="center" height="20px">
		</td> -->
<%
	//}
%>
	</tr>
	</table>
<table width="100%" border="0" cellspacing="1" cellpadding="0" align="center">
	<tr>
<%
	for(int kk=0; kk<menus.size(); kk++)
	{
		String[] arr = (String[])menus.get(kk);
		if(!arr[0].equals(arr[1]) && topLink.equals(arr[1]))
		{
			if(arr[3].equalsIgnoreCase(currLink))
			{
%>
		<td bgcolor="<%=litecolor%>" align="center" width="150px" height="15px">
			<a href="<%=arr[3]%>" class="freqMenu"><strong><%=arr[2]%></strong></a>
		</td>
<%
			}
			else
			{
%>
		<td bgcolor="<%=darkcolor%>" align="center" valign="middle" width="150px" height="15px">
			<a href="<%=arr[3]%>" class="freqMenu"><%=arr[2]%></a>
		</td>
<%
			}
		}
	}
%>
	</tr>
</table>