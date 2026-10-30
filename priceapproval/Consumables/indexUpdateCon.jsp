<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ include file="../includes/idCategory.jsp"%>

<%//@ page errorPage="../../common/errorPage.jsp"%>
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
  cell1.innerHTML = "<textarea type='text' name='attach"+counter+"' id='attach"+counter+"'  class='small'  cols='20' maxlength='50' readonly='readonly' ></textarea><a href='#' onclick=\"upload(\'attach"+counter+"\')\"><img src='../images/attachment.gif' border='0' /></a><span class='redsmall' valign='top'></span><input name='attach"+counter+"New' type='hidden' id='attach"+counter+"New' value='' />";
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
  cell1.innerHTML = "<span class='small'><select  name='attachType"+counter+"' id='attachType"+counter+"' class='small selectboxheight'> '<option value='PAR Main Template'>PAR Main Template</option>' '<option value='Supporting Document'>Supporting Document</option>'  '<option value='Vendor Comparative'>Vendor Comparative</option>' </select>";
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

	    String userEmailid  = "";

		String timescapeUId = Long.toString(timescapeUserOId);
	    		
		String tOId			= (String)request.getParameter("tOId");

		String priceid		= (String)request.getParameter("priceid");



		ArrayList vStatus	=  new ArrayList();
	
		vStatus 			=	priceApprovalWebController.viewStatusCon(tOId,priceid);




		ArrayList vStatus4	=  new ArrayList();
	
		vStatus4 			=	priceApprovalWebController.viewAttachments(tOId,priceid);

		ArrayList vStatus5	=  new ArrayList();
	
		vStatus5 			=	priceApprovalWebController.viewApproverDetailsCon(tOId,priceid);

	
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


		String CATEGORY						= data1[1];
		String PARVALUE						= data1[2];
		String SUMMARYSHEETCHK				= data1[3];
		String AP11     					= data1[4];
		String AP12					        = data1[5];
		String AP13					        = data1[6];
		String AP21					        = data1[7];
		String AP22					        = data1[8];
		String AP23					        = data1[9];
		String AP31					        = data1[10];
		String AP32					        = data1[11];
		String AP33					        = data1[12];
		String AP34					        = data1[13];
		String AP35					        = data1[14];
		String AP36					        = data1[15];
		String AP4					        = data1[16];
		String AP5					        = data1[17];
		String AP6					        = data1[18];
		String AP7					        = data1[19];
		String AP8					        = data1[20];

		String APPROVER11					= data1[27];
		String APPROVER12					= data1[28];
		String APPROVER13					= data1[29];
		String APPROVER21					= data1[30];
		String APPROVER22					= data1[31];
		String APPROVER23					= data1[32];
		String APPROVER31					= data1[33];
		String APPROVER32					= data1[34];
		String APPROVER33					= data1[35];
		String APPROVER34					= data1[36];
		String APPROVER35					= data1[37];
		String APPROVER36					= data1[38];

		String APPROVER4					= data1[39];
		String APPROVER5					= data1[40];
		String APPROVER6					= data1[41];
		String APPROVER7					= data1[42];
		String APPROVER8					= data1[43];

       	String CREATEDBY					= data1[21];
		String CREATEDON					= data1[22];
		String MODIFIEDBY					= data1[23];	
		String MODIFIEDON					= data1[24];
		String STATUS						= data1[25];
		       userEmailid				    = data1[44];
		String COMPANY					    = data1[45];

        String INITIATORNAME				= data1[26];
        String INITIATEDON					= data1[22];
        String checked					= "";


		if (userEmailid.indexOf("@") > -1) {
        userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
	    } 

	if(SUMMARYSHEETCHK.equals("YES")) {
	checked = "checked";
	}else{
	checked = "";

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

		String display						= "NA";



	Hashtable dataHash = new Hashtable();
	ArrayList catList	=  new ArrayList();
	String catDataArry[] = null;
	String lstCat = "";

	//dataHash.put("STATUS","A");

	catList =	priceApprovalWebController.categoryLst();

	if(catList.size()>0)
	{
		for(int kk= 0; kk<catList.size(); kk++)
		{
			catDataArry   = (String[])catList.get(kk);
			lstCat += "<option value=\""+catDataArry[0]+"\" "+(CATEGORY.equals(catDataArry[0])? "SELECTED":"")+">"+catDataArry[0]+"</option>";
		}
	}

    String label1="";
    String label2="";
    String label3="";
    String label4="";

    if(COMPANY.equals("1000"))
    {
        //label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">(Delegated Authority) &nbsp; &#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
       // label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        label1 = "<span class=\"small\"><strong>Director B&C</strong></span>";
        //label2 = "<span class=\"small\"><strong>Executive Director</strong></span>";
        label2 = "<span class=\"small\"><strong>COO (Publishing)</strong></span>";
        label3 = "<span class=\"small\"><strong>COO</strong></span>";
        //label4 = "<span class=\"small\"><strong>CEC & ED</strong></span>";
        label4 = "<span class=\"small\"><strong>CEO (Publishing)</strong></span>";
    }else{
        label1  ="<span class=\"small\">Group Company CEO/COO</span>";
        label2 = "<span class=\"small\">Director B&C</span>";
        //label2 = "<span class=\"small\">Director B&C</span><span class=\"redsmall\" id=\"changeLabel2\"><br>(Delegated Authority)</span>";
        //label3 = "<span class=\"small\">Executive Director</span>";
        label3 = "<span class=\"small\">COO (Publishing)</span>";
        //label4 = "<span class=\"small\">CEC & ED - BCCL</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";

    }



%>
<body onload="javascript:viewSabCon()">
<form name="priceApprovalMain" method="post" action="">


<table width="100%" cellspacing="2" cellpadding="2" border="0">
	<tr>
		<td  align="left" width="3%"   class="normal"><span class="redsmall">*&nbsp;-&nbsp;mandatory</span></td>
	</tr>
	
	<tr>
    <td width="2%" height="27"  ><span class="small" id="top">Category</span></td>
    <td width="10%" align="left">
		<span class="small">
			<select name="category" id="category" align="left" class="small selectboxheight" height="25">
				<%=lstCat%>
			</select>
		</span>
		
		
	</td>
    <td align="left" width="4%"   class="normal"><span class="small">PAR Value:</span></td>
		<td width="25%" align="left">
		<span class="small">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr>
				<td width="15%">
					<input type="number" name="parvalue" id="parvalue" class="small" maxlength="10" value="<%=PARVALUE == null ? "" : PARVALUE%>"/>
				<td width="3%"><font size="3" color="red"></font></td>
				<td id="" align="left" width="3%" class="small">10</td>
				<td align="left" class="small">Chars Left</td>
				</tr>
			</table>
		</span>
		
		
		
		</td>

			<td height="10" valign="top" align="left" class="normal">

		<input height="15" type="checkbox" name="summarySheetChk"  id="summarySheetChk" class="normal" value="" <%=checked%>/ ><span style="margin-top:0px;">Summary Sheet</span>
	
	
	</td>	
	</tr>
  </table>
<!--end dropdowns-->
<hr>

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
    for(int q=0;q<vStatus4.size();q++)
    {
        String[] data2 = (String [])vStatus4.get(q);	
		
		String	ATTACHMENT	= data2[1];
		String	FILEDESC	= data2[2];
		String	ATTACHTYPE	= data2[3];


			if(!(ATTACHMENT.equals("NA.NA_NA")))
			{
			 String st1 = ATTACHMENT.substring(0, ATTACHMENT.lastIndexOf("."));
			 String st2 = ATTACHMENT.substring(ATTACHMENT.lastIndexOf(".")+1,ATTACHMENT.length());
			 String st3 = st1.substring(0, ATTACHMENT.lastIndexOf("_"));
			 display = st3 + "." + st2;
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
        <option value="PAR Main Template"  <%if(ATTACHTYPE.equals("PAR Main Template")){%>selected="selected"<%}%>>PAR Main Template</option>
        <option value="Supporting Document"  <%if(ATTACHTYPE.equals("Supporting Document")){%>selected="selected"<%}%>>Supporting Document</option>
        <!-- <option value="Vendor Comparative"  <%if(ATTACHTYPE.equals("Vendor Comparative")){%>selected="selected"<%}%>>Vendor Comparative</option> -->
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
			<input  type="button" value="Add Row" name="add" onclick="addRow('P')" class="bold">
			<input type="button" value="Remove Row" name="add" onclick="delRow()" class="bold">
			<input type="hidden" name="count" value="<%=vStatus4.size()%>" />	
			<input type="hidden" name="priceId" value="<%=priceid%>" />	
			<input type="hidden" name="userPrevStatus" id="userPrevStatus" value="<%=STATUS%>" />	
		</td>
   </tr>
</table>


<hr>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="52%" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="2" cellspacing="2">
     
      <tr>
        <td height="22" bgcolor="#ffffff" class="greyBG">APPROVALS</td>
        </tr>
    </table>
      <table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="12%" >B&amp;C<span class="small"></span><span class="redsmall">&nbsp;*&nbsp;</span></td>
          <td width="11%" height="29" >Category Head<!-- (min 1) --></span></td>
          <td width="11%" align="left" colspan='2'>SUPPORTED BY <!-- <span class="redsmall"><span class="small">LEVEL 1</span> (min 1)</span> --></td>
            <td width="12%" align="left"><%=label1%><!-- <span class="small" id="changeLabel1">Director B&C</span><br><span class="redsmall" id="changeLabel2">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span> --></td>
          <td width="12%" align="left"><%=label2%><!-- <span class="small" id="changeLabel3">EP Supply Chain</span> --></td>
          <td width="12%" align="left"><%=label3%><!-- <span class="small" id="changeLabel4">COO</span> --></td>
          <td width="12%" align="left"><%=label4%><!-- <span class="small">CEO/CEC</span> --></td>
          <td width="12%" align="left"><span class="small"><strong>Managing Director</strong> </span></td>
        </tr>
		<td colspan="2">&nbsp;</td>
		<td class = "small" height = "15" >&nbsp;<b>Name</b>
		</td>
		<td class = "small" height = "15" >&nbsp;<b>Role</b>
		</td>	
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app1" id="app1" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER11==null?"":APPROVER11%>">
			  <input  name = "app1H" id="app1H" type="hidden" value="<%=AP11==null?"":AP11%>" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER12==null?"":APPROVER12%>">
			 <input  name = "app2H" id="app2H" type="hidden" value="<%=AP12==null?"":AP12%>" />
		  </td>
<%
		ArrayList approverList   = new ArrayList();
		String str          = ""; 
		int i = 0;
        String roleType     ="";
        String selected="";
        Hashtable approverData  = new Hashtable();
%>

		  <!-- <td  class = "normal"  height = "25" align="left">
		 <input type = "text" name = "app11" id="app11"  class = "normal" size="26" onClick="addUser('approvedby',this.id)"  value="<%//=APPROVER35==null?"":APPROVER35%>"  class = "normal" >
		<input  name = "app11H" id="app11H" type="hidden" value="<%//=AP35==null?"":AP35%>"  / ></td>
		 <td class = "normal" height = "25" align="left">HR/Personnel</td> -->

 <td class = "normal" height = "25"  align="left">
		<select name="app3" id="app3" class = "normal" style="width:174px;">
			<option value="0">Select</option>
<%
			   roleType    =   "MAS 1";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
%>
		<option value="<%=tempArr[2]%>" <%if(AP13.equals(tempArr[2])){%>selected="selected"<%}%>><%=tempArr[3]%></option>
<%
		}
%>
        </select>
		
		</td> 

		   <td class = "normal" height = "25" width="10%" align="left">MAS 1 </td>



          <td rowspan="3" align="left" valign="top" class="small"><span class="boldunderline_small">
            <select name="select12" class="small" id="select12" style="width:130px;">
        <option value="0">Select</option>
	    <!-- <option value="20411" <%//if(AP4.equals("20411")){%>selected="selected"<%//}%>>Shyam Shanker</option> -->
                    <%=app4%>
	  </select>
			</span></td>
          <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">

<select name="select13" class="small" id="select13" style="width:130px;">
		<option value="0">Select</option>	
	  <!-- <option value="3459" <%//if(AP5.equals("3459")){%>selected="selected"<%//}%>>Mohit Jain</option> -->
	        <%=app5%>
      </select> 
     </span></td>


         <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select14" class="small" id="select14" style="width:130px;">
		<option value="0">Select</option>
         <!-- <option value="31891" <%//if(AP6.equals("31891")){%>selected="selected"<%//}%>>Shrijeet Mishra</option> -->
                 <%=app6%>
	  </select>         </span></td>

		<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select15" class="small" id="select15" style="width:130px;">
		<option value="0">Select</option>
         <!-- <option value="48795" <%//if(AP7.equals("48795")){%>selected="selected"<%//}%>>Raj Jain</option> -->
                <%=app7%>
		</select> </span></td>



	    <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select16" class="small" id="select16" style="width:130px;">
		<option value="0">Select</option>
     <!--  <option value="3459" <%if(AP6.equals("3459")){%>selected="selected"<%}%>>Mohit Jain</option>
      <option value="20411" <%if(AP6.equals("20411")){%>selected="selected"<%}%>>Shyam Shanker</option> -->
	   <option value="29616" <%if(AP8.equals("29616")){%>selected="selected"<%}%>>Vineet Jain</option>
        </select>         </span></td>
        </tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER21==null?"":APPROVER21%>">
			  <input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
		 </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER22==null?"":APPROVER22%>">
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />

		  <!-- <td  class = "normal"  height = "25" align="left">
		 <input type = "text" name = "app12" id="app12"  class = "normal" size="26" onClick="addUser('approvedby',this.id)" value="<%//=APPROVER36==null?"":APPROVER36%>" >
		<input  name = "app12H" id="app12H" type="hidden" value="<%//=AP36==null?"":AP36%>"  /></td>
		 <td class = "normal" height = "25" align="left">Branch Head</td> -->


  <td class = "normal" height = "25"  align="left">
		<select name = "app6" id="app6" class = "normal" style="width:174px;">
			<option value="0"> Select</option>
<%
			   roleType    =   "MAS 2";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);

%>
		<option value="<%=tempArr[2]%>" <%if(AP23.equals(tempArr[2])){%>selected="selected"<%}%>><%=tempArr[3]%></option>
<%
		}
