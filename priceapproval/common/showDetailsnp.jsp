<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.text.SimpleDateFormat,java.util.Date, java.text.DateFormat" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%@ include file="../includes/idCategory.jsp"%>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<!DOCTYPE html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" > -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>PURCHASE APPROVAL</title>
<link href="../style/global1.css" rel="stylesheet" type="text/css" />

<script src="../jscripts/jquery.js"language="javascript"></script>
<script src="../jscripts/newsprint.js"language="javascript"></script>

<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	FONT-FAMILY: Arial COLOR: #000000; FONT-SIZE: 9pt; FONT-WEIGHT: normal; TEXT-DECORATION: none
    clear:both;

}


.normal {
	FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 11pt; FONT-WEIGHT: normal; TEXT-DECORATION: none
}

.nav {
	TEXT-TRANSFORM: none; FONT-VARIANT: normal; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 11px; FONT-WEIGHT: bold; TEXT-DECORATION: none
}

.travelMenuBG1 {
    FONT-FAMILY: Arial, Helvetica, sans-serif;
    COLOR: #000000;
    FONT-SIZE: 8 pt;
    FONT-WEIGHT: bold;
    TEXT-DECORATION: none;
    letter-spacing: 0.2em;
}
.tableLeftPad {
	padding-left: 3px;
    height:20px;
}
.tableRightPad {
	padding-right: 3px;
 height:20px;
}


/* Tool tip css */
.ToolText{position:relative; }
.ToolTextHover{position:relative;z-index:1;}
.ToolText span#test{display: none;}

.ToolTextHover span#test{
  display:block;
  position:absolute;
  border:1px solid black;
  /* top:1.3em;*/
  right:0;
  bottom:50px;
  background-color:#333333; color:white;
  font-size:8pt;
  font-family:Verdana, Arial, Helvetica, sans-serif;
  text-align: justify;
  width:300px;


  /* css ends here */
}
</style>
<script> 
	$(document).ready(function(){
//window.setTimeout( function() {
 //   $("textarea").height( $("textarea")[0].scrollHeight );
//}, 1);
$("textarea").each( function( i, el ) {
    $(el).height( el.scrollHeight );
});
});
</script>

<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<link href="../style/calendarControl.css" rel="stylesheet">
<script> 
    function hideImage() { 
       if (document.getElementById) { 
            document.getElementById("hidediv1").style.display  = 'none'; 
            document.getElementById("hidediv2").style.display  = 'none'; 
        } 
    }
    function showImage() { 
        if (document.getElementById) { 
           // document.getElementById('print').style.visibility = 'visible'; 
           // document.getElementById('back').style.visibility = 'visible'; 
        document.location.reload();
        } 
    } 
    function backPage()
    {
        document.location.href = "../indexnp.jsp";
    }
