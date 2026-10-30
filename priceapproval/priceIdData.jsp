<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Arrays,java.util.List,java.text.DecimalFormat, java.util.Date, java.text.SimpleDateFormat,java.text.DateFormat, java.util.Calendar, java.util.GregorianCalendar" %>
 <jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ include file="includes/empHeader.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" >

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Purchase Approval Reports</title>
<link href="style/global.css" rel="stylesheet" type="text/css" />
<link href="style/popup.css" rel="stylesheet" type="text/css" />
<link href="css/template.css" rel="stylesheet">
<link href="style/calendarControl.css" rel="stylesheet">

<script Language="JavaScript" src="jscripts/util.js"></script>
<script Language="JavaScript" src="jscripts/common.js"></script>
<script Language="JavaScript" src="jscripts/search.js"></script>
<script type="text/javascript" src="jscripts/jquery.js"></script>
<script Language="JavaScript" src="jscripts/reports.js"></script>

<script type="text/javascript" src="jscripts/sorttable.js"></script> 

<style type="text/css">
<!--
/* Sortable tables */
table.sortable thead {
    background-color:#eee;
    color:#666666;
    font-weight: bold;
    cursor: default;
}

table.sortable th:not(.sorttable_sorted):not(.sorttable_sorted_reverse):not(.sorttable_nosort):after { 
    content: " \25B4\25BE" 
}
</style>



 <style>

    .search-table{table-layout: auto; margin:30px auto 0px auto;   }
    .search-table, td, th {
         border-collapse: collapse;
    }
.search-table th{padding:3px 3px;  }
.search-table td{padding:3px 3px; height:10px; text-align:center;}
    .search-table-outter { overflow-x: scroll;height: 280px; }
.search-table th, td { min-width: 125px;  }



    
}

</style>



<script type="text/javascript">
   function setVisibility(id, visibility) {
	document.getElementById(id).style.display = visibility;
}
</script>


 </head>


 <%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>

<%

ArrayList priceIdData = new ArrayList();

String category = (String)request.getParameter("category");
out.println("category-"+category);
String mainCategory = (String)request.getParameter("mainCategory");
out.println("mainCategory-"+mainCategory);
String status = (String)request.getParameter("status");

String fromdate = (String)request.getParameter("fromdate");
String month =	(String)request.getParameter("month");
String year =	(String)request.getParameter("year");
String todate = (String)request.getParameter("todate");
String monthyear = (String)request.getParameter("createdon");
String finalDate = (String)request.getParameter("finalDate");
out.println("finalDate-"+finalDate);
String test = (String)request.getParameter("test");
String price2 = "";
String allCategory = "";
String allCategory1 = "";
//out.println("test"+test);
//String test1 = 1;

//out.println("---"+fromdate);

//String priceIddate = (String)request.getParameter("priceIddate");
 

//out.println("priceIddate"+priceIddate);
//out.println("monthyear--"+monthyear);
//String pageVal = (String)session.getAttribute("page");
//String priceIddate = "";
Hashtable priceIdReportHash = new Hashtable();
Hashtable sortValueHash = new  Hashtable();
//out.println("pageVal="+pageVal);
//filter = (String)request.getParameter("filter");
//sort = (String)request.getParameter("sort");
priceIdReportHash.put("STATUS",status);
if(category!=null && !category.equals("0") && !category.equals("")){
priceIdReportHash.put("CATEGORY",category);
} 
/*if(mainCategory.equals("All")){
		allCategory = "1";
		priceIdReportHash.put("ALLCATEGORY",allCategory);
}*/

if(fromdate!=null && !fromdate.equals("0") && !fromdate.equals("") && todate!=null && !todate.equals("0") && !todate.equals("") )
	{
		test = "1";
		//priceIdReportHash.put("FROMDATE",fromdate);
		//priceIdReportHash.put("TODATE",todate);
		priceIdReportHash.put("TEST",test);
	}
if(!(finalDate.equals("")) ){
	price2 = "1";
priceIdReportHash.put("FINALDATE",finalDate);
priceIdReportHash.put("PRICE2",price2);

}

