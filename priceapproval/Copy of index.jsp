<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="includes/sessionCheck.jsp"%>
<%@ page errorPage="common/errorPage.jsp"%>
<%@ include file="includes/empHeader.jsp"%>
<% int flg = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PRICE APPROVAL</title>
<link href="style/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="jscripts/util.js"></script>
<script Language="JavaScript" src="jscripts/common.js"></script>
<script Language="JavaScript" src="jscripts/search.js"></script>
<script type="text/javascript" src="jscripts/jquery.js"></script>
<script Language="JavaScript" src="jscripts/fieldCheck.js"></script>
<link href="style/popup.css" rel="stylesheet" type="text/css" />

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
var counter = 2;
var counter1 = 3;
var rcounter=14;
function addRow()
{
  counter = parseInt(counter) + 1;

  document.priceApprovalMain.count.value = counter;

  tabBody = document.getElementById("inputtable");
  row	  = document.createElement("TR");

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='v"+counter+"'  class='small'  cols='28' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.v"+counter+",'vendorChar"+counter+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.v"+counter+",'vendorChar"+counter+"',50)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"vendorChar"+counter+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='i"+counter+"' class='small'  cols='17' maxlength='15' onkeydown=\"textCounter(document.priceApprovalMain.i"+counter+",'initChar"+counter+"',15)\" onkeyup=\"textCounter(document.priceApprovalMain.i"+counter+",'initChar"+counter+"',15)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"initChar"+counter+"\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='f"+counter+"' class='small'  cols='17' maxlength='15' onkeydown=\"textCounter(document.priceApprovalMain.f"+counter+",'finChar"+counter+"',15)\" onkeyup=\"textCounter(document.priceApprovalMain.f"+counter+",'finChar"+counter+"',15)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"finChar"+counter+"\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>  ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name='d"+counter+"' rows='2' class='small' maxlength='30'  onkeydown=\"textCounter(document.priceApprovalMain.d"+counter+",'dcpChar"+counter+"',30)\" onkeyup=\"textCounter(document.priceApprovalMain.d"+counter+",'dcpChar"+counter+"',30)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"dcpChar"+counter+"\" width=\"10%\" class=\"small\">30</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);

 /* cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name='w"+counter+"' rows='2' class='small' maxlength='30' onkeydown=\"textCounter(document.priceApprovalMain.w"+counter+",'wdlChar"+counter+"',30)\" onkeyup=\"textCounter(document.priceApprovalMain.w"+counter+",'wdlChar"+counter+"',30)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"wdlChar"+counter+"\" width=\"10%\" class=\"small\">30</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);*/



    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"pt"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"120\" cols='28'   onkeydown=\"textCounter(document.priceApprovalMain.pt"+counter+",'ptChar"+counter+"',120)\" onkeyup=\"textCounter(document.priceApprovalMain.pt"+counter+",'ptChar"+counter+"',120)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"ptChar"+counter+"\" width=\"10%\" class=\"small\">120</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);

  

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"va"+counter+"\" rows=\"2\" class=\"small\" maxlength=\"225\"  cols='28' onkeydown=\"textCounter(document.priceApprovalMain.va"+counter+",'vaChar"+counter+"',225)\" onkeyup=\"textCounter(document.priceApprovalMain.va"+counter+",'vaChar"+counter+"',225)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"vaChar"+counter+"\" width=\"10%\" class=\"small\">225</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


  tabBody.appendChild(row);
}
function delRow()
{
	if(counter > 2)
	{
	document.getElementById("inputtable").deleteRow(counter);
	counter = counter - 1;
	document.priceApprovalMain.count.value = counter;
	}
}
/*
function addRow1()
{
  counter1 = parseInt(counter1) + 1;
  //rcounter=rcounter+1;

  document.priceApprovalMain.count1.value = counter1;

  tabBody = document.getElementById("inputtable1");
  row	  = document.createElement("TR");

  
  

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"reason"+counter+" rows=\"2\" cols=\"28\" class=\"small\" cols=\"20\" maxlength=\"5\"></textarea>";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"attach"+counter+"\" type=\"text\" cols=\"7\" class=\"small\" id=\"attach"+counter+"\" value=\"\" readonly=\"readonly\"></textarea><a href=\"#\" onclick=\"upload('attach"+counter+"')\"><img src=\"images/attachment.gif\" border=\"0\" /></a><input name=\"attach"+counter+"New\" type=\"hidden\" id=\"attach"+counter+"New\" value=\"\" />";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"compName"+counter+"\" class=\"small\" cols=\"28\" id=\"compName"+counter+"\"  size=\"25\" maxlength=\"100\" onkeydown=\"textCounter(document.priceApprovalMain.compName"+counter+",'cNChar"+counter+"',100)\" onkeyup=\"textCounter(document.priceApprovalMain.compName"+counter+",'cNChar"+counter+"',100)\" ></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"cNChar"+counter+"\" width=\"10%\" class=\"small\">100</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"reason"+rcounter+"\" rows=\"2\" class=\"small\" cols=\"28\" maxlength=\"50\" onkeydown=\"textCounter(document.priceApprovalMain.reason"+rcounter+",'pncChar',50)\" onkeyup=\"textCounter(document.priceApprovalMain.reason"+rcounter+",'pncChar',50)\"></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"pncChar\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"fromDateAir"+counter+"\" class=\"small\" id=\"fromDateAir\" cols=\"16\"  size=\"15\" maxlength=\"15\"  onkeydown=\"textCounter(document.priceApprovalMain.fromDateAir,'rateChar',15)\"onkeyup=\"textCounter(document.priceApprovalMain.fromDateAir,'rateChar',15)\"></textarea> </span>	<div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"rateChar\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"UOM1\" class=\"small\" id=\"UOM1\"  rows=\"2\" cols=\"16\" maxlength=\"15\"  onkeydown=\"textCounter(document.priceApprovalMain.UOM1,'UOM1Char',15)\" onkeyup=\"textCounter(document.priceApprovalMain.UOM1,'UOM1Char',15)\" ></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"UOM1Char\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"rem1\" rows=\"2\" class=\"small\" cols=\"28\" maxlength=\"50\"  onkeydown=\"textCounter(document.priceApprovalMain.rem1,'rem1Char',200)\"onkeyup=\"textCounter(document.priceApprovalMain.rem1,'rem1Char',200)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"rem1Char\" width=\"10%\" class=\"small\">200</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);



  tabBody.appendChild(row);
}

function delRow1()
{
	if(counter1 > 3)
	{
	document.getElementById("inputtable1").deleteRow(counter1);
	counter1 = counter1 - 1;
	document.priceApprovalMain.count1.value = counter1;
	}
}*/
</script>
<script  type="text/javascript" language="javascript">
	 $(document).ready(function(){
		$(".closeBtn").click(function(){			
			$(".QTPopup").css('display', 'none');
		})
})
</script>
</head>
<body onload="showStatus();showSAB();<%if(timescapeUserOId==91 || timescapeUserOId==31670 || timescapeUserOId==24939 || timescapeUserOId==28821){%>showAllRequests();<%flg = 1;}%>">
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
<form name="priceApprovalMain" method="post" action="">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="images/header_price1.jpg" width="842" height="44" /></td>
    <td width="23%" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="38"><img src="images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">Supported By / Approved By</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;Tip : In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /></td>
          </tr>
				<tr><td height="10" colspan="5"></td></tr>
		  <tr>
		<td>
		<table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="17%" height="29" >PRICE APPROVAL ID</td>
          <td width="35%" align="left">INTENDED USER</td>
          <td width="32%" align="left">PROJECT - PACKAGE NAME</td>
         <!--   <td width="19%" align="left">Delivery/ Completion Period</td> -->
          <td width="16%" align="left">STATUS</td>
        </tr>
		<tr><td id = "sab" width="100%" colspan="7" height="60"></td></tr>
		 <tr>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" colspan="2" align="center" valign="top">&nbsp;</td>
        </tr> 
	</table>
	</td></tr>
		<tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
        <tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">VIEW STATUS</td>
        </tr>
      </table>
      <table border="0" cellspacing="0" cellpadding="0" width="100%">
       
          <tr>
            <td class="small" height="20"  align="left">&nbsp;Tip : In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /></td>
          </tr>
				<tr><td height="10" colspan="5"></td></tr>
           </table>
	      <table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="17%" height="29" >PRICE APPROVAL ID</td>
          <td width="35%" align="left">INTENDED USER</td>
		  <td width="32%" align="left">PROJECT - PACKAGE NAME</td>
         <!--  <td width="27%" align="left">FINAL OFFER (Rs)</td>
          <td width="19%" align="left">Delivery/ Completion Period</td> -->
          <td width="16%" align="left">STATUS</td>
        </tr>
		<tr><td id = "status" width="100%" colspan="5" height="60"></td></tr>
		 <tr>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" colspan="2" align="center" valign="top">&nbsp;</td>
        </tr> 
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
            <td class="small" height="20"  align="left">&nbsp;Tip : In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /></td>
          </tr>
				<tr><td height="10" colspan="5"></td></tr>
		  <tr>
		<td>
		<table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="17%" height="29" >PRICE APPROVAL ID</td>
          <td width="35%" align="left">INTENDED USER</td>
          <td width="32%" align="left">PROJECT - PACKAGE NAME</td>
         <!--   <td width="19%" align="left">Delivery/ Completion Period</td> -->
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
<%}%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <!-- <tr>
    <td width="45%" bgcolor="#E6DED1"><img src="images/price_footer.jpg" width="347" height="25" /></td>
    <td width="55%" bgcolor="#E6DED1"><img src="images/related_links.png" width="18" height="18" /><span class="boldsmall">Related links&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;  | <img src="images/otherESSlinks.png" width="18" height="18" /> <span class="boldsmall">Other ESS links</span></td>
  </tr>-->