</script>
</head>
<%

		String timescapeUId = Long.toString(timescapeUserOId);
	    String tOId			= (String)request.getParameter("tOId");
        String priceid		= (String)request.getParameter("priceid");
        ArrayList vStatus	=  new ArrayList();
		vStatus 			=	priceApprovalWebController.viewStatusnp(tOId,priceid);
		ArrayList vStatus2	=  new ArrayList();
		vStatus2 			=	priceApprovalWebController.viewApproverNp(priceid);
		String[] data1		= (String [])vStatus.get(0);
		String pageType		= request.getParameter("viewSAB"); 
		String[] data3      = (String [])vStatus2.get(0);

        String priceId			        =  data1[0];
        String vendorName		        =  data1[1];
        String category			        =  data1[2];
        String mill			            =  data1[3];
        String paymentTerms		        =  data1[4];
        String sourcing			        =  data1[5];
        String quantity			        =  data1[6];
        String deliveryIn		        =  data1[7];
        String quality			        =  data1[8];
        String gsm			            =  data1[9];
        String thisLotcfr		        =  data1[10];
        String invoicePrice		        =  data1[11];
        String risi		                =  data1[12];
        String aopReceiptPrice		    =  data1[13];
        String aopReceiptForEx  	    =  data1[14];
        String aopDealValue       	    =  data1[15];
        String annualBudget		        =  data1[16];
        String contractedTonsytd	    =  data1[17];
        String currentQuarter   	    =  data1[18];
        String balanceToBought		    =  data1[19];
        String otherRemaks		        =  data1[20];
        String marketEvent		        =  data1[21];
       // String marketEvent		        =  data1[21];
        String ap1			            =  data1[22];
        String ap2			            =  data1[23];
        String ap3			            =  data1[24];
        String ap4			            =  data1[25];
        String ap5			            =  data1[26];
        String ap6			            =  data1[27];
        String STATUS			        =  data1[28];
        String totalPrice_unitRate	    =  data1[29];
        String totalPrice_rsperTon	    =  data1[30];
        String totalPrice_spend		    =  data1[31];
        String customsDuty_unitRate	    =  data1[32];
        String customsDuty_rsperTon	    =  data1[33];
        String customsDuty_spend	    =  data1[34];
        String freight_unitRate		    =  data1[35];
        String freight_rsperTon		    =  data1[36];
        String freight_spend		    =  data1[37];
        String insurance_unitRate	    =  data1[38];
        String insurance_rsperTon	    =  data1[39];
        String insurance_spend		    =  data1[40];
        String totalActualCost_unitRate =  data1[41];
        String totalActualCost_rsperTon =  data1[42];
        String totalActualCost_spend	=  data1[43];
        String budgetvsActual_unitRate  =  data1[44];
        String quarterOpeningQuantity	=  data1[45];
        String quarterOpeningDays	    =  data1[46];
        String expectedReceiptsQuantity     =  data1[47];
        String expectedReceiptsDays	        =  data1[48];
        String estimatedCons1   	        =  data1[49];
        String estimatedCons2   	        =  data1[50];
        String quarterEnd1         	        =  data1[51];
        String quarterEnd2         	        =  data1[52];

        String AP1Name                      =  data1[53];
        String AP2Name                      =  data1[54];
        String AP3Name                      =  data1[55];
        String AP4Name                      =  data1[56];
        String AP5Name                      =  data1[57];
        String AP6Name                      =  data1[58];
        String creatorEmailid               =  data1[63];
        String createdOn                    =  data1[64];
        String createdOnMonth               =  data1[65];
        String origin                       =  data1[66];
        String creatorName                  =  data1[67];

        String AP1_STATUS					=   data3[0]; 
        String AP1_DATE						=   data3[1]; 
        String AP2_STATUS					=   data3[2]; 
        String AP2_DATE						=   data3[3]; 
        String AP3_STATUS					=   data3[4]; 
        String AP3_DATE						=   data3[5]; 
        String AP4_STATUS					=   data3[6]; 
        String AP4_DATE						=   data3[7]; 
        String AP5_STATUS					=   data3[8]; 
        String AP5_DATE						=   data3[9]; 
        String AP6_STATUS					=   data3[10]; 
        String AP6_DATE						=   data3[11]; 
        String amenRemarks						=   data1[68]; 

    String string11  = createdOn;
    String[] pparts  = string11.split("-");
    String createdOnYear    = pparts[2]; 

	//out.println("creatorEmailid: "+creatorEmailid );

