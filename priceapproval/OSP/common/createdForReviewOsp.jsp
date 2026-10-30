<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="../../includes/sessionCheck.jsp"%>
<% //@ page errorPage="common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<% int flg = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Special Review</title>
<link href="../css/global.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>

<script Language="JavaScript" src="../../jscripts/osp.js"></script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.normal {
	FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 9pt; FONT-WEIGHT: normal; TEXT-DECORATION: none
}

.nav {
	TEXT-TRANSFORM: none; FONT-VARIANT: normal; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 11px; FONT-WEIGHT: bold; TEXT-DECORATION: none
}
.travelMenuBG {
	FONT-SIZE: 8 pt;
	
}


/* Tool tip css */
.ToolText{position:relative; }
.ToolTextHover{position:relative;z-index:1;}
.ToolText span#test{display: none;}

.ToolTextHover span#test{
  display:block;
  position:absolute;
  border:1px solid black;
  /* top:1.3em;*/
  right:0;
  bottom:50px;
  background-color:#333333; color:white;
  font-size:8pt;
  font-family:Verdana, Arial, Helvetica, sans-serif;
  text-align: justify;
  width:300px;


  /* css ends here */
}
</style>
</head>
<%
        String tOId			= (String)request.getParameter("tOId");

		String priceid		= (String)request.getParameter("priceid");
		String splId		= (String)request.getParameter("splId");
//System.out.println(priceid);

	String approverType = request.getParameter("approverType");

        ArrayList vStatus	=  new ArrayList();

        vStatus 			=	priceApprovalWebController.viewStatusOsp(tOId,priceid);

        ArrayList vStatus5	=  new ArrayList();

        vStatus5 			=	priceApprovalWebController.viewApproverDetailsOsp(tOId,priceid);

        String[] data1		= (String [])vStatus.get(0);

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
		String TOCONTRACTVALIDITY         	= data1[59];
		String DESCRIPTION			        = data1[6];
		//int negVal							= Integer.parseInt(NEGOTIATION_VALUE);
		String CONTRACTVALUE        		= data1[7];
		String USERGROUP				    = data1[8];
		String VENDORNAME					= data1[9];
		String TOTALBUDGET	                = data1[10];
		String PAYMENTTERMS				    = data1[11];
		String SANCTIONNOTE		            = data1[12];
		String SAVINGS  					= data1[13];
		String BACKGROUND		            = data1[14];
		String RECOMMENDATION				= data1[15];
		String AP11     					= data1[16];
		String AP12					        = data1[17];
		String AP13					        = data1[18];
		String AP21					        = data1[19];
		String AP22					        = data1[20];
		String AP23					        = data1[21];
		String AP31					        = data1[22];
		String AP32					        = data1[23];
		String AP33					        = data1[24];
		String AP34					        = data1[25];
		String AP35					        = data1[26];
		String AP36					        = data1[27];
		String AP4					        = data1[28];
		String AP5					        = data1[29];
		String AP6					        = data1[30];
		String AP7					        = data1[31];
		String AP8					        = data1[32];

		String APPROVER11					= data1[40];
		String APPROVER12					= data1[41];
		String APPROVER13					= data1[42];
		String APPROVER21					= data1[43];
		String APPROVER22					= data1[44];
		String APPROVER23					= data1[45];
		String APPROVER31					= data1[46];
		String APPROVER32					= data1[47];
		String APPROVER33					= data1[48];
		String APPROVER34					= data1[49];
		String APPROVER35					= data1[50];
		String APPROVER36					= data1[51];

		String APPROVER4					= data1[52];
		String APPROVER5					= data1[53];
		String APPROVER6					= data1[54];
		String APPROVER7					= data1[55];
		String APPROVER8					= data1[56];

       	String CREATEDBY					= data1[33];
		String CREATEDON					= data1[34];
		String MODIFIEDBY					= data1[35];	
		String MODIFIEDON					= data1[36];
        String COMPANY  					= data1[37];
		String STATUS						= data1[38];
		String userEmailid				    = data1[57];

        String INITIATORNAME				= data1[39];
        String INITIATEDON					= data1[34];
        String COMPANYNAME 					= data1[58];
		String compAttachmentName="compulsory";
		String addAttachmentName="additional";


       

		    



//String updatefromEmail ="";
String createdBy ="";
String createdFor ="";

