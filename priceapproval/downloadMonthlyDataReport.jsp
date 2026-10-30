<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<%@ page import = "com.bccl.util.Utility" %>
<%@ page import = "java.util.GregorianCalendar,java.util.Calendar,java.text.DecimalFormat" %>
<%@ page import = "java.io.*,jxl.*,java.util.*,jxl.write.DateFormat" %>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.IOException" %>
<%@ page import = "java.util.Locale" %>
<%@ page import = "jxl.CellView" %>
<%@ page import = "jxl.Workbook" %>
<%@ page import = "jxl.WorkbookSettings" %>
<%@ page import = "jxl.format.UnderlineStyle" %>
<%@ page import = "jxl.write.Formula" %>
<%@ page import = "jxl.write.Label" %>
<%@ page import = "jxl.write.Number" %>
<%@ page import = "jxl.write.WritableCellFormat" %>
<%@ page import = "jxl.write.WritableFont" %>
<%@ page import = "jxl.write.WritableSheet" %>
<%@ page import = "jxl.write.WritableWorkbook" %>
<%@ page import = "jxl.write.WriteException" %>
<%@ include file="includes/empHeader.jsp"%>


<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Purchase Approval Reports </title>
<link href="style/global.css" rel="stylesheet" type="text/css" />
<link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="style/popup.css" rel="stylesheet" type="text/css" />
<link href="css/template.css" rel="stylesheet">
<link href="style/calendarControl.css" rel="stylesheet">
<link href="style/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="jscripts/util.js"></script>
<script Language="JavaScript" src="jscripts/common.js"></script>
<script Language="JavaScript" src="jscripts/search.js"></script>
<script type="text/javascript" src="jscripts/jquery.js"></script>
<script Language="JavaScript" src="jscripts/reports.js"></script>


<%
Hashtable monthDataHash = new Hashtable();
ArrayList monthlyDataArr = new ArrayList();
ArrayList numIndex = new ArrayList();
ArrayList lstXls = new ArrayList(); 

String category = (String)request.getParameter("category");
String mainCategory = (String)request.getParameter("mainCategory");
String fromdate = (String)request.getParameter("fromdate");
String	todate = (String)request.getParameter("todate");
String status = (String)request.getParameter("status");
String month =	(String)request.getParameter("month");
String year =	(String)request.getParameter("year");
String pageVal = (String)session.getAttribute("page");
String totalAvg =(String)session.getAttribute("totalAvg");
String monthandyear  = "";
String finalDate = "";



String priceIddate = "";
String searchDate = "";
double arraysize = 0.0d;



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

	monthDataHash.put("TimescapeuseroidNew",(timescapeUserOId+""));

	monthlyDataArr = priceApprovalWebController.getMonthlyData(monthDataHash);
		arraysize = monthlyDataArr.size();	
		//out.println("arraysize--"+arraysize);

	StringBuffer csvContent = new StringBuffer();

String category1 = "";
String approvaldate = "";
String createdon = "";
String createdon1 = "";
String negotiation_value = "";
String savings = "";
String cost_avoidance = "";
String total_budget = "";
String balance_budget = "";
String totalrequest = "";
String savings_cost = "";
String savings_cost_val = "";
String savings_cost_total_final = "";
String avgDayDiff = "";
String headerStr = "";
String headerStr1 = "";
String avgDayDiff_val = "";



DecimalFormat f = new DecimalFormat("##");  


double totalrequest_total = 0.0d;
double negotiation_value_total = 0d;
double savings_total = 0.0d;
double cost_avoidance_total = 0.0d;
double total_budget_total = 0.0d;
double balance_budget_total = 0.0d;
double savings_cost_total = 0.0d;
double dayDiffVal = 0.0d;
double dayDiff_total = 0.0d;


String totalrequestMonthly_total_excel = "";
String negotiation_valueMonthly_total_excel = "";
String savingsMonthly_total_excel = "";
String cost_avoidanceMonthly_total_excel = "";
String savings_costMonthly_total_final_excel = "";
String dayDiff_total_final_excel = "";

String fileName = "PriceApprovalMonthlyReport.csv";

