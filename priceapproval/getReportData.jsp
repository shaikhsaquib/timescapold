
<%@ page import="java.util.Hashtable, java.util.ArrayList,java.text.DecimalFormat, java.util.Date, java.text.SimpleDateFormat,java.text.DateFormat, java.util.Calendar, java.util.GregorianCalendar" %>
 <jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ include file="includes/empHeader.jsp"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" >

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Purchase Approval Reports</title>


<link href="style/popup.css" rel="stylesheet" type="text/css" />
 <link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"> 
<!-- <link href="css/template.css" rel="stylesheet"> -->
<link href="style/calendarControl.css" rel="stylesheet">
<script Language="JavaScript" src="jscripts/util.js"></script>
<script Language="JavaScript" src="jscripts/common.js"></script>
<script type="text/javascript" src="jscripts/jquery.js"></script>
<script Language="JavaScript" src="jscripts/reports.js"></script>
<script>
if(!(category.equals("All")){
$(document).ready(function() {
    $(".download").hide()
}
}
	</script>

 </head>


<%

Hashtable reportHash = new Hashtable();
	Hashtable reportStatus = new Hashtable();
	ArrayList reportDataArr = new ArrayList();
	ArrayList monthArr = new ArrayList();
	//boolean status = false;

	//reportStatus.put("STATUS",	"'L','CL'");
	//reportStatus.put("STATUS",	"'L','CL'");
	String fromdate = "0";
	String todate = "0";
	String month = "0";
	String year = "0";


	String category = (String)request.getParameter("category");
	//String mainCategory = (String)request.getParameter("category");
	fromdate = (String)request.getParameter("fromdate");
	//out.println("fromdate-"+fromdate);
	todate = (String)request.getParameter("todate");
	String status = (String)request.getParameter("status");
	month = (String)request.getParameter("month");
	year = (String)request.getParameter("year");
	
	 
	String searchDate = "";
	String mainCategory = category;
	//String mainCategory = "";
	String status1 = "";
	String monthyear = month +"-"+ year;
	//out.println("monthyear-"+monthyear);
	String category1 = "";
	String approvaldate = "";
	String createdon = "";
	String negotiation_value = "";
	String savings = "";
	String cost_avoidance = "";
	String total_budget = "";
	String balance_budget = "";
	String totalrequest = "";
	String savings_cost = "";
	String avg_dayDiff = "";
	String s2 = "";
	String s3 = "";
	String noOfMonth = "";
	String allCategory = "";
	String val = "";
	
	String negotiation_value_val = "";
	String savings_val = "";
	String cost_avoidance_val = "";
	String total_budget_val = "";
	String balance_budget_val = "";
	String savings_cost_val = "";
	String savings_cost_total_final = "";
	String showStatus = "";
	String startMonth = "0";
	String endMonth = "0";
	String test1 = "";
	String test2 = "";
	String test3 = "";
	String test4 = "";
	String test5 = "";
	String test6 = "";
	String test7 = "";
	String test8 = "";
	String test = "";
	String finalDate = "";
	String newStatus = "";
	
	//String flag3 = "";

	DecimalFormat df = new DecimalFormat("#"); 
	DecimalFormat ff = new DecimalFormat("0.00"); 
	DecimalFormat f = new DecimalFormat("##"); 

	//if(monthyear != null && !monthyear.equals("") && monthyear != "0"){
	//if(monthyear != null && !monthyear.equals("") && monthyear != "0" && fromdate == null && fromdate.equals("") && fromdate == "0" && todate == null && todate.equals("") && todate == null){
	if((fromdate == null || fromdate.equals("") || fromdate == "0") && (todate == null || todate.equals("") || todate == null) ){
		//if(monthyear != null){

	
	SimpleDateFormat format1 = new SimpleDateFormat("MMM-yyyy");
	SimpleDateFormat format2 = new SimpleDateFormat("MMM-yy");
	Date dt1  = format1.parse(monthyear);
	finalDate = format2.format(dt1);
	//out.println("finalDate-"+finalDate);

	}
	
	double totalrequest_total = 0.0d;
	double negotiation_value_total = 0.0d;
	double savings_total = 0.0d;
	double cost_avoidance_total = 0.0d;
	double total_budget_total = 0.0d;
	double balance_budget_total = 0.0d;
	double savings_cost_total = 0.0d;
	double dayDiffVal = 0.0d;
	double negotiation_value_total_lac = 0.0d;
	double savings_total_lac = 0.0d;
	double cost_avoidance_total_lac = 0.0d;
	double savings_cost_total_lac = 0.0d;
	double negotiation_value_lac = 0.0d;
	double savings_lac = 0.0d;
	double cost_avoidance_lac = 0.0d;
	double savings_cost_lac = 0.0d;
	double totalAvg = 0.0d;
	double dayDiff_total = 0.0d;
	

String flag3 = (String)session.getAttribute("flag3");
	if(flag3!=null && !flag3.equals("0") && !flag3.equals("") )
	{
		reportHash.put("FLAG3",flag3);
	}
	
	

	if(category!=null && !category.equals("0") && !category.equals(""))
	{
		reportHash.put("CATEGORY",category);
	}
	
	if(fromdate!=null && !fromdate.equals("0") && !fromdate.equals(""))
	{

		reportHash.put("FROMDATE",fromdate);
	}

	if(todate!=null && !todate.equals("0") && !todate.equals(""))
	{
		reportHash.put("TODATE",todate);
	}

	if(status!=null && !status.equals("0") && !status.equals(""))
	{
		reportHash.put("STATUS",status);

	}

	if(month!=null && !month.equals("0") && !month.equals(""))
	{
		reportHash.put("MONTH",month);

	}

	if(year!=null && !year.equals("0") && !year.equals(""))
	{
		reportHash.put("YEAR",year);

	}


	searchDate = month + "/" + year;
	if(month!=null && !month.equals("0") && !month.equals("") && year!=null && !year.equals("0") && !year.equals(""))
	{
	reportHash.put("SEARCHDATE",searchDate);
	}
	reportHash.put("TimescapeuseroidNew",(timescapeUserOId+""));
	//reportHash.put("FLAG3",flag3);
	//out.println(reportHash);
	reportDataArr = priceApprovalWebController.getReportsData(reportHash);
	//out.println("reportDataArr--"+reportDataArr.size());

	
	if(status.equals("L','CL")){
		showStatus = "All";
	}
	if(status.equals("L")){
		showStatus = "In Process";
	}
	if(status.equals("CL")){
		showStatus = "Approved";
	}


	String months[ ]		= {"0","JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
    String monthsNum[ ]		= {"0","01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};

%>
<form name="priceApprovalReportData" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="7">
 </tr>
	  <tr height = "20">
	 <tr align = "center">
	
	 <td width = "" class = "normal" colspan = "8" align = "center"><strong>Summary of PAR Notes for Category:   <%=category%> <br/>   for Status:   <%=showStatus%>  &nbsp;&nbsp;
	  <!-- </tr>
	  
	  <tr>
	 <td></td>
	 <td></td>
	 <td></td> -->
	 <!-- <td width = "20%" class = "normal" > -->Period: 
	 <%if(!(month.equals("0")) && (!(year.equals("0")))){%>
		 <%=monthyear%> 
		 <%}else{%>  <%=fromdate%> To  <%=todate%>
		 <%}%></strong></td> 
	  </tr>
	  <td class = "normal" colspan = "7">* All values are in INR (Lacs)</td>
	 
	
	<td colspan="3" align="right"><input name="downloadreport" type="button" class="style4" id="downloadreport" value="Download" onclick="javascript:downloadReport();"/></td>
	  </tr>
	  <tr></tr>
  <tr>

  <td width = "18%" height="22" bgcolor="#ffffff" class="travelMenuBG" style = "padding-left:20px;">Category</td>
  <td width = "10%" align = "right"  height="22" bgcolor="#ffffff" class="travelMenuBG">Total<br>Requests</td>
  <td width = "8%" align = "right"  height="22" bgcolor="#ffffff" class="travelMenuBG">Download <br>  in Excel</td> 
  <td width = "10%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG">Negotiated<br>Value</td>
  <td width = "13%"  align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG">Hard<br>Savings</td>
  <td width = "12%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG">Cost<br>Avoidance</td>
  <td width = "13%" align = "right"  height="22" bgcolor="#ffffff" class="travelMenuBG">Total<br>Savings</td>
  <td width = "14%"  align = "right"  height="22" bgcolor="#ffffff" class="travelMenuBG">Avg Processing<br>Duration(in days)</td>
  <td class="travelMenuBG"></td>
  <!-- <td width = "11%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG">Total Budget</td>
  <td width = "15%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG" style = "padding-right:20px;">Total Balance Budget</td> -->
 
  </tr>
<%

if(reportDataArr.size() == 0) {
	%>
<td height="22"  class="normal"><strong>No Data To Display</strong></td> 

	<%

		
}else if(reportDataArr.size() > 0){
		
	
	for(int i=0;i < reportDataArr.size();i++){
	
	 
				String [] tmpArr = (String[])reportDataArr.get(i);
	
				totalrequest = tmpArr[0]==null ? "0" : tmpArr[0];
				negotiation_value = tmpArr[1]==null ? "0" : tmpArr[1];
				savings = tmpArr[2]==null ? "-" : tmpArr[2];
				cost_avoidance = tmpArr[3]==null ? "0" : tmpArr[3];				
				total_budget =tmpArr[4]==null ? "-" : tmpArr[4];
				balance_budget = tmpArr[5]==null ? "0" : tmpArr[5];
				avg_dayDiff = tmpArr[6]==null ? "0" : tmpArr[6];
				category1 = tmpArr[7];
				dayDiffVal = Double.parseDouble(avg_dayDiff);
				//out.println("category1--"+category1);
				
					//System.out.println("savings--"+savings);			
													
				totalrequest_total = totalrequest_total + Double.parseDouble(totalrequest);
				negotiation_value_total = negotiation_value_total + Double.parseDouble(negotiation_value);
				savings_total = savings_total + Double.parseDouble(savings);
				cost_avoidance_total = cost_avoidance_total + Double.parseDouble(cost_avoidance);				
				total_budget_total = total_budget_total + Double.parseDouble(total_budget);
				balance_budget_total = balance_budget_total + Double.parseDouble(balance_budget);
				dayDiff_total = dayDiff_total + Double.parseDouble(avg_dayDiff);

				
				 negotiation_value_val = df.format(negotiation_value_total);
				
				 savings_val = df.format(savings_total);
				 cost_avoidance_val = df.format(cost_avoidance_total);
				 savings_cost_val = df.format(Double.parseDouble(savings) + Double.parseDouble(cost_avoidance));
				 savings_cost_total  = savings_cost_total + Double.parseDouble(savings_cost_val );
				savings_cost_total_final = df.format(savings_cost_total);

				 total_budget_val = df.format(total_budget_total);
				 balance_budget_val = df.format(balance_budget_total);
				 
				  negotiation_value_total_lac = negotiation_value_total / 100000;
				  savings_total_lac = savings_total / 100000;
				
				  cost_avoidance_total_lac = cost_avoidance_total / 100000;
				  savings_cost_total_lac = savings_cost_total / 100000;
					
				  negotiation_value_lac = Double.parseDouble(negotiation_value) / 100000;
				  savings_lac = Double.parseDouble(savings) / 100000;
				   //System.out.println("savings_lac--"+savings_lac);
				  cost_avoidance_lac = Double.parseDouble(cost_avoidance) / 100000;
				  savings_cost_lac = Double.parseDouble(savings_cost_val) / 100000;
				 
					 
				 test1 = ff.format(negotiation_value_lac);
				 test2 = ff.format(savings_lac);
				 test3 = ff.format(cost_avoidance_lac);
				 test4 = ff.format(savings_cost_lac);
				//out.println("test2--"+test2);

				//totalAvg = dayDiff_total/Double.parseDouble(noOfMonth);
			 // out.println("totalAvg-"+(f.format(totalAvg)));


				  //negotiation_value start
		int len = 0;
	
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

		if(len>=1)
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
			test1 +="."+parts[1];
			}} else{
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
}//negotiation_value end

//savings start

		 temp = "";
			
		  lenCount = len-1;

		 counter = 1;

				if(test2.contains("."))
        {
            String[] parts  = test2.split("\\.");
			
            String part1    = parts[0];
			
			
            //String part2    = parts[1];
            test2 = part1;
			//out.println("test2--"+test2);
		 len = test2.length();
		//out.println("len---"+len);

			
		lenCount = len-1;
		//out.println("lenCount---"+lenCount);


		counter = 1;

		if(len>=1)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
						

					}
				
				temp = temp + test2.charAt(lenCount);
			//	out.println("temp-"+temp);
				
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			test2 = temp;
		}
       test2 +="."+parts[1];
	   
	    
       }else{
		  // out.println("hii");
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
}

//cost_avoidance start

		temp = "";
		lenCount = len-1;
		counter = 1;

		if(test3.contains("."))
        {
			
            String[] parts  = test3.split("\\.");
            String part1    = parts[0];
			
            //String part2    = parts[1];
            test3 = part1;
		 len = test3.length();

			
		lenCount = len-1;

		counter = 1;

		if(len>=1)
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
}//cost_avoidance end


//savings_cost_val start
		temp = "";
		lenCount = len-1;
		counter = 1;


				if(test4.contains("."))
        {
            String[] parts  = test4.split("\\.");
            String part1    = parts[0];
			
            //String part2    = parts[1];
            test4 = part1;
		 len = test4.length();

			
		lenCount = len-1;

		counter = 1;

		if(len>=1)
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
} //savings_cost_val end


					if(category.equals("All"))
					{

					//avg_dayDiff = tmpArr[6]==null ? "0" : tmpArr[6];
					//category1 = tmpArr[7];
					//out.println("11"+category1);
					//dayDiffVal = Double.parseDouble(avg_dayDiff);
					
					
				%>
				<tr>
				 <td width = "10%" height="22"  class="normal" name = "category1" id = "category1" style = "padding-left:20px;" ><a href = "getMonthlyData.jsp?category1=<%=category1%>&status=<%=status%>&fromdate=<%=fromdate%>&todate=<%=todate%>&month=<%=month%>&year=<%=year%>&mainCategory=<%=mainCategory%>&test=<%=test%>"><%=category1%></a></td> 
				 <td width = "8%"   height="22" align = "right" class="normal"><%=totalrequest.equals("0") ? "-" : totalrequest%></td> 
				 <td height="22" align = "right"  class="normal"><a href = "downloadPriceIdReport.jsp?category=<%=category1%>&mainCategory=<%=mainCategory%>&status=<%=status%>&fromdate=<%=fromdate%>&todate=<%=todate%>&finalDate=<%=finalDate%>"><img src="./images/download.jpg" title = "Download entire data for <%=category1%>"/></td>  
			   <td width = "8%" height="22" align = "right" class="normal"><%=negotiation_value.equals("0") ? "-" : test1 %></td>
			   <td width = "8%" height="22" align = "right"  class="normal"><%=savings.equals("0") ? "-" : test2%></td>
			   <td width = "8%" height="22" align = "right"  class="normal"><%=cost_avoidance.equals("0") ? "-" : test3%></td>
			   <td width = "8%" height="22" align = "right"  class="normal"><%=savings_cost_val.equals("0") ? "-" : test4%></td>
			  <td width = "8%" height="22" align = "right"  class="normal"><%=avg_dayDiff.equals("0") ? "-" : (f.format(dayDiffVal))%></td>
			 <!--  <td width = "10%" height="22" align = "right"  class="normal" style = "padding-right:20px;"><%//=balance_budget%></td> -->

				
				<%//}
				//}
				
	}else{
		//avg_dayDiff = tmpArr[6]==null ? "0" : tmpArr[6];
		//dayDiffVal = Double.parseDouble(avg_dayDiff);
		

		%>
				
			   <!-- <td height="22"  class="normal" ><%//=category%></td>   -->
			  <td height="22"  class="normal" name = "category" id = "category" style = "padding-left:20px;" ><a href = "getMonthlyData.jsp?category1=<%=category%>&status=<%=status%>&fromdate=<%=fromdate%>&todate=<%=todate%>&month=<%=month%>&year=<%=year%>&mainCategory=<%=mainCategory%>&test=<%=test%>"><%=category%></a></td> 
			   <td height="22" align = "right"  class="normal"><%=totalrequest%></td> 
			    <td height="22" align = "right"  class="normal"><a href = "downloadPriceIdReport.jsp?category=<%=category1%>&status=<%=status%>&fromdate=<%=fromdate%>&todate=<%=todate%>&finalDate=<%=finalDate%>"><img src="./images/download.jpg" title = "Download entire data for <%=category1%>" /></td> 
				
			   <td height="22" align = "right"  class="normal"><%=test1%></td>
			   <td height="22" align = "right" class="normal"><%=test2%></td>
			   <td height="22" align = "right"  class="normal"><%=test3%></td>
			   <td height="22" align = "right"  class="normal"><%=test4%></td>
			  <td width = "8%" height="22" align = "right"  class="normal"><%=avg_dayDiff.equals("0") ? "-" : (f.format(dayDiffVal))%></td>
			   <!-- <td height="22" align = "right"  class="normal" style = "padding-right:20px;"><%//=balance_budget%></td> -->

			   </tr>

			   <%}
			   }

		    test5 = ff.format(negotiation_value_total_lac);
		    test6 = ff.format(savings_total_lac);
			//out.println("test6--"+test6);
			test7 = ff.format(cost_avoidance_total_lac);
			test8 = ff.format(savings_cost_total_lac);

			int len = 0;
			String temp = "";
			int lenCount = len-1;
			int counter = 1;

			//savings_cost_total start
			if(test5.contains("."))
				{
            String[] parts  = test5.split("\\.");
            String part1    = parts[0];
			
            //String part2    = parts[1];
            test5 = part1;
		 len = test5.length();
		lenCount = len-1;
		counter = 1;

		if(len>=1)
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
}


//savings_cost_total start
			// len = 0;
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
				//}

		if(len>=1)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test6.charAt(lenCount);
				//out.println("temp-"+temp);
				
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
}

