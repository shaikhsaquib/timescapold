<%
		String optionText = (String)session.getAttribute("optionValue");
		//System.out.println(optionText);	
		String className ="";
		String className1 ="";
		String className2 ="";
		String className3 ="";
		String className4 ="";
		String className5 ="";
        //System.out.println("optionText= "+optionText);

        if (optionText.equals("MRA"))
		{
			 className1 = "active";
		}else{
			 className1 = "";
	
		}

		if (optionText.equals("MRC"))
		{
			 className2 = "active";
		}else{
			 className2 = "";
	
		}

		if (optionText.equals("MVA"))
		{
			 className3 = "active";
		}else{
			 className3 = "";
	
		}

		if (optionText.equals("MVC"))
		{
			 className4 = "active";
		}else{
			 className4 = "";
	
		}

		if (optionText.equals("MVS"))
		{
			 className5 = "active";
		}else{
			 className5 = "";
	
		}

%>




<%	
	if ( ltaRoleId.equals("1")) {

%>
<div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default <%=className1%>" href="../common/monthlyltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default <%=className2%>" href="../common/checkstatus.jsp"><font color="#4586BD">My List <i class="fa fa-list-ol"></i> </font></a></div>
</div>		  
<%
	
	} else if ( ltaRoleId.equals("2")) {
	
%>
<div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default <%=className1%>" href="../common/monthlyltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default <%=className2%>" href="../common/checkstatus.jsp"><font color="#4586BD">My List <i class="fa fa-list-ol"></i> </font></a></div>
<div class="col-xs-1">
<a class="btn btn-default tip-bottom <%=className5%>" data-toggle="tooltip" data-original-title="Click to see all requests" href="../reviewer/viewallrequest.jsp"><font color="#4586BD">Search All <i class="fa fa-search"></i></font></a></div>

<%
	}
%>