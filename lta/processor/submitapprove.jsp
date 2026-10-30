<%--
 -- @(#)submitapprove.jsp	01-10-15
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
 -- @version 	1.00, 01-10-15
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//    @ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.text.DecimalFormat" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="com.bccl.util.JcoPushDataToSAP"%>

<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 
    <html >
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
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
	<script Language="JavaScript" src="../jscripts/apply.js"></script>
	<script Language="JavaScript" src="../jscripts/approve.js"></script>
	
    
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

<%
    String rejectRemarks    ="";
    String status1          ="";
    String exemption        ="";
    String fromdate        ="";
    String todate        ="";
    String kms        ="";
    String add        ="";
    String mode        ="";
	 String clas        ="";
    String ticket        ="";
    String origin        ="";
    int finExempetion        =0;
    String finExempetionS        ="";
    int finExempetionE        =0;

    GregorianCalendar thisDay       = new GregorianCalendar( );
	
    String faYear           ="";
    int counter             =0;
    int counter1            =0;
    String approvedAmount  ="";
    String  modifiedBy			= Long.toString(timescapeUserOId);
    String applicationId        = (String)request.getParameter("applicationId");
           approvedAmount       = (String)request.getParameter("approvedamount"); 
           exemption            = (String)request.getParameter("exemption"); 
	//out.println(exemption);
    String fixLtaAmount         = (String)request.getParameter("fixltaamount");
    String ltaProposedAmt       = (String)request.getParameter("amount1");
    float ltaProposedAmtPB       = Float.parseFloat(approvedAmount);
	ltaProposedAmtPB = ltaProposedAmtPB/3;	
	DecimalFormat df = new DecimalFormat("#.##");	
	String ltaProposedAmtPBS = df.format(ltaProposedAmtPB);
	//String ltaProposedAmtPBS = Float. toString(ltaProposedAmtPB);

    String selectedPl           = (String)request.getParameter("selectedpl");
    String travellerDetails           = (String)request.getParameter("travellerDetails");
	int travellerData = Integer.parseInt(travellerDetails);

	int familyAmount = travellerData * 36000;
	int fixLtaAmountE = Integer.parseInt(fixLtaAmount);
	int ltaProposedAmtPBSE = (int)Float.parseFloat(ltaProposedAmtPBS);

	//out.println("fixLtaAmount.."+fixLtaAmount+"<br>"+"ltaProposedAmtPBS..."+ltaProposedAmtPBS+"<br>"+"familyAmount.."+familyAmount);

	if ( ltaProposedAmtPBSE < familyAmount){

		finExempetionE = ltaProposedAmtPBSE;

	}else {
		
		finExempetionE = familyAmount;
	}

	if (fixLtaAmountE < finExempetionE){

		finExempetion = fixLtaAmountE; 
	}else {

		finExempetion = finExempetionE;
	}
	
	finExempetionS = Integer.toString(finExempetion);
	
	//out.println("finExempetionE..."+finExempetionE);
	//out.println("finExempetion..."+finExempetion);

    String sapTrFlag            = (String)request.getParameter("saptrflag"); 
      
    String userSapNumber        = (String)request.getParameter("usersapnumber"); 
    String userCompanyCode      = (String)request.getParameter("usercompanycode"); 
	//out.println(userCompanyCode);
    String partOrFull           = (String)request.getParameter("partorfull"); 
  
    rejectRemarks               = (String)request.getParameter("rejectremarks");  
    status1                     = (String)request.getParameter("status");

	fromdate                     = (String)request.getParameter("fromdate");
	todate					    = (String)request.getParameter("todate");
	if (fromdate.equals("-")){
		Date date6      =   new Date();
		DateFormat formatter4 = new SimpleDateFormat("dd-MM-yyyy");
		 fromdate  =   formatter4.format(date6);
	}
	if (todate.equals("-")){
		Date date7      =   new Date();
		DateFormat formatter5 = new SimpleDateFormat("dd-MM-yyyy");
		 todate  =   formatter5.format(date7);
	}
	kms						     = (String)request.getParameter("kms");
	add						     = (String)request.getParameter("add");
	mode						     = (String)request.getParameter("mode");
	clas						     = (String)request.getParameter("clas");
	ticket						     = (String)request.getParameter("ticket");
	origin						     = (String)request.getParameter("origin");

	//out.println("fromdate"+fromdate+"todate"+todate+"kms"+kms+"add"+add+"mode"+mode+"clas"+clas+"ticket"+ticket+"origin"+origin);

    
   if(status1.equals("R")){
        
        if(partOrFull.equals("Y")){
            exemption="Y";
        }else
        {
            exemption="N";
        }

}

/*out.println("userSapNumber= "+userSapNumber);
out.println("userCompanyCode= "+userCompanyCode);
out.println("status1= "+status1);
out.println("sapTrFlag= "+sapTrFlag);
out.println("selectedPl= "+selectedPl);
out.println("approvedAmount= "+approvedAmount);*/

if(approvedAmount == null || approvedAmount == "")
{
    approvedAmount ="0";
}
 
    if(rejectRemarks == null || rejectRemarks.equals("") )
{
    rejectRemarks="NA";
}

    String string1  = selectedPl;
    String[] parts  = string1.split("to");
    String part1    = parts[0];
    String part2    = parts[1]; 
    String startDate    = "";
    String endDate      = "";

    DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    Date date1      =   new Date();
    Date date2      =   new Date();
    Date date3      =   new Date();
    Date date4      =   new Date();
    Date date5      =   new Date();

         date1      =    (Date)formatter.parse(part1);
         date2      =    (Date)formatter.parse(part2);
         date4      =    (Date)formatter.parse(fromdate);
         date5      =    (Date)formatter.parse(todate);
    DateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
    
        startDate      =    formatter1.format(date1);
        endDate      =    formatter1.format(date2);
        fromdate      =    formatter1.format(date4);
        todate      =    formatter1.format(date5);
    String Sysdate  =   formatter1.format(date3);


	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};


    int currMonth1		= thisDay.get(Calendar.MONTH);
    String currMonth	= monthArr[currMonth1]  + "";	

    faYear = thisDay.get(Calendar.YEAR) + "";
	if(currMonth.equals("JAN") || currMonth.equals("FEB")||currMonth.equals("MAR") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
	}

    Hashtable approveHash	= new Hashtable( );

    approveHash.put("APPLICATIONID", applicationId);
    approveHash.put("APPROVEDAMOUNT", approvedAmount);
    approveHash.put("REJECTREMARKS", rejectRemarks);
    approveHash.put("MODIFIEDBY", modifiedBy);
    approveHash.put("EXEMPTIONFLAG", exemption);
    approveHash.put("STATUS", status1);
    approveHash.put("FINEXEMPETION", finExempetionS);

