<%--
 -- @(#)myRequestReport.jsp - 11-APR-2011
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Reports 1 Page of Governance.
 -- @author  -  Tejas Lataye
 -- @version -  1.0
 -- This page is used forr initial declaration by employee
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<%@ page import = "com.bccl.util.Utility" %>
<%@ page import = "java.util.GregorianCalendar,java.util.Calendar, java.util.Date,java.text.SimpleDateFormat" %>
<%@ page import = "java.io.*,jxl.*,java.util.*,jxl.write.DateFormat" %>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.*" %>
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
<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController" />
<jsp:useBean id ="xmlObj" class ="com.bccl.util.XMLUtility"/>

<%--
	Make all your global declarations over here 
--%>

<%
	
	String currLink = "../includes/myRequestReport.jsp";
	String breadcrumbs = "";

	String month = (String) request.getParameter("MONTH");
	String year = (String) request.getParameter("YEAR");
	String status1 = (String) request.getParameter("STATUS");
	String createdBy = (String) request.getParameter("ID");
	out.println("Status : "+status1);
	ArrayList myAllRequests = new ArrayList();
	
	Hashtable searchHash = new Hashtable();
	
	searchHash.put("MONTH", month);
	searchHash.put("YEAR", year);
	searchHash.put("STATUS", status1);
	searchHash.put("CREATEDBY", createdBy);
	
	myAllRequests = assetMgmt.viewMyRequests(searchHash);

	try
	{
	//System.out.println("report type="+hiddyear);
	
	File file = new File("AssetRequests"+month+"_"+year+".csv");
	
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
	Label label = new Label(0,0,"Request Id",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(1,0,"Asset No.",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(2,0,"Serial No.",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(3,0,"Asset Name",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(4,0,"Asset Category",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(5,0,"Asset Type",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(6,0,"Installation Date",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(7,0,"Original Cost",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(8,0,"Current Cost",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(9,0,"Asset Location",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	
	label = new Label(10,0,"Asset Make",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(11,0,"Asset Model",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(12,0,"Capacity",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(13,0,"Specification",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(14,0,"Asset Condition",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(15,0,"Asset Available From",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(16,0,"Email Id",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	
	label = new Label(17,0,"Creater Remarks",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(18,0,"Reviewer Remarks",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(19,0,"Status",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(20,0,"Note type",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(21,0,"Company",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(22,0,"Branch",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(23,0,"Location",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(24,0,"Department",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(25,0,"Reason",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(26,0,"Verifier Mail Id",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(27,0,"Verified On",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

    label = new Label(28,0,"Verifier Remarks",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(29,0,"Proposer Email Id",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(30,0,"Proposed On",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(31,0,"Proposer Remarks",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(32,0,"Approver Emailid",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(33,0,"Approved On",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(34,0,"Approver Remarks",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(35,0,"Adheademailid",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(36,0,"Adheadapprovedon",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(37,0,"Adheadremarks",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(38,0,"Brheademailid",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(39,0,"Brheadapprovedon",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(40,0,"Brheadremarks",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(41,0,"Auditor Emailid",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(42,0,"Auditor Approvedon",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(43,0,"Auditor Remarks",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	/*label = new Label(44,0,"Status",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);*/

	column ++;

	WritableFont normalFont = new WritableFont(WritableFont.TIMES, 10);
	WritableCellFormat normalCell = new WritableCellFormat(normalFont);


 for (int col=column;col < myAllRequests.size()+1;col++)
	{ 
		String[] record = (String[]) myAllRequests.get(col-1);

		label = new Label(0,col,record[0],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(1,col,record[1],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(2,col,record[2],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(3,col,record[3],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(4,col,record[4],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(5,col,record[5],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(6,col,record[6],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(7,col,record[7],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(8,col,record[8],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(9,col,record[9],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);

		label = new Label(10,col,record[10],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(11,col,record[11],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
	
		label = new Label(12,col,record[12],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);

		
		label = new Label(13,col,record[13],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(14,col,record[14],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(15,col,record[15],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		
		label = new Label(16,col,record[16],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(17,col,record[17],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(18,col,record[18],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(19,col,record[19],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(20,col,record[20],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(21,col,record[21],normalCell);
		label.setCellFormat(normalCell);		
		sheet.addCell(label);

		label = new Label(22,col,record[22],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(23,col,record[23],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(24,col,record[24],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(25,col,record[25],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(26,col,record[26],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(27,col,record[27],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);

        label = new Label(28,col,record[28],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(29,col,record[29],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(30,col,record[30],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(31,col,record[31],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(32,col,record[32],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(33,col,record[33],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(34,col,record[34],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(35,col,record[35],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);

		label = new Label(36,col,record[36],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(37,col,record[37],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(38,col,record[38],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(39,col,record[39],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(40,col,record[40],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(41,col,record[41],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(42,col,record[42],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(43,col,record[43],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(44,col,record[44],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		
		//System.out.println("settledDate===="+settledDate);
		
		//System.out.println("diffDays===="+diffDays);
		//System.out.println("Status===="+status);
	}

		workbook.write();
		workbook.close();

		//System.out.println("Excel Report 1 created sucessfully");
		
	}
	catch(Exception ee)
	{
		System.out.println("Exception in excel report:: "+ee);
	}



	// code ends here
    response.sendRedirect("../includes/download.jsp?f=AssetRequests"+month+"_"+year+".csv");
	

%>