//priceIdReportHash.put("TEST",test);
//priceIdReportHash.put("MAINCATEGORY",mainCategory);
//out.println("priceIdReportHash--"+priceIdReportHash);
//priceIdReportHash.put("SEARCHDATE",searchDate);

//out.println("priceIdReportHash--"+priceIdReportHash);

if(!(category.equals(""))    )
{
	allCategory1 = "0";
	priceIdReportHash.put("ALLCATEGORY1",allCategory1);
}

if(fromdate!=null && !fromdate.equals("0") && !fromdate.equals("")){

	priceIdReportHash.put("FROMDATE",fromdate);
	}

	if(todate!=null && !todate.equals("0") && !todate.equals(""))
	{
	priceIdReportHash.put("TODATE",todate);
	}

if(month!=null && !month.equals("0") && !month.equals(""))
	{
	priceIdReportHash.put("MONTH",month);

	}

	if(year!=null && !year.equals("0") && !year.equals(""))
	{
	priceIdReportHash.put("YEAR",year);

	}

	//priceIddate = month + "/" + year;



priceIdReportHash.put("TimescapeuseroidNew",(timescapeUserOId+""));

String flag3 = (String)session.getAttribute("flag3");
	//out.println("flag3-"+flag3);
	if(flag3!=null && !flag3.equals("0") && !flag3.equals("") ){
	priceIdReportHash.put("FLAG3",flag3);
	}


priceIdData = priceApprovalWebController.getpriceIdData(priceIdReportHash);


String priceid = "";
String modifiedon = "";
String negotiation_value = "";
String savings = "";
String cost_avoidance = "";
String total_budget = "";
String balance_budget = "";
String savings_cost = "";


String negotiation_value_final = "";
String savings_value_final = "";
String cost_avoidance_value_final = "";
String total_budget_value_final = "";
String balance_budget_value_final = "";
String savings_cost_val = "";
String savings_cost_total_final = "";
String createdon = "";
String daydiff = "";
String projectname = "";
String apr11 = "";
String apr21 = "";
String apr31 = "";
String apr12 = "";
String apr22 = "";
String apr32 = "";
String apr13 = "";
String apr23 = "";
String apr33 = "";
String apr34 = "";
String apr35 = "";
String apr36 = "";
String apr4 = "";
String apr5 = "";
String apr6 = "";
String apr7 = "";
String apr8 = "";
String actualDiff11 = "";

String abc15Val = "";
	
String actualDiff21 = "";
String actualDiff31 = "";
String actualDiff12 = "";
String actualDiff22 = "";
String actualDiff32 = "";
String actualDiff13 = "";
String actualDiff23 = "";
String actualDiff33 = "";
String actualDiff34 = "";
String actualDiff35 = "";
String actualDiff36 = "";
String actualDiff4 = "";
String actualDiff5 = "";
String actualDiff6 = "";
String actualDiff7 = "";
String actualDiff8 = "";
String finalDayDiff = "";


String test1 = "";
String test2 = "";
String test3 = "";
String test4 = "";
String test5 = "";
String test6 = "";
String test7 = "";
String test8 = "";



	
int abc0 = 0;
int abc1 = 0;
int abc2 = 0;
int abc3 = 0;
int abc4 = 0;
int abc5 = 0;
int abc6 = 0;
int abc7 = 0;
int abc8 = 0;
int abc9 = 0;
int abc10 = 0;
int abc11 = 0;
int abc12 = 0;
int abc13 = 0;
int abc14 = 0;
int abc15 = 0;
int abc16 = 0;
int abc17 = 0;
int finalVal = 0;
	
DecimalFormat df = new DecimalFormat("0");
//DecimalFormat ff = new DecimalFormat("#.##"); 
DecimalFormat ff = new DecimalFormat("0.00"); 

