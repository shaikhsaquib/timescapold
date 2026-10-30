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
<%@ include file="includes/sessionCheck.jsp"%>
<%@ page errorPage="common/errorPage.jsp"%>
<%@ include file="includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<% int flg = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Delegation Admin</title>
<link href="style/global.css" rel="stylesheet" type="text/css" />
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

		String priceid		= (String)request.getParameter("priceId");
//System.out.println(priceid);

		ArrayList vStatus	=  new ArrayList();
	
		vStatus 			=	priceApprovalWebController.viewStatusSplReview(tOId,priceid);

		ArrayList vStatus1	=  new ArrayList();
	
		vStatus1 			=	priceApprovalWebController.viewApp2(tOId,priceid);

		ArrayList vStatus2	=  new ArrayList();
	
		vStatus2 			=	priceApprovalWebController.viewApproverDetails(priceid);

	String approverType = request.getParameter("approverType");


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
		  String APPROVER8_DATE     = data3[33];
		  String APPROVER35_STATUS  = data3[34];
		  String APPROVER35_DATE    = data3[35];
		  String APPROVER36_STATUS  = data3[36];
		  String APPROVER36_DATE    = data3[37];
		  String APPROVER34_STATUS  = data3[28];
          String APPROVER34_DATE    = data3[30];
          String APPROVER7_STATUS   = data3[29];
          String APPROVER7_DATE     = data3[31];




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


        String DESCRIPTION4					= data1[89];
        String ATTACHMENT4					= data1[90];

		String DESCRIPTION5					= data1[91];
        String ATTACHMENT5					= data1[92];

		String DESCRIPTION6					= data1[93];
        String ATTACHMENT6					= data1[94];

		String DESCRIPTION7					= data1[95];
        String ATTACHMENT7					= data1[96];

		String DESCRIPTION8					= data1[97];
        String ATTACHMENT8					= data1[98];

		String DESCRIPTION9					= data1[99];
        String ATTACHMENT9					= data1[100];

		String DESCRIPTION10				= data1[101];
        String ATTACHMENT10					= data1[102];
        String COMPANY  					= data1[103];
//String flag="Y";

		if (userEmailid.indexOf("@") > -1) {
        userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
	    } 

		int len = NEGOTIATION_VALUE.length();

		String temp = "";
			
		int lenCount = len-1;

		int counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + NEGOTIATION_VALUE.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			//NEGOTIATION_VALUE = temp;
		}
		    
       

// change 

	    len = SAVINGS.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + SAVINGS.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				SAVINGS = temp;
		}
		    


// change 

	    len = TOTAL_BUDGET.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + TOTAL_BUDGET.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
		temp =  new StringBuffer(temp).reverse().toString();
	   
	    TOTAL_BUDGET = temp;

		
		}
		    
       
// change 

	    len = BALANCE_BUDGET.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + BALANCE_BUDGET.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
		
			temp =  new StringBuffer(temp).reverse().toString();
	   
	        BALANCE_BUDGET = temp;
		}
		    
       

