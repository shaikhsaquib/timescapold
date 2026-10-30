<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="includes/sessionCheck.jsp"%>
<%//@ page errorPage="common/errorPage.jsp"%>
<%@ include file="includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 

<!DOCTYPE html>
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Purchase Approval for News Print</title>
    
  <head>  
<link href="bootstrap-3.3.2-dist/css/bootstrap.css" rel="stylesheet">
<link href="style/popup.css" rel="stylesheet" type="text/css" />
<link href="css/template.css" rel="stylesheet">
<link href="style/calendarControl.css" rel="stylesheet">
<link href="style/global.css" rel="stylesheet" type="text/css" />
 <script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>	
<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/bootstrap-maxlength.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
 <script src="js/jquery.placeholder.min.js"></script>
<script src="jscripts/calendarControl.js" language="javascript"></script>
<script Language="JavaScript" src="jscripts/util.js"></script>
<script Language="JavaScript" src="jscripts/common.js"></script>
<script Language="JavaScript" src="jscripts/search.js"></script>
<script Language="JavaScript" src="jscripts/osp.js"></script>
<!-- <script Language="JavaScript" src="jscripts/jquery.js"></script> -->

<script type="text/javascript">
$(document).ready(function(){
    $(".tip-right").tooltip({
        placement : 'right',
        container: 'body'
    });
    $('input#defaultconfig').maxlength();
$('textarea#textarea').maxlength();
$('input, textarea').placeholder();
});

</script>

<script type="text/javascript">
var counter = 1;
var counterCom = 1;
var counterEs = 1;
var counterIn = 1;
var rcounter=14;
function addRowTech()
{
  counter = parseInt(counter) + 1;

  document.priceApprovalMain.countTech.value = counter;

  tabBody = document.getElementById("inputtable");
  row	  = document.createElement("TR");

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='tvendor"+counter+"'  class='small'  cols='25' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.tvendor"+counter+",'tvendorChar"+counter+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.tvendor"+counter+",'tvendorChar"+counter+"',50)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"tvendorChar"+counter+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='tmachine"+counter+"' id='tmachine"+counter+"'class='small'  cols='25' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.tmachine"+counter+",'tmachineChar"+counter+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.tmachine"+counter+",'tmachineChar"+counter+"',50)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"tmachineChar"+counter+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='pagination"+counter+"' id='pagination"+counter+"'class='small'  cols='25' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.pagination"+counter+",'paginationChar"+counter+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.pagination"+counter+",'paginationChar"+counter+"',50)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"paginationChar"+counter+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>  ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name='ctp"+counter+"'  class='small' cols='25' maxlength='50'  onkeydown=\"textCounter(document.priceApprovalMain.ctp"+counter+",'ctpChar"+counter+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.ctp"+counter+",'ctpChar"+counter+"',50)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"ctpChar"+counter+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"speed"+counter+"\"  class=\"small\" maxlength=\"50\" cols='25'   onkeydown=\"textCounter(document.priceApprovalMain.speed"+counter+",'speedChar"+counter+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.speed"+counter+",'speedChar"+counter+"',50)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"speedChar"+counter+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);


  tabBody.appendChild(row);
}
function delRowTech()
{
	if(counter > 1)
	{
	document.getElementById("inputtable").deleteRow(counter);
	counter = counter - 1;
	document.priceApprovalMain.countTech.value = counter;
	}
}

//COMMERCIALS--