double negotiation_value_total = 0.0d;
double savings_total = 0.0d;
double cost_avoidance_total = 0.0d;
double total_budget_total = 0.0d;
double balance_budget_total = 0.0d;
double roundOff = 0.0d;
double savings_cost_total = 0.0d;
double negotiation_value_total_lac = 0.0d;
double savings_total_lac = 0.0d;
double cost_avoidance_total_lac = 0.0d;
double savings_cost_total_lac = 0.0d;
double negotiation_value_lac = 0.0d;
double savings_lac = 0.0d;
double cost_avoidance_lac = 0.0d;
double savings_cost_lac = 0.0d;
boolean flag2 = false;
String newStatus = "";
%>
 <body>
<form name="frmPriceApprovalPriceIdReports" method="post" action="">

<!-- <input type = "hidden" name = "page" id = "page" value = "<%//=pageVal%>"/> -->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="images/header_price1.jpg" width="842" height="44" /></td>
    <td width="23%" rowspan="2">
    
 </li> 
</ul>
 </td>
  </tr>
  <tr>
    <td height="38"><img src="images/header_price2.jpg" width="706" height="38" /> 
	</td>
  </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr height = "10"></tr>
<tr>
<td></td>
<td></td>

 <td colspan = "3" align = "center" width = "100%" height="20" class = "normal" style="FONT-SIZE: 8pt;" ><p align = "center" sty><strong>Categorywise Monthwise Report for Category:  <%=category%> <br> Period:
 <%if(!(finalDate.equals("0"))){%>
 <%=finalDate%>
 <%}else{%>  <%=fromdate%> To <%=todate%><%}%></strong></p></td> 

 <td></td>
 <td></td>
 <td></td>
</tr>
<tr></tr>
<tr>
<td width = "30%" class = "normal" >* All values are in INR (Lacs)</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<!-- <td width = "8%"><input name="downloadreport1" type="button" class="style4" id="downloadreport1" value="Download Entire Data" onclick="javascript:downloadPriceIdReport();"/></td> -->
<td  width = "8%"><input name="downloadreport" type="button" class="style4" id="downloadreport" value="Download Specific  Data" <%//if(test.equals("1")){%>onclick="javascript:downloadPriceIdReport1();"<%//}%>/></td>
</tr>

</table>


 <div class="search-table-outter"> 

<table width="100%" border="0" cellspacing="0" cellpadding="8" class="sortable"  id = "anyid"> 

<thead>
  <tr>
		<th  height="22" bgcolor="#ffffff" class="travelMenuBG1">PAR ID</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Negotiated<br>Value</th>
		<th width = "20%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Hard<br>Savings</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Cost<br>Avoidance</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Total<br>Savings</th>
		<!-- <th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Budget</th>
		<th width = "11%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Balance Budget</th> -->
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Status</th>
		<th width = "8%" align = "center" height="22" bgcolor="#ffffff" class="travelMenuBG1">Created On</th>
		<th width = "6%" align = "center" height="22" bgcolor="#ffffff" class="travelMenuBG1">Last Updated<br>Date</th>
		<th width = "6%" align = "center" height="22" bgcolor="#ffffff" class="travelMenuBG1">Processing<br>Duration (in days)</th>
		<th width = "10%" align = "center" height="22" bgcolor="#ffffff" class="travelMenuBG1">B&C User<br>Level 1</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">B&C User<br>Level 2</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">B&C User<br>Level 3</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">User<br>Level 1</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">User<br>Level 2</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">User<br>Level 3</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">HR/Personnel</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Branch<br>Head</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">MAS 1</th>
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">MAS 2</th> 
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Finance 1</th> 
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Finance 2</th> 
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Director B&C</th> 
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">COO (Publishing)</th> 
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">COO</th> 
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">CEO (Publishing)</th> 
		<th width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG1">Managing<br>Director</th> 

  </tr>
 
