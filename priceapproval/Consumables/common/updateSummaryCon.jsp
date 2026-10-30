<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<%
	Hashtable priceData			= new Hashtable();
	Hashtable attachmentData	= new Hashtable();
	Hashtable userTable			= new Hashtable();

	ArrayList parIdLst			=  new ArrayList();

	boolean status				= false;
	boolean status1				= false;
	boolean status2				= false;
	boolean status3				= false;

	String userstatus			= "NA";
	String parStatus			= "NA";

	String createdby			= "NA";
	String createdon			= "NA";
	String modifiedby			= "NA";
	String modifiedon			= "NA";
	String counters				= (String)request.getParameter("count");
	userstatus					= (String)request.getParameter("userstatus");
	int counter					= 0;

	String[] parList = request.getParameterValues("parList");

	counter = Integer.parseInt(counters);
	createdby			= Long.toString(timescapeUserOId);
	createdon			= "NA";
	modifiedby			= Long.toString(timescapeUserOId);
	modifiedon			= "NA";
	//userstatus			= "UCD";
	parStatus			= "UC";

	priceData.put("PARLIST",parList);
	priceData.put("CREATEDBY",createdby);
	priceData.put("USERSTATUS",userstatus);
	priceData.put("PARSTATUS",parStatus);

	for(int i = 1; i <= counter; i++)
	{
		attachmentData.put("attach"+i+"New",(String)Utility.replaceQuoteOracle(request.getParameter("attach"+i+"New")));
		attachmentData.put("fileDesc"+i,(String)Utility.replaceQuoteOracle(request.getParameter("fileDesc"+i)));
		attachmentData.put("attachType"+i,(String)Utility.replaceQuoteOracle(request.getParameter("attachType"+i)));

	}

	attachmentData.put("CREATEDBY",createdby);
	attachmentData.put("CREATEDON","SYSDATE");
	attachmentData.put("MODIFIEDBY",modifiedby);
	attachmentData.put("MODIFIEDON","SYSDATE");
	attachmentData.put("STATUS",userstatus);


  
   String summarryCounter = (String)request.getParameter("summarryId");



	status  = priceApprovalWebController.deleteSummaryData(summarryCounter);

	if(status){

	status1  = priceApprovalWebController.insertSummarryDataCon(priceData, summarryCounter,"");

	}

	if(status1){

	status2  = priceApprovalWebController.updateSummaryStatus(priceData);

	}

	if(status2){
	status3  = priceApprovalWebController.insertSummaryAttach(attachmentData, counter,summarryCounter);

	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - SUBMIT DATA</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% if(status3)
    {

%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Your request has been created successfully...</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="../indexCon.jsp" class="normal"><b>here</b></a> to go back</td></tr>
			</table>
<%
	}else{
%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Sorry there was an Error while creating your request.</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="../indexCon.jsp" class="normal"><b>here</b></a> to go back.</td></tr>
			</table>
<%}%>
</body>
</html>