</table>

<table width="100%" cellspacing="2" cellpadding="2" border="0">
  <tr bgcolor="#fbf9f9"  class="travelMenuBG">
     <td colspan="2" align="right" >CATEGORY&nbsp;:&nbsp;</td>
	 <td colspan="2"><select class="small" id="category" name="category" onchange="project()">
		<option value="0">Select Category</option>
        <option value="NP & Logistics">NP & Logistics</option>
		<option value="IBO">IBO</option>
		<option value="Capex">Capex</option>
		<option value="IT buying">IT buying</option>
		<option value="Consumables">Consumables</option>
		<option value="Insurance">Insurance</option>
		<option value="Non conventional category">Non conventional category</option>
		<option value="Projects">Projects</option>
		<option value="OSP">OSP</option>
		<option value="Group Company related buying">Group Company related buying</option>

		<!-- <option value="NewsPrint">NewsPrint</option>
		<option value="Consumables">Consumables</option>
		<option value="Projects">Projects</option>
		<option value="General Purchase">General Purchase</option> -->

	</select></td>
	<!-- <td>&nbsp;</td> -->
	
  </tr>
  <tr>
    <td height="26" colspan="2" bgcolor="#fbf9f9" class="travelMenuBG">PC MEETING DETAILS</td>
    <td colspan="2" align="left" bgcolor="#fbf9f9" class="travelMenuBG">PROJECT DETAILS</td>
  </tr>
  <tr>
    <td width="18%" height="27" bgcolor="#fbf9f9"><span class="small" id="top">Negotiation/PC meeting date:</span></td>
    <td width="26%" align="left"><span class="small">
      <input name="requestedBy" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" />
    </span></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Description:</span></td>
    <td width="35%" align="left"><span class="small">


    <table width="100%" cellspacing="0" cellpadding="0" border="0">
	 <tr>
	  <td width="45%">
	  <textarea name="requestedBy2" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy2,'requestedBy2Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy2,'requestedBy2Description',100)"></textarea>
	  <input  name = "apprChk" id="apprChk" type="hidden" value="0" />
	  <td width="3%"></td>
	  <td id="requestedBy2Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Negotiation/PC meeting venue:</span></td>
    <td width="30%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%"><textarea name="reason4" rows="2" class="small" cols="19" onkeydown="textCounter(document.priceApprovalMain.reason4,'lineCountDescription',50)" onkeyup="textCounter(document.priceApprovalMain.reason4,'lineCountDescription',50)"></textarea></td>
	  <td width="3%"></td>
	  <td id="lineCountDescription" align="left" width="8%">50</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
		<!--<input name="lineCountDescription" class="style3" value="100" size="3" maxlength="3" readonly="readOnly" />-->
    </span></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Intented User/ User group:</span></td>
    <td width="35%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy3" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy3,'requestedBy3Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy3,'requestedBy3Description',100)"/>
	  <td width="3%"></td>
	  <td id="requestedBy3Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
      </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><p class="small">Negotiated value (Rs):</p></td>
    <td width="26%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy7" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy7,'requestedBy7Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy7,'requestedBy7Description',100); negValCheck()"/>
	  <td width="3%"></td>
	  <td id="requestedBy7Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    <td valign="middle" width="21%" align="left" bgcolor="#fbf9f9" rowspan="2" class="normal"><span class="small">Project:</span></td>
    <td valign="middle" width="35%" align="left" rowspan="2"Description:><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%"  valign="middle">
	  <input name="requestedBy4" id="requestedBy4" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy4,'requestedBy4Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy4,'requestedBy4Description',100)"/>
	  <td width="3%"></td>
	  <td id="requestedBy4Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>

  </tr>



