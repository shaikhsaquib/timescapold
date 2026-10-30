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
<%@ page import = "jxl.write.biff.RowsExceededException" %>
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
ArrayList priceIdData = new ArrayList();
ArrayList numIndex = new ArrayList();
String category = (String)request.getParameter("category");
out.println("category"+category);
String mainCategory = (String)request.getParameter("mainCategory");
out.println("mainCategory"+mainCategory);
String status = (String)request.getParameter("status");
String fromdate = (String)request.getParameter("fromdate");
//out.println("fromdate"+fromdate);
//String newStatus = (String)request.getParameter("newStatus");
String finalDate = (String)request.getParameter("finalDate")==null?"":(String)request.getParameter("finalDate");
String test = "";
//out.println("test--"+test);
//out.println("finalDate-"+finalDate);
//String test1 = "1";
String price2 = "";
String allCategory = "";
String allCategory1 = "";
String specificCategory = "";


String todate = (String)request.getParameter("todate");
//out.println("todate"+todate);
String month = (String)request.getParameter("month");
String year = (String)request.getParameter("year");

//String monthyear = (String)request.getParameter("monthyear");

String searchDate = "";
String priceIddate = "";

//priceIdData = priceApprovalWebController.getpriceIdData(category);

Hashtable priceIdReportHash = new Hashtable();

if(category != null && !"0".equals(category) && !"".equals(category)){
	priceIdReportHash.put("CATEGORY",category);
}

priceIdReportHash.put("STATUS",status);
//priceIdReportHash.put("TEST1",test1);
//priceIdReportHash.put("MONTHYEAR",monthyear);


if(fromdate!=null && !"0".equals(fromdate) && !"".equals(fromdate)){

	priceIdReportHash.put("FROMDATE",fromdate);
	}

	if(todate!=null && !"0".equals(todate) && !"".equals(todate))
	{
	priceIdReportHash.put("TODATE",todate);
	}

	/*if(status!=null && !status.equals("0") && !status.equals(""))
	{
	priceIdReportHash.put("STATUS",status);

	}*/

	if(month!=null && !"0".equals(month) && !"".equals(month))
	{
		priceIdReportHash.put("MONTH",month);

	}

	if(year!=null && !"0".equals(year) && !"".equals(year))
	{
	priceIdReportHash.put("YEAR",year);
	}
	//System.out.println("status"+status);
	
//out.println("priceIdReportHash--"+priceIdReportHash);
	

	priceIddate = month + "-" + year;
	


if(month!=null && !month.equals("0") && !month.equals("") && year!=null && !year.equals("0") && !year.equals(""))
	{
//priceIdReportHash.put("PRICEIDDATE",priceIddate);
	}
	//sout.println("priceIddate--"+priceIddate);


	priceIdReportHash.put("TimescapeuseroidNew",(timescapeUserOId+""));

	if(fromdate!=null && !fromdate.equals("0") && !fromdate.equals("") && todate!=null && !todate.equals("0") && !todate.equals(""))
	{
		test = "1";
		//priceIdReportHash.put("FROMDATE",fromdate);
		//priceIdReportHash.put("TODATE",todate);
		priceIdReportHash.put("TEST",test);
	}
	 if(!("".equals(finalDate))){
			price2 = "1";
		//priceIdReportHash.put("FINALDATE",finalDate);
		priceIdReportHash.put("PRICE2",price2);
		}

priceIdReportHash.put("FINALDATE",finalDate);
//if(!(mainCategory.equals(""))){

	System.out.println("mainCategory-----"+mainCategory);
	System.out.println("category-----"+category);
/*if(mainCategory.equals("All") && category==null){

	 		allCategory = "1";
	priceIdReportHash.put("ALLCATEGORY",allCategory);
} else
if(!(category.equals("")) && mainCategory.equals("All")    )
{
	allCategory1 = "0";
	priceIdReportHash.put("ALLCATEGORY1",allCategory1);
}*/

if("All".equals(mainCategory) && !("".equals(category)) &&  category!=null)
{
	allCategory1 = "0";
	priceIdReportHash.put("ALLCATEGORY1",allCategory1);
}else if("All".equals(mainCategory) && category==null){

	 		allCategory = "1";
	priceIdReportHash.put("ALLCATEGORY",allCategory);
}else {
	if(!"".equals(category)){
	specificCategory = "0";
	priceIdReportHash.put("SPECIFICCATEGORY",specificCategory);
	}
	}



