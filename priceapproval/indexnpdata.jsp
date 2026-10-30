<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.text.SimpleDateFormat,java.util.Date, java.text.DateFormat" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="includes/sessionCheck.jsp"%>
<%@ page errorPage="common/errorPage.jsp"%>
<%@ include file="includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 

<% int flg = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Purchase Approval for News Print</title>
<link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"> 
<link href="style/popup.css" rel="stylesheet" type="text/css" />
<link href="css/template.css" rel="stylesheet">
<link href="style/calendarControl.css" rel="stylesheet">
<link href="style/global.css" rel="stylesheet" type="text/css" />

<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap-maxlength.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
 
<script src="jscripts/calendarControl.js" language="javascript"></script>
<script Language="JavaScript" src="jscripts/util.js"></script>
<script Language="JavaScript" src="jscripts/common.js"></script>
<script Language="JavaScript" src="jscripts/search.js"></script>
<script Language="JavaScript" src="jscripts/fieldCheck.js"></script>
<script Language="JavaScript" src="jscripts/newsprint.js?ts="+new Date().getTime()></script>
<script type="text/javascript">
$(document).ready(function(){
    $(".tip-right").tooltip({
        placement : 'right',
        container: 'body'
    });
    $('input#defaultconfig').maxlength();
});

</script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
<script src="jscripts/calendarControl.js" language="javascript"></script>
<link href="style/calendarControl.css" rel="stylesheet">

<script type="text/javascript">
var counter = 1;
var counter1 = 1;
var rcounter=14;
function addRow()
{
  counter = document.priceApprovalMain.count.value;
  counter = parseInt(counter) + 1;
  document.priceApprovalMain.count.value = counter;

  tabBody = document.getElementById("inputtable");
  row	  = document.createElement("TR");

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='v"+counter+"'  class='small'  cols='20' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.v"+counter+",'vendorChar"+counter+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.v"+counter+",'vendorChar"+counter+"',50)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"vendorChar"+counter+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='c"+counter+"' id='c1"+counter+"'class='small'  cols='10' maxlength='15' onkeydown=\"textCounter(document.priceApprovalMain.c"+counter+",'cChar"+counter+"',15)\" onkeyup=\"textCounter(document.priceApprovalMain.c"+counter+",'cChar"+counter+"',15)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"cChar"+counter+"\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='m"+counter+"' id='m1"+counter+"'class='small'  cols='20' maxlength='45' onkeydown=\"textCounter(document.priceApprovalMain.m"+counter+",'mChar"+counter+"',45)\" onkeyup=\"textCounter(document.priceApprovalMain.m"+counter+",'mChar"+counter+"',45)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"mChar"+counter+"\" width=\"10%\" class=\"small\">45</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>  ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name='g"+counter+"' rows='2' class='small' cols='20' maxlength='15'  onkeydown=\"textCounter(document.priceApprovalMain.g"+counter+",'gChar"+counter+"',15)\" onkeyup=\"textCounter(document.priceApprovalMain.g"+counter+",'gChar"+counter+"',15)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"gChar"+counter+"\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"a"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"35\" cols='15'   onkeydown=\"textCounter(document.priceApprovalMain.a"+counter+",'aChar"+counter+"',35)\" onkeyup=\"textCounter(document.priceApprovalMain.a"+counter+",'aChar"+counter+"',35)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"aChar"+counter+"\" width=\"10%\" class=\"small\">35</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);

  

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"oq"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"10\"  cols='13' onkeydown=\"textCounter(document.priceApprovalMain.oq"+counter+",'oqChar"+counter+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.oq"+counter+",'oqChar"+counter+"',10);spaceAlertNp(document.priceApprovalMain.oq"+counter+".value);\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"oqChar"+counter+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);



  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"op"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"20\"  cols='13' onkeydown=\"textCounter(document.priceApprovalMain.op"+counter+",'opChar"+counter+"',20)\" onkeyup=\"textCounter(document.priceApprovalMain.op"+counter+",'opChar"+counter+"',20);\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"opChar"+counter+"\" width=\"10%\" class=\"small\">20</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"fq"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"10\"  cols='13' onkeydown=\"textCounter(document.priceApprovalMain.fq"+counter+",'fqChar"+counter+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.fq"+counter+",'fqChar"+counter+"',10);spaceAlertNp(document.priceApprovalMain.fq"+counter+".value);\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"fqChar"+counter+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"fp"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"20\"  cols='13' onkeydown=\"textCounter(document.priceApprovalMain.fp"+counter+",'fpChar"+counter+"',20)\" onkeyup=\"textCounter(document.priceApprovalMain.fp"+counter+",'fpChar"+counter+"',20);\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"fpChar"+counter+"\" width=\"10%\" class=\"small\">20</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


  tabBody.appendChild(row);
}

//add row function for commnets part

