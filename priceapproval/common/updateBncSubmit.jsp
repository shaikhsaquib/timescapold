<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%
	
	String  priceCounter = (String)request.getParameter("priceid");
	
	Hashtable priceData  = new Hashtable();
	Hashtable vendorData = new Hashtable();
	Hashtable userTable	 = new Hashtable();

	boolean status			= true;
	boolean status1			= true;
	boolean status2			= true;
	boolean status3			= true;
	String requestedBy		= "NA";
	String reason4			= "NA";
	String requestedBy7		= "NA";
	String requestedBy8		= "NA";
	String reason			= "NA";
	String requestedBy9		= "NA";
	String requestedBy10	= "NA";
	String requestedBy2		= "NA";
	String requestedBy3		= "NA";
	String requestedBy4		= "NA";
	String requestedBy5		= "NA";
	String validity			= "NA";
	String fqtNumber		= "NA";
	String requestedBy6		= "NA";
	String req				= "NA";
    String reason1			= "NA";
	String reason2			= "NA";
	String reason3			= "NA";
	String reason44			= "NA";
	String reason5			= "NA";
	String reason6			= "NA";
	String reason7			= "NA";
	String reason8			= "NA";
	String reason9			= "NA";
	String reason10			= "NA";
	String attach1			= "NA";
	String attach2			= "NA";
	String attach3			= "NA";
	String attach4			= "NA";
	String attach5			= "NA";
	String attach6			= "NA";
	String attach7			= "NA";
	String attach8			= "NA";
	String attach9			= "NA";
	String attach10			= "NA";
	String reason14			= "NA";
	String reason15			= "NA";
	String reason16			= "NA";
	String fromDateAir1		= "NA";
	String fromDateAir2		= "NA";
	String fromDateAir3		= "NA";
	String fromDateAir4		= "NA";
	String fromDateAir8		= "NA";
	String fromDateAir9		= "NA";
	String recommendation	= "NA";
	String createdby		= "NA";
	String createdon		= "NA";
	String modifiedby		= "NA";
	String modifiedon		= "NA";
	String userstatus		= "NA";
	String compName1		= "NA";
	String compName2		= "NA";
	String compName3		= "NA";
	String UOM1				= "NA";
	String UOM2				= "NA";
	String UOM3				= "NA";
	String rem1				= "NA";
	String rem2				= "NA";
	String rem3				= "NA";
	String counters			= (String)request.getParameter("count");
	String category			= "NA";
	int counter				= 0;

	String sanctionedRefType	= "NA";
	String refNumber			= "NA";
	String dateOfApproval		= "NA";
	
	counter = Integer.parseInt(counters);

	sanctionedRefType	= (String)request.getParameter("sanctionedRefType");
	refNumber			= (String)request.getParameter("refNumber");
	dateOfApproval		= (String)request.getParameter("dateOfApproval");
	
	 requestedBy		= (String)request.getParameter("requestedBy");
	 reason4			= (String)request.getParameter("reason4");
	 requestedBy7		= (String)request.getParameter("requestedBy7");
	 requestedBy8		= (String)request.getParameter("requestedBy8");
	 reason				= (String)request.getParameter("reason");
	 requestedBy9		= (String)request.getParameter("requestedBy9");
	 requestedBy10		= (String)request.getParameter("requestedBy10");
	 requestedBy2		= (String)request.getParameter("requestedBy2");
	 requestedBy3		= (String)request.getParameter("requestedBy3");
	 if((request.getParameter("requestedBy4"))!=null){
	 requestedBy4		= (String)request.getParameter("requestedBy4");}
	 validity			= (String)request.getParameter("validity");
	 requestedBy5		= (String)request.getParameter("requestedBy5");
	 fqtNumber			= (String)request.getParameter("fqtNumber");
	 requestedBy6		= (String)request.getParameter("requestedBy6");
	 req				= (String)request.getParameter("req");
	 reason1			= (String)request.getParameter("reason1");
	 reason2			= (String)request.getParameter("reason2");
	 reason3			= (String)request.getParameter("reason3");
	 reason44			= (String)request.getParameter("reason44");
	 reason5			= (String)request.getParameter("reason5");
	 reason6			= (String)request.getParameter("reason6");
	 reason7			= (String)request.getParameter("reason7");
	 reason8			= (String)request.getParameter("reason8");
	 reason9			= (String)request.getParameter("reason9");
	 reason10			= (String)request.getParameter("reason10");
	 attach1			= (String)request.getParameter("attach1New");
	 attach2			= (String)request.getParameter("attach2New");
	 attach3			= (String)request.getParameter("attach3New");
	 attach4			= (String)request.getParameter("attach4New");
	 attach5			= (String)request.getParameter("attach5New");
	 attach6			= (String)request.getParameter("attach6New");
	 attach7			= (String)request.getParameter("attach7New");
	 attach8			= (String)request.getParameter("attach8New");
	 attach9			= (String)request.getParameter("attach9New");
	 attach10			= (String)request.getParameter("attach10New");
	 reason14			= (String)request.getParameter("reason14");
	 reason15			= (String)request.getParameter("reason15");
	 reason16			= (String)request.getParameter("reason16");
	 fromDateAir1		= (String)request.getParameter("fromDateAir1");
	 fromDateAir2		= (String)request.getParameter("fromDateAir2");
	 fromDateAir3		= (String)request.getParameter("fromDateAir3");
	 fromDateAir4		= (String)request.getParameter("fromDateAir4");
	 fromDateAir8		= (String)request.getParameter("fromDateAir8");
	 fromDateAir9		= (String)request.getParameter("fromDateAir9");
	 recommendation		= (String)request.getParameter("recommendation");
	 compName1			= (String)request.getParameter("compName1");
	 compName2			= (String)request.getParameter("compName2");
	 compName3			= (String)request.getParameter("compName3");
	 UOM1				= (String)request.getParameter("UOM1");
	 UOM2				= (String)request.getParameter("UOM2");
	 UOM3				= (String)request.getParameter("UOM3");
	 rem1				= (String)request.getParameter("rem1");
	 rem2				= (String)request.getParameter("rem2");
	 rem3				= (String)request.getParameter("rem3");
	 category			= (String)request.getParameter("category");

	 
	 createdby			= Long.toString(timescapeUserOId);
	 createdon			= "NA";
	 modifiedby			= Long.toString(timescapeUserOId);
	 modifiedon			= "NA";
	 //userstatus			= "UC";


	for(int i = 1; i <= counter; i++)
	{
		vendorData.put("v"+i,(String)Utility.replaceQuoteOracle(request.getParameter("v"+i)));
		vendorData.put("i"+i,(String)Utility.replaceQuoteOracle(request.getParameter("i"+i)));
		vendorData.put("f"+i,(String)Utility.replaceQuoteOracle(request.getParameter("f"+i)));
		vendorData.put("d"+i,(String)Utility.replaceQuoteOracle(request.getParameter("d"+i)));
		//vendorData.put("w"+i,(String)Utility.replaceQuoteOracle(request.getParameter("w"+i)));
		vendorData.put("pt"+i,(String)Utility.replaceQuoteOracle(request.getParameter("pt"+i)));
		vendorData.put("va"+i,(String)Utility.replaceQuoteOracle(request.getParameter("va"+i)));
	}

	vendorData.put("CREATEDBY",createdby);
	vendorData.put("CREATEDON","SYSDATE");
	vendorData.put("MODIFIEDBY",modifiedby);
	vendorData.put("MODIFIEDON","SYSDATE");
	vendorData.put("STATUS",userstatus);

	priceData.put("NEGOTIATION_PC_DATE",(String)Utility.replaceQuoteOracle(requestedBy));
	priceData.put("NEGOTIATION_PC_MEETING_VENUE",Utility.replaceQuoteOracle(reason4));
	priceData.put("NEGOTIATION_VALUE",Utility.replaceQuoteOracle(requestedBy7));
	priceData.put("FINALIZED_VENDOR_NAME",Utility.replaceQuoteOracle(requestedBy8));
	priceData.put("VALIDITY_PERIOD",Utility.replaceQuoteOracle(validity));
	priceData.put("PAYMENT_TERMS",Utility.replaceQuoteOracle(reason));
	priceData.put("SAVINGS",Utility.replaceQuoteOracle(requestedBy9));
	//Start 3/27/2014
	priceData.put("COST_AVOIDANCE",Utility.replaceQuoteOracle(requestedBy10));
	priceData.put("COMPANYNAME1",Utility.replaceQuoteOracle(compName1));
	priceData.put("COMPANYNAME2",Utility.replaceQuoteOracle(compName2));
	priceData.put("COMPANYNAME3",Utility.replaceQuoteOracle(compName3));
	priceData.put("UMO1",Utility.replaceQuoteOracle(UOM1));
	priceData.put("UMO2",Utility.replaceQuoteOracle(UOM2));
	priceData.put("UMO3",Utility.replaceQuoteOracle(UOM3));
	priceData.put("REMARKS1",Utility.replaceQuoteOracle(rem1));
	priceData.put("REMARKS2",Utility.replaceQuoteOracle(rem2));
	priceData.put("REMARKS3",Utility.replaceQuoteOracle(rem3));
	priceData.put("CATEGORY",Utility.replaceQuoteOracle(category));
	//End 3/27/2014
	priceData.put("PRODUCT_SERVICE_PROJECT_NAME",Utility.replaceQuoteOracle(requestedBy2));
	priceData.put("INDENTED_USER",Utility.replaceQuoteOracle(requestedBy3));
	
	priceData.put("PACKAGE_NAME_SANCTION",Utility.replaceQuoteOracle(requestedBy4));
	priceData.put("TOTAL_BUDGET",Utility.replaceQuoteOracle(requestedBy5));
	priceData.put("PO_COMMITTED_TILL_DATE",Utility.replaceQuoteOracle(fqtNumber));
	priceData.put("BALANCE_BUDGET",Utility.replaceQuoteOracle(requestedBy6));
	priceData.put("REQUIREMENT",Utility.replaceQuoteOracle(req));
	priceData.put("DESCRIPTION1",Utility.replaceQuoteOracle(reason1));
	priceData.put("DESCRIPTION2",Utility.replaceQuoteOracle(reason2));
	priceData.put("DESCRIPTION3",Utility.replaceQuoteOracle(reason3));
	priceData.put("DESCRIPTION4",Utility.replaceQuoteOracle(reason44));
	priceData.put("DESCRIPTION5",Utility.replaceQuoteOracle(reason5));
	priceData.put("DESCRIPTION6",Utility.replaceQuoteOracle(reason6));
	priceData.put("DESCRIPTION7",Utility.replaceQuoteOracle(reason7));
	priceData.put("DESCRIPTION8",Utility.replaceQuoteOracle(reason8));
	priceData.put("DESCRIPTION9",Utility.replaceQuoteOracle(reason9));
	priceData.put("DESCRIPTION10",Utility.replaceQuoteOracle(reason10));
	priceData.put("ATTACHMENT1",Utility.replaceQuoteOracle(attach1));
	priceData.put("ATTACHMENT2",Utility.replaceQuoteOracle(attach2));
	priceData.put("ATTACHMENT3",Utility.replaceQuoteOracle(attach3));
	priceData.put("ATTACHMENT4",Utility.replaceQuoteOracle(attach4));
	priceData.put("ATTACHMENT5",Utility.replaceQuoteOracle(attach5));
	priceData.put("ATTACHMENT6",Utility.replaceQuoteOracle(attach6));
	priceData.put("ATTACHMENT7",Utility.replaceQuoteOracle(attach7));
	priceData.put("ATTACHMENT8",Utility.replaceQuoteOracle(attach8));
	priceData.put("ATTACHMENT9",Utility.replaceQuoteOracle(attach9));
	priceData.put("ATTACHMENT10",Utility.replaceQuoteOracle(attach10));
	priceData.put("PRODUCT1",Utility.replaceQuoteOracle(reason14));
	priceData.put("PRODUCT2",Utility.replaceQuoteOracle(reason15));
	priceData.put("PRODUCT3",Utility.replaceQuoteOracle(reason16));
	priceData.put("RATE1",Utility.replaceQuoteOracle(fromDateAir1));
	priceData.put("RATE2",Utility.replaceQuoteOracle(fromDateAir2));
	priceData.put("RATE3",Utility.replaceQuoteOracle(fromDateAir3));
	priceData.put("BENCHMARK1","NA");
	priceData.put("BENCHMARK2","NA");
	priceData.put("BENCHMARK3","NA");
	priceData.put("RECOMMENEDATION",Utility.replaceQuoteOracle(recommendation));
	priceData.put("CREATEDBY",createdby);
	priceData.put("CREATEDON","SYSDATE");
	priceData.put("MODIFIEDBY",modifiedby);
	priceData.put("MODIFIEDON","SYSDATE");
	//priceData.put("STATUS",userstatus);

	priceData.put("SANCTIONEDREFTYPE",Utility.replaceQuoteOracle(sanctionedRefType));
	priceData.put("REFNUMBER",Utility.replaceQuoteOracle(refNumber));
	priceData.put("DATEOFAPPROVAL",Utility.replaceQuoteOracle(dateOfApproval));

