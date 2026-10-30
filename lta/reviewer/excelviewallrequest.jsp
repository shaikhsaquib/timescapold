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
    String fileName = "MONTHLY_LTA_DATA.csv";
    StringBuffer csvContent = new StringBuffer();
    String headerStr = "";
    String transactionId="";
    String employeeName = "";
    String sapNumber="";
    String department = "";
    String designation1="";
    String branch="";
    //String remarks="";
    String DateOfJoining="";
    String requestedOn="";
    String processedOn="";
    String status1="";
    String noapplication="";
    String faYear       = "";


	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

   	GregorianCalendar thisDay = new GregorianCalendar( );
	
    int currMonth1		= thisDay.get(Calendar.MONTH);
    String currMonth	= monthArr[currMonth1]  + "";	

    faYear = thisDay.get(Calendar.YEAR) + "";
	if(currMonth.equals("JAN") || currMonth.equals("FEB")||currMonth.equals("MAR") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
	}	


	ArrayList result = new ArrayList();
      
    //status			=	"A";
    Hashtable ltaIdHash	=	new Hashtable();
    String sapCheck = (String) request.getParameter("id");
    String appCheck = (String) request.getParameter("applicationId");
    String  timescapeUid			= Long.toString(timescapeUserOId);

    //if(sapCheck == null && appCheck == null )

//System.out.println(timescapeUid);
//System.out.println(appCheck);

    if((sapCheck == null || sapCheck.equals("null"))&& (appCheck == null || appCheck.equals("null")))
    {
        ltaIdHash.put("FAYEAR",faYear);
      ltaIdHash.put("TIMESCAPEUID",timescapeUid);

      result = ltaController.getLtarecord(ltaIdHash);
//System.out.println("dfdf"+ltaIdHash);

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
    else
    {
      ltaIdHash.put("APPLICATIONID",idForRecord);

    }
        ltaIdHash.put("FAYEAR",faYear);
      ltaIdHash.put("TIMESCAPEUID",timescapeUid);

    result = ltaController.getLtarecord(ltaIdHash);
}
	

	if(result.size() > 0) {


    for (int i = 0; i < result.size(); i++) {

        String tmpArr[] = (String [])result.get(i); 
        	
        transactionId   = tmpArr[0];
        employeeName    = tmpArr[3]; 
        sapNumber       = tmpArr[5]; 
        department      = tmpArr[6]; 
        designation1    = tmpArr[7]; 
        branch          = tmpArr[12]; 
        //remarks         = tmpArr[9];
        DateOfJoining   = tmpArr[13]; 
        requestedOn     = tmpArr[10]; 
        processedOn     = tmpArr[11]; 
        status1         = tmpArr[8];

		if(status1.equals("A"))
            {
				status1="APPROVED";
			}else if(status1.equals("L")){
				status1="IN PROCESS";
			}else if(status1.equals("R")){
				status1="REJECTED";
			}
				headerStr="Transaction ID,Employee Name,SAP Number,Department,Designation,Branch,Date of Joining,Requested On,Processed On,Status,\n";		            String[] xlsArray={transactionId,employeeName,sapNumber,department,designation1,branch,DateOfJoining,requestedOn,processedOn,status1};
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

