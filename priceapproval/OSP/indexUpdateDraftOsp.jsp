<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<% int flg = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" >

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>PURCHASE APPROVAL</title>
<link href="/timescape/sapep/employeeselfservice/priceapproval/OSP/css/global.css" rel="stylesheet" type="text/css" />
<link href="/timescape/sapep/employeeselfservice/priceapproval/style/calendarControl.css" rel="stylesheet">

<script Language="JavaScript" src="../jscripts/util.js"></script>
<script Language="JavaScript" src="../jscripts/common.js"></script>
<script Language="JavaScript" src="../jscripts/search.js"></script>
<script Language="JavaScript" src="/timescape/sapep/employeeselfservice/priceapproval/jscripts/osp.js"></script>
<script src="/timescape/sapep/employeeselfservice/priceapproval/jscripts/calendarControl.js" language="javascript"></script>

<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
<script type="text/javascript">
var counter = 1;
var counterCom = 1;
var counterEs = 1;
var counterIn = 1;
var rcounter=14;
function addRowTech()
{
  counter =  document.priceApprovalMain.countTech.value;

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
  counterCom =  document.priceApprovalMain.countCom.value;

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
  counterEs =  document.priceApprovalMain.countEs.value;

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
/*
  cell1   = document.createElement("TD");
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
  counterIn =  document.priceApprovalMain.countIn.value;


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
	document.priceApprovalMain.countTech.value = counterIn;
	}
}


</script>
</head>
<%
        String tOId			= (String)request.getParameter("tOId");

		String priceid		= (String)request.getParameter("priceid");

		ArrayList vStatus	=  new ArrayList();
	
		vStatus 			=	priceApprovalWebController.viewStatusReviewOsp(tOId,priceid);

		ArrayList vStatus1	=  new ArrayList();
	
		vStatus1 			=	priceApprovalWebController.viewTechVendor(tOId,priceid);

		ArrayList vStatus2	=  new ArrayList();
	
		vStatus2 			=	priceApprovalWebController.viewComVendor(tOId,priceid);

		ArrayList vStatus3	=  new ArrayList();
	
		vStatus3 			=	priceApprovalWebController.viewEsVendor(tOId,priceid);

		ArrayList vStatus4	=  new ArrayList();
	
		vStatus4 			=	priceApprovalWebController.viewInVendor(tOId,priceid);

		ArrayList vStatus5	=  new ArrayList();
	
		vStatus5 			=	priceApprovalWebController.viewApproverDetailsOsp(tOId,priceid);

	
		String[] data1		= (String [])vStatus.get(0);

		String pageType		= request.getParameter("viewSAB"); 

		String[] data3      = (String [])vStatus5.get(0);
		

		  String APPROVER11_STATUS = data3[0];            
		  String APPROVER12_STATUS = data3[1];           
		  String APPROVER13_STATUS = data3[2];            
		  String APPROVER21_STATUS = data3[3];            
		  String APPROVER22_STATUS = data3[4];            
		  String APPROVER23_STATUS = data3[5];             
		  String APPROVER31_STATUS = data3[6];            
		  String APPROVER32_STATUS = data3[7];            
		  String APPROVER33_STATUS = data3[8];            
		  String APPROVER4_STATUS  = data3[9];            
		  String APPROVER5_STATUS  = data3[10];            
		  String APPROVER6_STATUS  = data3[11];           
		  String APPROVER11_DATE = data3[12];              
		  String APPROVER12_DATE = data3[13];              
		  String APPROVER13_DATE = data3[14];              
		  String APPROVER21_DATE = data3[15];              
		  String APPROVER22_DATE = data3[16];              
		  String APPROVER23_DATE = data3[17];              
		  String APPROVER31_DATE = data3[18];              
		  String APPROVER32_DATE = data3[19];              
		  String APPROVER33_DATE = data3[20];              
		  String APPROVER4_DATE  = data3[21];              
		  String APPROVER5_DATE  = data3[22];              
		  String APPROVER6_DATE  = data3[26];
		  String APPROVER34_STATUS = data3[24];
		  String APPROVER35_STATUS = data3[30];
		  String APPROVER36_STATUS = data3[32];
		  String APPROVER7_STATUS  = data3[25];
		  String APPROVER34_DATE   = data3[26];
		  String APPROVER35_DATE   = data3[31];
		  String APPROVER36_DATE   = data3[33];
		  String APPROVER7_DATE    = data3[27];
		  String APPROVER8_STATUS  = data3[28];
		  String APPROVER8_DATE	   = data3[29];


		String SANCTIONEDREFTYPE			= data1[1];
		String REFNUMBER					= data1[2];
		String DATEOFAPPROVAL				= data1[3];
		String PROJECTNAME      			= data1[4];
		String FROMCONTRACTVALIDITY         	= data1[5];
		String TOCONTRACTVALIDITY         	= data1[5];
		String DESCRIPTION			        = data1[6];
 		String CONTRACTVALUE        		= data1[7];
		String USERGROUP				    = data1[8];
		String VENDORNAME					= data1[9];
		String TOTALBUDGET	                = data1[10];
		String PAYMENTTERMS				    = data1[11];
		String SANCTIONNOTE		            = data1[12];
		String SAVINGS  					= data1[13];
		String BACKGROUND		            = data1[14];
		String RECOMMENDATION		        = data1[58];
		String AP11     					= data1[27];
		String AP12					        = data1[28];
		String AP13					        = data1[29];
		String AP21					        = data1[30];
		String AP22					        = data1[31];
		String AP23					        = data1[32];
		String AP31					        = data1[33];
		String AP32					        = data1[34];
		String AP33					        = data1[35];
		String AP34					        = data1[44];
		String AP35					        = data1[51];
		String AP36					        = data1[53];
		String AP4					        = data1[36];
		String AP5					        = data1[37];
		String AP6					        = data1[38];
		String AP7					        = data1[45];
		String AP8					        = data1[50];

		String APPROVER11					= data1[15];
		String APPROVER12					= data1[16];
		String APPROVER13					= data1[17];
		String APPROVER21					= data1[18];
		String APPROVER22					= data1[19];
		String APPROVER23					= data1[20];
		String APPROVER31					= data1[21];
		String APPROVER32					= data1[22];
		String APPROVER33					= data1[23];
		String APPROVER34					= data1[47];
		String APPROVER35					= data1[52];
		String APPROVER36					= data1[54];

		String APPROVER4					= data1[24];
		String APPROVER5					= data1[25];
		String APPROVER6					= data1[26];
		String APPROVER7					= data1[48];
		String APPROVER8					= data1[49];

       	String CREATEDBY					= data1[39];
		String CREATEDON					= data1[40];
		String MODIFIEDBY					= data1[41];	
		String MODIFIEDON					= data1[42];
        String COMPANY  					= data1[55];
		String STATUS						= data1[43];
		String userEmailid				    = data1[46];

        String INITIATOR_NAME				= data1[56];
        String INITIATEDON					= data1[40];
        String COMPANYNAME 					= data1[57];
		String compAttachmentName="compulsory";
		String addAttachmentName="additional";

		if (userEmailid.indexOf("@") > -1) {
        userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
	    } 

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

                if(companyDataArry[0].equals("1000") || companyDataArry[0].equals("1007")) {

                    lstComps += "<option value=\""+companyDataArry[0]+"\" "+(COMPANY.equals(companyDataArry[0])? "SELECTED":"")+">"+companyDataArry[2]+"</option>";
                }
            }
}

 String approverType="";
 String app4        ="";
 String app5        ="";
 String app6        ="";
 String app7        ="";
        Hashtable apprData = new Hashtable();
        approverType="AP4";
        apprData.put("companyCode",COMPANY);
        apprData.put("approverType",approverType);
		ArrayList approversLst	=  new ArrayList();
	    String apprsData[]       = null;
         int jj          =0;
		approversLst 			=	priceApprovalWebController.grpCompanyAppLst(apprData);
          if(approversLst.size()>0)
           {
            for(jj = 0; jj<approversLst.size(); jj++)
             {
                apprsData   = (String[])approversLst.get(jj);
                app4    += "<option value=\""+apprsData[0]+"\" "+(AP4.equals(apprsData[0])? "SELECTED":"")+">"+apprsData[5]+"</option>";
   }

        apprData.remove("approverType");
}
        approverType="AP5";
        apprData.put("approverType",approverType);
		approversLst 			=	priceApprovalWebController.grpCompanyAppLst(apprData);
          if(approversLst.size()>0)
           {
            for(jj = 0; jj<approversLst.size(); jj++)
             {
                apprsData   = (String[])approversLst.get(jj);
                app5    += "<option value=\""+apprsData[0]+"\" "+(AP5.equals(apprsData[0])? "SELECTED":"")+">"+apprsData[5]+"</option>";
          }
        apprData.remove("approverType");
}
        approverType="AP6";
        apprData.put("approverType",approverType);
		approversLst 			=	priceApprovalWebController.grpCompanyAppLst(apprData);
          if(approversLst.size()>0)
           {
            for(jj = 0; jj<approversLst.size(); jj++)
             {
                apprsData   = (String[])approversLst.get(jj);
                app6    += "<option value=\""+apprsData[0]+"\" "+(AP6.equals(apprsData[0])? "SELECTED":"")+">"+apprsData[5]+"</option>";
          }
        apprData.remove("approverType");
}
        approverType="AP7";
        apprData.put("approverType",approverType);
		approversLst 			=	priceApprovalWebController.grpCompanyAppLst(apprData);
          if(approversLst.size()>0)
           {
            for(jj = 0; jj<approversLst.size(); jj++)
             {
                apprsData   = (String[])approversLst.get(jj);
                app7    += "<option value=\""+apprsData[0]+"\" "+(AP7.equals(apprsData[0])? "SELECTED":"")+">"+apprsData[5]+"</option>";
          }
}

String flag         = (String)request.getParameter("flag");
if(flag == null)
{
    flag="D";
}

    String label1="";
    String label2="";
    String label3="";
    String label4="";

    if(COMPANY.equals("1000"))
    {
        //label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">(Delegated Authority) &nbsp; &#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        label1 = "<span class=\"small\"><strong>Director B&C</strong></span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Contract value> 3L and < 20L)</span>";
        //label2 = "<span class=\"small\"><strong>Executive Director</strong></span>";
        label2 = "<span class=\"small\"><strong>COO (Publishing)</strong></span>";
        label3 = "<span class=\"small\"><strong>COO</strong></span>";
        //label4 = "<span class=\"small\"><strong>CEC & ED</strong></span>";
        label4 = "<span class=\"small\"><strong>COO (Publishing)</strong></span>";
    }else{
        label1  ="<span class=\"small\">Group Company CEO</span>";
        label2 = "<span class=\"small\"><strong>Director B&C</strong></span>";
       // label2 = "<span class=\"small\">Director B&C</span><span class=\"redsmall\" id=\"changeLabel2\"><br>(Delegated Authority)</span>";
        //label3 = "<span class=\"small\"><strong>Executive Director</strong></span>";
        label3 = "<span class=\"small\"><strong>COO (Publishing)</strong></span>";
        //label4 = "<span class=\"small\"><strong>CEC & ED - BCCL</strong></span>";
        label4 = "<span class=\"small\"><strong>CEO (Publishing)</strong></span>";
    }

%>
<body onload="showFixedAttachmentFile('1','<%=priceid%>','<%=userEmailid%>','<%=STATUS%>','<%=compAttachmentName%>','<%=addAttachmentName%>','<%=flag%>')">
<form name="priceApprovalMain" method="post" action="" >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price1.jpg" width="842" height="44" /></td>
    <td width="23%" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="38"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>

</table>
<table width="100%" cellspacing="2" cellpadding="2" border="0">

<tr  class="greyBG">
     <td colspan="4" >
	 
	 <table width="100%" border = "0" cellspacing="1" cellpadding="1" >
	  <tr>

		<td  width="14%" align="left" class="normal" >SANCTIONED REF TYPE :</td>
		<td  width="10%" align="left" >
		<select id="sanctionedRefType" name="sanctionedRefType"  class="small">
 			 <option value="Capex" <%if(SANCTIONEDREFTYPE.equals("Capex")){%>selected="selected"<%}%>>Capex</option>
			 <option value="Purchase request" <%if(SANCTIONEDREFTYPE.equals("Purchase request")){%>selected="selected"<%}%>>Purchase Request</option>
		</select> 
		 </span>
		</td> 
		<td  width="14%" align="left"   class="normal" >REF NUMBER :</td>
		<td  width="10%" align="left" class="travelMenuBG"  ><span class="small">
		    <input name="refNumber" id ="refNumber" class="small" size="30" value="<%=REFNUMBER%>" /></span></td>

		<td  width="12%" align="left"   class="normal" >DATE OF APPROVAL :</td>
		<td  width="15%" align="left" class="greyBG"  ><span class="small">
		    <input name="dateOfApproval" id= "dateOfApproval" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" value="<%=DATEOFAPPROVAL%>" />
		 </span>
		 </td>
		<td  width="10%" align="left" class="normal"  >Company :</td>
		<td  width="20%" align="left" >
		<select id="company" name="company"  class="small" style="width:130px;" disabled>
			 <%=lstComps%>
 		</select> 
		 </span>
		</td> 
	  </tr>
	</table>
	 
	 </td>
	
<table width="100%" cellspacing="2" cellpadding="2" border="0">
	<tr>
		<td  align="left" width="15%"   class="normal"><span class="redsmall">*&nbsp;-&nbsp;mandatory</span></td>
	</tr>
	<!--<tr height="30">
		<td  align="left" width="15%"  bgcolor="#fbf9f9" class="travelMenuBG">CATEGORY&nbsp;:&nbsp;</td>
		<td colspan="4"  width="15%" bgcolor="#fbf9f9" class="travelMenuBG">
		<select class="small" id="category" name="category" onchange="project();freezcpx();setSelectedIndex();">
			<option value="0">Select Category</option>
			<!-- <option value="NP & Logistics">NP & Logistics</option> 
			<option value="IBO">IBO</option>
			<option value="Capex">Capex</option>
			<option value="IT buying">IT buying</option>
			<option value="Consumables">Consumables</option>
			<option value="Insurance">Insurance</option>
			<option value="Non conventional category">Non conventional category</option>
			<option value="Projects">Projects</option>
			<option value="OSP">OSP</option>
			<option value="Group Company related buying">Group Company related buying</option>
			<option value="Logistics">Logistics</option>
		</select>
	<font size="3" color="red">&nbsp;&#42</font></td>
	</tr>-->
	<tr>
		<td height="26" colspan="2" bgcolor="#fbf9f9" class="greyBG">PROJECT DETAILS</td>
		<td colspan="2" align="left" bgcolor="#fbf9f9" class="greyBG">CONTRACT DETAILS</td>
	 </tr>
	<tr>
    <td width="18%" height="27" bgcolor="#fbf9f9"><span class="small" id="top">Project Name</span></td>
    <td width="26%" align="left">
		<span class="small">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr>
				<td width="45%">
					<input type="text" size="25" name="projectName" class="small" maxlength="25" onkeydown="textCounter(document.priceApprovalMain.projectName,'projectChar',25)" onkeyup="textCounter(document.priceApprovalMain.projectName,'projectChar',25)" value="<%=PROJECTNAME == null ? "" : PROJECTNAME%>">
				<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
				<td id="projectChar" align="left" width="8%" class="small">25</td>
				<td align="left" class="small">Chars Left</td>
				</tr>
			</table>
		</span>
			</td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Contract Validity:</span></td>
		<td width="35%" align="left">
		<span class="small">
			<table width="52%" cellspacing="0" cellpadding="0" border="0">
				<tr>
				<td width="10%">
      <input type="text" size="10" name="fromContractValidity" id="fromContractValidity" placeholder="from" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" value="<%=FROMCONTRACTVALIDITY == null ? "" : FROMCONTRACTVALIDITY%>"/>&nbsp;to&nbsp;</td>
 <td width="4%"><input type="text" size="10" name="toContractValidity" id="toContractValidity" placeholder="to" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" style="margin-left:2px;"value="<%=TOCONTRACTVALIDITY == null ? "" : TOCONTRACTVALIDITY%>" />

		  <!-- <input name="contractValidity" class="small" maxlength="25" onkeydown="textCounter(document.priceApprovalMain.contractValidity,'contractChar',25)" onkeyup="textCounter(document.priceApprovalMain.contractValidity,'contractChar',25)"> -->
				<td width="3%" align="right"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
				
				</tr>
			</table>
		</span>
			</td>
	<tr>
    <td bgcolor="#fbf9f9"><span class="small">Description</span></td>
    <td width="30%" align="left">
		<span class="small">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
			<td width="45%">
				<textarea name="description" class="small" maxlength="50" cols="24" onkeydown="textCounter(this,'contractChar',50)" onkeyup="textCounter(this,'descriptionChar',50)" onblur="textCounter(this,'descriptionChar',50)"><%=DESCRIPTION == null ? "" : DESCRIPTION%></textarea>
			<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
			<td id="descriptionChar" align="left" width="8%" class="small" >50</td>
			<td align="left" class="small" >Chars Left</td>
			</tr>
			</table>
		</span>
			</td>
	
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Contract value (Rs):</span></td>
    <td width="35%" align="left">
		<span class="small">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
			<td width="45%">
				<input type="text" size="25" name="contractValue" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.contractValue,'contractValueChar',10)" onkeyup="textCounter(document.priceApprovalMain.contractValue,'contractValueChar',10);negValCheck();" value="<%=CONTRACTVALUE == null ? "" : CONTRACTVALUE%>"/>
			<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
			<td id="contractValueChar" align="left" width="8%" class="small">10</td>
			<td align="left" class="small"> Chars Left</td>
			</tr>
			</table>
		</span>
			</td>
	</tr>
	
	<tr>
	<td bgcolor="#fbf9f9"><p class="small">User group:</p></td>
	<td width="26%" align="left">
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td width="45%">
		  <input type="text" size="25" name="userGroup" class="small" maxlength="25" onkeydown="textCounter(document.priceApprovalMain.userGroup,'userGroupChar',25)" onkeyup="textCounter(document.priceApprovalMain.userGroup,'userGroupChar',25);"value="<%=USERGROUP == null ? "" : USERGROUP%>"/>
		<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
		<td id="userGroupChar" align="left" width="8%" class="small">25</td>
		<td align="left" class="small">Chars Left</td>
		</tr>
		</table>
	</span>
		</td>

	<td valign="middle" width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Vendor name:</span></td>
	<td valign="middle" width="35%" align="left" >
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
			<td width="45%">
				<input type="text" size="25" name="vendorName" class="small" maxlength="25" onkeydown="textCounter(document.priceApprovalMain.vendorName,'vendorNameChar',25)" onkeyup="textCounter(document.priceApprovalMain.vendorName,'vendorNameChar',25);"value="<%=VENDORNAME == null ? "" : VENDORNAME%>"/>
			<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
			<td id="vendorNameChar" align="left" width="8%" class="small">25</td>
			<td align="left" class="small">Chars Left</td>
			</tr>
		</table>
	</span>
		</td>
	</tr>
	
	<tr>
	<td bgcolor="#fbf9f9"><p class="small">Total Aop Budget (Rs.) :</p></td>
	<td width="26%" align="left">
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td width="45%">
			<input type="text" size="25" name="totalBudget" id="" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.totalBudget,'totalBudgetChar',10)" onkeyup="textCounter(document.priceApprovalMain.totalBudget,'totalBudgetChar',10);"value="<%=TOTALBUDGET == null ? "" : TOTALBUDGET%>"/>
		<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
		<td id="totalBudgetChar" align="left" width="8%" class="small">10</td>
		<td align="left" class="small"> Chars Left</td>
		</tr>
		</table>
	</span>
		</td>
		
	<td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Payment terms:</span></td>
    <td width="35%" align="left">
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td width="45%">
			<textarea name="paymentTerms" rows="2" class="small" cols="24" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.paymentTerms,'paymentTermsChar',50)" onkeyup="textCounter(document.priceApprovalMain.paymentTerms,'paymentTermsChar',50);"/><%=PAYMENTTERMS == null ? "" : PAYMENTTERMS%></textarea>
		<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
		<td id="paymentTermsChar" align="left" width="8%" class="small">50</td>
		<td align="left" class="small">Chars Left</td>
		</tr>
		</table>
	</span>
		</td>
		
	</tr>
	
	<tr>
	<td bgcolor="#fbf9f9"><span class="small">Sanction note status:</span></td>
	<td width="26%" align="left">
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td width="45%">
			<input type="text" size="25" name="sanctionNote" class="small" maxlength="25" onkeydown="textCounter(document.priceApprovalMain.sanctionNote,'sanctionNoteChar',25)" onkeyup="textCounter(document.priceApprovalMain.sanctionNote,'sanctionNoteChar',25);"value="<%=SANCTIONNOTE == null ? "" : SANCTIONNOTE%>"/>
		<td width="3%"><font size="3" color="red">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
		<td id="sanctionNoteChar" align="left" width="8%" class="small">25</td>
		<td align="left" class="small">Chars Left</td>
		</tr>
		</table>
	</span>
		</td>
		
	<td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Savings If any:</span></td>
	<td width="35%" align="left">
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td width="45%">
			<input type="text" size="25" name="savings" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.savings,'savingsChar',10)" onkeyup="textCounter(document.priceApprovalMain.savings,'savingsChar',10);"value="<%=SAVINGS == null ? "" : SAVINGS%>"/>
		<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
		<td id="savingsChar" align="left" width="8%" class="small">10</td>
		<td align="left" class="small">Chars Left</td>
		</tr>
		</table>
	</span>
		</td>
	</tr>
</table>
<!--end project and contract details-->


<table width="100%" border="0" cellpadding="2" cellspacing="2">
 <tr>
    <td height="22" bgcolor="#ffffff" class="greyBG">BACKGROUND</td>
  </tr>
  <tr>
  <td  align="left" width="100%" valign="top"><textarea name="background" cols="55" rows="12" maxlength="3000" style ="height:170px;width:96%" onkeydown="textCounter(document.priceApprovalMain.background,'backgroundChar',3000)" onkeyup="textCounter(document.priceApprovalMain.background,'backgroundChar',3000);"/><%=BACKGROUND == null ? "" : BACKGROUND%></textarea>
		<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="backgroundChar" width="3%" class="small">3000</td><td class="small">Chars Left</td></tr></table></div>
	</td>
	</tr>
</table>
<hr>
<!--TECHNICAL SPECIFICATIONS-->
<table width="100%" cellspacing="2" cellpadding="2" align="center">
<tr>
		<td height="26" colspan="5" bgcolor="#fbf9f9" class="greyBG">A1. TECHNICAL SPECIFICATIONS:</td>
	</tr>
<tbody id="inputtable">

  <tr class="greyBG">
	<td width="2%" height="29" >VENDOR</td>
    <td width="2%" align="left">Machine Type</td>
    <td width="2%" align="left">No of Pages (colors)</td>
    <td width="2%" align="left">No of CTP & Make</td>
    <td width="2%" align="left">Speed/ hr</td>
	</tr>
<%
    if(vStatus1.size()>0)
	{
      for ( int ii = 0; ii < vStatus1.size(); ii++ ) 
        {

		String[] data4 = (String [])vStatus1.get(ii);
%>


  <tr>
	<td height="20" valign="top" align="left"><span class="small">
      <textarea name="tvendor<%=ii+1%>" id="tvendor<%=ii+1%>" cols="25" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.tvendor<%=ii+1%>,'tvendorChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.tvendor<%=ii+1%>,'tvendorChar<%=ii+1%>',50)" ><%=data4[2]%></textarea>   
	  </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="tvendorChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="tmachine<%=ii+1%>" id="tmachine<%=ii+1%>"cols="25" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.tmachine<%=ii+1%>,'tmachineChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.tmachine<%=ii+1%>,'tmachineChar<%=ii+1%>',50)"><%=data4[3]%></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="tmachineChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="pagination<%=ii+1%>"  id="pagination<%=ii+1%>" cols="25" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.pagination<%=ii+1%>,'paginationChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.pagination<%=ii+1%>,'paginationChar<%=ii+1%>',50)"><%=data4[3]%></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="paginationChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="ctp<%=ii+1%>" id="ctp<%=ii+1%>" cols="25" rows="2" class="small" maxlength="50"   onkeydown="textCounter(document.priceApprovalMain.ctp<%=ii+1%>,'ctpChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.ctp<%=ii+1%>,'ctpChar<%=ii+1%>',50);autoAnnexure();"><%=data4[4]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="ctpChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="speed<%=ii+1%>" id="speed<%=ii+1%>" class="small" cols="25" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.speed<%=ii+1%>,'speedChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.speed<%=ii+1%>,'speedChar<%=ii+1%>',50)"><%=data4[5]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="speedChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

  </tr>
<%
   
} }

%>
   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="tech" onclick="addRowTech()" class="bold">
   <input type="button" value="  Remove Row   " name="tech" onclick="delRowTech()" class="bold"></td></tr>
   <input type="hidden" name="countTech" value="<%=vStatus1.size()%>" />	
 </table>



<!--END TECHNICAL SPECIFICATIONS-->
<hr>

<!--COMMERCIALS-->

<table width="100%" cellspacing="2" cellpadding="2" align="center">
<tr>
		<td height="26" colspan="7" bgcolor="#fbf9f9" class="greyBG">B1). COMMERCIALS:</td>
	</tr>
<tbody id="inputtable2">

  <tr class="greyBG">
	<td width="2%" height="29" >Vendor</td>
    <td width="2%" align="left">Colour Page (paisa)</td>
    <td width="2%" align="left">B&W Rate(paisa)</td>
    <td width="2%" align="left">Plate cost(Rs.)</td>
    <td width="2%" align="left">Bundling</td>
    <td width="2%" align="left">Insertion</td>
    <td width="2%" align="left">Other misc</td>
	</tr>
<%
    if(vStatus2.size()>0)
	{
      for ( int ii = 0; ii < vStatus2.size(); ii++ ) 
        {

		String[] data4 = (String [])vStatus2.get(ii);
%>

  <tr>
	<td height="20" valign="top" align="left"><span class="small">
      <textarea name="cvendor<%=ii+1%>" id="cvendor<%=ii+1%>" cols="20" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.cvendor<%=ii+1%>,'cvendorChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.cvendor<%=ii+1%>,'cvendorChar<%=ii+1%>',50)" ><%=data4[2]%></textarea>   
	  </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cvendorChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="colourPage<%=ii+1%>" id="colourPage<%=ii+1%>"cols="20" class="small" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.colourPage<%=ii+1%>,'colourPageChar<%=ii+1%>',10)" onkeyup="textCounter(document.priceApprovalMain.colourPage<%=ii+1%>,'colourPageChar<%=ii+1%>',10);valCheck();"><%=data4[3]%></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="colourPageChar<%=ii+1%>" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="bAndw<%=ii+1%>"  id="bAndw<%=ii+1%>" cols="20" rows="2" class="small" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.bAndw<%=ii+1%>,'bAndwChar<%=ii+1%>',10)" onkeyup="textCounter(document.priceApprovalMain.bAndw<%=ii+1%>,'bAndwChar<%=ii+1%>',10);valCheck();"><%=data4[4]%></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="bAndwChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="plateCost<%=ii+1%>" id="plateCost<%=ii+1%>" cols="20" rows="2" class="small" maxlength="10"   onkeydown="textCounter(document.priceApprovalMain.plateCost<%=ii+1%>,'plateCostChar<%=ii+1%>',10)" onkeyup="textCounter(document.priceApprovalMain.plateCost<%=ii+1%>,'plateCostChar<%=ii+1%>',10);valCheck();"><%=data4[5]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="plateCostChar<%=ii+1%>" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="bundling<%=ii+1%>" id="bundling<%=ii+1%>" class="small" cols="20" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.bundling<%=ii+1%>,'bundlingChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.bundling<%=ii+1%>,'bundlingChar<%=ii+1%>',50)"><%=data4[6]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="bundlingChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="insertion<%=ii+1%>" id="insertion<%=ii+1%>" class="small" cols="20" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.insertion<%=ii+1%>,'insertionChar1',50)" onkeyup="textCounter(document.priceApprovalMain.insertion<%=ii+1%>,'insertionChar<%=ii+1%>',50)"><%=data4[7]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="insertionChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="otherMisc<%=ii+1%>" id="otherMisc<%=ii+1%>" class="small" cols="20" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.otherMisc<%=ii+1%>,'otherMiscChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.otherMisc<%=ii+1%>,'otherMiscChar<%=ii+1%>',50)"><%=data4[8]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="otherMiscChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

  </tr>
<%
   
} }

%> 
  </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="com" onclick="addRowCom()" class="bold">
   <input type="button" value="  Remove Row   " name="com" onclick="delRowCom()" class="bold"></td></tr>
   <input type="hidden" name="countCom" value="<%=vStatus2.size()%>" />	

 </table>

<!--END COMMERCIALS-->
<hr>

<!--Estimated Spend & other specs-->

<table width="100%" cellspacing="2" cellpadding="2" align="center">
<tr>
		<td height="26" colspan="8" bgcolor="#fbf9f9" class="greyBG">B2). ESTIMATED SPEND & OTHER SPECS:</td>
	</tr>
<tbody id="inputtable3">

  <tr class="greyBG">
	<td width="2%" height="29" >Vendor</td>
    <td width="2%" align="left">PO/Daily</td>
    <td width="2%" align="left">ALP/Year</td>
    <!-- <td width="2%" align="left">No of B&W field</td>
 -->    <td width="2%" align="left">Total Spend  (Rs.)</td>
    <td width="2%" align="left">Pagn. confg.</td>
    <td width="2%" align="left">LPRS (eg. 20:21 or 8:21pm)</td>
    <td width="2%" align="left">Waste %</td>
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
      <textarea name="esVendor<%=ii+1%>" id="esVendor<%=ii+1%>" cols="20" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.esVendor<%=ii+1%>,'esVendorChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.esVendor<%=ii+1%>,'esVendorChar<%=ii+1%>',50)" ><%=data4[2]%></textarea>   
	  </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="esVendorChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="po<%=ii+1%>"  id="po<%=ii+1%>" cols="20" rows="2" class="small" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.po<%=ii+1%>,'poChar<%=ii+1%>',10)" onkeyup="textCounter(document.priceApprovalMain.po<%=ii+1%>,'poChar<%=ii+1%>',10);valCheck();"><%=data4[5]%></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="poChar<%=ii+1%>" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="alp<%=ii+1%>" id="alp<%=ii+1%>"cols="20" class="small" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.alp1,'alpChar1',10)" onkeyup="textCounter(document.priceApprovalMain.alp<%=ii+1%>,'alpChar<%=ii+1%>',10);valCheck();"><%=data4[3]%></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="alpChar<%=ii+1%>" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <!-- <td height="25" valign="top" align="left"><span class="small">
      <textarea name="esBandW<%//=ii+1%>" id="esBandW<%//=ii+1%>"cols="20" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.esBandW<%//=ii+1%>,'esBandWChar1',50)" onkeyup="textCounter(document.priceApprovalMain.esBandW<%//=ii+1%>,'esBandWChar<%//=ii+1%>',50)"><%//=data4[4]%></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="esBandWChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

 -->
	
	
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="totalSpend<%=ii+1%>" id="totalSpend<%=ii+1%>" cols="20" rows="2" class="small" maxlength="10"   onkeydown="textCounter(document.priceApprovalMain.totalSpend<%=ii+1%>'totalSpendChar1',10)" onkeyup="textCounter(document.priceApprovalMain.totalSpend<%=ii+1%>,'totalSpendChar<%=ii+1%>',10);valCheck();"><%=data4[6]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="totalSpendChar<%=ii+1%>" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <!--<td height="25" valign="top" align="left"><span class="small">
      <textarea name="totalSpend<%=ii+1%>" id="totalSpend<%=ii+1%>" cols="20" rows="2" class="small" maxlength="10"   onkeydown="textCounter(document.priceApprovalMain.totalSpend<%=ii+1%>'totalSpendChar1',10)" onkeyup="textCounter(document.priceApprovalMain.totalSpend<%=ii+1%>,'totalSpendChar<%=ii+1%>',10);valCheck();"><%=data4[6]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="totalSpendChar<%=ii+1%>" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>-->

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="esPagination<%=ii+1%>" id="esPagination<%=ii+1%>" class="small" cols="20" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.esPagination<%=ii+1%>,'esPaginationChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.esPagination<%=ii+1%>,'esPaginationChar<%=ii+1%>',50)"><%=data4[7]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="esPaginationChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="lprs<%=ii+1%>" id="lprs<%=ii+1%>" class="small" cols="20" maxlength="8"  onkeydown="textCounter(document.priceApprovalMain.lprs<%=ii+1%>,'lprsChar<%=ii+1%>',8)" onkeyup="textCounter(document.priceApprovalMain.lprs<%=ii+1%>,'lprsChar<%=ii+1%>',8)"><%=data4[8]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="lprsChar<%=ii+1%>" width="10%" class="small">8</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="waste<%=ii+1%>" id="waste<%=ii+1%>" class="small" cols="20" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.waste<%=ii+1%>,'wasteChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.waste<%=ii+1%>,'wasteChar<%=ii+1%>',50)"><%=data4[9]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="wasteChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

  </tr>
<%
   
} }

%>    </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="es" onclick="addRowEs()" class="bold">
   <input type="button" value="  Remove Row   " name="es" onclick="delRowEs()" class="bold"></td></tr>
   <input type="hidden" name="countEs" value="<%=vStatus3.size()%>" />	

 </table>


<!--END Estimated Spend & other specs-->
<hr>

<!--innovations-->
<table width="100%" cellspacing="2" cellpadding="2" align="center">
<tr>
		<td height="26" colspan="4" bgcolor="#fbf9f9" class="greyBG">C1). INNOVATIONS & GNP PRINTING:</td>
	</tr>
<tbody id="inputtable4">

  <tr class="greyBG">
	<td width="2%" height="29" >Vendor</td>
    <td width="2%" align="left">PO</td>
    <td width="2%" align="left">Total Spend</td>
    <td width="2%" align="left">Details</td>
	</tr>
<%
    if(vStatus4.size()>0)
	{
      for ( int ii = 0; ii < vStatus4.size(); ii++ ) 
        {

		String[] data4 = (String [])vStatus4.get(ii);
%>
  <tr>
	<td height="20" valign="top" align="left"><span class="small">
      <textarea name="inVendor<%=ii+1%>" id="inVendor<%=ii+1%>" cols="25" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.inVendor<%=ii+1%>,'inVendorChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.inVendor<%=ii+1%>,'inVendorChar<%=ii+1%>',50)" ><%=data4[2]%></textarea>   
	  </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="inVendorChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="inPo<%=ii+1%>" id="inPo<%=ii+1%>"cols="25" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.inPo<%=ii+1%>,'inPoChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.inPo1,'inPoChar1',50)"><%=data4[3]%></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="inPoChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="inTotalSpend<%=ii+1%>" id="inTotalSpend<%=ii+1%>"cols="25" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.inTotalSpend<%=ii+1%>,'inTotalSpendChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.inTotalSpend<%=ii+1%>,'inTotalSpendChar<%=ii+1%>',50)"><%=data4[4]%></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="inTotalSpendChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="inMisc<%=ii+1%>"  id="inMisc<%=ii+1%>" cols="25" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.inMisc<%=ii+1%>,'inMiscChar<%=ii+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.inMisc<%=ii+1%>,'inMiscChar<%=ii+1%>',50)"><%=data4[5]%></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="inMiscChar<%=ii+1%>" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

  </tr>
<%
   
} }

%> 
   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="in" onclick="addRowIn()" class="bold">
   <input type="button" value="  Remove Row   " name="in" onclick="delRowIn()" class="bold"></td></tr>
   <input type="hidden" name="countIn" value="<%=vStatus4.size()%>" />	

 </table>

<!--END Innovation-->
<table width="100%" border="0" cellpadding="2" cellspacing="2">
	<tr>
		<td width="55%" height="30" colspan="2" bgcolor="#ffffff" class="greyBG">ADDITIONAL ATTACHMENT</td>
	</tr>
	<tr>
        <td>
            <table  width="100%"  border="1" cellpadding="2" cellspacing="0" bordercolor="#f0f0f0">			
                <tbody>
                    <tr>
                        <td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('compulsory','<%=priceid%>');" > <img src="../images/attachmentNp.png" border="0" /></a> </td>	
                    </tr>	
                    <tr>
                        <td colspan="2"  id="attachment"></td>												
                    </tr>
                </tbody>				
            </table>
        </td>
        <td>
            <table width="100%" bgcolor="#ffffff" border="1" cellpadding="2" cellspacing="0" bordercolor="#f0f0f0">			

                <tbody>
                    <tr>
                        <td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('additional','<%=priceid%>');" ><img src="../images/attachmentNp.png" border="0" /></a> </td>	
                    </tr>	
                    <tr>
                        <td colspan="2"  id="attachment1"></td>											
                    </tr>
                </tbody>			
            </table>
        </td>
    </tr>
</table>
<HR>
			<input name="flag" id="flag" type="hidden" value="<%=flag%>" /> 

<table width="100%" bgcolor="#ffffff" border="0" cellpadding="2" cellspacing="2">
	<tr>
		<td width="55%" height="50" colspan="2" bgcolor="#ffffff" class="greyBG">RECOMMENDATION</td>
	</tr>
	<tr>
	<td  width="55%" height ="25" rowspan="4" align="left" valign="middle">
	<textarea name="recommendation" id="recommendation" maxlength="3000" cols="55" rows="12" onkeydown="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" onkeyup="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" style ="height:170px;width:96%"  onfocus="showFixedAttachmentFile('1','<%=priceid%>','<%=userEmailid%>','<%=STATUS%>','<%=compAttachmentName%>','<%=addAttachmentName%>','<%=flag%>')"><%=RECOMMENDATION == null ? "" : RECOMMENDATION%></textarea>
	<div>
	<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td id="recommendationChar" width="3%" class="small">3000
		</td>
		<td class="small">&nbsp;Chars Left
		</td>
	</tr>
	</table>
	</div>
	</td>
	</tr>
</table>
<HR>

<table width="100%" border="0" cellpadding="2" cellspacing="2">

 
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

<%if(flag.equals("E")){%>

<%@ include file="includes/editApprovers.jsp"%>

<%}else{%>

<%@ include file="includes/draftApprovers.jsp"%>


<%}%>


<%if(flag.equals("E")){%>

        <tr>

              <td align="right"><input name="editPage" onclick="validateForm(3);" type="button" class="bold" id="editPage" value="Submit" />
                <input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" />
            </td>
        </tr>
<%}else{%>
        <tr>
          <td align="right" valign="middle"><input name="savedraft2" onclick="saveDraftOsp(2);" type="button" class="bold" id="savedraft2" value="Save Draft" />
                <input name="submitForm" onclick="validateForm(2);" type="button" class="bold" id="submitForm" value="Submit" />            </td>
          <td><input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" /></td>
        </tr>

<%}%>
      </table>
      
	</td>
  </tr>

<p>&nbsp;</p>
<table width="100%" cellpadding="0" cellspacing="0" >
</tbody>
<br>
</form>
</body>
</html>