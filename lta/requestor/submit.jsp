<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 

 <title>LTA Application</title>
    <style type="text/css">

    </style>
    <link href="../style/lta.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
    }
    </style>
    </head>

    <body>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="top"><img src="../images/header.jpg" width="543" height="97" /></td>
      </tr>
    </table>
<%
	String faYear= "";
  
    boolean status = false;
	GregorianCalendar thisDay = new GregorianCalendar( );
	
    faYear = thisDay.get(Calendar.YEAR) + "";
     
    status = ltaController.insertLtaRecord(timescapeUserOId, faYear);

    if (status) {

		response.sendRedirect("apply.jsp");
		return;
	}

%>      
<!--         <table width="100%" border="0" cellspacing="0" cellpadding="10" align="centre">
          <tr>
            <td align="center" valign="middle"><p class="style4">You have declared Leave Travel Allowance, <br />
          as per your entitlement to be paid on a monthly taxable basis  for the Finance Year 2011-2012 </p>
              <p><span class="style3">This application will be valid till 31st March 2012. <br />
                </span><br />
            </p></td>
          </tr>
          <tr>
            <td height="44" align="center" valign="middle">&nbsp;</td>
          </tr>
        </table>
        </body>
        </html>   -->

<%
    
%>