function addRow2()
{

  counter1 = document.priceApprovalMain.count2.value;
  counter1 = parseInt(counter1) + 1;
  document.priceApprovalMain.count2.value = counter1;


  tabBody = document.getElementById("inputtable2");
  row	  = document.createElement("TR");

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='vn"+counter1+"'  class='small'  cols='20' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.vn"+counter1+",'vendorName2"+counter1+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.vn"+counter1+",'vendorName2"+counter1+"',50)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"vendorName2"+counter1+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='co"+counter1+"' id='co"+counter1+"'class='small'  cols='10' maxlength='15' onkeydown=\"textCounter(document.priceApprovalMain.co"+counter1+",'country2"+counter1+"',15)\" onkeyup=\"textCounter(document.priceApprovalMain.co"+counter1+",'country2"+counter1+"',15)\"></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"country2"+counter1+"\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='mill"+counter1+"' id='mill"+counter1+"'class='small'  cols='20' maxlength='45' onkeydown=\"textCounter(document.priceApprovalMain.mill"+counter1+",'millChar2"+counter1+"',45)\" onkeyup=\"textCounter(document.priceApprovalMain.mill"+counter1+",'millChar2"+counter1+"',45)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"millChar2"+counter1+"\" width=\"10%\" class=\"small\">45</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>  ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name='gr"+counter1+"' rows='2' class='small' cols='20' maxlength='15'  onkeydown=\"textCounter(document.priceApprovalMain.gr"+counter1+",'grChar"+counter1+"',15)\" onkeyup=\"textCounter(document.priceApprovalMain.gr"+counter1+",'grChar"+counter1+"',15)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"grChar"+counter1+"\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"qscr"+counter1+"\" rows=\"2\" class=\"small\" maxlength=\"35\" cols='15'   onkeydown=\"textCounter(document.priceApprovalMain.qscr"+counter1+",'qChar2"+counter1+"',35)\" onkeyup=\"textCounter(document.priceApprovalMain.qscr"+counter1+",'qChar2"+counter1+"',35)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"qChar2"+counter1+"\" width=\"10%\" class=\"small\">35</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);

  

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"rem"+counter1+"\" rows=\"4\" class=\"small\" maxlength=\"200\"  cols='35' onkeydown=\"textCounter(document.priceApprovalMain.rem"+counter1+",'oqChar"+counter1+"',200)\" onkeyup=\"textCounter(document.priceApprovalMain.rem"+counter1+",'oqChar"+counter1+"',200)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"oqChar"+counter1+"\" width=\"10%\" class=\"small\">200</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);

  tabBody.appendChild(row);
}

function delRow2()
{
	if(counter1 > 1)
	{
	document.getElementById("inputtable2").deleteRow(counter1);
	counter1 = counter1 - 1;
	document.priceApprovalMain.count2.value = counter1;
	}
}

</script>


</head>
<%
	String faYear= "";
   
	GregorianCalendar thisDay = new GregorianCalendar( );

	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

      
    int currMonth1		= thisDay.get(Calendar.MONTH);
    String currMonth	= monthArr[currMonth1]  + "";	

 	faYear = thisDay.get(Calendar.YEAR) + "";
	String nextYear		=	thisDay.get(Calendar.YEAR) + 1 + "";
	if(currMonth.equals("JAN") || currMonth.equals("FEB")||currMonth.equals("MAR") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
		nextYear = (Integer.parseInt(nextYear)-1)+"";
	}
	
    String timescapeUId = Long.toString(timescapeUserOId);
            String tOId			= (String)request.getParameter("tOId");
	  String parNumber1 = (String)request.getParameter("parnumber");
	//out.println("HHHHHHH"+parNumber1);
    
            String priceid		= (String)request.getParameter("priceid");
			//out.println("priceid"+priceid);
            ArrayList vStatus	=  new ArrayList();
            vStatus 			=	priceApprovalWebController.viewStatusnp(tOId,parNumber1);
            ArrayList vStatus2	=  new ArrayList();
            vStatus2 			=	priceApprovalWebController.viewApproverNp(parNumber1);
            String[] data1		= (String [])vStatus.get(0);
            String pageType		= request.getParameter("viewSAB"); 
            String[] data3      = (String [])vStatus2.get(0);


            ArrayList vStatus3	=  new ArrayList();
	        Hashtable vendorDataHash = new Hashtable();
            vendorDataHash.put("PRICEID",parNumber1);

            vStatus3 			=	priceApprovalWebController.vendorDataNp(vendorDataHash);


            ArrayList vStatus4	=  new ArrayList();
	        Hashtable commentDataHash = new Hashtable();
            commentDataHash.put("PRICEID",parNumber1);

            vStatus4 			=	priceApprovalWebController.commentDataNp(commentDataHash);

//if(vStatus.size() <= 0 || vStatus2.size() <= 0 || vStatus3.size() <= 0 || vStatus4.size() <= 0  ){

		

//}else
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
        String CREATEDBY                    =  data1[62];

        String SANCTIONEDREFTYPE			= data1[59];
        String REFNUMBER					= data1[60];
        String DATEOFAPPROVAL				= data1[61];
        String creatorEmailid               = data1[63];
		String createdOn               = data1[64];
        String origin                       = data1[66];

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
		String compAttachmentName="compulsory";
		String addAttachmentName="additional";
		String refNumberTemp = (String)request.getParameter("refNumber");
		String dateOfApprovalTemp = (String)request.getParameter("dateOfApproval");