/*----------------------------------------------------------------------------------------------------------------------------------------------------------*/
	Hashtable SAPConnectionDetails = new Hashtable();
	Hashtable SAPColumnHeads = new Hashtable();
	Hashtable SAPValues = new Hashtable();
	Hashtable annex3Hash = new Hashtable();
	Hashtable annex4Hash = new Hashtable();

	ArrayList lineItemList1 = new ArrayList();
	ArrayList lineItemList2 = new ArrayList();
	ArrayList lineItemList3 = new ArrayList();


	//SAPConnectionDetails.put("CLIENT","700");-----commented on 25-05-2020 for HANA testing
	//SAPConnectionDetails.put("USERID","sandeshb2005");-----commented on 25-05-2020 for HANA testing
	//SAPConnectionDetails.put("USERID","shraddha1808");
	//SAPConnectionDetails.put("PASSWORD","bccl@7654321");-----commented on 25-05-2020 for HANA testing
	//SAPConnectionDetails.put("PASSWORD","bccl@123");
	//SAPConnectionDetails.put("LANGUAGE","EN");-----commented on 25-05-2020 for HANA testing
	//SAPConnectionDetails.put("HOSTNAME","10.200.65.51"); // for ppr new
	//SAPConnectionDetails.put("HOSTNAME","10.200.67.56"); // for PROD new
	//SAPConnectionDetails.put("HOSTNAME","10.200.66.76"); // for QR3 new///for SAP Prod new -----commented on 29-12-2016 for GST testing
	//SAPConnectionDetails.put("HOSTNAME","10.200.66.223"); ///for SAP GST Testing ---- created on 29-12-2016 for GST testing
	//SAPConnectionDetails.put("HOSTNAME","10.200.66.76"); ///for SAP QP3 Testing ---- created on 20-02-2017 for GST testing-----commented on 25-05-2020 for HANA testing
	//SAPConnectionDetails.put("HOSTNAME",hostname); // for PROD new
	//SAPConnectionDetails.put("SYSTEMNO","00");///for new SAP server-----commented on 29-12-2016 for GST testing
	//SAPConnectionDetails.put("SYSTEMNO","01");///for SAP GST Testing ---- created on 29-12-2016 for GST testing
	//SAPConnectionDetails.put("SYSTEMNO","02");///for SAP QP3 Testing ---- created on 20-02-2017 for QP3 testing
	//SAPConnectionDetails.put("SYSTEMNO",systemno);

