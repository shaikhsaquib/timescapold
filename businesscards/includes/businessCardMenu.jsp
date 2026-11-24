<%
	int noOfColumns = 5;

	String currLink		= (String) session.getAttribute("currLink");
	String topLink		= (String) session.getAttribute("topLink");

	String litecolor 			= "#AAAFBB";
	String darkcolor 			= "#878C9A";

	ArrayList menus = (ArrayList) session.getAttribute("businessCardMenu");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<%=litecolor%>">
	<tr>
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
		<td bgcolor="<%=litecolor%>" class="normal" width="20%" align="center" height="20">
			<a href="<%=arr[3]%>" class="underline"><%=arr[2]%></a>
		</td>
<%
			}
			else
			{
%>
		<td bordercolor="#DCE5B6" bgcolor="<%=darkcolor%>" class="normal" width="20%" align="center" height="20">
			<a href="<%=arr[3]%>" class="underline"><%=arr[2]%></a>
		</td>
<%
			}
		}
	}
	for(; cnt<noOfColumns;cnt++)
	{
%>
		<td bgcolor="<%=darkcolor%>" class="normal" width="20%" align="center" height="20">
		</td>
<%
	}
%>
	</tr>
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
		<td bgcolor="<%=litecolor%>" class="normal" align="center" width="20%" height="20">
			<a href="<%=arr[3]%>" class="underline"><strong><%=arr[2].toLowerCase()%></strong></a>
		</td>
<%
			}
			else
			{
%>
		<td bgcolor="<%=litecolor%>" class="normal" align="center" width="20%" height="20">
			<a href="<%=arr[3]%>" class="underline"><%=arr[2].toLowerCase()%></a>
		</td>
<%
			}
		}
	}
%>
	</tr>
</table>