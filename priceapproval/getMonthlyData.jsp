<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Arrays,java.util.List,java.text.DecimalFormat, java.util.Date, java.text.SimpleDateFormat,java.text.DateFormat, java.util.Calendar, java.util.GregorianCalendar" %>
 <jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ include file="includes/empHeader.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" >

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Purchase Approval Monthly Reports</title>
<link href="style/global.css" rel="stylesheet" type="text/css" />
<link href="style/popup.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="css/template.css" rel="stylesheet"> -->
<link href="style/calendarControl.css" rel="stylesheet">

<script Language="JavaScript" src="jscripts/util.js"></script>
<script Language="JavaScript" src="jscripts/common.js"></script>
<script Language="JavaScript" src="jscripts/search.js"></script>
<script type="text/javascript" src="jscripts/jquery.js"></script>
<script Language="JavaScript" src="jscripts/reports.js"></script>


<%
Hashtable monthDataHash = new Hashtable();
ArrayList monthlyDataArr = new ArrayList();

String category = (String)request.getParameter("category1");
//out.println("category-"+category);
String mainCategory = (String)request.getParameter("mainCategory");
String fromdate = (String)request.getParameter("fromdate");
String	todate = (String)request.getParameter("todate");
String status = (String)request.getParameter("status");
String month =	(String)request.getParameter("month");
String year =	(String)request.getParameter("year");
String pageVal = (String)session.getAttribute("page");
//String  test =  (String)request.getParameter("test");
//out.println("test"+test);
//out.println("pageVal"+pageVal);
String priceIddate = "";
String searchDate = "";
double arraysize = 0.0d;