// change 

	    len = PO_COMMITTED_TILL_DATE.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + PO_COMMITTED_TILL_DATE.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
		
			temp =  new StringBuffer(temp).reverse().toString();
	   
			PO_COMMITTED_TILL_DATE = temp;
}


 String approverType1="";
 String app4        ="";
 String app5        ="";
 String app6        ="";
 String app7        ="";
        Hashtable apprData = new Hashtable();
        approverType1="AP4";
        apprData.put("companyCode",COMPANY);
        apprData.put("approverType1",approverType1);
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

        apprData.remove("approverType1");
}else{

}
        approverType1="AP5";
        apprData.put("approverType1",approverType1);
		approversLst 			=	priceApprovalWebController.grpCompanyAppLst(apprData);
          if(approversLst.size()>0)
           {
            for(jj = 0; jj<approversLst.size(); jj++)
             {
                apprsData   = (String[])approversLst.get(jj);
                app5    += "<option value=\""+apprsData[0]+"\" "+(AP5.equals(apprsData[0])? "SELECTED":"")+">"+apprsData[5]+"</option>";
          }
        apprData.remove("approverType1");
}
        approverType1="AP6";
        apprData.put("approverType1",approverType1);
		approversLst 			=	priceApprovalWebController.grpCompanyAppLst(apprData);
          if(approversLst.size()>0)
           {
            for(jj = 0; jj<approversLst.size(); jj++)
             {
                apprsData   = (String[])approversLst.get(jj);
                app6    += "<option value=\""+apprsData[0]+"\" "+(AP6.equals(apprsData[0])? "SELECTED":"")+">"+apprsData[5]+"</option>";
          }
        apprData.remove("approverType1");
}
        approverType1="AP7";
        apprData.put("approverType1",approverType1);
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
        label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        //label2 = "<span class=\"small\">Executive Director</span>";
        label2 = "<span class=\"small\">COO (Publishing)</span>";
        label3 = "<span class=\"small\">COO</span>";
        //label4 = "<span class=\"small\">CEO/CEC</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";
    }else{
        label1  ="<span class=\"small\">Group Company CEO/COO</span>";
        label2 = "<span class=\"small\">Director B&C</span>";
        //label3 = "<span class=\"small\">Executive Director</span>";
        label3 = "<span class=\"small\">COO (Publishing)</span>";
        //label4 = "<span class=\"small\">CEO/CEC - BCCL</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";
    }




%>
<body>
<form name="delegateAdmin" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="images/header_price1.jpg" width="842" height="44" /></td>
    <td width="23%" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="38"><img src="images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>

</table> 

  <tr>
	<td colspan="8">
	<table width="100%" border = "0"  cellspacing="1" cellpadding="1" >
	  <tr>

		<td  width="12%" align="left" class="travelMenuBG"  >SANCTIONED REF TYPE :</td>
		<td  width="10%" align="left" class="travelMenuBG"align="left" ><%=SANCTIONEDREFTYPE%></td>

		<td  width="10%" align="left"   class="travelMenuBG" >REF NUMBER :</td>
		<td  width="10%" align="left" class="travelMenuBG" align="left" ><%=REFNUMBER%></td>

		<td  width="10%" align="left"   class="travelMenuBG" >DATE OF APPROVAL :</td>
		<td  width="10%" align="left" class="travelMenuBG" align="left" ><%=DATEOFAPPROVAL%></td>

		<td  width="10%" align="left"   class="travelMenuBG" >COMPANY :</td>
		<td  width="10%" align="left" class="travelMenuBG" align="left" ><%=COMPANY%></td>
	  </tr>
	</table>

	  </td>
	
  </tr>
<table width="100%" border = "0"  cellspacing="1" cellpadding="1" >
  <tr>
  <tr bgcolor="#fbf9f9"  class="travelMenuBG">
     <td colspan="2" align="right" width="51%"><span class="normal">&nbsp;&nbsp;CATEGORY&nbsp;:&nbsp;</span></td>
	 <td colspan="2"><span class="normal" width="49%"><%=CATEGORY%></span></td>
	 <input type="hidden" id="category" name="category" value="<%=CATEGORY%>">
  </tr>
