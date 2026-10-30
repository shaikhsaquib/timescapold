<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%
	Hashtable priceData  = new Hashtable();
	Hashtable vendorData = new Hashtable();
	Hashtable commentsData = new Hashtable();
	Hashtable userTable	 = new Hashtable();

	boolean status			= false;
	boolean status1			= false;
	boolean status2			= false;
	boolean status3			= false;

String origin			        = "NA";
String category			        = "NA";
String vendorName               = "NA";
String mill			            = "NA";
String paymentTerms		        = "NA";
String sourcing			        = "NA";
String quantity			        = "NA";
String deliveryIn		        = "NA";
String quality			        = "NA";
String gsm			            = "NA";
String thisLot			        = "NA";
String invoicePrice             = "NA";
String risi			            = "NA";
String aopreceiptprice          = "NA";
String aopreceiptforex          = "NA";
String aopdealvalue         = "NA";
String totalprice1              = "NA";
String totalprice2              = "NA";
String totalprice3		        = "NA";
String cusduty1			        = "NA";
String cusduty2			        = "NA";
String cusduty3			        = "NA";
String freight1			        = "NA";
String freight2			        = "NA";
String freight3			        = "NA";
String insurance1               = "NA";
String insurance2               = "NA";
String insurance3               = "NA";
String totalcost1               = "NA";
String totalcost2               = "NA";
String totalcost3		        = "NA";
String budact1			        = "NA";
/*String budact2			    = "NA";
String budact3			        = "NA";*/
String quainv1			        = "NA";
String quainv2			        = "NA";
String expectedreceipts1        = "NA";
String expectedreceipts2        = "NA";
String estimatedcons1           = "NA";
String estimatedcons2           = "NA";
String quarterend1			    = "NA";
String quarterend2			    = "NA";
/*String earliercontracted1     = "NA";
String earliercontracted2       = "NA";
String expcover1                = "NA";
String expcover2                = "NA";
String currentcontarct1         = "NA";
String currentcontarct2         = "NA";*/
String annualBudget             = "NA";
String contractedTons           = "NA";
String currentquarter           = "NA";
String balance			        = "NA";
String otherRemarks             = "NA";
String marketEvents             = "NA";
String ammenRemarks             = "NA";
String app1                     = "NA";
String app2			            = "NA";
String app3 			        = "NA";
String app4			            = "NA";
String app5                     = "NA";
String app6			            = "NA";

String sanctionedRefType	    = "NA";
String refNumber			    = "NA";
String dateOfApproval		    = "NA";

	String createdby		= "NA";
	String createdon		= "NA";
	String modifiedby		= "NA";
	String modifiedon		= "NA";
	String userstatus		= "NA";
    sanctionedRefType	= (String)request.getParameter("sanctionedRefType");
	refNumber			= (String)request.getParameter("refNumber");
	dateOfApproval		= (String)request.getParameter("dateOfApproval");

String  priceCounter = (String)request.getParameter("priceid");
	