DecimalFormat df = new DecimalFormat("0"); 

 if(monthlyDataArr.size() > 0){

	for(int i=0;i < monthlyDataArr.size();i++){

		String [] tmpArr = (String[])monthlyDataArr.get(i);

		totalrequest = tmpArr[0];
		negotiation_value = tmpArr[1];
		savings = tmpArr[2];
		cost_avoidance = tmpArr[3];
		//createdon = tmpArr[4];
		avgDayDiff = tmpArr[4];
		createdon = tmpArr[5];
		createdon1 = tmpArr[6];
		dayDiffVal = Double.parseDouble(avgDayDiff);
		//totalReqAvg = Double.parseDouble(totalrequest_total);
		
		
		totalrequest_total = totalrequest_total + Double.parseDouble(totalrequest);
		negotiation_value_total = negotiation_value_total + Double.parseDouble(negotiation_value);
		savings_total = savings_total + Double.parseDouble(savings);
		cost_avoidance_total = cost_avoidance_total + Double.parseDouble(cost_avoidance);	
		dayDiff_total = dayDiff_total + dayDiffVal;	
	
		savings_cost_val = df.format(Double.parseDouble(savings) + Double.parseDouble(cost_avoidance));
		avgDayDiff_val = f.format(dayDiffVal);
				
	    totalrequestMonthly_total_excel = df.format(totalrequest_total);
	    negotiation_valueMonthly_total_excel = df.format(negotiation_value_total);
	    savingsMonthly_total_excel = df.format(savings_total);
	    cost_avoidanceMonthly_total_excel = df.format(cost_avoidance_total);
	    savings_cost_total  = savings_cost_total + Double.parseDouble(savings_cost_val );
	    savings_costMonthly_total_final_excel = df.format(savings_cost_total);
		
		 monthandyear = (createdon +"-"+ createdon1);
		 SimpleDateFormat format1 = new SimpleDateFormat("MM-yy");
	SimpleDateFormat format2 = new SimpleDateFormat("MMM-yy");

	Date dt1  = format1.parse(monthandyear);
	finalDate = format2.format(dt1);
	
	   // dayDiff_total_final_excel = df.format(dayDiff_total);

	   //cost_avoidanceMonthly_total_excel="0".equals() ? "-" : cost_avoidanceMonthly_total_excel;

	//out.println("dayDiff_total--"+dayDiff_total);

	//negotiation_value start
	int len = negotiation_value.length();
	
		String temp = "";
			
		int lenCount = len-1;

		int counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + negotiation_value.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			negotiation_value = temp;
			
		
		} //negotiation_value end

		//savings start
				 len = savings.length();
	

		 temp = "";
			
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
				
				temp = temp + savings.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			savings = temp;
			} //savings end

			
			
			//cost_avoidance start
				 len = cost_avoidance.length();
	

		 temp = "";
			
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
				
				temp = temp + cost_avoidance.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			cost_avoidance = temp;
			} //cost_avoidance end


			//cost_avoidance start
				 len = savings_cost_val.length();
	

		 temp = "";
			
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
				
				temp = temp + savings_cost_val.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			savings_cost_val = temp;
			} //savings_cost_val end


				 headerStr = "Month-Year,Total Requests,Negotiated Value,Hard Savings,Cost Avoidance,Total Savings,Avg Processing Duration (in days) \n";

				  String[] xlsArray = {finalDate,totalrequest,negotiation_value,savings,cost_avoidance,savings_cost_val,avgDayDiff_val};
					
				lstXls.add(xlsArray);
	}

	dayDiff_total_final_excel = f.format(dayDiff_total/arraysize);

	//negotiation_valueMonthly_total_excel start
	int len = negotiation_valueMonthly_total_excel.length();
	

		String temp = "";
			
		int lenCount = len-1;

		int counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + negotiation_valueMonthly_total_excel.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			negotiation_valueMonthly_total_excel = temp;
			
		
		} //negotiation_valueMonthly_total_excel end
		

		//savingsMonthly_total_excel start
	 len = savingsMonthly_total_excel.length();
	
		 temp = "";
			
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
				
				temp = temp + savingsMonthly_total_excel.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			savingsMonthly_total_excel = temp;
			
		
		} //savingsMonthly_total_excel end

		//cost_avoidanceMonthly_total_excel start
	 len = cost_avoidanceMonthly_total_excel.length();
	

		 temp = "";
			
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
				
				temp = temp + cost_avoidanceMonthly_total_excel.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			cost_avoidanceMonthly_total_excel = temp;
			
		
		} //cost_avoidanceMonthly_total_excel end
		

		//savings_costMonthly_total_final_excel start
	 len = savings_costMonthly_total_final_excel.length();
	

		 temp = "";
			
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
				
				temp = temp + savings_costMonthly_total_final_excel.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			savings_costMonthly_total_final_excel = temp;
			
		
		} //savings_costMonthly_total_final_excel end 

		String xlsArray1 [] = {"Total/Average",totalrequestMonthly_total_excel,negotiation_valueMonthly_total_excel,savingsMonthly_total_excel,cost_avoidanceMonthly_total_excel,savings_costMonthly_total_final_excel,dayDiff_total_final_excel};
						
		lstXls.add(xlsArray1);
 }

		StringBuffer requests = Utility.toStringBuffer(lstXls, numIndex);
	
		csvContent.append(headerStr).append(requests);
		
		PrintWriter writer = null;
		response.setContentType("text/csv");
		response.setHeader("Content-disposition","attachment;filename="+fileName);
		writer = response.getWriter();
		writer.println(csvContent);
		writer.flush();
		writer.close();

%>

			