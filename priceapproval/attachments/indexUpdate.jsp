<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="includes/sessionCheck.jsp"%>
<% //@ page errorPage="common/errorPage.jsp"%>
<%@ include file="includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
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
<script Language="JavaScript" src="jscripts/fieldCheck.js"></script>
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

var counter = 0;

function addRow()
{

  counter = document.priceApprovalMain.count.value;
  counter = parseInt(counter) + 1;
//alert("counter add : "+counter);
  document.priceApprovalMain.count.value = counter;

  tabBody = document.getElementById("inputtable");
  row	  = document.createElement("TR");

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='v"+counter+"'  class='small'  cols='28' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.v"+counter+",'vendorChar"+counter+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.v"+counter+",'vendorChar"+counter+"',50)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"vendorChar"+counter+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='i"+counter+"' id='i"+counter+"'class='small'  cols='17' maxlength='15' onkeydown=\"textCounter(document.priceApprovalMain.i"+counter+",'initChar"+counter+"',15)\" onkeyup=\"textCounter(document.priceApprovalMain.i"+counter+",'initChar"+counter+"',15);validateNumericData(this.id, this.value)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"initChar"+counter+"\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='f"+counter+"' id='f"+counter+"'class='small'  cols='17' maxlength='15' onkeydown=\"textCounter(document.priceApprovalMain.f"+counter+",'finChar"+counter+"',15)\" onkeyup=\"textCounter(document.priceApprovalMain.f"+counter+",'finChar"+counter+"',15);validateNumericData(this.id, this.value)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"finChar"+counter+"\" width=\"10%\" class=\"small\">15</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>  ";
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

	//alert(counter);
	//alert(document.priceApprovalMain.count.value);

if(counter > 2)
	{
//alert("counter delete : "+counter);

	document.getElementById("inputtable").deleteRow(counter);
	counter = counter - 1;
	document.priceApprovalMain.count.value = counter;
	}

}
</script>
</head>
<%
        String tOId			= (String)request.getParameter("tOId");

		String priceid		= (String)request.getParameter("priceid");

		ArrayList vStatus	=  new ArrayList();
	
		vStatus 			=	priceApprovalWebController.viewStatus(tOId,priceid);

		ArrayList vStatus1	=  new ArrayList();
	
		vStatus1 			=	priceApprovalWebController.viewApp2(tOId,priceid);

		ArrayList vStatus2	=  new ArrayList();
	
		vStatus2 			=	priceApprovalWebController.viewApproverDetails(priceid);

	
		String[] data1		= (String [])vStatus.get(0);

		String pageType		= request.getParameter("viewSAB"); 

		String[] data3      = (String [])vStatus2.get(0);

		  String SUPPORTEDBY_DIRECTOR1_STATUS = data3[0]; 
		  String SUPPORTEDBY_DIRECTOR2_STATUS = data3[1];  
		  String APPROVER11_STATUS = data3[2];            
		  String APPROVER12_STATUS = data3[3];           
		  String APPROVER13_STATUS = data3[4];            
		  String APPROVER21_STATUS = data3[5];            
		  String APPROVER22_STATUS = data3[6];            
		  String APPROVER23_STATUS = data3[7];             
		  String APPROVER31_STATUS = data3[8];            
		  String APPROVER32_STATUS = data3[9];            
		  String APPROVER33_STATUS = data3[10];            
		  String APPROVER4_STATUS  = data3[11];            
		  String APPROVER5_STATUS  = data3[12];            
		  String APPROVER6_STATUS  = data3[13];           
		  String SUPPORTEDBY_DIRECTOR1_DATE = data3[14];   
		  String SUPPORTEDBY_DIRECTOR2_DATE = data3[15];   
		  String APPROVER11_DATE = data3[16];              
		  String APPROVER12_DATE = data3[17];              
		  String APPROVER13_DATE = data3[18];              
		  String APPROVER21_DATE = data3[19];              
		  String APPROVER22_DATE = data3[20];              
		  String APPROVER23_DATE = data3[21];              
		  String APPROVER31_DATE = data3[22];              
		  String APPROVER32_DATE = data3[23];              
		  String APPROVER33_DATE = data3[24];              
		  String APPROVER4_DATE  = data3[25];              
		  String APPROVER5_DATE  = data3[26];              
		  String APPROVER6_DATE  = data3[27];
		  String APPROVER8_STATUS  = data3[32];
		  String APPROVER8_DATE  = data3[33];


		//String priceid1						= data1[0];
		String NEGOTIATION_PC_DATE			= data1[1];
		String NEGOTIATION_PC_MEETING_VENUE	= data1[2];
		String NEGOTIATION_VALUE			= data1[3];
		String FINALIZED_VENDOR_NAME		= data1[4];
		String PAYMENT_TERMS				= data1[5];
		String SAVINGS						= data1[6];
		String PRODUCT_SERVICE__NAME	    = data1[7];
		String INDENTED_USER				= data1[8];
		String PACKAGE_NAME_SANCTION		= data1[9];
		String TOTAL_BUDGET					= data1[10];
		String PO_COMMITTED_TILL_DATE		= data1[11];
		String BALANCE_BUDGET				= data1[12];
		String REQUIREMENT					= data1[13];
		String DESCRIPTION1					= data1[14];
		String DESCRIPTION2					= data1[15];
		String DESCRIPTION3					= data1[16];
		String ATTACHMENT1					= data1[17];
		String ATTACHMENT2					= data1[18];
		String ATTACHMENT3					= data1[19];
		String PRODUCT1						= data1[20];
		String PRODUCT2						= data1[21];
		String PRODUCT3						= data1[22];
		String RATE1						= data1[23];
		String RATE2						= data1[24];
		String RATE3						= data1[25];
		String BENCHMARK1					= data1[26];
		String BENCHMARK2					= data1[27];
		String BENCHMARK3					= data1[28];
		String RECOMMENEDATION				= data1[29];
		String SUPPORTEDBY_DIRECTOR1		= data1[30];
		String SUPPORTEDBY_DIRECTOR2		= data1[31];
		String APPROVER11					= data1[32];
		String APPROVER12					= data1[33];
		String APPROVER13					= data1[34];
		String APPROVER21					= data1[35];
		String APPROVER22					= data1[36];
		String APPROVER23					= data1[37];
		String APPROVER31					= data1[38];
		String APPROVER32					= data1[39];
		String APPROVER33					= data1[40];
		String APPROVER4					= data1[41];
		String APPROVER5					= data1[42];
		String APPROVER6					= data1[43];
		String SD1							= data1[44];
		String SD2							= data1[45];
		String AP11							= data1[46];
		String AP12							= data1[47];
		String AP13							= data1[48];
		String AP21							= data1[49];
		String AP22							= data1[50];
		String AP23							= data1[51];
		String AP31							= data1[52];
		String AP32							= data1[53];
		String AP33							= data1[54];
		String AP4							= data1[55];
		String AP5							= data1[56];
		String AP6							= data1[57];
       	String CREATEDBY					= data1[58];
		String CREATEDON					= data1[59];
		String MODIFIEDBY					= data1[60];	
		String MODIFIEDON					= data1[61];
		String STATUS						= data1[62];
		String COST_AVOIDANCE				= data1[63];
		String COMPANY_NAME1				= data1[64];
		String COMPANY_NAME2				= data1[65];
		String COMPANY_NAME3				= data1[66];
		String UMO1							= data1[67];
		String UMO2							= data1[68];
		String UMO3							= data1[69];
		String REMARKS1						= data1[70];
		String REMARKS2						= data1[71];
		String REMARKS3						= data1[72];
		String VALIDITY_PERIOD				= data1[73];
		String AP34							= data1[74];
		String AP35							= data1[85];
		String AP36							= data1[87];
		String AP7							= data1[75];
		String userEmailid				    = data1[76];
		String APPROVER34					= data1[77];
		String APPROVER35					= data1[86];
		String APPROVER36					= data1[88];
		String APPROVER7					= data1[78];
		String CATEGORY						= data1[79];
		String APPROVER8					= data1[80];
		String AP8							= data1[81];

		String SANCTIONEDREFTYPE			= data1[82];
		String REFNUMBER					= data1[83];
		String DATEOFAPPROVAL				= data1[84];

		if (userEmailid.indexOf("@") > -1) {
        userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
	    } 