origin                      = (String)request.getParameter("origin");
category                    = (String)request.getParameter("category");
vendorName                  = (String)request.getParameter("vendorName");
mill					    = (String)request.getParameter("mill");
paymentTerms                = (String)request.getParameter("paymentTerms");
sourcing                    = (String)request.getParameter("sourcing");
quantity                    = (String)request.getParameter("quantity");
deliveryIn                  = (String)request.getParameter("deliveryIn");
quality                     = (String)request.getParameter("quality");
gsm                         = (String)request.getParameter("gsm");
thisLot                     = (String)request.getParameter("thisLot");
invoicePrice                = (String)request.getParameter("invoicePrice");
risi                        = (String)request.getParameter("risi");
aopreceiptprice             = (String)request.getParameter("aopreceiptprice");
aopreceiptforex             = (String)request.getParameter("aopreceiptforex");
aopdealvalue            = (String)request.getParameter("aopdealvalue");
totalprice1                 = (String)request.getParameter("totalprice1");
totalprice2                 = (String)request.getParameter("totalprice2");
totalprice3                 = (String)request.getParameter("totalprice3");
cusduty1                    = (String)request.getParameter("cusduty1");
cusduty2                    = (String)request.getParameter("cusduty2");
cusduty3                    = (String)request.getParameter("cusduty3");
freight1                    = (String)request.getParameter("freight1");
freight2                    = (String)request.getParameter("freight2");
freight3                    = (String)request.getParameter("freight3");
insurance1                  = (String)request.getParameter("insurance1");
insurance2                  = (String)request.getParameter("insurance2");
insurance3                  = (String)request.getParameter("insurance3");
totalcost1                  = (String)request.getParameter("totalcost1");
totalcost2                  = (String)request.getParameter("totalcost2");
totalcost3                  = (String)request.getParameter("totalcost3");
budact1                     = (String)request.getParameter("budact1");
quainv1                     = (String)request.getParameter("quainv1");
quainv2                     = (String)request.getParameter("quainv2");
expectedreceipts1           = (String)request.getParameter("expectedreceipts1");
expectedreceipts2           = (String)request.getParameter("expectedreceipts2");
estimatedcons1              = (String)request.getParameter("estimatedcons1");
estimatedcons2              = (String)request.getParameter("estimatedcons2");
quarterend1                 = (String)request.getParameter("quarterend1");
quarterend2                 = (String)request.getParameter("quarterend2");
annualBudget                = (String)request.getParameter("annualBudget");
contractedTons              = (String)request.getParameter("contractedTons");
currentquarter              = (String)request.getParameter("currentquarter");
balance                     = (String)request.getParameter("balance");
otherRemarks                = (String)request.getParameter("otherRemarks");
marketEvents                = (String)request.getParameter("marketEvents");
ammenRemarks                = (String)request.getParameter("ammenRemarks");
app1                        = (String)request.getParameter("bussinessAndCommercial");
app2                        = (String)request.getParameter("ceo");
app3                        = (String)request.getParameter("director");
app4                        = (String)request.getParameter("coo");
app5                        = (String)request.getParameter("epSupplyChain");
app6				        = (String)request.getParameter("md");


	 
	 createdby			= Long.toString(timescapeUserOId);
	 createdon			= "NA";
	 modifiedby			= Long.toString(timescapeUserOId);
	 modifiedon			= "NA";
     String flag         = (String)request.getParameter("flag");

	userstatus  = "UCA";

	priceData.put("ORIGIN",Utility.replaceQuoteOracle(origin));
	priceData.put("CATEGORY",Utility.replaceQuoteOracle(category));
	priceData.put("CREATOROID",Utility.replaceQuoteOracle(createdby));
	priceData.put("VENDORNAME",Utility.replaceQuoteOracle(vendorName));
	priceData.put("MILL",Utility.replaceQuoteOracle(mill));
	priceData.put("PAYMENTTERMS",Utility.replaceQuoteOracle(paymentTerms));
	priceData.put("SOURCING",Utility.replaceQuoteOracle(sourcing));
	priceData.put("QUANTITY",Utility.replaceQuoteOracle(quantity));
	priceData.put("DELIVERYIN",Utility.replaceQuoteOracle(deliveryIn));

	priceData.put("QUALITY",Utility.replaceQuoteOracle(quality));
	priceData.put("GSM",Utility.replaceQuoteOracle(gsm));
	priceData.put("THISLOT",Utility.replaceQuoteOracle(thisLot));
	priceData.put("INVOICEPRICE",Utility.replaceQuoteOracle(invoicePrice));
	priceData.put("RISI",Utility.replaceQuoteOracle(risi));
	priceData.put("AOPRECEIPTPRICE",Utility.replaceQuoteOracle(aopreceiptprice));
	priceData.put("AOPRECEIPTFOREX",Utility.replaceQuoteOracle(aopreceiptforex));
	priceData.put("AOPDEALVALUE",Utility.replaceQuoteOracle(aopdealvalue));
	priceData.put("TOTALPRICE1",Utility.replaceQuoteOracle(totalprice1));
	priceData.put("TOTALPRICE2",Utility.replaceQuoteOracle(totalprice2));
	priceData.put("TOTALPRICE3",Utility.replaceQuoteOracle(totalprice3));
	priceData.put("CUSDUTY1",Utility.replaceQuoteOracle(cusduty1));

	priceData.put("CUSDUTY2",Utility.replaceQuoteOracle(cusduty2));
	priceData.put("CUSDUTY3",Utility.replaceQuoteOracle(cusduty3));
	
	priceData.put("FREIGHT1",Utility.replaceQuoteOracle(freight1));
	priceData.put("FREIGHT2",Utility.replaceQuoteOracle(freight2));
	priceData.put("FREIGHT3",Utility.replaceQuoteOracle(freight3));
	priceData.put("INSURANCE1",Utility.replaceQuoteOracle(insurance1));
	priceData.put("INSURANCE2",Utility.replaceQuoteOracle(insurance2));
	priceData.put("INSURANCE3",Utility.replaceQuoteOracle(insurance3));
	priceData.put("TOTALCOST1",Utility.replaceQuoteOracle(totalcost1));
	priceData.put("TOTALCOST2",Utility.replaceQuoteOracle(totalcost2));
	priceData.put("TOTALCOST3",Utility.replaceQuoteOracle(totalcost3));
	priceData.put("BUDACT1",Utility.replaceQuoteOracle(budact1));
	/*priceData.put("BUDACT2",Utility.replaceQuoteOracle(budact2));
	priceData.put("BUDACT3",Utility.replaceQuoteOracle(budact3));*/
	priceData.put("QUAINV1",Utility.replaceQuoteOracle(quainv1));
	priceData.put("QUAINV2",Utility.replaceQuoteOracle(quainv2));
	priceData.put("EXPECTEDRECEIPTS1",Utility.replaceQuoteOracle(expectedreceipts1));
	priceData.put("EXPECTEDRECEIPTS2",Utility.replaceQuoteOracle(expectedreceipts2));
	priceData.put("ESTIMATEDCONS1",Utility.replaceQuoteOracle(estimatedcons1));
	priceData.put("ESTIMATEDCONS2",Utility.replaceQuoteOracle(estimatedcons2));

	priceData.put("QUARTEREND1",Utility.replaceQuoteOracle(quarterend1));
	priceData.put("QUARTEREND2",Utility.replaceQuoteOracle(quarterend2));