</thead>
<tbody>
  
  <%

		//out.println("##"+priceIdData.size());
		if(priceIdData.size() > 0){
		for(int i=0;i < priceIdData.size();i++){
			 int glbValue = 0;
			 String [] tmpArr1 = (String[])priceIdData.get(i);

				priceid = tmpArr1[0];
				modifiedon = tmpArr1[1];
				negotiation_value =  tmpArr1[2]==null ? "-" : tmpArr1[2];
				savings = tmpArr1[3]==null ? "-" : tmpArr1[3];
				cost_avoidance =tmpArr1[4]==null ? "-" : tmpArr1[4];
				total_budget = tmpArr1[5]==null ? "-" : tmpArr1[5];
				balance_budget =tmpArr1[6]==null ? "-" : tmpArr1[6];
				createdon = tmpArr1[7];
				daydiff = tmpArr1[8];
				newStatus = tmpArr1[9];
				apr11 = tmpArr1[10];				
				actualDiff11 = tmpArr1[11];				
				apr21 = tmpArr1[12];			
				actualDiff21 = tmpArr1[13];				
				apr31 = tmpArr1[14];
				actualDiff31 = tmpArr1[15];				
				apr12 = tmpArr1[16];
				actualDiff12 = tmpArr1[17];			
				apr22 = tmpArr1[18];
				actualDiff22 = tmpArr1[19];			
				apr32 = tmpArr1[20];
				actualDiff32 = tmpArr1[21];			
				apr13 = tmpArr1[22];			
				actualDiff13 = tmpArr1[23];			
				apr23 = tmpArr1[24];
				actualDiff23 = tmpArr1[25];
				apr33 = tmpArr1[26];
				actualDiff33 = tmpArr1[27];
				apr34 = tmpArr1[28];
				actualDiff34 = tmpArr1[29];
				apr35 = tmpArr1[30];
				actualDiff35 = tmpArr1[31];			
				apr36 = tmpArr1[32];
				actualDiff36 = tmpArr1[33];
				apr4 = tmpArr1[34];
				actualDiff4 = tmpArr1[35];
				apr5 = tmpArr1[36];
				actualDiff5 = tmpArr1[37];
				apr6 = tmpArr1[38];
				actualDiff6 = tmpArr1[39];
				apr7 = tmpArr1[40];
				actualDiff7 = tmpArr1[41];
				apr8 = tmpArr1[42];				
				actualDiff8 = tmpArr1[43];
				projectname = tmpArr1[44];
				//out.println("newStatus--"+newStatus);
				
				abc0  = Integer.parseInt(actualDiff11);
				if(Integer.parseInt(actualDiff11) != 0){
					glbValue = Integer.parseInt(actualDiff11);
				}
			
				abc1  = Integer.parseInt(actualDiff21) - glbValue;
				if(Integer.parseInt(actualDiff21) != 0){
				glbValue = Integer.parseInt(actualDiff21);
				}				
				
				abc2  = Integer.parseInt(actualDiff31) - glbValue;

				if(Integer.parseInt(actualDiff31) != 0){
				glbValue = Integer.parseInt(actualDiff31);
				}

				abc3  = Integer.parseInt(actualDiff12) - glbValue;

				if(Integer.parseInt(actualDiff12) != 0){
				glbValue = Integer.parseInt(actualDiff12);
				}
				abc4  = Integer.parseInt(actualDiff22) - glbValue;

				if(Integer.parseInt(actualDiff22) != 0){
				glbValue = Integer.parseInt(actualDiff22);
				}
				
				abc5  = Integer.parseInt(actualDiff32) - glbValue;		

				if(Integer.parseInt(actualDiff32) != 0){
				glbValue = Integer.parseInt(actualDiff32);
				}
				abc6  = Integer.parseInt(actualDiff13) - glbValue;

				if(Integer.parseInt(actualDiff13) != 0){
					glbValue = Integer.parseInt(actualDiff13);
				}
		
				abc7  = Integer.parseInt(actualDiff23) -  glbValue;
				
				if(Integer.parseInt(actualDiff23) != 0){
					glbValue = Integer.parseInt(actualDiff23);
				}
				abc8  = Integer.parseInt(actualDiff33) - glbValue;
				
				if(Integer.parseInt(actualDiff33) != 0){
				glbValue = Integer.parseInt(actualDiff33);
				}
				abc9  = Integer.parseInt(actualDiff34) - glbValue;

				if(Integer.parseInt(actualDiff34) != 0){
				glbValue = Integer.parseInt(actualDiff34);
				}

				abc10 = Integer.parseInt(actualDiff35) - glbValue;

				if(Integer.parseInt(actualDiff35) != 0){
				glbValue = Integer.parseInt(actualDiff35);
				}

				abc11 = Integer.parseInt(actualDiff36) - glbValue;

				if(Integer.parseInt(actualDiff36) != 0){
				glbValue = Integer.parseInt(actualDiff36);
				}

				abc12 = Integer.parseInt(actualDiff4) - glbValue;

				if(Integer.parseInt(actualDiff4) != 0){
					glbValue = Integer.parseInt(actualDiff4);
				}

				abc13 = Integer.parseInt(actualDiff5) - glbValue;

				if(Integer.parseInt(actualDiff5) != 0){
				glbValue = Integer.parseInt(actualDiff5);
				}
				abc14 = Integer.parseInt(actualDiff6) - glbValue;

				
				if(Integer.parseInt(actualDiff6) != 0){
				glbValue = Integer.parseInt(actualDiff6);
				}	
				

				abc15 = Integer.parseInt(actualDiff7) - glbValue;				
				
				if(Integer.parseInt(actualDiff7) != 0  ){
					
				glbValue = Integer.parseInt(actualDiff7);
				
				}		
			
				abc16 = Integer.parseInt(actualDiff8) - glbValue;
				
				

				if(abc16 > 0 ){
					flag2 = true;
					
				finalVal =	abc16;
				}
				else if(abc15 >= 0 ){
					flag2 = true;
				
				finalVal =	abc15;
				}
				else if(abc14 > 0 ){
					flag2 = true;
					
				finalVal =	abc14;
				}
				else if(abc13 > 0 ){
					flag2 = true;
					
				finalVal =	abc13;
				}
				else if(abc12 > 0 ){
					flag2 = true;
					
				finalVal =	abc12;
				}
				else if(abc11 > 0 ){
					flag2 = true;
					
				finalVal =	abc11;
				}
				else if(abc10 > 0 ){
					flag2 = true;
					
				finalVal =	abc10;
				}
				else if(abc9 > 0 ){
					flag2 = true;
					
				finalVal =	abc9;
				}
				else if(abc8 > 0 ){
					flag2 = true;
				
				finalVal =	abc8;
				}
				else if(!(abc7 ==0 )){
					flag2 = true;
					
				finalVal =	abc7;
				}
				else if(!(abc6 ==0 )){
					flag2 = true;
					
				finalVal =	abc6;
				}
				else if(abc5 > 0 ){
					flag2 = true;
				
				finalVal =	abc5;
				}
				else if(abc4 > 0 ){
					flag2 = true;
					
				finalVal =	abc4;
				}
				else if(abc3 > 0 ){
					flag2 = true;
				
				finalVal =	abc3;
				}
				else if(abc2 > 0 ){
					
					flag2 = true;

					
				finalVal =	abc2;
				}
				else if(abc1 > 0 ){
					flag2 = true;
					
				finalVal =	abc1;
				}
				else if(abc0 > 0 ){
					flag2 = true;
					
				finalVal =	abc0;
				}
				
				negotiation_value_total = negotiation_value_total + Double.parseDouble(negotiation_value);
				savings_total = savings_total + Double.parseDouble(savings);
				cost_avoidance_total = cost_avoidance_total + Double.parseDouble(cost_avoidance);
				total_budget_total = total_budget_total + Double.parseDouble(total_budget);
				balance_budget_total = balance_budget_total + Double.parseDouble(balance_budget);
				savings_cost_val = df.format(Double.parseDouble(savings) + Double.parseDouble(cost_avoidance));
				savings_cost_total  = savings_cost_total + Double.parseDouble(savings_cost_val );
				

				negotiation_value_final = df.format(negotiation_value_total);			
				savings_value_final = df.format(savings_total);
				cost_avoidance_value_final = df.format(cost_avoidance_total);
				total_budget_value_final = df.format(total_budget_total);
				balance_budget_value_final = df.format(balance_budget_total);
				savings_cost_total_final = df.format(savings_cost_total);

				negotiation_value_total_lac = negotiation_value_total / 100000;
				savings_total_lac = savings_total / 100000;
				cost_avoidance_total_lac = cost_avoidance_total / 100000;
				savings_cost_total_lac = savings_cost_total / 100000;

				 negotiation_value_lac = Double.parseDouble(negotiation_value) / 100000;
				 savings_lac = Double.parseDouble(savings) / 100000;
				 cost_avoidance_lac = Double.parseDouble(cost_avoidance) / 100000;
				 savings_cost_lac = Double.parseDouble(savings_cost_val) / 100000;

				 test1 = ff.format(negotiation_value_lac);
				 test2 = ff.format(savings_lac);
				 test3 = ff.format(cost_avoidance_lac);
				 test4 = ff.format(savings_cost_lac);
					
				 test5 = ff.format(negotiation_value_total_lac);
				 test6 = ff.format(savings_total_lac);
				 test7 = ff.format(cost_avoidance_total_lac);
				 test8 = ff.format(savings_cost_total_lac);

				//out.println("newStatus"+newStatus);
				if(newStatus.equals("L"))
				{
					newStatus = "In Process";
				}

				if(newStatus.equals("CL"))
				{
					newStatus = "Approved";
				}

		int len =0;
		String temp = "";
		int lenCount = len-1;
		int counter = 1;

		if(test1.contains("."))
        {
            String[] parts  = test1.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            test1 = part1;
		 len = test1.length();
		lenCount = len-1;
		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test1.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test1 = temp;
			}
			test1 +="."+parts[1];
			} else{
		 len = test1.length();
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test1.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test1 = temp;
		}
} //negotiation_value end

		//savings start
		temp = "";
		lenCount = len-1;
		counter = 1;
				if(test2.contains("."))
        {
            String[] parts  = test2.split("\\.");
            String part1    = parts[0];
			//out.println("part1"+part1);
            //String part2    = parts[1];
            test2 = part1;
		 len = test2.length();

			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test2.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test2 = temp;
		}
       test2 +="."+parts[1];
       }else{
		 len = test2.length();
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test2.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test2 = temp;
		}
}  //savings end

			
			
			//cost_avoidance start
			temp = "";
		lenCount = len-1;
		counter = 1;
				if(test3.contains("."))
        {
            String[] parts  = test3.split("\\.");
            String part1    = parts[0];
			//out.println("part1"+part1);
            //String part2    = parts[1];
            test3 = part1;
		 len = test3.length();

			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test3.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test3 = temp;
		}
       test3 +="."+parts[1];
       }else{
		 len = test3.length();
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test3.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test3 = temp;
		}
} //savings_cost_val end

