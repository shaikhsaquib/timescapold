<%--
 -- @(#)governanceExcelReports1.jsp - 11-APR-2011
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Reports 1 Page of Governance.
 -- @author  -  Sachin Mehta
 -- @version -  1.0
 -- This page is used forr initial declaration by employee
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<%@ page import = "com.bccl.util.Utility" %>
<%@ page import = "java.util.GregorianCalendar,java.util.Calendar" %>
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
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%

//ArrayList  usersList = (ArrayList) session.getAttribute("naReportResult");
	ArrayList  usersList = new ArrayList();

    ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
	String[] listArray = null;
    String headerStr = "";
	String fileName = "Report.csv";
	StringBuffer csvContent = new StringBuffer();

	String priceid   =   "";
	String vendorname   =   "";
	String CATEGORY   =   "";
	String mill   =   "";
	String paymentterms   =   "";
	String sourcing   =   "";
	String quantity   =   "";
	String deliveryin   =   "";
	String quality   =   "";
	String gsm   =   "";
	String thislotcfr_india   =   "";
	String invoice_price   =   "";
	String risi_cfr_india   =   "";
	String aopreceiptprice   =   "";
	String aopreceiptforex   =   "";
	String aopdealvalue   =   "";
	String annualbudget   =   "";
	String contractedtonsytd   =   "";
	String currentquarter   =   "";
	String balancetobought   =   "";
	String otherremaks   =   "";
	String marketevent   =   "";
	String status   =   "";
	String totalprice_unitrate   =   "";
	String totalprice_rsperton   =   "";
	String totalprice_spend   =   "";
	String customsduty_unitrate   =   "";
	String customsduty_rsperton   =   "";
	String customsduty_spend   =   "";
	String freight_unitrate   =   "";
	String freight_rsperton   =   "";
	String freight_spend   =   "";
	String insurance_unitrate   =   "";
	String insurance_rsperton   =   "";
	String insurance_spend   =   "";
	String totalactualcost_unitrate   =   "";
	String totalactualcost_rsperton   =   "";
	String totalactualcost_spend   =   "";
	String budgetvsactual_unitrate   =   "";
	String quarteropeningquantity   =   "";
	String quarteropeningdays   =   "";
	String expectedreceiptsquantity   =   "";
	String expectedreceiptsdays   =   "";
	String estimatedcons1   =   "";
	String estimatedcons2   =   "";
	String quarterend1   =   "";
	String quarterend2   =   "";
	String approver1name   =   "";
	String approver2name   =   "";
	String approver3name   =   "";
	String approver4name   =   "";
	String approver5name   =   "";
	String approver6name   =   "";
	String initiatorname   =   "";
	String createdondate   =   "";
    


				usersList =  priceApprovalWebController.viewAllDetailsNp();
				//usersList =  priceApprovalWebController.viewAllDetailsNpPending();
				

                for(int ii=0;ii<usersList.size();ii++)

                        {
                            String tempArr[] = (String[])usersList.get(ii);

                            priceid = tempArr[0];
							vendorname = tempArr[1];
							CATEGORY = tempArr[2];
							mill = tempArr[3];
							paymentterms = tempArr[4];
							sourcing = tempArr[5];
							quantity = tempArr[6];
							deliveryin = tempArr[7];
							quality = tempArr[8];
							gsm = tempArr[9];
							thislotcfr_india = tempArr[10];
							invoice_price = tempArr[11];
							risi_cfr_india = tempArr[12];
							aopreceiptprice = tempArr[13];
							aopreceiptforex = tempArr[14];
							aopdealvalue = tempArr[15];
							annualbudget = tempArr[16];
							contractedtonsytd = tempArr[17];
							currentquarter = tempArr[18];
							balancetobought = tempArr[19];
							otherremaks = tempArr[20];
							marketevent = tempArr[21];
							status = tempArr[28];
							totalprice_unitrate = tempArr[29];
							totalprice_rsperton = tempArr[30];
							totalprice_spend = tempArr[31];
							customsduty_unitrate = tempArr[32];
							customsduty_rsperton = tempArr[33];
							customsduty_spend = tempArr[34];
							freight_unitrate = tempArr[35];
							freight_rsperton = tempArr[36];
							freight_spend = tempArr[37];
							insurance_unitrate = tempArr[38];
							insurance_rsperton = tempArr[39];
							insurance_spend = tempArr[40];
							totalactualcost_unitrate = tempArr[41];
							totalactualcost_rsperton = tempArr[42];
							totalactualcost_spend = tempArr[43];
							budgetvsactual_unitrate = tempArr[44];
							quarteropeningquantity = tempArr[45];
							quarteropeningdays = tempArr[46];
							expectedreceiptsquantity = tempArr[47];
							expectedreceiptsdays = tempArr[48];
							estimatedcons1 = tempArr[49];
							estimatedcons2 = tempArr[50];
							quarterend1 = tempArr[51];
							quarterend2 = tempArr[52];
							approver1name = tempArr[53];
							approver2name = tempArr[54];
							approver3name = tempArr[55];
							approver4name = tempArr[56];
							approver5name = tempArr[57];
							approver6name = tempArr[58];
							initiatorname = tempArr[59];
							createdondate = tempArr[60];


    headerStr = "PRICEID, VENDORNAME, CATEGORY, MILL, PAYMENTTERMS, SOURCING, QUANTITY, DELIVERYIN, QUALITY, GSM, THISLOTCFR_INDIA, INVOICE_PRICE, RISI_CFR_INDIA, AOPRECEIPTPRICE, AOPRECEIPTFOREX, AOPDEALVALUE, ANNUALBUDGET, CONTRACTEDTONSYTD, CURRENTQUARTER, BALANCETOBOUGHT, OTHERREMAKS, MARKETEVENT, STATUS, TOTALPRICE_UNITRATE, TOTALPRICE_RSPERTON, TOTALPRICE_SPEND, CUSTOMSDUTY_UNITRATE, CUSTOMSDUTY_RSPERTON, CUSTOMSDUTY_SPEND, FREIGHT_UNITRATE, FREIGHT_RSPERTON, FREIGHT_SPEND, INSURANCE_UNITRATE, INSURANCE_RSPERTON, INSURANCE_SPEND, TOTALACTUALCOST_UNITRATE, TOTALACTUALCOST_RSPERTON, TOTALACTUALCOST_SPEND, BUDGETVSACTUAL_UNITRATE, QUARTEROPENINGQUANTITY, QUARTEROPENINGDAYS, EXPECTEDRECEIPTSQUANTITY, EXPECTEDRECEIPTSDAYS, ESTIMATEDCONS1, ESTIMATEDCONS2, QUARTEREND1, QUARTEREND2, APPROVER1NAME, APPROVER2NAME, APPROVER3NAME, APPROVER4NAME, APPROVER5NAME, APPROVER6NAME, INITIATORNAME, CREATEDONDATE \n";

    String[] xlsArray = {priceid, vendorname, CATEGORY, mill, paymentterms, sourcing, quantity, deliveryin, quality, gsm, thislotcfr_india, invoice_price, risi_cfr_india, aopreceiptprice, aopreceiptforex, aopdealvalue, annualbudget, contractedtonsytd, currentquarter, balancetobought, otherremaks, marketevent, status, totalprice_unitrate, totalprice_rsperton, totalprice_spend, customsduty_unitrate, customsduty_rsperton, customsduty_spend, freight_unitrate, freight_rsperton, freight_spend, insurance_unitrate, insurance_rsperton, insurance_spend, totalactualcost_unitrate, totalactualcost_rsperton, totalactualcost_spend, budgetvsactual_unitrate, quarteropeningquantity, quarteropeningdays, expectedreceiptsquantity, expectedreceiptsdays, estimatedcons1, estimatedcons2, quarterend1, quarterend2, approver1name, approver2name, approver3name, approver4name, approver5name, approver6name, initiatorname, createdondate};

					lstXls.add(xlsArray);
				
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