</table>
<table width="100%" border="1" bordercolor="#f0f0f0"  cellspacing="0" cellpadding="2" >
  <tr>
    <td colspan="3"  width="21%" align="center" valign="middle" class="travelMenuBG" >PC meeting details</td>
    <td colspan="4" width="21%" align="center" valign="middle" class="travelMenuBG">Project Details</td>
  </tr>

  <tr>
    <td  class="nav" align="left"width="21%">Negotiation/PC meeting date</td>
    <td colspan="3" class="normal" align="left" width="30%"><%=NEGOTIATION_PC_DATE%></td>
    <td  class="nav" colspan="2" align="left" width="20%">Description</td>
    <td colspan="3" class="normal" align="left"><%=PRODUCT_SERVICE__NAME%></td>
       
  </tr>
  <tr>
    <td class="nav" align="left">Finalized vendor's name</td>
    <td colspan="3" class="normal" align="left"><%=FINALIZED_VENDOR_NAME%></td>
    <td class="nav" colspan="2" align="left">Project</td>
    <td colspan="3" class="normal" align="left"><%=PACKAGE_NAME_SANCTION%></td>
  </tr>
  <tr>
    <td class="nav" align="left">Negotiated value (Rs.)</td>
    <td colspan="3" class="normal" align="left"><%=NEGOTIATION_VALUE%></td>
    <td class="nav"  colspan="2" rowspan="2" align="left">Budget    (Rs.)  / Sanction</td>
    <td colspan="3" rowspan="2" class="normal" align="left"><% if(TOTAL_BUDGET.equals("0")){out.println("-");}else{out.println(TOTAL_BUDGET);}%></td>
  </tr>
    <tr>
    <td class="nav" align="left">Valididty Period</td>
    <td colspan="3" class="normal" align="left"><%=VALIDITY_PERIOD==null?"":VALIDITY_PERIOD%></td>
    
  </tr>

  <tr>
    <td class="nav" align="left">Payment terms</td>
    <td colspan="3" class="normal" align="left"><%=PAYMENT_TERMS%></td>
    <td class="nav" colspan="2" align="left">PO's Commited till date (Rs.)</td>
    <td colspan="3" class="normal" align="left"><%if(PO_COMMITTED_TILL_DATE.equals("0")){out.println("-");}else{out.println(PO_COMMITTED_TILL_DATE);}%></td>
  </tr>
  <tr>
    <td class="nav" align="left">Hard Savings (Rs.)</td>
    <td colspan="3"  class="normal" align="left"><%=SAVINGS%></td>
    <td class="nav" colspan="2" rowspan="2" align="left" align="left">Balance    Budget(Rs.)</td>
    <td colspan="3" rowspan="2" class="normal" align="left"><%if(BALANCE_BUDGET.equals("0")){out.println("-");}else{out.println(BALANCE_BUDGET);}%></td>
  
  </tr>
  <tr>
    <td class="nav" align="left">Cost Avoidance (Rs.)</td>
    <td colspan="1" class="normal" align="left"><%=COST_AVOIDANCE%></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="52%" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="2" cellspacing="2">
     
      <tr>
        <td height="22" bgcolor="#ffffff" class="travelMenuBG">APPROVALS</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /> --></td>
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
          <td width="7%" align="left"><%=label4%><!-- <span class="small">CEO/CEC</span> --></td>
          <td width="15%" align="left"><span class="small">Managing Director </span></td>
        </tr>
		<td colspan="2">&nbsp;</td>
		<td class = "small" height = "15" >&nbsp;<b>Name</b>
		</td>
		<td class = "small" height = "15" >&nbsp;<b>Role</b>
		</td>	
        <tr class="small">
<%if(!AP11.equals("0") && APPROVER11_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left" cellpadding="4"><input type = "text" name = "app1" id="app1" class = "normal" size="20"  value="<%=APPROVER11==null?"":APPROVER11%>"  disabled><img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app1H" id="app1H" type="hidden" value="<%=AP11==null?"":AP11%>" />
		  </td>
<%}else if(!AP11.equals("0") && APPROVER11_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left" cellpadding="4"><input type = "text" name = "app1" id="app1" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER11==null?"":APPROVER11%>" ><img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app1H" id="app1H" type="hidden" value="<%=AP11==null?"":AP11%>" />
		  </td>
<%}else{%>

          <td class = "normal" height = "25" width="12%" align="left" cellpadding="4"><input type = "text" name = "app1" id="app1" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER11==null?"":APPROVER11%>" >
			  <input  name = "app1H" id="app1H" type="hidden" value="<%=AP11==null?"":AP11%>" />
		  </td>
<%}%>

