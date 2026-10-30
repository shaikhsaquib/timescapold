<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil"%>
<%@ page import=" java.text.DecimalFormat, java.util.Date, java.text.SimpleDateFormat,java.text.DateFormat, java.util.Calendar, java.util.GregorianCalendar" %>
<%@ include file="includes/sessionCheck.jsp"%>
<%//@ page errorPage="common/errorPage.jsp"%>
<%@ include file="includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" >

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Purchase Approval Reports</title>
<link href="style/global.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="style/popup.css" rel="stylesheet" type="text/css" />
<!-- <link href="css/template.css" rel="stylesheet"> -->
<link href="style/calendarControl.css" rel="stylesheet">

<script Language="JavaScript" src="jscripts/util.js"></script>
<script Language="JavaScript" src="jscripts/common.js"></script>
<script Language="JavaScript" src="jscripts/search.js"></script>
<script type="text/javascript" src="jscripts/jquery.js"></script>
<script Language="JavaScript" src="jscripts/reports.js"></script>

<script>
	function clearMonthYear() {
		
		var fromdate = document.getElementById("fromdate").value;
		var todate = document.getElementById("todate").value;
		var month = document.getElementById("month").value;
		var year = document.getElementById("year").value;
		
		if( fromdate != "" && todate != "" || fromdate == "" && todate == "")
	{
		//alert("fromdate"+fromdate);
    $("#month").val(1); // This is my dropdown
    $("#year").val(0); // This is my dropdown
   
	}

}
   </script>


<script>
	function clearDates() {
		var fromdate = document.getElementById("fromdate").value;
		var todate = document.getElementById("todate").value;
		var month = document.getElementById("month").value;
		var year = document.getElementById("year").value;
		//alert("month"+month);
	if( month != "" && year != "" || month == "" && year == ""  ){
	 $("#fromdate").val(""); // This is my dropdown
    $("#todate").val(""); // This is my dropdown
	}
}
   </script>


<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}


</style>
<script src="jscripts/calendarControl.js" language="javascript"></script>
<link href="style/calendarControl.css" rel="stylesheet">
<% 
//category="+category+"&fromdate="+fromdate+"&todate="+todate+"&status="+status+"&month="+month+"&year="+year+"&flag1=2  
String flag1 = (String)request.getParameter("flag1");
String category = "";
String fromdate = "";
String todate ="";
String status = "";
String month = "";
String year = "";
String selected = "";




String catSel = "";
String optCatArr[]={"All","IBO","Capex","IT buying","Consumables","Insurance","Non conventional category","Projects","OSP","Logistics","Group Company related buying"};
String optCatValArr[]={"All","IBO","Capex","IT buying","Consumables","Insurance","Non conventional category","Projects","OSP","Logistics","Group Company related buying"};