%>
<body onload="showFixedAttachmentFile('1','<%=priceId%>','<%=creatorEmailid%>','<%=STATUS%>','<%=compAttachmentName%>','<%=addAttachmentName%>')">
<form name="priceApprovalMain" method="post" action="" class="form-horizontal">
<br>
<table width="100%" border ="0"  cellspacing="1" cellpadding="2" >
    <tr bgcolor="#fbf9f9" class="travelMenuBG" height="40px">
        <td  align="left" width="20%" >SANCTIONED REFERENCE TYPE :</td>
        <td  align="left" width="15%">
            <select class="normal" style="height:20px;" id="sanctionedRefType" name="sanctionedRefType" disabled>
             <option value="0">Select Ref Type</option>
			 <option value="AOP Budget" <%if(SANCTIONEDREFTYPE.equals("AOP Budget")){%>selected="selected"<%}%>>AOP Budget</option>
            </select>
        </td>
        <td  align="left" width="15%">QUARTER :</td>
        <td  align="left"  width="15%"><input type = "text" name = "refNumber" id="refNumber" class = "normal" size="20"  value="<%=refNumberTemp%>"></td>
        <td  align="left" width="15%">DATE OF APPROVAL :</td>
        <td  align="left" width="15%">
        <input name="dateOfApproval" id="dateOfApproval" class="normal" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" value="<%=dateOfApprovalTemp%>"/>
        </td>
      <tr>
</table>
<br>
<div class="form-body">
    <div class="row">
    <div class="col-md-6">
    <div class="form-group">
        <label class="col-md-2 control-label">Category</label>
           <div class="col-md-6">
                  <select class="form-control" id="category" name="category" readonly>
                    <option value="Newsprint" <%if(category.equals("Newsprint")){%>selected="selected"<%}%>>Newsprint</option>
                 </select>
           </div>
           </div>
           </div> 
