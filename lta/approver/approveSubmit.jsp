<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 


<head>
   
    <title>LTA Application</title>
    <style type="text/css">
    body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
        text-align: center;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 13px;
        color: #333;
    }
    .bold {
        font-weight: bold;
    }
    </style>
    <link href="../style/lta.css" rel="stylesheet" type="text/css" />
    <script Language="JavaScript" src="../jscripts/approve.js"></script>
    </head>
    <body>
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td align="left" valign="top"><img src="../images/header.jpg" width="543" height="97" /></td>
    </tr>
    </table>
<%
    //out.println("here");
    String listSize             = (String) request.getParameter("listSize");
    int count                 = Integer.parseInt(listSize);
    String applicationId        = "";
    String remarks		        = "";

    String status               = "";
    //out.println(listSize);
    Hashtable ltaRecord         = new Hashtable();
    int k = 0;
    boolean queryStatus        = false;
    for(int ii = 0; ii < count; ii++){

	    String apprRadio = "apprRadio"+ii;
	
	    String values = (String) request.getParameter(apprRadio);
        //out.println(values);
	    
        if(values == null) {
		
            continue;

	    }else{
        
            if (values.equals("acc")) {

                status = "A";

            } else {

                status = "R";

            }
              
            //out.println(status);    
            applicationId    = (String) request.getParameter("applicationId" + ii);
            remarks			 = (String) request.getParameter("hrRemarks" + ii);
            //out.println("applicationId"+applicationId);
			if ( remarks.equals("") || remarks.equals(" ") || remarks == null ) {
				
				remarks	=	"NA";
			
			} 
            
            String ltaRecordArr[]   = {status, applicationId, remarks, Long.toString(timescapeUserOId)};

            ltaRecord.put(k+"",ltaRecordArr);
            
            k = k+1;

    }
    }// end of for loop
    
    queryStatus = ltaController.updateLtaRecord(ltaRecord);
    //out.println("queryStatus"+queryStatus);

    if (queryStatus) {

%>       
    

<table width="100%" border="0" cellspacing="0" cellpadding="10" align="centre">
    <tr>
        <td align="center" valign="middle"><p class="style4">Your request has been processed successfully. <br />
            Kindly <a href = "approve.jsp" class="style3Underline">click </a> here to go back</p>
        </td>
    </tr>
    <tr>
        <td height="44" align="center" valign="middle">&nbsp;</td>
    </tr>
</table>
</body>
</html>  

<%
    } else {

%>  

 <table width="100%" border="0" cellspacing="0" cellpadding="10" align="centre">
    <tr>
        <td align="center" valign="middle"><p class="style4">Sorry, There was an error processing your LTA application.</p>
        </td>
    </tr>
    <tr>
        <td height="44" align="center" valign="middle">&nbsp;</td>
    </tr>
</table>

<%
    }

%>
