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

<%--
	Make all your global declarations over here 
--%>

<%
	String [] months = {"0", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};	
	Hashtable Status = new Hashtable();

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"01","02","03","04","05","06","07","08","09","10","11","12"};

	GregorianCalendar thisDay = new GregorianCalendar( );
    String sysDate = "";
	if(sysDate == null || sysDate.equals("")) {
	sysDate = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
	if(sysDate.length() == 1) {
	sysDate = "0" + sysDate;
	}
	sysDate += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	//System.out.println("date444"+sysDate);
	} 

	Status.put("L","L - Insurance Request Created");
	Status.put("W","W - Claim Withdrawn");
	Status.put("HA","HA - Claim Accpeted");
	Status.put("A","A - Surveyor Appointed");
	Status.put("A1","A");
	Status.put("UF","UF - Claim Form Filled");
	Status.put("AR","AR - Claim Form Rejected");
	Status.put("AF","AF - Claim Form Approved");
	Status.put("UC","UC - Courier Sent");
	Status.put("AC","AC - Courier Rejected");
	Status.put("P","P - Claim Forwaded to Insurance Company");
	Status.put("S","S - Claim Settled");
	Status.put("IR","IR - Claim Rejected by Insurance Company");
	Status.put("R","R - Claim Rejected by Approver");				
	Status.put("H","H - Claim Put on Hold by Approver");				
	
	String currLink = "../common/insuranceExcelReports.jsp";
	String breadcrumbs = "";

	//String hiddyear = (String) request.getParameter("hiddyear");
	//String hiddmonth = (String) request.getParameter("hiddmonth");
	String status1 = (String) request.getParameter("status");
	String fromDate = (String) request.getParameter("fromDate");
	String toDate = (String) request.getParameter("toDate");
	String comp = (String) request.getParameter("company");
	String policy = (String) request.getParameter("policy");
	Calendar cal1 = Calendar.getInstance();         
	Calendar cal2 = Calendar.getInstance(); 
	//int currMonth = Integer.parseInt(hiddmonth);

	

	Object objArr[] = new Object[7];
	objArr[0] = "'DD-MM-YYYY'";
	//objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = fromDate;
	objArr[2] = toDate;
	//objArr[3] = "'YYYYMONDD'";
	objArr[3] = "'DD-MM-YYYY'";
	objArr[4] = status1;
	//objArr[3] = "'DD-MON-YYYY'";
	objArr[5] = comp;
	objArr[6] = policy;

    
	if(comp == null){
	   comp = "ALL";
   }
	if(status1 == null)
		{
			status1 = "settled";
		}

    if(status1.equals("settled"))
		{
			objArr[4] = "S";
		}
		else if(status1.equals("areject"))
		{
			objArr[4] = "R";
		}
		else if(status1.equals("ireject"))
		{
			objArr[4] = "IR";
		}
		else if(status1.equals("wuser"))
		{
			objArr[4] = "W";
		}
		else if(status1.equals("hold"))
		{
			objArr[4] = "H";
		}
        else if(status1.equals("pending"))
		{
			objArr[4] = "P";
		}
        else if(status1.equals("all"))
		{
			objArr[4] = "S','R','IR','W','H','P','A','AF','L','UC','UF";
		}

	ArrayList insuranceHistory = new ArrayList();
	
	Hashtable searchHash = new Hashtable();
	
	if(comp.equals("ALL")){
		searchHash.put("queryId", "1007");
	}else{
		searchHash.put("queryId", "1004");
	}
		
		
		searchHash.put("arguments", objArr);

	
	insuranceHistory = insuranceClaimController.viewClaimRequest(searchHash);	 // InsuranceClaimSearch ---- FIND_BY_YEAR_MONTH

   // writeXLSFile(insuranceHistory,hiddyear);

	// Put code here

	//System.out.println("--- writeXLSFile() ---");
	//System.out.println("Insurance History="+insuranceHistory.size());
	try
	{
	//System.out.println("report type="+hiddyear);
	
	File file = new File("Insurance_Claim_Data_"+fromDate+".csv");
	
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
	Label label = new Label(0,0,"Request Number",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(1,0,"Insurance Company",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(2,0,"Legal Entity",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(3,0,"Claim Number",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(4,0,"Item",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(5,0,"Type of Policy",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(6,0,"Date of Loss",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(7,0,"Place of Loss",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(8,0,"Description",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(9,0,"Probable Loss",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	
	label = new Label(10,0,"Damaged Quantity",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(11,0,"Rate/Kg",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(12,0,"Invoice Value",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(13,0,"Salvage Rate",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(14,0,"Salvage Value",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(15,0,"Claim Amount(Less Excess 5000)",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(16,0,"Settled Amount",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	
	label = new Label(17,0,"Remarks",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(18,0,"Cheque Number",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(19,0,"Amount",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(20,0,"Received On",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(21,0,"Status",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(22,0,"Pending At",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(23,0,"Responsibility",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(24,0,"No Of Reels",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(25,0,"Claim Lodge Date",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(26,0,"Claim Settled Date",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(27,0,"Days Difference",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

    label = new Label(28,0,"B / L Number",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(29,0,"B / L Date",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(30,0,"Invoice Number",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(31,0,"Invoice Date",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(32,0,"LR Number",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(33,0,"LR Date",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(34,0,"Container Number",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
    label = new Label(35,0,"Diff Days From Damage Date",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);

	label = new Label(36,0,"Surveyor Name",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(37,0,"Surveyor Phone",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(38,0,"Surveyor Mobile",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(39,0,"Surveyor Emailid",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	label = new Label(40,0,"Updated Loss Amount",headerCells);
	label.setCellFormat(headerCells);
	sheet.addCell(label);
	

	column ++;

	WritableFont normalFont = new WritableFont(WritableFont.TIMES, 10);
	WritableCellFormat normalCell = new WritableCellFormat(normalFont);


 for (int col=column;col < insuranceHistory.size()+1;col++)
	{ 
		String chequeNumber					= "NA";
		String chequeAmount					= "NA";
		String chequeDate					= "NA";
		String remarks						= "";
		String ratesPerKg					= "NA";
		String noOfReels					= "NA";
		String salvageRate					= "NA";
		String salvageMaterial				= "NA";
		String damagedQty					= "NA";
		String estimatedLoss				= "NA";
		String material						= "NA";
		String netAmt						= "NA";
		String settledDate					= "NA";
        String blNo					        = "NA";
		String blDate					    = "NA";
		String lrNo					        = "NA";
		String lrDate					    = "NA";
		String invoiceNo					= "NA";
		String invoiceDate					= "NA";
		String containerNo					= "NA";
		String insuranceHistoryArr[]		= (String[])insuranceHistory.get(col-1);
		String date							= insuranceHistoryArr[10].toLowerCase();
		String finelStatus					= insuranceHistoryArr[13].toLowerCase();

		if (finelStatus.equals("s"))
			
		{
			//settledDate					= insuranceHistoryArr[15].toLowerCase();
			settledDate					= insuranceHistoryArr[12].toLowerCase();

		}else {
			
			settledDate = "NA";
		
		}
		

		//System.out.println("finelStatus---"+finelStatus);
		String daysDiff = "";
		String claimDaysDiff = "";

        //System.out.println("date = "+date);
        //System.out.println("settledDate = "+settledDate);

		if (finelStatus.equals("s"))
			
		{

			String dDate = date.substring(0,date.indexOf("-"));
			String dMonth = date.substring(3,date.indexOf("-")+3);
			String dYear = date.substring(date.indexOf("-")+4);

			String sDate = settledDate.substring(0,settledDate.indexOf("-"));
			String sMonth = settledDate.substring(3,settledDate.indexOf("-")+3);
			String sYear = settledDate.substring(settledDate.indexOf("-")+4);

			int dDate1 = Integer.parseInt(dDate);
			int dMonth1 = Integer.parseInt(dMonth);
			int dYear1 = Integer.parseInt(dYear);

			int sDate1 = Integer.parseInt(sDate);
			int sMonth1 = Integer.parseInt(sMonth);
			int sYear1 = Integer.parseInt(sYear);

			cal1.set(dYear1, dMonth1, dDate1);         
			cal2.set(sYear1, sMonth1, sDate1);

			long milis1 = cal1.getTimeInMillis();         
			long milis2 = cal2.getTimeInMillis(); 
			long diff = milis2 - milis1;
			long diffDays = diff / (24 * 60 * 60 * 1000); 
			daysDiff = String.valueOf(diffDays);

		}

		if (!finelStatus.equals("s"))
			
		{

			String dDate = date.substring(0,date.indexOf("-"));
			String dMonth = date.substring(3,date.indexOf("-")+3);
			String dYear = date.substring(date.indexOf("-")+4);

			String sDate1 = sysDate.substring(0,sysDate.indexOf("-"));
			String sMonth1 = sysDate.substring(3,sysDate.indexOf("-")+3);
			String sYear1 = sysDate.substring(sysDate.indexOf("-")+4);

			int dDate1 = Integer.parseInt(dDate);
			int dMonth1 = Integer.parseInt(dMonth);
			int dYear1 = Integer.parseInt(dYear);

			int sDate2 = Integer.parseInt(sDate1);
			int sMonth2 = Integer.parseInt(sMonth1);
			int sYear2 = Integer.parseInt(sYear1);

			cal1.set(dYear1, dMonth1, dDate1);         
			cal2.set(sYear2, sMonth2, sDate2);

			long milis1 = cal1.getTimeInMillis();         
			long milis2 = cal2.getTimeInMillis(); 
			long diff = milis2 - milis1;
			long diffDays = diff / (24 * 60 * 60 * 1000); 
			daysDiff = String.valueOf(diffDays);

		}



		String requestNo					= date + insuranceHistoryArr[0];
		Hashtable approverClaimDetails		= xmlObj.readSubNode(insuranceHistoryArr[14], "approverClaimDetails");
		Hashtable userDetails				= xmlObj.readSubNode(insuranceHistoryArr[2], "userDetails");
		Hashtable userClaimDetails			= xmlObj.readSubNode(insuranceHistoryArr[3], "userClaimDetails");
		Hashtable claimAttachmentDetails	= xmlObj.readSubNode(insuranceHistoryArr[4], "claimAttachmentDetails");


		//System.out.println("date---"+date);
		
		String[] tags1 = {"reviewer"};
		

		Hashtable claimFormDetailHash	= new Hashtable();
		Hashtable claimFormHash	= new Hashtable();
		Hashtable claimFormList	= new Hashtable();
		Hashtable claimHash				= new Hashtable();
		Hashtable reviewerRemarkDetails = new Hashtable();

		ArrayList reviewerList			= new ArrayList();
		ArrayList claimDetailsList			= new ArrayList();
		ArrayList reviewerRemarkList	= new ArrayList();
		ArrayList claimFormDetailsList	= new ArrayList();
		ArrayList reviewer				= new ArrayList();
		Hashtable claimFormValues		= new Hashtable();
		Hashtable claimFormDetails		= new Hashtable();

		Object objArr1[]	= new Object[2];
		objArr1[0]			= "'DD-MON-YYYY'";
		objArr1[1]			= insuranceHistoryArr[1];

		Object objArr3[]	= new Object[2];
		objArr3[0]			= "'DD-MON-YYYY'";
		objArr3[1]			= insuranceHistoryArr[0];

		claimFormDetailHash.put("queryId", "1000");
		claimFormDetailHash.put("arguments", objArr1);

		claimHash.put("queryId", "1001");
		claimHash.put("arguments", objArr3);

		reviewerList.add(claimHash);
		reviewerList.add(claimFormDetailHash);

		reviewerRemarkList = insuranceClaimController.viewReviewerRemark(reviewerList,tags1);
		
			
		Object objArr5[]	= new Object[2];
		objArr5[0]			= "'DD-MON-YYYY'";
		objArr5[1]			= insuranceHistoryArr[1];

		claimFormList.put("queryId", "1000");
		claimFormList.put("arguments", objArr1);

		claimFormDetailsList = insuranceClaimController.viewClaimDetails(claimFormList);	//	InsuranceClaimFormsSearch-------FIND_BY_CLAIMNUMBER
		//System.out.println("claimFormDetails------"+claimFormDetailsList);
		for(int y = 0 ; y < claimFormDetailsList.size(); y++)
		{		
			String tmpArr3[] = (String []) claimFormDetailsList.get(0);
			//System.out.println("claimFormValues------"+tmpArr3[2]);
			claimFormValues		=  xmlObj.readSubNode(tmpArr3[2], "marineClaimForm");
			//System.out.println("claimFormValues------"+claimFormValues.size());
			

			if(claimFormValues!=null)
			{						
				ratesPerKg		= (String) claimFormValues.get("rate-");
				noOfReels		= (String) claimFormValues.get("noOfReels-");

                blNo		    = (String) claimFormValues.get("blNo-");
				blDate		    = (String) claimFormValues.get("blDate-");
				lrNo		    = (String) claimFormValues.get("lrNo-");
				lrDate		    = (String) claimFormValues.get("lrDate-");
				invoiceNo		= (String) claimFormValues.get("invoiceNo-");
				invoiceDate		= (String) claimFormValues.get("invoiceDate-");
				containerNo		= (String) claimFormValues.get("containerNo-");

				damagedQty		= (String) claimFormValues.get("damaged-");
				salvageRate		= (String) claimFormValues.get("salvageRate-");
				salvageMaterial	= (String) claimFormValues.get("salvageMaterial-");
				estimatedLoss	= (String) claimFormValues.get("damaged-");									
				material		= (String) claimFormValues.get("material-");									
				netAmt			= (String) claimFormValues.get("netAmt-");									

			}

			if ( damagedQty == null ) {
				// for conatianer claim below four values are not taken
				damagedQty	= "NA";
				ratesPerKg	= "NA";
				noOfReels	= "NA";
				material	= "NA";
				salvageRate	= "NA";
				salvageMaterial	= "NA";
			
			}

		}
		for(int k = 0 ; k<reviewerRemarkList.size(); k++)
		{			
			reviewerRemarkDetails	= (Hashtable)reviewerRemarkList.get(k);
			//cheque = (ArrayList)settleRemarkDetails.get("cheque");

			reviewer				= (ArrayList)reviewerRemarkDetails.get("reviewer");
			
			if(reviewer!=null)
			{
				for(int jj=0; jj<reviewer.size(); jj++)
				{
					Hashtable reviewerHash = (Hashtable)reviewer.get(jj);
					String date1 = (String) reviewerHash.get("date");
					String remark = (String) reviewerHash.get("remark");
					remarks += date1 + " - " + remark +"\n";
				}
			}
		}
		
		if(remarks == "") {

			remarks = "NA";

		}

		if(!insuranceHistoryArr[7].equals("<miscellaneousDetails />"))
		{
			Hashtable claimSettleHash = new Hashtable();
			Hashtable settleRemarkDetails = new Hashtable();
			ArrayList settleList = new ArrayList();
			ArrayList settleRemarkList = new ArrayList();
			ArrayList cheque = new ArrayList();
			String[] tags = {"cheque"};

			Object objArr2[] = new Object[2];
			objArr2[0] = "'DD-MON-YYYY'";
			objArr2[1] = insuranceHistoryArr[0];

			claimSettleHash.put("queryId", "1001");
			claimSettleHash.put("arguments", objArr2);

			settleList.add(claimSettleHash);

			settleRemarkList = insuranceClaimController.viewSettleRemark(settleList,tags);	

			for(int k = 0 ; k<settleRemarkList.size(); k++)
			{
				settleRemarkDetails = (Hashtable)settleRemarkList.get(k);
				cheque = (ArrayList)settleRemarkDetails.get("cheque");
				//System.out.println("cheque------"+cheque);
				if(cheque!=null)
				{
					for(int jj=0; jj<cheque.size(); jj++)
					{
						Hashtable chequeSettleDetails = (Hashtable)cheque.get(jj);
						chequeNumber = (String)chequeSettleDetails.get("chequeNumber");
						chequeAmount = (String)chequeSettleDetails.get("chequeAmount");
						chequeDate = (String)chequeSettleDetails.get("chequeDate");
					}
				}
			}
		}
		String insuranceComp = (String)approverClaimDetails.get("policyInsuCompany-");
		String company = (String)userDetails.get("company-");
		String claimItemName = (String)userClaimDetails.get("claimItemName-");
		String damageDate = (String)userClaimDetails.get("damageDate-");
		String damageDate1 = "";
		String claimItemDesc = (String)userClaimDetails.get("claimItemDesc-");
		String damageAmount = (String)userClaimDetails.get("damageAmount-");
		String updatedLossAmount = (String)userClaimDetails.get("updatedDamageAmount-");
		String claimFormValue = (String)claimAttachmentDetails.get("claimFormValue-");
		String status = "";
		String pending = "";
		String responsible = "";
		String surveyorName = (String)approverClaimDetails.get("surveyorName-");
		String surveyorPhone = (String)approverClaimDetails.get("surveyorPhone-");
		String surveyorMobile = (String)approverClaimDetails.get("surveyorMobile-");
		String surveyorEmailId = (String)approverClaimDetails.get("surveyorEmailId-");


        
        String strDate = damageDate;
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
        Date dateStr = formatter.parse(strDate);
        String formattedDate = formatter.format(dateStr);

        Date date1 = formatter.parse(formattedDate);

        formatter = new SimpleDateFormat("dd-MM-yyyy");
        formattedDate = formatter.format(date1);
        //System.out.println(formattedDate);

        if (finelStatus.equals("s"))
			
		{

			String dDate = formattedDate.substring(0,formattedDate.indexOf("-"));
			String dMonth = formattedDate.substring(3,formattedDate.indexOf("-")+3);
			String dYear = formattedDate.substring(formattedDate.indexOf("-")+4);

			String sDate = settledDate.substring(0,settledDate.indexOf("-"));
			String sMonth = settledDate.substring(3,settledDate.indexOf("-")+3);
			String sYear = settledDate.substring(settledDate.indexOf("-")+4);

			int dDate1 = Integer.parseInt(dDate);
			int dMonth1 = Integer.parseInt(dMonth);
			int dYear1 = Integer.parseInt(dYear);

			int sDate1 = Integer.parseInt(sDate);
			int sMonth1 = Integer.parseInt(sMonth);
			int sYear1 = Integer.parseInt(sYear);

			cal1.set(dYear1, dMonth1, dDate1);         
			cal2.set(sYear1, sMonth1, sDate1);

			long milis1 = cal1.getTimeInMillis();         
			long milis2 = cal2.getTimeInMillis(); 
			long diff = milis2 - milis1;
			long diffDays = diff / (24 * 60 * 60 * 1000); 
			claimDaysDiff = String.valueOf(diffDays);

            //System.out.println("111"+claimDaysDiff);

		}

		if (!finelStatus.equals("s"))
			
		{

			String dDate = formattedDate.substring(0,formattedDate.indexOf("-"));
			String dMonth = formattedDate.substring(3,formattedDate.indexOf("-")+3);
			String dYear = formattedDate.substring(formattedDate.indexOf("-")+4);

			String sDate1 = sysDate.substring(0,sysDate.indexOf("-"));
			String sMonth1 = sysDate.substring(3,sysDate.indexOf("-")+3);
			String sYear1 = sysDate.substring(sysDate.indexOf("-")+4);

			int dDate1 = Integer.parseInt(dDate);
			int dMonth1 = Integer.parseInt(dMonth);
			int dYear1 = Integer.parseInt(dYear);

			int sDate2 = Integer.parseInt(sDate1);
			int sMonth2 = Integer.parseInt(sMonth1);
			int sYear2 = Integer.parseInt(sYear1);

			cal1.set(dYear1, dMonth1, dDate1);         
			cal2.set(sYear2, sMonth2, sDate2);

			long milis1 = cal1.getTimeInMillis();         
			long milis2 = cal2.getTimeInMillis(); 
			long diff = milis2 - milis1;
			long diffDays = diff / (24 * 60 * 60 * 1000); 
			claimDaysDiff = String.valueOf(diffDays);
            //System.out.println("222"+claimDaysDiff);

		}

		if ( claimFormValue == null ) {

			claimFormValue = "NA";

		}

		if ( insuranceComp == null ) {

			insuranceComp = "NA";

		}

		//utilObj.Status.valueOf(1);

		
		//String f = utilObj.Status;

		status = (String)Status.get(insuranceHistoryArr[13]);
		
		if( insuranceHistoryArr[13].equals("P") || insuranceHistoryArr[13].equals("H") || insuranceHistoryArr[13].equals("IR") )  {
			
			pending = "Insurer";
		
		} else if ( insuranceHistoryArr[13].equals("S") ) {
			
			pending	=	"Settled";

		} else {
			
			pending = "Insured";

		}

		if( insuranceHistoryArr[13].equals("L") || insuranceHistoryArr[13].equals("HA") || insuranceHistoryArr[13].equals("UF") || insuranceHistoryArr[13].equals("UC") || insuranceHistoryArr[13].equals("R") || insuranceHistoryArr[13].equals("HA") ) {
			
			//responsible = "anurag.reja@timesgroup.com";
			responsible = "amit.choudhary1@timesgroup.com";

		} else if( insuranceHistoryArr[13].equals("A") || insuranceHistoryArr[13].equals("AR") || insuranceHistoryArr[13].equals("AF") || insuranceHistoryArr[13].equals("AC") || insuranceHistoryArr[13].equals("W") ) {

			responsible = (String)userDetails.get("emailId-");

		} else if( insuranceHistoryArr[13].equals("P") || insuranceHistoryArr[13].equals("IR") || insuranceHistoryArr[13].equals("H") ) {
			
			responsible = insuranceComp;

		} else if( insuranceHistoryArr[13].equals("S") ) {

				responsible = "Settled";

		}

		label = new Label(0,col,requestNo,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(1,col,insuranceComp,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(2,col,company,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(3,col,insuranceHistoryArr[1],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(4,col,claimItemName,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(5,col,claimFormValue,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(6,col,damageDate,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(7,col,insuranceHistoryArr[8],normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(8,col,claimItemDesc,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(9,col,damageAmount,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);

		label = new Label(10,col,damagedQty,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(11,col,ratesPerKg,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
	
		label = new Label(12,col,material,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);

		
		label = new Label(13,col,salvageRate,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(14,col,salvageMaterial,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(15,col,netAmt,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		
		label = new Label(16,col,chequeAmount,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(17,col,remarks,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(18,col,chequeNumber,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(19,col,chequeAmount,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(20,col,chequeDate,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		
		/*if ( Double.parseDouble(damageAmount) > 20000.00) {
			
			label = new Label(21,col,status,normalCell);
			label.setCellFormat(normalCell);

		} else if ( insuranceHistoryArr[12].equals("S") ) {
			
			label = new Label(21,col,status,normalCell);
			label.setCellFormat(normalCell);

		} else {

			label = new Label(21,col,"A - Claim Accepted",normalCell);
			label.setCellFormat(normalCell);
		
		}*/

		label = new Label(21,col,status,normalCell);
		label.setCellFormat(normalCell);		
		sheet.addCell(label);

		label = new Label(22,col,pending,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(23,col,responsible,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(24,col,noOfReels,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(25,col,date,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(26,col,settledDate,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(27,col,daysDiff,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);

        label = new Label(28,col,blNo,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(29,col,blDate,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(30,col,invoiceNo,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(31,col,invoiceDate,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(32,col,lrNo,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(33,col,lrDate,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(34,col,containerNo,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
        label = new Label(35,col,claimDaysDiff,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);

		label = new Label(36,col,surveyorName,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(37,col,surveyorPhone,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(38,col,surveyorMobile,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		label = new Label(39,col,surveyorEmailId,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		if (status.equals("S") || status.equals("S - Claim Settled")){
		label = new Label(40,col,updatedLossAmount,normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		}else{
		label = new Label(40,col,"0",normalCell);
		label.setCellFormat(normalCell);
		sheet.addCell(label);
		}
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
    response.sendRedirect("../common/download.jsp?f=Insurance_Claim_Data_"+fromDate+".csv");
	//out.println("Insurance History="+insuranceHistory.size());

%>