<div class="col-xs-6">
    <div class="form-group">
        <label class="col-xs-2 control-label ">Origin</label>
           <div class="col-xs-6">
                  <select class="form-control " id="category" name="origin">
                    <option value="0">Select</option>
                    <option value="domestic">Domestic</option>
                    <option value="imported">Imported</option>
                 </select>
           </div>
           </div>
           </div> 
  	<h5>Vendor Details</h5><hr>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">	
		<label class="control-label col-md-3">Vendor Name</label>	
	<div class="col-md-6">													
		<input type="text" value="<%=vendorName%>"class="form-control" placeholder="vendor name" maxlength="80" id="defaultconfig" name="vendorName" onkeyup="autoAnnexure()"> 
		
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Mill</label>
	<div class="col-md-6">
		<input type="text" value="<%=mill%>"class="form-control" placeholder="mill" maxlength="90" id="defaultconfig" name="mill" onkeyup="autoAnnexure()">
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Payment Terms</label>
	<div class="col-md-6">
		<input type="text" value="<%=paymentTerms%>" class="form-control" placeholder="payment terms" maxlength="80" id="defaultconfig" name="paymentTerms">
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Sourcing</label>
	<div class="col-md-6">
		<input type="text" value="<%=sourcing%>" class="form-control" placeholder="sourcing" maxlength="80" id="defaultconfig" name="sourcing">
	</div>
	</div>
	</div>													
	</div>	
	
	<h5>Item Details</h5><hr>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Quantity (MT)</label>
	<div class="col-md-6">
		<input type="text" value="<%=quantity%>"class="form-control" placeholder="quantity"  maxlength="50" id="defaultconfig"  name="quantity" onkeyup="negValCheck();calculations();">
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Delivery In</label>
	<div class="col-md-6">
		<input type="text" value="<%=deliveryIn%>"class="form-control" placeholder="delivery in" maxlength="50" id="defaultconfig" id="deliveryIn" name="deliveryIn">
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Quality</label>
	<div class="col-md-6">
		<input type="text" value="<%=quality%>"class="form-control" placeholder="quality" maxlength="50" id="defaultconfig" id="quality" name="quality" onkeyup="autoAnnexure()">
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">GSM</label>
	<div class="col-md-6">
		<input type="text" value="<%=gsm%>"class="form-control" placeholder="gsm" maxlength="50" id="defaultconfig" id="gsm" name="gsm" onkeyup="autoAnnexure()">
	</div>
	</div>
	</div>													
	</div>													
	
	<h5>Price Benchmark</h5><hr>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">This Lot (CFR,India)</label>
	<div class="col-md-6">
		<input type="text" value="<%=thisLotcfr%>"class="form-control" placeholder="this lot" maxlength="50" id="defaultconfig" id="thisLot" name="thisLot" onkeyup="negValCheck()">
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Invoice price</label>
	<div class="col-md-6">
		<input type="text" value="<%=invoicePrice%>"class="form-control" placeholder="invoice price" maxlength="50" id="defaultconfig" id="invoicePrice" name="invoicePrice" onkeyup="negValCheck();calculations();">
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">RISI (CFR,India)</label>
	<div class="col-md-6">
		<input type="text" value="<%=risi%>"class="form-control" placeholder="RISI (CFR India)" maxlength="50" id="defaultconfig" id="risi" name="risi" onkeyup="negValCheck()">
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">AOP Receipt Price </label>
	<div class="col-md-6">
		<input type="text" value="<%=aopReceiptPrice%>"class="form-control" placeholder="AOP Receipt Price" maxlength="50" id="defaultconfig" id="aopreceiptprice" name="aopreceiptprice" onkeyup="negValCheck();calculations();">
	</div>
	</div>
	</div>													
	</div>
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">AOP Receipt ForEx (Rs/$)</label>
	<div class="col-md-6">
		<input type="text" value="<%=aopReceiptForEx%>"class="form-control" placeholder="AOP Receipt ForEx (Rs/$)" maxlength="50" id="defaultconfig" id="aopreceiptforex" name="aopreceiptforex" onkeyup="negValCheck();calculations();">
	</div>
	</div>
	</div>													
	</div>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">AOP Deal value (Rs cr)</label>
	<div class="col-md-6">
		<input type="text" value="<%=aopDealValue%>"class="form-control" placeholder="AOP Deal value (Rs cr)"  id="aopdealvalue" name="aopdealvalue" onkeyup="aopDealValue();" readonly>
	</div>
	</div>
	</div>
	</div>
	
	<h5>Price Built-Up</h5><hr>
                <div class="row">
                <div class="col-md-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Exchange Rate (@ Rs/$)</label>
                <div class="col-md-3">
                                <input type="text" value="<%=totalPrice_unitRate%>"class="form-control" placeholder="Unit rate" maxlength="50" id="defaultconfig" name="totalprice1" onkeyup="negValCheck();calculations();">
                </div>   
                <div class="col-md-3">
                                <input type="text" value="<%=totalPrice_rsperTon%>"class="form-control" placeholder="Rs per ton" name="totalprice2" onkeyup="calculations();" readonly>
                </div>   
                <div class="col-md-3">
                                <input type="text" value="<%=totalPrice_spend%>"class="form-control" placeholder="Spend RS Lakh"  name="totalprice3" onkeyup="calculations();" readonly>
                </div>   
                </div>
                </div>   
                <div class="col-md-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Custom Duty/Taxes</label>
                <div class="col-md-3">
                                <input type="text" value="<%=customsDuty_unitRate%>"class="form-control" placeholder="Unit rate" maxlength="50" id="defaultconfig" name="cusduty1" onkeyup="negValCheck();calculations();">        
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=customsDuty_rsperTon%>"class="form-control" placeholder="Rs per ton" maxlength="50" id="defaultconfig" name="cusduty2" onkeyup="negValCheck();calculations();"readonly>        
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=customsDuty_spend%>"class="form-control" placeholder="Spend RS Lakh" maxlength="50" id="defaultconfig" name="cusduty3" onkeyup="negValCheck();calculations();"readonly>        
                </div>
                </div>
                </div>                                                                                                                                                                                                   
                </div>                                                                                                                                                                                   
                <div class="row">
                <div class="col-md-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Logistics cost</label>
                <div class="col-md-3">
                                <input type="text" value="<%=freight_unitRate%>"class="form-control" placeholder="Unit rate" maxlength="50" id="defaultconfig" name="freight1" onkeyup="negValCheck();calculations();autoAnnexure();">     
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=freight_rsperTon%>"class="form-control" placeholder="Rs per ton" maxlength="50" id="defaultconfig" name="freight2" onkeyup="negValCheck();calculations();autoAnnexure();" readonly>     
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=freight_spend%>"class="form-control" placeholder="Spend RS Lakh"  name="freight3" onkeyup="calculations();" readonly>     
                </div>
                </div>
                </div>                   
                <div class="col-md-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Insurance (%)</label>
                <div class="col-md-3">
                                <input type="text" value="<%=insurance_unitRate%>"class="form-control" placeholder="Unit rate" maxlength="6" id="defaultconfig" name="insurance1" onkeyup="negValCheck();calculations();">       
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=insurance_rsperTon%>"class="form-control" placeholder="Rs per ton" name="insurance2" onkeyup="calculations();" readonly>       
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=insurance_spend%>"class="form-control" placeholder="Spend RS Lakh"  name="insurance3" onkeyup="calculations()" readonly>       
                </div>
                </div>
                </div>                                                                                                                                                                                                   
                </div>
                <div class="row">
                <div class="col-md-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Actual Deal value</label>
                <div class="col-md-3">
                                <!-- <input type="text" value="<%//=totalActualCost_unitRate%>"class="form-control" placeholder="Unit rate" maxlength="50" id="defaultconfig" name="totalcost1" onkeyup="negValCheck()">
                                <span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="20 integer only"></span>                                                                                                                                                                                                           -->                            
 <input type="hidden" name="totalcost1" id ="totalcost1" value="0" />	            
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=totalActualCost_rsperTon%>"class="form-control" placeholder="Rs per ton" name="totalcost2" onkeyup="calculations()"readonly>
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=totalActualCost_spend%>"class="form-control" placeholder="Spend RS Lakh" name="totalcost3" onkeyup="calculations()"readonly >
                </div>
                </div>
                </div>   
                <div class="col-md-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Budget VS. Actual</label>
                <div class="col-md-3">
                                <input type="text" value="<%=budgetvsActual_unitRate%>"class="form-control" placeholder="Budget VS. Actual"  name="budact1" onkeyup="calculations()" readonly>
                </div>

                </div>
                </div>
                </div>
 