function addRowCom()
{

  counterCom = parseInt(counterCom) + 1;

  document.priceApprovalMain.countCom.value = counterCom;

  tabBody = document.getElementById("inputtable2");
  row	  = document.createElement("TR");

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='cvendor"+counterCom+"'  class='small'  cols='20' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.cvendor"+counterCom+",'cvendorChar"+counterCom+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.cvendor"+counterCom+",'cvendorChar"+counterCom+"',50)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"cvendorChar"+counterCom+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='colourPage"+counterCom+"' id='colourPage"+counterCom+"' class='small'  cols='20' maxlength='10' onkeydown=\"textCounter(document.priceApprovalMain.colourPage"+counterCom+",'colourPageChar"+counterCom+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.colourPage"+counterCom+",'colourPageChar"+counterCom+"',10);valCheck();\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"colourPageChar"+counterCom+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='bAndw"+counterCom+"' id='bAndw"+counterCom+"'class='small'  cols='20' maxlength='10' onkeydown=\"textCounter(document.priceApprovalMain.bAndw"+counterCom+",'bAndwChar"+counterCom+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.bAndw"+counterCom+",'bAndwChar"+counterCom+"',10);valCheck();\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"bAndwChar"+counterCom+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>  ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name='plateCost"+counterCom+"' rows='2' class='small' cols='20' maxlength='10'  onkeydown=\"textCounter(document.priceApprovalMain.plateCost"+counterCom+",'plateCostChar"+counterCom+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.plateCost"+counterCom+",'plateCostChar"+counterCom+"',10);valCheck();\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"plateCostChar"+counterCom+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);


    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"bundling"+counterCom+"\" rows=\"2\" class=\"small\" maxlength=\"50\" cols='20'   onkeydown=\"textCounter(document.priceApprovalMain.bundling"+counterCom+",'bundlingChar"+counterCom+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.bundling"+counterCom+",'bundlingChar"+counterCom+"',50)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"bundlingChar"+counterCom+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);



    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"insertion"+counterCom+"\" rows=\"2\" class=\"small\" maxlength=\"50\" cols='20'   onkeydown=\"textCounter(document.priceApprovalMain.insertion"+counterCom+",'insertionChar"+counterCom+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.insertion"+counterCom+",'insertionChar"+counterCom+"',50)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"insertionChar"+counterCom+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);

    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"otherMisc"+counterCom+"\" rows=\"2\" class=\"small\" maxlength=\"50\" cols='20'   onkeydown=\"textCounter(document.priceApprovalMain.otherMisc"+counterCom+",'otherMiscChar"+counterCom+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.otherMisc"+counterCom+",'otherMiscChar"+counterCom+"',50)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"otherMiscChar"+counterCom+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);

  tabBody.appendChild(row);
}
function delRowCom()
{
	if(counterCom > 1)
	{
	document.getElementById("inputtable2").deleteRow(counterCom);
	counterCom = counterCom - 1;
	document.priceApprovalMain.countCom.value = counterCom;
	}
}

//==== ESTIMATED SPEND & OTHER SPECS:==========
function addRowEs()
{
  counterEs = parseInt(counterEs) + 1;

  document.priceApprovalMain.countEs.value = counterEs;

  tabBody = document.getElementById("inputtable3");
  row	  = document.createElement("TR");

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='esVendor"+counterEs+"'  class='small'  cols='20' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.esVendor"+counterEs+",'esVendorChar"+counterEs+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.esVendor"+counterEs+",'esVendorChar"+counterEs+"',50)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"esVendorChar"+counterEs+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name='po"+counterEs+"' rows='2' class='small' cols='20' maxlength='10'  onkeydown=\"textCounter(document.priceApprovalMain.po"+counterEs+",'poChar"+counterEs+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.po"+counterEs+",'poChar"+counterEs+"',10);valCheck();\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"poChar"+counterEs+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='alp"+counterEs+"' id='alp"+counterEs+"'class='small'  cols='20' maxlength='10' onkeydown=\"textCounter(document.priceApprovalMain.alp"+counterEs+",'alpChar"+counterEs+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.alp"+counterEs+",'alpChar"+counterEs+"',10);valCheck();\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"alpChar"+counterEs+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

 /* cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='esBandW"+counterEs+"' id='m1"+counterEs+"'class='small'  cols='20' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.esBandW"+counterEs+",'esBandWChar"+counterEs+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.esBandW"+counterEs+",'esBandWChar"+counterEs+"',50)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"esBandWChar"+counterEs+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>  ";
  row.appendChild(cell1);
*/


    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"totalSpend"+counterEs+"\" rows=\"2\" class=\"small\" maxlength=\"10\" cols='20'   onkeydown=\"textCounter(document.priceApprovalMain.totalSpend"+counterEs+",'totalSpendChar"+counterEs+"',10)\" onkeyup=\"textCounter(document.priceApprovalMain.totalSpend"+counterEs+",'totalSpendChar"+counterEs+"',10);valCheck();\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"totalSpendChar"+counterEs+"\" width=\"10%\" class=\"small\">10</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);

    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"esPagination"+counterEs+"\" rows=\"2\" class=\"small\" maxlength=\"50\" cols='20'   onkeydown=\"textCounter(document.priceApprovalMain.esPagination"+counterEs+",'esPaginationChar"+counterEs+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.esPagination"+counterEs+",'esPaginationChar"+counterEs+"',50)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"esPaginationChar"+counterEs+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);

    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"lprs"+counterEs+"\" rows=\"2\" class=\"small\" maxlength=\"50\" cols='20'   onkeydown=\"textCounter(document.priceApprovalMain.lprs"+counterEs+",'lprsChar"+counterEs+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.lprs"+counterEs+",'lprsChar"+counterEs+"',50)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"lprsChar"+counterEs+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);

    cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name=\"waste"+counterEs+"\" rows=\"2\" class=\"small\" maxlength=\"50\" cols='25'   onkeydown=\"textCounter(document.priceApprovalMain.waste"+counterEs+",'wasteChar"+counterEs+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.waste"+counterEs+",'wasteChar"+counterEs+"',50)\"></textarea></span><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"wasteChar"+counterEs+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div></td>";
  row.appendChild(cell1);


  tabBody.appendChild(row);
}
function delRowEs()
{
	if(counterEs > 1)
	{
	document.getElementById("inputtable3").deleteRow(counterEs);
	counterEs = counterEs - 1;
	document.priceApprovalMain.countEs.value = counterEs;
	}
}// end

