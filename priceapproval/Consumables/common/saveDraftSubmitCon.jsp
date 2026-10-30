<%@ page import="java.util.Hashtable, java.util.ArrayList,java.util.Calendar,java.util.GregorianCalendar" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<%
	Hashtable priceData  = new Hashtable();
	Hashtable attachmentData = new Hashtable();
	Hashtable userTable	 = new Hashtable();

	boolean status			= false;
	boolean status1			= false;
	boolean status2			= false;
	boolean status3			= false;

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
	String rem3				= "NA";
	String counters			= (String)request.getParameter("count");
	String category			= "NA";
	String docType			= "";
	String category1			= "";
	String newCategoryCode			= "";
	String priceCounter			= "";
	String parvalue			= "NA";
	String summarySheetChk			= "NA";
	int counter				= 0;

String app1Tid ="";
String app2Tid ="";
String app4Tid ="";
String app5Tid ="";
String app7Tid ="";
String app8Tid ="";

	
	counter = Integer.parseInt(counters);

	 category			= (String)request.getParameter("category");
	 parvalue			= (String)request.getParameter("parvalue");
	  docType			= (String)request.getParameter("docType");
	 
	 category1 = (String)request.getParameter("category");
	 summarySheetChk	= (String)request.getParameter("summarySheetChk");

	 GregorianCalendar thisDay = new GregorianCalendar( );
	int currMonth=0;
	int currYear=0;
	currMonth = thisDay.get(Calendar.MONTH);
	currYear =  thisDay.get(Calendar.YEAR);
	
	String faStartYear = "";
	String faEndYear   = "";
	String faYear	   = "";

	if(currMonth >= 3 && currMonth <= 11){
		faStartYear = Integer.toString(currYear);
		faEndYear   = Integer.toString(currYear+1);
	}
	else if(currMonth >= 0 && currMonth <= 2){
		faStartYear = Integer.toString(currYear-1);
		faEndYear   = Integer.toString(currYear);
	}

	faYear	    = faStartYear.substring( 2,faStartYear.length() ) + faEndYear.substring( 2,faEndYear.length() ) ;
	System.out.println("faYear=="+faYear);

	if(summarySheetChk == null)
	{
		summarySheetChk="NO";
	}
	else{
		summarySheetChk="YES";
	}

	 app1				= (String)request.getParameter("app1H");

	 if(app1.equals("0") || app1 == null || app1.equals("")){app1="0";}
        else{
        app1Tid = app1.substring(0,app1.indexOf("|"));
        app1=app1Tid;
        //out.println("app2="+app2);
        }

	 app2				= (String)request.getParameter("app2H");
	 if(app2.equals("0")|| app2 == null || app2.equals("")){app2="0";}
        else{
        app2Tid = app2.substring(0,app2.indexOf("|"));
        app2=app2Tid;
        //out.println("app2="+app2);
        }
	 app4				= (String)request.getParameter("app4H");

	 if(app4.equals("0") || app4 == null || app4.equals("")){app4="0";}
        else{
        app4Tid = app4.substring(0,app4.indexOf("|"));
        app4=app4Tid;
        //out.println("app4="+app4);
        }



	 app5				= (String)request.getParameter("app5H");
	 if(app5.equals("0") || app5 == null || app5.equals("")){app5="0";}
        else{
        app5Tid = app5.substring(0,app5.indexOf("|"));
        app5=app5Tid;
        //out.println("app5="+app5);
        }

	 app7				= (String)request.getParameter("app7H");

	 if(app7.equals("0") || app7 == null || app7.equals("")){app7="0";}
        else{
        app7Tid = app7.substring(0,app7.indexOf("|"));
        app7=app7Tid;
        //out.println("app7="+app7);
        }


	 app8				= (String)request.getParameter("app8H");

	 if(app8.equals("0") || app8 == null || app8.equals("")){app8="0";}
        else{
        app8Tid = app8.substring(0,app8.indexOf("|"));
        app8=app8Tid;
        //out.println("app8="+app8);
        }



 	 select12			= (String)request.getParameter("select12");
	 select13			= (String)request.getParameter("select13");
	 app3				= (String)request.getParameter("app3");
	 app6				= (String)request.getParameter("app6");
	 app9				= (String)request.getParameter("app9");
	 app10				= (String)request.getParameter("app10");
	 select14			= (String)request.getParameter("select14");
	 select15			= (String)request.getParameter("select15");
	 select16			= (String)request.getParameter("select16");
	 app11				= (String)request.getParameter("app11H");
	 app12				= (String)request.getParameter("app12H");	 
	 createdby			= Long.toString(timescapeUserOId);
	 createdon			= "NA";
	 modifiedby			= Long.toString(timescapeUserOId);
	 modifiedon			= "NA";


	if(summarySheetChk.equals("YES"))
	{
		 userstatus			= "UDS";
	}else{
		 userstatus			= "UD";
	}

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


	priceData.put("CATEGORY",(String)Utility.replaceQuoteOracle(category));
	priceData.put("PARVALUE",(String)Utility.replaceQuoteOracle(parvalue));
	priceData.put("SUMMARYSHEETCHK",(String)Utility.replaceQuoteOracle(summarySheetChk));
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

	ArrayList priceCounterTable = priceApprovalWebController.getPriceCounter("Consumables");

    String[] data1      = (String [])priceCounterTable.get(0);

    String categoryCode=data1[0];

	String  priceIdCode=data1[1];

   int priceIdNew= Integer.parseInt(priceIdCode);
  
  // String priceCounter = categoryCode + priceIdNew ;

	 if("Ink".equals(category1)){
	   newCategoryCode = "INK";
		
   }
   if("Others".equals(category1)){
	   newCategoryCode = "OTH";
		
   }
   if("Production".equals(category1)){
	   newCategoryCode = "PRD";
		
   }
   if("Plates".equals(category1)){
	   newCategoryCode = "PLT";
		
   }
   if("Packaging".equals(category1)){
	   newCategoryCode = "PKG";
		
   }
   if("Chemicals".equals(category1)){
	   newCategoryCode = "CHM";
		
   }
   if("Blankets".equals(category1)){
	   newCategoryCode = "BLK";
		
   }

    if("PAR".equals(docType) ){
		if(summarySheetChk.equals("NO")){
		 priceCounter = "CONP" + newCategoryCode + faYear+ priceIdNew;
		// System.out.println("priceCounter=="+priceCounter);
		//}else if(summarySheetChk.equals("YES")){
		}else if("YES".equals(summarySheetChk)){
		 priceCounter = "CONS" + newCategoryCode +faYear + priceIdNew;
		// System.out.println("priceCounter=="+priceCounter);
		}
	}
	
	if("Summary".equals(docType) ){
		 priceCounter = "CONS" + faYear+priceIdNew;
		 System.out.println("priceCounter=="+priceCounter);
	}

	status  = priceApprovalWebController.insertDataCon(priceData, priceCounter,categoryCode);

	if(status){
	status1  = priceApprovalWebController.insertDataConAttach(attachmentData, counter,priceCounter);

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