<tr>
    <td bgcolor="#fbf9f9"><p class="small">Validity Period :</p></td>
    <td width="26%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="validity" class="small" maxlength="20" valign="middle" onkeydown="textCounter(document.priceApprovalMain.validity,'validityDescription',20)" onkeyup="textCounter(document.priceApprovalMain.validity,'validityDescription',20)"/>
	  <td width="3%"></td>
	  <td id="validityDescription" align="left" width="8%">20</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    
  </tr>



  <tr>

    <td bgcolor="#fbf9f9"><span class="small">Finalized vendor(s) name :</span></td>
    <td width="26%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy8" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy8,'requestedBy8Description',50)" onkeyup="textCounter(document.priceApprovalMain.requestedBy8,'requestedBy8Description',50)"/>
	  <td width="3%"></td>
	  <td id="requestedBy8Description" align="left" width="8%">50</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Total Budget (Rs.) / Sanction:</span></td>
    <td width="35%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy5" id="requestedBy5" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy5,'requestedBy5Description',20)" onkeyup="textCounter(document.priceApprovalMain.requestedBy5,'requestedBy5Description',20);autoFillBalanceBudget()"/>
	  <td width="3%"></td>
	  <td id="requestedBy5Description" align="left" width="8%">20</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Payment terms:</span></td>
    <td width="26%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <textarea name="reason" rows="2" class="small" cols="19" onkeydown="textCounter(document.priceApprovalMain.reason,'reasonDescription',150)" onkeyup="textCounter(document.priceApprovalMain.reason,'reasonDescription',150)"></textarea>
	  <td width="3%"></td>
	  <td id="reasonDescription" align="left" width="8%">150</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
      </span></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">PO's Commited till date (Rs.)</span></td>
    <td width="35%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="fqtNumber" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.fqtNumber,'fqtNumberDescription',20)" onkeyup="textCounter(document.priceApprovalMain.fqtNumber,'fqtNumberDescription',20);autoFillBalanceBudget()"/>
	  <td width="3%"></td>
	  <td id="fqtNumberDescription" align="left" width="8%">20</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
      </span></td>
  </tr>
  <tr>


	<td bgcolor="#fbf9f9"><span class="small">Hard Savings (Rs):</span></td>
    <td width="26%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy9" class="small" maxlength="100"  onkeydown="textCounter(document.priceApprovalMain.requestedBy9,'requestedBy9Description',20)" onkeyup="textCounter(document.priceApprovalMain.requestedBy9,'requestedBy9Description',20);savingsChk()"/>
	  <td width="3%"></td>
	  <td id="requestedBy9Description" align="left" width="8%">20</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>

    <td width="21%" rowspan="2" height="26" align="left" valign="middle" bgcolor="#fbf9f9" class="small">Balance Budget (Rs.)</td>
    <td valign="middle" rowspan="2" width="35%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%" >
	  <input name="requestedBy6" class="small" maxlength="100" readonly="readonly" />
	  <!-- onkeydown="textCounter(document.priceApprovalMain.requestedBy6,'requestedBy6Description',20)" onkeyup="textCounter(document.priceApprovalMain.requestedBy6,'requestedBy6Description',20)" -->
	  <td width="3%"></td>
	  <td id="requestedBy6Description" align="left" width="8%"><!-- 20 --></td>
	  <td align="left"><!-- Chars Left --></td>
	  </tr>
	  </table>
    </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Cost Avoidance (Rs):</span></td>
    <td width="26%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy10" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy10,'requestedBy10Description',20)" onkeyup="textCounter(document.priceApprovalMain.requestedBy10,'requestedBy10Description',20);savingsChk()"/>
	  <td width="3%"></td>
	  <td id="requestedBy10Description" align="left" width="8%">20</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">
 <tr>
    <td height="22" bgcolor="#ffffff" class="travelMenuBG">BACKGROUND</td>
  </tr>
  <tr>
  <td  align="left" width="100%" valign="top"><textarea name="req" id="req" cols="35" rows="9" maxlength="3000" onkeydown="textCounter(document.priceApprovalMain.req,'reqChar',3000)" onkeyup="textCounter(document.priceApprovalMain.req,'reqChar',3000)" style ="height:130px;width:99%"></textarea>
		<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="reqChar" width="3%" class="small">3000</td><td class="small">Chars Left</td></tr></table></div>
	</td>
	</tr>
