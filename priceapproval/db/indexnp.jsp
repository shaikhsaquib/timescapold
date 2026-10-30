
<!DOCTYPE html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Price Approval for News Print</title>
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
<script Language="JavaScript" src="jscripts/newsprint.js"></script>
<!-- <script Language="JavaScript" src="jscripts/jquery.js"></script> -->

<script type="text/javascript">
$(document).ready(function(){
    $(".tip-right").tooltip({
        placement : 'right',
        container: 'body'
    });
    $('input#defaultconfig').maxlength();
$('textarea#textarea').maxlength();
});

</script>

<script type="text/javascript">
var counter = 1;
var counter1 = 1;
var rcounter=14;
function addRow()
{
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
  cell1.innerHTML = "<textarea type='textbox' name='m"+counter+"' id='m1"+counter+"'class='small'  cols='20' maxlength='30' onkeydown=\"textCounter(document.priceApprovalMain.m"+counter+",'mChar"+counter+"',30)\" onkeyup=\"textCounter(document.priceApprovalMain.m"+counter+",'mChar"+counter+"',30)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"mChar"+counter+"\" width=\"10%\" class=\"small\">30</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>  ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name='g"+counter+"' rows='2' class='small' cols='20' maxlength='15'  onkeydown=\"textCounter(document.priceApprovalMain.g"+counter+",'gChar"+counter+"',15)\" onkeyup=\"textCounter(document.priceApprovalMain.g"+counter+",'gChar"+counter+"',15)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"gChar"+counter+"\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"a"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"35\" cols='15'   onkeydown=\"textCounter(document.priceApprovalMain.a"+counter+",'aChar"+counter+"',35)\" onkeyup=\"textCounter(document.priceApprovalMain.a"+counter+",'aChar"+counter+"',35)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"aChar"+counter+"\" width=\"10%\" class=\"small\">35</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);

  

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"oq"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"10\"  cols='13' onkeydown=\"textCounter(document.priceApprovalMain.oq"+counter+",'oqChar"+counter+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.oq"+counter+",'oqChar"+counter+"',10);validateNumericData(this.id, this.value);spaceAlertNp(document.priceApprovalMain.oq"+counter+".value);\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"oqChar"+counter+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);



  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"op"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"10\"  cols='13' onkeydown=\"textCounter(document.priceApprovalMain.op"+counter+",'opChar"+counter+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.op"+counter+",'opChar"+counter+"',10);validateNumericData(this.id, this.value);spaceAlertNp(document.priceApprovalMain.op"+counter+".value);\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"opChar"+counter+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"fq"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"10\"  cols='13' onkeydown=\"textCounter(document.priceApprovalMain.fq"+counter+",'fqChar"+counter+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.fq"+counter+",'fqChar"+counter+"',10);validateNumericData(this.id, this.value);spaceAlertNp(document.priceApprovalMain.fq"+counter+".value);\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"fqChar"+counter+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"fp"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"10\"  cols='13' onkeydown=\"textCounter(document.priceApprovalMain.fp"+counter+",'fpChar"+counter+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.fp"+counter+",'fpChar"+counter+"',10);validateNumericData(this.id, this.value);spaceAlertNp(document.priceApprovalMain.fp"+counter+".value);\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"fpChar"+counter+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


  tabBody.appendChild(row);
}
function delRow()
{
	if(counter > 1)
	{
	document.getElementById("inputtable").deleteRow(counter);
	counter = counter - 1;
	document.priceApprovalMain.count.value = counter;
	}
}

//add row function for commnets part

