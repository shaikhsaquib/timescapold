<%
	String optionMenu[]		= new String[1];
	String aLinkMenu[]		= new String[1];
	//String roleCode = "";

	optionMenu[0] = "Report";
	//optionMenu[1] = "Controls";
	

	if (roleCode.equals("3")) {
	aLinkMenu[0] = "../reviewer/reports.jsp";
	//aLinkMenu[1] = "../reviewer/categoryDashBoard.jsp";
	//aLinkMenu[1] = "../reviewer/countReport.jsp";
    //aLinkMenu[2] = "../common/search.jsp";

	}

	if (roleCode.equals("2")) {

	aLinkMenu[0] = "../approver/approverReports.jsp";
	//aLinkMenu[1] = "../includes/countReport.jsp";
	}

	String litecolor3 			= "";
	String darkcolor3			= "";

	String leftLinkMenu = (String) session.getAttribute("leftLink");
	String cellColorMenu[ ] = new String[optionMenu.length];
	String style[] = new String[optionMenu.length];
%>

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
				
					<a href="<%=aLinkMenu[k]%>" class="<%=style[k]%>"><%=optionMenu[k]%></a>&nbsp;
				<%
	}//end of for
%>
			