String statusSel = "";
String optstatusArr[] = {"All","In Process","Approved"};
//String optStatusValArr[] =  {"All","In Process","Approved"};
String optStatusValArr[] =  {"L','CL","L","CL"};
String monthSel = "";
String optMonthArr[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
String optMonthValArr[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
Hashtable statusHash = new Hashtable();
String testVal = "";
statusHash.put("All","L','CL");
statusHash.put("In Process","L");
statusHash.put("Approved","CL");
	

if(flag1 == null)
{
	
	// optStatusValArr[2] =  {"All","In Process","Approved"};

	flag1 = "0";
}else
{
	// optStatusValArr[2] =  {"'L','CL'","'L'","'CL'"};


}

if(flag1.equals("2"))
{
	
 category = (String)request.getParameter("category");
 fromdate = (String)request.getParameter("fromdate");
 todate = (String)request.getParameter("todate");
 status = (String)request.getParameter("status");
 month = (String)request.getParameter("month");
 year = (String)request.getParameter("year");
 // out.println("month"+month);

}

	for(int kk=0;kk<optCatArr.length;kk++){   

		if(category.equals(optCatArr[kk]))
			selected	 = "selected";
		else
			selected	 = "";
			catSel += "<option value='"+optCatValArr[kk]+"' "+selected+">"+optCatValArr[kk]+"</option>";	
	}

	for(int jj=0;jj<optstatusArr.length;jj++){   

		//if(status.contains(optStatusValArr[jj]))
		 if(status.equals(statusHash.get(optstatusArr[jj])))
			selected	 = "selected";
		else
			selected	 = "";

	//statusSel += "<option value="+optStatusValArr[jj]+" "+selected+">"+optstatusArr[jj]+"</option>";	
	  statusSel += "<option value="+statusHash.get(optstatusArr[jj])+" "+selected+">"+optstatusArr[jj]+"</option>";
	  
	}

	
for(int ii=0;ii<optMonthArr.length;ii++){   

		if(month.equals(optMonthArr[ii]))
			selected	 = "selected";
		else
			selected	 = "";
			monthSel += "<option value='"+optMonthValArr[ii]+"' "+selected+">"+optMonthValArr[ii]+"</option>";	
	}

%>


<form name="priceApprovalReports" method="post" action="">
<body <%if(flag1.equals("2")){%>onload="javascript:getData1();"<%}%>>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="images/header_price1.jpg" width="842" height="44" /></td>
    <td width="23%" rowspan="2">
     
 </li> 
</ul>
 </td>
  </tr>

  <tr>
    <td height="38"><img src="images/header_price2.jpg" width="706" height="38" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>
  <tr>
  <td width = "77%" class="normal"> </span><font size="2" color="red">&nbsp;&#42&nbsp;</font> Mandatory Fields</td>
  </tr>
</table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr height = "30"></tr>
 <tr  class="greyBG">
        <td align = "left"   width="6%" >CATEGORY : </td>

        <td  align="center" width="5%">
		<select class="normal" style="height:20px;" style="padding-left:9px;" id="category" name="category">
                <option value="0">Select Category</option>
				 <!-- <option value="'IBO','Capex','IT buying','Consumables','Insurance','Non conventional category','OSP','Group Company related buying'">All</option>  
				 <option value="All">All</option>
                <option value="IBO">IBO</option>
				<option value="Capex">Capex</option>
				<option value="IT buying">IT buying</option>
				<option value="Consumables">Consumables</option>
				<option value="Insurance">Insurance</option>
				<option value="Non conventional category">Non conventional category</option>
				<option value="Projects">Projects</option>
				<option value="OSP">OSP</option>
				<option value="Logistics">Logistics</option>
				<option value="Group Company related buying">Group Company related buying</option> -->
				<%=catSel%>
            </select>
			
        </td>
		 <td></span><font size="2" color="red">&nbsp;&#42&nbsp;</font></td></td>

		<td  align="center" width="5%">STATUS :</td>
	 <td   width="6%"  >
            <select class="normal" style="height:20px;" style="padding-left:5px;"  id="status" name="status">
			<option value="0">Select Status</option>
				 <!-- <option value = "'L','CL'" > All</option>
                <option value="'L'">In Process</option>
				<option value="'CL'">Approved</option>   -->
				
				<%=statusSel%>
				
				</select>
      </td>
	   <td></span><font size="2" color="red">&nbsp;&#42&nbsp;</font></td></td>
		 <td align = "right"   width="7%" style="padding-right:5px;padding-left:3px;" >FROM DATE :</td>
		 <td  align="left" width="5%" style="padding-left:8px;"><span class="normal">
      <input name="fromdate" id="fromdate" class="normal" value = "<%=fromdate%>" maxlength="100" onfocus="showCalendarControl(this);" onclick = "clearMonthYear()" readonly="readonly"   />
    </span></td>

	<td align = "center"   width="6%" style="padding-right:5px;padding-left:5px;">TO DATE :</td>
		 <td  align="left" width="5%" style="padding-left:3px;"><span class="normal">
      <input name="todate" id="todate" class="normal" maxlength="100" value = "<%=todate%>" onfocus="showCalendarControl(this);" onclick = "clearMonthYear()" readonly="readonly"   />
    </span></td>

<td align = "center"   width="4%"  style="padding-left:3px;" >OR </td>

	  <td align = "right"   width="4%" style="padding-left:3px;" >MONTH :</td>
	  <td  align="left" width="4%" style="padding-left:7px;"><span class="normal">
      <select style="height:20px;" name="month" id="month" class="normal" onclick = "clearDates()" >
	   <option value="0"> Select Month</option>
	  <!-- <option value="Jan">Jan</option>
	  <option value="Feb">Feb</option>
	  <option value="Mar">Mar</option>
	  <option value="Apr">Apr</option>
	  <option value="May">May</option>
	  <option value="June">Jun</option>
	  <option value="July">Jul</option>
	  <option value="Aug">Aug</option>
	  <option value="Sep">Sep</option>
	  <option value="Oct">Oct</option>
	  <option value="Nov">Nov</option>
	  <option value="Dec">Dec</option>  -->
	  <%=monthSel%>
	  </span></td> 

	 <%
	int currYear = 0;
	int selYear = 0;
	int preYear = 0;
	int years = 0;
	GregorianCalendar today = new GregorianCalendar();	
	currYear = today.get(Calendar.YEAR);
	preYear = currYear - 10;
	selYear = currYear +10;
	years =   selYear + 10;
	%>
	   <td align = "right"   width="4%" value = "0" style="padding-left:3px;" >YEAR :</td>
	  <td   width="8%" style="padding-left:3px;"><span class="normal">
	  <select style="height:20px;" name="year" id="year" class="normal" onclick = "clearDates()">
	  <option value="0">Select Year</option>
	  <%//= HtmlUtil.getYearList(preYear, selYear,years,"asc") %>
<%
		for (int pp = preYear; pp < selYear; pp++){
			if(Integer.toString(pp).equals(year)){
%>
		
			<option value="<%=pp%>" selected><%=pp%></option>

<%
			}else{
%>
			<option value="<%=pp%>"><%=pp%></option>

<%			}
	  }	
%>
			</select> 
			


	  <!-- <td  align="left" width="5%"><a href="javascript:void(0)" onclick="getData()"><img src="images/but_go.gif" border="0" /></a></td>	 -->
	  <td colspan="8" align="left"><input name="go" type="button" class="style4" id="go" value="Go" onclick = "javascript:getData1();"/></td>
	 
</table>

 <td><input type = "hidden" name = "category" id = "category" value = ""/></td>
<td><input type = "hidden" name = "fromdate" id = "fromdate" value = ""/></td>
<td><input type = "hidden" name = "todate" id = "todate" value = ""/></td>
<td><input type = "hidden" name = "status" id = "status" value = ""/></td>
 <td><input type = "hidden" name = "month" id = "month" value = ""/></td>
<td><input type = "hidden" name = "year" id = "year" value = ""/></td>


<%//} 
String flag = "1";
 session.setAttribute("flag",flag);
 session.setAttribute("page","1");
 
// String category = "";
if (flag == "1")
{
	//session.setAttribute("category",category);
	/*session.setAttribute("status",status);
	session.setAttribute("fromdate",fromdate);
	session.setAttribute("todate",todate);
	session.setAttribute("month",category);
	session.setAttribute("year",year);*/
	

}
%>


<span id="showRequests"></span> 

</tbody>
</form>
</body>
</html>