function addRow2()
{
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
  cell1.innerHTML = "<textarea type='textbox' name='mill"+counter1+"' id='mill"+counter1+"'class='small'  cols='20' maxlength='30' onkeydown=\"textCounter(document.priceApprovalMain.mill"+counter1+",'millChar2"+counter1+"',30)\" onkeyup=\"textCounter(document.priceApprovalMain.mill"+counter1+",'millChar2"+counter1+"',30)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"millChar2"+counter1+"\" width=\"10%\" class=\"small\">30</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>  ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name='gr"+counter1+"' rows='2' class='small' cols='20' maxlength='15'  onkeydown=\"textCounter(document.priceApprovalMain.gr"+counter1+",'gChar"+counter1+"',15)\" onkeyup=\"textCounter(document.priceApprovalMain.gr"+counter1+",'gChar"+counter1+"',15)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"gChar"+counter1+"\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
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
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="includes/sessionCheck.jsp"%>
<%@ page errorPage="common/errorPage.jsp"%>
<%@ include file="includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 

<%          
        Hashtable adminHash = new Hashtable();

		ArrayList adminList	=  new ArrayList();
	    String adData[]       = null;
        int adminId     = 0;
        int ii          =0;
        boolean checkAdmin = false;
		adminList 			=	priceApprovalWebController.getAdminData(adminHash);
          if(adminList.size()>0)
           {
            for(ii = 0; ii<adminList.size(); ii++)
                {
                    adData   = (String[])adminList.get(ii);
          adminId   = Integer.parseInt(adData[0]);

            if(timescapeUserOId==adminId)
                {
                    checkAdmin=true;
                }
             }
}
%>

<% 
    int flg = 0; 
%>

<body  onload="onLoadDetail('0');showStatus();showSABnp();<%if(checkAdmin){%>showAllRequestsNp();<%flg = 1;}%>">
<div class="QTPopup" style="display:none">
	<div class="popupGrayBg" ></div>
	<div class="QTPopupCntnr"  >
		<div class="gpBdrLeft">
			<div class="gpBdrRight">
				 <a href="#" class="closeBtn" title="Close"></a>
				  <div style="width:auto;height:100px;" id="msg"></div>
			</div>
		</div>
	</div>
</div>
<form name="priceApprovalMain" method="post" action="" class="form-horizontal">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="images/header_price1.jpg" width="842" height="44" /></td>
    <td width="23%" rowspan="2">
    <ul id="nav">
     <li><img src="images/related_links.png" border="0"><span class="bold">Related Links</span><br>
     <ul >
     <li><a class="normal" href="index.jsp">Price Approval</a></li>
     <li><a class="normal" href="indexnp.jsp">Price Approval - NewsPrint</a></li>
     </ul>
 </li>
</ul>
 </td>
  </tr>
  <tr>
    <td height="38"><img src="images/header_price2.jpg" width="706" height="38" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>

</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">N E W S P R I N T</td>
        </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">Supported By / Approved By</td>
        </tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG" align="right"><a href="javascript:showSABnp();showAllRequestsNp();" style="text-decoration: none;">&nbsp;Refresh<img src="images/refresh.png" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /> --></td>
          </tr>
			<tr>
			<td height="10" class="normal" align="right"><a href="#" onclick="javascript:window.open('common/viewSABApprovedHistorynp.jsp','','resizable=yes,scrollbars=yes,height=650,width=1024')"><b>Approvers Status</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:window.open('common/viewStatusnp.jsp','','resizable=yes,scrollbars=yes,height=650,width=1024')"><b>Buyers Status</b></a>&nbsp;&nbsp;&nbsp;</td>

			</tr>
		  <tr>
		<td>
		<table width="100%" cellspacing="2" cellpadding="2" border="0">
        <tr class="greyBG">
            <td width="8%" height="29" >Sr. No</td>
            <td width="18%" align="left">VENDOR NAME</td> 
            <td width="12%" align="left">PRICE APPROVAL ID</td>    
            <td width="18%" align="left">QUANTITY</td>
            <td width="16%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="16%" align="left">STATUS</td>
        </tr>
		<tr><td id = "sab1" width="100%" colspan="7" height="60"></td></tr>
		 <tr>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" colspan="2" align="center" valign="top">&nbsp;</td>
        </tr> 
	</table>
	</td></tr>
		
		 
	</table>
	</td>
  </tr>
</table><%if(flg==1){%>
       <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">View All Requests</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /> --></td>
          </tr>
				<tr><td height="10" colspan="5"></td></tr>
		  <tr>
		<td>
		<table width="100%" cellspacing="2" cellpadding="2" border="0">
        <tr class="greyBG">
            <td width="8%" height="29" >Sr. No</td>
            <td width="18%" align="left">VENDOR NAME</td> 
            <td width="12%" align="left">PRICE APPROVAL ID</td>    
            <td width="18%" align="left">QUANTITY</td>
            <td width="16%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="16%" align="left">STATUS</td>
        </tr>
		<tr><td id = "allProcess" width="100%" colspan="7" height="60"></td></tr>
		 <tr>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" colspan="2" align="center" valign="top">&nbsp;</td>
        </tr> 
	</table>
<%
    }
%>
<table width="100%" border ="0"  cellspacing="1" cellpadding="2" >
    <tr bgcolor="#fbf9f9" class="travelMenuBG" height="40px">
        <td  align="left" width="20%" >SANCTIONED REFERENCE TYPE :</td>
        <td  align="left" width="15%">
            <select class="normal" style="height:20px;" id="sanctionedRefType" name="sanctionedRefType">
                <option value="0">Select Ref Type</option>
                <option value="AOP Budget">AOP Budget</option>
             </select>
        </td>
        <td  align="left" width="15%">REFERENCE NUMBER :</td>
        <td  align="left"  width="15%"><input type = "text" name = "refNumber" id="refNumber" class = "normal" size="20"></td>
        <td  align="left" width="15%">DATE OF APPROVAL :</td>
        <td  align="left" width="15%">
        <input name="dateOfApproval" id="dateOfApproval" class="normal" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" />
        </td>
        <td align="left" width="10%"><a href="javascript:void(0)" onclick="getnpDetails()"><img src="images/but_go.gif" border="0" /></a></td>	
    <tr>
</table>
<!-- <table width="100%" cellspacing="2" cellpadding="2" border="0">
 --><div id="showRequests" style="display:none;">
<div class="form-body">
    <div class="row">
    <div class="col-xs-6">
    <div class="form-group">
        <label class="col-md-2 control-label">Category</label>
           <div class="col-xs-6">
                  <select class="form-control" id="category" name="category">
                    <option value="Newsprint">Newsprint</option>
                 </select>
           </div>
           </div>
           </div> 
           </div>
  	<h5>Vendor Details</h5><hr>
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">	
		<label class="control-label col-md-3">Vendor Name</label>	
	<div class="col-xs-6">													
		<input type="text" class="form-control" placeholder="Vendor name" maxlength="35" id="defaultconfig" name="vendorName" onkeyup="autoAnnexure()">
		
		
	</div>
	</div>
	</div>													
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">Mill</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="Mill" maxlength="30" id="defaultconfig" name="mill" onkeyup="autoAnnexure()">
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">Payment Terms</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="Payment terms" maxlength="20" id="defaultconfig" name="paymentTerms">
	</div>
	</div>
	</div>													
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">Sourcing</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="Sourcing" maxlength="20" id="defaultconfig" name="sourcing">
	</div>
	</div>
	</div>													
	</div>	
	
	<h5>Item Details</h5><hr>
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">Quantity</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="Quantity"  maxlength="10" id="defaultconfig"  name="quantity" onkeyup="negValCheck();calculations();">
	</div>
	</div>
	</div>													
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">Delivery In</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="Delivery in" maxlength="20" id="defaultconfig" id="deliveryIn" name="deliveryIn">
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">Quality</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="Quality" maxlength="20" id="defaultconfig" id="quality" name="quality" onkeyup="autoAnnexure()">
	</div>
	</div>
	</div>													
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">GSM</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="GSM" maxlength="20" id="defaultconfig" id="gsm" name="gsm" onkeyup="autoAnnexure()">
	</div>
	</div>
	</div>													
	</div>													
	
	<h5>Price Benchmark</h5><hr>
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">This Lot (CFR,India)</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="This Lot" maxlength="10" id="defaultconfig" id="thisLot" name="thisLot" onkeyup="negValCheck()">
	</div>
	</div>
	</div>													
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">Invoice price</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="Invoice price" maxlength="10" id="defaultconfig" id="invoicePrice" name="invoicePrice" onkeyup="negValCheck();calculations();">
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">RISI (CFR,India)</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="RISI (CFR India)" maxlength="10" id="defaultconfig" id="risi" name="risi" onkeyup="negValCheck()">
	</div>
	</div>
	</div>													
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">AOP Receipt Price (2015-16)</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="AOP Receipt Price" maxlength="10" id="defaultconfig" id="aopreceiptprice" name="aopreceiptprice" onkeyup="negValCheck();calculations();">
	</div>
	</div>
	</div>													
	</div>
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">AOP Receipt ForEx (Rs/$)</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="AOP Receipt Price" maxlength="10" id="defaultconfig" id="aopreceiptforex" name="aopreceiptforex" onkeyup="negValCheck();calculations();">
	</div>
	</div>
	</div>													
	</div>
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">AOP Deal value (Rs cr)</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="AOP Deal value (Rs cr)" maxlength="10" id="defaultconfig" id="aopdealvalue" name="aopdealvalue" onkeyup="aopDealValue();" readonly>
																	
	</div>
	</div>
	</div>
	</div>
	
	<h5>Price Built-Up</h5><hr>
                <div class="row">
                <div class="col-xs-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Total Price (@ Rs/$)</label>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Unit rate" maxlength="10" id="defaultconfig" name="totalprice1" onkeyup="negValCheck();calculations();">
                </div>   
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Rs per ton" maxlength="10" id="defaultconfig" name="totalprice2" onkeyup="calculations();" readonly>                                                                                                                                                                                                                                                                        
                </div>   
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Spend RS Lakh" maxlength="10"  name="totalprice3" onkeyup="calculations();" readonly>
                                                                                                                                                                                                                                                                                
                </div>   
                </div>
                </div>   
                <div class="col-xs-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Custom Duty/Taxes</label>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Unit rate" maxlength="10" id="defaultconfig" name="cusduty1" onkeyup="negValCheck()">        
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Rs per ton" maxlength="10" id="defaultconfig" name="cusduty2" onkeyup="negValCheck()">        
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Spend RS Lakh" maxlength="10" id="defaultconfig" name="cusduty3" onkeyup="negValCheck();calculations();">        
                </div>
                </div>
                </div>                                                                                                                                                                                                   
                </div>                                                                                                                                                                                   
                <div class="row">
                <div class="col-xs-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Logistics cost</label>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Unit rate" maxlength="10" id="defaultconfig" name="freight1" onkeyup="negValCheck();calculations();autoAnnexure();" >     
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Rs per ton" maxlength="10" id="defaultconfig" name="freight2" onkeyup="negValCheck();calculations();autoAnnexure();" >     
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Spend RS Lakh" maxlength="10" id="defaultconfig" name="freight3" onkeyup="calculations();" readonly>     
                </div>
                </div>
                </div>                   
                <div class="col-xs-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Insurance (%)</label>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Unit rate" maxlength="10" id="defaultconfig" name="insurance1" onkeyup="negValCheck();calculations();">       
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Rs per ton" maxlength="10" id="defaultconfig" name="insurance2" onkeyup="calculations();" readonly>       
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Spend RS Lakh" maxlength="10" id="defaultconfig" name="insurance3" onkeyup="calculations()" readonly>       
                </div>
                </div>
                </div>                                                                                                                                                                                                   
                </div>
                <div class="row">
                <div class="col-xs-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Actual Deal value</label>
                <div class="col-md-3">
                                <!-- <input type="text" class="form-control" placeholder="Unit rate" maxlength="10" id="defaultconfig" name="totalcost1" onkeyup="">
                                <span class="glyphicon glyphicon-pencil tip-right" data-toggle="tooltip"  data-original-title="20 integer only"></span>                                                   -->                                                                                                                                                <input type="hidden" name="totalcost1" id ="totalcost1" value="0" />	
                 
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Rs per ton" maxlength="10" id="defaultconfig" name="totalcost2" onkeyup="calculations()"readonly>
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Spend RS Lakh" maxlength="10" id="defaultconfig" name="totalcost3" onkeyup="calculations()"readonly >
                </div>
                </div>
                </div>   

                <div class="col-xs-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Budget vs. Actual</label>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Budget vs. Actual" maxlength="10" id="defaultconfig" name="budact1" onkeyup="calculations()" readonly>
                </div>
                <!-- <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Rs per ton" maxlength="10" id="defaultconfig" name="budact2" onkeyup="negValCheck()">
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Spend RS Lakh" maxlength="10" id="defaultconfig" name="budact3" onkeyup="negValCheck()">
                </div> -->
                </div>
                </div>
                </div>
 
<h5>Inventory Details (TONS)</h5><hr>
                <div class="row">
                <div class="col-xs-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Quarter Opening Invetory</label>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Quantity" maxlength="10" id="defaultconfig" name="quainv1" onkeyup="negValCheck();calculations();">           
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Days" maxlength="10" id="defaultconfig" name="quainv2" onkeyup="negValCheck()">           
                </div>
                </div>
                </div>                                                                                                                                                                                                   
                <div class="col-xs-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Expected Receipts For Quarter</label>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Quantity" maxlength="10" id="defaultconfig" name="expectedreceipts1" onkeyup="negValCheck();calculations();">
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Days" maxlength="10" id="defaultconfig" name="expectedreceipts2" onkeyup="negValCheck()">
                </div>
                </div>
                </div>                                                                                                                                                                                                   
                </div>                                                                                                                                                                                   
                <div class="row">
                <div class="col-xs-6">
                 <div class="form-group">
                                <label class="control-label col-md-3">Estimated cons. for balance of the quarter</label>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Quantity" maxlength="10" id="defaultconfig" name="estimatedcons1" onkeyup="negValCheck();calculations();">
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Days" maxlength="10" id="defaultconfig" name="estimatedcons2" onkeyup="negValCheck()">
                </div>
                </div> 
                </div>                                                                                                                                                                                                   
                <div class="col-xs-6">
                <div class="form-group">
                                <label class="control-label col-md-3">Quarter-end physical inventory / stock</label>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Quantity" maxlength="10" id="defaultconfig" name="quarterend1" onkeyup="negValCheck();calculations();"readonly>
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Days" maxlength="10" id="defaultconfig" name="quarterend2" onkeyup="negValCheck()">
                </div>
                </div> 
                </div>                                                                                                                                                                                                   
                </div>
                <div class="row">
                <div class="col-xs-6">
                <!-- <div class="form-group">
                                <label class="control-label col-md-3">Earlier Contracted Qty For Quarter</label>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Quantity" maxlength="10" id="defaultconfig" name="earliercontracted1" onkeyup="negValCheck()">
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Days" maxlength="10" id="defaultconfig" name="earliercontracted2"onkeyup="negValCheck()">
                </div>
                </div> -->     
           </div>
<div class="row">
                <div class="col-xs-6">
                <!-- <div class="form-group">
                           <label class="control-label col-md-3">Current contarct</label>
                <div class="col-md-3">
                          <input type="text" class="form-control" placeholder="Quantity" maxlength="10" id="defaultconfig" name="currentcontarct1" onkeyup="negValCheck()">
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Days" maxlength="10" id="defaultconfig" name="currentcontarct2" onkeyup="negValCheck()">
                </div> -->
                </div>                                                                                                                                                                 </div>
                <div class="col-xs-6">
                <!-- <div class="form-group">
                                <label class="control-label col-md-3">Expected Total Cover</label>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Quantity" maxlength="10" id="defaultconfig" name="expcover1" onkeyup="negValCheck()">
                </div>
                <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="Days" maxlength="10" id="defaultconfig" name="expcover2" onkeyup="negValCheck()">
                </div>
                </div> -->
                </div>
                </div>
                
	<h5>Budget Buy(TONS)</h5><hr>
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">Annual Budget</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="Annual Budget" maxlength="10" id="defaultconfig" id="annualBudget" name="annualBudget" onkeyup="negValCheck();calculations();">
	</div>
	</div>
	</div>													
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">Contracted tons till last Qtr</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="Contracted tons till last Qtr" maxlength="10" id="defaultconfig" id="contractedTons" name="contractedTons" onkeyup="negValCheck();calculations();"> 
	</div>
	</div>
	</div>													
	</div>		
										
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">Current quarter (incl. this deal)</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="Current quarter (incl. this deal)" maxlength="10" id="defaultconfig" id="currentquarter" name="currentquarter" onkeyup="negValCheck();calculations();"> 
	</div>
	</div>
	</div>	

	<div class="col-xs-6">
	<div class="form-group">
		<label class="control-label col-md-3">Balance To Be Bought</label>
	<div class="col-xs-6">
		<input type="text" class="form-control" placeholder="Balance To Be Bought YTD" maxlength="10" id="defaultconfig" id="balance" name="balance" onkeyup="negValCheck();calculations();" readonly>
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
  <tr>
	<td height="20" valign="top" align="left"><span class="small">
      <textarea name="v1" id="v1" cols="20" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.v1,'vendorChar',50)" onkeyup="textCounter(document.priceApprovalMain.v1,'vendorChar',50)" ></textarea>   
    
	  </span>

	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vendorChar" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="c1" id="c1"cols="10" class="small" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.c1,'cChar',15)" onkeyup="textCounter(document.priceApprovalMain.c1,'cChar',15)"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cChar" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="m1"  id="m1" cols="20" rows="2" class="small" maxlength="30"  onkeydown="textCounter(document.priceApprovalMain.m1,'mChar',30)" onkeyup="textCounter(document.priceApprovalMain.m1,'mChar',30)"></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="mChar" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="g1" id="g1" cols="20" rows="2" class="small" maxlength="15"   onkeydown="textCounter(document.priceApprovalMain.g1,'gChar',15)" onkeyup="textCounter(document.priceApprovalMain.g1,'gChar',15);autoAnnexure();"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="gChar" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="a1" id="a1" class="small" cols="15" maxlength="35"  onkeydown="textCounter(document.priceApprovalMain.a1,'aChar',35)" onkeyup="textCounter(document.priceApprovalMain.a1,'aChar',35)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="aChar" width="10%" class="small">35</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="oq1" id="oq1" class="small" maxlength="10" cols="13"   onkeydown="textCounter(document.priceApprovalMain.oq1,'oqChar',10)" onkeyup="textCounter(document.priceApprovalMain.oq1,'oqChar',10);validateNumericData(this.id, this.value);spaceAlertNp(document.priceApprovalMain.oq1.value);"></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="oqChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="op1" id="op1" class="small" cols="13" maxlength="10"   onkeydown="textCounter(document.priceApprovalMain.op1,'opChar',10)" onkeyup="textCounter(document.priceApprovalMain.op1,'opChar',10);validateNumericData(this.id, this.value);spaceAlertNp(document.priceApprovalMain.op1.value);"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="opChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="fq1" id="fq1"class="small" maxlength="10" cols="13"  onkeydown="textCounter(document.priceApprovalMain.fq1,'fqChar',10)" onkeyup="textCounter(document.priceApprovalMain.fq1,'fqChar',10);validateNumericData(this.id, this.value);spaceAlertNp(document.priceApprovalMain.fq1.value);"></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="fqChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="fp1" id="fp1"class="small" maxlength="10" cols="13"  onkeydown="textCounter(document.priceApprovalMain.fp1,'fpChar',10)" onkeyup="textCounter(document.priceApprovalMain.fp1,'fpChar',10);validateNumericData(this.id, this.value);spaceAlertNp(document.priceApprovalMain.fp1.value);"></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="fpChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	

  </tr>

   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="add" onclick="addRow()" class="bold">
   <input type="button" value="  Remove Row   " name="add" onclick="delRow()" class="bold"></td></tr>
   <input type="hidden" name="count" value="1" />	

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
  <tr>
	<td height="20" valign="top" align="left"><span class="small">
      <textarea name="vn1" id="vn1" cols="20" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.vn1,'vendorName2',50)" onkeyup="textCounter(document.priceApprovalMain.vn1,'vendorName2',50)" ></textarea>   
    
	  </span>

	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vendorName2" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="co1" id="co1"cols="10" class="small" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.co1,'country2',15)" onkeyup="textCounter(document.priceApprovalMain.co1,'country2',15)"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="country2" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="mill1"  id="mill1" cols="20" rows="2" class="small" maxlength="30"  onkeydown="textCounter(document.priceApprovalMain.mill1,'millChar2',30)" onkeyup="textCounter(document.priceApprovalMain.mill1,'millChar2',30)"></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="millChar2" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="gr1" id="gr1" cols="20" rows="2" class="small" maxlength="15"   onkeydown="textCounter(document.priceApprovalMain.gr1,'gChar2',15)" onkeyup="textCounter(document.priceApprovalMain.gr1,'gChar2',15)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="gChar2" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="qscr1" id="qscr1" class="small" cols="15" maxlength="35"  onkeydown="textCounter(document.priceApprovalMain.qscr1,'qChar2',35)" onkeyup="textCounter(document.priceApprovalMain.qscr1,'qChar2',35)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="qChar2" width="10%" class="small">35</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="rem1" id="rem1" class="small" maxlength="200" cols="35" rows="4"  onkeydown="textCounter(document.priceApprovalMain.rem1,'remChar',200)" onkeyup="textCounter(document.priceApprovalMain.rem1,'remChar',200)"></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="remChar" width="10%" class="small">200</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	

  </tr>

   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="add" onclick="addRow2()" class="bold">
   <input type="button" value="  Remove Row   " name="add" onclick="delRow2()" class="bold"></td></tr>
   <input type="hidden" name="count2" value="1" />	

 </table>








	<h5>Remarks & Events</h5><hr>
	<div class="row">
	
	<div class="form-group">
		<label class="col-md-2 control-label">Other Remarks</label>
	<div class="col-md-9">
		<textarea class="form-control" rows="4" placeholder="Other Remarks" maxlength="2000" id="textarea" id="otherRemarks" name="otherRemarks"></textarea>
	
	</div>
	</div>
	</div>
	<div class="row">
	
	<div class="form-group">
		<label class="col-md-2 control-label">Market Events</label>
	<div class="col-md-9">
		<textarea class="form-control" rows="4" placeholder="Market Events" maxlength="2000" id="textarea" id="marketEvents" name="marketEvents"></textarea>
	
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
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('compulsory','0');" > <img src="images/attachmentNp.png" border="0" /></a> </td>	
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
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('additional','0');" ><img src="images/attachmentNp.png" border="0" /></a> </td>	
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
        
    //System.out.println(approvers.size());
    String BnC   = "", Director  = "", Epsupplychain = "", COO = "",CEO = "", MD = "";
    
    for(int i=0; i<approvers.size() ;i++){

        String apprv []  = (String[])approvers.get(i);

        if(apprv[1].equals("1")){
            BnC= "<option value=\""+apprv[0]+"\">"+apprv[3]+"</option>";
        }else if(apprv[1].equals("2")) {
            Director=  "<option value=\""+apprv[0]+"\">"+apprv[3]+"</option>";
        }else if(apprv[1].equals("3")) {
            Epsupplychain=  "<option value=\""+apprv[0]+"\">"+apprv[3]+"</option>";
        }else if(apprv[1].equals("4")) {
            COO=  "<option value=\""+apprv[0]+"\">"+apprv[3]+"</option>";
        }else if(apprv[1].equals("5")) {
            CEO=  "<option value=\""+apprv[0]+"\">"+apprv[3]+"</option>";
        }else if(apprv[1].equals("6")) {
            MD=  "<option value=\""+apprv[0]+"\">"+apprv[3]+"</option>";
        }
    }