<%if(!AP12.equals("0") && APPROVER12_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER12==null?"":APPROVER12%>"  disabled><img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			 <input  name = "app2H" id="app2H" type="hidden" value="<%=AP12==null?"":AP12%>" />
		  </td>
<%}else if(!AP12.equals("0") && APPROVER12_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER12==null?"":APPROVER12%>" ><img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
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
<%if(!AP35.equals("0") && APPROVER35_STATUS.equals("A")){%>
		  <td  class = "normal"  height = "25" align="left"><input type = "text" name = "app11" id="app11"  class = "normal" size="20" onClick="addUser('approvedby',this.id)"  value="<%=APPROVER35==null?"":APPROVER35%>"  class = "normal"  disabled><img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
		<input  name = "app11H" id="app11H" type="hidden" value="<%=AP35==null?"":AP35%>"  / >
    </td>
<%}else if(!AP35.equals("0") && APPROVER35_STATUS.equals("L")){%>
		  <td  class = "normal"  height = "25" align="left"><input type = "text" name = "app11" id="app11"  class = "normal" size="20" onClick="addUser('approvedby',this.id)"  value="<%=APPROVER35==null?"":APPROVER35%>"  class = "normal" ><img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
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
<img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}else if(!AP4.equals("0") && APPROVER4_STATUS.equals("L")) {%>
<img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}%>
</td>
          <td rowspan="3" align="left" valign="top">

        <select name="select13" class="small" id="select13" style="width:120px;" disabled>
		    <option value="0">Select</option>	
	        <!-- <option value="3459" <%//if(AP5.equals("3459")){%>selected="selected"<%//}%>>Mohit Jain</option> -->
            <%=app5%>
      </select>
<%if(!AP5.equals("0") && APPROVER5_STATUS.equals("A")){%>
<img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}else if(!AP5.equals("0") && APPROVER5_STATUS.equals("L")) {%>
<img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}%>
</td>


         <td rowspan="3" align="left" valign="top">
        <select name="select14" class="small" id="select14" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%> style="width:120px;" disabled>
		<option value="0">Select</option>
         <!-- <option value="31891" <%//if(AP6.equals("31891")){%>selected="selected"<%//}%>>Shrijeet Mishra</option> -->
            <%=app6%>
	  </select>   
<%if(!AP6.equals("0") && APPROVER6_STATUS.equals("A")){%>
<img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}else if(!AP6.equals("0") && APPROVER6_STATUS.equals("L")) {%>
<img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}%>
      </td>

		<td rowspan="3" align="left" valign="top">
        <select name="select15" class="small" id="select15" style="width:120px;" disabled <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
		<option value="0">Select</option>
         <!-- <option value="48795" <%//if(AP7.equals("48795")){%>selected="selected"<%//}%>>Raj Jain</option> -->
                    <%=app7%>
		</select>
<%if(!AP7.equals("0") && APPROVER7_STATUS.equals("A")){%>
<img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}else if(!AP7.equals("0") && APPROVER7_STATUS.equals("L")) {%>
<img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}%>
</td>



	    <td rowspan="3" align="left" valign="top">
        <select name="select16" class="small" id="select16" style="width:120px;"<%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%> disabled>
		<option value="0">Select</option>
	    <option value="29616" <%if(AP8.equals("29616")){%>selected="selected"<%}%>>Vineet Jain</option>
        </select>
<%if(!AP8.equals("0") && APPROVER8_STATUS.equals("A")){%>
<img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}else if(!AP8.equals("0") && APPROVER8_STATUS.equals("L")) {%>
<img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
<%}%>
</td>
        </tr>
        <tr class="small">
<%if(!AP21.equals("0") && APPROVER21_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20"  value="<%=APPROVER21==null?"":APPROVER21%>"  disabled><img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
		 </td>
<%}else if(!AP21.equals("0") && APPROVER21_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER21==null?"":APPROVER21%>" ><img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
		 </td>
<%}else{%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER21==null?"":APPROVER21%>" >
			  <input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
		 </td>

<%}%>
<%if(!AP22.equals("0") && APPROVER22_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER22==null?"":APPROVER22%>"   disabled><img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />
</td>
<%}else if(!AP22.equals("0") && APPROVER22_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER22==null?"":APPROVER22%>" ><img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />
</td>
<%}else{%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER22==null?"":APPROVER22%>" disabled>
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />
</td>
<%}%>	
<%if(!AP36.equals("0") && APPROVER36_STATUS.equals("A")){%>
		  <td  class = "normal"  height = "25" align="left">
		    <input type = "text" name = "app12" id="app12"  class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER36==null?"":APPROVER36%>"   disabled><img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
		    <input  name = "app12H" id="app12H" type="hidden" value="<%=AP36==null?"":AP36%>"  />
</td>
<%}else if(!AP36.equals("0") && APPROVER36_STATUS.equals("L")){%>
		  <td  class = "normal"  height = "25" align="left">
		    <input type = "text" name = "app12" id="app12"  class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER36==null?"":APPROVER36%>"  ><img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
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
<%if(!AP31.equals("0") && APPROVER31_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER31==null?"":APPROVER31%>"  disabled><img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
		  </td>
<%}else if(!AP31.equals("0") && APPROVER31_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER31==null?"":APPROVER31%>"><img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
		  </td>
<%}else{%>

          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER31==null?"":APPROVER31%>">
			  <input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
		  </td>
<%}%>
<%if(!AP32.equals("0") && APPROVER32_STATUS.equals("A")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER32==null?"":APPROVER32%>"  disabled><img src="images/approved.png" border="0" style="margin-left:4px;" align="bottom"/>
			  <input  name = "app8H" id="app8H" type="hidden" value="<%=AP32==null?"":AP32%>" />
		  </td>
<%}else if(!AP32.equals("0") && APPROVER32_STATUS.equals("L")){%>
          <td class = "normal" height = "25" width="12%" align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER32==null?"":APPROVER32%>" ><img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
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
		<img src="images/approved.png" border="0" style="margin-left:0px;" align="bottom"/>
		</td> 
<%}else if(!AP13.equals("0") && APPROVER13_STATUS.equals("L")){%>
      <td class = "normal" height = "25" width="19%" align="left">
		<select name="app3" id="app3" class = "normal" style="width:73%;" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
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
<img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
		</td> 
<%}else{%>
      <td class = "normal" height = "25" width="19%" align="left">
		<select name="app3" id="app3" class = "normal" style="width:73%;" disabled <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
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
		<select name = "app6" id="app6" class = "normal" style="width:73%;" disabled <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
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
        <img src="images/approved.png" border="0" style="margin-left:0px;" align="bottom"/>
<%}else if(!AP23.equals("0") && APPROVER23_STATUS.equals("L")){%>
 <img src="images/inprocess.png" border="0" style="margin-left:0px;" align="bottom"/>
<%}%>
		</td> 
		  <td class = "normal" height = "25" width="10%" align="left">MAS 2</td>
        </tr>
		<tr>
		 <td></td>
		 <td></td>
<%if(!AP33.equals("0") && APPROVER33_STATUS.equals("A")){%>

			  <td class = "normal" height = "25" width="12%" align="left">
		<select name = "app9" id="app9" class = "normal" style="width:73%;" disabled <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
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
        <img src="images/approved.png" border="0" style="margin-left:0px;" align="bottom"/>
		  </td>
<%}else if(!AP33.equals("0") && APPROVER33_STATUS.equals("L")){%>
			  <td class = "normal" height = "25" width="12%" align="left">
		<select name = "app9" id="app9" class = "normal" style="width:73%;" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
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
<img src="images/inprocess.png" border="0" style="margin-left:4px;" align="bottom"/>
		  </td>
<%}else{%>
			  <td class = "normal" height = "25" width="12%" align="left">
		<select name = "app9" id="app9" class = "normal" style="width:73%;" disabled <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
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
		<select name = "app10" id="app10" disabled class = "normal" style="width:73%;" <%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
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
        <img src="images/approved.png" border="0" style="margin-left:0px;" align="bottom"/>
<%}else if(!AP34.equals("0") && APPROVER34_STATUS.equals("L")){%>
 <img src="images/inprocess.png" border="0" style="margin-left:0px;" align="bottom"/>
<%}%>
		  </td>
		  <td class = "normal" height = "25" width="10%" align="left">Finance 2</td>
        </tr>
      </table>

<br>
      <table width="100%" border="0" cellspacing="4" cellpadding="0">
<tr><td width="33%" align="right" valign="top" class="normal">Remarks :</td><td align="left"><textarea name="remarksContainer" cols="50" rows="5" maxlength="2000" onkeydown="textCounter(document.delegateAdmin.remarksContainer,'lineCountDescription',2000)" onkeyup="textCounter(document.delegateAdmin.remarksContainer,'lineCountDescription',2000)" ></textarea></td>
<div><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td id="lineCountDescription"  class="small"  width="55%" align="right">2000</td><td align="left" class="small">&nbsp;Characters Left</td></tr></table></div>
</td></tr>

        <tr>
          <td align="center" valign="middle"><br><input name="submitForm1" onclick="changeApprover();" type="button" class="bold" id="submitForm1" value="Submit" />&nbsp;&nbsp;<input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" /></td>
          <!-- <td></td> -->
        </tr>
      </table>
      
	</td>
  </tr>
<br>

    <input type="hidden" name="negotiation_pc_date" value="<%=NEGOTIATION_PC_DATE%>">
    <input type="hidden" name="negotiation_pc_meeting_venue" value="<%=NEGOTIATION_PC_MEETING_VENUE%>">
    <input type="hidden" name="negotiation_value" value="<%=NEGOTIATION_VALUE%>">
    <input type="hidden" name="finalized_vendor_name" value="<%=FINALIZED_VENDOR_NAME%>">
    <input type="hidden" name="payment_terms" value="<%=PAYMENT_TERMS%>">
    <input type="hidden" name="savings" value="<%=SAVINGS%>">
    <input type="hidden" name="product_service__name" value="<%=PRODUCT_SERVICE__NAME%>">
    <input type="hidden" name="indented_user" value="<%=INDENTED_USER%>">
    <input type="hidden" name="package_name_sanction" value="<%=PACKAGE_NAME_SANCTION%>">
    <input type="hidden" name="total_budget" value="<%=TOTAL_BUDGET%>">
    <input type="hidden" name="po_committed_till_date" value="<%=PO_COMMITTED_TILL_DATE%>">
    <input type="hidden" name="balance_budget" value="<%=BALANCE_BUDGET%>">
    <input type="hidden" name="requirement" value="<%=REQUIREMENT%>">
    <input type="hidden" name="description1" value="<%=DESCRIPTION1%>">
    <input type="hidden" name="description2" value="<%=DESCRIPTION2%>">
    <input type="hidden" name="description3" value="<%=DESCRIPTION3%>">
    <input type="hidden" name="attachment1" value="<%=ATTACHMENT1%>">
    <input type="hidden" name="attachment2" value="<%=ATTACHMENT2%>">
    <input type="hidden" name="attachment3" value="<%=ATTACHMENT3%>">
    <input type="hidden" name="product1" value="<%=PRODUCT1%>">
    <input type="hidden" name="product2" value="<%=PRODUCT2%>">
    <input type="hidden" name="product3" value="<%=PRODUCT3%>">
    <input type="hidden" name="rate1" value="<%=RATE1%>">
    <input type="hidden" name="rate2" value="<%=RATE2%>">
    <input type="hidden" name="rate3" value="<%=RATE3%>">
    <input type="hidden" name="benchmark1" value="<%=BENCHMARK1%>">
    <input type="hidden" name="benchmark2" value="<%=BENCHMARK2%>">
    <input type="hidden" name="benchmark3" value="<%=BENCHMARK3%>">
    <input type="hidden" name="recommenedation" value="<%=RECOMMENEDATION%>">
    <!-- <input type="hidden" name="flag" value="<%//=flag%>"> -->
</tbody>
</form>
</body>
</html>