<h5>Inventory Details (TONS)</h5><hr>
                <div class="row">
                <div class="col-md-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Opening Inventory</label>
                <div class="col-md-3">
                                <input type="text" value="<%=quarterOpeningQuantity%>"class="form-control" placeholder="Quantity" maxlength="50" id="defaultconfig" name="quainv1" onkeyup="negValCheck();calculations();">           
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=quarterOpeningDays%>"class="form-control" placeholder="Days" maxlength="50" id="defaultconfig" name="quainv2" onkeyup="negValCheck();calculations();">           
                </div>
                </div>
                </div>                                                                                                                                                                                                   
                <div class="col-md-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Expected Receipts For Quarter</label>
                <div class="col-md-3">
                                <input type="text" value="<%=expectedReceiptsQuantity%>"class="form-control" placeholder="Quantity" maxlength="50" id="defaultconfig" name="expectedreceipts1" onkeyup="negValCheck();calculations();">
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=expectedReceiptsDays%>"class="form-control" placeholder="Days" maxlength="50" id="defaultconfig" name="expectedreceipts2" onkeyup="negValCheck();calculations();">
                </div>
                </div>
                </div>                                                                                                                                                                                                   
                </div>                                                                                                                                                                                   
                <div class="row">
                <div class="col-md-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Estimated cons. for balance of the quarter</label>
                <div class="col-md-3">
                                <input type="text" value="<%=estimatedCons1%>"class="form-control" placeholder="Quantity" maxlength="50" id="defaultconfig" name="estimatedcons1" onkeyup="negValCheck();calculations();">
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=estimatedCons2%>"class="form-control" placeholder="Days" maxlength="50" id="defaultconfig" name="estimatedcons2" onkeyup="negValCheck();calculations();">
                </div>
                </div> 
                </div>                                                                                                                                                                                                   
                <div class="col-md-6">
                 <div class="form-group">
                                <label class="control-label col-md-3">Quarter-end physical inventory / stock</label>
                <div class="col-md-3">
                                <input type="text" value="<%=quarterEnd1%>"class="form-control" placeholder="Quantity"   name="quarterend1" onkeyup="negValCheck();calculations();"readonly>
                </div>
                <div class="col-md-3">
                                <input type="text" value="<%=quarterEnd2%>"class="form-control" placeholder="Days" maxlength="50" id="defaultconfig" name="quarterend2" onkeyup="negValCheck();calculations();" readonly>
                </div>
                </div> 
                </div>                                                                                                                                                                                                   
                </div>
        
              
           
	<h5>Budget Buy(TONS)</h5><hr>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Annual Budget</label>
	<div class="col-md-6">
		<input type="text" value="<%=annualBudget%>"class="form-control" placeholder="annual budget" maxlength="50" id="defaultconfig" id="annualBudget" name="annualBudget" onkeyup="negValCheck();calculations();">
	</div>
	</div>
	</div>													
	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Contracted tons till last Qtr</label>
	<div class="col-md-6">
		<input type="text" value="<%=contractedTonsytd%>"class="form-control" placeholder="contracted tons" maxlength="50" id="defaultconfig" id="contractedTons" name="contractedTons" onkeyup="negValCheck();calculations();"> 
	</div>
	</div>
	</div>													
	</div>	


											
	<div class="row">

	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Current quarter (incl. this deal)</label>
	<div class="col-md-6">
		<input type="text" value="<%=currentQuarter%>"class="form-control" placeholder="contracted tons" maxlength="50" id="defaultconfig" id="currentquarter" name="currentquarter" onkeyup="negValCheck()"> 
	</div>
	</div>
	</div>	

	<div class="col-md-6">
	<div class="form-group">
		<label class="control-label col-md-3">Balance To Be Bought</label>
	<div class="col-md-6">
		<input type="text" value="<%=balanceToBought%>"class="form-control" placeholder="balance to be bought YTD" maxlength="50" id="defaultconfig" id="balance" name="balance" onkeyup="negValCheck();calculations();" readonly>
	</div>
	</div>
	</div>																										
	</div>

<h5>Offers</h5><hr>