</table>
<table width="100%" cellspacing="2" cellpadding="2">
<tbody id="inputtable">
  <tr class="greyBG">
	<td width="13%" height="29" >VENDOR</td>
    <td width="9%" align="left">INITIAL OFFER (Rs)</td>
    <td width="9%" align="left">FINAL OFFER (Rs)</td>
    <td width="10%" align="left">DELIVERY / COMPLETION PERIOD</td>
<!--     <td width="4%" align="left">Warranty/ Defect Liability Period</td>
 -->    <td width="13%" align="left">PAYMENT TERMS</td>
    <td width="13%" align="left">VALUE ADD</td>
	</tr>
  <tr>
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="v1" cols="25"  rows="2" class="small" maxlength="50" onkeydown="textCounter(document.priceApprovalMain.v1,'vendorChar',50)" onkeyup="textCounter(document.priceApprovalMain.v1,'vendorChar',50)" ></textarea>
	  </span>

	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vendorChar" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="i1" cols="15"  rows="2" class="small" maxlength="30" onkeydown="textCounter(document.priceApprovalMain.i1,'initChar',15)" onkeyup="textCounter(document.priceApprovalMain.i1,'initChar',15)"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="initChar" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="f1"   rows="2" cols="15" class="small" maxlength="15" onkeydown="textCounter(document.priceApprovalMain.f1,'finOffChar',15)" onkeyup="textCounter(document.priceApprovalMain.f1,'finOffChar',15)"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="finOffChar" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="d1" rows="2" class="small" maxlength="30"  onkeydown="textCounter(document.priceApprovalMain.d1,'dcpChar',30)" onkeyup="textCounter(document.priceApprovalMain.d1,'dcpChar',30)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="dcpChar" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