%>	
	<h5>Approvals</h5><hr>
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="col-md-3 control-label">B&C</label>
	<div class="col-xs-6">
		<select class="form-control" name= "bussinessAndCommercial" id = "bussinessAndCommercial" onfocus="onLoadDetail('1');">
            <option value="0">Select</option>
			<%=BnC%>
		</select>		
	</div>
	</div>
	</div>													
	<div class="col-xs-6">
	<div class="form-group">
		<label class="col-md-3 control-label">COO</label>
	<div class="col-xs-6">
		<select name = "coo" id = "coo" class="form-control">
            <option value="0">Select</option>
			<%=COO%>

		</select>
	</div>
	</div>
	</div>													
	</div>												
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="col-md-3 control-label">Director-B&C</label>
	<div class="col-xs-6">
		<select name = "director" id = "director" class="form-control">
            <option value="0">Select</option>
			<%=Director%>
		</select>
	</div>
	</div>
	</div>
	<div class="col-xs-6">
	<div class="form-group">
		<label class="col-md-3 control-label">CEO</label>
	<div class="col-xs-6">
		<select name = "ceo" id = "ceo" class="form-control">
            <option value="0">Select</option>
			<%=CEO%>
		</select>
	</div>
	</div>
	</div>																											
	</div>
	<div class="row">
	<div class="col-xs-6">
	<div class="form-group">
		<label class="col-md-3 control-label">Ep-Supply Chain</label>
	<div class="col-xs-6">
		<select name = "epSupplyChain" id = "epSupplyChain" class="form-control">
            <option value="0">Select</option>
			<%=Epsupplychain%>
		</select>
	</div>
	</div>
	</div>
	<div class="col-xs-6">
	<div class="form-group">
		<label class="col-md-3 control-label">MD</label>
	<div class="col-xs-6">
		<select name = "md" id = "md" class="form-control">
            <option value="0">Select</option>
			<%=MD%>
		</select>
	</div>
	</div>
	</div>																											
	</div>	
<br/>
<br/>
    <div class="form-actions">
	<div class="col-md-offset-5 ">
		<input name="savedraft" type="button"  class="btn btn-success" id="savedraft" value="Save Draft" onclick="savedraftnp();"/>
		<input name="submitForm1" onclick="validateForm1(1);" type="button"  class="btn btn-success" id="submitForm1" value="Submit" />
		<input name="resetButton1" type="reset"  class="btn btn-success" id="resetButton1" value="Reset" />
	</div>
	</div>
<br/>
</div>
</form>										


</div>
</body>

</html>