//savings_cost_total start
			// len = 0;
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
				//}

		if(len>=1)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test7.charAt(lenCount);
				//out.println("temp-"+temp);
				
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

//savings_cost_total start
			// len = 0;
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
				//}

		if(len>=1)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + test8.charAt(lenCount);
				//out.println("temp-"+temp);
				
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

			<!-- <tr style="display: none;"> -->
			<%
				
			  // }else
//{%>
			<tr>
			<td height="22"  class="normal" style = "padding-left:20px;"><strong>Total<strong></td> 
 
			 <!-- <td height="22"  class="normal">aa</td>   -->
			<td height="22" align = "right"   class="normal"><strong><%=df.format(totalrequest_total)%></strong></td> 
			<%if("All".equals(mainCategory)){%>
			<td  height="22" align = "right"  class="normal"><a href = "downloadPriceIdReport.jsp?&mainCategory=<%=mainCategory%>&status=<%=status%>&fromdate=<%=fromdate%>&todate=<%=todate%>&finalDate=<%=finalDate%>&allCategory = 1"><img src="./images/download.jpg" title = "Download entire data for All categories" /></td> </strong></td>  
			<%}else{%>
			<td id = "download" style = "display:none;" height="22" align = "right"  class="normal"><a href = "downloadPriceIdReport.jsp?&mainCategory=<%//=mainCategory%>&status=<%//=status%>&fromdate=<%//=fromdate%>&todate=<%//=todate%>&finalDate=<%//=finalDate%>&allCategory = 1"><img src="./images/download.jpg" title = "Download in excel " /></td> </strong></td> 
			<td height="22" align = "right"   class="normal"></td>
			<%}%>
			
			<!-- <td id = "download" height="22" align = "right"  class="normal"><a href = "downloadPriceIdReport.jsp?&mainCategory=<%=mainCategory%>&status=<%=status%>&fromdate=<%=fromdate%>&todate=<%=todate%>&finalDate=<%=finalDate%>&allCategory = 1"><img src="./images/download.jpg" title = "Download entire data for All Categories" /></td> </strong></td>   -->
			
			<td height="22" align = "right"   class="normal"><strong><%=test5%></strong></td> 
			 <td height="22" align = "right"  class="normal"><strong><%=test6%></strong></td> 
			<td height="22" align = "right"  class="normal"><strong><%=test7%></strong></td> 
			<td height="22" align = "right"  class="normal"><strong><%=test8%></strong></td> 
			<!-- <td height="22" align = "right" class="normal"><strong><%//=total_budget_val%></strong></td> 
			<td height="22" align = "right"  class="normal" style = "padding-right:20px;"><strong><%//=balance_budget_val%></strong></td>   -->
			</tr>
				