<!--     <td height="25" valign="top" align="left"><span class="small">
      <textarea name="w1" rows="2" class="small" maxlength="30"   onkeydown="textCounter(document.priceApprovalMain.w1,'wdlChar',30)" onkeyup="textCounter(document.priceApprovalMain.w1,'wdlChar',30)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="wdlChar" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td> -->
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="pt1" rows="2" class="small" cols="20" maxlength="120"   onkeydown="textCounter(document.priceApprovalMain.pt1,'ptChar1',120)" onkeyup="textCounter(document.priceApprovalMain.pt1,'ptChar1',120)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="ptChar1" width="10%" class="small">120</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="va1" rows="2" class="small" maxlength="255" cols="20"  onkeydown="textCounter(document.priceApprovalMain.va1,'vaChar1',255)" onkeyup="textCounter(document.priceApprovalMain.va1,'vaChar1',255)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vaChar1" width="10%" class="small">255</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	

  </tr>
  <tr>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="v2" cols="25" class="small" size="15" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.v2,'vendorChar2',50)" onkeyup="textCounter(document.priceApprovalMain.v2,'vendorChar2',100)" ></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vendorChar2" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>


    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="i2" cols="15" class="small"  size="15" maxlength="15" onkeydown="textCounter(document.priceApprovalMain.i2,'initChar2',15)" onkeyup="textCounter(document.priceApprovalMain.i2,'initChar2',15)" ></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="initChar2" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="f2" class="small" cols="15"  size="15" maxlength="15"    onkeydown="textCounter(document.priceApprovalMain.f2,'finChar2',15)" onkeyup="textCounter(document.priceApprovalMain.f2,'finChar2',15)" ></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="finChar2" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="d2" rows="2" class="small" maxlength="30" onkeydown="textCounter(document.priceApprovalMain.d2,'dcpChar2',30)" onkeyup="textCounter(document.priceApprovalMain.d2,'dcpChar2',30)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="dcpChar2" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
<!--     <td height="25" valign="top" align="left"><span class="small">
      <textarea name="w2" rows="2" class="small" maxlength="30" onkeydown="textCounter(document.priceApprovalMain.w2,'wdlChar2',30)" onkeyup="textCounter(document.priceApprovalMain.w2,'wdlChar2',30)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="wdlChar2" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td> -->
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="pt2" rows="2" class="small" maxlength="120" cols="20"  onkeydown="textCounter(document.priceApprovalMain.pt2,'ptChar2',120)" onkeyup="textCounter(document.priceApprovalMain.pt2,'ptChar2',120)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="ptChar2" width="10%" class="small">120</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="va2" rows="2" class="small" maxlength="255" cols="20"  onkeydown="textCounter(document.priceApprovalMain.va2,'vaChar2',255)" onkeyup="textCounter(document.priceApprovalMain.va2,'vaChar2',255)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vaChar2" width="10%" class="small">255</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
  </tr>
   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="add" onclick="addRow()" class="bold">
   <input type="button" value="  Remove Row   " name="add" onclick="delRow()" class="bold"></td></tr>
   <input type="hidden" name="count" value="2" />	

 </table>
<table width="100%" bgcolor="#ffffff" border="0" cellpadding="2" cellspacing="2">
<tr>
    <td width="55%" height="50" colspan="1" bgcolor="#ffffff" class="travelMenuBG">RECOMMENDATION</td>
	<td width="45%" height="25" colspan="2" class="travelMenuBG">ATTACHMENTS</td>
  </tr>
<tr>
 <td  width="55%" height ="25" rowspan="4" align="left" valign="middle"><textarea name="recommendation" id="recommendation" maxlength="3000" cols="55" rows="12" onkeydown="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" onkeyup="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" style ="height:170px;width:96%"></textarea><div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="recommendationChar" width="3%" class="small">3000</td><td class="small">&nbsp;Chars Left</td></tr></table></div></td>
 
  <td width="22%" height="25" align="left" valign="top" class="greyBG">DESCRIPTION</td>
    <td width="22%" height="25" align="left" valign="top" class="greyBG">ATTACH</td> 
	</tr>
	<tr>
	 <td  height="22" align="left" valign="top"><span class="small">
	  <select name="reason1" class="small" id="reason1">
         <option value="NA">Select Description</option>
         <option value="Comparative chart">Comparative chart</option>
		 <option value="Final recommended summary">Final recommended summary</option>
		 <option value="Others">Others</option>
	  </select>
   
    </span></td>

    <td height="22" align="left" valign="top"><textarea name="attach1" type="text" cols="20" class="small" id="attach1" value="" readonly="readonly"></textarea><a href="#" onclick="upload('attach1')"><img src="images/attachment.gif" border="0" /></a><input name="attach1New" type="hidden" id="attach1New" value="" /></td>
	</tr>
	<tr>
    <td height="22" valign="top" align="left"><span class="small">
	<select name="reason2" class="small" id="reason2">
	    <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
     
    </span></td>
    <td height="22" valign="top" align="left"><textarea name="attach2" type="text" cols="20" class="small" id="attach2" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach2')"><img src="images/attachment.gif" border="0" /></a><input name="attach2New" type="hidden" id="attach2New" value="" /></td>
	</tr>
	
	<tr>
	
	 <td height="22" valign="top" align="left"><span class="small">
	 <select name="reason3" id="reason3" class="small">
       <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
    </span></td>
    <td height="22" valign="top" align="left"><textarea name="attach3" type="text" cols="20" class="small" id="attach3" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach3')"><img src="images/attachment.gif" border="0" /></a><input name="attach3New" type="hidden" id="attach3New" value="" />
	</td> 
	</tr>
	
 </table>


