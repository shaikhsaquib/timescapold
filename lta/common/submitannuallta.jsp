<%--
 -- @(#)submitannuallta.jsp	21-09-15
 --
 -- Copyright 2012 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments....
 -- @author		Krishna Vishwakarma
 -- @version 	1.00, 21-09-15
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//    @ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="com.bccl.tsenvironment.Environment"%>
<%@ page import="com.bccl.util.JcoPushDataToSAP"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 
    <!DOCTYPE html>
 
<meta http-equiv="x-ua-compatible" content="IE=9">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> LTA </title>
	<link href="../css/reset.css" rel="stylesheet"/>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/lta.css" rel="stylesheet"/>	
    <title>LTA Application</title>
	<script Language="JavaScript" src="../jscripts/jquery.js">
	</script>
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="js/bootstrap-maxlength.min.js"></script>	
	<script Language="JavaScript" src="../jscripts/apply.js">
	</script>
    
	<script>
	$(document).ready(function() {
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
	
	});
	
	</script>
    </head>
<%String ltaRoleId	= (String) session.getAttribute("ltaRoleId");%>
<%@ include file="../includes/relatedlinks.jsp" %>
<% String optionValue ="ARA";//A-annual,R-requestor,A-apply
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%
	//String redirectURL1	= "../common/claimMaintenancePageNew.html";
	//response.sendRedirect(redirectURL1);
%>
<%@ include file="../includes/annualmenutabs.jsp" %>

<!-- <hr>
<div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default active" href="../requestor/annualltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default " href="../requestor/annualcheckstatus.jsp"><font color="#4586BD">Mylist <i class="fa fa-list-ol"></i> </font></a></div>

<button type="button" class="btn btn-default active" ><a href="../requestor/checkstatus.jsp">Mylist   <i class="fa fa-list-ol"></i></a></button></div>

</div> -->
</div>
<% 
    //private JcoPushDataToSAP jcoPushDataToSAP;
	//List of all tags need to write in the xml in the specific order
	String[] journeyDetails		    = {"journeyDetails","journey","fromdate", "todate", "kms","origin", "add", "mode", "class", "ticket"};
	String[] travellersDetails		= {"travellersDetails","travellers","nameOfPerson", "relation", "remarks"};

    ArrayList tagsLst1			    = new ArrayList();
    ArrayList tagsLst2			    = new ArrayList();

    ArrayList journeyDataLst		= new ArrayList();
    ArrayList travellerDataLst		= new ArrayList();

    ArrayList journeyLst			= new ArrayList();
    ArrayList travellerLst		    = new ArrayList();

    GregorianCalendar thisDay       = new GregorianCalendar( );
	
    String faYear           ="";
    int counter             =0;
    int counter1            =0;
    String exemptionFlag    ="";
	exemptionFlag = request.getParameter("trav");
	if(exemptionFlag == null){
        exemptionFlag = "N";
    }
    String selectedPl       ="";  
    String approvedAmount   ="";  
    String  createdby			= Long.toString(timescapeUserOId);
	    String billType		= (String)request.getParameter("billType");
	if(billType == null){
        billType = "-";
    }

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

      
    int currMonth1		= thisDay.get(Calendar.MONTH);
    String currMonth	= monthArr[currMonth1]  + "";	

    faYear = thisDay.get(Calendar.YEAR) + "";
	if(currMonth.equals("JAN") || currMonth.equals("FEB")||currMonth.equals("MAR") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
	}


   
    
    String startDate    = "";
    String endDate      = "";
    //out.println("part1= "+part1);
    //out.println("part2= "+part2);

    DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    Date date1      =   new Date();
    Date date2      =   new Date();
    Date date3      =   new Date();
         
    DateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
    DateFormat formatter2 = new SimpleDateFormat("dd-MM-yyyy");
	String SysdateS  =   formatter2.format(date3);
	String Sysdate  =   formatter1.format(date3);

	Date date = new Date();
	int MILLIS_IN_DAY = 1000 * 60 * 60 * 24;
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	String nextDate = dateFormat.format(date.getTime() + MILLIS_IN_DAY);
 
	//if (exemptionFlag.equals("Y"))
	
	if (billType.equals("GoodBill") && exemptionFlag.equals("Y"))
	{
		selectedPl = SysdateS +" to "+ nextDate;
		startDate      =    Sysdate;
        endDate      =    Sysdate;
    //String Sysdate  =   formatter1.format(date3);
	}else
    {
		selectedPl = request.getParameter("prvl0");
		String string1  = selectedPl;
		String[] parts  = string1.split("to");
		String part1    = parts[0];
		String part2    = parts[1]; 
		date1      =    (Date)formatter.parse(part1);
		date2      =    (Date)formatter.parse(part2);
		startDate      =    formatter1.format(date1);
		endDate      =    formatter1.format(date2);
    
	}       

    //out.println("startDate= "+startDate);
    //out.println("endDate= "+endDate);

    
    
    String counters			= (String)request.getParameter("count");
    String counters1		= (String)request.getParameter("count1");
    String ltaAmount		= "";
    String fixLtaAmount		= "";

         ltaAmount		= (String)request.getParameter("amount");
            //System.out.println("ltaAmount = "+ltaAmount);
        if(ltaAmount == null){
        ltaAmount  = (String)request.getParameter("amount1");
    }
    fixLtaAmount  = (String)request.getParameter("fixltaamount");
    //System.out.println("ltaAmount1= "+ltaAmount);
    counter = Integer.parseInt(counters);
    counter1 = Integer.parseInt(counters1);
    //out.println("ltaAmount \n "+ltaAmount+"\n");
    Hashtable annualLtaHeader	= new Hashtable( );
    annualLtaHeader.put("SELECTEDPL", selectedPl);
	if (exemptionFlag.equals("Y")&& billType.equals("GoodBill")){
    annualLtaHeader.put("EXEMPTIONFLAG", exemptionFlag+""+"PB");
	}else if (exemptionFlag.equals("Y")&& (!billType.equals("GoodBill"))){
    annualLtaHeader.put("EXEMPTIONFLAG", exemptionFlag+""+"TB");
	}else if (exemptionFlag.equals("N")){
    annualLtaHeader.put("EXEMPTIONFLAG", exemptionFlag);
	}
    annualLtaHeader.put("LTAAMOUNT", ltaAmount);
    annualLtaHeader.put("CREATEDBY", createdby);
    annualLtaHeader.put("FIXLTAAMOUNT", fixLtaAmount);

    if(exemptionFlag.equals("N")){
    annualLtaHeader.put("PROPOSEDAMOUNT", "0");
    }else if(exemptionFlag.equals("Y")){
        annualLtaHeader.put("PROPOSEDAMOUNT", ltaAmount);
    }

    if(exemptionFlag.equals("N")){
        annualLtaHeader.put("APPROVEDAMOUNT", ltaAmount);
    }else if(exemptionFlag.equals("Y")){
        annualLtaHeader.put("APPROVEDAMOUNT", "0");
    }

    annualLtaHeader.put("FAYEAR", faYear);
    annualLtaHeader.put("REMARKS", "NA");
    annualLtaHeader.put("SAPTRFLAG", "V");
    if(exemptionFlag.equals("N")){
        annualLtaHeader.put("STATUS", "A");
    }else if(exemptionFlag.equals("Y")){
        annualLtaHeader.put("STATUS", "L");
    }
    if(exemptionFlag.equals("Y")){
        annualLtaHeader.put("PARTORFULL", "Y");
    }else if(exemptionFlag.equals("N")){
        annualLtaHeader.put("PARTORFULL", "N");
    }
    

    String from     = "";
    String to       = "";
    String km       = "";
    String add      = "";
    String mode     = "";
    String ct     = "";
    String tn     = "";
    String org     = "";

    String person   = "";
    String sel      = "";
    String head     = "";




if(exemptionFlag.equals("Y") && (!billType.equals("GoodBill"))){
	for(int i = 0; i <= counter; i++)
	{
        Hashtable travelDateHash	= new Hashtable( );

        from     = request.getParameter("from"+i);
        to       = request.getParameter("to"+i);
        km       = request.getParameter("km"+i);
        add      = request.getParameter("add"+i);
        mode     = request.getParameter("mode"+i);
        ct     = request.getParameter("ct"+i);
        tn     = request.getParameter("tn"+i);
		org = request.getParameter("Origin"+i);
   if(km.equals("") || km == null)
    {
        km="-";
    }
   if(add.equals("") || add == null)
    {
        add="-";
    }

     
        travelDateHash.put("fromdate",from);
        travelDateHash.put("todate",to);
        travelDateHash.put("kms",km);
        travelDateHash.put("add",add);
        travelDateHash.put("mode",mode);
        travelDateHash.put("class",ct);
        travelDateHash.put("ticket",tn);
        travelDateHash.put("origin",org);
         
        journeyDataLst.add(travelDateHash);
//out.println("travelDateHash = "+travelDateHash);
	}

	for(int ii = 0; ii <= counter1; ii++)
	{
        
Hashtable travelerDateHash	= new Hashtable( );
        person   = request.getParameter("person"+ii);
        sel      = request.getParameter("sel"+ii);
        head     = request.getParameter("head"+ii);

   if(head.equals("") || head == null)
    {
        head="-";
    }

        travelerDateHash.put("nameOfPerson",person);
        travelerDateHash.put("relation",sel);
        travelerDateHash.put("remarks",head);

        travellerDataLst.add(travelerDateHash);
//out.println("head = "+head);
	}
}else if(exemptionFlag.equals("Y") && (billType.equals("GoodBill"))){
	Hashtable travelDateHash	= new Hashtable( );
		travelDateHash.put("fromdate","-");
        travelDateHash.put("todate","-");
        travelDateHash.put("kms","-");
        travelDateHash.put("add","-");
        travelDateHash.put("mode","-");
        travelDateHash.put("class","-");
        travelDateHash.put("ticket","-");
        travelDateHash.put("origin","-");
		journeyDataLst.add(travelDateHash);

		for(int ii = 0; ii <= counter1; ii++)
	{
        
Hashtable travelerDateHash	= new Hashtable( );
        person   = request.getParameter("person"+ii);
        sel      = request.getParameter("sel"+ii);
        head     = request.getParameter("head"+ii);

   if(head.equals("") || head == null)
    {
        head="-";
    }

        travelerDateHash.put("nameOfPerson",person);
        travelerDateHash.put("relation",sel);
        travelerDateHash.put("remarks",head);

        travellerDataLst.add(travelerDateHash);
//out.println("head = "+head);
	}
	
}else{

		Hashtable travelDateHash	= new Hashtable( );

        travelDateHash.put("fromdate","-");
        travelDateHash.put("todate","-");
        travelDateHash.put("kms","-");
        travelDateHash.put("add","-");
        travelDateHash.put("mode","-");
        travelDateHash.put("class","-");
        travelDateHash.put("ticket","-");
        travelDateHash.put("origin","-");
         
        journeyDataLst.add(travelDateHash);
        
		Hashtable travelerDateHash	= new Hashtable( );

        travelerDateHash.put("nameOfPerson","-");
        travelerDateHash.put("relation","-");
        travelerDateHash.put("remarks","-");

        travellerDataLst.add(travelerDateHash);
}

    tagsLst1.add(journeyDetails);
    tagsLst2.add(travellersDetails);
//out.println(tagsLst1);
    journeyLst.add(journeyDataLst);	
    travellerLst.add(travellerDataLst);
/*----------------------------------------------------------------------------------------------------------------------------------------------------------*/
	Hashtable SAPConnectionDetails = new Hashtable();
	Hashtable SAPColumnHeads = new Hashtable();
	Hashtable SAPValues = new Hashtable();
	Hashtable annex3Hash = new Hashtable();
	Hashtable annex4Hash = new Hashtable();

	ArrayList lineItemList1 = new ArrayList();
	ArrayList lineItemList2 = new ArrayList();
	ArrayList lineItemList3 = new ArrayList();


	/*SAPConnectionDetails.put("CLIENT","700");
	SAPConnectionDetails.put("USERID","tsrfc");
	//SAPConnectionDetails.put("USERID","shraddha1808");
	SAPConnectionDetails.put("PASSWORD","welcome");
	//SAPConnectionDetails.put("PASSWORD","bccl@123");
	SAPConnectionDetails.put("LANGUAGE","EN");
	//SAPConnectionDetails.put("HOSTNAME","10.200.65.51"); // for ppr new
	//SAPConnectionDetails.put("HOSTNAME","10.200.67.56"); // for PROD new
	//SAPConnectionDetails.put("HOSTNAME","10.200.66.76"); // for QR3 new///for SAP Prod new -----commented on 29-12-2016 for GST testing
	//SAPConnectionDetails.put("HOSTNAME","10.200.66.223"); ///for SAP GST Testing ---- created on 29-12-2016 for GST testing
	SAPConnectionDetails.put("HOSTNAME","10.200.66.76"); ///for SAP QP3 Testing ---- created on 20-02-2017 for QP3 testing
	//SAPConnectionDetails.put("HOSTNAME",hostname); // for PROD new
	//SAPConnectionDetails.put("SYSTEMNO","00");///for new SAP server-----commented on 29-12-2016 for GST testing
	SAPConnectionDetails.put("SYSTEMNO","02");///for SAP QP3 Testing ---- created on 20-02-2017 for QP3 testing
	//SAPConnectionDetails.put("SYSTEMNO",systemno);*/

/*-----------------------------------ADDED FOR HANA TESTING-----------------------------------------------*/

/* COMMENTED FOR HANA CHANGES

	SAPConnectionDetails.put("CLIENT","700");
	SAPConnectionDetails.put("USERID","tsrfc");
	SAPConnectionDetails.put("PASSWORD","welcome");
	SAPConnectionDetails.put("LANGUAGE","EN");
 // SAPConnectionDetails.put("HOSTNAME","10.100.229.39"); // fOR ppr
	//SAPConnectionDetails.put("HOSTNAME","10.100.223.250"); // for PROD
	SAPConnectionDetails.put("HOSTNAME",hostname); // for PROD new
	//SAPConnectionDetails.put("SYSTEMNO","00");
	SAPConnectionDetails.put("SYSTEMNO",systemno);*/

/* END OF COMMENTED FOR HANA CHANGES*/

	SAPConnectionDetails.put("RFCNAME","ZPY_REIMBURSEMENT_ENTRIES");
	SAPConnectionDetails.put("TOTALTABLESTOUPDATE","1");
	SAPConnectionDetails.put("TABLENAME1","PERKS_ENTRIES");
 // Only for Investment due exeBatch_inv in SQLUtility
	SAPConnectionDetails.put("applicationName","lta");


    Hashtable annualChkSta = new Hashtable();
    String  timescapeUid			= Long.toString(timescapeUserOId);
     annualChkSta.put("TIMESCAPEUID",timescapeUid);
     annualChkSta.put("FAYEAR",faYear);

    ArrayList annualresultLst	= new ArrayList();
    annualresultLst		= ltaController.annualLtaCheckStatus(annualChkSta);
    String remarks	=	"";
    //out.println("annualresultLst== "+annualresultLst.size());
    if(annualresultLst.size() == 0) {

    Hashtable	returnTable = new Hashtable();
	returnTable = ltaController.createAnnualLta(annualLtaHeader, tagsLst1, tagsLst2,journeyLst,travellerLst);
        
    //boolean status1= false;
    //String applicationId= "44";
    boolean status1					= (Boolean) returnTable.get("status");
    String applicationId			= (String) returnTable.get("applicationId");
    //out.println("status1"+status1);
    //out.println("applicationId"+applicationId);
    if(exemptionFlag.equals("N")){

	if(status1)
	{
        String[] lineItemCols = { "MANDT", "MTHLY_COMPCODE", "MTHLY_SRNO", "MTHLY_EMPLNO", "MTHLY_TRANSCODE", "MTHLY_PAYMONTH", "MTHLY_EFFECTIVE", "MTHLY_SAP_PAYROL","MTHLY_SAP_FISCAL","ZEXM","ZTAX","ZFINAL_ADJ","MTHLY_ENTLCODE","MTHLY_CLAIMD_AM","MTHLY_ACCEPT_AM","MTHLY_AMOUNT_PAY","MTHLY_NOTCONSID","ZBILL_AMOUNT","WAERS","MTHLY_RECORDTRAN","MTHLY_SOURCELOC","MTHLY_DOCTMPNUMB","VERIFIED_BY","TRANS_MONTH","TRANS_YEAR","JOURNEY_START","JOURNEY_END"};

        SAPColumnHeads.put("LINEITEM1",lineItemCols);

       // String lineItem[] = {"700", companyCode,applicationId, sapId, "", faYear,ltaAmount,"V"};

        String lineItem[] = {"700",companyCode, applicationId, sapId, "SLTA", Sysdate, Sysdate, "0", faYear, "", "", "","SLTA",fixLtaAmount, fixLtaAmount, "0", "0", "0","INR", "V", "-", "-", "-","0", "0",startDate, endDate};

        lineItemList1.add(lineItem);

        SAPValues.put("LINEITEMLIST1",lineItemList1);
        
        boolean flag = false;

        String messageType = "";
        String connectionStatus = "";
        String message = "";
        String application11 = "lta";
        Hashtable SAPStatusHash = new Hashtable();
        JcoPushDataToSAP jcoPushDataToSAP = new JcoPushDataToSAP(application11);

        SAPStatusHash       = jcoPushDataToSAP.jcoPushData(SAPConnectionDetails, SAPColumnHeads, SAPValues);
        messageType         = (String)SAPStatusHash.get("MESSAGETYPE");
        connectionStatus    = (String)SAPStatusHash.get("CONNECTIONSTATUS");
        message             = (String)SAPStatusHash.get("MESSAGE");
        //out.println("messageType = "+messageType);
        //out.println("message "+message);
if("S".equals(messageType)){
%>
<body>
<div class="col-xs-1 "></div>
    <div class="col-xs-8  bs-example" style="margin-top:150px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">
	    <!-- <p style="text-align:center;margin-top:5px;padding-top:2px;">Your request has been submitted successfully. <br>Click<a href="../common/annualcheckstatus.jsp"> here</a> for status</p> -->
<%
response.sendRedirect("../common/annualcheckstatus.jsp");
%>

<div class="col-xs-1 "></div>
<%
}else{
%>
<%
   Hashtable cancelHash	= new Hashtable( );

    cancelHash.put("APPLICATIONID", applicationId);
    cancelHash.put("CREATEDBY", createdby);
    cancelHash.put("STATUS", "D");

	boolean status2 = false;

	status2 = ltaController.cancelAnnualLta(cancelHash);
%>
<body>
<div class="col-xs-1 "></div>
    <div class="col-xs-8 col-xs-ofset-2 bs-example" style="margin-top:150px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">
	    <p style="text-align:center;margin-top:5px;padding-top:2px;">Sorry there was an Error while creating your request. <br>Click<a href="../common/annualcheckstatus.jsp"> here</a> for status</p>
		</div>
<div class="col-xs-1 "></div>
<%}
}else{
%>
<body>
<div class="col-xs-1 "></div>
    <div class="col-xs-8 col-xs-ofset-2 bs-example" style="margin-top:150px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">
	    <p style="text-align:center;margin-top:5px;padding-top:2px;">Sorry there was an Error while creating your request. <br>Click<a href="../common/annualcheckstatus.jsp"> here</a> for status</p>
		</div>
	<div class="col-xs-1 "></div>
<%
    }
%>

<%
}else{
%> 
 <body>
<div class="col-xs-1 "></div>
    <div class="col-xs-8 col-xs-ofset-2 bs-example" style="margin-top:150px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">
	    <!-- <p style="text-align:center;margin-top:5px;padding-top:2px;">Your request has been submitted successfully. <br>Click<a href="../common/annualcheckstatus.jsp"> here</a> for status</p> -->
<%
response.sendRedirect("../common/annualcheckstatus.jsp");
%>
	</div>
	<div class="col-xs-1 "></div>
<%
	}
%>
	    <!-- <p style="text-align:center;margin-top:5px;padding-top:2px;">Sorry there was an Error while creating your request. <br>Click<a href="../common/annualcheckstatus.jsp"> here</a> for status</p> -->
<%
   }else{
%>
 <body>
<div class="col-xs-1 "></div>
    <div class="col-xs-8 col-xs-ofset-2 bs-example" style="margin-top:150px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">
	<p style="text-align:center;margin-top:10px;">You have already applied for Annual LTA. <br>Click <a href="../common/annualcheckstatus.jsp"> here</a> for status</p>
	</div>
<div class="col-xs-1 "></div>
<%}%>
</div>
</div>
<div class="col-xs-1 "></div>
</div>
</body>
</html>