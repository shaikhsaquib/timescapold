<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	 </head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%
	int noOfColumns = 5;

	String currLink		= (String) session.getAttribute("currLink");
	String topLink		= (String) session.getAttribute("topLink");

	String litecolor 			= "#D0E0F0";
	String darkcolor 			= "#9CACBC";

	ArrayList menus = (ArrayList) session.getAttribute("rmdClaimMenu");
	//out.println(menus);
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="<%=litecolor%>">
	<tr>
<%
	int cnt = 0;
	for(int kk=0; kk<menus.size(); kk++)
	{
		String[] arr = (String[])menus.get(kk);
		if(arr[3].equals(arr[4]))
		{
			cnt++;
			if(topLink.equals(arr[4]))
			{
%>
		<td bgcolor="<%=litecolor%>" class="normal" width="20%" align="center" height="20">
			<a href="<%=arr[6]%>" class="underline"><%=arr[5]%></a>
		</td>
<%
			}
			else
			{
%>
		<td bgcolor="<%=darkcolor%>" class="normal" width="20%" align="center" height="20">
			<a href="<%=arr[6]%>" class="underline"><%=arr[5]%></a>
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
		if(!arr[3].equals(arr[4]) && topLink.equals(arr[4]))
		{
			if(arr[6].equalsIgnoreCase(currLink))
			{
%>
		<td bgcolor="<%=litecolor%>" class="normal" align="center" width="20%" height="20">
			<a href="<%=arr[6]%>" class="underline"><strong><%=arr[5].toLowerCase()%></strong></a>
		</td>
<%
			}
			else
			{
%>
		<td bgcolor="<%=litecolor%>" class="normal" align="center" width="20%" height="20">
			<a href="<%=arr[6]%>" class="underline"><%=arr[5].toLowerCase()%></a>
		</td>
<%
			}
		}
	}
%>
	</tr>
</table>
</body>
</html>