<table width="100%" cellspacing="2" cellpadding="2">
<!-- <tbody id="inputtable1"> -->
  <tr>
   <!--  <td height="32"  colspan="2" valign="middle" class="travelMenuBG">ATTACHMENTS</td> -->
    <td colspan="5" align="left" valign="middle" class="travelMenuBG">BENCHMARKING</td>
    <!-- <td width="10"  valign="middle" class="travelMenuBG">RECOMMENDATION</td> -->
  </tr>
  <tr>
   <!--  <td width="12%" height="25" align="left" valign="top" class="greyBG">DESCRIPTION</td>
    <td width="15%" height="25" align="left" valign="top" class="greyBG">ATTACH</td> -->
    <td width="13%" valign="left" valign="top" class="greyBG">VENDOR NAME</td>
    <td width="12%" valign="left" valign="top" class="greyBG">PRODUCT/SERVICE</td>
    <td width="8%" valign="left" valign="top" class="greyBG">RATE (Rs.)</td>
    <td width="8%" align="left" valign="top" class="greyBG">UOM</td>
    <td width="13%" valign="left" valign="top" class="greyBG">REMARKS</td>
    <!-- <td align="left" valign="top" class="greyBG">Benchmark Rate</td> -->
   
  </tr>
  <tr>
   <!--  <td  height="25" align="left" valign="top"><span class="small">
      <textarea name="reason1" rows="2" cols="28" class="small" cols="20" maxlength="50"></textarea>
    </span></td>

    <td height="25" align="left" valign="top"><textarea name="attach1" type="text" cols="7" class="small" id="attach1" value="" readonly="readonly"></textarea><a href="#" onclick="upload('attach1')"><img src="images/attachment.gif" border="0" /></a><input name="attach1New" type="hidden" id="attach1New" value="" /></td> -->


    <td valign="top" align="left"><span class="small">
      <textarea name="compName1" class="small" cols="28" id="compName1"  size="25" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.compName1,'cNChar1',100)" onkeyup="textCounter(document.priceApprovalMain.compName1,'cNChar1',100)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cNChar1" width="10%" class="small">100</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>


    <td  align="left" valign="top" class="small"><textarea name="reason14" rows="2" class="small" cols="28" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.reason14,'pncChar',50)" onkeyup="textCounter(document.priceApprovalMain.reason14,'pncChar',50)"  ></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="pncChar" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td  align="left" valign="top"><span class="small">
      <textarea name="fromDateAir1" class="small" id="fromDateAir1" cols="16"  size="15" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.fromDateAir1,'rateChar',15)" onkeyup="textCounter(document.priceApprovalMain.fromDateAir1,'rateChar',15)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rateChar" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
    
	<td  align="left" valign="top">
	<span class="small">
      <textarea name="UOM1" class="small" id="UOM1"  rows="2" cols="16" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.UOM1,'UOM1Char',15)" onkeyup="textCounter(document.priceApprovalMain.UOM1,'UOM1Char',15)" ></textarea>
    </span>
	
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="UOM1Char" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>	

	<td  align="left" valign="top" class="small"><textarea name="rem1" rows="2" class="small" cols="28" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.rem1,'rem1Char',200)" onkeyup="textCounter(document.priceApprovalMain.rem1,'rem1Char',200)"  ></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rem1Char" width="10%" class="small">200</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>


  </tr>
    <tr>
   <!--  <td height="25" valign="top" align="left"><span class="small">
      <textarea name="reason2" rows="2" cols="28" class="small" cols="20" maxlength="50"></textarea>
    </span></td>
    <td height="25" valign="top" align="left"><textarea name="attach2" type="text" cols="7" class="small" id="attach2" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach2')"><img src="images/attachment.gif" border="0" /></a><input name="attach2New" type="hidden" id="attach2New" value="" /></td> -->
	<td valign="top" align="left"><span class="small">
      <textarea name="compName2" class="small" cols="28" id="compName2"  size="25" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.compName2,'cNChar2',100)" onkeyup="textCounter(document.priceApprovalMain.compName2,'cNChar2',100)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cNChar2" width="10%" class="small">100</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
	<td valign="top" align="left"><span class="small">
      <textarea name="reason15" rows="2" class="small" cols="28" maxlength="50" onkeydown="textCounter(document.priceApprovalMain.reason15,'pncChar2',50)" onkeyup="textCounter(document.priceApprovalMain.reason15,'pncChar2',50)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="pncChar2" width="10%" class="small" >50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
    <td valign="top" align="left"><span class="small">
      <textarea name="fromDateAir2" class="small" id="fromDateAir2" cols="16"  size="15" maxlength="15" onkeydown="textCounter(document.priceApprovalMain.fromDateAir2,'rateChar2',15)" onkeyup="textCounter(document.priceApprovalMain.fromDateAir2,'rateChar2',15)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rateChar2" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>



	<td  align="left" valign="top">
	<span class="small">
      <textarea name="UOM2" class="small" id="UOM2"  rows="2" cols="16" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.UOM2,'UOM2Char',15)" onkeyup="textCounter(document.priceApprovalMain.UOM2,'UOM2Char',15)" ></textarea>
    </span>
	
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="UOM2Char" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
	<td align="left" valign="top" class="small"><textarea name="rem2" rows="2" class="small" cols="28" maxlength="200"  onkeydown="textCounter(document.priceApprovalMain.rem2,'rem2Char',200)" onkeyup="textCounter(document.priceApprovalMain.rem2,'rem2Char',200)"  ></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rem2Char" width="10%" class="small">200</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

  </tr>
  <tr>
    <!-- <td height="36" valign="top" align="left"><span class="small">
      <textarea name="reason3" rows="2" cols="28" class="small" cols="20" maxlength="50"></textarea>
    </span></td>
    <td height="36" valign="top" align="left"><textarea name="attach3" type="text" cols="7" class="small" id="attach3" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach3')"><img src="images/attachment.gif" border="0" /></a><input name="attach3New" type="hidden" id="attach3New" value="" />
	</td> -->
	<td valign="top" align="left"><span class="small">
      <textarea name="compName3" class="small" cols="28" id="compName3"  size="25" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.compName3,'cNChar3',100)" onkeyup="textCounter(document.priceApprovalMain.compName3,'cNChar3',100)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cNChar3" width="10%" class="small">100</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td valign="top" align="left"><span class="small">
      <textarea name="reason16" rows="2" class="small" maxlength="50" cols="28" onkeydown="textCounter(document.priceApprovalMain.reason16,'pncChar3',50)" onkeyup="textCounter(document.priceApprovalMain.reason16,'pncChar3',50)" ></textarea>
    </span>
    <div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="pncChar3" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td valign="top" align="left"><span class="small">
      <textarea name="fromDateAir3" class="small" id="fromDateAir3" cols="16" size="15" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.fromDateAir3,'rateChar3',15)" onkeyup="textCounter(document.priceApprovalMain.fromDateAir3,'rateChar3',15)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rateChar3" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td  align="left" valign="top">
	<span class="small">
      <textarea name="UOM3" class="small" id="UOM3"  rows="2" cols="16" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.UOM3,'UOM3Char',15)" onkeyup="textCounter(document.priceApprovalMain.UOM3,'UOM3Char',15)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="UOM3Char" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
	<td  align="left" valign="top" class="small"><textarea name="rem3" rows="2" cols="28" class="small" maxlength="200"  onkeydown="textCounter(document.priceApprovalMain.rem3,'rem3Char',200)" onkeyup="textCounter(document.priceApprovalMain.rem3,'rem3Char',200)"  ></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rem3Char" width="10%" class="small">200</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

  </tr>