temp = "";
		lenCount = len-1;
		counter = 1;
if(test4.contains("."))
        {
            String[] parts  = test4.split("\\.");
            String part1    = parts[0];
			//out.println("part1"+part1);
            //String part2    = parts[1];
            test4 = part1;
		 len = test4.length();

			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test4.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test4 = temp;
		}
       test4 +="."+parts[1];
       }else{
		 len = test4.length();
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test4.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test4 = temp;
		}
}


  %>
  <tr>			 
				<td height="10"  class="normal" title= "<%=projectname%>" ><a href = "common/showDetailsAdmin1.jsp?priceid=<%=priceid%> "  ><%=priceid%></a>
				</td> 
				
				
				<td align = "right" height="22"  class="normal"  ><%=test1%></td>
			    <td align = "right" height="22"  class="normal"><%=test2%></td>
			    <td align = "right" height="22"  class="normal"><%=test3%></td>
			    <td align = "right" height="22"  class="normal"><%=test4%></td>
			    <!-- <td align = "right" height="22"  class="normal"><%//=total_budget%></td>
			    <td align = "right" height="22"  class="normal"><%//=balance_budget%></td> -->
			    <td align = "right" height="22"  class="normal"><%=newStatus%></td>
				<td align = "right" height="22"  class="normal"><%=createdon%></td> 
				<td align = "right" height="22"  class="normal"><%=modifiedon%></td> 		
				<td align = "right" height="22"  class="normal"><%=daydiff%></td> 		
				<td align = "right" height="22"  class="normal"><%=apr11.equals("0") ? "-" : (abc0 < 0) ? "0" : abc0 %></td> 			
				<td align = "right" height="22"  class="normal"><%=apr21.equals("0") ? "-" :  (abc1 < 0) ? "0" : abc1%></td> 				
				<td align = "right" height="22"  class="normal"><%=apr31.equals("0") ? "-" : (abc2 < 0) ? "0" : abc2%></td>				
				<td align = "right" height="22"  class="normal"><%=apr12.equals("0") ? "-" : (abc3 < 0) ? "0" : abc3%></td> 			
				<td align = "right" height="22"  class="normal"><%=apr22.equals("0") ? "-" : (abc4 < 0) ? "0" : abc4%></td>			
				<td align = "right" height="22"  class="normal"><%=apr32.equals("0") ? "-" : (abc5 < 0) ? "0" : abc5%></td>			
				<td align = "right" height="22"  class="normal"><%=apr13.equals("0") ? "-" : (abc6 < 0) ? "0" : abc6%></td>			
				<td align = "center" height="22"  class="normal"><%=apr23.equals("0") ? "-" : (abc7 < 0) ? "0" : abc7%></td>				
				<td align = "right" height="22"  class="normal"><%=apr33.equals("0") ? "-" : (abc8 < 0) ? "0" : abc8%></td>			
				<td align = "right" height="22"  class="normal"><%=apr34.equals("0") ? "-" : (abc9 < 0) ? "0" : abc9%></td>				
				<td align = "right" height="22"  class="normal"><%=apr35.equals("0") ? "-" : (abc10 < 0) ? "0" : abc10%></td>				
				<td align = "right" height="22"  class="normal"><%=apr36.equals("0") ? "-" : (abc11 < 0) ? "0" : abc11%></td>			
				<td align = "right" height="22"  class="normal"><%=apr4.equals("0") ? "-" : (abc12 < 0) ? "0" : abc12%></td>			
				<td align = "right" height="22"  class="normal"><%=apr5.equals("0") ? "-" : (abc13 < 0) ? "0" : abc13%></td>			
				<td align = "right" height="22"  class="normal"><%=apr6.equals("0") ? "-" : (abc14 < 0) ? "0" : abc14%></td>				
				<td align = "right" height="22"  class="normal"><%=apr7.equals("0") ? "-" : (abc15 < 0) ? "0" : abc15%></td>		
				<%if(flag2 == true){%>
				<td align = "right" height="22"  class="normal"><%=apr8.equals("0") ? "-" : finalVal%></td> 
				<%
					}
						%>				
			</tr>
		<%//}
		}
		
			//negotiation_value_final start
			 int len, lenCount, counter =0;
    String temp = "";
			  if(test5.contains("."))
        {
            String[] parts  = test5.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            test5 = part1;
		 len = test5.length();

			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test5.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test5 = temp;
		}
       test5 +="."+parts[1];
       }else{
		 len = test5.length();
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test5.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test5 = temp;
		}
}//negotiation_value_final end
		
		//savings_value_final start
		temp = "";
		lenCount = len-1;
		counter = 1;
		  if(test6.contains("."))
        {
            String[] parts  = test6.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            test6 = part1;
		 len = test6.length();

			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test6.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test6 = temp;
		}
       test6 +="."+parts[1];
       }else{
		 len = test6.length();
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test6.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test6 = temp;
		}
} //savings_value_final end


		//cost_avoidance_value_final start
		temp = "";
		lenCount = len-1;
		counter = 1;
				 if(test7.contains("."))
        {
            String[] parts  = test7.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            test7 = part1;
		 len = test7.length();

			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test7.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test7 = temp;
		}
       test7 +="."+parts[1];
       }else{
		 len = test7.length();
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test7.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test7 = temp;
		}
}

 //cost_avoidance_value_final end

		//savings_cost_total_final start
		temp = "";
		lenCount = len-1;
		counter = 1;
				 if(test8.contains("."))
        {
            String[] parts  = test8.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            test8 = part1;
		 len = test8.length();

			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test8.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test8 = temp;
		}
       test8 +="."+parts[1];
       }else{
		 len = test8.length();
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test8.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test8 = temp;
		}
}
		
