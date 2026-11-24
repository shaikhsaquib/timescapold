<%
	String litecolor = "#d0e0f0";
	String darkcolor = "#406890";
	String bgColor = "#406890";

	String header = "";
	String normalStyle = "normal";
	String boldStyle = "bold";
	String underlineStyle = "underline";
	String boldUnderlineStyle = "boldunderline";
	String height = "25";
	String align = "left";
	String date = "";
	String headerStyle = "";
%>

 <%
	String utilMenuOpt[ ] = {"home","faq","feedback","change pin","logout"};
	String utilMenuLink[ ] = {"/timescape/login/home.jsp","/timescape/resourcecentre/faq/faq.jsp","/timescape/resourcecentre/feedback/feedback.jsp","javascript:void window.open('/timescape/login/changePassword.jsp','','menubar=no,scrollbars=no,width=400,height=170, top=220,left=220')","/timescape/login/logout.jsp"};
%>


	<table width = "99%" border = "0"  align="center" cellspacing="0" cellpadding="0">
	<tr>
      <td align="left">&nbsp;</td>
		<td align="right" class="normal">
			<%
				for(int i = 0; i < utilMenuOpt.length; i++)
				{
			%>
				<a href = "<%=utilMenuLink[i]%>" class = "normal"><%=utilMenuOpt[i]%></a>&nbsp;
				<%
					if(i < utilMenuOpt.length-1)
					{
						out.println("|");
					}
				%>
			<%
				}
			%>
		</td>
	</tr>
</table>