<!-- </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="add" onclick="addRow1()" class="bold">
   <input type="button" value="  Remove Row   " name="add" onclick="delRow1()" class="bold"></td></tr>
   <input type="hidden" name="count1" value="3" />	
 --></table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">

  <tr>
   <!--  <td height="22" bgcolor="#ffffff" class="travelMenuBG">SUPPORTED BY</td> -->
  </tr>
</table>
<!-- <table width="100%" cellspacing="2" cellpadding="2">
  <tr >
    <td width="18%" bgcolor="#fbf9f9" class="small" >AUTHORITY</td>
    <td width="34%" height="29" bgcolor="#fbf9f9" class="small" >
	 <select name="sbd1" class="small" id="sbd1">
      <option value="0">Select</option>
	  <option value="28476">Sachin Mehta</option>
	  <option value="31321">Sudhir Kamath</option>
	  <option value="11934">Ashok Raparia</option>
	  <option value="27031">Puneet Suri</option>
	  <option value="5785">Sidhant Khosla</option>
	  <option value="3459">Mohit Jain</option>
	  <option value="2889">Sanjeev Vohra</option>
	  <option value="57">CR Srinivasan</option>
	  <option value="21929">Thiyagarajan Kumar</option>
	  <option value="11112">Sanjay Singh</option>
	  <option value="109">Sujoy Ghosh</option>
	  <option value="27760">Nandan Srinath</option>
	  <option value="2696">Ranjeet Kate</option>
	  <option value="323">Debashish Ghosh</option>
	  <option value="30898">Sanat Hazra</option>
	  <option value="32055">Shrenik Khasgiwala</option>
	  <option value="21184">Sanjeev Shah</option>
	  <option value="19513">Amit Rai</option>
	  <option value="112">Shashank Chavan</option>
	  <option value="20411">Shyam Shanker</option>
	  <option value="5459">Ashish Bhushan</option>
	  <option value="38849">Joy Chakraborthy</option>
	  <option value="38758">Sameer Sainani</option>
	  <option value="91">V S Sundaram</option>
      </select></td>
    <td width="14%" align="left" bgcolor="#fbf9f9" class="small">AUTHORITY</td>
    <td width="34%" align="left" bgcolor="#fbf9f9"><span class="small">
      <select name="sbd2" class="small" id="sbd2">
        <option value="0">Select</option>
	  <option value="28476">Sachin Mehta</option>
	  <option value="31321">Sudhir Kamath</option>
	  <option value="11934">Ashok Raparia</option>
	  <option value="27031">Puneet Suri</option>
	  <option value="5785">Sidhant Khosla</option>
	  <option value="3459">Mohit Jain</option>
	  <option value="2889">Sanjeev Vohra</option>
	  <option value="57">CR Srinivasan</option>
	  <option value="21929">Thiyagarajan Kumar</option>
	  <option value="11112">Sanjay Singh</option>
	  <option value="109">Sujoy Ghosh</option>
	  <option value="27760">Nandan Srinath</option>
	  <option value="2696">Ranjeet Kate</option>
	  <option value="323">Debashish Ghosh</option>
	  <option value="30898">Sanat Hazra</option>
	  <option value="32055">Shrenik Khasgiwala</option>
	  <option value="21184">Sanjeev Shah</option>
	  <option value="19513">Amit Rai</option>
	  <option value="112">Shashank Chavan</option>
	  <option value="20411">Shyam Shanker</option>
	  <option value="5459">Ashish Bhushan</option>
	  <option value="38849">Joy Chakraborthy</option>
	  <option value="38758">Sameer Sainani</option>
	  <option value="91">V S Sundaram</option>
      </select>
    </span></td>
  </tr>
