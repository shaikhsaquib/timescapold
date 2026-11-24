<%
	String option[] = {"Personal Details","Qualifications","Employment History"};
	String alink[] = {"../profile/viewProfile.jsp","../profile/viewQualifications.jsp","../profile/bcclEmp.jsp"};
	String leftLink = (String) session.getAttribute("leftLink");
	String cellColor[ ] = new String[option.length];
	String style[] = new String[option.length];


%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align = "center">
		<%
			int j;
			for(j = 0; j < option.length; j++)
			{
				String s = j +"";
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
		<tr>
			<td align = "right" bgColor = "<%=cellColor[j]%>" class = "normal" height="20">
				<a href="<%=alink[j]%>" class="<%=style[j]%>"><%=option[j]%></a>&nbsp;
			</td>

		</tr>

		<tr>
			<td class = "normal" bgcolor="#000000"><img src="<%=Constants.COMMON_IMAGE_PATH%>spacer.gif" height="1"></td>
		</tr>
		<%
			}
		%>
</table>