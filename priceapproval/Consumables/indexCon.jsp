<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ include file="../includes/idCategory.jsp"%>

<%//@ page errorPage="../../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<% int flg = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" >

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - Consumables</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="css/custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../jscripts/jquery.js"></script>
<script Language="JavaScript" src="jscripts/consumables.js"></script>


<script type="text/javascript">
var counter = 1;
var counter1 = 1;
var rcounter=14;
function addRow(addType)
{
  counter = parseInt(counter) + 1;

  document.priceApprovalMain.count.value = counter;

  tabBody = document.getElementById("inputtable");
  row	  = document.createElement("TR");

 cell1   = document.createElement("TD");
  cell1.innerHTML = counter;
  row.appendChild(cell1);



  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='text' name='attach"+counter+"' id='attach"+counter+"'  class='small'  cols='20' maxlength='50' readonly='readonly' ></textarea><a href='#' onclick=\"upload(\'attach"+counter+"\')\"><img src='../images/attachment.gif' border='0' /></a><input name='attach"+counter+"New' type='hidden' id='attach"+counter+"New' value='' />";
  row.appendChild(cell1);



  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='textbox' name='fileDesc"+counter+"' id='fileDesc"+counter+"'class='small'  cols='25' maxlength='50' onkeydown=\"textCounter(document.priceApprovalMain.fileDesc"+counter+",'fileDescChar"+counter+"',50)\" onkeyup=\"textCounter(document.priceApprovalMain.fileDesc"+counter+",'fileDescChar"+counter+"',50)\"  ></textarea><div><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td id=\"fileDescChar"+counter+"\" width=\"10%\" class=\"small\">50</td><td align=\"left\" class=\"small\">&nbsp;Chars Left</td></tr></table></div> ";
  row.appendChild(cell1);

  if(addType =='S'){


  cell1   = document.createElement("TD");
  cell1.innerHTML = "<span class='small'><select  name='attachType"+counter+"' id='attachType"+counter+"' class='small selectboxheight'>  '<option value='Supporting Document'>Supporting Document</option>'  '<option value='Summary Sheet'>Summary Sheet</option>' </select>";
  row.appendChild(cell1);

  tabBody.appendChild(row);
  }else{

  cell1   = document.createElement("TD");
  cell1.innerHTML = "<span class='small'><select  name='attachType"+counter+"' id='attachType"+counter+"' class='small selectboxheight'> '<option value='PAR Main Template'>PAR Main Template</option>' '<option value='Supporting Document'>Supporting Document</option>' </select>";
  row.appendChild(cell1);

  tabBody.appendChild(row);

  }
}

function delRow()
{
		  counter = document.priceApprovalMain.count.value;

	if(counter > 1)
	{
		document.getElementById("inputtable").deleteRow(counter -1 );
		counter = counter - 1;
		document.priceApprovalMain.count.value = counter;
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

<body onload="javascript:viewSabCon();<%if(checkAdmin){%>showAllRequests()<%flg = 1;}%>">
<form name="priceApprovalMain" method="post" action="">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
<%@ include file="../includes/relatedlinks.jsp"%>

  </tr>
  <tr>
    <td height="38"><img src="../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">C O N S U M A B L E S</td>
        </tr>
        <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">Supported By / Approved By</td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG" align="right"><a href="javascript:viewSabCon();showAllRequests();" style="text-decoration: none;">&nbsp;Refresh<img src="../images/refresh.png" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="../images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="../images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /> --></td>
          </tr>
			<tr>
			<td height="10" class="normal" align="right"><a href="#" onclick="javascript:window.open('common/viewSabpprovedHistoryCon.jsp','','resizable=yes,scrollbars=yes,height=800,width=1200')"><b>Approvers Status</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:window.open('common/viewStatusCon.jsp','','resizable=yes,scrollbars=yes,height=800,width=2100')"><b>Buyers Status</b></a>&nbsp;&nbsp;&nbsp;</td>

			</tr>
		  <tr>
		<td>
		<table width="100%" cellspacing="2" cellpadding="2" border="0">
        <tr class="greyBG">
            <td width="3%" height="29" >Sr. No</td>
            <td width="10%" align="left">CATEGORY</td> 
            <td width="13%" align="left">PURCHASE APPROVAL ID</td>    
            <td width="15%" align="left">PAR VALUE</td>
            <td width="15%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="8%" align="left">STATUS</td>
            <td width="20%" align="middle">ACTION</td>

        </tr>
		<tr><td id = "sab" width="100%" colspan="8" height="60" ></td></tr>  
		 <tr>
          <td height="25" valign="top" align="left">&nbsp;</td>
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
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="../images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="../images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /> --></td>
          </tr>
				<tr><td height="10" colspan="5"></td></tr>
		  
	<table width="100%" cellspacing="2" cellpadding="2" >
       <tr class="greyBG">
			<td width="3%" height="29" >Sr. No</td>
            <td width="10%" align="left">CATEGORY </td> 
            <td width="13%" align="left">PURCHASE APPROVAL ID</td>    
            <td width="15%" align="left">PAR VALUE</td>
            <td width="15%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="8%" align="left">STATUS</td>
            <td width="20%" align="center"colspan="2">ACTION</td>
	</tr>

		<tr><td id = "allProcess" width="100%" colspan="8" height="20%"></td></tr>
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
	 <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
	 <table width="100%" cellspacing="2" cellpadding="2" >
        <tr class="greyBG">
			<td width="3%" height="29" >Sr. No</td>
            <td width="10%" align="left">SUMMARY ID</td> 
            <td width="13%" align="left">PURCHASE APPROVAL ID</td>    
            <td width="15%" align="left">PAR VALUE</td>
            <td width="15%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="8%" align="left">STATUS</td>
            <td width="20%" align="center" colspan="2">ACTION</td>
	</tr>

		<tr><td id = "allsummeryProcess" width="100%" colspan="8" height="60%"></td></tr>
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
</table>

		
<%}%>
<table width="100%" border = "0"  cellspacing="1" cellpadding="2" >
  <tr bgcolor="#fbf9f9"  class="travelMenuBG" height="30">
     <td  align="left" width="3%" class="travelMenuBG">Type Of Document :</td>
	 <td  align="left" width="1%" class="travelMenuBG"><select class="small" id="docType" name="docType" style="width:100px;">
            <option value="0">Select</option>
            <option value="PAR">PAR</option>
            <option value="Summary">Summary</option>
         </select>
        </td>	
	 <td  align="left" width="18%"><a href="javascript:void(0)" onclick="loadPage();"><img src="../images/but_go.gif" border="0" /></a></td>	
	</tr>

</table>
<span id="showRequests"></span>
</form >
</body>
</html>