<%
	String optionMenu[]		= new String[3];
	String aLinkMenu[]		= new String[3];

	optionMenu[0] = "Report";
	optionMenu[1] = "Controls";
    optionMenu[2] = "Search";

	aLinkMenu[0] = "../reviewer/report.jsp";
	//aLinkMenu[1] = "../reviewer/categoryDashBoard.jsp";
	aLinkMenu[1] = "../reviewer/dashBoardDaily.jsp";
    aLinkMenu[2] = "../common/search.jsp";


	String litecolor3 			= "";
	String darkcolor3			= "";

	String leftLinkMenu = (String) session.getAttribute("leftLink");
	String cellColorMenu[ ] = new String[optionMenu.length];
	String style[] = new String[optionMenu.length];
%>
<tr>
	<td>
	<table width="10%" border="0" cellspacing="0" cellpadding="0" align = "right">
		<tr>
<%
	int k;
	for(k = 0; k < optionMenu.length; k++){

		String s = k +"";
		if(leftLinkMenu.equals(s)){
			cellColorMenu[k] = litecolor3;
			style[k] = "linkVisited";

		}else{
			cellColorMenu[k] = darkcolor3;
			style[k] = "style2";
		}
%>
				<td align = "left" bgColor = "<%=cellColorMenu[k]%>" height="15px">
					<a href="<%=aLinkMenu[k]%>" class="<%=style[k]%>"><%=optionMenu[k]%></a>&nbsp;|&nbsp;
				</td>
<%
	}//end of for
%>
			</tr>
		</table>
	</td>
</tr>