%>
		
</tbody>

</table>

</div>

 <table width = "800px" border="0" cellspacing="0" cellpadding="8px"> 

<tr >   
<td  width = "10%"  height="22"  class="normal"><strong>Total</strong></td> 
 
 
<td width = "15%"   height="22" align = "right"  class="normal"><strong><%=test5%></strong></td> 
<td width = "14%"   height="22" align = "right"  class="normal"><strong><%=test6%></strong></td> 
<td width = "15%"  height="22" align = "right"  class="normal"><strong><%=test7%></strong></td> 
<td width = "13%"   height="22" align = "right" class="normal"><strong><%=test8%></strong></td> 
<!-- <td width = "13%"   height="22" align = "right" class="normal"><strong><%//=total_budget_value_final%></strong></td> 
<td width = "13%"   height="22" align = "right"  class="normal"><strong><%//=balance_budget_value_final%></strong></td> -->
<td  height="22"  class="normal"><strong></strong></td> 
<td  height="22"  class="normal"><strong></strong></td>  
<td  height="22"  class="normal"><strong></strong></td>  
<td  height="22"  class="normal"><strong></strong></td>  
</tr>
</table>  
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
<!-- <tr>
	<td height="1" colspan="4"  class = "greyBG1"></td>
    </tr>
	  <tr>
		<td align="center" valign="middle" class = "greyBG1">&nbsp;</td>
	  </tr>

	   <tr>
		<td height="5" colspan="4" class = "greyBG1"></td>
	  </tr> -->

