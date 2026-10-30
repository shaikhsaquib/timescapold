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
<%@ include file="../includes/annualmenutabs.jsp" %>

<!-- <hr>
<div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default active" href="../requestor/annualltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default " href="../requestor/annualcheckstatus.jsp"><font color="#4586BD">Mylist <i class="fa fa-list-ol"></i> </font></a></div>

<button type="button" class="btn btn-default active" ><a href="../requestor/checkstatus.jsp">Mylist   <i class="fa fa-list-ol"></i></a></button></div>

</div> -->
<%
	//List of all tags need to write in the xml in the specific order
	String[] journeyDetails		    = {"journeyDetails","journey","fromdate", "todate", "kms", "add", "mode","class","ticket"};
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
    String selectedPl       ="";  
    String approvedAmount   ="";  
    String  createdby			= Long.toString(timescapeUserOId);
      
    
    faYear = thisDay.get(Calendar.YEAR) + "";
    selectedPl = request.getParameter("prvl0");
    exemptionFlag = request.getParameter("trav");
    if(exemptionFlag == null){
        exemptionFlag = "N";
        //out.println("hhh= "+exemptionFlag);
    }
    //out.println("hhh= "+faYear);
    String counters			= (String)request.getParameter("count");
    String counters1		= (String)request.getParameter("count1");
    //out.println("counters= \n "+counters+"\n");
    //out.println("counters1= \n "+counters1+"\n");
    String ltaAmount		= "";
    String fixLtaAmount		= "";

         ltaAmount		= (String)request.getParameter("amount");
            System.out.println("ltaAmount = "+ltaAmount);
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
    annualLtaHeader.put("EXEMPTIONFLAG", exemptionFlag);
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
    annualLtaHeader.put("REMARKS", "-");
    annualLtaHeader.put("SAPTRFLAG", "V");
    if(exemptionFlag.equals("N")){
        annualLtaHeader.put("STATUS", "A");
    }else if(exemptionFlag.equals("Y")){
        annualLtaHeader.put("STATUS", "L");
    }
    

    String from     = "";
    String to       = "";
    String km       = "";
    String add      = "";
    String mode     = "";

    String person   = "";
    String sel      = "";
    String head     = "";




if(exemptionFlag.equals("Y")){
	for(int i = 0; i <= counter; i++)
	{
        Hashtable travelDateHash	= new Hashtable( );

        from     = request.getParameter("from"+i);
        to       = request.getParameter("to"+i);
        km       = request.getParameter("km"+i);
        add      = request.getParameter("add"+i);
        mode     = request.getParameter("mode"+i);
   

     
        travelDateHash.put("fromdate",from);
        travelDateHash.put("todate",to);
        travelDateHash.put("kms",km);
        travelDateHash.put("add",add);
        travelDateHash.put("mode",mode);
         
        journeyDataLst.add(travelDateHash);
//out.println("travelDateHash = "+travelDateHash);
	}

	for(int ii = 0; ii <= counter1; ii++)
	{
        
Hashtable travelerDateHash	= new Hashtable( );
        person   = request.getParameter("person"+ii);
        sel      = request.getParameter("sel"+ii);
        head     = request.getParameter("head"+ii);

        travelerDateHash.put("nameOfPerson",person);
        travelerDateHash.put("relation",sel);
        travelerDateHash.put("remarks",head);

        travellerDataLst.add(travelerDateHash);
//out.println("travelerDateHash = "+travelerDateHash);
	}
}else{

 Hashtable travelDateHash	= new Hashtable( );

        travelDateHash.put("fromdate","-");
        travelDateHash.put("todate","-");
        travelDateHash.put("kms","-");
        travelDateHash.put("add","-");
        travelDateHash.put("mode","-");
         
        journeyDataLst.add(travelDateHash);
        
Hashtable travelerDateHash	= new Hashtable( );

        travelerDateHash.put("nameOfPerson","-");
        travelerDateHash.put("relation","-");
        travelerDateHash.put("remarks","-");

        travellerDataLst.add(travelerDateHash);
}

    tagsLst1.add(journeyDetails);
    tagsLst2.add(travellersDetails);

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
	SAPConnectionDetails.put("TABLENAME1","ZPT_LTA_EXM");
 // Only for Investment due exeBatch_inv in SQLUtility
	SAPConnectionDetails.put("applicationName","investment");
        


	//boolean status = false;

    Hashtable	returnTable = new Hashtable();
	returnTable = ltaController.createAnnualLta(annualLtaHeader, tagsLst1, tagsLst2,journeyLst,travellerLst);
        
    boolean status1					= (Boolean) returnTable.get("status");
    String applicationId			= (String) returnTable.get("applicationId");
    out.println("status1"+status1);
    out.println("applicationId"+applicationId);

        String[] lineItemCols = { "MANDT", "MTHLY_COMPCODE", "MTHLY_SRNO", "MTHLY_EMPLNO", "MTHLY_SAP_PAYROL", "MTHLY_SAP_FISCAL", "MTHLY_BILL_AMT", "ZTRANS"};
        SAPColumnHeads.put("LINEITEM1",lineItemCols);

        String lineItem[] = {"700", companyCode,applicationId, sapId, "", faYear,ltaAmount,"V"};

        lineItemList1.add(lineItem);
        
        SAPValues.put("LINEITEMLIST1",lineItemList1);
        
        boolean flag = false;

        String messageType = "";
        String connectionStatus = "";
        String message = "";

        Hashtable SAPStatusHash = new Hashtable();
       // jcoPushDataToSAP = new JcoPushDataToSAP(application);

       // SAPStatusHash = jcoPushDataToSAP.jcoPushData(SAPConnectionDetails, SAPColumnHeads, SAPValues);
        messageType = (String)SAPStatusHash.get("MESSAGETYPE");
        connectionStatus = (String)SAPStatusHash.get("CONNECTIONSTATUS");
        message = (String)SAPStatusHash.get("MESSAGE");
       // out.println("messageType"+messageType);




	if(status1)
	{

%> 
<body>
<div class="col-md-1 "></div>
    <div class="col-md-8 col-md-ofset-2 bs-example" style="margin-top:150px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">
	    <p style="text-align:center;margin-top:5px;padding-top:2px;">Your request has been submitted successfully. <br>Click<a href="../requestor/annualcheckstatus.jsp"> here</a> for status</p>
<%
	}else{
%>
	    <p style="text-align:center;margin-top:5px;padding-top:2px;">Sorry there was an Error while creating your request. <br>Click<a href="../requestor/annualcheckstatus.jsp"> here</a> for status</p>
<%
    }
%>
</div>
</div>
<div class="col-md-1 "></div>
</div>
</body>
</html>