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
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>

<%--
	Make all your global declarations over here 
--%>

<%
	String currLink = "../common/insuranceExcelReports.jsp";
	String breadcrumbs = "";

	String hiddyear = (String) request.getParameter("hiddyear");
	System.out.println("hiddyear=="+hiddyear);

	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = "'YYYY'";
	objArr[2] = hiddyear;

	ArrayList insuranceHistory = new ArrayList();
	
	Hashtable searchHash = new Hashtable();
	searchHash.put("queryId", "1005");
	searchHash.put("arguments", objArr);

	
	insuranceHistory = insuranceClaimController.viewClaimRequest(searchHash);	

    writeXLSFile(insuranceHistory,hiddyear);
	response.sendRedirect("../common/download.jsp?f=Insurance_Claim_Data_"+hiddyear+".csv");
	System.out.println("Insurance History="+insuranceHistory.size());

%>
	
<%!

public void writeXLSFile(ArrayList insuranceHistory,String hiddyear)
{
%>
<jsp:useBean id ="xmlObj" class ="com.bccl.util.XMLUtility"/>
<%!	
	System.out.println("--- writeXLSFile() ---");
	System.out.println("Insurance History="+insuranceHistory.size());
	try
	{
	System.out.println("report type="+hiddyear);
	
	File file = new File("Insurance_Claim_Data_"+hiddyear+".csv");
	
	WorkbookSettings wbSettings = new WorkbookSettings();
	wbSettings.setLocale(new Locale("en", "EN"));
	//wbSettings.setUseTemporaryFileDuringWrite(true);   
	WritableWorkbook workbook = Workbook.createWorkbook(file, wbSettings);
	workbook.createSheet("Report", 0);
	WritableSheet sheet = workbook.getSheet(0);

	WritableFont headerFont = new WritableFont (WritableFont.TIMES, 10,WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE );
	WritableCellFormat headerCells = new WritableCellFormat(headerFont);
	//headerCells.setBackground(Colour.TAN);
	int column = 0;
	Label label = new Label(0,0,"Insurance Company",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(1,0,"Legal Entity",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(2,0,"Claim Number",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(3,0,"Item",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(4,0,"Type of Policy",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(5,0,"Date of Loss",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(6,0,"Place of Loss",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(7,0,"Description",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(8,0,"Amount of Loss",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(9,0,"Remarks",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(10,0,"Cheque Number",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(11,0,"Amount",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(12,0,"Received On",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(13,0,"Status",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	column ++;

	WritableFont normalFont = new WritableFont(WritableFont.TIMES, 10);
	WritableCellFormat normalCell = new WritableCellFormat(normalFont);


 for (int col=column;col < insuranceHistory.size()+1;col++)
	{
		String insuranceHistoryArr[] = (String[])insuranceHistory.get(col-1);
		Hashtable approverClaimDetails = xmlObj.readSubNode(insuranceHistoryArr[14], "approverClaimDetails");
		String insuranceComp = (String)approverClaimDetails.get("policyInsuCompany-");

		label = new Label(0,col,insuranceComp,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		/*label = new Label(1,col,insuranceHistoryArr[1],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(2,col,insuranceHistoryArr[2],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(3,col,insuranceHistoryArr[3],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(4,col,insuranceHistoryArr[4],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(5,col,insuranceHistoryArr[5],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(6,col,insuranceHistoryArr[6],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(7,col,insuranceHistoryArr[7],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(8,col,insuranceHistoryArr[8],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(9,col,insuranceHistoryArr[9],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(10,col,insuranceHistoryArr[9],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(11,col,insuranceHistoryArr[9],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(12,col,insuranceHistoryArr[9],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(13,col,insuranceHistoryArr[9],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);*/
	}

		workbook.write();
		workbook.close();

		System.out.println("Excel Report 1 created sucessfully");
	}
	catch(Exception ee)
	{
		System.out.println("Exception in excel report:: "+ee);
	}
}

%>