%>
<body onload="showStatus();showSAB();<%if(timescapeUserOId==3799 || timescapeUserOId==791 || timescapeUserOId==28163 || timescapeUserOId==28090){%>showAllRequests();<%flg = 1;}%>">
<form name="priceApprovalMain" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="images/header_price1.jpg" width="842" height="44" /></td>
    <td width="23%" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="38"><img src="images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>
	<% if(STATUS.equals("D") && CREATEDBY.equals(tOId)) { %>
    <tr>
		<td colspan="3" height="25" align="right"><a href="common/submitRequest.jsp?priceid=<%=priceid%>" class="normal"><b>Submit Request</b></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<%}%>
</table>
<table width="100%" cellspacing="2" cellpadding="2" border="0">

<tr bgcolor="#fbf9f9"  class="travelMenuBG">
     <td colspan="4" >
	 
	 <table width="100%" border = "0"  cellspacing="1" cellpadding="1" >
	  <tr>

		<td  width="18%" align="left" class="travelMenuBG"  >SANCTIONED REF TYPE :</td>
		<td  width="17%" align="left" >
		<select id="sanctionedRefType" name="sanctionedRefType"  class="small">
			<option value="0">Select Ref Type</option>
			 <option value="Capex" <%if(SANCTIONEDREFTYPE.equals("Capex")){%>selected="selected"<%}%>>Capex1</option>
			 <option value="Purchase Request" <%if(SANCTIONEDREFTYPE.equals("Purchase Request")){%>selected="selected"<%}%>>Purchase Request</option>
		</select> 
		 <!-- <input name="sanctionedRefType" id ="sanctionedRefType" class="small" size="25" value="<%=SANCTIONEDREFTYPE%>" /> -->
		 </span>
		</td> 



		<td  width="15%" align="left"   class="travelMenuBG" >REF NUMBER :</td>
		<td  width="20%" align="left" class="travelMenuBG"  ><span class="small">
		 <input name="refNumber" id ="refNumber" class="small" size="30" value="<%=REFNUMBER%>" /></span></td>

		<td  width="15%" align="left"   class="travelMenuBG" >DATE OF APPROVAL :</td>
		<td  width="15%" align="left" class="travelMenuBG"  ><span class="small">
		 <input name="dateOfApproval" id= "dateOfApproval" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" value="<%=DATEOFAPPROVAL%>" />
		 </span>
		 </td>
	  </tr>
	</table>
	 
	 
	 </td>
	
  <tr>
  <tr bgcolor="#fbf9f9"  class="travelMenuBG">
     <td colspan="2" align="right" ><span class="normal">CATEGORY&nbsp;:&nbsp;</span></td>
	 <td colspan="2"><span class="normal" ><%=CATEGORY%></span></td>
	 <input type="hidden" id="category" name="category" value="<%=CATEGORY%>">

  <tr>
    <td height="26" colspan="2" bgcolor="#fbf9f9" class="travelMenuBG">PC MEETING DETAILS</td>
    <td colspan="2" align="left" bgcolor="#fbf9f9" class="travelMenuBG">PRICE DETAILS</td>
  </tr>
  <tr>
    <td width="18%" height="27" bgcolor="#fbf9f9"><span class="small" id="top">Negotiation/PC meeting date:</span></td>
    <td width="26%" align="left"><span class="small">
      <input name="requestedBy" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" value="<%=NEGOTIATION_PC_DATE%>" />
    </span><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Description:</span></td>
    <td width="35%" align="left"><span class="small">
     <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <textarea name="requestedBy2" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy2,'requestedBy2Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy2,'requestedBy2Description',100)" ><%=PRODUCT_SERVICE__NAME%></textarea>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
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
	  <td width="45%"><textarea name="reason4" rows="2" class="small" onkeydown="textCounter(document.priceApprovalMain.reason4,'lineCountDescription',50)" onkeyup="textCounter(document.priceApprovalMain.reason4,'lineCountDescription',50)"><%=NEGOTIATION_PC_MEETING_VENUE%></textarea></td>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
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
	  <input name="requestedBy3" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy3,'requestedBy3Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy3,'requestedBy3Description',100)" value="<%=INDENTED_USER%>"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
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
	  <input name="requestedBy7" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy7,'requestedBy7Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy7,'requestedBy7Description',100);negValCheck()" value="<%=NEGOTIATION_VALUE%>"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy7Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    <td width="21%" valign="middle" rowspan="2" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Project:</span></td>
    <td width="35%" valign="middle" rowspan="2"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%" >
	  <input name="requestedBy4" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy4,'requestedBy4Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy4,'requestedBy4Description',100)" value="<%=PACKAGE_NAME_SANCTION%>" />
	  <td width="3%"></td>
	  <td id="requestedBy4Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>

  <tr>
    <td bgcolor="#fbf9f9"><p class="small">Valididty Period :</p></td>
    <td width="26%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="validity" class="small" maxlength="20" valign="middle" onkeydown="textCounter(document.priceApprovalMain.validity,'validityDescription',20)" onkeyup="textCounter(document.priceApprovalMain.validity,'validityDescription',20)"  value="<%=VALIDITY_PERIOD%>"/>
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
	  <input name="requestedBy8" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy8,'requestedBy8Description',50)" onkeyup="textCounter(document.priceApprovalMain.requestedBy8,'requestedBy8Description',50)" value="<%=FINALIZED_VENDOR_NAME%>" />
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
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
	  <input name="requestedBy5" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy5,'requestedBy5Description',20)" onkeyup="textCounter(document.priceApprovalMain.requestedBy5,'requestedBy5Description',20);autoFillBalanceBudget()" value="<%=TOTAL_BUDGET%>"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy5Description" align="left" width="8%">20</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Payment Terms:</span></td>
    <td width="26%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <textarea name="reason" rows="2" class="small" onkeydown="textCounter(document.priceApprovalMain.reason,'reasonDescription',150)" onkeyup="textCounter(document.priceApprovalMain.reason,'reasonDescription',150)"><%=PAYMENT_TERMS%></textarea>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
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
	  <input name="fqtNumber" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.fqtNumber,'fqtNumberDescription',20)" onkeyup="textCounter(document.priceApprovalMain.fqtNumber,'fqtNumberDescription',20);autoFillBalanceBudget()"value="<%=PO_COMMITTED_TILL_DATE%>"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="fqtNumberDescription" align="left" width="8%">20</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
      </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Savings (Rs.):</span></td>
    <td width="26%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy9" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy9,'requestedBy9Description',20)" onkeyup="textCounter(document.priceApprovalMain.requestedBy9,'requestedBy9Description',20)" value="<%=SAVINGS%>"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy9Description" align="left" width="8%">20</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    <td width="21%" height="26" rowspan="2" align="left" valign="middle" bgcolor="#fbf9f9" class="small">Balance Budget(Rs.)</td>
    <td valign="middle" width="35%" rowspan="2" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy6" class="small" maxlength="100" readonly="readonly" value="<%=BALANCE_BUDGET%>" />
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
	  <input name="requestedBy10" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy10,'requestedBy10Description',20)" onkeyup="textCounter(document.priceApprovalMain.requestedBy10,'requestedBy10Description',20)" value="<%=COST_AVOIDANCE%>"/>
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
  <td colspan="3" rowspan="4" align="left" valign="top"><textarea name="req" id="req" cols="25" rows="7" maxlength="2000" onkeydown="textCounter(document.priceApprovalMain.req,'reqChar',2000)" onkeyup="textCounter(document.priceApprovalMain.req,'reqChar',2000)" style ="height:130px;width:99%" ><%=REQUIREMENT%></textarea>
		<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="reqChar" width="3%" class="small">2000</td><td class="small">Chars Left</td></tr></table></div>
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
<%
    if(vStatus1.size()>=1)
	{
		String[] data2 = (String [])vStatus1.get(0);
%>
  <tr>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="v1" cols="25"  rows="2" class="small"><%=data2[2]%></textarea>    
    </span></td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="i1" id="i1"cols="15"  rows="2" class="small"  size="30" maxlength="20" onkeyup="validateNumericData(this.id, this.value)"><%=data2[3]%></textarea>    
    </span></td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="f1"  id="f1" rows="2" cols="15" class="small" size="20" maxlength="30" onkeyup="validateNumericData(this.id, this.value)"><%=data2[4]%></textarea>       
    </span></td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="d1" rows="2" class="small" maxlength="30"><%=data2[5]%></textarea>
    </span></td>
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="pt1" rows="2" class="small" cols="25" maxlength="120"><%=data2[11]%></textarea>
    </span>
	</td>
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="va1" rows="2" class="small" maxlength="255" cols="25"><%=data2[12]%></textarea>
    </span>
	</td>

 </tr>
 <%
    }
    //out.println("size:"+vStatus1.size());
    for(int i=1;i<vStatus1.size();i++)
	{
		String[] data2 = (String [])vStatus1.get(i);
 %>
  <tr>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="v<%=i+1%>" cols="25"  rows="2"  maxlength="50" class="small" ><%=data2[2]%></textarea> 
    </span></td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="i<%=i+1%>" id="i<%=i+1%>"cols="15"  rows="2" class="small"  size="30" maxlength="20" value="" onkeyup="validateNumericData(this.id, this.value)"><%=data2[3]%></textarea>    
    </span></td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="f<%=i+1%>" id="f<%=i+1%>"  rows="2" cols="15" class="small" size="20" value="<%=data2[4]%>" onkeyup="validateNumericData(this.id, this.value)"><%=data2[4]%></textarea>    
    </span></td>
    
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="d<%=i+1%>" rows="2" class="small" maxlength="30"><%=data2[5]%></textarea>
    </span></td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="pt<%=i+1%>" rows="2" class="small" cols="25" ><%=data2[11]%></textarea>
    </span>
	</td>
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="va<%=i+1%>" rows="2" class="small" maxlength="255" cols="25"><%=data2[12]%></textarea>
    </span>
	</td>

    
  </tr>
<%
   }
