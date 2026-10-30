<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<%
	
	String  priceCounter = (String)request.getParameter("priceid");
	
	Hashtable priceData  = new Hashtable();
	Hashtable countTechData = new Hashtable();
	Hashtable countComData = new Hashtable();
	Hashtable countEsData = new Hashtable();
	Hashtable countInData = new Hashtable();
	Hashtable userTable	 = new Hashtable();
	Hashtable venderCounters	 = new Hashtable();
	Hashtable venderIds	 = new Hashtable();

	boolean status			= false;
	boolean status1			= false;
	boolean status2			= false;
	boolean status3			= false;

	String projectName		= "NA";
	String fromContractValidity	= "NA";
	String toContractValidity	= "NA";
	String description		= "NA";
	String userGroup		= "NA";
	String contractValue	= "NA";
	String vendorName		= "NA";
	String totalBudget		= "NA";
	String paymentTerms	    = "NA";
	String sanctionNote		= "NA";
	String savings		    = "NA";
	String background		= "NA";
	String recommendation	= "NA";
	String sbd1				= "0";
	String sbd2				= "0";
	String app1				= "0";
	String app2				= "0";
	String app3				= "0";
	String app4				= "0";
	String app5				= "0";
	String app6				= "0";
	String app7				= "0";
	String app8				= "0";
	String app9				= "0";
	String app10			= "0";
	String app11			= "0";
	String app12			= "0";
	String select12			= "0";
	String select13			= "0";
	String select14			= "0";	
	String select15			= "0";
	String select16			= "0";
	String createdby		= "NA";
	String createdon		= "NA";
	String modifiedby		= "NA";
	String modifiedon		= "NA";
	String userstatus		= "NA";
	String compName1		= "NA";
	String compName2		= "NA";
	String compName3		= "NA";

	int countTech			= 0;
	int countCom			= 0;
	int countEs 			= 0;
	int countIn 			= 0;

	String countTechStr			= (String)request.getParameter("countTech");
	String countComStr 			= (String)request.getParameter("countCom");
	String countEsStr  			= (String)request.getParameter("countEs");
	String countInStr  			= (String)request.getParameter("countIn");
	

	countTech   = Integer.parseInt(countTechStr);
	countCom    = Integer.parseInt(countComStr);
	countEs     = Integer.parseInt(countEsStr);
	countIn     = Integer.parseInt(countInStr);


	String category			= "NA";
	String company			= "NA";
	int counter				= 0;

	String sanctionedRefType	= "NA";
	String refNumber			= "NA";
	String dateOfApproval		= "NA";
    String folderName               ="";
    String hiddenFileNameComp       ="";
    folderName="compulsory"+","+"additional";
	//counter = Integer.parseInt(counters);

    sanctionedRefType	= (String)request.getParameter("sanctionedRefType");
    refNumber			= (String)request.getParameter("refNumber");
    dateOfApproval		= (String)request.getParameter("dateOfApproval");

    projectName		    = (String)request.getParameter("projectName");
    fromContractValidity	= (String)request.getParameter("fromContractValidity");
    toContractValidity= (String)request.getParameter("toContractValidity");
    contractValue	    = (String)request.getParameter("contractValue");
    description		    = (String)request.getParameter("description");
	
        description = description.replaceAll("[^\\p{ASCII}]", "");

    userGroup		    = (String)request.getParameter("userGroup");
    vendorName			= (String)request.getParameter("vendorName");
    totalBudget		    = (String)request.getParameter("totalBudget");
    paymentTerms		= (String)request.getParameter("paymentTerms");

        paymentTerms = paymentTerms.replaceAll("[^\\p{ASCII}]", "");

    sanctionNote		= (String)request.getParameter("sanctionNote");
    savings		        = (String)request.getParameter("savings");
    background			= (String)request.getParameter("background");

        background = background.replaceAll("[^\\p{ASCII}]", "");


    recommendation		= (String)request.getParameter("recommendation");

        recommendation = recommendation.replaceAll("[^\\p{ASCII}]", "");

    //category			= (String)request.getParameter("category");
    //company			    = (String)request.getParameter("company");
    app1				= (String)request.getParameter("app1H");

     String flag         = (String)request.getParameter("flag");

	 if(app1 == null){app1="0";}