<%//}%>
					
<%//}
	//}
	//}
	

	%>

	<table width="100%" border="0" cellspacing="0" cellpadding="8">
	<tr height = "30"></tr>
<tr>
<td align="center"><input name="close" type="button" align="center" class="style4" id="close" value="Close" onclick="javascript:window.close();"/></td> 
</tr>
</table>
		
		<input type = "hidden" name = "category1" id = "category1" value = "<%=category1%>" >
		<input type = "hidden" name = "mainCategory" id = "mainCategory" value = "<%=mainCategory%>" >
		<input type = "hidden" name = "status" id = "status" value = "<%=status%>" >
		<input type = "hidden" name = "fromdate" id = "fromdate" value = "<%=fromdate%>" >
		<input type = "hidden" name = "todate" id = "todate" value = "<%=todate%>" >
		<input type = "hidden" name = "month" id = "month" value = "<%=month%>" >
		<input type = "hidden" name = "year" id = "year" value = "<%=year%>" >
		<input type = "hidden" name = "searchDate" id = "searchDate" value = "<%=searchDate%>" >
		 <input type = "hidden" name = "flag3" id = "flag3" value = "<%=flag3%>" > 
		 <!-- <input type = "text" name = "test" id = "test" value = "<%//=test%>" >  -->
 
	
<%
	
	}

//}%>
<%
	
	String flag = (String)session.getAttribute("flag");
	



//	out.println("flag--"+flag);
	
	

	session.setAttribute("category",category);
	session.setAttribute("status",status);
	session.setAttribute("fromdate",fromdate);
	session.setAttribute("todate",todate);
	session.setAttribute("month",month);
	session.setAttribute("year",year);
%>


</form>
<%%>
</table>

</body>
</html>
			



	