</table>
 --><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="52%" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="2" cellspacing="2">
     
      <tr>
        <td height="22" bgcolor="#ffffff" class="travelMenuBG">APPROVALS</td>
        </tr>
    </table>
      <table  border = "0" width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="11%" >B&amp;C<span class="small"></span><span class="redsmall">&nbsp; (all are mandatory)</span></td>
          <td width="11%" height="29" >USER<span class="small"></span><span class="redsmall"><span class="small"></span>&nbsp;</span></td>
          <td width="11%" align="left" colspan="2">&nbsp;SUPPORTED BY<!-- <span class="redsmall"><span class="small"></span>&nbsp; (all are mandatory)</span> --></td>

          
          <td width="14%" align="left"><span class="small">Directer B&C</span></td>
          <td width="14%" align="left"><span class="small">EP Supply Chain</span></td>
          <td width="7%" align="left"><span class="small">COO</span></td>
          <td width="7%" align="left"><span class="small">CEO</span></td>
          <td width="15%" align="left"><span class="small">Managing Director </span></td>
        </tr>
		<tr>
		<td colspan="2">&nbsp;</td>
		<td class = "small" height = "15" >&nbsp;<b>Name</b>
		</td>
		<td class = "small" height = "15" >&nbsp;<b>Role</b>
		</td>
		
		</tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app1" id="app1" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app1H" id="app1H" type="hidden" value="" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			 <input  name = "app2H" id="app2H" type="hidden" value="" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app3" id="app3" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app3H" id="app3H" type="hidden" value="" />

			  

			  
		  </td>
		  <td class = "normal" height = "25"  align="left">Finance </td>
		  
          <td rowspan="3" align="left" valign="top" class="small"><span class="boldunderline_small">
            <select name="select12" class="small" id="select12">
        <option value="0">Select</option>
	  <option value="20411">Shyam Shanker</option>
	  </select>
			</span></td>
          <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
		<select name="select13" class="small" id="select13">
		<option value="0">Select</option>	
	  <option value="3459">Mohit Jain</option>
	  
	   </select> </span></td>
         
		<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select14" class="small" id="select14">
		<option value="0">Select</option>
      	  <option value="31891">Shrijeet Mishra</option>
      	  
		  <!-- <option value="28476">Sachin Mehta</option> -->
      </select></span></td>

	  <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select16" class="small" id="select16">
		<option value="0">Select</option>
      	  <option value="31891">Shrijeet Mishra</option>
		  <option value="28163">Shreedhar Godbole</option>
		  <!-- <option value="28476">Sachin Mehta</option> -->
      </select></span></td>

	  <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
	  <select name="select15" class="small" id="select15">
       <option value="0">Select</option>
      <option value="29616">Vineet Jain</option>
      <!-- <option value="28476">Sachin Mehta</option> -->
      </select></span>
	  </td>
        </tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app4H" id="app4H" type="hidden" value="" />
		 </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app5H" id="app5H" type="hidden" value="" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app6" id="app6" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app6H" id="app6H" type="hidden"  value="" />
		  </td>
		  <td class = "normal" height = "25" align="left"> MAS</td>

        </tr>
        <tr class="small">
          <td class = "normal" height = "25" align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app7H" id="app7H" type="hidden" value="" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app8H" id="app8H" type="hidden" value="" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app9" id="app9" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app9H" id="app9H" type="hidden" value="" />
		  </td>
		  <td class = "normal" height = "25" align="left"> HR/Personnel  </td>
        </tr>

		<tr class="small">
		  <td colspan="2" >&nbsp;</td>
          <td  class = "normal"  height = "25" align="left"><input type = "text" name = "app10" id="app10" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app10H" id="app10H" type="hidden" value="" />
		  </td>
		  <td class = "normal" height = "25" width="10%" align="left">Branch Head</td>
        </tr>

      </table>
      <table width="100%" border="0" cellspacing="4" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;</td>
          <td width="50%">&nbsp;</td>
        </tr>
        <tr>
          <td align="right" valign="middle"><input name="submitForm" onclick="validateForm(1);" type="button" class="bold" id="submitForm" value="Submit" /></td>
          <td><input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" /></td>
        </tr>
      </table>
      
<p>&nbsp;</p>
<table width="100%" cellpadding="0" cellspacing="0" >
</tbody>
</form>
</body>
</html>