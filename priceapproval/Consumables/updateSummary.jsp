<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.text.SimpleDateFormat,java.util.GregorianCalendar,java.util.Calendar, java.util.Date,java.text.*" %>
<%@ page import="com.bccl.util.Utility,com.bccl.util.HtmlUtil,com.bccl.util.AESencrp"%>
<%@ page import = "java.util.*"%>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ include file="../includes/idCategory.jsp"%>

<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" >

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - Consumables</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="css/custom.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="jscripts/consumables.js"></script>

<script type="text/javascript">
var counter = 1;
var counter1 = 1;
var rcounter=14;
function addRow(addType)
{

	  counter = document.priceApprovalMain.count.value;

  counter = parseInt(counter) + 1;

  document.priceApprovalMain.count.value = counter;

  tabBody = document.getElementById("inputtable");
  row	  = document.createElement("TR");

 cell1   = document.createElement("TD");
  cell1.innerHTML = counter;
  row.appendChild(cell1);



  cell1   = document.createElement("TD");
  cell1.innerHTML = "<textarea type='text' name='attach"+counter+"' id='attach"+counter+"'  class='small'  cols='20' maxlength='50' readonly='readonly' ></textarea><a href='#' onclick=\"upload(\'attach"+counter+"\')\"><img src='../images/attachment.gif' border='0' /></a><span class='redsmall' valign='top'>&#42&nbsp;</span><input name='attach"+counter+"New' type='hidden' id='attach"+counter+"New' value='' />";
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
  cell1.innerHTML = "<span class='small'><select  name='attachType"+counter+"' id='attachType"+counter+"' class='small selectboxheight'> '<option value='PAR Main Template'>PAR Main Template</option>' '<option value='Supporting Document'>Supporting Document</option>'  '<option value='Vendor Comparative'>Vendor Comparative</option>'  </select>";
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


		String DPATH        = EnvironmentProperties.getValue("priceapproval", "uploadPath");

		String summarryId		= (String)request.getParameter("summarryId");

		String display						= "NA";

	    String userEmailid  = "";


		ArrayList vStatus	=  new ArrayList();
	
		vStatus 			=	priceApprovalWebController.viewSummaryAttachments(summarryId);



		ArrayList vStatus1	=  new ArrayList();
	
		vStatus1 			=	priceApprovalWebController.viewSummaryParLst(summarryId);

		String lstPar =	"";





if(vStatus1.size() > 0){
	for(int i=0;i<vStatus1.size();i++)
	{
        String[] data2 = (String [])vStatus1.get(i);
		
		//lstComps += "<option value=\""+companyDataArry[0]+"\" "+(COMPANY.equals(companyDataArry[0])? "SELECTED":"")+">"+companyDataArry[2]+"</option>";
			lstPar += "<option value=\""+data2[0]+"\" SELECTED>"+data2[0]+"</option>";

	}
}
	Hashtable dataHash = new Hashtable();
	ArrayList parList	=  new ArrayList();
	String parDataArry[] = null;
	
	//dataHash.put("STATUS","A");

	parList =	priceApprovalWebController.lstOfPar();

	if(parList.size()>0)
	{
		for(int kk= 0; kk<parList.size(); kk++)
		{
			parDataArry   = (String[])parList.get(kk);
			lstPar += "<option value=\""+parDataArry[0]+"\">"+parDataArry[0]+"</option>";
		}
	}


%>

<body>

<form name="priceApprovalMain" method="post" action="">

<table width="100%" cellspacing="2" cellpadding="2" border="0">
	<tr>
	</tr>
	
	<tr>

    <td align="left" width="3%"   class="normal"><span class="small">Select Purchase id's:</span></td>
		<td width="25%" align="left">
		<span class="small">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr>
				<td width="15%">
					<!-- <input type="text" name="parvalue" id="parvalue" class="small" maxlength="10" onkeydown=""/> -->

				<select class="small" id="parList" name="parList" multiple style="width:120px;" >
				<option value="0">Select Purchase Id</option>
				<%=lstPar%>
				</select>							

			</td>
				
				
				</tr>
			</table>
		</span>
			
	</tr>
<!--ATTACHMENTS-->
<table width="100%" cellspacing="2" cellpadding="2" border="0">

	<tr>
		<td height="26" colspan="100%" bgcolor="#fbf9f9" class="travelMenuBG">ATTACHMENTS:</td>
	</tr>
	<tr class="greyBG">
		<td width="2%" height="29" >Sr.No</td>
		<td width="4%" align="left">File Name</td>
		<td width="8%" align="left">File Description</td>
		<td width="10%" align="left">Type Of Document</td>
	</tr>

<tbody id="inputtable">
<%
    for(int q=0;q<vStatus.size();q++)
    {
        String[] data2 = (String [])vStatus.get(q);	
		
		String	ATTACHMENT	= data2[1];
		String	FILEDESC	= data2[2];
		String	ATTACHTYPE	= data2[3];


			if(!(ATTACHMENT.equals("NA.NA_NA")))
			{
			 String st1 = ATTACHMENT.substring(0, ATTACHMENT.lastIndexOf("."));
			 String st2 = ATTACHMENT.substring(ATTACHMENT.lastIndexOf(".")+1,ATTACHMENT.length());
			 String st3 = st1.substring(0, ATTACHMENT.lastIndexOf("_"));
			 //display = st3 + "." + st2;
			 display = ATTACHMENT;
			}
%>

<tr>
	<td height="25" valign="top" align="left" ><%=q+1%></td>

   <td  height="25" align="left" valign="top"><textarea name="attach<%=q+1%>" type="text" class="small" id="attach<%=q+1%>" readonly="readonly"><%=!display.equals("NA.NA_NA")?display:""%></textarea><a href="#" onclick="upload('attach<%=q+1%>')"><img src="../images/attachment.gif" border="0" /></a></a><input name="attach<%=q+1%>New" type="hidden" id="attach<%=q+1%>New" value="<%=!display.equals("NA.NA_NA")?ATTACHMENT:""%>" /></td>
	
	<td height="25" valign="top" align="left">
	<span class="small">
		<textarea name="fileDesc<%=q+1%>" id="fileDesc<%=q+1%>" cols="25"  rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.fileDesc<%=q+1%>,'fileDescChar<%=q+1%>',50)" onkeyup="textCounter(document.priceApprovalMain.fileDesc<%=q+1%>,'fileDescChar<%=q+1%>',50)"><%=FILEDESC%></textarea>
	</span>
	<div>
		<table width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td id="fileDescChar<%=q+1%>" width="10%" class="small">50</td>
			<td align="left" class="small">&nbsp;Chars Left</td></tr>
		</table>
	</div>
	</td>

   <td height="25" valign="top" align="left">
	<span class="small">
		<select name="attachType<%=q+1%>" id="attachType<%=q+1%>"  class="small selectboxheight" height="25">
        <option value="Supporting Document"  <%if(ATTACHTYPE.equals("Supporting Document")){%>selected="selected"<%}%>>Supporting Document</option>
        <option value="Summary Sheet"  <%if(ATTACHTYPE.equals("Summary Sheet")){%>selected="selected"<%}%>>Summary Sheet</option>
		</select>
	</span>
	</td>
</tr>
<%
	
	}   
%>
</tbody>
	<tr>
		<td colspan="5" height="10" style="text-align:right;">
			<input  type="button" value="Add Row" name="add" onclick="addRow('S')" class="bold">
			<input type="button" value="Remove Row" name="add" onclick="delRow()" class="bold">
			<input type="hidden" name="count" value="<%=vStatus.size()%>" />	
			<input type="hidden" name="userstatus" value="UC" />	
			<input type="hidden" name="summarryId" value="<%=summarryId%>" />	
		</td>
   </tr>
</table>






  </table>




      <table width="100%" border="0" cellspacing="4" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;</td>
          
        </tr>
        <tr>
          <td align="center" width="10%" colspan="1">
		  <input  name="savedraft1" class="bold" type="button"  id="savedraft1" value="Save Draft" onclick="saveSummaryDraft(2);" />
		  <input name="submitForm"  type="button" class="bold" id="submitForm" onclick="saveSummaryDraft(3);" value="Submit" />
		  <input type="reset" class="bold" id="" value="Reset" />
		  </td>
         
        </tr>
      </table>
</form >
</body>
</html>