%>
        </select>
		</td> 
		  <td class = "normal" height = "25" width="10%" align="left">MAS 2</td>


        </tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER31==null?"":APPROVER31%>">
			  <input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER32==null?"":APPROVER32%>">
			  <input  name = "app8H" id="app8H" type="hidden" value="<%=AP32==null?"":AP32%>" />
		  </td>

			  <td class = "normal" height = "25"  align="left">
		<select name = "app9" id="app9" class = "normal" style="width:174px;">
			<option value="0">Select</option>
<%
			   roleType    =   "Finance 1";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
%>
		<option value="<%=tempArr[2]%>" <%if(AP33.equals(tempArr[2])){%>selected="selected"<%}%>><%=tempArr[3]%></option>
<%
		}
%>
        </select>
		  </td>
			  <td class = "normal" height = "25" width="10%" align="left">Finance 1</td>
		 
        </tr>
		<tr class="small">
		  <td colspan="2" >&nbsp;</td>

	  <td class = "normal" height = "25"  align="left">
		<select name = "app10" id="app10" class = "normal" style="width:174px;">
			<option value="0"> Select</option>
<%
			   roleType    =   "Finance 2";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
%>
		<option value="<%=tempArr[2]%>" <%if(AP34.equals(tempArr[2])){%>selected="selected"<%}%>><%=tempArr[3]%></option>
<%
		}
%>
        </select>
		  </td>
		  <td class = "normal" height = "25" width="10%" align="left">Finance 2</td>
        </tr>
		<tr>
		 <td></td>
		 <td></td>
		
        </tr>
		<tr>
		 <td></td>
		 <td></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="4" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;</td>
          <td width="50%">&nbsp;</td>
        </tr>
        <tr>
		<td align="right" valign="middle">
			<input name="submitForm" id="submitForm"onclick="validateForm(2);" type="button" class="bold"  value="Submit" /></td>
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