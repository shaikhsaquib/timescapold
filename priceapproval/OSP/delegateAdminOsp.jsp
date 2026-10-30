<%--
 -- @(#)delegateAdmin.jsp	11-01-16
 --
 -- Copyright 2012 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments....
 -- @author		Krishna Vishwakarma
 -- @version 	1.00, 11-01-16
 --%>

<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.02-09-202002-09-2020approval.web.controller.priceApprovalWebController" /> 
<% int flg = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Delegation Admin</title>
<link href="css/global.css" rel="stylesheet" type="text/css" />

<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/osp.js"></script>

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

        String INITIATORNAME				= data1[56];
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



    String label1="";
    String label2="";
    String label3="";
    String label4="";

    if(COMPANY.equals("1000"))
    {
        //label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">(Delegated Authority) &nbsp; &#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        //label2 = "<span class=\"small\">Executive Director</span>";
        label2 = "<span class=\"small\">COO (Publishing)</span>";
        label3 = "<span class=\"small\">COO</span>";
        //label4 = "<span class=\"small\">CEC & ED</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";
    }else{
        label1  ="<span class=\"small\">Group Company CEO</span>";
        label2 = "<span class=\"small\">Director B&C</span>";
       // label2 = "<span class=\"small\">Director B&C</span><span class=\"redsmall\" id=\"changeLabel2\"><br>(Delegated Authority)</span>";
        //label3 = "<span class=\"small\">Executive Director</span>";
        label3 = "<span class=\"small\">COO (Publishing)</span>";
        //label4 = "<span class=\"small\">CEC & ED - BCCL</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";
    }




%>
<body>
<form name="delegateAdmin" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
    <td width="23%" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="38"><img src="../images/header_price2.jpg" width="706" height="34" /><!-- <img src="../images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="../images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>

  
	<tr>
		<td    align="left"  height="27px"valign="middle" bgcolor="#666666"><span class="white"><font size="2" align="left">PURCHASE APPROVAL REQUEST NO - <%=priceid%></font></span></td>
		<td  align="left" valign="middle" bgcolor="#666666"  ><span class="white"><font size="2" align="left">COMPANY : <%=COMPANYNAME%></font></span></td>
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
  <table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="17%" >B&amp;C-<span class="small"> LEVEL 1</span></td>
          <td width="17%" height="29" >USER/Purchase TEAM<span class="small">-LEVEL </span><span class="redsmall"><span class="small">1</span><!-- (min 1) --></span></td>
          <td width="21%" align="left" colspan='2'>SUPPORTED BY </td>
           <td width="12%" align="left"><%=label1%><!-- <span class="small">Director B&C</span> --></td>
          <td width="10%" align="left"><%=label2%><!-- <span class="small">EP Supply Chain</span> --></td>
          <td width="7%" align="left"><%=label3%><!-- <span class="small">COO</span> --></td>
          <td width="7%" align="left"><%=label4%><!-- <span class="small">CEO</span> --></td>
          <td width="15%" align="left"><span class="small">Managing Director </span></td>
        </tr>
		<td colspan="2">&nbsp;</td>
		<td class = "small" height = "15" >&nbsp;<b>Name</b>
		</td>
		<td class = "small" height = "15" >&nbsp;<b>Role</b>
		</td>	
        <tr class="small">

 <%if(!AP11.equals("0|") && APPROVER11_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left" cellpadding="4"><input type = "text" name = "app1" id="app1" class = "normal" size="20"  value="<%=APPROVER11==null?"":APPROVER11%>"  disabled><img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app1H" id="app1H" type="hidden" value="<%=AP11==null?"":AP11%>" />
		  </td>
<%}else if(!AP11.equals("0|") && APPROVER11_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left" cellpadding="4"><input type = "text" name = "app1" id="app1" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER11==null?"":APPROVER11%>" ><img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app1H" id="app1H" type="hidden" value="<%=AP11==null?"":AP11%>" />
		  </td>
<%}else{%>
           <td class = "normal" height = "25" width="12%" align="left" cellpadding="4"><input type = "text" name = "app1" id="app1" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER11==null?"":APPROVER11%>" disabled>
			  <input  name = "app1H" id="app1H" type="hidden" value="<%=AP11==null?"":AP11%>" />
		  </td>
<%}%>

<%if(!AP12.equals("0|") && APPROVER12_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER12==null?"":APPROVER12%>"  disabled><img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			 <input  name = "app2H" id="app2H" type="hidden" value="<%=AP12==null?"":AP12%>" />
		  </td>
<%}else if(!AP12.equals("0|") && APPROVER12_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER12==null?"":APPROVER12%>" ><img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
			 <input  name = "app2H" id="app2H" type="hidden" value="<%=AP12==null?"":AP12%>" />
		  </td>
<%}else{%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER12==null?"":APPROVER12%>" disabled>
			 <input  name = "app2H" id="app2H" type="hidden" value="<%=AP12==null?"":AP12%>" />
		  </td>
<%}%>
<%
		ArrayList approverList   = new ArrayList();
		String str          = ""; 
		int i = 0;
        String roleType     ="";
        String selected="";
        Hashtable approverData  = new Hashtable();
%>
<%if(!AP35.equals("0|") && APPROVER35_STATUS.equals("A")){%>
		  <td  class = "normal"  height = "25" align="left"><input type = "text" name = "app11" id="app11"  class = "normal" size="20" onClick="addUser('approvedby',this.id)"  value="<%=APPROVER35==null?"":APPROVER35%>"  class = "normal"  disabled><img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
		<input  name = "app11H" id="app11H" type="hidden" value="<%=AP35==null?"":AP35%>"  / >
    </td>
<%}else if(!AP35.equals("0|") && APPROVER35_STATUS.equals("L")){%>
		  <td  class = "normal"  height = "25" align="left"><input type = "text" name = "app11" id="app11"  class = "normal" size="20" onClick="addUser('approvedby',this.id)"  value="<%=APPROVER35==null?"":APPROVER35%>"  class = "normal" ><img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
		<input  name = "app11H" id="app11H" type="hidden" value="<%=AP35==null?"":AP35%>"  / >
    </td>

<%}else{%>
		  <td  class = "normal"  height = "25" align="left"><input type = "text" name = "app11" id="app11"  class = "normal" size="20" onClick="addUser('approvedby',this.id)"  value="<%=APPROVER35==null?"":APPROVER35%>"  class = "normal" disabled>
		<input  name = "app11H" id="app11H" type="hidden" value="<%=AP35==null?"":AP35%>"  / >
    </td>
<%}%>
    		 <td class = "normal" height = "25" align="left">HR/Personnel</td>


            <td rowspan="3" align="left" valign="top" class="small"><%//=AP4.equals("0")?"":AP4%>
             <select name="select12" class="small" id="select12" style="width:120px;" disabled>
        <option value="0">Select</option>
	    <!-- <option value="20411" <%//if(AP4.equals("20411")){%>selected="selected"<%//}%>>Shyam Shanker</option> -->
            <%=app4%>
	  </select>
			 
<%if(!AP4.equals("0") && APPROVER4_STATUS.equals("A")){%>
<img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}else if(!AP4.equals("0") && APPROVER4_STATUS.equals("L")) {%>
<img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}%>
</td>
          <td rowspan="3" align="left" valign="top">

        <select name="select13" class="small" id="select13" style="width:120px;" disabled>
		    <option value="0">Select</option>	
	        <!-- <option value="3459" <%//if(AP5.equals("3459")){%>selected="selected"<%//}%>>Mohit Jain</option> -->
            <%=app5%>
      </select>
<%if(!AP5.equals("0") && APPROVER5_STATUS.equals("A")){%>
<img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}else if(!AP5.equals("0") && APPROVER5_STATUS.equals("L")) {%>
<img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}%>
</td>


         <td rowspan="3" align="left" valign="top">
        <select name="select14" class="small" id="select14"  style="width:120px;" disabled>
		<option value="0">Select</option>
         <!-- <option value="31891" <%//if(AP6.equals("31891")){%>selected="selected"<%//}%>>Shrijeet Mishra</option> -->
            <%=app6%>
	  </select>   
<%if(!AP6.equals("0") && APPROVER6_STATUS.equals("A")){%>
<img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}else if(!AP6.equals("0") && APPROVER6_STATUS.equals("L")) {%>
<img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}%>
      </td>

		<td rowspan="3" align="left" valign="top">
        <select name="select15" class="small" id="select15" style="width:120px;" disabled >
		<option value="0">Select</option>
         <!-- <option value="48795" <%//if(AP7.equals("48795")){%>selected="selected"<%//}%>>Raj Jain</option> -->
                    <%=app7%>
		</select>
<%if(!AP7.equals("0") && APPROVER7_STATUS.equals("A")){%>
<img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}else if(!AP7.equals("0") && APPROVER7_STATUS.equals("L")) {%>
<img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}%>
</td>



	    <td rowspan="3" align="left" valign="top">
        <select name="select16" class="small" id="select16" style="width:120px;" disabled>
		<option value="0">Select</option>
	    <option value="29616" <%if(AP8.equals("29616")){%>selected="selected"<%}%>>Vineet Jain</option>
        </select>
<%if(!AP8.equals("0") && APPROVER8_STATUS.equals("A")){%>
<img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}else if(!AP8.equals("0") && APPROVER8_STATUS.equals("L")) {%>
<img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}%>
</td>
        </tr>
        <tr class="small">
<%if(!AP21.equals("0|") && APPROVER21_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20"  value="<%=APPROVER21==null?"":APPROVER21%>"  disabled><img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
		 </td>
<%}else if(!AP21.equals("0|") && APPROVER21_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER21==null?"":APPROVER21%>" ><img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
		 </td>
<%}else{%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER21==null?"":APPROVER21%>" disabled>
			  <input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
		 </td>

<%}%>
<%if(!AP22.equals("0|") && APPROVER22_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER22==null?"":APPROVER22%>"   disabled><img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />
</td>
<%}else if(!AP22.equals("0|") && APPROVER22_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER22==null?"":APPROVER22%>" ><img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />
</td>
<%}else{%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER22==null?"":APPROVER22%>" disabled>
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />
</td>
<%}%>	
<%if(!AP36.equals("0|") && APPROVER36_STATUS.equals("A")){%>
		  <td  class = "normal"  height = "25" align="left">
		    <input type = "text" name = "app12" id="app12"  class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER36==null?"":APPROVER36%>"   disabled><img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
		    <input  name = "app12H" id="app12H" type="hidden" value="<%=AP36==null?"":AP36%>"  />
</td>
<%}else if(!AP36.equals("0|") && APPROVER36_STATUS.equals("L")){%>
		  <td  class = "normal"  height = "25" align="left">
		    <input type = "text" name = "app12" id="app12"  class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER36==null?"":APPROVER36%>"  ><img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
		    <input  name = "app12H" id="app12H" type="hidden" value="<%=AP36==null?"":AP36%>"  />
</td>
<%}else{%>
		  <td  class = "normal"  height = "25" align="left">
		    <input type = "text" name = "app12" id="app12"  class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER36==null?"":APPROVER36%>"  disabled>
		    <input  name = "app12H" id="app12H" type="hidden" value="<%=AP36==null?"":AP36%>"  />
</td>
<%}%>
		 <td class = "normal" height = "25" align="left">Branch Head</td>
        </tr>
        <tr class="small">
<%if(!AP31.equals("0|") && APPROVER31_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER31==null?"":APPROVER31%>"  disabled><img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
		  </td>
<%}else if(!AP31.equals("0|") && APPROVER31_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER31==null?"":APPROVER31%>"><img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
		  </td>
<%}else{%>

          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER31==null?"":APPROVER31%>">
			  <input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
		  </td>
<%}%>
<%if(!AP32.equals("0|") && APPROVER32_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER32==null?"":APPROVER32%>"  disabled><img src="../images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app8H" id="app8H" type="hidden" value="<%=AP32==null?"":AP32%>" />
		  </td>
<%}else if(!AP32.equals("0|") && APPROVER32_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER32==null?"":APPROVER32%>" ><img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app8H" id="app8H" type="hidden" value="<%=AP32==null?"":AP32%>" />
		  </td>
<%}else{%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER32==null?"":APPROVER32%>" disabled>
			  <input  name = "app8H" id="app8H" type="hidden" value="<%=AP32==null?"":AP32%>" />
		  </td>
<%}%>
      		<input name="priceid" id="priceid" type="hidden" value="<%=priceid%>" /> 

<%if(!AP13.equals("0") && APPROVER13_STATUS.equals("A")){%>
        <td class = "normal" height = "25" width="19%" align="left">
		<select name="app3" id="app3" class = "normal" style="width:73%;" disabled>
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
		<img src="../images/approved.png" border="0" style="margin-left:0px;" align="bottom"/>
		</td> 
<%}else if(!AP13.equals("0") && APPROVER13_STATUS.equals("L")){%>
      <td class = "normal" height = "25" width="19%" align="left">
		<select name="app3" id="app3" class = "normal" style="width:73%;" >
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
<img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
		</td> 
<%}else{%>
      <td class = "normal" height = "25" width="19%" align="left">
		<select name="app3" id="app3" class = "normal" style="width:73%;" disabled>
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
<%}%>		
   <td class = "normal" height = "25" width="10%" align="left">MAS 1 </td>
		 
        </tr>
		<tr class="small">
		  <td colspan="2" >&nbsp;</td>

  <td class = "normal" height = "25" width="12%" align="left">
		<select name = "app6" id="app6" class = "normal" style="width:73%;" disabled >
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
<%if(!AP23.equals("0") && APPROVER23_STATUS.equals("A")){%>
        <img src="../images/approved.png" border="0" style="margin-left:0px;" align="bottom"/>
<%}else if(!AP23.equals("0") && APPROVER23_STATUS.equals("L")){%>
 <img src="../images/inprocess.png" border="0" style="margin-left:0px;" align="bottom"/>
<%}%>
		</td> 
		  <td class = "normal" height = "25" width="10%" align="left">MAS 2</td>
        </tr>
		<tr>
		 <td></td>
		 <td></td>
<%if(!AP33.equals("0") && APPROVER33_STATUS.equals("A")){%>

			  <td class = "normal" height = "25" width="12%" align="left">
		<select name = "app9" id="app9" class = "normal" style="width:73%;" disabled >
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
        <img src="../images/approved.png" border="0" style="margin-left:0px;" align="bottom"/>
		  </td>
<%}else if(!AP33.equals("0") && APPROVER33_STATUS.equals("L")){%>
			  <td class = "normal" height = "25" width="12%" align="left">
		<select name = "app9" id="app9" class = "normal" style="width:73%;" >
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
<img src="../images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
		  </td>
<%}else{%>
			  <td class = "normal" height = "25" width="12%" align="left">
		<select name = "app9" id="app9" class = "normal" style="width:73%;" disabled >
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
<%}%>
			  <td class = "normal" height = "25" width="10%" align="left">Finance 1</td>
		
        </tr>
		<tr>
		 <td></td>
		 <td></td>


	  <td class = "normal" height = "25" width="12%" align="left">
		<select name = "app10" id="app10" disabled class = "normal" style="width:73%;" >
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
<%if(!AP34.equals("0") && APPROVER34_STATUS.equals("A")){%>
        <img src="../images/approved.png" border="0" style="margin-left:0px;" align="bottom"/>
<%}else if(!AP34.equals("0") && APPROVER34_STATUS.equals("L")){%>
 <img src="../images/inprocess.png" border="0" style="margin-left:0px;" align="bottom"/>
<%}%>
		  </td>
		  <td class = "normal" height = "25" width="10%" align="left">Finance 2</td>
        </tr>
      </table>


 <table width="100%" border="0" cellspacing="4" cellpadding="0">
	<tr>
		<td width="33%" align="right" valign="top" class="normal">Remarks :</td>
		<td align="left"><textarea name="remarksContainer" cols="50" rows="5" maxlength="2000" onkeydown="textCounter(document.delegateAdmin.remarksContainer,'lineCountDescription',2000)" onkeyup="textCounter(document.delegateAdmin.remarksContainer,'lineCountDescription',2000)" ></textarea>
		</td>
			<div>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td id="lineCountDescription"  class="small"  width="55%" align="right">2000</td>
						<td align="left" class="small">&nbsp;Characters Left</td>
					</tr>
				</table>
			</div>
	</tr>
</table>
 <table width="100%" border="0" cellspacing="4" cellpadding="0">
	<tr>
		<td align="center" valign="middle">
			<br><input name="submitForm1" onclick="changeApproverOsp();" type="button" class="bold" id="submitForm1" value="Submit" />&nbsp;&nbsp;
			<input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" />
		</td>
	</tr>
</table>

<br>

</form>
</body>
</html>