<table width="99%" cellspacing="2" cellpadding="2" align="center">
<tbody id="inputtable">
  <tr class="greyBG">
	<td width="2%" height="29" >VENDOR NAME</td>
    <td width="2%" align="left">COUNTRY</td>
    <td width="2%" align="left">MILL</td>
    <td width="2%" align="left">GRADE</td>
    <td width="2%" align="left">AGENT NAME</td>
    <td width="2%" align="left">OFFER QUANTITY(MT)</td>
    <td width="2%" align="left">OFFER PRICE(per/MT)</td>
    <td width="2%" align="left">FINAL QUANTITY(MT)</td>
    <td width="2%" align="left">FINAL PRICE(per/MT)</td>
	</tr>
<%
    if(vStatus3.size()>0)
	{
      for ( int ii = 0; ii < vStatus3.size(); ii++ ) 
        {

		String[] data4 = (String [])vStatus3.get(ii);
%>

  <tr>
	<td height="20" valign="top" align="left"><span class="small">
      <textarea name="v1" id="v1" cols="20" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.v1,'vendorChar',50)" onkeyup="textCounter(document.priceApprovalMain.v1,'vendorChar',50)" ><%=data4[1]%></textarea>   
    
	  </span>

	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vendorChar" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="c1" id="c1"cols="10" class="small" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.c1,'cChar',15)" onkeyup="textCounter(document.priceApprovalMain.c1,'cChar',15)"><%=data4[2]%></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cChar" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="m1"  id="m1" cols="20" rows="2" class="small" maxlength="45"  onkeydown="textCounter(document.priceApprovalMain.m1,'mChar',45)" onkeyup="textCounter(document.priceApprovalMain.m1,'mChar',45)"><%=data4[3]%></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="mChar" width="10%" class="small">45</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="g1" id="g1" cols="20" rows="2" class="small" maxlength="15"   onkeydown="textCounter(document.priceApprovalMain.g1,'gChar',15)" onkeyup="textCounter(document.priceApprovalMain.g1,'gChar',15)"><%=data4[4]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="gChar" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="a1" id="a1" class="small" cols="15" maxlength="35"  onkeydown="textCounter(document.priceApprovalMain.a1,'aChar',35)" onkeyup="textCounter(document.priceApprovalMain.a1,'aChar',35)"><%=data4[5]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="aChar" width="10%" class="small">35</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="oq1" id="oq1" class="small" maxlength="10" cols="13"   onkeydown="textCounter(document.priceApprovalMain.oq1,'oqChar',10)" onkeyup="textCounter(document.priceApprovalMain.oq1,'oqChar',10);spaceAlertNp(document.priceApprovalMain.oq1.value);"><%=data4[6]%></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="oqChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="op1" id="op1" class="small" cols="13" maxlength="20"   onkeydown="textCounter(document.priceApprovalMain.op1,'opChar',20)" onkeyup="textCounter(document.priceApprovalMain.op1,'opChar',20);"><%=data4[7]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="opChar" width="10%" class="small">20</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="fq1" id="fq1"class="small" maxlength="10" cols="13"  onkeydown="textCounter(document.priceApprovalMain.fq1,'fqChar',10)" onkeyup="textCounter(document.priceApprovalMain.fq1,'fqChar',10);spaceAlertNp(document.priceApprovalMain.fq1.value);"><%=data4[8]%></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="fqChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="fp1" id="fp1"class="small" maxlength="20" cols="13"  onkeydown="textCounter(document.priceApprovalMain.fp1,'fpChar',20)" onkeyup="textCounter(document.priceApprovalMain.fp1,'fpChar',20);"><%=data4[9]%></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="fpChar" width="10%" class="small">20</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	

  </tr>
<%
   
} }

%>
   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="add" onclick="addRow()" class="bold">
   <input type="button" value="  Remove Row   " name="add" onclick="delRow()" class="bold"></td></tr>
   <input type="hidden" name="count" value="<%=vStatus3.size()%>"  />	

 </table>


<!-- add row delete row 2 -->

<h5>Offers</h5><hr>



<table width="99%" cellspacing="2" cellpadding="2" align="center">
<tbody id="inputtable2">
  <tr class="greyBG">
	<td width="2%" height="29" >VENDOR NAME/BILLING</td>
    <td width="2%" align="left">COUNTRY</td>
    <td width="2%" align="left">MILL</td>
    <td width="2%" align="left">GRADE</td>
    <td width="2%" align="left">Q SCORE</td>
    <td width="2%" align="left">REMARKS</td>
	</tr>