/*-----------------------------------ADDED FOR HANA TESTING-----------------------------------------------*/

/*SAPConnectionDetails.put("CLIENT","700");
SAPConnectionDetails.put("USERID","tsrfc");
SAPConnectionDetails.put("PASSWORD","Welcome@123");
SAPConnectionDetails.put("LANGUAGE","EN");
SAPConnectionDetails.put("HOSTNAME","10.201.120.31");
SAPConnectionDetails.put("SYSTEMNO","02");*/


/*----------------------------------------------------------------------------------*/



      if(sapTrFlag.equals("T"))
        {
            SAPConnectionDetails.put("RFCNAME","ZPY_LTA_EXEM_ENTRIES");
            SAPConnectionDetails.put("TOTALTABLESTOUPDATE","1");
            SAPConnectionDetails.put("TABLENAME1","LTA_ENTRIES");
System.out.println("SAP -- LTA_ENTRIES");

        }else if(sapTrFlag.equals("V"))
        {
            SAPConnectionDetails.put("RFCNAME","ZPY_REIMBURSEMENT_ENTRIES");
            SAPConnectionDetails.put("TOTALTABLESTOUPDATE","1");
            SAPConnectionDetails.put("TABLENAME1","PERKS_ENTRIES");
System.out.println("SAP -- PERKS_ENTRIES");
        }
	SAPConnectionDetails.put("applicationName","lta");



	boolean status = false;
    
    if(status1.equals("A")){

	status = ltaController.approveRequest(approveHash);
	if(status)
	{

         if(sapTrFlag.equals("T")){
/*OLD*/
       /* String[] lineItemCols = { "MANDT", "MTHLY_COMPCODE", "MTHLY_SRNO", "MTHLY_EMPLNO", "MTHLY_SAP_PAYROL", "MTHLY_SAP_FISCAL","MTHLY_BILL_AMT","ZTRANS"};

        SAPColumnHeads.put("LINEITEM1",lineItemCols);

        String lineItem[] = {"700", userCompanyCode,applicationId, userSapNumber, "0", faYear,approvedAmount,"V"};*/

	String[] lineItemCols = { "MANDT", "MTHLY_COMPCODE", "MTHLY_SRNO", "MTHLY_EMPLNO", "MTHLY_SAP_PAYROL", "MTHLY_SAP_FISCAL","MTHLY_BILL_AMT","ZTRANS","JBGDT","JENDT","STPNT","DESTN","MTRVL","CTRVL","TKTNO"};

        SAPColumnHeads.put("LINEITEM1",lineItemCols);

        String lineItem[] = {"700", userCompanyCode,applicationId, userSapNumber, "0", faYear,approvedAmount,"V",fromdate,todate,origin,add,mode,clas,ticket};
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
       // out.println("message "+message);
        //out.println("RFC 1 ");

            }else if (sapTrFlag.equals("V")){

    /*OLD*/   /* String[] lineItemCols = { "MANDT", "MTHLY_COMPCODE", "MTHLY_SRNO", "MTHLY_EMPLNO", "MTHLY_TRANSCODE", "MTHLY_PAYMONTH", "MTHLY_EFFECTIVE", "MTHLY_SAP_PAYROL","MTHLY_SAP_FISCAL","ZEXM","ZTAX","ZFINAL_ADJ","MTHLY_ENTLCODE","MTHLY_CLAIMD_AM","MTHLY_ACCEPT_AM","MTHLY_AMOUNT_PAY","MTHLY_NOTCONSID","ZBILL_AMOUNT","WAERS","MTHLY_RECORDTRAN","MTHLY_SOURCELOC","MTHLY_DOCTMPNUMB","VERIFIED_BY","TRANS_MONTH","TRANS_YEAR","JOURNEY_START","JOURNEY_END","CTRVL","TKTNO"};

        SAPColumnHeads.put("LINEITEM1",lineItemCols);

        String lineItem[] = {"700",userCompanyCode, applicationId, userSapNumber, "SLTA", Sysdate, Sysdate, "0", faYear, "X", "", "-","SLTA",fixLtaAmount, fixLtaAmount, "0", "0", approvedAmount,"INR", "V", "-", "-", "-","0", "0",startDate, endDate,"0","0"};

        lineItemList1.add(lineItem);

        SAPValues.put("LINEITEMLIST1",lineItemList1);*/

		String[] lineItemCols = { "MANDT", "MTHLY_COMPCODE", "MTHLY_SRNO", "MTHLY_EMPLNO", "MTHLY_TRANSCODE", "MTHLY_PAYMONTH", "MTHLY_EFFECTIVE", "MTHLY_SAP_PAYROL","MTHLY_SAP_FISCAL","ZEXM","ZTAX","ZFINAL_ADJ","MTHLY_ENTLCODE","MTHLY_CLAIMD_AM","MTHLY_ACCEPT_AM","MTHLY_AMOUNT_PAY","MTHLY_NOTCONSID","ZBILL_AMOUNT","WAERS","MTHLY_RECORDTRAN","MTHLY_SOURCELOC","MTHLY_DOCTMPNUMB","VERIFIED_BY","TRANS_MONTH","TRANS_YEAR","JOURNEY_START","JOURNEY_END","JBGDT","JENDT","STPNT","DESTN","MTRVL","CTRVL","TKTNO"};

        SAPColumnHeads.put("LINEITEM1",lineItemCols);

		if (exemption.equals("YPB")){

			//String lineItem[] = {"700",userCompanyCode, applicationId, userSapNumber, "SLTA", Sysdate, Sysdate, "0", faYear, "X", "", "-","SLTA",fixLtaAmount, fixLtaAmount, "0", "0", ltaProposedAmtPBS,"INR", "V", "-", "-", "-","0", "0",fromdate,todate,fromdate,todate,origin,add,mode,clas,ticket};
			String lineItem[] = {"700",userCompanyCode, applicationId, userSapNumber, "SLTA", Sysdate, Sysdate, "0", faYear, "X", "", "-","SLTA",fixLtaAmount, fixLtaAmount, "0", "0", finExempetionS,"INR", "V", "-", "-", "-","0", "0",fromdate,todate,fromdate,todate,origin,add,mode,clas,ticket};

        lineItemList1.add(lineItem);

        SAPValues.put("LINEITEMLIST1",lineItemList1);

		}else{

			String lineItem[] = {"700",userCompanyCode, applicationId, userSapNumber, "SLTA", Sysdate, Sysdate, "0", faYear, "X", "", "-","SLTA",fixLtaAmount, fixLtaAmount, "0", "0", approvedAmount,"INR", "V", "-", "-", "-","0", "0",fromdate,todate,fromdate,todate,origin,add,mode,clas,ticket};

        lineItemList1.add(lineItem);

        SAPValues.put("LINEITEMLIST1",lineItemList1);
        }

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
      // out.println("messageType = "+messageType);
        //out.println("message "+message);
       // out.println("RFC 2 ");
}


%> 
<body>
<div class="col-md-1 "></div>
    <div class="col-md-8 col-md-ofset-2 bs-example" style="margin-top:150px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">
	    <p style="text-align:center;margin-top:5px;padding-top:2px;">Request has been accepted successfully. <br>Click <a href="javascript:navigateCall();" >here</a> for status</p>
<%
	}else{
%>
<body>
<div class="col-md-1 "></div>
    <div class="col-md-8 col-md-ofset-2 bs-example" style="margin-top:150px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">
	    <p style="text-align:center;margin-top:5px;padding-top:2px;">Sorry there was an Error while cancelling your request. <br>Click <a href="javascript:navigateCall();" > here</a> to check status</p>

<%
    }

}else if(status1.equals("R")){
   
	status = ltaController.approveRequest(approveHash);
%>
<body>
<div class="col-md-1 "></div>
    <div class="col-md-8 col-md-ofset-2 bs-example" style="margin-top:150px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">
	    <p style="text-align:center;margin-top:5px;padding-top:2px;">Request has been rejected successfully. <br>Click <a href="javascript:navigateCall();" >here</a> for status</p>
<%}%>
</div>
</div>
<div class="col-md-1 "></div>
</div>
</body>
</html>