String faYear= "";
String nextYear		="";
	GregorianCalendar thisDay = new GregorianCalendar( );
	nextYear		=	(Integer.parseInt(createdOnYear)) + 1 + "";

 	faYear = (Integer.parseInt(createdOnYear)) + "";
	if(createdOnMonth.equals("JAN") || createdOnMonth.equals("FEB")||createdOnMonth.equals("Mar") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
		nextYear = (Integer.parseInt(nextYear)-1)+"";
	}

	String Approver  = "";
	String appStatus = "";
	//String AP1_STATUS = "";

	SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy");

	Date createdOnDate = format.parse(createdOn);
	//String date2Temp = format.format(new Date());
	Date changedDate = format.parse("11-FEB-2022");
	
	if (createdOnDate.compareTo(changedDate) < 0) {
		if(ap1.equals(tOId) && (AP1_STATUS.equals("L")|| AP1_STATUS.equals("MA")))
	{
		Approver = "AP1";
		appStatus = AP1_STATUS;
	}
	else if(ap2.equals(tOId) && (AP1_STATUS.equals("A")||AP1_STATUS.equals("M")) && AP2_STATUS.equals("L"))
	{
		Approver = "AP2";
		appStatus = AP2_STATUS;
	}
	else if(ap3.equals(tOId) && (AP2_STATUS.equals("A") || AP2_STATUS.equals("M"))&& AP3_STATUS.equals("L"))
	{
		Approver = "AP3";
		appStatus = AP3_STATUS;
	}
	/* else if(ap4.equals(tOId) && (AP3_STATUS.equals("A") || AP3_STATUS.equals("M")) && AP4_STATUS.equals("L"))
	{
		Approver = "AP4";
		appStatus = AP4_STATUS;
	}

	 *//* else if(ap5.equals(tOId) && (AP4_STATUS.equals("A")|| AP4_STATUS.equals("M")) && AP5_STATUS.equals("L")) */
	 else if(ap5.equals(tOId) && (AP3_STATUS.equals("A")|| AP3_STATUS.equals("M")) && AP5_STATUS.equals("L"))
	{
		Approver = "AP5";
		appStatus = AP5_STATUS;
	}
	else if(ap6.equals(tOId) && (AP5_STATUS.equals("A")|| AP5_STATUS.equals("M"))&& AP6_STATUS.equals("L"))
	{
		Approver = "AP6";
		appStatus = AP6_STATUS;
	}
	}else{

	 if(ap1.equals(tOId) && (AP1_STATUS.equals("L")|| AP1_STATUS.equals("MA")))
	{
		Approver = "AP1";
		appStatus = AP1_STATUS;
	}
	else if(ap2.equals(tOId) && (AP1_STATUS.equals("A")||AP1_STATUS.equals("M")) && AP2_STATUS.equals("L"))
	{
		Approver = "AP2";
		appStatus = AP2_STATUS;
	}
	else if(ap3.equals(tOId) && (AP2_STATUS.equals("A") || AP2_STATUS.equals("M"))&& AP3_STATUS.equals("L"))
	{
		Approver = "AP3";
		appStatus = AP3_STATUS;
	}
	
	 else if(ap4.equals(tOId) && (AP3_STATUS.equals("A") || AP3_STATUS.equals("M")) && AP4_STATUS.equals("L"))
	{
		Approver = "AP4";
		appStatus = AP4_STATUS;
	}

	  else if(ap5.equals(tOId) && (AP4_STATUS.equals("A")|| AP4_STATUS.equals("M")) && AP5_STATUS.equals("L")) 
	 /*else if(ap5.equals(tOId) && (AP3_STATUS.equals("A")|| AP3_STATUS.equals("M")) && AP5_STATUS.equals("L"))*/
	{
		Approver = "AP5";
		appStatus = AP5_STATUS;
	}
	else if(ap6.equals(tOId) && (AP5_STATUS.equals("A")|| AP5_STATUS.equals("M"))&& AP6_STATUS.equals("L"))
	{
		Approver = "AP6";
		appStatus = AP6_STATUS;
	}
	}
        String PrintRemarks = "";
		String specialReview = "";
		String rData[]       = null;
		String rData1[]       = null;
		ArrayList remarks1   = new ArrayList();
		ArrayList remarks2   = new ArrayList();
		String str1          = ""; 
		int ii = 0;	
		Hashtable remarksHash  = new Hashtable();
				   
				   remarksHash.put("PRICEID",priceid);				   
		           remarks1  = priceApprovalWebController.showRemarksNp(remarksHash);

		           remarks2  = priceApprovalWebController.showCountRemarksNp(remarksHash);

				   for(ii = 0; ii<remarks2.size(); ii++)
						{
							       rData1   = (String[])remarks2.get(ii);
						}

				   //out.println("oooo"+rData1[0]);
				
		           str1      = "<table width='100%' border='0' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks1.size()>0)
				   {
						
						for(ii = 0; ii<remarks1.size(); ii++)
						{
							       rData   = (String[])remarks1.get(ii);
									
								if(!rData[5].equals("AM"))
								{
									
                                    str1      = str1 + "<tr><td align='left' valign='top' width='20px'>&nbsp;";
                                    str1	  = str1 + rData[3];
                                    str1	  = str1 + "</td></tr>";
                                    str1	  = str1 + "<tr><td height='6px' valign='top'></td></tr>";
                                    str1	  = str1 + "<tr><td align='left' class='rdatacolor'>";
                                    str1	  = str1 + "&nbsp;"+ rData[2];
                                    str1	  = str1 + "&nbsp;&nbsp;"+ rData[4];
                                    str1	  = str1 + "</td></tr>";
                                       
								    str1	  = str1 + "<tr><td height='15px' align='center'>&nbsp;</td></tr>";
								 
							
						//str1 = str1+ "</table>";
						//PrintRemarks = str1;
						} else if(rData[5].equals("AM"))
								{
									
                                    str1      = str1 + "<tr><td bgcolor='#afb03a'  align='left' valign='top' width='20px'>&nbsp;";
                                    str1	  = str1 + rData[3];
                                    str1	  = str1 + "</td></tr>";
                                    str1	  = str1 + "<tr><td height='6px' valign='top'></td></tr>";
                                    str1	  = str1 + "<tr><td align='left' class='rdatacolor'>";
                                    str1	  = str1 + "&nbsp;"+ rData[2];
                                    str1	  = str1 + "&nbsp;&nbsp;"+ rData[4];
                                    str1	  = str1 + "</td></tr>";
                                       
								    str1	  = str1 + "<tr><td height='15px' align='center'>&nbsp;</td></tr>";
								 
							
						
						}
				   }
				   str1 = str1+ "</table>";
						PrintRemarks = str1;
				   }else
				   {
					  PrintRemarks= "No Remarks";
				   }
