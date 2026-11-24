<%
	String optionMenu[]		= new String[2];
	String aLinkMenu[]		= new String[2];

	optionMenu[0] = "Dashboard";
	optionMenu[1] = "OCA-Feedback Count";
    //optionMenu[2] = "Search";

	aLinkMenu[0] = "../reviewer/report.jsp";
	//aLinkMenu[1] = "../reviewer/categoryDashBoard.jsp";
	aLinkMenu[1] = "../reviewer/dashBoardWeekly.jsp";
    //aLinkMenu[2] = "../common/search.jsp";


	String litecolor3 			= "";
	String darkcolor3			= "";

	String leftLinkMenu = (String) session.getAttribute("leftLinkA");
	String cellColorMenu[ ] = new String[optionMenu.length];
	String style[] = new String[optionMenu.length];
    System.out.println("leftLinkAAA===="+leftLinkMenu);
%>

	
	<table width="40%" border="0" cellspacing="0" cellpadding="0" align = "right">
		
<%
	int k;
	for(k = 0; k < 2; k++){                 //replace 2 with optionMenu.length

		String s = k +"";
		if(leftLinkMenu.equals(s)){
        
			cellColorMenu[k] = darkcolor3;
			style[k] = "style2";
%>
            <td width="5%" align = "right" bgColor = "<%=cellColorMenu[k]%>" height="15px">
					<a href="<%=aLinkMenu[k]%>" class="<%=style[k]%>"><%=optionMenu[k]%></a>
				</td>
<%
		}else{
			cellColorMenu[k] = litecolor3;
			style[k] = "linkVisited";

%>
                
                 <td width="15%" align = "right" bgColor = "<%=cellColorMenu[k]%>" height="15px" class="<%=style[k]%>"><%=optionMenu[k]%>
				</td>
<%               
		}
%>
				
<%
	}//end of for
%>
			
		</table>
</td>