String app2Tid ="";
String app5Tid ="";
String app8Tid ="";
	 app2				= (String)request.getParameter("app2H");
	 if(app2.equals("0")){app2="0";}
        else{
        app2Tid = app2.substring(0,app2.indexOf("|"));
        app2=app2Tid;
        //out.println("app2="+app2);
        }
	 app4				= (String)request.getParameter("app4H");
	 if(app4.equals("0")){app4="0";}
	 app5				= (String)request.getParameter("app5H");
	 if(app5.equals("0")){app5="0";}
        else{
        app5Tid = app5.substring(0,app5.indexOf("|"));
        app5=app5Tid;
        //out.println("app5="+app5);
        }
	 app7				= (String)request.getParameter("app7H");
	 if(app7 == null){app7="0";}
	 app8				= (String)request.getParameter("app8H");
	 if(app8.equals("0")){app8="0";}
        else{
        app8Tid = app8.substring(0,app8.indexOf("|"));
        app8=app8Tid;
        //out.println("app8="+app8);
        }
 	 select12			= (String)request.getParameter("select12");
	 select13			= (String)request.getParameter("select13");

	 app3				= (String)request.getParameter("app3");
//System.out.println("app3"+app3);
	  if(app3 == null){app3="0";}
	 app6				= (String)request.getParameter("app6");
	  if(app6 == null){app6="0";}
//out.println("app6--"+app2);
	 app9				= (String)request.getParameter("app9");
	  if(app9 == null){app9="0";}
	 app10				= (String)request.getParameter("app10");
	  if(app10 == null){app10="0";}
	 select14			= (String)request.getParameter("select14");
//System.out.println("select14== "+select14);
	 select15			= (String)request.getParameter("select15");
	 select16			= (String)request.getParameter("select16");
	 

	 app11				= (String)request.getParameter("app11H");
	  if(app11== null)
        {app11="0";}
	 app12				= (String)request.getParameter("app12H");
	  if(app12== null)
        {app12="0";}
	 
	 createdby			= Long.toString(timescapeUserOId);
	 createdon			= "NA";
	 modifiedby			= Long.toString(timescapeUserOId);
	 modifiedon			= "NA";