//-------------------------
function addRowIn()
{
  counterIn = parseInt(counterIn) + 1;

  document.priceApprovalMain.countIn.value = counterIn;

  tabBody = document.getElementById("inputtable4");
  row	  = document.createElement("TR");

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='inVendor"+counterIn+"'  class='small'  cols='25' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.inVendor"+counterIn+",'inVendorChar"+counterIn+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.inVendor"+counterIn+",'inVendorChar"+counterIn+"',50)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"inVendorChar"+counterIn+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='inPo"+counterIn+"' id='inPo"+counterIn+"' class='small'  cols='25' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.inPo"+counterIn+",'inPoChar"+counterIn+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.inPo"+counterIn+",'inPoChar"+counterIn+"',50)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"inPoChar"+counterIn+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='inTotalSpend"+counterIn+"' id='inTotalSpend"+counterIn+"'class='small'  cols='25' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.inTotalSpend"+counterIn+",'inTotalSpendChar"+counterIn+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.inTotalSpend"+counterIn+",'inTotalSpendChar"+counterIn+"',50)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"inTotalSpendChar"+counterIn+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>  ";
  row.appendChild(cell1);

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea name='inMisc"+counterIn+"' rows='2' class='small' cols='25' maxlength='50'  onkeydown=\"textCounter(document.priceApprovalMain.inMisc"+counterIn+",'inMiscChar"+counterIn+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.inMisc"+counterIn+",'inMiscChar"+counterIn+"',50)\" ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"inMiscChar"+counterIn+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div>";
  row.appendChild(cell1);




  tabBody.appendChild(row);
}
function delRowIn()
{
	if(counterIn > 1)
	{
	document.getElementById("inputtable4").deleteRow(counterIn);
	counterIn = counterIn - 1;
	document.priceApprovalMain.countIn.value = counterIn;
	}
}


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
                companyDataArry   = (String[])companyList.get(kk);
    //System.out.println("++"+companyDataArry[0]);
                if(companyDataArry[0].equals("1000") || companyDataArry[0].equals("1007")) {
                lstComps += "<option value=\""+companyDataArry[0]+"\">"+companyDataArry[2]+"</option>";
               }
            }
} 
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

<body onload="showSabOsp();<%if(checkAdmin){%>showAllRequestsOsp();<%flg = 1;}%>">
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
<%@ include file="includes/relatedlinks.jsp"%>

  </tr>
  <tr>
    <td height="38"><img src="images/header_price2.jpg" width="706" height="38" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>

