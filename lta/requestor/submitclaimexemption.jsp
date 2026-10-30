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
<%@ include file="../includes/relatedlinks.jsp" %>
<hr>
<%
	//List of all tags need to write in the xml in the specific order
	String[] journeyDetails		    = {"journeyDetails","journey","fromdate", "todate", "kms", "add", "mode"};
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
    String applicationId    ="";
    String selectedPl       ="";  
    String approvedAmount   ="";  
    String  createdby			= Long.toString(timescapeUserOId);
      
    
    faYear = thisDay.get(Calendar.YEAR) + "";
    selectedPl = request.getParameter("prvl0");
    applicationId = (String)request.getParameter("applicationId");



    exemptionFlag = request.getParameter("trav");
    if(exemptionFlag == null){
        exemptionFlag = "N";
       }
    String counters			= (String)request.getParameter("count");
    String counters1		= (String)request.getParameter("count1");
    String ltaAmount		= "";

         ltaAmount		= (String)request.getParameter("amount");
            System.out.println("ltaAmount = "+ltaAmount);
        if(ltaAmount == null){
        ltaAmount  = (String)request.getParameter("amount1");
    }
    counter = Integer.parseInt(counters);
    counter1 = Integer.parseInt(counters1);
    Hashtable annualLtaHeader	= new Hashtable( );

    annualLtaHeader.put("APPLICATIONID",applicationId);
    annualLtaHeader.put("LTAAMOUNT", ltaAmount);
    annualLtaHeader.put("APPROVEDAMOUNT", "0");
    annualLtaHeader.put("CREATEDBY", createdby);
    annualLtaHeader.put("STATUS", "L");
    annualLtaHeader.put("EXEMPTION", exemptionFlag);
//System.out.println("annualLtaHeader = "+annualLtaHeader);

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

	boolean status = false;



	status = ltaController.updateAnnualLta(annualLtaHeader, tagsLst1, tagsLst2,journeyLst,travellerLst);
	if(status)
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