//out.println(vendorData);

	long vendorCounter = priceApprovalWebController.getVendorCounter();

	if(vendorCounter == 0)
	{
		vendorCounter = 100000;
	}
	
	String pCounter = priceCounter;
		
	status  = priceApprovalWebController.updateBncLevelData(priceData, priceCounter);

	
	status3 = priceApprovalWebController.deleteVendorData(priceCounter);
	

	
	status1 = priceApprovalWebController.insertVendorData(vendorData, counter, pCounter, vendorCounter);
	
	String priceCounter1 = priceCounter;
	
	userTable.put("TOID",createdby);
	userTable.put("PRICEID",priceCounter1);
	userTable.put("CREATEDBY",createdby);
	userTable.put("CREATEDON","SYSDATE");
	userTable.put("MODIFIEDBY",modifiedby);
	userTable.put("MODIFIEDON","SYSDATE");
	userTable.put("STATUS",userstatus);

	status2  = priceApprovalWebController.updateUserTable(priceCounter); // change only modifiedby

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - UPDATE DATA</title>
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<link href="../style/global.css" rel="stylesheet" type="text/css" />

</head>
<body>
<% if(true)
		{
%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Your request has been modified successfully...</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="javascript:navigateCallReview();" class="normal"><b>here</b></a> to check the status</td></tr> 
			</table>
<%
		}
%>
</body>
</html>