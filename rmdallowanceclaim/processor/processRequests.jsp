<%@ page language="java"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>

<%	
	/*GregorianCalendar today = new GregorianCalendar();
	Calendar cal = Calendar.getInstance();
//	int lastYear = 2007;
	int lastYear = cal.get(Calendar.YEAR)-1;
	int currYear = cal.get(Calendar.YEAR);
	int selYear = 0;

	ArrayList claimRequests = null;
	String txnStatus = "L";
    ArrayList companyList = new ArrayList( );

    String option  = (String)request.getParameter("option");
    String compCode  = (String)request.getParameter("compCode");
	out.println(compCode);
    String role = (String)	session.getAttribute("conveyanceClaimRole");
    
	//Set session attribute for the link of current page
	session.setAttribute("currLink", "../processor/processRequest.jsp");
	session.setAttribute("topLink", role);*/
%>
<html>
    <head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
        
		 </script>
	 </head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table>
	<tr>
		<!-- <td><a href="../../onlineleave/attendance/checkAttendance.jsp" target="_blank">Chech Attendance</a></td> -->
		<td><a href="https://bennett-sso.prd.mykronos.com/timekeeping#/timecard" target="_blank">Chech Attendance</a></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="1" cellpadding="2">
<form name="frmProcessRequest" method="post">
<input type="hidden" name="option" value="1">
<input type="hidden" name="txnId" value="">
<input type="hidden" name="appln" value="">
<input type="hidden" name="requestorName" value="">
<input type="hidden" name="requestorEmailId" value="">
	<tr>
        <td colspan="100%"><table width="100%" border="0" cellspacing="1" cellpadding="2">
           <tr>
             <td bgcolor="#000000" colspan="40%" class="whitesmall" height="20" valign="middle">PENDING REQUESTS </td>

        
    </tr>
	<tr bgcolor="#CCCCCC">
		<td class="boldsmall" width="10%" height="20">&nbsp;TXN ID</td>
		<td class="boldsmall" width="16%" height="20">&nbsp;NAME</td>
		<td class="boldsmall" width="10%" height="20">SAPNUMBER</td>
		<td class="boldsmall" width="10%" height="20">APPLIED DATE</td>
		<td class="boldsmall" width="8%" height="20">CLAIM AMT</td>
        <td class="boldsmall" width="5%" height="20">ACTION</td>
     </tr>

    
 

</table>
</form>
</body>
</html> 