String months[ ]		= {"0","JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
String monthsNum[ ]		= {"0","01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};






monthDataHash.put("CATEGORY",category);
monthDataHash.put("STATUS",status);

if(fromdate!=null && !fromdate.equals("0") && !fromdate.equals("")){

	monthDataHash.put("FROMDATE",fromdate);
	}

	if(todate!=null && !todate.equals("0") && !todate.equals(""))
	{
	monthDataHash.put("TODATE",todate);
	}
if(month!=null && !month.equals("0") && !month.equals(""))
	{
	monthDataHash.put("MONTH",month);

	}

	if(year!=null && !year.equals("0") && !year.equals(""))
	{
	monthDataHash.put("YEAR",year);

	}

	searchDate = month + "/" + year;
	if(month!=null && !month.equals("0") && !month.equals("") && year!=null && !year.equals("0") && !year.equals(""))
	{
	monthDataHash.put("SEARCHDATE",searchDate);
	}


	priceIddate = month + "-" + year;
	//out.println("priceIddate--"+priceIddate);


if(month!=null && !month.equals("0") && !month.equals("") && year!=null && !year.equals("0") && !year.equals(""))
	{
		monthDataHash.put("PRICEIDDATE",priceIddate);
	}
	//out.println("priceIddate--"+priceIddate);
	
	monthDataHash.put("TimescapeuseroidNew",(timescapeUserOId+""));
	String flag3 = (String)session.getAttribute("flag3");
	//out.println("flag3-"+flag3);
	if(flag3!=null && !flag3.equals("0") && !flag3.equals("") ){
	monthDataHash.put("FLAG3",flag3);
	}

	monthlyDataArr = priceApprovalWebController.getMonthlyData(monthDataHash);
	//out.println("monthlyDataArr--"+monthlyDataArr.size());
	arraysize = monthlyDataArr.size();	
	//out.println("arraysize-"+arraysize);

	
	//out.println("monthDataHash--"+monthDataHash);
	


	String category1 = "";
	String approvaldate = "";
	String createdon = "";
	String createdon1 = "";
	String totalrequest = "";
	String negotiation_value = "";
	String savings = "";
	String cost_avoidance = "";
	String total_savings = "";
	String avgDayDiff = "";
	String monthandyear = "";
	String finalDate =  "";
	String monthandyear1 = "";
	String finalDate1 =  "";

	String test1 = "";
	String test2 = "";
	String test3 = "";
	String test4 = "";
	String test5 = "";
	String test6 = "";
	String test7 = "";
	String test8 = "";
	


	String negotiation_value_val = "";
	String savings_val = "";
	String cost_avoidance_val = "";
	String savings_cost_val = "";
	String savings_cost_total_final = "";
	

	DecimalFormat df = new DecimalFormat("#"); 
	DecimalFormat f = new DecimalFormat("##");  
	DecimalFormat ff = new DecimalFormat("0.00"); 
	

	//out.println("1");
	double totalrequest_total = 0.0d;
	double negotiation_value_total = 0.0d;
	double savings_total = 0.0d;
	double cost_avoidance_total = 0.0d;
	double savings_cost_total = 0.0d;
	double dayDiffVal = 0.0d;
	double totalAvg = 0.0d;
	double totalReqAvg = 0.0d;
	double dayDiff_total = 0.0d;
	double negotiation_value_total_lac = 0.0d;
	double savings_total_lac = 0.0d;
	double cost_avoidance_total_lac = 0.0d;
	double savings_cost_total_lac = 0.0d;
	double negotiation_value_lac = 0.0d;
	double savings_lac = 0.0d;
	double cost_avoidance_lac = 0.0d;
	double savings_cost_lac = 0.0d;
		



%>

<form name="priceApprovalMonthlyData" method="post" action="">
<input type = "hidden" name = "page" id = "page" value = "<%=pageVal%>"/>
<table  width="100%" border="0" cellspacing="0" cellpadding="0">
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
<td></td>


 <td align = "center" width = "100%" height="20" class = "normal" colspan = "7" ><strong>Categorywise Monthwise Report for Category:   <%=category%>   <br>Period:
 <%if(!(month.equals("0")) && (!year.equals("0"))){%>
 <%=month%>&nbsp;<%=year%>
 <%}else{%>  <%=fromdate%> To <%=todate%><%}%></strong></td>
 </tr>
<tr></tr>
<tr>
<td width = "15%" class = "normal" >* All values are in INR (Lacs)</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td width = "85%"></td>
 <td  align="right"><input name="downloadreport" type="button" class="style4" id="downloadreport" value="Download" onclick="javascript:downloadPriceIdMonthlyReport();"/></td> 
</tr>

</table>

<table style="height: 100%;" width="100%" border="0" cellspacing="0" cellpadding="8">
 <tr>

  <td width = "5%" align = "right"  height="22" bgcolor="#ffffff" class="travelMenuBG" style="padding-left:3px;">Month-Year</td>
  <td width = "7%" align = "right"  height="22" bgcolor="#ffffff" class="travelMenuBG">Total<br>Requests</td>
  <td width = "7%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG">Negotiated<br>Value</td>
  <td width = "7%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG">Hard<br>Savings</td> 
  <td width = "7%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG">Cost<br>Avoidance</td>
  <td width = "7%" align = "right"  height="22" bgcolor="#ffffff" class="travelMenuBG">Total<br>Savings</td>
  <td width = "9%" align = "right"  class="travelMenuBG">Avg Processing<br>Duration (in days)</td>
  <td width = "2%" align = "right"  class="travelMenuBG"></td>
  <!-- <td width = "11%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG">Total Budget</td>
  <td width = "15%" align = "right" height="22" bgcolor="#ffffff" class="travelMenuBG" style = "padding-right:20px;">Total Balance Budget</td> -->
 
  </tr>
  
 

  <%
  	
if(monthlyDataArr.size() == 0) {

  %>
  <td height="22"  class="normal"><strong>No Data To Display</strong></td> 

  <%
}else if(monthlyDataArr.size() > 0){

	for(int i=0;i < monthlyDataArr.size();i++){

		String [] tmpArr = (String[])monthlyDataArr.get(i);

		totalrequest = tmpArr[0];
		negotiation_value = tmpArr[1];
		savings = tmpArr[2];
		cost_avoidance = tmpArr[3];
		avgDayDiff = tmpArr[4];
		createdon = tmpArr[5];
		createdon1 = tmpArr[6];
		
		dayDiffVal = Double.parseDouble(avgDayDiff);
		//totalReqAvg = Double.parseDouble(totalrequest_total);

	 monthandyear = (createdon +"-"+ createdon1);
	//out.println("monthandyear--"+monthandyear);



	SimpleDateFormat format1 = new SimpleDateFormat("MM-yy");
	SimpleDateFormat format2 = new SimpleDateFormat("MMM-yy");

	Date dt1  = format1.parse(monthandyear);
	finalDate = format2.format(dt1);
	//out.println("finalDate--"+finalDate);
		
	
		
		totalrequest_total = totalrequest_total + Double.parseDouble(totalrequest);
		negotiation_value_total = negotiation_value_total + Double.parseDouble(negotiation_value);
		savings_total = savings_total + Double.parseDouble(savings);
		cost_avoidance_total = cost_avoidance_total + Double.parseDouble(cost_avoidance);	
		dayDiff_total = dayDiff_total + dayDiffVal;	
		//out.println("dayDiff_total--"+dayDiff_total);
		
		
		savings_cost_val = df.format(Double.parseDouble(savings) + Double.parseDouble(cost_avoidance));

		//out.println("totalrequest-"+totalrequest);

		 negotiation_value_val = df.format(negotiation_value_total);
		 savings_val = df.format(savings_total);
		 cost_avoidance_val = df.format(cost_avoidance_total);
		 savings_cost_total  = savings_cost_total + Double.parseDouble(savings_cost_val );
		 savings_cost_total_final = df.format(savings_cost_total);


		  negotiation_value_total_lac = negotiation_value_total / 100000;
		  savings_total_lac = savings_total / 100000;
		 // out.println("savings_total_lac"+ff.format(savings_total_lac));
		  cost_avoidance_total_lac = cost_avoidance_total / 100000;
		  savings_cost_total_lac = savings_cost_total / 100000;

		  negotiation_value_lac = Double.parseDouble(negotiation_value) / 100000;
		  savings_lac = Double.parseDouble(savings) / 100000;
		  cost_avoidance_lac = Double.parseDouble(cost_avoidance) / 100000;
		  savings_cost_lac = Double.parseDouble(savings_cost_val) / 100000;


		  test1 = ff.format(negotiation_value_lac);
		 // out.println("test1"+test1);
		 test2 = ff.format(savings_lac);
		 test3 = ff.format(cost_avoidance_lac);
		 test4 = ff.format(savings_cost_lac);
			
		 test5 = ff.format(negotiation_value_total_lac);
		 test6 = ff.format(savings_total_lac);
		 test7 = ff.format(cost_avoidance_total_lac);
		 test8 = ff.format(savings_cost_total_lac);


			monthDataHash.put("CREATEDON",createdon);
		//	monthDataHash.put("MONTHANDYEAR",monthandyear);
		//	monthDataHash.put("CREATEDON",createdon);
			//out.println("monthDataHash--"+monthDataHash);

				 //negotiation_value start
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
} //savings end

			
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
} //cost_avoidance end

			//savings_cost_val start
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
		
	<td width = "3%" height="22" align = "right" class="normal" style="padding-right:7px;"><a href = "priceIdData.jsp?category=<%=category%>&status=<%=status%>&fromdate=<%=fromdate%>&todate=<%=todate%>&mainCategory=<%=mainCategory%>&month=<%=month%>&year<%=year%>&finalDate=<%=finalDate%>"><%=finalDate.equals("0") ? "-" : finalDate %></td>
	<td width = "7%" align = "right"   height="22" align = "center" class="normal"><%=totalrequest.equals("0") ? "-" : totalrequest%></td> 
   <td width = "7%" height="22" align = "right" class="normal" ><%=negotiation_value.equals("0") ? "-" : test1 %></td>
   <td width = "7%" height="22" align = "right" class="normal"><%=savings.equals("0") ? "-" : test2 %></td>
   <td width = "7%" height="22" align = "right" class="normal"><%=cost_avoidance.equals("0") ? "-" : test3 %></td>
   <td width = "7%" height="22" align = "right" class="normal"><%=savings_cost_val.equals("0") ? "-" : test4 %></td>
   <td width = "5%" height="22" align = "right" class="normal"><%=avgDayDiff.equals("0") ? "-" : (f.format(dayDiffVal)) %></td>
			  
		</tr>
			   
<%
	}}