//}
//out.println("priceIdReportHash--"+priceIdReportHash);
	

String priceid = "";
String modifiedon = "";
String negotiation_value = "";
String savings = "";
String cost_avoidance = "";
String total_budget = "";
String balance_budget = "";
String headerStr = "";
String headerStr1 = "";
String actualDiff11 = "";
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
String projectname = "";
String finalizedVendorName = "";
String packageNameSanction = "";
String poCommittedTillDate = "";
String validityPeriod = "";
String indentedUser = "";
String initiatedOn = "";
String sanctionedReferenceType = "";
String referenceNumber = "";
String dateOfApproval = "";
String negotiationPcDate = "";
String paymentTerms = "";
String priceCategory = "";
String createdby = "";


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
String abc1ReportVal = "";
String emailid1 = "";
String emailid2 = "";
String emailid3 = "";
String emailid4 = "";
String emailid5 = "";
String emailid6 = "";
String emailid7 = "";
String emailid8 = "";
String emailid9 = "";
String emailid10 = "";
String emailid11 = "";
String emailid12 = "";
String emailid13 = "";
String emailid14 = "";
String emailid15 = "";
String emailid16 = "";
String emailid17 = "";

String abc0Val = "";
String abc1Val = "";
String abc2Val = "";
String abc3Val = "";
String abc4Val = "";
String abc5Val = "";
String abc6Val = "";
String abc7Val = "";
String abc8Val = "";
String abc9Val = "";
String abc10Val = "";
String abc11Val = "";
String abc12Val = "";
String abc13Val = "";
String abc14Val = "";
String abc15Val = "";
String abc16Val = "";
String abc17Val = "";

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
int glbValue1 = 0;
String finalVal = "0";
StringBuffer csvContent = new StringBuffer();

ArrayList lstXls = new ArrayList(); 

double negotiation_value_total = 0.0d;
double savings_total = 0.0d;
double cost_avoidance_total = 0.0d;
double total_budget_total = 0.0d;
double balance_budget_total = 0.0d;
double savings_cost_total = 0.0d;
double roundOff = 0.0d;
DecimalFormat df = new DecimalFormat("0"); 


String totalrequest_total_price_excel = "";
String negotiation_value_total_price_excel = "";
String savings_total__price_excel = "";
String cost_avoidance_total_price_excel = "";
String total_budget_total__price_excel = "";
String balance_budget_price_excel = "";
String savings_cost_val_excel = "";
String savings_cost_total_final = "";

String negotiation_value_total_final = "";
String savings_total_final = "";
String cost_avoidance_total_final = "";
String total_budget_total_final = "";
String balance_budget_total_final = "";
String createdon = "";
String daydiff = "";
String newStatus = "";



String fileName = "PriceApprovalPriceIdReport.csv";

//DecimalFormat df = new DecimalFormat("0.00"); 

priceIdData = priceApprovalWebController.getpriceIdData(priceIdReportHash);
out.println("priceIdData--"+priceIdData.size());

