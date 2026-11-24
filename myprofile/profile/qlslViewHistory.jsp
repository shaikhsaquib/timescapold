
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@page import="com.bccl.workflow.web.util.HtmlUtil"%>
<script Language="JavaScript" src="../jscripts/bcclViewNomineeDetails.js"></script>
<script Language="JavaScript" src="../jscripts/bcclTopupAmt.js"></script>
<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" scope="session"/>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Top Up Insurance Scheme</title>
<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
        <link href="../style/style.css" rel="stylesheet" type="text/css" />
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
		<script Language="JavaScript" src="../jscripts/nominationReports.js"></script>
		
      
        <!-- <script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript">
		</script> -->
		</head>
<body>
<form name  = "frmTopupAmt" method = "post">

<%
	ArrayList resultList  = new ArrayList();
	Hashtable detailsHash = new Hashtable();
	String testYear = (String)session.getAttribute("faYear");
	//out.println(testYear);
 long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");
	
	
	detailsHash.put("timescapeUserOID",(timescapeUserOID+""));
		detailsHash.put("currYear",testYear);
	
 resultList = mediclaimController.viewTopupAmount(detailsHash); 
//out.println("resultList--"+resultList.size());
 String topupAmt = "";
 String totalcover = "";
 String preAmt = "";
 String fayear = "";
 String createdon = "";
 String createdby = "";
 String nextYear1 = (String)session.getAttribute("nextYear");
 
 

 if(resultList.size() > 0){

	 for(int i=0;i < resultList.size();i++){

		String [] tmpArr = (String[])resultList.get(i);
		 topupAmt = tmpArr[1];
		 totalcover = tmpArr[3];
		 preAmt = tmpArr[2];
		
		  fayear = tmpArr[4];
		 createdon = tmpArr[5];
		 createdby = tmpArr[7];
		 //out.println(topupAmt);
		 //out.println(preAmt);
	 }
 }

	int lastYear = 0;
	int currYear = 0;
	int selYear = 0;
	int preYear = 0;
	
	String exstingAmt = "500000";
	GregorianCalendar today = new GregorianCalendar();	
	currYear = today.get(Calendar.YEAR) ;
	String currYear1     = today.get(Calendar.YEAR)	+	"";
	
	//out.println("currYear"+currYear);
	if(today.get(Calendar.MONTH)==0 || today.get(Calendar.MONTH)==1 || today.get(Calendar.MONTH)==2){
			lastYear = currYear - 1;	
		}
		else{
			lastYear = currYear;	
		}

		preYear = lastYear - 1;

		%>

 <!-- <table border = "0" cellspacing="2" cellpadding="0" width = "100%">
<tr>
			<td align="right" class="small">
			View History - For Year <select id="year" name="year" class="small" >
				<%= HtmlUtil.getYearList(preYear,lastYear, selYear,"desc") %>
			</select>	
			<td    ><input name="go" type="button" class="small" id="go" value="Go" onclick = "javascript:go11();" /></td>  -->
			
			<!-- &nbsp;<a href="javascript:go1( )"><img src="../images/grey_arrow.gif" border="0" align="absmiddle"></a>	 -->
 <!-- </tr> 
</table> -->


 <%if(resultList.size() == 0 ){%>
<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
<tr>
<td class="normal" align = "center" width="35%" height = "10" >No Record found</td>
</tr>
</table>
<%}else if(resultList.size() > 0){%>


<br/>
<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
<!-- <tr height = "20">
<td class="normal" align = "left" width="40%" height = "10" >&nbsp; Original Insured Amount (INR):</td>
<td class="normal" align = "left" width="60%">500000</td>
</tr> -->
<tr>
<td class="normal" align = "left" width="40%" height="20">&nbsp; Top-Up Insured Amount (INR):</td>
<td class="normal" align = "left" width="60%"><%=topupAmt%></td>
</tr>
<!-- <tr>
<td class="normal" align = "left" width="40%" height="20">&nbsp; Total Policy Covered (INR):</td>
<td class="normal" align = "left" width="60%"><%=totalcover%></td>
</tr> -->
<tr>
<td class="normal" align = "left" width="40%" height="20">&nbsp; Premium Amount Incl. of Taxes (INR) :</td>
<td class="normal" align = "left" width="60%"><%=preAmt%></td>
</tr>
<!-- <tr>
<td class="normal" align = "left" width="40%" height="20">&nbsp; Financial Year</td>
<td class="normal" align = "left" width="60%"><%=fayear%>-<%=nextYear1%></td>
</tr> -->
<!-- <tr>
<td class="normal" align = "left" width="40%" height="20">&nbsp; Policy Period:</td>
<td class="normal" align = "left" width="60%">1<sup>st</sup> June to 31<sup>st</sup> May</td>
</tr> -->
<tr>
<td class="normal" align = "left" width="30%" height="20">&nbsp; Declared On:</td>
<td class="normal" align = "left" width="70%"><%=createdon%></td>
</tr>
<!-- <tr>
<td class="normal" align = "left" width="30%" height="20">&nbsp; Created By</td>
<td class="normal" align = "left" width="70%"><%//=createdby%></td>
</tr> -->

<input type = "hidden" name = "testYear" id = "testYear" value = <%=testYear%>>
<%}%>
</table>