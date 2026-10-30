<%--
 -- @(#)excelviewallrequest.jsp	15-09-15
 --
 -- Copyright 2012 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Krishna Vishwakarma
 -- @version 	1.00, 15-09-15
 --%>
<%@ page language="java" %>
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
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" />
<% 
    ArrayList numIndex = new ArrayList();
    ArrayList lstXls = new ArrayList();
    String[] listArray = null;
    String fileName = "ANNUAL_LTA_DATA.csv";
    StringBuffer csvContent = new StringBuffer();
    String headerStr = "";
    String transactionId="";
    String employeeName = "";
    String sapNumber="";
    String exemption = "";
    String proposedAmount="";
    String approvedAmount="";
    //String remarks="";
    String remarks="";
    String requestedOn="";
    String processedOn="";
    String status1="";
    String noapplication="";
    String location="";
    String faYear="";
    

	ArrayList result = new ArrayList();
      
    //status			=	"A";
    Hashtable ltaIdHash	=	new Hashtable();
    String  timescapeUid			= Long.toString(timescapeUserOId);

    String sapCheck = (String) request.getParameter("id");
    String appCheck = (String) request.getParameter("applicationId");
    //if(sapCheck == null && appCheck == null )
    if((sapCheck == null || sapCheck.equals("null"))&& (appCheck == null || appCheck.equals("null")))
    {
          ltaIdHash.put("TIMESCAPEUID",timescapeUid);

      result = ltaController.getAllrequests(ltaIdHash);
    }else{

    String idForRecord		="";
    String flag		="";
           idForRecord     = (String) request.getParameter("id");
           flag     = (String) request.getParameter("app");
           
    if(idForRecord == null)
    {  
        idForRecord     = (String) request.getParameter("applicationId");
    }

    if(idForRecord == null)
    {
      idForRecord="0";
    }

    if(flag == null)
    {
      ltaIdHash.put("SAPID",idForRecord);
    }
else{
      ltaIdHash.put("APPLICATIONID",idForRecord);
    }
      ltaIdHash.put("TIMESCAPEUID",timescapeUid);


result = ltaController.getAllrequests(ltaIdHash);
}
	

	if(result.size() > 0) {


    for (int i = 0; i < result.size(); i++) {

        String tmpArr[] = (String [])result.get(i); 
 

String faYear1 =tmpArr[4];
int nextYear = Integer.parseInt(faYear1)+1;

       	
        transactionId   = tmpArr[0];
        employeeName    = tmpArr[14]; 
        sapNumber       = tmpArr[16]; 
        faYear          =  faYear1 +" - "+nextYear;
        location        = tmpArr[22]; 
if(tmpArr[1].equals("Y")){
        exemption       = "Claimed"+"("+tmpArr[9]+")";
 }else if(tmpArr[1].equals("N")){
        exemption       = "Not Claimed";
}
        proposedAmount  = tmpArr[2]; 
        approvedAmount  = tmpArr[3]; 
        remarks         = tmpArr[5]; 
        requestedOn     = tmpArr[7]; 

if(tmpArr[10].equals("A")|| tmpArr[10].equals("R") ||  tmpArr[10].equals("C")){
        processedOn     = tmpArr[9]; 

}else {
                processedOn="-";
}

        status1         = tmpArr[10];

		if(status1.equals("A"))
            {
				status1="APPROVED";
			}else if(status1.equals("L")){
				status1="IN PROCESS";
			}else if(status1.equals("R")){
				status1="REJECTED";
			}else if(status1.equals("C")){
				status1="CANCELLED";
			}
				headerStr="Application ID,Employee Name,SAP Number,	Financial Year,Location,Exemption,Proposed Amount,Approved Amount,Remarks,Requested On,Processed On,Status,\n";		            String[] xlsArray={transactionId,employeeName,sapNumber,faYear,location,exemption,proposedAmount,approvedAmount,remarks,requestedOn,processedOn,status1};
          lstXls.add(xlsArray);

  }//FOR ENDS HERE
	} else {
		noapplication=  "NO APPLICATIONS PENDING";
		String[] xlsArray1={noapplication};
		lstXls.add(xlsArray1);
    } //end of else
    StringBuffer requests = Utility.toStringBuffer(lstXls, numIndex);
	csvContent.append(headerStr);
	csvContent.append(requests);

	PrintWriter writer = null;
	response.setContentType("text/csv");
	response.setHeader("Content-disposition","Function;filename="+fileName);
	writer = response.getWriter();
	writer.println(csvContent);
	writer.flush();
	writer.close();
	
%>