if(flag.equals("E"))
{
    userstatus  = "UC";
}else{
	userstatus  = "UD";
}


	for(int i = 1; i <= countTech; i++)
	{
		countTechData.put("tvendor"+i,(String)Utility.replaceQuoteOracle(request.getParameter("tvendor"+i)));
		countTechData.put("tmachine"+i,(String)Utility.replaceQuoteOracle(request.getParameter("tmachine"+i)));
		countTechData.put("pagination"+i,(String)Utility.replaceQuoteOracle(request.getParameter("pagination"+i)));
		countTechData.put("ctp"+i,(String)Utility.replaceQuoteOracle(request.getParameter("ctp"+i)));
		countTechData.put("speed"+i,(String)Utility.replaceQuoteOracle(request.getParameter("speed"+i)));

	}
	countTechData.put("CREATEDBY",createdby);
	countTechData.put("MODIFIEDBY",modifiedby);
	countTechData.put("STATUS",userstatus);
	for(int ii = 1; ii <= countCom; ii++)
	{
		countComData.put("cvendor"+ii,(String)Utility.replaceQuoteOracle(request.getParameter("cvendor"+ii)));
		countComData.put("colourPage"+ii,(String)Utility.replaceQuoteOracle(request.getParameter("colourPage"+ii)));
		countComData.put("bAndw"+ii,(String)Utility.replaceQuoteOracle(request.getParameter("bAndw"+ii)));
		countComData.put("plateCost"+ii,(String)Utility.replaceQuoteOracle(request.getParameter("plateCost"+ii)));
		countComData.put("bundling"+ii,(String)Utility.replaceQuoteOracle(request.getParameter("bundling"+ii)));
		countComData.put("insertion"+ii,(String)Utility.replaceQuoteOracle(request.getParameter("insertion"+ii)));
		countComData.put("otherMisc"+ii,(String)Utility.replaceQuoteOracle(request.getParameter("otherMisc"+ii)));
	}
	countComData.put("CREATEDBY",createdby);
	countComData.put("CREATEDON","SYSDATE");
	countComData.put("MODIFIEDBY",modifiedby);
	countComData.put("MODIFIEDON","SYSDATE");
	countComData.put("STATUS",userstatus);
	for(int j = 1; j <= countEs; j++)
	{
		countEsData.put("esVendor"+j,(String)Utility.replaceQuoteOracle(request.getParameter("esVendor"+j)));
		countEsData.put("alp"+j,(String)Utility.replaceQuoteOracle(request.getParameter("alp"+j)));
		//countEsData.put("esBandW"+j,"NA");
		countEsData.put("po"+j,(String)Utility.replaceQuoteOracle(request.getParameter("po"+j)));
		countEsData.put("totalSpend"+j,(String)Utility.replaceQuoteOracle(request.getParameter("totalSpend"+j)));
		countEsData.put("esPagination"+j,(String)Utility.replaceQuoteOracle(request.getParameter("esPagination"+j)));
		countEsData.put("lprs"+j,(String)Utility.replaceQuoteOracle(request.getParameter("lprs"+j)));
		countEsData.put("waste"+j,(String)Utility.replaceQuoteOracle(request.getParameter("waste"+j)));
	}
	countEsData.put("CREATEDBY",createdby);
	countEsData.put("CREATEDON","SYSDATE");
	countEsData.put("MODIFIEDBY",modifiedby);
	countEsData.put("MODIFIEDON","SYSDATE");
	countEsData.put("STATUS",userstatus);
	for(int k = 1; k <= countIn; k++)
	{
		countInData.put("inVendor"+k,(String)Utility.replaceQuoteOracle(request.getParameter("inVendor"+k)));
		countInData.put("inPo"+k,(String)Utility.replaceQuoteOracle(request.getParameter("inPo"+k)));
		countInData.put("inTotalSpend"+k,(String)Utility.replaceQuoteOracle(request.getParameter("inTotalSpend"+k)));
		countInData.put("inMisc"+k,(String)Utility.replaceQuoteOracle(request.getParameter("inMisc"+k)));
	}

	countInData.put("CREATEDBY",createdby);
	countInData.put("CREATEDON","SYSDATE");
	countInData.put("MODIFIEDBY",modifiedby);
	countInData.put("MODIFIEDON","SYSDATE");
	countInData.put("STATUS",userstatus);

	priceData.put("PROJECTNAME",(String)Utility.replaceQuoteOracle(projectName));
	priceData.put("FROMCONTRACTVALIDITY",Utility.replaceQuoteOracle(fromContractValidity));
	priceData.put("TOCONTRACTVALIDITY",Utility.replaceQuoteOracle(toContractValidity));
	priceData.put("DESCRIPTION",Utility.replaceQuoteOracle(description));
	priceData.put("CONTRACTVALUE",Utility.replaceQuoteOracle(contractValue));
	priceData.put("USERGROUP",Utility.replaceQuoteOracle(userGroup));
	priceData.put("VENDORNAME",Utility.replaceQuoteOracle(vendorName));
	priceData.put("TOTALBUDGET",Utility.replaceQuoteOracle(totalBudget));
	priceData.put("PAYMENTTERMS",Utility.replaceQuoteOracle(paymentTerms));
	priceData.put("SANCTIONNOTE",Utility.replaceQuoteOracle(sanctionNote));
	priceData.put("SAVINGS",Utility.replaceQuoteOracle(savings));
	priceData.put("BACKGROUND",Utility.replaceQuoteOracle(background));
	priceData.put("RECOMMENDATION",Utility.replaceQuoteOracle(recommendation));

	priceData.put("APPROVER11",app1);
	priceData.put("APPROVER12",app2);
	priceData.put("APPROVER13",app3);
	priceData.put("APPROVER21",app4);
	priceData.put("APPROVER22",app5);
	priceData.put("APPROVER23",app6);
	priceData.put("APPROVER31",app7);
	priceData.put("APPROVER32",app8);
	priceData.put("APPROVER33",app9);
	priceData.put("APPROVER34",app10);
	priceData.put("APPROVER35",app11);
	priceData.put("APPROVER36",app12);
	priceData.put("APPROVER4",select12);
	priceData.put("APPROVER5",select13);
	priceData.put("APPROVER6",select14);
	priceData.put("APPROVER7",select15);
	priceData.put("APPROVER8",select16);
	priceData.put("CREATEDBY",createdby);
	priceData.put("CREATEDON","SYSDATE");
	priceData.put("MODIFIEDBY",modifiedby);
	priceData.put("MODIFIEDON","SYSDATE");
	priceData.put("STATUS",userstatus);
	//priceData.put("COMPANY",company);

	priceData.put("SANCTIONEDREFTYPE",Utility.replaceQuoteOracle(sanctionedRefType));
	priceData.put("REFNUMBER",Utility.replaceQuoteOracle(refNumber));
	priceData.put("DATEOFAPPROVAL",Utility.replaceQuoteOracle(dateOfApproval));
	priceData.put("attachmentFolderName",Utility.replaceQuoteOracle(folderName));
	priceData.put("CREATEDBYEMAIL",Utility.replaceQuoteOracle(emailId));



	long countTechId = priceApprovalWebController.getCountTech();

	if(countTechId == 0)
	{
		countTechId = 100000;
	}
	
	long countComId = priceApprovalWebController.getCountCom();
	
	if(countComId == 0)
	{
		countComId = 200000;
	}
	long countEsId = priceApprovalWebController.getCountEs();
	
	if(countEsId == 0)
	{
		countEsId = 300000;
	}
	long countInId = priceApprovalWebController.getCountIn();
	
	if(countInId == 0)
	{
		countInId = 400000;
	}

		
	status  = priceApprovalWebController.updateDataOsp(priceData, priceCounter);

    if(status){
	
	status3 = priceApprovalWebController.deleteVendorDataOsp(priceCounter);
	}
	//out.println(Utility.replaceQuoteOracle(description));

	venderCounters.put("COUNTTECH",countTech+"");
	venderCounters.put("COUNTCOM",countCom+"");
	venderCounters.put("COUNTES",countEs+"");
	venderCounters.put("COUNTIN",countIn+"");

	venderIds.put("COUNTTECHID",countTechId+"");
	venderIds.put("COUNTCOMID",countComId+"");
	venderIds.put("COUNTESID",countEsId+"");
	venderIds.put("COUNTINID",countInId+"");

    if(status){
        if(status3){
       status1 = priceApprovalWebController.insertVendorDataOsp(countTechData, countComData,countEsData, countInData, venderCounters, priceCounter, venderIds);
        }
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - UPDATE DATA</title>
<script Language="JavaScript" src="../../jscripts/osp.js"></script>
<link href="../css/global.css" rel="stylesheet" type="text/css" />

</head>
<body>
<% if(status1)
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
<%if(flag.equals("E"))
{%>
	        <tr><td colspan="2" align="center"><span class="normal">Changes Saved successfully...</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="javascript:navigateCallbuyersStatusOsp('<%=timescapeUserOId%>','<%=priceCounter%>');" class="normal"><b>here</b></a> to check the details.</td></tr>
<%}else{%>
	       

			<tr><td colspan="2" align="center"><span class="normal">Your request has been modified successfully...</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a  href="viewStatusOsp.jsp" class="normal"><b>here</b></a> to check the status</td></tr> 
			</table>
<%}%>
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
			<tr><td colspan="2" align="center"><span class="normal">Sorry there was an Error while modifying your request.</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="viewStatusOsp.jsp" class="normal"><b>here</b></a> to check the status</td></tr>
			</table>
<%}%>
</body>
</html>
