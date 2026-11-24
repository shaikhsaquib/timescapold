<%--
 -- @(#)processRequest.jsp	15/3/2008
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
 -- @version 	1.00, 15/3/2008
  -- @author	Sachin Kale
 -- @version 	2.00, 6/2/2009
 --%>

<%@ page language="java"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/sapCompCompany.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="vehicleClaimController" class="com.bccl.claim.web.controllerbeans.VehicleClaimController" /> 


<%
	GregorianCalendar today = new GregorianCalendar();
	Calendar cal = Calendar.getInstance();
	int lastYear = cal.get(Calendar.YEAR)-1;
	int currYear = cal.get(Calendar.YEAR);
	int selYear = 0;

	ArrayList claimRequests = null;
	String txnStatus = "L";
    ArrayList companyList  = new ArrayList( );

	String option   = (String)request.getParameter("option");
    String compCode = (String)request.getParameter("compCode");
    String role     = (String)session.getAttribute("medicalClaimRole");

    //Set session attribute for the link of current page
	session.setAttribute("currLink", "../processor/processRequest.jsp");
	session.setAttribute("topLink", role);
	//out.println(option+" "+compCode+" "+role);


%>
<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		<script Language="JavaScript" src="../jscripts/processRequest.js">
		 </script>
	 </head>

  <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <%@ include file="../includes/medicalClaimHeader.html" %>
 <%@ include file="../includes/medicalClaimMenu.jsp" %> 
<table width="100%" border="0" cellspacing="1" cellpadding="2">
<form name="frmProcessRequest" method="post">
<input type="hidden" name="option" value="1">
<input type="hidden" name="txnId" value="">
<input type="hidden" name="payId" value="">
<input type="hidden" name="effectiveMonth" value="">
<input type="hidden" name="claimAmount" value="">
<input type="hidden" name="appln" value="">
<input type="hidden" name="requestorName" value="">
<input type="hidden" name="requestorEmailId" value="">
    <tr>
        <td colspan="100%"><table width="100%" border="0" cellspacing="1" cellpadding="2">
            <tr>
                <td bgcolor="#000000" colspan="40%" class="whitesmall" height="20" valign="middle">PENDING VEHICLE LEASE REIMBURSEMENT REQUESTS IN CURRENT FINANCIAL YEAR </td>
<%
//out.println("role"+role);
    if(role.equals("2")){
        companyList = vehicleClaimController.listCompanies(timescapeUserOId);
	//	out.println("companyList.size()"+companyList.size());
    }else if(role.equals("3")){
					//companyList  = listDomainObjectsController.getCompanyList();
					companyList = companiesList;
    }
	//out.println(companyList.size());
%>
                <td bgcolor="#000000" class="whitesmall" height="20" valign="middle">Select Company&nbsp;: &nbsp;&nbsp;<%@ include file="../utils/companies.jsp"%>&nbsp;&nbsp;<a href="javascript:showData()"><img src="../images/greyarrow.gif" valign="bottom" border="0"></a></td>
            </tr>
            </table>
        </td>
    </tr>
	<tr bgcolor="#CCCCCC">
		<td class="boldsmall" width="11%" height="20">&nbsp;TXN ID</td>
		<td class="boldsmall" width="15%" height="20">&nbsp;NAME</td>
		<td class="boldsmall" width="10%" height="20"><!-- PAYROLL ID -->SAP ID</td>
		<td class="boldsmall" width="10%" height="20">LOCATION</td>
<!-- 	<td class="boldsmall" width="10%" height="20">DEPARTMENT</td>
		<td class="boldsmall" width="20%" height="20">COMPANY</td> -->
		<td class="boldsmall" width="10%" height="20">APPLIED DATE</td>
		<td class="boldsmall" width="8%" height="20">CLAIM AMT</td>
		<td class="boldsmall" width="12%" height="20">PROCESS REQUEST</td>
    </tr>
<%	
	if(option == null && compCode==null)// load the page(default) 
    {
		//out.println("hi");
        //Get All the Requests Pending for processing
        String company[] = (String[]) companyList.get(0);	
        compCode = company[0];
		out.println("compCode--"+compCode);
    }
%>
<input type="hidden" name="compCode" value="<%=compCode%>">
<%
    //Get All the Requests Pending for processing by companyvise
    claimRequests = vehicleClaimController.viewRequest(timescapeUserOId,txnStatus,compCode,role);
    int listSize=claimRequests.size();
    session.setAttribute("claimRequests",claimRequests);

    if(claimRequests.isEmpty())
	{
%>
	<tr width="100%" align="center" class="normal">
		<td colspan="100%" height="40" >No pending Request(s) to be processed for selected Company !</td>
	</tr>
<%
	} else {
		String txnIds = "";
		for(int kk=0; kk<claimRequests.size(); kk++)
		{		
			String[] appl = (String[])claimRequests.get(kk);
            String checkName = "process" +kk;
			String reasonName = "reason" +kk;
			//out.println("appl[12]=="+appl[12]);
			txnIds+= appl[12]+",";
			//out.println("==="+appl[12]);
%>

	<tr>
        <td class="normal" valign="middle"><input type="checkbox" name="<%=checkName%>" value="acc">&nbsp;
        <a href="javascript:void window.open('../common/requestDetails.jsp?id=<%=kk%>','','resizable=yes,scrollbars=yes,toolbars=no,width=750,height=500,top=100,left=50')" class="normal"><u><%=appl[12]%></u></a>
		</td>
		<td class="normal"  height="30"><%=appl[6]%></td>
		<td class="normal"  height="30"><%=appl[3]%></td>
		<td class="normal"  height="30"><%=appl[8]%></td>
<!-- 	<td class="normal"  height="30"><%=appl[10]%></td>
		<td class="normal"  height="30"><%=appl[7]%></td> -->
        <td class="normal"  height="30"><%=appl[15]%></td>
		<td class="normal"  height="30">Rs.<%=appl[13]%></td>
		<td class="normal"  height="30">
		<a href="javascript:legacyData(<%=kk%>,'<%=appl[1]%>','<%=appl[2]%>','<%=Utility.replaceQuoteJS(appl[6])%>','<%=appl[16]%>',<%=appl[13]%>)" class="normal"><u>verify</u></a> / <a href="javascript:sendMail(<%=appl[12]%>,'Medical claim','<%=Utility.replaceQuoteJS(appl[6])%>','<%=appl[4]%>','<%=appl[1]%>')" class="normal"><u>send mail</u></a>
		</td>
    </tr>
<%
		}
		txnIds = txnIds.substring(0,txnIds.length()-1);
		session.setAttribute("VEH_IDS", txnIds);
%>
    <tr align="center">
		<td colspan="100%" height="30px"><block type="spacer" height="30px"></td>
	</tr>
    <tr align="center">
        <td colspan="100%"><input type="button" class="button white" name="submit2" value="Accept" onclick="javascript:process(<%=listSize%>)"></td>
	</tr>
<%
	}//end of if
%>

</table>
</form>
</body>
</html> 