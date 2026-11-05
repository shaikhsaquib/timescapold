<%--
 -- @(#)downloadReport.jsp - 11-APR-2011
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
<%@ page import = "java.util.Hashtable,java.util.Arrays, java.util.ArrayList" %>
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
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />
<%
	String fileName = "ClaimReport.csv";
	//List of all tags those are needed to read from the xml in the specific order
	String[] tags = {"travelOn", "dId","vdId"};
	ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
	String[] listArray = null;
	StringBuffer csvContent = new StringBuffer();
	ArrayList viewClaimDetails = null;
	String headerStr = "";

	viewClaimDetails = (ArrayList) session.getAttribute("claimDetailsArray");

	String[] header = (String[]) ((ArrayList)viewClaimDetails.get(0)).get(0);
	Hashtable claimHash = (Hashtable) viewClaimDetails.get(1);
	
	ArrayList claimDate = (ArrayList)claimHash.get(tags[0]);
	ArrayList claimParticulars = (ArrayList)claimHash.get(tags[1]);
	ArrayList VisitDetails = (ArrayList)claimHash.get(tags[2]);
	headerStr = "DATE, DAY, ALLOWANCE TYPE, AMOUNT, APPROVER REMARKS,REMARKS / VISIT DETAILS, STATUS \n";
	if(claimDate!=null){
    for(int ii=0; ii<claimDate.size(); ii++){
		
		String f1 = "";
		String f2 = "";
		String f3 = "";
		String f4 = "";
		String f5 = "";
		String f6 = "";
		String f7 = "";
			
		f1 = (String)((Hashtable) claimDate.get(ii)).get("date");
		f2 = (String)((Hashtable) claimDate.get(ii)).get("day");
		f3 = (String)((Hashtable) claimDate.get(ii)).get("type");
		if (claimParticulars==null){
			f4 = (String)((Hashtable) claimDate.get(ii)).get("amt");
			f5 = "-";
			f7 = (String)((Hashtable) VisitDetails.get(ii)).get("visitDetails");
			f6 = "In Process";
		}else{
			out.println("=========");
			Hashtable claimHashDetails = (Hashtable) claimParticulars.get(ii);			
			String processorStatus = "ST" + ii;			
   			processorStatus	= ( String ) claimHashDetails.get("ST");		
			f4 = (String)((Hashtable) claimParticulars.get(ii)).get("AM");
			f5 = (String)((Hashtable) claimParticulars.get(ii)).get("AR");
			f7 = (String)((Hashtable) VisitDetails.get(ii)).get("visitDetails");
			//out.println("========="+f7);
			
			if(processorStatus!=null){
			if(processorStatus.equals ("RA"))
			{			
				f6 = "Approved";	
			} else{
				f6 = "Rejected";
			}
			}
		}

			String[] xlsArray = {f1, f2, f3, f4, f5,f7, f6};
			lstXls.add(xlsArray);
			//out.println(Arrays.toString(xlsArray));
	 }
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