<%
    if(vStatus4.size()>0)
	{
      for ( int ii = 0; ii < vStatus4.size(); ii++ ) 
        {

		String[] data5 = (String [])vStatus4.get(ii);
%>
  <tr>
	<td height="20" valign="top" align="left"><span class="small">
      <textarea name="vn1" id="vn1" cols="20" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.vn1,'vendorName2',50)" onkeyup="textCounter(document.priceApprovalMain.vn1,'vendorName2',50)" ><%=data5[2]%></textarea>   
    
	  </span>

	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vendorName2" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="co1" id="co1"cols="10" class="small" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.co1,'country2',15)" onkeyup="textCounter(document.priceApprovalMain.co1,'country2',15)"><%=data5[3]%></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="country2" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="mill1"  id="mill1" cols="20" rows="2" class="small" maxlength="45"  onkeydown="textCounter(document.priceApprovalMain.mill1,'millChar2',45)" onkeyup="textCounter(document.priceApprovalMain.mill1,'millChar2',45)"><%=data5[4]%></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="millChar2" width="10%" class="small">45</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="gr1" id="gr1" cols="20" rows="2" class="small" maxlength="15"   onkeydown="textCounter(document.priceApprovalMain.gr1,'gChar2',15)" onkeyup="textCounter(document.priceApprovalMain.gr1,'gChar2',15)"><%=data5[5]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="gChar2" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="qscr1" id="qscr1" class="small" cols="15" maxlength="35"  onkeydown="textCounter(document.priceApprovalMain.qscr1,'qChar2',35)" onkeyup="textCounter(document.priceApprovalMain.qscr1,'qChar2',35)"><%=data5[6]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="qChar2" width="10%" class="small">35</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="rem1" id="rem1" class="small" maxlength="200" cols="35" rows="4"  onkeydown="textCounter(document.priceApprovalMain.rem1,'remChar',200)" onkeyup="textCounter(document.priceApprovalMain.rem1,'remChar',200)"><%=data5[7]%></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="remChar" width="10%" class="small">200</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	

  </tr>
<%
   
} }

%>
   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="add" onclick="addRow2()" class="bold">
   <input type="button" value="  Remove Row   " name="add" onclick="delRow2()" class="bold"></td></tr>
   <input type="hidden" name="count2" value="<%=vStatus4.size()%>"  />	

 </table>

	<h5>Remarks & Events</h5><hr>
	<div class="row">
	
	<div class="form-group">
		<label class="col-md-2 control-label">Other Remarks</label>
	<div class="col-md-9">
		<textarea class="form-control" rows="4" placeholder="events" maxlength="3000" id="defaultconfig" id="otherRemarks" name="otherRemarks"><%=otherRemaks%></textarea>
	
	</div>
	</div>
	</div>
	<div class="row">
	
	<div class="form-group">
		<label class="col-md-2 control-label">Market Events</label>
	<div class="col-md-9">
		<textarea class="form-control" rows="4" placeholder="events"  maxlength="3000" id="defaultconfig" id="marketEvents" name="marketEvents"><%=marketEvent%></textarea>
	
	</div>
	</div>													
	</div>												
								<h5 style="font-weight:bold;margin-top:0px;margin-bottom:0;">Attachments</h5>
						<hr style="margin-top:10px;margin-bottom:10px;"/>
						<div class="row " >
							<div class=" col-xs-6 " >
								<table class="table table-bordered table-hover" id="tab_logic7" >			
									<thead>
										<tr >
											<th colspan="2" class="text-center" >
												Attachment
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('compulsory','<%=priceid%>');" > <img src="images/attachmentNp.png" border="0" /></a> </td>	
										</tr>	
										<tr>
											<td colspan="2"  id="attachment"></td>												
										</tr>
									</tbody>				
								</table>
							</div>	
							<div class="col-xs-6  ">
								<table class="table table-bordered table-hover" id="tab_logic7">			
									<thead>
										<tr >
											<th colspan="2" class="text-center" >
												Additional Attachments
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('additional','<%=priceid%>');" ><img src="images/attachmentNp.png" border="0" /></a> </td>	
										</tr>	
										<tr>
											<td colspan="2"  id="attachment1"></td>											
										</tr>
									</tbody>			
								</table>
							</div>
						</div>


	<%
    Hashtable emailList = new Hashtable();
    ArrayList approvers = new ArrayList();
    approvers = priceApprovalWebController.getApproverStatusNp(emailList);
        
   // System.out.println(approvers.size());
    String BnC   = "", BnC1 = "", Director  = "", Epsupplychain = "", COO = "",CEO = "", MD = "";
    
    for(int i=0; i<approvers.size() ;i++){

        String apprv []  = (String[])approvers.get(i);

		//System.out.println("apprv[3]---"+apprv[3]);

        if(apprv[1].equals("1")){
			if(!BnC1.equals("")){
				BnC= BnC1 + "<option value=\""+apprv[0]+"\">"+apprv[3]+"</option>";
			}else if(BnC1.equals("")){
				BnC= "<option value=\""+apprv[0]+"\">"+apprv[3]+"</option>";
			}
        }else if(apprv[1].equals("2")) {
            Director=  "<option value=\""+apprv[0]+"\">"+apprv[3]+"</option>";
        }else if(apprv[1].equals("3")) {
            Epsupplychain=  "<option value=\""+apprv[0]+"\">"+apprv[3]+"</option>";
        }else if(apprv[1].equals("4")) {
            //COO=  "<option value=\""+apprv[0]+"\">"+apprv[3]+"</option>"; --- Commented by Shreedhar on 18-APR-2018 to remove CO name.
			COO=  "<option value=\""+apprv[0]+"\" selected>"+apprv[3]+"</option>";
        }else if(apprv[1].equals("5")) {
            CEO=  "<option value=\""+apprv[0]+"\" selected>"+apprv[3]+"</option>";
        }else if(apprv[1].equals("6")) {
            MD=  "<option value=\""+apprv[0]+"\" selected>"+apprv[3]+"</option>";
        }
		BnC1 = BnC;
    }