String PrintRemarks = "";
		
		String rData[]       = null;
		ArrayList remarks1   = new ArrayList();
		String str1          = ""; 
		int ii = 0;	
		Hashtable remarksHash  = new Hashtable();
        remarksHash.put("SPLID",splId);
//System.out.println(splId);
        remarks1  = priceApprovalWebController.showSplRemarks(remarksHash);

        str1      = "<table width='100%' cellpadding='0' cellspacing='0'>";
         				   if(remarks1.size()>0)
				   {
						
						for(ii = 0; ii<remarks1.size(); ii++)
						{
							       rData   = (String[])remarks1.get(ii);
							       str1    = str1 + "<tr><td align='left' width='20px'>";
								   str1	  = str1 + rData[5];
								   str1	  = str1 + "</td></tr>";
								   str1	  = str1 + "<tr><td height='6px'></td></tr>";
								   str1	  = str1 + "<tr><td align='right' class='rdatacolor'>";
								   str1	  = str1 + "&nbsp;"+ rData[2];
								   str1	  = str1 + "&nbsp;&nbsp;"+ rData[3];
								   str1	  = str1 + "</td></tr>";
							}
							
						str1 = str1+ "</table>";
						//out.println(str1);
						PrintRemarks = str1;
                        //out.println("PrintRemarks= "+PrintRemarks);
				   }
				   else
				   {
					 // out.println("No Remarks");	
					  PrintRemarks= "No Remarks";
				   }
createdBy=rData[11];
createdFor=rData[12];
//out.println("createdBy= "+createdBy);	
//out.println("createdFor= "+createdFor);	
%>
<body>
<form name="createdforOsp" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="../../images/header_price1.jpg" width="842" height="44" /></td>
    <td width="23%" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="38"><img src="../../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>

</table>

<table  width="100%"  border="1" class="table1" cellpadding="2" cellspacing="0" align="center" bordercolor="#f0f0f0">
	<tr>
		<td  width="15%" height="20px" align="left" valign="middle"  class="greyBG">INITIATOR NAME : </td>
		<td  colspan="2"align="left" class="greyBG BreakWord" valign="middle"><%=INITIATORNAME%></td>
		<td align="left" class="greyBG" valign="middle">INITIATED ON :</td>
		<td colspan="2"  align="left" valign="middle" class="greyBG"><%=INITIATEDON%></td>
	</tr>

	<tr>
		<td   align="left" height="20px"valign="middle"  class="greyBG">SANCTIONED REF TYPE : </td>
		<td align="left" class="greyBG BreakWord" valign="middle"><%=SANCTIONEDREFTYPE%></td>
		<td  align="left" class="greyBG" valign="middle">REF NUMBER :</td>
		<td align="left" valign="middle" class="greyBG"><%=REFNUMBER%></td>
		<td  width="15%" align="left" class="greyBG" valign="middle">DATE OF APPROVAL :</td>
		<td align="left" valign="middle" class="greyBG"><%=DATEOFAPPROVAL%></td>
	</tr>
	<tr>
		<td  colspan="3" height="20px"align="center" valign="middle" class="greyBG"  >PROJECT DETAILS</td>
		<td  colspan="3"height="20px" align="center" valign="middle" class="greyBG"  >CONTRACT DETAILS</td>
	</tr>
	<tr>
		<td  align="left" valign="middle"  class="nav">Project name </td>
		<td  colspan="2" align="left" class="normal BreakWord" valign="middle"><%=PROJECTNAME%></td>
		<td align="left" class="nav" valign="middle">Contract Validity</td>
		<td  colspan="2"  align="left" valign="middle" class="normal"><%=FROMCONTRACTVALIDITY%> to <%=TOCONTRACTVALIDITY%></td>
	</tr>
	<tr>
		<td  align="left" valign="middle"  class="nav">Description</td>
		<td  colspan="2" align="left" class="normal BreakWord" valign="middle"><%=DESCRIPTION%></td>
		<td  align="left" class="nav" valign="middle">Contract value (Rs)</td>
		<td  colspan="2" align="left" class="normal " valign="middle"><%=CONTRACTVALUE%></td>
	</tr>
	<tr>
		<td  align="left" valign="middle"  class="nav">User group  </td>
		<td  colspan="2" align="left" class="normal" valign="middle"><%=USERGROUP%></td>
		<td  align="left" class="nav" valign="middle">Vendor name</td>
		<td colspan="2"  align="left" class="normal BreakWord" valign="middle"><%=VENDORNAME%></td>
	</tr>
	<tr>
		<td  align="left" valign="middle"  class="nav">Total Aop Budget (Rs.) :</td>
		<td colspan="2"  align="left" class="normal" valign="middle"><%=TOTALBUDGET%></td>
		<td  align="left" class="nav " valign="middle">Payment terms</td>
		<td colspan="2"  align="left" class="normal BreakWord" valign="middle"><%=PAYMENTTERMS%></td>
	</tr>
	<tr>
		<td  align="left" valign="middle"  class="nav">Sanction note status</td>
		<td colspan="2"  align="left" class="normal BreakWord" valign="middle"><%=SANCTIONNOTE%></td>
		<td  align="left" class="nav" valign="middle">Savings If any</td>
		<td colspan="2"  align="left" class="normal " valign="middle"><%=SAVINGS%></td>
	</tr>


