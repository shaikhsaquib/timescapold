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

Hashtable reportHash = new Hashtable();
ArrayList reportDataArr = new ArrayList();
ArrayList numIndex = new ArrayList();
String headerStr = "";
String headerStr1 = "";
ArrayList lstXls = new ArrayList(); 
String searchDate = "";

//String totalrequest = (String)request.getParameter("totalrequest");
String category = (String)request.getParameter("category");
String fromdate = (String)request.getParameter("fromdate");
String todate = (String)request.getParameter("todate");
String status = (String)request.getParameter("status");
String month = (String)request.getParameter("month");
//out.println("month"+month);

	String  year = (String)request.getParameter("year");
//out.println("category"+category);





//String totalrequest_total = (String)request.getParameter("totalrequest_total");
//out.println("----"+totalrequest);

StringBuffer csvContent = new StringBuffer();

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
String savings_cost_val = "";
String savings_cost_total_final = "";
String avg_dayDiff = "";

double totalrequest_total = 0.0d;
double negotiation_value_total = 0d;
double savings_total = 0.0d;
double cost_avoidance_total = 0.0d;
double total_budget_total = 0.0d;
double balance_budget_total = 0.0d;
double savings_cost_total = 0.0d;
double dayDiffVal = 0.0d;


String totalrequest_total_excel = "";
String negotiation_value_total_excel = "";
String savings_total_excel = "";
String cost_avoidance_total_excel = "";
String total_budget_total_excel = "";
String balance_budget_excel = "";
String savings_cost_total_final_excel = "";
String dayDiffAvg_final_excel = "";





String fileName = "PriceApprovalReport.csv";

DecimalFormat df = new DecimalFormat("0"); 
DecimalFormat f = new DecimalFormat("##");  

