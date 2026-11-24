<%--
 -- @(#)governanceForm1.jsp - 24-JUL-2010
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Home Page of Governance.
 -- @author  -  Megha Maheshwari
 -- @version -  1.0
 -- This page is used for initial declaration by employee
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<%@ page import = "com.bccl.util.Utility" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "jxl.Workbook,jxl.write.DateFormat" %>
<%@ page import = "jxl.write.Number,jxl.write.*,java.text.SimpleDateFormat,jxl.format.UnderlineStyle"%>
<%@ page import = "java.io.PrintWriter,com.bccl.profile.web.util.Constants"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController"/>
<%
	ArrayList nomineesLst = new ArrayList();
	String targetDate;
	String compCode = (String)session.getAttribute("compCode");
	
	int iCompany = Integer.parseInt(companyCode);

	//out.println("Company Code = "+iCompany);

			switch(iCompany){
			case 1:
			targetDate="31-MAY-2010";
			break;

			case 20:
			targetDate="31-MAY-2009";
			break;

			case 27:
			targetDate="31-MAY-2009";
			break;

			case 42:
			targetDate="02-SEP-2010";
			break;

			default:
			targetDate="31-MAY-2009";
			}

	//Get the List of Employees and their Nominees
	//nomineesLst = mediclaimController.getEmpNominationDetails(targetDate, companyCode);
	//nomineesLst = mediclaimController.getEmpNominationDetails(targetDate, compCode);  commented on 04-SEP-2017
	nomineesLst = mediclaimController.getEmpNominationDetails(targetDate, sapId); 
	//writeXLSFile(nomineesLst);
	
	try
	{
	WritableWorkbook workbook = Workbook.createWorkbook(new File("List_Of_Employees_and_Nominees.xls"));

	WritableSheet sheet = workbook.createSheet("Sheet1", 0);

	WritableFont headerFont = new WritableFont (WritableFont.TIMES, 10,WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE );
	WritableCellFormat headerCells = new WritableCellFormat(headerFont);
	headerCells.setBackground(Colour.TAN);

	int column = 0;

	Label label = new Label(0,0,"PAY ID NO.",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(1,0,"BRANCH",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(2,0,"EMPLOYEE NAME",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(3,0,"DESIGNATION",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(4,0,"DEPARTMENT",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(5,0,"DATE OF JOINING",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(6,0,"NO. OF YEARS COMPLETED",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(7,0,"TARGET DATE",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(8,0,"YEARS IN SERVICE",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(9,0,"INSURED NAME",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(10,0,"LOCATION",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(11,0,"RELATION",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(12,0,"DATE OF BIRTH",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(13,0,"AGE",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(14,0,"GENDER",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	column ++;

	WritableFont normalFont = new WritableFont(WritableFont.TIMES, 10);
	WritableCellFormat normalCell = new WritableCellFormat(normalFont);

	for (int col=column;col <nomineesLst.size()+1;col++)
	{
		String viewReportDataArr[] = (String[])nomineesLst.get(col-1);

		label = new Label(0,col,viewReportDataArr[0],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(1,col,viewReportDataArr[1],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(2,col,viewReportDataArr[2],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(3,col,viewReportDataArr[3],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(4,col,viewReportDataArr[4],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(5,col,viewReportDataArr[5],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(6,col,viewReportDataArr[6],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(7,col,viewReportDataArr[7],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(8,col,viewReportDataArr[8],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(9,col,viewReportDataArr[9],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(10,col,viewReportDataArr[10],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(11,col,viewReportDataArr[11],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(12,col,viewReportDataArr[12],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(13,col,viewReportDataArr[13],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(14,col,viewReportDataArr[14],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
	}

	workbook.write();
	workbook.close();

	//out.println("Excel Report 1 created sucessfully");
	
	}
	catch(Exception ee)
	{
		System.out.println("Exception :: "+ee);
	}


	response.sendRedirect("../common/download.jsp?f=List_Of_Employees_and_Nominees.xls");
	
	
%>

<%!

public void writeXLSFile(ArrayList nomineesLst)
{

	try
	{
	WritableWorkbook workbook = Workbook.createWorkbook(new File("List_Of_Employees_and_Nominees.xls"));

	WritableSheet sheet = workbook.createSheet("Sheet1", 0);

	WritableFont headerFont = new WritableFont (WritableFont.TIMES, 10,WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE );
	WritableCellFormat headerCells = new WritableCellFormat(headerFont);
	headerCells.setBackground(Colour.TAN);

	int column = 0;

	Label label = new Label(0,0,"PAY ID NO.",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(1,0,"BRANCH",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(2,0,"EMPLOYEE NAME",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(3,0,"DESIGNATION",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(4,0,"DEPARTMENT",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(5,0,"DATE OF JOINING",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(6,0,"NO. OF YEARS COMPLETED",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(7,0,"TARGET DATE",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(8,0,"YEARS IN SERVICE",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(9,0,"INSURED NAME",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(10,0,"LOCATION",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(11,0,"RELATION",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(12,0,"DATE OF BIRTH",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(13,0,"AGE",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(14,0,"GENDER",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	/*column ++;

	WritableFont normalFont = new WritableFont(WritableFont.TIMES, 10);
	WritableCellFormat normalCell = new WritableCellFormat(normalFont);

	for (int col=column;col <nomineesLst.size()+1;col++)
	{
		String viewReportDataArr[] = (String[])nomineesLst.get(col-1);

		label = new Label(0,col,viewReportDataArr[0],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(1,col,viewReportDataArr[1],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(2,col,viewReportDataArr[2],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(3,col,viewReportDataArr[3],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(4,col,viewReportDataArr[4],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(5,col,viewReportDataArr[5],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(6,col,viewReportDataArr[6],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(7,col,viewReportDataArr[7],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(8,col,viewReportDataArr[8],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(9,col,viewReportDataArr[9],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(10,col,viewReportDataArr[10],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(11,col,viewReportDataArr[11],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(12,col,viewReportDataArr[12],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(13,col,viewReportDataArr[13],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(14,col,viewReportDataArr[14],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
	}
*/
	workbook.write();
	workbook.close();

	//out.println("Excel Report 1 created sucessfully");
	
	}
	catch(Exception ee)
	{
		System.out.println("Exception :: "+ee);
	}
}

%>
				
		
	