</table>
  </tr>
<table width="100%" border="0" cellspacing="4" cellpadding="0">
  <tr>
    <td bgcolor="#e8e8e8" class="nav" width="5px"><img src="../../images/remarks1.jpg" width="25" height="125" /></td>
    <td colspan="8" class="small BreakWord bgrdatacolor" align="left" valign="top" width="95px" ><%=PrintRemarks%></td>
  </tr>
</table>
<br>
      <table width="100%" border="0" cellspacing="4" cellpadding="0">
<tr><td width="33%" align="right" valign="top" class="normal">Remarks :</td><td align="left"><textarea name="remarksContainer1" cols="50" rows="5" maxlength="2000" onkeydown="textCounter(document.createdfor.remarksContainer1,'lineCountDescription',2000)" onkeyup="textCounter(document.createdfor.remarksContainer1,'lineCountDescription',2000)" ></textarea></td>
<div><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td id="lineCountDescription"  class="small"  width="55%" align="right">2000</td><td align="left" class="small">&nbsp;Characters Left</td></tr></table></div>
</td></tr>
<table width="100%" border="0" cellspacing="4" cellpadding="0">
        <tr>
          <td align="center" valign="middle"><br><input name="submitForm1" onclick="createdForUpdateOsp();" type="button" class="bold" id="submitForm1" value="Submit" />&nbsp;&nbsp;<input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" /></td>
          <!-- <td></td> -->
        </tr>
      </table>
      
	</td>
  </tr>
<br>
<input  name = "app1H" id="app1H" type="hidden" value="<%=AP11==null?"":AP11%>" />
<input  name = "app2H" id="app2H" type="hidden" value="<%=AP12==null?"":AP12%>" />
<input  name = "app3H" id="app3H" type="hidden" value="<%=AP13==null?"":AP13%>" />
<input  name = "select12H" id="select12H" type="hidden" value="<%=AP4==null?"":AP4%>" />
<input  name = "select13H" id="select13H" type="hidden" value="<%=AP5==null?"":AP5%>" />
<input  name = "select14H" id="select14H" type="hidden" value="<%=AP6==null?"":AP6%>" />
<input  name = "select15H" id="select15H" type="hidden" value="<%=AP7==null?"":AP7%>" />
<input  name = "select16H" id="select16H" type="hidden" value="<%=AP8==null?"":AP8%>" />
<input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
<input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />
<input  name = "app6H" id="app6H" type="hidden" value="<%=AP23==null?"":AP23%>" />
<input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
<input  name = "app8H" id="app8H" type="hidden" value="<%=AP32==null?"":AP32%>" />
<input  name = "app9H" id="app9H" type="hidden" value="<%=AP33==null?"":AP33%>" />
<input  name = "app10H" id="app10H" type="hidden" value="<%=AP34==null?"":AP34%>" />
<input  name = "app11H" id="app11H" type="hidden" value="<%=AP35==null?"":AP35 %> " />
<input  name = "app12H" id="app12H" type="hidden" value="<%=AP36==null?"":AP36%>"  />

    <input type="hidden" name="priceid" value="<%=priceid%>">
    <input type="hidden" name="splId" value="<%=splId%>">
    <input type="hidden" name="tOId" value="<%=tOId%>">
    <input type="hidden" name="approverType" value="<%=approverType%>">
    <input type="hidden" name="createdBy" value="<%=createdBy%>">
    <input type="hidden" name="createdFor" value="<%=createdFor%>">

</tbody>
</form>
</body>
</html>