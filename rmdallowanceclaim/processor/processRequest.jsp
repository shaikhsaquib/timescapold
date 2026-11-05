<%@ page language="java"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />
<jsp:useBean id="listDomainObjectsController" class="com.bccl.domain.web.controllerbeans.ListDomainObjectsController" />

<%	
	
	GregorianCalendar today = new GregorianCalendar();
	Calendar cal = Calendar.getInstance();
//	int lastYear = 2007;
	int lastYear = cal.get(Calendar.YEAR)-1;
	int currYear = cal.get(Calendar.YEAR);
	int selYear = 0;

	
	String txnStatus = "L";
	ArrayList claimRequests = null;
    ArrayList companyList = new ArrayList( );

    String option  = (String)request.getParameter("option");
    String compCode  = (String)request.getParameter("compCode");
    String role = (String)	session.getAttribute("rmdClaimRole");
    
	//Set session attribute for the link of current page
	session.setAttribute("currLink", "../processor/processRequest.jsp");
	session.setAttribute("topLink", role);
	
	companyList = rmdAllowanceClaimDetails.listCompanies(timescapeUserOId);
	
%>
<html>
    <head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
        <script Language="JavaScript" src="../jscripts/processRequest.js"></script>
	 </head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	    <%@ include file="../includes/rmdClaimHeader.html" %>
		<%@ include file="../includes/rmdClaimMenu.jsp" %> 
		<table width="100%" border="0" cellspacing="1" cellpadding="2">
		<form name="frmProcessRequest" method="post">
		
		<input type="hidden" name="option" value="1">
		<input type="hidden" name="appln" value="">

		<tr>
			<td colspan="100%">
			<table width="100%" border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td bgcolor="#000000" colspan="40%" class="whitesmall" height="20" valign="middle">PENDING FIELD/NIGHT ALLOWANCE REIMBURSEMENT REQUESTS </td>  

            </tr> 
            </table>
        </td>
    </tr>
	<tr bgcolor="#CCCCCC">
		<td class="boldsmall" width="10%" height="20">&nbsp;TXN ID</td>
		<td class="boldsmall" width="16%" height="20">&nbsp;NAME</td>
		<td class="boldsmall" width="10%" height="20">PAYROLL ID</td>
		<td class="boldsmall" width="10%" height="20">APPLIED DATE</td>
		<td class="boldsmall" width="8%"  height="20">CLAIM AMT</td>
       <!--  <td class="boldsmall" width="5%"  height="20">ACCEPT&nbsp;</td> -->
        <!-- <td class="boldsmall" width="5%"  height="20">&nbsp;REJECT</td> -->
	 </tr>

<%	
	

	if(option == null && compCode == null)
    {	        
        String company[] = (String[]) companyList.get(0);
        compCode = company[0];
    }

%>

	<input type="hidden" name="compCode" value="<%=compCode%>">
<%
    //Get All the Requests Pending for processing by companyvise
    claimRequests = rmdAllowanceClaimDetails.viewRequest(timescapeUserOId,txnStatus,compCode,role,emailId);
	//out.println("claimRequests--"+claimRequests.size());
    
	session.setAttribute("claimRequests",claimRequests);
    
	String[] appl =null;
	
    if(claimRequests.size() == 0)
	{
%>
	<tr width="100%" align="center" class="normal">
		<td colspan="100%" height="40" >No pending Request(s) to be processed for selected Company !</td>
	</tr>
<%
	} else {
         String txnIds = "";
		for(int kk = 0; kk < claimRequests.size(); kk++)
		{		
			appl = (String[])claimRequests.get(kk);
            String checkName = "process" +kk;
			txnIds += appl[12]+",";
%>
	<tr>
		<td class="normal" height="20">&nbsp;
			<a href="../common/processorRequestDetails.jsp?id=<%=kk%>" target="_blank" class="normal"><u>
			<%=appl[12]%></a></u></td>
		<td class="normal"  height="30"><%=appl[6]%></td>
		<td class="normal"  height="30"><%=appl[3]%></td>
		<td class="normal"  height="30"><%=appl[15]%></td>
		<td class="normal"  height="30">Rs.<%=appl[14]%></td>
        <!-- <td class="normal" align="center" height="30"><input type="radio" name="<%//=checkName%>" value="acc"></td> -->
        <!-- <td class="normal" align="center" height="30"><input type="radio" name="<%//=checkName%>" value="rej"></td> -->
		
</tr>

<%

	}//end of for
	txnIds = txnIds.substring(0,txnIds.length()-1);
	session.setAttribute("RMD_IDS", txnIds);
}//end of else

%>
	
</table>
</form>
</body>
</html> 
