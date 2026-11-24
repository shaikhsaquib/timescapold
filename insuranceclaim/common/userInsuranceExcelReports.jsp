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

<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class ="com.bccl.util.XMLUtility"/>

<%@ include file="../includes/header.jsp"%>
<%--
	Make all your global declarations over here 
--%>
<%
	
	String monYear  = (String) request.getParameter("monYear");

	Object objArr[] = new Object[4];
	objArr[0] = timescapeUserOId;
	objArr[1] = "'DD-MON-YYYY'";
	objArr[2] = "'MON-YYYY'";
	//objArr[3] = exlMonYear;
	objArr[3] = "'" + monYear + "'" ;

	ArrayList myClaimRequest = new ArrayList();

	Hashtable claimRequestHash = new Hashtable( );

	claimRequestHash.put("queryId", "1000");
	claimRequestHash.put("arguments", objArr);

	myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

	out.println(myClaimRequest.size());

	try
	{
	//System.out.println("report type="+hiddyear);
	
	File file = new File("Insurance_Claim_Data_"+monYear+".csv");
	
	WorkbookSettings wbSettings = new WorkbookSettings();
	wbSettings.setLocale(new Locale("en", "EN"));
	//wbSettings.setUseTemporaryFileDuringWrite(true);   
	WritableWorkbook workbook = Workbook.createWorkbook(file, wbSettings);
	workbook.createSheet("Report", 0);
	WritableSheet sheet = workbook.getSheet(0);

	WritableFont headerFont = new WritableFont(WritableFont.TIMES, 10,WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE );
	WritableCellFormat headerCells = new WritableCellFormat(headerFont);
	//headerCells.setBackground(Colour.TAN);

	int column = 0;

	Label label = new Label(0,0,"Request Number",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	label = new Label(1,0,"Claim Number",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	label = new Label(2,0,"Entity Name",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	label = new Label(3,0,"Entity Location",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	label = new Label(4,0,"Item Name",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	label = new Label(5,0,"Date of Loss",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	label = new Label(6,0,"Cause of Damage",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	label = new Label(7,0,"Estimated Loss",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	label = new Label(8,0,"Comment",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	label = new Label(9,0,"Status",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	column ++;

	WritableFont normalFont = new WritableFont(WritableFont.TIMES, 10);
	WritableCellFormat normalCell = new WritableCellFormat(normalFont);

	String requestNumber      =   "";
	String claimNumber        =   "";
	String entityName         =   "";
	String entityLocation     =   "";
	String itemName           =   "";
	String dateOfLoss         =   "";
	String causeOfDamage      =   "";
	String estimatedLoss      =   "";
	String comment            =   "";
	String status             =   "";     
	//String comment1             =   "";     
	
	

	if(myClaimRequest!=null && myClaimRequest.size()>0)
	{
		for (int col=column; col < myClaimRequest.size()+1;col++)
		{ 
			String myClaimRequestDetail[] = (String[]) myClaimRequest.get(col-1);

			Hashtable userClaimDetailHash = xmlObj.readSubNode(myClaimRequestDetail[3], "userClaimDetails");
            Hashtable userDetailHash = xmlObj.readSubNode(myClaimRequestDetail[2], "userDetails");

			String idDisplay = myClaimRequestDetail[9].substring(myClaimRequestDetail[9].lastIndexOf("-")+1)+myClaimRequestDetail[9].substring(myClaimRequestDetail[9].indexOf("-")+1,myClaimRequestDetail[9].lastIndexOf("-"))+myClaimRequestDetail[9].substring(0,myClaimRequestDetail[9].indexOf("-")); 

			requestNumber      =  idDisplay+""+myClaimRequestDetail[0];
			claimNumber        =  myClaimRequestDetail[1];
			entityName         =   (String)userDetailHash.get("company-");
			entityLocation     =  (String)userDetailHash.get("location-");
			itemName           =   (String)userClaimDetailHash.get("claimItemName-");
			dateOfLoss         =   (String)userClaimDetailHash.get("damageDate-");
			causeOfDamage      =   (String)userClaimDetailHash.get("damageCause-");
			estimatedLoss      =   (String)userClaimDetailHash.get("damageAmount-");
			//comment            =   "";
			status             =   myClaimRequestDetail[12];   

			
			
			if(myClaimRequestDetail[12].equals("A")){

				comment = "Kindly fill the form by clicking on the request no.";
				status  = "Surveyor Appointed";
			
			
			}else if(myClaimRequestDetail[12].equals("L")){

				comment = "Kindly check the claim details by clicking on the request no.";
				status  = "Insurance Request Created";

			
			}else if(myClaimRequestDetail[12].equals("AR")){
			
				comment = "Kindly check the Approver remark by clicking on the request no.";
				status  = "Claim Form Rejected";

			
			}else if(myClaimRequestDetail[12].equals("AF")){

                comment = "Kindly check the Approver remark by clicking on the request no.";
				status  = "Claim Form Approved";

			
			}else if(myClaimRequestDetail[12].equals("R")){

				comment = "Claim has been rejected.Kindly check the approver's remark by clicking on the request no.";
				status  = "Claim Rejected by Approver";
				

			}else if(myClaimRequestDetail[12].equals("W")){

				comment = "You have withdrawn the claim.";
				status  = "Withdrawn";

			
			}else if(myClaimRequestDetail[12].equals("IR")){

				comment = "The claim has been rejected by the Insurance company. Kindly check the approver's remark by clicking on the request no.";
				status  = "Claim Rejected by Insurance Company";


			}else if(myClaimRequestDetail[12].equals("S")){

				comment = "The claim has been settled by the Insurance company. Kindly check by clicking on the request no.";
				status  = "Claim Settled";

			
			}else if(myClaimRequestDetail[12].equals("UF")){

				comment = "The form has been sent for approval.";
				status  = "Claim Form Filled";

			
			}else if(myClaimRequestDetail[12].equals("P")){

				comment = "The courier details have been accepted by the Approver. Claim has been forwaded to Insurance company.";
				status  = "Claim Forwaded to Insurance Company";

			
			}else if(myClaimRequestDetail[12].equals("HA")){

				comment = "The claim has been accepted by the Approver. The Approver will send the Surveyor details and form shortly.";
				status  = "Claim Accpeted";

			
			}else if(myClaimRequestDetail[12].equals("UC")){

				comment = "You have sent the courier to the Approver.";
				status  = "Courier Sent";

			
			}else if(myClaimRequestDetail[12].equals("AC")){

				comment = "The approver has asked for some more documnets. Kindly check the Approver remark by clicking on the request no.";
				status  = "Courier Rejected";

			
			}else if(myClaimRequestDetail[12].equals("H")){

				comment = "The approver has put your request on hold. Kindly check the Approver remark by clicking on the request no.";
				status  = "Claim Put on Hold by Approver";

			}

			label = new Label(0,col,requestNumber,normalCell);
			label.setCellFormat(normalCell);
			sheet.addCell(label);

			label = new Label(1,col,claimNumber,normalCell);
			label.setCellFormat(normalCell);
			sheet.addCell(label);
			
		    label = new Label(2,col,entityName,normalCell);
			label.setCellFormat(normalCell);
			sheet.addCell(label);

			

			label = new Label(3,col,entityLocation,normalCell);
			label.setCellFormat(normalCell);
			sheet.addCell(label);

			label = new Label(4,col,itemName,normalCell);
			label.setCellFormat(normalCell);
			sheet.addCell(label);

			label = new Label(5,col,dateOfLoss,normalCell);
			label.setCellFormat(normalCell);
			sheet.addCell(label);

			label = new Label(6,col,causeOfDamage,normalCell);
			label.setCellFormat(normalCell);
			sheet.addCell(label);

			label = new Label(7,col,estimatedLoss,normalCell);
			label.setCellFormat(normalCell);
			sheet.addCell(label);

			label = new Label(8,col,comment,normalCell);
			label.setCellFormat(normalCell);
			sheet.addCell(label);

			label = new Label(9,col,status,normalCell);
			label.setCellFormat(normalCell);
			sheet.addCell(label);
		}

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
    response.sendRedirect("../common/download.jsp?f=Insurance_Claim_Data_"+monYear+".csv");


%>