</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
          <td height="22" bgcolor="#ffffff" class="greyBG">O S P</td>
        </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="greyBG">Supported By / Approved By</td>
        </tr>
          <td height="22" bgcolor="#ffffff" class="greyBG" align="right"><a href="javascript:showSabOsp();showAllRequestsOsp();" style="text-decoration: none;">&nbsp;Refresh<img src="images/refresh.png" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /> --></td>
          </tr>
			<tr>
			<td height="10" class="normal" align="right"><a href="#" onclick="javascript:window.open('OSP/common/viewSABApprovedHistoryOsp.jsp','','resizable=yes,scrollbars=yes,height=650,width=1024')"><b>Approvers Status</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:window.open('OSP/common/viewStatusOsp.jsp','','resizable=yes,scrollbars=yes,height=650,width=1024')"><b>Buyers Status</b></a>&nbsp;&nbsp;&nbsp;</td>

			</tr>
		  <tr>
		<td>
		<table width="100%" cellspacing="2" cellpadding="2" border="0">
        <tr class="greyBG">
            <td width="8%" height="29" class="nav">Sr. No</td>
            <td width="18%" align="left" class="nav">VENDOR NAME</td> 
            <td width="12%" align="left" class="nav">PURCHASE APPROVAL ID</td>    
            <td width="18%" align="left" class="nav">CONTRACT VALIDITY</td>
            <td width="16%" align="left" class="nav">INITIATOR NAME</td>
            <td width="10%" align="left" class="nav">INITIATED ON</td>
            <td width="10%" align="left" class="nav">STATUS</td>
            <td  align="left">ACTION</td>

        </tr>
		<tr><td id = "sabOsp" width="100%" colspan="8" height="60"></td></tr>
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
          <td height="22" bgcolor="#ffffff" class="greyBG">View All Requests</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /> --></td>
          </tr>
				<tr><td height="10" colspan="5"></td></tr>
		  <tr>
		<td>
		<table width="100%" cellspacing="2" cellpadding="2" border="0">
		<tr class="greyBG">
            <td width="3%" height="29" class="nav">Sr. No</td>
            <td width="13%" align="left" class="nav">PROJECT NAME</td> 
            <td width="18%" align="left" class="nav">PURCHASE APPROVAL ID</td>    
            <td width="20%" align="left" class="nav">CONTRACT VALIDITY</td>
            <td width="16%" align="left" class="nav">INITIATOR NAME</td>
            <td width="10%" align="left" class="nav">INITIATED ON</td>
            <td width="10%" align="left" class="nav">STATUS</td>
            <td  align="left" class="nav">ACTION</td>
        </tr>
		<tr><td id = "allProcessOsp" width="100%" colspan="9" height="60"></td></tr>
		 <tr>
          <td height="25" valign="top" align="left"></td>
          <td height="25" valign="top" align="left"></td>
          <td height="25" valign="top" align="left"></td>
          <td height="25" align="left" valign="top"></td>
          <td height="25" align="left" valign="top"></td>
          <td height="25" align="left" valign="top"></td>
          <td height="25" align="left" valign="top"></td>
          <td height="25" align="left" valign="top"></td>
          <td height="25" align="left" valign="top"></td>
        </tr> 
	</table>
<%
    }
%>
<table width="100%" border = "0"  cellspacing="1" cellpadding="2" >
  <tr bgcolor="#fbf9f9"  class="greyBG" height="30">
     <td  align="left" width="3%" class="greyBG">COMPANY :</td>
	 <td  align="left" width="5%" class="greyBG"><select class="small" id="company" name="company" ">
            <option value="0">Select Company</option>
            <%=lstComps%>
         </select>
        </td>
     <td  align="left" width="9%" >&nbsp;SANCTIONED REFERENCE TYPE :</td>
	 <td  align="left" width="5%"><select class="small" id="sanctionedRefType" name="sanctionedRefType">
		<option value="0">Select Ref Type</option>
        <option value="Capex">Capex</option>
        <option value="Purchase request" selected>Purchase Request</option>
        
       </select>
	</td>
	 <td  align="left" width="6%">&nbsp;REFERENCE NUMBER :</td>
	 <td  align="left"  width="5%"><input type = "text" name = "refNumber" id="refNumber" class = "normal" size="20"></td>
	 <td  align="left" width="6%">&nbsp;DATE OF APPROVAL :</td>
	 <td  align="left" width="4%"><span class="small">
      <input name="dateOfApproval" id="dateOfApproval" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" />
    </span></td>
	
	 <td  align="left" width="3%"><a href="javascript:void(0)" onclick="getOspDetails();"><img src="images/but_go.gif" border="0" /></a></td>	
	<tr>

</table>
<!-- <table width="100%" cellspacing="2" cellpadding="2" border="0"> -->
<div id="showRequests" >
<p>&nbsp;</p>
<table width="100%" cellpadding="0" cellspacing="0" >
</tbody>
</form>
</body>
</html>