totalAvg = dayDiff_total/arraysize;


  /*** negotiation_value_val start  *////

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
}

		 /*** negotiation_value_val end  *////


		   /*** savings_val start  *////
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
}

		 /*** savings_val end  *////


		  /*** cost_avoidance_val start  *////
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

		 /*** cost_avoidance_val end  *////


		 	/** savings_cost_total_final start */
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
		/** savings_cost_total_final end */
		


%>

<tr>
<td height="22" align = "right"   class="normal" style = "padding-left:8px;"><strong>Total/Average<strong></td> 
<td height="22" align = "right"   class="normal"><strong><%=df.format(totalrequest_total)%></strong></td>  
<td height="22" align = "right"   class="normal"><strong><%=test5%></strong></td> 
 <td height="22" align = "right"  class="normal"><strong><%=test6%></strong></td> 
<td height="22" align = "right"  class="normal"><strong><%=test7%></strong></td> 
<td height="22" align = "right"  class="normal"><strong><%=test8%></strong></td> 
<td height="22" align = "right"  class="normal"><strong><%=f.format(totalAvg)%></strong></td> 
</tr>
 </table>

<table width="100%"  border="0" cellspacing="0" cellpadding="8"> 
<tr>
<td align="center"><input name="back" type="button" align="center" class="style4" id="back" value="Back" onclick="javascript:getPriceData('1');" style = "margin-top:40px;"/></td> 
</tr>
</table>

 <td><input type = "hidden" name = "category" id = "category" value = "<%=category%>"></td>
 <td><input type = "hidden" name = "mainCategory" id = "mainCategory" value = "<%=mainCategory%>"></td>
 <td><input type = "hidden" name = "status" id = "status" value = "<%=status%>"></td>
 <td><input type = "hidden" name = "fromdate" id = "fromdate" value = "<%=fromdate%>"></td>
 <td><input type = "hidden" name = "todate" id = "todate" value = "<%=todate%>"></td>
 <td><input type = "hidden" name = "month" id = "month" value = "<%=month%>"></td>
 <td><input type = "hidden" name = "year" id = "year" value = "<%=year%>"></td>
 <td><input type = "hidden" name = "totalAvg" id = "totalAvg" value = "<%=totalAvg%>"></td>
 <td><input type = "hidden" name = "createdon" id = "createdon" value = "<%=createdon%>"></td>
 <td><input type = "hidden" name = "priceIddate" id = "priceIddate" value = "<%=priceIddate%>" ></td>
<td><input type = "hidden" name = "searchDate" id = "searchDate" value = "<%=searchDate%>" ></td>
<td><input type = "hidden" name = "finalDate" id = "finalDate" value = "<%=finalDate%>" ></td>
<td><input type = "hidden" name = "flag3" id = "flag3" value = "<%=flag3%>" ></td>
<!-- <td><input type = "text" name = "test" id = "test" value = "<%//=test%>" ></td>
 -->

 <%
	String flag = (String)session.getAttribute("flag");
	String sessionCategory = (String)session.getAttribute("category");
	String sessionStatus = (String)session.getAttribute("status");
	String sessionFromdate = (String)session.getAttribute("fromdate");
	String sessionTodate = (String)session.getAttribute("todate");
	String sessionMonth = (String)session.getAttribute("month");
	String sessionYear = (String)session.getAttribute("year");


 %>

</form>


</body>
</html>