%>
   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="Add Textbox" name="add" onclick="addRow()" class="bold">
   <input type="button" value="Remove Textbox" name="add" onclick="delRow()" class="bold"></td></tr>
   <input type="hidden" name="count" id ="count" value="<%=vStatus1.size()%>" />	
 </table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">
<tr>
    <td height="55" bgcolor="#ffffff" class="travelMenuBG">RECOMMENDATION</td>
	<td height="45" colspan="2" align="left" valign="middle" class="travelMenuBG">ATTACHMENTS</td> 
  </tr>
<tr>
<td width="55%" rowspan="4" align="left" valign="top"><textarea name="recommendation" id="recommendation" maxlength="3000" cols="55" rows="12" onkeydown="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" onkeyup="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" style ="height:170px;width:96%" ><%=RECOMMENEDATION%></textarea><div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="recommendationChar" width="3%" class="small">3000</td><td class="small">Chars Left</td></tr></table></div></td>
<td width="22%" height="25" align="left" valign="top" class="greyBG">DESCRIPTION</td>
 <td width="22%" height="25" align="left" valign="top" class="greyBG">ATTACH</td>
</tr>
 <%
        String tempName = "";
		if(!(ATTACHMENT1.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT1.substring(0, ATTACHMENT1.lastIndexOf("."));
				 String  st2 = ATTACHMENT1.substring(ATTACHMENT1.lastIndexOf(".")+1,ATTACHMENT1.length());
                 String  st3 = st1.substring(0, ATTACHMENT1.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
 %>
 <tr>
    <td  height="25" align="left" valign="top"><span class="small">
	 <select name="reason1" id="reason1" class="small">
	
	 <% if(DESCRIPTION1.equals("NA")){%>
        <option value="NA">Select Description</option>
      <%} else { %>
       <option value="<%=DESCRIPTION1%>" ><%=DESCRIPTION1%></option>
	   <% } %>

        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
     <!--  <textarea name="reason1" rows="2" class="small" maxlength="50"><%=DESCRIPTION1%></textarea> -->
    </span></td>

    <td  height="25" align="left" valign="top"><textarea name="attach1" type="text" class="small" id="attach1" readonly="readonly"><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach1')"><img src="images/attachment.gif" border="0" /></a><input name="attach1New" type="hidden" id="attach1New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT1:""%>" /></td>
</tr>
	<%
        tempName = "";
		if(!(ATTACHMENT2.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT2.substring(0, ATTACHMENT2.lastIndexOf("."));
				 String  st2 = ATTACHMENT2.substring(ATTACHMENT2.lastIndexOf(".")+1,ATTACHMENT2.length());
                 String  st3 = st1.substring(0, ATTACHMENT2.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
  %>
  <tr>
    <td height="25" valign="top" align="left"><span class="small">
	 <select name="reason2" id="reason2" class="small">
	 
	  <% if(DESCRIPTION2.equals("NA")){%>
        <option value="NA">Select Description</option>
      <%} else { %>
       <option value="<%=DESCRIPTION2%>" ><%=DESCRIPTION2%></option>
	   <% } %>
	      
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
    <!--   <textarea name="reason2" rows="2" class="small" maxlength="50"><%=DESCRIPTION2%></textarea> -->
    </span></td>
    <td height="25" valign="top" align="left"><textarea name="attach2" type="text" class="small" id="attach2"  readonly="readonly" value="" ><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach2')"><img src="images/attachment.gif" border="0" /></a><input name="attach2New" type="hidden" id="attach2New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT2:""%>" /></td>
	</tr>

    <%
            tempName = "";
			if(!(ATTACHMENT3.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT3.substring(0, ATTACHMENT3.lastIndexOf("."));
				 String  st2 = ATTACHMENT3.substring(ATTACHMENT3.lastIndexOf(".")+1,ATTACHMENT3.length());
                 String  st3 = st1.substring(0, ATTACHMENT3.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
    %>
  <tr>
    <td height="36" valign="top" align="left"><span class="small">

	 <select name="reason3" id="reason3" class="small">

	  <% if(DESCRIPTION3.equals("NA")){%>
        <option value="NA">Select Description</option>
      <%} else { %>
       <option value="<%=DESCRIPTION3%>" ><%=DESCRIPTION3%></option>
	   <% } %>
       
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
     <!--  <textarea name="reason3" rows="2" class="small" maxlength="50"><%=DESCRIPTION3%></textarea> -->
    </span></td>
    <td height="36" valign="top" align="left"><textarea name="attach3" type="text" class="small" id="attach3" value="" readonly="readonly" ><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach3')"><img src="images/attachment.gif" border="0" /></a><input name="attach3New" type="hidden" id="attach3New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT3:""%>" /></td>
	</tr>

 </table>
<table width="100%" cellspacing="2" cellpadding="2">
  <tr>
   <!-- <td height="32" colspan="2" align="left" valign="middle" class="travelMenuBG">ATTACHMENTS</td> --> 
    <td colspan="5" align="left" valign="middle" class="travelMenuBG">BENCHMARKING</td>
    <!-- <td colspan="2" align="left" valign="middle" class="travelMenuBG">RECOMMENDATION</td> -->
  </tr>
  <tr>
   <!--  <td width="12%" height="25" align="left" valign="top" class="greyBG">DESCRIPTION</td>
    <td width="15%" height="25" align="left" valign="top" class="greyBG">ATTACH</td> -->

    <td width="20%" valign="left" valign="top" class="greyBG">VENDOR NAME</td>
    <td width="20%" valign="left" valign="top" class="greyBG">PRODUCT/SERVICE</td>
    <td width="20%" valign="left" valign="top" class="greyBG">RATE (Rs.)</td>
    <td width="20%" align="left" valign="top" class="greyBG">UOM</td>
    <td width="20%" valign="left" valign="top" class="greyBG">REMARKS</td>
    
    
  </tr>
 
  <tr>

    <td width="21%" align="left" valign="top" class="small"><textarea name="compName1" id="compName1" rows="2" class="small" maxlength="50"><%=COMPANY_NAME1%></textarea></td>
    <td  align="left" valign="top"><span class="small">
      <textarea name="reason14" class="small" id="reason14" size="20" maxlength="100"><%=PRODUCT1%></textarea>
    </span></td>
	<td  align="left" valign="top"><span class="small">
      <textarea name="fromDateAir1" class="small" id="fromDateAir1"  size="20" maxlength="100" ><%=RATE1%></textarea>
    </span></td>
    
	<td  align="left" valign="top"><span class="small">
      <textarea name="UOM1" class="small" id="UOM1" size="20" maxlength="100"><%=UMO1%></textarea>
    </span></td>
	<td  align="left" valign="top"><span class="small">
      <textarea name="rem1" class="small" id="rem1" size="20" maxlength="100"><%=REMARKS1%></textarea>
    </span></td>
  </tr>

  <tr>
   
    <td valign="top" align="left"><span class="small">
      <textarea name="compName2" class="small" id="compName2"  size="20" maxlength="100" value="" ><%=COMPANY_NAME2%></textarea>
    </span></td>
	<td valign="top" align="left"><span class="small">
      <textarea name="reason15" id="reason15" rows="2" class="small" maxlength="50"><%=PRODUCT2%></textarea>
    </span></td>
    <td valign="top" align="left"><span class="small">
      <textarea name="fromDateAir2" class="small" id="fromDateAir2"  size="20" maxlength="100" value="" ><%=RATE2%></textarea>
    </span></td>
   
	<td  align="left" valign="top"><span class="small">
      <textarea name="UOM2" class="small" id="UOM2" size="20" maxlength="100"><%=UMO2%></textarea>
    </span></td>
	<td  align="left" valign="top"><span class="small">
      <textarea name="rem2" class="small" id="rem2" size="20" maxlength="100"><%=REMARKS2%></textarea>
    </span></td>
  </tr>
   <!--  <%
            tempName = "";
			if(!(ATTACHMENT3.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT3.substring(0, ATTACHMENT3.lastIndexOf("."));
				 String  st2 = ATTACHMENT3.substring(ATTACHMENT3.lastIndexOf(".")+1,ATTACHMENT3.length());
                 String  st3 = st1.substring(0, ATTACHMENT3.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
    %> -->
  <tr>
    <!-- <td height="36" valign="top" align="left"><span class="small">
      <textarea name="reason3" rows="2" class="small" maxlength="50"><%=DESCRIPTION3%></textarea>
    </span></td>
    <td height="36" valign="top" align="left"><textarea name="attach3" type="text" class="small" id="attach3" value="" readonly="readonly" ><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach3')"><img src="images/attachment.gif" border="0" /></a><input name="attach3New" type="hidden" id="attach3New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT3:""%>" /></td> -->
   	<td valign="top" align="left"><span class="small">
      <textarea name="compName3" class="small" id="compName3" size="20" maxlength="100"><%=COMPANY_NAME3%></textarea>
    </span></td>
	<td valign="top" align="left"><span class="small">
      <textarea name="reason16" rows="2" class="small" maxlength="50"><%=PRODUCT3%></textarea>
    </span></td>
    <td valign="top" align="left"><span class="small">
      <textarea name="fromDateAir3" class="small" id="fromDateAir3" size="20" maxlength="100" ><%=RATE3%></textarea>
    </span></td>
   	<td  align="left" valign="top"><span class="small">
      <textarea name="UOM3" class="small" id="UOM3" size="20" maxlength="100"><%=UMO3%></textarea>
    </span></td>
	<td  align="left" valign="top"><span class="small">
      <textarea name="rem3" class="small" id="rem3" size="20" maxlength="100"><%=REMARKS3%></textarea>
    </span></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">

 <!--  <tr>
    <td height="22" bgcolor="#ffffff" class="travelMenuBG">SUPPORTED BY</td>
  </tr>
</table>
<table width="100%" cellspacing="2" cellpadding="2">
  <tr >
    <td width="18%" bgcolor="#fbf9f9" class="small" >AUTHORITY</td>
    <td width="34%" height="29" bgcolor="#fbf9f9" class="small" >
	 <select name="sbd1" class="small" id="sbd1">
      <option value="0">Select</option>
	  <option value="31321" <%if(SD1.equals("31321")){%>selected="selected"<%}%>>Sudhir Kamath</option>
	  <option value="11934" <%if(SD1.equals("11934")){%>selected="selected"<%}%>>Ashok Raparia</option>
	  <option value="27031" <%if(SD1.equals("27031")){%>selected="selected"<%}%>>Puneet Suri</option>
	  <option value="5785" <%if(SD1.equals("5785")){%>selected="selected"<%}%>>Sidhant Khosla</option>
	  <option value="3459" <%if(SD1.equals("3459")){%>selected="selected"<%}%>>Mohit Jain</option>
	  <option value="2889" <%if(SD1.equals("2889")){%>selected="selected"<%}%>>Sanjeev Vohra</option>
	  <option value="57" <%if(SD1.equals("57")){%>selected="selected"<%}%>>CR Srinivasan</option>
	  <option value="21929" <%if(SD1.equals("21929")){%>selected="selected"<%}%>>Thiyagarajan Kumar</option>
	  <option value="11112" <%if(SD1.equals("11112")){%>selected="selected"<%}%>>Sanjay Singh</option>
	  <option value="109" <%if(SD1.equals("109")){%>selected="selected"<%}%>>Sujoy Ghosh</option>
	  <option value="27760" <%if(SD1.equals("27760")){%>selected="selected"<%}%>>Nandan Srinath</option>
	  <option value="2696" <%if(SD1.equals("2696")){%>selected="selected"<%}%>>Ranjeet Kate</option>
	  <option value="323" <%if(SD1.equals("323")){%>selected="selected"<%}%>>Debashish Ghosh</option>
	  <option value="30898" <%if(SD1.equals("30898")){%>selected="selected"<%}%>>Sanat Hazra</option>
	  <option value="32055" <%if(SD1.equals("32055")){%>selected="selected"<%}%>>Shrenik Khasgiwala</option>
	  <option value="21184" <%if(SD1.equals("21184")){%>selected="selected"<%}%>>Sanjeev Shah</option>
	  <option value="19513" <%if(SD1.equals("19513")){%>selected="selected"<%}%>>Amit Rai</option>
	  <option value="112" <%if(SD1.equals("112")){%>selected="selected"<%}%>>Shashank Chavan</option>
	  <option value="20411" <%if(SD1.equals("20411")){%>selected="selected"<%}%>>Shyam Shanker</option>
	  <option value="5459" <%if(SD1.equals("5459")){%>selected="selected"<%}%>>Ashish Bhushan</option>
	  <option value="38849" <%if(SD1.equals("38849")){%>selected="selected"<%}%>>Joy Chakraborthy</option>
	  <option value="38758" <%if(SD1.equals("38758")){%>selected="selected"<%}%>>Sameer Sainani</option>
	  </select></td>
    <td width="14%" align="left" bgcolor="#fbf9f9" class="small">AUTHORITY</td>
    <td width="34%" align="left" bgcolor="#fbf9f9"><span class="small">
      <select name="sbd2" class="small" id="sbd2">
        <option value="0">Select</option>
	  <option value="31321" <%if(SD2.equals("31321")){%>selected="selected"<%}%>>Sudhir Kamath</option>
	  <option value="11934" <%if(SD2.equals("11934")){%>selected="selected"<%}%>>Ashok Raparia</option>
	  <option value="27031" <%if(SD2.equals("27031")){%>selected="selected"<%}%>>Puneet Suri</option>
	  <option value="5785" <%if(SD2.equals("5785")){%>selected="selected"<%}%>>Sidhant Khosla</option>
	  <option value="3459" <%if(SD2.equals("3459")){%>selected="selected"<%}%>>Mohit Jain</option>
	  <option value="2889" <%if(SD2.equals("2889")){%>selected="selected"<%}%>>Sanjeev Vohra</option>
	  <option value="57" <%if(SD2.equals("57")){%>selected="selected"<%}%>>CR Srinivasan</option>
	  <option value="21929" <%if(SD2.equals("21929")){%>selected="selected"<%}%>>Thiyagarajan Kumar</option>
	  <option value="11112" <%if(SD2.equals("11112")){%>selected="selected"<%}%>>Sanjay Singh</option>
	  <option value="109" <%if(SD2.equals("109")){%>selected="selected"<%}%>>Sujoy Ghosh</option>
	  <option value="27760" <%if(SD2.equals("27760")){%>selected="selected"<%}%>>Nandan Srinath</option>
	  <option value="2696" <%if(SD2.equals("2696")){%>selected="selected"<%}%>>Ranjeet Kate</option>
	  <option value="323" <%if(SD2.equals("323")){%>selected="selected"<%}%>>Debashish Ghosh</option>
	  <option value="30898" <%if(SD2.equals("30898")){%>selected="selected"<%}%>>Sanat Hazra</option>
	  <option value="32055" <%if(SD2.equals("32055")){%>selected="selected"<%}%>>Shrenik Khasgiwala</option>
	  <option value="21184" <%if(SD2.equals("21184")){%>selected="selected"<%}%>>Sanjeev Shah</option>
	  <option value="19513" <%if(SD2.equals("19513")){%>selected="selected"<%}%>>Amit Rai</option>
	  <option value="112" <%if(SD2.equals("112")){%>selected="selected"<%}%>>Shashank Chavan</option>
	  <option value="20411" <%if(SD2.equals("20411")){%>selected="selected"<%}%>>Shyam Shanker</option>
	  <option value="20411" <%if(SD2.equals("5459")){%>selected="selected"<%}%>>Ashish Bhushan</option>
	  <option value="38849" <%if(SD2.equals("38849")){%>selected="selected"<%}%>>Joy Chakraborthy</option>
	  <option value="38758" <%if(SD2.equals("38758")){%>selected="selected"<%}%>>Sameer Sainani</option>
       </select>
    </span></td>
  </tr> -->
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="52%" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="2" cellspacing="2">
     
      <tr>
        <td height="22" bgcolor="#ffffff" class="travelMenuBG">APPROVALS</td>
        </tr>
    </table>
      <table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="17%" >B&amp;C-<span class="small"> LEVEL 1</span><span class="redsmall"> (min 1)</span></td>
          <td width="17%" height="29" >USER/PRICE TEAM<span class="small">-LEVEL </span><span class="redsmall"><span class="small">1</span><!-- (min 1) --></span></td>
          <td width="21%" align="left" colspan='2'>SUPPORTED BY <span class="redsmall"><span class="small">LEVEL 1</span> (min 1)</span></td>
           <td width="14%" align="left"><span class="small">Director B&C</span><br><span class="redsmall">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span></td>
          <td width="14%" align="left"><span class="small">EP Supply Chain</span></td>
          <td width="7%" align="left"><span class="small">COO</span></td>
          <td width="7%" align="left"><span class="small">CEO</span></td>
          <td width="15%" align="left"><span class="small">Managing Director </span></td>
        </tr>
		<td colspan="2">&nbsp;</td>
		<td class = "small" height = "15" >&nbsp;<b>Name</b>
		</td>
		<td class = "small" height = "15" >&nbsp;<b>Role</b>
		</td>	
        <tr class="small">
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app1" id="app1" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER11==null?"":APPROVER11%>">
			  <input  name = "app1H" id="app1H" type="hidden" value="<%=AP11==null?"":AP11%>" />
		  </td>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER12==null?"":APPROVER12%>">
			 <input  name = "app2H" id="app2H" type="hidden" value="<%=AP12==null?"":AP12%>" />
		  </td>
          <!-- <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app3" id="app3" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER13==null?"":APPROVER13%>" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
			  <input  name = "app3H" id="app3H" type="hidden" value="<%=AP13==null?"":AP13%>" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%> />
		  </td> -->
		

			<td class = "normal" height = "25" width="12%" align="left">
		<select name = "app3" id="app3" class = "normal" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
			<option value="0">Select</option>
			<option value="27598" <%if(AP13.equals("27598")){%>selected="selected"<%}%>>Kuldeep G Mantry</option>
            <option value="26413" <%if(AP13.equals("26413")){%>selected="selected"<%}%>>Prashant Baliga</option>
            <option value="21929" <%if(AP13.equals("21929")){%>selected="selected"<%}%>>Thiyagarajan Kumar</option>
            <option value="18732" <%if(AP13.equals("18732")){%>selected="selected"<%}%>>Sandeep Bhogra</option>
            <option value="18773" <%if(AP13.equals("18773")){%>selected="selected"<%}%>>Ajay Gupta</option>
            <option value="11855" <%if(AP13.equals("11855")){%>selected="selected"<%}%>>Ritu Gupta</option>
            <option value="9395" <%if(AP13.equals("9395")){%>selected="selected"<%}%>>Aman Gupta</option>
            <option value="9360" <%if(AP13.equals("9360")){%>selected="selected"<%}%>>Hari Krishnan M</option>
            <option value="9650" <%if(AP13.equals("9650")){%>selected="selected"<%}%>>Manoj Soni</option>
            <option value="871" <%if(AP13.equals("871")){%>selected="selected"<%}%>>S Roy Chowdhary</option>
            <option value="795" <%if(AP13.equals("795")){%>selected="selected"<%}%>>Sanjaykumar Rakwal</option>
            <option value="37973" <%if(AP13.equals("37973")){%>selected="selected"<%}%>>Rajesh Bhagat</option>
            <option value="38910" <%if(AP13.equals("38910")){%>selected="selected"<%}%>>Pankaj Kumar Kedia</option>
            <option value="38925" <%if(AP13.equals("38925")){%>selected="selected"<%}%>>Bharat Rathi</option>
            <option value="41761" <%if(AP13.equals("41761")){%>selected="selected"<%}%>>Vishal Hoval</option>
            <option value="44738" <%if(AP13.equals("44738")){%>selected="selected"<%}%>>Sharad Bhararia</option>
            <option value="45910" <%if(AP13.equals("45910")){%>selected="selected"<%}%>>Chetan Saboo</option>
            <option value="43560" <%if(AP13.equals("43560")){%>selected="selected"<%}%>>Swagata Dasgupta</option>
            <option value="48330" <%if(AP13.equals("48330")){%>selected="selected"<%}%>>Saurabh Jain</option>
            <option value="46178" <%if(AP13.equals("46178")){%>selected="selected"<%}%>>Manish Kumar Chaurasia</option>
		</select>
		
		</td> 
		
		   <td class = "normal" height = "25" width="10%" align="left">MAS 1 </td>
          <td rowspan="3" align="left" valign="top" class="small"><span class="boldunderline_small">
            <select name="select12" class="small" id="select12" >
        <option value="0">Select</option>
	    <option value="20411" <%if(AP4.equals("20411")){%>selected="selected"<%}%>>Shyam Shanker</option>
	  </select>
			</span></td>
          <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">

<select name="select13" class="small" id="select13">
		<option value="0">Select</option>	
	  <option value="3459" <%if(AP5.equals("3459")){%>selected="selected"<%}%>>Mohit Jain</option>
	  
      </select>         </span></td>


         <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select14" class="small" id="select14" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
		<option value="0">Select</option>
         <option value="31891" <%if(AP6.equals("31891")){%>selected="selected"<%}%>>Shrijeet Mishra</option>
	  </select>         </span></td>

		<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select15" class="small" id="select15" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
		<option value="0">Select</option>
         <option value="48795" <%if(AP7.equals("48795")){%>selected="selected"<%}%>>Raj Jain</option>
		</select> </span></td>



	    <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select16" class="small" id="select16" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
		<option value="0">Select</option>
     <!--  <option value="3459" <%if(AP6.equals("3459")){%>selected="selected"<%}%>>Mohit Jain</option>
      <option value="20411" <%if(AP6.equals("20411")){%>selected="selected"<%}%>>Shyam Shanker</option> -->
	   <option value="29616" <%if(AP8.equals("29616")){%>selected="selected"<%}%>>Vineet Jain</option>
        </select>         </span></td>
        </tr>
        <tr class="small">
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER21==null?"":APPROVER21%>">
			  <input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
		 </td>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER22==null?"":APPROVER22%>">
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />
		 <!--  </td> -->
          <!-- <td class = "normal" height = "25" width="12%" align="left"> --><!-- <input type = "text" name = "app6" id="app6" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER23==null?"":APPROVER23%>" --> <!-- <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>//disabled<%}%>> -->
			  <!-- <input  name = "app6H" id="app6H" type="hidden"  value="<%=AP23==null?"":AP23%>" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%> /> -->
		  <!-- </td> -->
		<td class = "normal" height = "25" width="12%" align="left">
		<select name = "app6" id="app6" class = "normal" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
			<option value="0"> Select</option>
            <option value="27598" <%if(AP23.equals("27598")){%>selected="selected"<%}%>>Kuldeep G Mantry</option>
            <option value="11855" <%if(AP23.equals("11855")){%>selected="selected"<%}%>>Ritu Gupta</option>
            <option value="21929" <%if(AP23.equals("21929")){%>selected="selected"<%}%>>Thiyagarajan Kumar</option>
		</select>
		</td> 
		  <td class = "normal" height = "25" width="10%" align="left">MAS 2 </td>
        </tr>
        <tr class="small">
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER31==null?"":APPROVER31%>">
			  <input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
		  </td>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER32==null?"":APPROVER32%>">
			  <input  name = "app8H" id="app8H" type="hidden" value="<%=AP32==null?"":AP32%>" />
		  </td>
         <!--  <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app9" id="app9" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER33==null?"":APPROVER33%>" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
			  <input  name = "app9H" id="app9H" type="hidden" value="<%=AP33==null?"":AP33%>" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%> />-->
			  <input name="priceid" id="priceid" type="hidden" value="<%=priceid%>" /> 
			<td class = "normal" height = "25" width="12%" align="left">
		<select name = "app9" id="app9" class = "normal" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
			<option value="0">Select</option>
				<option value="18222"<%if(AP33.equals("18222")){%>selected="selected"<%}%>>Devasish Mukherjee</option>
				<option value="1633"<%if(AP33.equals("1633")){%>selected="selected"<%}%>>Rajiv Tiwari</option>
				<option value="19469"<%if(AP33.equals("19469")){%>selected="selected"<%}%>>Sudipto Basu</option>
				<option value="18320"<%if(AP33.equals("18320")){%>selected="selected"<%}%>>Srinivasa Rao Korada</option>
				<option value="2080"<%if(AP33.equals("2080")){%>selected="selected"<%}%>>V Neelakantan</option>
				<option value="1201"<%if(AP33.equals("1201")){%>selected="selected"<%}%>>Rajendrasingh Thakur</option>
				<option value="1168"<%if(AP33.equals("1168")){%>selected="selected"<%}%>>Sanjeev P</option>
				<option value="17397"<%if(AP33.equals("17397")){%>selected="selected"<%}%>>Anupam Kumar</option>
				<option value="7300"<%if(AP33.equals("7300")){%>selected="selected"<%}%>>G Kesoraam</option>
				<option value="836"<%if(AP33.equals("836")){%>selected="selected"<%}%>>K Sudhir</option>
				<option value="27611"<%if(AP33.equals("27611")){%>selected="selected"<%}%>>Deepak Kumar</option>
		</select>
		  </td>
			  <td class = "normal" height = "25" width="10%" align="left">Finance 1 </td>
		 
        </tr>
		<tr class="small">
		  <td colspan="2" >&nbsp;</td>
          <!-- <td  class = "normal"  height = "25" width="12%" align="left"><input type = "text" name = "app10" id="app10" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER34==null?"":APPROVER34%>" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%> >
			  <input  name = "app10H" id="app10H" type="hidden" value="<%=AP34==null?"":AP34%>" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%> />
		  </td> -->
		  <td class = "normal" height = "25" width="12%" align="left">
		<select name = "app10" id="app10" class = "normal" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
			<option value="0"> Select</option>
			<option value="735"<%if(AP34.equals("735")){%>selected="selected"<%}%>>S Ramaswamy</option>
		</select>
		  </td>
		  <td class = "normal" height = "25" width="10%" align="left">Finance 2</td>
        </tr>
		<tr>
		 <td></td>
		 <td></td>
		  <td  class = "normal"  height = "25" align="left" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
		 <input type = "text" name = "app11" id="app11"  class = "normal" size="20" onClick="addUser('approvedby',this.id)"   value="<%=APPROVER35==null?"":APPROVER35%>" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>  >
		<input  name = "app11H" id="app11H" type="hidden" value="<%=AP35==null?"":AP35 %> " /></td>
		 <td class = "normal" height = "25" align="left">HR/Personnel</td>
		
        </tr>
		<tr>
		 <td></td>
		 <td></td>
		  <td  class = "normal"  height = "25" align="left" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
		 <input type = "text" name = "app12" id="app12"  class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER36==null?"":APPROVER36%>" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
		<input  name = "app12H" id="app12H" type="hidden" value="<%=AP36==null?"":AP36%>"  /></td>
		 <td class = "normal" height = "25" align="left">Branch Head</td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="4" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;</td>
          <td width="50%">&nbsp;</td>
        </tr>
        <tr>
          <td align="right" valign="middle"><input name="submitForm" onclick="validateForm(2);" type="button" class="bold" id="submitForm" value="Submit" /></td>
          <td><input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" /></td>
        </tr>
      </table>
      
	</td>
  </tr>

<p>&nbsp;</p>
<table width="100%" cellpadding="0" cellspacing="0" >
</tbody>
</form>
</body>
</html>