<%}else{%>
<tr>
<td height="22" align = "right" class="normal"><strong>There Is No Data To Display.</strong></td> 
</tr>
<%}%>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="8">
<tr>
<td align="center"><input name="back" type="button" align="center" class="style4" id="back" value="Back" onclick="javascript:history.back();"/></td> 
</tr>
</table>



 <td><input type = "hidden" name = "category" id = "category" value = "<%=category%>"></td>
 <td><input type = "hidden" name = "mainCategory" id = "mainCategory" value = "<%=mainCategory%>"></td>
 <td><input type = "hidden" name = "status" id = "status" value = "<%=status%>"></td>
 <td><input type = "hidden" name = "fromdate" id = "fromdate" value = "<%=fromdate%>"></td>
 <td><input type = "hidden" name = "todate" id = "todate" value = "<%=todate%>"></td>
 <td><input type = "hidden" name = "month" id = "month" value = "<%=month%>"></td>
 <td><input type = "hidden" name = "year" id = "year" value = "<%=year%>"></td>
 <td><input type = "hidden" name = "newStatus" id = "newStatus" value = "<%=newStatus%>"></td>
 <td><input type = "hidden" name = "monthyear" id = "monthyear" value = "<%=monthyear%>"></td>
 <td><input type = "hidden" name = "negotiation_value" id = "negotiation_value" value = "<%=negotiation_value%>"></td>
 <td><input type = "hidden" name = "finalDate" id = "finalDate" value = "<%=finalDate%>"></td>
 <!-- <td><input type = "text" name = "test" id = "test" value = "<%//=test%>"></td> -->
 

<%



/*	String flag = (String)session.getAttribute("flag");
	String sessionCategory = (String)session.getAttribute("category");
	String sessionStatus = (String)session.getAttribute("status");
	String sessionFromdate = (String)session.getAttribute("fromdate");
	String sessionTodate = (String)session.getAttribute("todate");
	String sessionMonth = (String)session.getAttribute("month");
	String sessionYear = (String)session.getAttribute("year");*/


	%>

</form>
</body>
</html>