String currency = "";
if(origin.equals("domestic"))
{
    currency = "&#8377;&nbsp;";
}else if(origin.equals("imported"))
{
    currency = "&#36;&nbsp;";
}
%>
<%@ include file="../common/commaSeparated.jsp"%> 

<%

		String compAttachmentName="compulsory";
		String addAttachmentName="additional";
%>
<body onload = "showFixedAttachmentFile('1','<%=priceId%>','<%=creatorEmailid%>','<%=STATUS%>','<%=compAttachmentName%>','<%=addAttachmentName%>')" >
<div class="container">
<center>
<div class="row">
<div class="row" name="hidediv1" id="hidediv1">
    <button type="button" id="back" class="btn btn-info" style="margin-bottom:8px;margin-top:5px;margin-left:0x;" onclick="javascript:backPage();">Back</button>
    <button type="printbutton" id="print" class="btn btn-primary" style="margin-bottom:8px;margin-top:5px;margin-left:895px;" onclick="javascript:hideImage();window.print();showImage();">Print</button><br>
</div>
<div class="row" name="hidediv2" id="hidediv2" > 
<% //out.println("STATUS--"+STATUS); out.println("appStatus--"+appStatus);%>
   <%if(appStatus.equals("L") && (!STATUS.equals("CL") && !STATUS.equals("UCA"))){%>
<a style="margin-left:500px;margin-top:5px;margin-bottom:8px;" class="normal" onClick="openRemarksnp('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'A')" href="javascript:void(0)"><b>Approve</b></a>
     <a style="margin-left:60px;margin-bottom:8px;margin-top:5px;"class="normal" onClick="openRemarksnp('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'H')" href="javascript:void(0)"><b>Review</b></a><%}else if((appStatus.equals("L") || appStatus.equals("M")) && (STATUS.equals("UCA") || STATUS.equals("L"))){%>
<a style="margin-left:500px;margin-top:5px;margin-bottom:8px;" class="normal" onClick="openRemarksnpAmmend('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'MA')" href="javascript:void(0)"><b>Approve</b></a>
     <a style="margin-left:60px;margin-bottom:8px;margin-top:5px;"class="normal" onClick="openRemarksnpAmmend('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'MH')" href="javascript:void(0)"><b>Review</b></a><%}else{if(STATUS.equals("CL")){%><b>STATUS: <font color="green">Approved</font></b><%}else if(STATUS.equals("C")){%><b>STATUS: Cancelled</b><%}else if(STATUS.equals("URE")){%><b>STATUS: Review</b><%}}%>
</div>
</div>


<%@ include file="../common/requestDetails.jsp"%> 
