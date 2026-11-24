
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@page import="com.bccl.workflow.web.util.HtmlUtil"%>
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
	<script Language="JavaScript" src="../jscripts/bcclViewNomineeDetails.js"></script>
	<script Language="JavaScript" src="../jscripts/bcclTopupAmt.js"></script>
	<!-- 
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript">	</script>
	-->
</head>
<body>
<form name="frmTopupAmt" method="post">

<%
	ArrayList resultList  = new ArrayList();
	Hashtable detailsHash = new Hashtable();
	String testYear = (String)session.getAttribute("faYear");
	String backYear = (String)session.getAttribute("backYear");
	String back2Year = (String)session.getAttribute("back2Year");

	//out.println("backYear..."+backYear);
	//out.println("back2Year..."+back2Year);
	//out.println(testYear);
	long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");
	
	if((companyCode.equals("1000") ) && (!(deptName.equals("1296")|| deptName.equals("1297")|| deptName.equals("1298")|| deptName.equals("1299")|| deptName.equals("1300")|| deptName.equals("1498")|| deptName.equals("1499")|| deptName.equals("1500")|| deptName.equals("1501")|| deptName.equals("1559")|| deptName.equals("1560")|| deptName.equals("1581")|| deptName.equals("1582")|| deptName.equals("1784")|| deptName.equals("1785")|| deptName.equals("1786")|| deptName.equals("1787")|| deptName.equals("1859") || deptName.equals("1994")) )){ 
	detailsHash.put("timescapeUserOID",(timescapeUserOID+""));
	detailsHash.put("currYear",testYear);
	//detailsHash.put("backYear",backYear);
	//detailsHash.put("back2Year",back2Year);
	}else{
	detailsHash.put("timescapeUserOID",(timescapeUserOID+""));
	detailsHash.put("currYear",testYear);
	detailsHash.put("backYear",testYear);
	detailsHash.put("back2Year",testYear);
	}

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
	<!-- &nbsp;<a href="javascript:go1( )"><img src="../images/grey_arrow.gif" border="0" align="absmiddle"></a> -->	

	<!-- <table border = "0" cellspacing="2" cellpadding="0" width = "100%">
		<tr>
			<td width="80%" align="right" class="normal">View History - For Year 
				<select id="year" name="year" class="small">
					<%= HtmlUtil.getYearList(preYear, lastYear, currYear,"desc") %>
				</select>	
			<td>
			<td>&nbsp;<input name="go" type="button" class="bold" id="go" value="Go" style="width:50px;height:20px;" onclick = "javascript:go11();"/></td> 
		</tr> 
	</table> -->


<br/>
<%
//out.println(resultList.size());
	if(resultList.size() == 0 ){
%>
	<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
		<tr>
			<td class="normal" align = "center" width="35%" height = "10" >No Record found</td>
		</tr>
	</table>
<%
	}else if(resultList.size() > 0){

		if(resultList.size() == 1){
			%>
		<table border = "1" cellspacing="0" cellpadding="0" width = "100%">
<tr >
			<td class="normal" align = "center" width = "100%" colspan="4">Medical Insurance TOP UP History</td>

</tr>
	<tr>
			<td class="normal" align = "left" width = "25%" >&nbsp; Top-Up Insured Amount (INR):</td>
			<td class="normal" align = "left" width = "25%" >&nbsp; Premium Amount :</td>
			<td class="normal" align = "left" width = "25%" >&nbsp; FAYEAR :</td>
			<td class="normal" align = "left" width = "25%" >&nbsp; Declared On:</td>
		</tr>
<%
	for(int ii=0; ii< 1; ii++){
		String tmpArr[] = (String [])resultList.get(ii);
%>

		
		 <tr>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[1]%></td>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[2]%></td>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[4]%></td>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[5]%></td>

	</tr> 
	<%}
	}else if(resultList.size() == 2){
			%>
		<table border = "1" cellspacing="0" cellpadding="0" width = "100%">
<tr >
			<td class="normal" align = "center" width = "100%" colspan="4">Medical Insurance TOP UP History</td>

</tr>
	<tr>
			<td class="normal" align = "left" width = "25%" >&nbsp; Top-Up Insured Amount (INR):</td>
			<td class="normal" align = "left" width = "25%" >&nbsp; Premium Amount :</td>
			<td class="normal" align = "left" width = "25%" >&nbsp; FAYEAR :</td>
			<td class="normal" align = "left" width = "25%" >&nbsp; Declared On:</td>
		</tr>
<%
	for(int ii=0; ii< 2; ii++){
		String tmpArr[] = (String [])resultList.get(ii);
%>

		
		 <tr>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[1]%></td>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[2]%></td>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[4]%></td>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[5]%></td>

	</tr> 
	<%}
	} else if(resultList.size() > 2){

	%>
		<table border = "1" cellspacing="0" cellpadding="0" width = "100%">
<tr >
			<td class="normal" align = "center" width = "100%" colspan="4">Medical Insurance TOP UP History</td>

</tr>
	<tr>
			<td class="normal" align = "left" width = "25%" >&nbsp; Top-Up Insured Amount (INR):</td>
			<td class="normal" align = "left" width = "25%" >&nbsp; Premium Amount :</td>
			<td class="normal" align = "left" width = "25%" >&nbsp; FAYEAR :</td>
			<td class="normal" align = "left" width = "25%" >&nbsp; Declared On:</td>
		</tr>
<%
	for(int ii=0; ii< 3; ii++){
		String tmpArr[] = (String [])resultList.get(ii);
%>

		
		 <tr>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[1]%></td>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[2]%></td>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[4]%></td>
						<td class="normal" align = "left" width = "25%" ><%=tmpArr[5]%></td>

	</tr> 
	<%}%>
		<input type = "hidden" name = "testYear" id = "testYear" value = <%=testYear%>>
	</table>
<%
	}}
%>