if(priceIdData.size() > 0){
	
		//priceIdReportHash.put("TEST",test);
		for(int i=0;i < priceIdData.size();i++){

			 String [] tmpArr1 = (String[])priceIdData.get(i);

				priceid = tmpArr1[0];
				modifiedon = tmpArr1[1];
				negotiation_value =  tmpArr1[2]==null ? "0" : tmpArr1[2];
				savings = tmpArr1[3]==null ? "0" : tmpArr1[3];
				cost_avoidance =tmpArr1[4]==null ? "0" : tmpArr1[4];
				//out.println("savings--"+savings);
				total_budget = tmpArr1[5]==null ? "0" : tmpArr1[5];
				balance_budget =tmpArr1[6]==null ? "0" : tmpArr1[6];
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
				projectname = tmpArr1[44] == null ? "-" : tmpArr1[44];
				finalizedVendorName = tmpArr1[45] == null ? "-" : tmpArr1[45];
				packageNameSanction = tmpArr1[46] == null ? "-" : tmpArr1[46];
				validityPeriod = tmpArr1[47] == null ? "-" : tmpArr1[47];
				poCommittedTillDate = tmpArr1[48] == null ? "-" : tmpArr1[48];
				
				emailid1 = tmpArr1[49];
				emailid2 = tmpArr1[50];
				emailid3 = tmpArr1[51];
				emailid4 = tmpArr1[52];
				emailid5 = tmpArr1[53];
				emailid6 = tmpArr1[54];
				emailid7 = tmpArr1[55];
				emailid8 = tmpArr1[56];
				emailid9 = tmpArr1[57];
				emailid10 = tmpArr1[58];
				emailid11 = tmpArr1[59];
				emailid12 = tmpArr1[60];
				emailid13 = tmpArr1[61];
				emailid14 = tmpArr1[62];
				emailid15 = tmpArr1[63];
				emailid16 = tmpArr1[64];
				emailid17 = tmpArr1[65];
				indentedUser = tmpArr1[66] == null ? "-" : tmpArr1[66];
				initiatedOn = tmpArr1[67] == null ? "-" : tmpArr1[67];
				sanctionedReferenceType = tmpArr1[68] == null ? "-" : tmpArr1[68];
				referenceNumber = tmpArr1[69] == null ? "-" : tmpArr1[69];
				dateOfApproval = tmpArr1[70] == null ? "-" : tmpArr1[70];
				negotiationPcDate = tmpArr1[71] == null ? "-" : tmpArr1[71];
				paymentTerms = tmpArr1[72] == null ? "-" : tmpArr1[72];
				priceCategory = tmpArr1[73] == null ? "-" : tmpArr1[73];
				createdby = tmpArr1[74] == null ? "-" : tmpArr1[74];
					//out.println("negotiationPcDate-"+negotiationPcDate);		
				negotiation_value_total = negotiation_value_total + Double.parseDouble(negotiation_value);
				savings_total = savings_total + Double.parseDouble(savings);
				cost_avoidance_total = cost_avoidance_total + Double.parseDouble(cost_avoidance);
				total_budget_total = total_budget_total + Double.parseDouble(total_budget);
				balance_budget_total = balance_budget_total + Double.parseDouble(balance_budget);
				savings_cost_val_excel = df.format(Double.parseDouble(savings) + Double.parseDouble(cost_avoidance));
				savings_cost_total  = savings_cost_total + Double.parseDouble(savings_cost_val_excel );

				if(newStatus.equals("L"))
				{
					newStatus = "In Process";
				}

				if(newStatus.equals("CL"))
				{
					newStatus = "Approved";
				}

				abc0  = Integer.parseInt(actualDiff11);
				if(Integer.parseInt(actualDiff11) != 0){
					glbValue1 = Integer.parseInt(actualDiff11);
				}
			
				abc1  = Integer.parseInt(actualDiff21) - glbValue1;
				if(Integer.parseInt(actualDiff21) != 0){
				glbValue1 = Integer.parseInt(actualDiff21);
				}
				
				
				abc2  = Integer.parseInt(actualDiff31) - glbValue1;


				if(Integer.parseInt(actualDiff31) != 0){
				glbValue1 = Integer.parseInt(actualDiff31);
				}
				abc3  = Integer.parseInt(actualDiff12) - glbValue1;


				if(Integer.parseInt(actualDiff12) != 0){
				glbValue1 = Integer.parseInt(actualDiff12);
				}
				abc4  = Integer.parseInt(actualDiff22) - glbValue1;


				if(Integer.parseInt(actualDiff22) != 0){
				glbValue1 = Integer.parseInt(actualDiff22);
				}
				
				abc5  = Integer.parseInt(actualDiff32) - glbValue1;
		

				if(Integer.parseInt(actualDiff32) != 0){
				glbValue1 = Integer.parseInt(actualDiff32);
				}
				abc6  = Integer.parseInt(actualDiff13) - glbValue1;

				if(Integer.parseInt(actualDiff13) != 0){
					glbValue1 = Integer.parseInt(actualDiff13);
				}
			
				abc7  = Integer.parseInt(actualDiff23) -  glbValue1;
				
				if(Integer.parseInt(actualDiff23) != 0){
					glbValue1 = Integer.parseInt(actualDiff23);
				}
				abc8  = Integer.parseInt(actualDiff33) - glbValue1;
				
				if(Integer.parseInt(actualDiff33) != 0){
				glbValue1 = Integer.parseInt(actualDiff33);
				}
				abc9  = Integer.parseInt(actualDiff34) - glbValue1;

				if(Integer.parseInt(actualDiff34) != 0){
				glbValue1 = Integer.parseInt(actualDiff34);
				}

				abc10 = Integer.parseInt(actualDiff35) - glbValue1;

				if(Integer.parseInt(actualDiff35) != 0){
				glbValue1 = Integer.parseInt(actualDiff35);
				}

				abc11 = Integer.parseInt(actualDiff36) - glbValue1;

				if(Integer.parseInt(actualDiff36) != 0){
				glbValue1 = Integer.parseInt(actualDiff36);
				}

				abc12 = Integer.parseInt(actualDiff4) - glbValue1;

				if(Integer.parseInt(actualDiff4) != 0){
					glbValue1 = Integer.parseInt(actualDiff4);
				}

				abc13 = Integer.parseInt(actualDiff5) - glbValue1;

				if(Integer.parseInt(actualDiff5) != 0){
				glbValue1 = Integer.parseInt(actualDiff5);
				}
				abc14 = Integer.parseInt(actualDiff6) - glbValue1;

				
				if(Integer.parseInt(actualDiff6) != 0){
				glbValue1 = Integer.parseInt(actualDiff6);
				}
				

				abc15 = Integer.parseInt(actualDiff7) - glbValue1;

				if(Integer.parseInt(actualDiff7) != 0  ){
					
				glbValue1 = Integer.parseInt(actualDiff7);
				
				}
				
				abc16 = Integer.parseInt(actualDiff8) - glbValue1;
				
				boolean flag1 = false;
				
				abc0Val = Integer.toString(abc0);
				abc1Val = Integer.toString(abc1);
				abc2Val = Integer.toString(abc2);
				abc3Val = Integer.toString(abc3);
				abc4Val = Integer.toString(abc4);
				abc5Val = Integer.toString(abc5);
				abc6Val = Integer.toString(abc6);
				abc7Val = Integer.toString(abc7);
				abc8Val = Integer.toString(abc8);
				abc9Val = Integer.toString(abc9);
				abc10Val = Integer.toString(abc10);
				abc11Val = Integer.toString(abc11);
				abc12Val = Integer.toString(abc12);
				abc13Val = Integer.toString(abc13);
				abc14Val = Integer.toString(abc14);
				abc15Val = Integer.toString(abc15);
				abc16Val = Integer.toString(abc16);
							
				
					
			 if(!(abc16Val.equals("0")) ){
					flag1 = true;
					finalVal = abc16Val;
					}
			 else if(!(abc15Val.equals("0")) ){
					flag1 = true;
					finalVal = abc15Val;
			}	
			else if(!(abc14Val.equals("0")) ){
					flag1 = true;
					finalVal = abc14Val;
			}
			else if(!(abc13Val.equals("0")) ){
					flag1 = true;
					finalVal = abc13Val;
			}
			else if(!(abc12Val.equals("0")) ){
					flag1 = true;
					finalVal = abc12Val;
			}
			else if(!(abc11Val.equals("0")) ){
					flag1 = true;
					finalVal = abc11Val;
			}
			else if(!(abc10Val.equals("0")) ){
					flag1 = true;
					finalVal = abc10Val;
			}
		   else if(!(abc9Val.equals("0")) ){
					flag1 = true;
					finalVal = abc9Val;
			}
			else if(!(abc8Val.equals("0")) ){
					flag1 = true;
					finalVal = abc8Val;
			}
			else if(!(abc7Val.equals("0")) ){
					flag1 = true;
					finalVal = abc7Val;
			}
			else if(!(abc6Val.equals("0")) ){
					flag1 = true;
					finalVal = abc6Val;
			}
			else if(!(abc5Val.equals("0")) ){
					flag1 = true;
					finalVal = abc5Val;
			}
			else if(!(abc4Val.equals("0")) ){
					flag1 = true;
					finalVal = abc4Val;
			}
			else if(!(abc3Val.equals("0")) ){
					flag1 = true;
					finalVal = abc3Val;
			}
			else if(!(abc2Val.equals("0")) ){
					flag1 = true;
					finalVal = abc2Val;
			}
			else if(!(abc1Val.equals("0")) ){
					flag1 = true;
					finalVal = abc1Val;
			}
			if(!(abc0Val.equals("0")) ){
					flag1 = true;
					finalVal = abc0Val;
				}

			//abc0Val="0".equals(apr11) ? "-" : Integer.valueOf(abc1Val) < 0 ? "0" : abc1Val;
			
			abc0Val="0".equals(apr11) ? "-" : Integer.valueOf(abc0Val) < 0 ? "0" : abc0Val;
			abc1Val="0".equals(apr21) ? "-" : Integer.valueOf(abc1Val) < 0 ? "0" : abc1Val;
			abc2Val="0".equals(apr31) ? "-" : Integer.valueOf(abc2Val) < 0 ? "0" : abc2Val;
			abc3Val="0".equals(apr12) ? "-" : Integer.valueOf(abc3Val) < 0 ? "0" : abc3Val;
			abc4Val="0".equals(apr22) ? "-" : Integer.valueOf(abc4Val) < 0 ? "0" : abc4Val;
			abc5Val="0".equals(apr32) ? "-" : Integer.valueOf(abc5Val) < 0 ? "0" : abc5Val;
			abc6Val="0".equals(apr13) ? "-" : Integer.valueOf(abc6Val) < 0 ? "0" : abc6Val;
			abc7Val="0".equals(apr23) ? "-" : Integer.valueOf(abc7Val) < 0 ? "0" : abc7Val;
			abc8Val="0".equals(apr33) ? "-" : Integer.valueOf(abc8Val) < 0 ? "0" : abc8Val;
			abc9Val="0".equals(apr34) ? "-" : Integer.valueOf(abc9Val) < 0 ? "0" : abc9Val;
			abc10Val="0".equals(apr35) ? "-" : Integer.valueOf(abc10Val) < 0 ? "0" : abc10Val;
			abc11Val="0".equals(apr36) ? "-" : Integer.valueOf(abc11Val) < 0 ? "0" : abc11Val;
			abc12Val="0".equals(apr4) ? "-" : Integer.valueOf(abc12Val) < 0 ? "0" : abc12Val;
			abc13Val="0".equals(apr5) ? "-" : Integer.valueOf(abc13Val) < 0 ? "0" : abc13Val;
			abc14Val="0".equals(apr6) ? "-" : Integer.valueOf(abc14Val) < 0 ? "0" : abc14Val ;
			abc15Val="0".equals(apr7) ? "-" : Integer.valueOf(abc15Val) < 0 ? "0" : abc15Val;
			finalVal="0".equals(apr8) ? "-" : Integer.valueOf(finalVal) < 0 ? "0" : finalVal;
			

			//totalrequest_total_excel = Double.toString(totalrequest_total);
			/*negotiation_value_total_price_excel = Double.toString(negotiation_value_total);
			savings_total__price_excel = Double.toString(savings_total);
			cost_avoidance_total_price_excel = Double.toString(cost_avoidance_total);
			total_budget_total__price_excel = Double.toString(total_budget_total);
			balance_budget_price_excel = Double.toString(balance_budget_total);*/
		
		
		negotiation_value_total_final= df.format(negotiation_value_total);
		savings_total_final= df.format(savings_total);
		cost_avoidance_total_final= df.format(cost_avoidance_total);
		total_budget_total_final = df.format(total_budget_total);
		balance_budget_total_final = df.format(balance_budget_total);
		savings_cost_total_final = df.format(savings_cost_total);


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


			//savings_cost_val_excel start
				 len = savings_cost_val_excel.length();
	

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
				
				temp = temp + savings_cost_val_excel.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			savings_cost_val_excel = temp;
			} //savings_cost_val_excel end



			//total_budget start
				 len = total_budget.length();
	

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
		


	headerStr = "PAR Id,Category,Sanctioned Reference Type,Reference Number,Date Of Approval,Negotiation/Pc Meeting Date,Description,Finalized Vendor Name,  Project,Validity Period,PO Committed Till Date, Negotiated Value,Hard Savings,Cost Avoidance,Total Savings,Budget (Rs.) / Sanction,Payment Terms,Status,Createdon,Last Updated Date,Processing Duration(in days),Initiator Emailid,B&C User Level 1 Emailid,B&C User Level 1,B&C User Level 2 Emailid,B&C User Level 2,B&C User Level 3 Emailid,B&C User Level 3,User Level 1 Emailid,User Level 1 (Days),User Level 2 Emailid,User Level 2(Days),User Level 3 Emailid,User Level 3(Days),HR/Personnel Emailid,HR/Personnel(Days),Branch Head Emailid,Branch Head(Days),MAS 1 Emailid,MAS 1 (Days),MAS 2 Emailid,MAS 2 (Days),Finance 1 Emailid,Finance 1 (Days),Finance 2 Emailid,Finance 2 (Days) ,Director B&C Emailid,Director B&C (Days),COO (Publishing) Emailid,COO (Publishing) (Days),COO Emailid,COO (Days),CEO (Publishing) Emailid ,CEO (Publishing) (Days),Managing Director Emailid,Managing Director (Days) \n";
	

	/*String[] xlsArray = {priceid,negotiation_value,savings,cost_avoidance,savings_cost_val_excel,newStatus,createdon,modifiedon,daydiff,emailid1,abc0Val,emailid2,abc1Val,emailid3,abc2Val,emailid4,abc3Val,emailid5,abc4Val,emailid6,emailid11,abc5Val,emailid12,abc6Val,emailid6,abc7Val,emailid7,abc8Val,emailid8,abc9Val,emailid9,abc10Val,emailid10,abc10Val,emailid13,abc12Val,emailid14,abc13Val,emailid15,abc14Val,emailid16,abc15Val,emailid17,finalVal};*/
					  

	String[] xlsArray =
	{priceid,priceCategory,sanctionedReferenceType,referenceNumber,dateOfApproval,negotiationPcDate,projectname,finalizedVendorName,packageNameSanction,validityPeriod,poCommittedTillDate,negotiation_value,savings,cost_avoidance,savings_cost_val_excel,total_budget,paymentTerms,newStatus,createdon,modifiedon,daydiff,createdby,emailid1,abc0Val,emailid2,abc1Val,emailid3,abc2Val,emailid4,abc3Val,emailid5,abc4Val,emailid6,abc5Val,emailid11,abc6Val,emailid12,abc7Val,emailid7,abc8Val,emailid8,abc9Val,emailid9,abc10Val,emailid10,abc11Val,emailid13,abc12Val,emailid14,abc13Val,emailid15,abc14Val,emailid16,abc15Val,emailid17,finalVal};

					  lstXls.add(xlsArray);
		} ///end of for


			//negotiation_value_total_final start
				int len = negotiation_value_total_final.length();
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
				
				temp = temp + negotiation_value_total_final.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			negotiation_value_total_final = temp;
			} //negotiation_value_total_final end


			//savings_total_final start
				 len = savings_total_final.length();
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
				
				temp = temp + savings_total_final.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			savings_total_final = temp;
			} //savings_total_final end

			//cost_avoidance_total_final start
				 len = cost_avoidance_total_final.length();
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
				
				temp = temp + cost_avoidance_total_final.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			cost_avoidance_total_final = temp;
			} //cost_avoidance_total_final end



			//savings_cost_total_final start
				 len = savings_cost_total_final.length();
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
				
				temp = temp + savings_cost_total_final.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			savings_cost_total_final = temp;
			} //savings_cost_total_final end


			//total_budget_total_final start
				 len = total_budget_total_final.length();
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
				
				temp = temp + total_budget_total_final.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			total_budget_total_final = temp;
			} //total_budget_total_final end


				//balance_budget_total_final start
				 len = balance_budget_total_final.length();
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
				
				temp = temp + balance_budget_total_final.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			balance_budget_total_final = temp;
			} //balance_budget_total_final end
			

	String xlsArray1 [] = {"Total","","","","","","","","","","",negotiation_value_total_final,savings_total_final,cost_avoidance_total_final,savings_cost_total_final,total_budget_total_final,"","","",""};
						
					 lstXls.add(xlsArray1);


} //end of if

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

	