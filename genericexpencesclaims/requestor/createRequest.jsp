<%--
 -- @(#)createRequest.jsp	12/3/2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Viraj Patil
 -- @version 	1.00, 12/3/2008
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%//@ page errorPage="../common/statusPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/sapCompCompany.jsp" %>
<%@ include file="../common/config.jsp"%>
<%@ page import="java.util.Hashtable,java.io.File, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility,com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
 
<jsp:useBean id="genericClaimController" class="com.bccl.claim.web.controllerbeans.GenericClaimController" /> 
<jsp:useBean id="communicationClaimController" class="com.bccl.claim.web.controllerbeans.CommunicationClaimController" />

 <%
		//String redirectURL1	= "../common/claimMaintenancePageNew.html";
		//response.sendRedirect(redirectURL1);
%>

<html>
	<head>
		<title>
		</title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		 <script Language="JavaScript" src="../jscripts/util.js"></script>
		 <script Language="JavaScript" src="../jscripts/common.js"></script>
		 <script Language="JavaScript" src="../jscripts/createRequest.js"></script>
		<link href="../style/calendarControl.css"rel="stylesheet">
		<script src="../jscripts/calendarControl.js"language="javascript"></script>
				<script src="../jscripts/jquery.min.js"></script>
		<script src="../jscripts/jquery1.min.js"></script>
		<script src="../jscripts/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="../jscripts/jquery-ui.css" type="text/css" />
	 </head>

<%
	//Set session attribute for the link of current page
	session.setAttribute("currLink", "../requestor/createRequest.jsp");
	session.setAttribute("topLink", "1");

	GregorianCalendar today = new GregorianCalendar();
	 String strBalanceAmt="";
	float balanceAmt = 0;
	ArrayList  compListSAP = new ArrayList();
	
	for(int jj=0; jj< companiesList.size(); jj++){
		String tmpArr[] = (String[])companiesList.get(jj);
		compListSAP.add(tmpArr[0]);
	}

	//ArrayList approvers = new ArrayList();
	String [] billDate		= null;
	String [] billNo		= null;
	String [] billDesc		= null;
	String [] billAmount	= null;
	String [] billAttachment	= null;
	String myFile = "";

	int filledRows;
	int count;
	int savedBills = 1;
	int addToSave	= 1;
	String applyDate	= "";
	String noOfBills	= "0";
	String actionAdd	= "add_req";
	String actionSubmit = "sub_req";
	String actionSave	= "sav_req";
	String option = null;
    int newFilledRows=0;
    int getNewRows=0;
	String entitlementCode1 = "";
	//int ids= 0;
	//String txnIds ="";
	String entitlementCode = (String)request.getParameter("entitlementCode");
	//out.println("entitlementCode-@@-"+entitlementCode);
	if(entitlementCode == null){
		entitlementCode = (String)session.getAttribute("entitlementCode");
	}
	session.setAttribute("entitlementCode",entitlementCode);
	if("INT".equals(entitlementCode)){		
		 entitlementCode1 = "Internet";
	}else if("ENT".equals(entitlementCode)){
		 entitlementCode1 = "Entertainment";
	}else if("BKP".equals(entitlementCode)){
		 entitlementCode1 = "Books And Periodicals";
	}else if("DRR".equals(entitlementCode)){
		 entitlementCode1 = "Driver reimbursement";
	}else if("FRR".equals(entitlementCode)){
		 entitlementCode1 = "Fuel reimbursement";
	}else if("VRR".equals(entitlementCode)){
		 entitlementCode1 = "Vehicle Repair reimbursement";
	}
	//out.println(entitlementCode1);
	session.setAttribute("emailId", emailId);
     if(compListSAP.contains(companyCode)){
		//if(compListSAP.contains(companyCode) || "1035".equals(companyCode)){
		String balanceAmt2 = genericClaimController.getGenericBalances(timescapeUserOId, sapId, faYear,entitlementCode);
		balanceAmt = Float.parseFloat(balanceAmt2);
		//out.println("balanceAmt--"+balanceAmt);
	}else{
		/*ArrayList entlBalancesLst = genericClaimController.viewBalances(timescapeUserOId, faYear, entlCode, legacyCompanyCode);
		if(entlBalancesLst.size() > 0){
			strBalanceAmt = ((String[]) entlBalancesLst.get(0))[5];
			balanceAmt = Float.parseFloat(strBalanceAmt);
		}*/
		String balanceAmt2 = communicationClaimController.getBalances(timescapeUserOId, sapId, faYear, "COMMUNICATIONBAL");
		balanceAmt = Float.parseFloat(balanceAmt2);
	}
	option  = (String)request.getParameter("option");
	String txtId = (String)request.getParameter("txnId");
	String id = (String)request.getParameter("id"); 
    int ids =0;
    ArrayList editMedicalClaimDetails = null;
			
			if(id != null && !"null".equals(id)){				
				String txnIds = (String)session.getAttribute("GEN_IDS");
				if(txnIds != null){
					ids = Integer.parseInt(request.getParameter("id"));
					String txnArr[] = txnIds.split(",");
					if(txnArr.length > ids){
						txtId = txnArr[ids];
						session.setAttribute("editTxnId", txtId);
						editMedicalClaimDetails = genericClaimController.viewTxnId(txtId);
						savedBills = (editMedicalClaimDetails.size())+1;
					}else{
						response.sendRedirect("/timescape/includes/unauthorized.html");
					}						
				}
			}else{
				if(txtId != null){							
					//String txnIds = (String)session.getAttribute("GEN_IDS");
					//if(txnIds != null){
					//	ids = Integer.parseInt(request.getParameter("id"));
					//	String txnArr[] = txnIds.split(",");
					//	if(txnArr.length > ids){
					//		txtId = txnArr[ids];
					//		session.setAttribute("editTxnId", txtId);
							editMedicalClaimDetails = genericClaimController.viewTxnId(txtId);
							savedBills = (editMedicalClaimDetails.size())+1;
					//	}else{
					//		response.sendRedirect("/timescape/includes/unauthorized.html");
					//	}						
					//}
				}				
			}
			
			int todayDay = today.get(Calendar.DAY_OF_MONTH);
			int todayMonth = today.get(Calendar.MONTH);
			int todayYear = today.get(Calendar.YEAR);
			applyDate = Utility.returnDate(todayDay, (todayMonth+1), todayYear);

			if(option == null && txtId == null){
				// condition for a new Request
				filledRows	  = 0;
				count = 5;
				noOfBills = String.valueOf((filledRows+5));
			}else{	
				if(txtId != null){
					//get the size of saved Bills
					filledRows = editMedicalClaimDetails.size();	
					if(request.getParameter("actualRows")==null){
						
						newFilledRows=filledRows;
					 }else{
						newFilledRows = Integer.parseInt(request.getParameter("actualRows"));
					 }
					getNewRows=newFilledRows;
				}else{
					// get the size of added Bills(link:add more bills)
					filledRows  = Integer.parseInt(request.getParameter("actualRows"));
				}
				count = filledRows-1;
				noOfBills = String.valueOf((newFilledRows+5));
			}

			String savedBillsCount	= "";
			savedBillsCount = request.getParameter("savedBills");
			if(savedBillsCount == null)
			{/*do nothing*/}
			else{
				savedBills = (int)Integer.parseInt(savedBillsCount);
				addToSave = 2;
			}

		//	if((txtId == null || txtId.equals("null") || txtId.equals("")) && savedBills >1){
			//	 txtId = (String)request.getParameter("txnId")== null?null:(String)request.getParameter("txnId");
			//}

		   if(balanceAmt > 0){

%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="addAll(<%=newFilledRows+5%>)">

 <%@ include file="../includes/genericClaimHeader.html" %>
 <%@ include file="../includes/genericClaimMenu.jsp" %> 
<table width="100%" border="0" cellspacing="1" cellpadding="2">
	<form name="frmCreateRequest" method="post" >
		<input type="hidden" name="noOfRows" value="<%=newFilledRows+5%>">
		<input type="hidden" name="option" value="1">
		<input type="hidden" name="actionNumber" value="0">
		<!-- <input type="text" name="txnId" value=<%//=txtId%>> -->
		<input type="hidden" name="id" value=<%=id%>>
		<input type="hidden" name="savedBills" value="<%=savedBills%>">
		<input type="hidden" name="delBillNo" value="0">
		<input type="hidden" name="delBillDate" value="0">
		<input type="hidden" name="delBillAmt" value="0">
		<input type="hidden" name="id2" value="0">
		 <input type = "hidden" name = "entitlementCode" id = "entitlementCode" value = <%=entitlementCode%>> 
        

		<tr>
			<td class="whitesmall" bgcolor="#000000" align="center" colspan ="8" height="20" color="#ffffff">GENERIC REIMBURSEMENT CLAIM FORM</td>
		</tr>
		
		<tr>
			<td height="15"colspan="100%"><block type="spacer" height="15"></td>
		</tr>
        <tr>
            <td colspan="100%" align="left" class="normal" height="20">
                Your Balance Amount is <span class="bold"><u>Rs. <%=balanceAmt%></u> For the Claim type - <%=entitlementCode1%>.</span>
            &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="100%" align="center" class="bold" height="15">&nbsp;</td>
        </tr>

		<tr>
			<td colspan="100%" class="normal">
				<p>Accounts Department<br><br>Please find attached bills worth Rs.<input type="text" class="normal" id="amountTotal"name="amountTotal" size="10"maxlength="100" readOnly/>&nbsp;
				for Reimbursement with Month&nbsp;<select id="forMonth" name="forMonth" class="normal" >
					<%= HtmlUtil.getMonthList(String.valueOf(today.get(Calendar.MONTH)+1)) %>
				</select>&nbsp;Year&nbsp;<select id="forYear" name="forYear" class="normal" >
					<%= HtmlUtil.getYearList(2007,2100,today.get(Calendar.YEAR),"asc") %>&nbsp;
				</select>&nbsp;Salary
			</td>
		</tr>
		<tr>
			<td height="25"colspan="100%"><block type="spacer" height="25"></td>
             
		</tr>

<%
			if(txtId != null && !txtId.equals("null") && !txtId.trim().equals("")){
%>
				<tr>
					<td class="bold" align="left" colspan ="8" height="20" color="#ffffff">Request Transaction Number : <%=txtId%></td>
					
				</tr>
<%          }
%>
		<tr>
		<td colspan="100%">
			<table width="100%" border="0" cellspacing="1" cellpadding="2">
				<tr bgcolor="#CCCCCC">
					<td class="bold" width="5%"style="border-bottom:1px solid #E8E8E8">SR. NO.</td>
					<td class="bold" width="20%"style="border-bottom:1px solid #E8E8E8">BILL DATE</td>
					<td class="bold" width="20%"style="border-bottom:1px solid #E8E8E8">BILL NO.</td>
					<td class="bold" width="20%"style="border-bottom:1px solid #E8E8E8">BILL DESCRIPTION</td>
					<td class="bold" width="20%"style="border-bottom:1px solid #E8E8E8">&nbsp;&nbsp;AMOUNT</td>
					<td class="bold" width="10%"style="border-bottom:1px solid #E8E8E8;text-align:center;">ATTACH BILLS</td>
					<td class="bold" width="15%"style="border-bottom:1px solid #E8E8E8">&nbsp;&nbsp;ACTION</td>
				</tr>
<%!
    public static void listFilesAndFilesSubDirectories(String directoryName, String transId){
        File directory = new File(directoryName);
        //get all the files from a directory
        File[] fList = directory.listFiles();
        for (File file : fList){
            if (file.isFile()){
                //System.out.println(transId+" "+file.getName()+">>>"+file.getAbsolutePath()+"::::"+file.getParentFile().getName());
                if(transId != null){
                	File parentDirect = new File(EnvironmentProperties.getValue("claim", "uploadPath") + transId);
                	//System.out.println(parentDirect.getAbsolutePath());
                }
            } else if (file.isDirectory()){
                listFilesAndFilesSubDirectories(file.getAbsolutePath(),transId);
            }
        }
    }				
%>
<%!				
	public static boolean deleteDirectory(File dir) { 
		if (dir.isDirectory()) { 
			File[] children = dir.listFiles(); 
			for (int i = 0; i < children.length; i++) { 
				boolean success = deleteDirectory(children[i]); 
				if (!success) { return false; } 
			} 
		} // either file or an empty directory 
		//System.out.println("removing file or directory : " + dir.getName()); 
		return dir.delete();
	}
%>	

<%!	
	public static void renameAndDelete(int number, String emailId, String txtId, String fileName){
		String userEmailId = emailId;
		if (userEmailId.indexOf("@") > -1) {
			userEmailId = userEmailId.substring(0, userEmailId.indexOf("@"));        
		}
		
		String numberAsString = Integer.toString(number);
		
		File parentDir = new File(EnvironmentProperties.getValue("claim", "uploadPath") + userEmailId);
		parentDir = new File(parentDir, numberAsString);
		
		//System.out.println(numberAsString+":createRequest getPath():"+parentDir.getPath());
		
		File file = new File(parentDir, fileName);
		boolean bool = false;
		
		// tests if file exists
		//System.out.println("createRequest file.getPath():"+file.getPath());
        bool = file.exists();
		
		if(txtId != null){
			//System.out.println("createRequest txtId:"+txtId);
			File dir = new File(EnvironmentProperties.getValue("claim", "uploadPath") + txtId);
			if(!dir.exists()){
	            if (dir.mkdirs()) {
	                //System.out.println("Directory is created! " + txtId);
	            } else {
	                //System.out.println("Failed to create directory! " + txtId);
	            }
	        }
			
			if(!bool) {
				//System.out.println(fileName + " file does not exists.");
	        } else {
	            try {
	                // renaming the file and moving it to a new location
	                //System.out.println("\n"+dir.isDirectory()+" createRequest >>>>> dir.getPath():"+dir.getPath());
	                
	                if (file.renameTo(new File(dir.getPath(),fileName))) {
	                    // if file copied successfully then delete the original file
	                    //file.delete();
	                    //System.out.println("File moved successfully " + fileName);
	                } else {
	                    //System.out.println("Failed to move the file");
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
		}
	}
%>		
<% 
				String[] arr = null;
	if((option == null && txtId == null) || (txtId == null && option == null)){
		//System.out.println("createRequest Delete this folder.");
		
		String emailid = emailId;
		if (emailid.indexOf("@") > -1) {
			emailid = emailid.substring(0, emailid.indexOf("@"));        
		}

		session.setAttribute("emailidNew",emailid);
		
		File dir = new File(EnvironmentProperties.getValue("claim", "uploadPath") + emailid);
		
		//listFilesAndFilesSubDirectories(dir.toString(), txtId);
				
		deleteDirectory(dir);
		
		/* if(!dir.exists()){
            if (dir.mkdirs()) {
                System.out.println("Directory is created! ");
            } else {
                System.out.println("Failed to create directory! ");
            }
        } */

	}
				if(option != null || txtId != null){
					//Added or Saved Bills				
					billDate			= new String[newFilledRows+1];
					billNo			    = new String[newFilledRows+1];
					billDesc			= new String[newFilledRows+1];
					billAmount			= new String[newFilledRows+1];
					billAttachment		= new String[newFilledRows+1];
				
					for(int ii = 1;ii<(newFilledRows+1);ii++){
		 
						if(txtId != null && addToSave == 1 && (filledRows>=ii)) {
							//Fetch Saved Bills
							arr = (String[])editMedicalClaimDetails.get((ii-1));
							billDate[ii]	= arr[1];
							billNo[ii]		= arr[0];
							billDesc[ii]	= arr[2];
							billAmount[ii]	= arr[3];
							billAttachment[ii]	= arr[20];
							myFile = arr[20];
						}else if(txtId != null && newFilledRows >0){
							//Fetch new Added Bills
							billDate[ii] = request.getParameter("billDate"+ii);
							billNo[ii] = request.getParameter("billNo"+ii);
							billDesc[ii] = request.getParameter("billDesc"+ii);
							billAmount[ii] = request.getParameter("billAmount"+ii);
							billAttachment[ii] = request.getParameter("billAttachment"+ii);
						}else{
							//Fetch Added Bills
							billDate[ii] = request.getParameter("billDate"+ii);
							billNo[ii] = request.getParameter("billNo"+ii);
							billDesc[ii] = request.getParameter("billDesc"+ii);
							billAmount[ii] = request.getParameter("billAmount"+ii);
							billAttachment[ii] = request.getParameter("billAttachment"+ii);
						}
	%>
						<input type="hidden" name="billDate<%=ii%>" value="<%=billDate[ii]%>">
						<input type="hidden" id="billNo" name="billNo<%=ii%>" value="<%=billNo[ii]%>">
						<input type="hidden" id="billDesc" name="billDesc<%=ii%>" value="<%=billDesc[ii]%>">
						<input type="hidden" id="billAmount" name="billAmount<%=ii%>" value="<%=billAmount[ii]%>">
						<input type="hidden" id="newFilledRows" name="newFilledRows" value="<%=newFilledRows%>">
						<input type="hidden" id="editDetailsSize" name="editDetailsSize" value="<%=editMedicalClaimDetails.size()%>">
						<tr>
						<td class="normal" width="5%"style="border-bottom:1px solid #E8E8E8"><%=ii%>.</td>
						<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><%=billDate[ii]%></td>
						<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><%=billNo[ii]%></td>
						<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><%=billDesc[ii]%></td>
						<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8">Rs.&nbsp;<%=billAmount[ii]%>&nbsp;</td>
						<td class="normal" width="10%"style="border-bottom:1px solid #E8E8E8;text-align:center;">
						<a id="displayAttachment<%=ii%>" href="javascript:void(0);" onclick ="showCurrentFile('<%=billAttachment[ii]%>','','','<%=txtId%>');"><img src="../images/Downloads-icon.png" border="0" height="12px" width="12px" title="<%=billAttachment[ii]%>"><%--  <span class="glyphicon glyphicon-download" title="<%=billAttachment[ii]%>"></span>  --%></a>
						<a id="deleteAttachment<%=ii%>" href="javascript:void(0);" onclick ="delAttachment('displayAttachment<%=ii%>','deleteAttachment<%=ii%>','anchorAttachment<%=ii%>');"><img src="../images/icons8-cancel-48.png" height="12px" width="12px" ></a>
						<a id="anchorAttachment<%=ii%>" href="javascript:void(0);" onclick ="attachmentFileSubord('<%=ii%>','');" style="display:none;"><img src="../images/attachment.gif"></a>
						<input type="hidden" id="newBillAttachment<%=ii%>" name="newBillAttachment<%=ii%>" value="">
						<div id="attachment<%=ii%>" name="attachment<%=ii%>" align="center" ></div>
						</td>
						<td class="normal"width="15%"style="border-bottom:1px solid #E8E8E8">
<%						
						if(ii<savedBills){
%>
							<a href="javascript:removeBill(<%=ii%>,<%=id%>,<%=newFilledRows%>)" class="normal"><u>delete</u></a>
<%
						}else{
%>
							&nbsp;&nbsp;-
<%						}
%>
					<%-- <%=billAttachment[ii]%> --%>
					
					<%-- <span name ="myFile<%=ii%>" id="myFile<%=ii%>" >
			  		<a  href="javascript:void(0);" onclick ="javascript:showCurrentFile1('<%=billAttachment[ii]%>','<%=emailId%>','<%=ii%>','<%=ii%>');""><%=(billAttachment[ii] == null) ? "" : billAttachment[ii]%></a>
			  		</span> --%>
							</td>
						</tr>
<%					}
				}
				for(int ii = (newFilledRows+1);ii<=(newFilledRows+5);ii++){
%>
				<tr>
					<td class="normal" style="border-bottom:1px solid #EFEFEF"><%=ii%>.</td>
					<td class="normal" style="border-bottom:1px solid #EFEFEF"><input type="text" class="normal" id="billDate"name="billDate<%=ii%>" onfocus="showCalendarControl(this);" readOnly></td>
					<td class="normal" style="border-bottom:1px solid #EFEFEF"><input class="normal" TYPE="text" id="billNo" name="billNo<%=ii%>"></td>
					<td class="normal" style="border-bottom:1px solid #E8E8E8; width:160px;"><textarea class="normal" id="billDesc" name="billDesc<%=ii%>" size="10"maxlength="255"></textarea></td>
					<td class="normal" style="border-bottom:1px solid #EFEFEF">Rs.<input type="text" class="normal" id="billAmount"name="billAmount<%=ii%>" size="10" maxlength="100" onblur="addAll(<%=newFilledRows+5%>)"/>
					</td>
					<td name ="myFile<%=ii%>" id="myFile<%=ii%>" class="normal" style="border-bottom:1px solid #EFEFEF;text-align:center;">

						<input type="hidden" id="billAttachment<%=ii%>" name="billAttachment<%=ii%>" value="">
						<a id="anchorAttachment<%=ii%>" href="javascript:attachmentFileSubord('<%=ii%>','');">
							<img src="../images/attachment.gif">
						</a>
						<div id="attachment<%=ii%>" name="attachment<%=ii%>" align="center" ></div>
					</td>
					<td class="normal" style="border-bottom:1px solid #EFEFEF">&nbsp;&nbsp;-</td>
				</tr>
<%   
				}
%>
				</tr>
				<tr>
					<td class="normal" width="5%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
					<td class="normal"   width="20%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
					<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
					<td class="bold" width="20%"style="border-bottom:1px solid #E8E8E8">TOTAL</td>
					<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8">Rs.<input type="text" class="normal" id="total" name="total" value="0" size="10" maxlength="100"/></td>
					<td class="normal" width="15%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
				</tr>
			</table>
		</tr>
		<tr>
			<td width="100%"align="right"colspan="7">
			<a href="javascript:validate(<%=noOfBills%>,'add_req')" class="bold"><img src="../images/but_addMoreBills.gif" border="0"></a>&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td width="100%"align="center"colspan="7">
			<a href="javascript:validate(<%=noOfBills%>,'pre_req')"><img src="../images/but_preview.gif" border="0"><a/>&nbsp;&nbsp;
			<a href="javascript:clear()"><img src="../images/but_reset.gif" border="0"></a></td>
		</tr>
    </form>
</table>
</body>
<%
			}else{
%>
				<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
				 <%@ include file="../includes/genericClaimHeader.html" %>
				 <%@ include file="../includes/genericClaimMenu.jsp" %> 
				   <table width="100%" border="0" cellspacing="1" cellpadding="2">
						<tr>
							<td class="whitesmall" bgcolor="#000000" align="center" colspan ="8" height="20" color="#ffffff">GENERIC REIMBURSEMENT CLAIM FORM</td>
						</tr>
						<tr>
							<td height="15"colspan="100%"><block type="spacer" height="15"></td>
						</tr>
						 <tr>
							<td colspan="100%" align="left" class="normal" height="20">Your Balance Amount is <span class="bold"><u>Rs. <%=balanceAmt%></u></span></td>
						</tr>
						<tr>
							<td colspan="100%" align="center" class="bold" height="15">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="100%" align="center" class="bold" height="20">	YOU ARE NOT ENTITLED TO FILE THE CLAIM OR NO BALANCE IS AVAILABLE !!!</td>
						</tr>
				   </table>
				</body>
<%        
         }	
%>
</html>