<%
		String optionText = (String)session.getAttribute("optionValue");
		//System.out.println(optionText);	
		String className ="";
		String className1 ="";
		String className2 ="";
		String className3 ="";
		String className4 ="";
		String className5 ="";
		String className6 ="";
		String className7 ="";
		String className8 ="";
		String className9 ="";
        //System.out.println("optionText= "+optionText);

        if (optionText.equals("ARA"))
		{
			 className1 = "active";
		}else{
			 className1 = "";
	
		}

		if (optionText.equals("ARC"))
		{
			 className2 = "active";
		}else{
			 className2 = "";
	
		}

		if (optionText.equals("AVA"))
		{
			 className3 = "active";
		}else{
			 className3 = "";
	
		}

		if (optionText.equals("AVC"))
		{
			 className4 = "active";
		}else{
			 className4 = "";
	
		}

		if (optionText.equals("AVS"))
		{
			 className5 = "active";
		}else{
			 className5 = "";
	
		}

		if (optionText.equals("APA"))
		{
			 className6 = "active";
		}else{
			 className6 = "";
	
		}

		if (optionText.equals("APC"))
		{
			 className7 = "active";
		}else{
			 className7 = "";
	
		}

		if (optionText.equals("APP"))
		{
			 className8 = "active";
		}else{
			 className8 = "";
	
		}

		if (optionText.equals("APS"))
		{
			 className9 = "active";
		}else{
			 className9 = "";
	
		}

%>




<%	
	if ( ltaRoleId.equals("1")) {

%>
<div class="row" id="printlinks"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default <%=className1%>" href="../common/annualltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default <%=className2%>" href="../common/annualcheckstatus.jsp"><font color="#4586BD">Mylist <i class="fa fa-list-ol"></i> </font></a></div>
</div>
</div>		  
<%
	
	} else if ( ltaRoleId.equals("2")) {
	
%>
<div class="row" id="printlinks"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default <%=className1%>" href="../common/annualltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>

 <div class="col-xs-1">
<a class="btn btn-default <%=className2%>" href="../common/annualcheckstatus.jsp"><font color="#4586BD">My List <i class="fa fa-list-ol"></i> </font></a></div>

<div class="col-xs-1">
<a class="btn btn-default tip-bottom <%=className5%>" data-toggle="tooltip" data-original-title="Click to see all requests" href="../reviewer/reviewerviewallrequest.jsp"><font color="#4586BD">Search All <i class="fa fa-search"></i></font></a></div>


<%
	
	} else if ( ltaRoleId.equals("3")) {
	
%>
<div class="row" id="printlinks"> 

 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default <%=className1%>" href="../common/annualltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>

 <div class="col-xs-1">
<a class="btn btn-default <%=className2%>" href="../common/annualcheckstatus.jsp"><font color="#4586BD">My List <i class="fa fa-list-ol"></i> </font></a></div>

<div class="col-xs-1">
<a class="btn btn-default <%=className8%>" href="../processor/pendingforapproval.jsp"><font color="#4586BD">Pending for approvals <i  class="fa fa-exclamation-triangle"></i> </font></a></div>
    
<div class="col-xs-1"  style="margin-left:100px;" >
<a class="btn btn-default tip-bottom <%=className9%>" data-toggle="tooltip" data-original-title="Click to see all requests" href="../processor/processorviewallrequest.jsp"><font color="#4586BD">Search All <i  class="fa fa-search"></i> </font></a></div>

<%
	}
%>