/*	priceData.put("EARLIERCONTRACTED1",Utility.replaceQuoteOracle(earliercontracted1));
	priceData.put("EARLIERCONTRACTED2",Utility.replaceQuoteOracle(earliercontracted2));
	priceData.put("CURRENTCONTARCT1",Utility.replaceQuoteOracle(currentcontarct1));
	priceData.put("CURRENTCONTARCT2",Utility.replaceQuoteOracle(currentcontarct2));
	priceData.put("EXPCOVER1",Utility.replaceQuoteOracle(expcover1));
	priceData.put("EXPCOVER2",Utility.replaceQuoteOracle(expcover2));*/
	priceData.put("ANNUALBUDGET",Utility.replaceQuoteOracle(annualBudget));
	priceData.put("CONTRACTEDTONS",Utility.replaceQuoteOracle(contractedTons));
	priceData.put("CURRENTQUARTER",Utility.replaceQuoteOracle(currentquarter));
	priceData.put("BALANCE",Utility.replaceQuoteOracle(balance));
	priceData.put("OTHERREMARKS",Utility.replaceQuoteOracle(otherRemarks));
	priceData.put("MARKETEVENTS",Utility.replaceQuoteOracle(marketEvents));
	priceData.put("AMMENREMARKS",Utility.replaceQuoteOracle(ammenRemarks));
	priceData.put("BUSSINESSANDCOMMERCIAL",app1);
	priceData.put("CEO",app2);
	priceData.put("DIRECTOR",app3);
	priceData.put("COO",app4);
	priceData.put("EPSUPPLYCHAIN",app5);
	priceData.put("MD",app6);
	priceData.put("CREATEDBY",createdby);
	priceData.put("CREATEDON","SYSDATE");
	priceData.put("MODIFIEDBY",modifiedby);
	priceData.put("MODIFIEDON","SYSDATE");
	priceData.put("STATUS",userstatus);

	priceData.put("SANCTIONEDREFTYPE",sanctionedRefType);
	priceData.put("REFNUMBER",refNumber);
	priceData.put("DATEOFAPPROVAL",dateOfApproval);
	priceData.put("PRICEID",priceCounter);



	long vendorCounter = priceApprovalWebController.getVendorCountNp();


	if(vendorCounter == 0)
	{
		vendorCounter = 100000;
	}


	long commentCounter = priceApprovalWebController.getCommentsCountNp();


	if(commentCounter == 0)
	{
		commentCounter = 200000;
	}


	String counters			= (String)request.getParameter("count");
	String counters1		= (String)request.getParameter("count2");
    int counter				= 0;
    int counter1			= 0;
	 
        counter             = Integer.parseInt(counters);
        counter1            = Integer.parseInt(counters1);

	for(int i = 1; i <= counter; i++)
	{
		vendorData.put("v"+i,(String)Utility.replaceQuoteOracle(request.getParameter("v"+i)));
		vendorData.put("c"+i,(String)Utility.replaceQuoteOracle(request.getParameter("c"+i)));
		vendorData.put("m"+i,(String)Utility.replaceQuoteOracle(request.getParameter("m"+i)));
		vendorData.put("g"+i,(String)Utility.replaceQuoteOracle(request.getParameter("g"+i)));
		vendorData.put("a"+i,(String)Utility.replaceQuoteOracle(request.getParameter("a"+i)));
		vendorData.put("oq"+i,(String)Utility.replaceQuoteOracle(request.getParameter("oq"+i)));
		vendorData.put("op"+i,(String)Utility.replaceQuoteOracle(request.getParameter("op"+i)));
		vendorData.put("fq"+i,(String)Utility.replaceQuoteOracle(request.getParameter("fq"+i)));
		vendorData.put("fp"+i,(String)Utility.replaceQuoteOracle(request.getParameter("fp"+i)));
	}

	vendorData.put("CREATEDBY",createdby);
	vendorData.put("CREATEDON","SYSDATE");
	vendorData.put("MODIFIEDBY",modifiedby);
	vendorData.put("MODIFIEDON","SYSDATE");
	vendorData.put("STATUS",userstatus);

    for(int j = 1; j <= counter1; j++)
	{
		commentsData.put("vn"+j,(String)Utility.replaceQuoteOracle(request.getParameter("vn"+j)));
		commentsData.put("co"+j,(String)Utility.replaceQuoteOracle(request.getParameter("co"+j)));
		commentsData.put("mill"+j,(String)Utility.replaceQuoteOracle(request.getParameter("mill"+j)));
		commentsData.put("gr"+j,(String)Utility.replaceQuoteOracle(request.getParameter("gr"+j)));
		commentsData.put("qscr"+j,(String)Utility.replaceQuoteOracle(request.getParameter("qscr"+j)));
		commentsData.put("rem"+j,(String)Utility.replaceQuoteOracle(request.getParameter("rem"+j)));
	}

	commentsData.put("CREATEDBY",createdby);
	commentsData.put("CREATEDON","SYSDATE");
	commentsData.put("MODIFIEDBY",modifiedby);
	commentsData.put("MODIFIEDON","SYSDATE");
	commentsData.put("STATUS",userstatus);

	status  = priceApprovalWebController.updateRequestNp(priceData);

    if(status == true )
	    {
	        status3 = priceApprovalWebController.deleteOfferAndCommentData(priceCounter);
        }

    if(status3 == true )
	    {
	        status1 = priceApprovalWebController.insertVendorDataNp(vendorData, counter, priceCounter, vendorCounter);
        }

    if(status1 == true )
	    {
	        status2 = priceApprovalWebController.insertCommentDataNp(commentsData,counter1, priceCounter, commentCounter);
        }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - UPDATE DATA</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<script Language="JavaScript" src="../jscripts/newsprint.js"></script>
</head>
<body>
<% if(status == true && status1 == true && status2 == true)
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

	        <tr><td colspan="2" align="center"><span class="normal">Draft Saved successfully...</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="viewStatusnp.jsp" class="normal"><b>here</b></a> to check the status</td></tr>
			</table>
<%}
		else{
%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Sorry there was an Error while creating your request.</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<!-- <tr><td colspan="2" align="center" class="normal">Click <a href="viewStatusnp.jsp" class="normal"><b>here</b></a> to buyers status page</td></tr> -->
			<tr><td colspan="2" align="center" class="normal">Click <a href="../indexnp.jsp" class="normal"><b>here</b></a> to buyers status page</td></tr>
			</table>
<%}%>
</body>
</html>