%>	


	<h5>Approvals</h5><hr>
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="col-xs-3 control-label">Category Head - Newsprint</label>
	<div class="col-xs-6">
		<select class="form-control" name= "bussinessAndCommercial" id = "bussinessAndCommercial" onfocus="onLoadDetail('1');">
            <option value="0">Select</option>
			<%=BnC1%>
		</select>		
	</div>
	</div>
	</div>

	
	<div class="col-xs-6">
	<div class="form-group">
		<label class="col-xs-3 control-label">Director-B&C</label>
	<div class="col-xs-6">
		<select name = "director" id = "director" class="form-control">
            <option value="0">Select</option>
			<%=Director%>
		</select>
	</div>
	</div>
	</div>
</div>

	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<!-- <label class="col-xs-3 control-label">Executive Director</label> -->
		<label class="col-xs-3 control-label">COO (Publishing) & ED</label>
	<div class="col-xs-6">
		<select name = "epSupplyChain" id = "epSupplyChain" class="form-control">
            <option value="0">Select</option>
			<%=Epsupplychain%>
		</select>
	</div>
	</div>
	</div>
<%
	/*SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy");

	Date createdOnDate = format.parse(createdOn);
	//String date2Temp = format.format(new Date());
	Date changedDate = format.parse("01-APR-2018");*/
	
	//if (createdOnDate.compareTo(changedDate) < 0) {
%>														
	<!-- <div class="col-xs-6">
	<div class="form-group">
		<label class="col-xs-3 control-label">COO</label>
	<div class="col-xs-6">
		<select name = "coo" id = "coo" class="form-control" disabled>
            <option value="0">Select</option> -->
			<%//=COO%>

		<!-- </select>
	</div>
	</div>
	</div>													
	</div>		
	
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="col-xs-3 control-label">CEC</label>
	<div class="col-xs-6">
		<select name = "ceo" id = "ceo" class="form-control" disabled>
            <option value="0">Select</option> -->
			<%//=CEO%>
		<!-- </select>
	</div>
	</div>
	</div>	
	<div class="col-xs-6">
	<div class="form-group">
		<label class="col-xs-3 control-label">MD</label>
	<div class="col-xs-6">
		<select name = "md" id = "md" class="form-control" disabled>
            <option value="0">Select</option> -->
			<%//=MD%>
		<!-- </select>
	</div>
	</div>
	</div>																											
	</div> -->	
	<%//}else{%>
	<div class="col-xs-6">
	<div class="form-group">
		<!-- <label class="col-xs-3 control-label">CEC & ED</label> -->
		<label class="col-xs-3 control-label">CEO (Publishing) & ED</label>
	<div class="col-xs-6">
		<select name = "coo" id = "coo" class="form-control" disabled>
            <option value="0">Select</option>
			<%=COO%>

		</select>
	</div>
	</div>
	</div>													
	</div>		
	
<!-- 	 <div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="col-xs-3 control-label">MD</label>
	<div class="col-xs-6">
		<select name = "ceo" id = "ceo" class="form-control" disabled>
            <option value="0">Select</option>
			<%//=CEO%>  0
		</select>
	</div>
	</div>
	</div> -->	

	<!-- <div class="col-xs-6">
	<div class="form-group">
		<label class="col-xs-3 control-label">VC & MD</label>
	<div class="col-xs-6">
		<select name = "md" id = "md" class="form-control" disabled>
            <option value="0">Select</option>
			<%//=MD%> 0
		</select>
	</div>
	</div>
	</div>	 -->
	<input type="hidden" name="md" id ="md" value="0" />
	<input type="hidden" name="ceo" id ="ceo" value="0" />
	</div>	
	<%//}%>
<br/>
<br/>
    <div class="form-actions">
	<div class="col-md-offset-5 ">
		<input name="priceid" id="priceid" type="hidden" value="<%=priceId%>" /> 
		<input name="sanctionedreftype" id="sanctionedreftype" type="hidden" value="<%=SANCTIONEDREFTYPE%>" /> 
		<input name="refnumber" id="refnumber" type="hidden" value="<%=REFNUMBER%>" /> 
		<input name="dateofapproval" id="dateofapproval" type="hidden" value="<%=DATEOFAPPROVAL%>" /> 
		<input name="savedraft" type="button"  class="btn btn-success" id="savedraft" value="Save Draft" onclick="savedraftnp();"/>
		<input name="submitForm1" onclick="validateForm1(1);" type="button"  class="btn btn-success" id="submitForm1" value="Submit" />
		<input name="resetButton1" type="reset"  class="btn btn-success" id="resetButton1" value="Reset" />
	</div>
	</div>
<br/>
</div>
</form>
</body>
</html>