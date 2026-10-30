<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="includes/sessionCheck.jsp"%>
<%@ page errorPage="common/errorPage.jsp"%>
<%@ include file="includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<% int flg = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" >

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL</title>
<link href="style/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="jscripts/util.js"></script>
<script Language="JavaScript" src="jscripts/common.js"></script>
<script Language="JavaScript" src="jscripts/search.js"></script>
<script type="text/javascript" src="jscripts/jquery.js"></script>
<script Language="JavaScript" src="jscripts/fieldCheck.js"></script>
<script Language="JavaScript" src="jscripts/reports.js"></script>

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
  cell1.innerHTML = "<textarea type='textbox' name='i"+counter+"' id='i"+counter+"'class='small'  cols='10' maxlength='10' onkeydown=\"textCounter(document.priceApprovalMain.i"+counter+",'initChar"+counter+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.i"+counter+",'initChar"+counter+"',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.i"+counter+".value);\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"initChar"+counter+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='f"+counter+"' id='f"+counter+"'class='small'  cols='10' maxlength='10' onkeydown=\"textCounter(document.priceApprovalMain.f"+counter+",'finChar"+counter+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.f"+counter+",'finChar"+counter+"',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.f"+counter+".value);\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"finChar"+counter+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>  ";
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
      $('kkk').click(function() {
            $('.menu').css('display', 'none');
       });
 
})
</script>
</head>
<%   

        Hashtable companyData = new Hashtable();

		ArrayList companyList	=  new ArrayList();
	    String companyDataArry[]       = null;
        String lstComps  ="";
		companyList 			=	priceApprovalWebController.lstOfCompany(companyData);
          if(companyList.size()>0)
           {
            for(int kk= 0; kk<companyList.size(); kk++)
             {
				//out.println("companyList.size"+companyList.size());
                companyDataArry   = (String[])companyList.get(kk);
                lstComps += "<option value=\""+companyDataArry[0]+"\">"+companyDataArry[2]+"</option>";
            }
}


       
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

 <!-- <body onload="showStatus();showSAB();<%//if(timescapeUserOId==3799 || timescapeUserOId==791 || timescapeUserOId==28163 || timescapeUserOId==28090 || timescapeUserOId==36262 || timescapeUserOId==46701 || timescapeUserOId==41269 || timescapeUserOId==33866 || timescapeUserOId==26503){%>showAllRequests();<%//flg = 1;}%>"> -->
<body onload="showStatus();showSAB();<%if(checkAdmin){%>showAllRequests();<%flg = 1;}%>">

<!-- <div class="QTPopup" style="display:none">
	<div class="popupGrayBg" ></div>
	<div class="QTPopupCntnr"  >
		<div class="gpBdrLeft">
			<div class="gpBdrRight">
				 <a href="#" class="closeBtn" title="Close"></a>
				  <div style="width:auto;height:100px;" id="msg"></div>
			</div>
		</div>
	</div>
</div> -->


<form name="priceApprovalMain" method="post" action="">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="images/header_price1.jpg" width="842" height="44" /></td>
<%@ include file="includes/relatedlinks.jsp"%>

  </tr>
  <tr>
    <td height="38"><img src="images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">P U R C H A S E   &nbsp;&nbsp; A P P R O V A L</td>
        </tr>
        <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">Supported By / Approved By</td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG" align="right"><a href="javascript:showStatus();showSAB();showAllRequests();" style="text-decoration: none;">&nbsp;Refresh<img src="images/refresh.png" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /> --></td>
          </tr>
			<tr>
			<td height="10" class="normal" align="right"><a href="#" onclick="javascript:window.open('common/viewSABApprovedHistory.jsp','','resizable=yes,scrollbars=yes,height=400,width=1000')"><b>Approvers Status</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:window.open('common/viewStatus.jsp','','resizable=yes,scrollbars=yes,height=400,width=1000')"><b>Buyers Status</b></a>&nbsp;&nbsp;&nbsp;</td>

			</tr>
		  <tr>
		<td>
		<table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
            <td width="3%" height="29" >Sr. No</td>
            <td width="10%" align="left">INTENDED USER</td> 
            <td width="13%" align="left">PURCHASE APPROVAL ID</td>    
            <td width="15%" align="left">PROJECT - PACKAGE NAME</td>
            <td width="15%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="8%" align="left">STATUS</td>
            <td width="10%" align="left">ACTION</td>

        </tr>
		<tr><td id = "sab" width="100%" colspan="8" height="60"></td></tr>  
		 <tr>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
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
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /> --><a href = "#" onclick="javascript:reportWin('reports.jsp');">Dashboard</a></td>
          </tr>
				<tr><td height="10" colspan="5"></td></tr>
		  <tr>
		<td>
		<table width="100%" cellspacing="2" cellpadding="2" >
        <tr class="greyBG">
            <td width="3%" height="29" >Sr. No</td>
            <td width="13%" align="left">INTENDED USER</td> 
            <td width="18%" align="left">PURCHASE APPROVAL ID</td>    
            <td width="20%" align="left">PROJECT - PACKAGE NAME</td>
            <td width="16%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="10%" align="left">STATUS</td>
            <td  align="left">ACTION</td>

        </tr>
		<tr><td id = "allProcess" width="100%" colspan="8" height="60"></td></tr>
		 <tr>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" colspan="2" align="center" valign="top">&nbsp;</td>
        </tr> 
	</table>
<%}%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
</table>

<table width="100%" border = "0"  cellspacing="1" cellpadding="2" >
  <tr bgcolor="#fbf9f9"  class="travelMenuBG" height="30">
     <td  align="left" width="5%" class="travelMenuBG">COMPANY :</td>
	 <td  align="left" width="4%" class="travelMenuBG"><select class="small" id="company" name="company" >
            <option value="0">Select Company</option>
            <%=lstComps%>
         </select>
        </td>
     <td  align="left" width="13%" >SANCTIONED REFERENCE TYPE :</td>
	 <td  align="left" width="4%"><select class="small" id="sanctionedRefType" name="sanctionedRefType">
		<option value="0">Select Ref Type</option>
        <option value="Capex">Capex</option>
        <option value="Purchase request">Purchase Request</option>
        
       </select>
	</td>
	 <td  align="left" width="9%">REFERENCE NUMBER :</td>
	 <td  align="left"  width="4%"><input type = "text" name = "refNumber" id="refNumber" class = "normal" size="20"></td>
	 <td  align="left" width="9%">DATE OF APPROVAL :</td>
	 <td  align="left" width="4%"><span class="small">
      <input name="dateOfApproval" id="dateOfApproval" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" />
    </span></td>
	
	 <td  align="left" width="5%"><a href="javascript:void(0)" onclick="getDetails();"><img src="images/but_go.gif" border="0" /></a></td>	
	<tr>

</table>
<!-- <table width="100%" cellspacing="2" cellpadding="2" border="0">
 --><span id="showRequests"></span>
<!-- </table>
 -->      
<p>&nbsp;</p>
<table width="100%" cellpadding="0" cellspacing="0" >
</tbody>
</form>
</body>
</html>