if(category!=null && !category.equals("0") && !category.equals("")){
	

	reportHash.put("CATEGORY",category);
	}
	if(fromdate!=null && !fromdate.equals("0") && !fromdate.equals("")){

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
	searchDate = month + "/" + year;

	
	if(month!=null && !month.equals("0") && !month.equals("") && year!=null && !year.equals("0") && !year.equals(""))
	{
	reportHash.put("SEARCHDATE",searchDate);
	}

	reportHash.put("TimescapeuseroidNew",(timescapeUserOId+""));
	reportDataArr = priceApprovalWebController.getReportsData(reportHash);
	//out.println("reportDataArr--"+reportDataArr.size());

	if(reportDataArr.size() > 0){
		//out.println("2");
	
	for(int i=0;i < reportDataArr.size();i++){
	
	 
				String [] tmpArr = (String[])reportDataArr.get(i);
	
				totalrequest = tmpArr[0]==null ? "0" : tmpArr[0];
				negotiation_value = tmpArr[1]==null ? "0" : tmpArr[1];
				savings = tmpArr[2]==null ? "0" : tmpArr[2];
				cost_avoidance = tmpArr[3]==null ? "0" : tmpArr[3];
				total_budget =tmpArr[4]==null ? "0" : tmpArr[4];
				balance_budget = tmpArr[5]==null ? "0" : tmpArr[5];
				avg_dayDiff = tmpArr[6]==null ? "0" : tmpArr[6];
				dayDiffVal = Double.parseDouble(avg_dayDiff);
				

				
				//int total = 0;
				

				//if(category.equals("All"))
				//	{
					//category1 = tmpArr[6];
					totalrequest_total = totalrequest_total + Double.parseDouble(totalrequest);
					negotiation_value_total = negotiation_value_total + Double.parseDouble(negotiation_value);
					savings_total = savings_total + Double.parseDouble(savings);
					cost_avoidance_total = cost_avoidance_total + Double.parseDouble(cost_avoidance);
					savings_cost_val = df.format(Double.parseDouble(savings) + Double.parseDouble(cost_avoidance));
					total_budget_total = total_budget_total + Double.parseDouble(total_budget);
					balance_budget_total = balance_budget_total + Double.parseDouble(balance_budget);
					 savings_cost_total  = savings_cost_total + Double.parseDouble(savings_cost_val );
				//savings_cost_total_final = df.format(savings_cost_total);
					//out.println("balance_budget_total--"+balance_budget_total);

					
					/* totalrequest_total_excel = Double.toString(totalrequest_total);
					 negotiation_value_total_excel = Double.toString(negotiation_value_total);
					 savings_total_excel = Double.toString(savings_total);
					 cost_avoidance_total_excel = Double.toString(cost_avoidance_total);
					 total_budget_total_excel = Double.toString(total_budget_total);
					 balance_budget_excel = Double.toString(balance_budget_total);*/
					totalrequest_total_excel = df.format(totalrequest_total);
					negotiation_value_total_excel= df.format(negotiation_value_total);
					savings_total_excel= df.format(savings_total);
					cost_avoidance_total_excel= df.format(cost_avoidance_total);
					total_budget_total_excel = df.format(total_budget_total);
					balance_budget_excel = df.format(balance_budget_total);
					savings_cost_total_final_excel = df.format(savings_cost_total);
					dayDiffAvg_final_excel  = f.format(dayDiffVal);


					 //negotiation_value start
				int len = negotiation_value.length();
	//out.println("len"+len);

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
			//out.println("--"+negotiation_value);
		
		} //negotiation_value end


		//savings start
				 len = savings.length();
	//out.println("len"+len);

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
	//out.println("len"+len);

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


			//savings_cost_val start
				 len = savings_cost_val.length();
	//out.println("len"+len);

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




			//total_budget start
				 len = total_budget.length();
	//out.println("len"+len);

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
				
				temp = temp + total_budget.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			total_budget = temp;
			} //total_budget end



			//balance_budget start
				 len = balance_budget.length();
	//out.println("len"+len);

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
				
				temp = temp + balance_budget.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			balance_budget = temp;
			} //balance_budget end

			headerStr = "Category,Total Requests,Negotiated Value,Hard Savings,Cost Avoidance,Total Savings,Avg Processing Duration (in days)\n";

					 if(category.equals("All"))
					{
					
	category1 = tmpArr[7];
	//avg_dayDiff = tmpArr[6]==null ? "0" : tmpArr[6];
	//dayDiffVal = Double.parseDouble(avg_dayDiff);
	//dayDiffAvg_final_excel = f.format(dayDiffVal);

						String[] xlsArray = {category1,totalrequest,negotiation_value,savings,cost_avoidance,savings_cost_val,dayDiffAvg_final_excel};
					  //out.println("balance_budget--"+balance_budget,"Total");

					  lstXls.add(xlsArray);
	

		}else{
				//avg_dayDiff = tmpArr[7]==null ? "0" : tmpArr[7];
				//dayDiffVal = Double.parseDouble(avg_dayDiff);
				//dayDiffAvg_final_excel = f.format(dayDiffVal);
		

					  String[] xlsArray = {category,totalrequest,negotiation_value,savings,cost_avoidance,savings_cost_val,dayDiffAvg_final_excel};
					  //out.println("balance_budget--"+balance_budget,"Total");

					  lstXls.add(xlsArray);
	   }
	}


	//negotiation_value_total_excel start
				int len = negotiation_value_total_excel.length();
	//out.println("len"+len);

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
				
				temp = temp + negotiation_value_total_excel.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			negotiation_value_total_excel = temp;
			} //negotiation_value_total_excel end


			//savings_total_excel start
				 len = savings_total_excel.length();
	//out.println("len"+len);

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
				
				temp = temp + savings_total_excel.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			savings_total_excel = temp;
			} //savings_total_excel end

			//cost_avoidance_total_excel start
				 len = cost_avoidance_total_excel.length();
	//out.println("len"+len);

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
				
				temp = temp + cost_avoidance_total_excel.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			cost_avoidance_total_excel = temp;
			} //cost_avoidance_total_excel end


				//savings_cost_total_final_excel start
				 len = savings_cost_total_final_excel.length();
	//out.println("len"+len);

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
				
				temp = temp + savings_cost_total_final_excel.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			savings_cost_total_final_excel = temp;
			} //savings_cost_total_final_excel end


			//total_budget_total_excel start
				 len = total_budget_total_excel.length();
	//out.println("len"+len);

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
				
				temp = temp + total_budget_total_excel.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			total_budget_total_excel = temp;
			} //total_budget_total_excel end


			//balance_budget_excel start
				 len = balance_budget_excel.length();
	//out.println("len"+len);

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
				
				temp = temp + balance_budget_excel.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			balance_budget_excel = temp;
			} //balance_budget_excel end




	String xlsArray1 [] = {"Total",totalrequest_total_excel,negotiation_value_total_excel,savings_total_excel,cost_avoidance_total_excel,savings_cost_total_final_excel};
						
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



