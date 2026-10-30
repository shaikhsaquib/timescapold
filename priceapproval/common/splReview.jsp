<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="../includes/sessionCheck.jsp"%>
<% //@ page errorPage="common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<% int flg = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Special Review</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
<script src="../jscripts/calendarControl.js" language="javascript"></script>
<link href="../style/calendarControl.css" rel="stylesheet">
<script Language="JavaScript" src="../jscripts/util.js"></script>
<script Language="JavaScript" src="../jscripts/common.js"></script>
<script Language="JavaScript" src="../jscripts/search.js"></script>
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
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
        String COMPANYNAME 					= data1[104];

    String label1="";
    String label2="";
    String label3="";
    String label4="";

    if(COMPANY.equals("1000"))
    {
        label1 = "Director B&C";
        //label2 = "Executive Director";
        label2 = "COO (Publishing)";
        label3 = "COO";
        //label4 = "CEC & ED";
        label4 = "CEO (Publishing)";
    }else{
        label1  ="Group Company CEO";
        label2 = "Director B&C";
        //label3 = "Executive Director";
        label3 = "COO (Publishing)";
        //label4 = "CEC & ED - BCCL";
        label4 = "CEO (Publishing)";

    }
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
	   
			NEGOTIATION_VALUE = temp;
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
%>
<body>
<form name="specialReview" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
    <td width="23%" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="38"><img src="../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>

</table>
<table width="100%" cellspacing="2" cellpadding="2" border="0">

  <tr>
	<td colspan="8">
	<table width="100%" border = "0"  cellspacing="1" cellpadding="1" >
	  <tr>

		<td  width="20%" align="left" class="travelMenuBG"  >SANCTIONED REF TYPE :</td>
		<td  width="15%" align="left" class="travelMenuBG"align="left" ><%=SANCTIONEDREFTYPE%></td>

		<td  width="20%" align="left"   class="travelMenuBG" >REF NUMBER :</td>
		<td  width="15%" align="left" class="travelMenuBG" align="left" ><%=REFNUMBER%></td>

		<td  width="15%" align="left"   class="travelMenuBG" >DATE OF APPROVAL :</td>
		<td  width="15%" align="left" class="travelMenuBG" align="left" ><%=DATEOFAPPROVAL%></td>
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

		<td  width="15%" align="left"   class="travelMenuBG" >COMPANY :</td>
		<td  width="15%" align="left" class="travelMenuBG" align="left" ><%=COMPANYNAME%></td>

  </tr>
</table>
<table width="100%" border="1" bordercolor="#f0f0f0"  cellspacing="0" cellpadding="2" >
  <tr>
    <td colspan="3" align="center" valign="middle" class="travelMenuBG">PC meeting details</td>
    <td colspan="5" align="center" valign="middle" class="travelMenuBG">Project Details</td>
  </tr>

  <tr>
    <td  class="nav" align="left"width="20%">Negotiation/PC meeting date</td>
    <td colspan="3" class="normal" align="left"><%=NEGOTIATION_PC_DATE%></td>
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
    </table>
      <table width="100%" cellspacing="2" cellpadding="2" border="0">
        <tr class="greyBG">
          <td width="14%" >B&amp;C<span class="small"> </td>
          <td width="14%" height="29" >USER/PRICE TEAM<span class="small">-LEVEL </span><span class="redsmall"><!-- (min 1) --></span></td>
          <td width="12%" align="left" colspan='2'>SUPPORTED BY <span class="redsmall"></td>
           <td width="10%" align="left"><span class="small"><%=label1%><!-- Director B&C --></span><br></td>
          <td width="8%" align="left"><span class="small"><%=label2%><!-- EP Supply Chain --></span></td>
          <td width="7%" align="left"><span class="small"><%=label3%><!-- COO --></span></td>
          <td width="9%" align="left"><span class="small"><%=label4%><!-- CEO --></span></td>
          <td width="14%" align="left"><span class="small">Managing Director </span></td>
        </tr>
		<td colspan="2">&nbsp;</td>
		<td class = "small" height = "15" >&nbsp;<b>Name</b>
		</td>
		<td class = "small" height = "15" >&nbsp;<b>Role</b>
		</td>	
        <tr class="small">
          <td class="small" height = "25" width="12%" align="left"><input type="radio" name="review" id="app1" value="app1"><%=APPROVER11==null?"":APPROVER11%>
			  <input  name = "app1H" id="app1H" type="hidden" value="<%=AP11==null?"":AP11%>" />
		  </td>
          <td class = "small" height = "25" width="12%" align="left"><%if(APPROVER12 ==null){}else{%><input type="radio" name="review" id="app2" value="app2"><%}%><%=APPROVER12==null?"":APPROVER12%>
			 <input  name = "app2H" id="app2H" type="hidden" value="<%=AP12==null?"":AP12%>" />
		  </td>
			<td class = "small" height = "25" width="15%" align="left"><%if(APPROVER13 ==null){}else{%><input type="radio" name="review" id="app3" value="app3"><%}%><%=APPROVER13 ==null?"":APPROVER13%>
	 <input  name = "app3H" id="app3H" type="hidden" value="<%=AP13==null?"":AP13%>" />
		</td> 
		
		   <td class = "normal" height = "25" width="10%" align="left"><%if(APPROVER13 ==null){}else{%>MAS 1 <%}%></td>
          <td rowspan="3" align="left" valign="top" class="small" width="10%"><%=APPROVER4 ==null?"":APPROVER4%>
	 <input  name = "select12H" id="select12H" type="hidden" value="<%=AP4==null?"":AP4%>" />
			</td>
          <td rowspan="3" align="left" valign="top" width="9%"><%=APPROVER5 ==null?"":APPROVER5%>
<input  name = "select13H" id="select13H" type="hidden" value="<%=AP5==null?"":AP5%>" />
</td>


         <td rowspan="3" align="left" valign="top" width="10%"><%=APPROVER6 ==null?"":APPROVER6%>
<input  name = "select14H" id="select14H" type="hidden" value="<%=AP6==null?"":AP6%>" />
     </td>

		<td rowspan="3" align="left" valign="top" width="9%"><%=APPROVER7 ==null?"":APPROVER7%>
 <input  name = "select15H" id="select15H" type="hidden" value="<%=AP7==null?"":AP7%>" />
</td>



	    <td rowspan="3" align="left" valign="top" width="12%"><%=APPROVER8 ==null?"":APPROVER8%>
 <input  name = "select16H" id="select16H" type="hidden" value="<%=AP8==null?"":AP8%>" />
       </td>
        </tr>
        <tr class="small">
          <td class = "small" height = "25" width="12%" align="left"><input type="radio" name="review" id="app4" value="app4"><%=APPROVER21==null?"":APPROVER21%>
			  <input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
		 </td>
          <td class = "small" height = "25" width="12%" align="left"><%if(APPROVER22 ==null){}else{%><input type="radio" name="review" id="app5" value="app5"><%}%><%=APPROVER22==null?"":APPROVER22%>
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />
		   </td> 
         
		<td class = "small" height = "25" width="12%" align="left"><%if(APPROVER23 ==null){}else{%><input type="radio" name="review" id="app6" value="app6"><%}%><%=APPROVER23==null?"":APPROVER23%>
	 <input  name = "app6H" id="app6H" type="hidden" value="<%=AP23==null?"":AP23%>" />
			</td> 
		  <td class = "normal" height = "25" width="10%" align="left"><%if(APPROVER23 ==null){}else{%>MAS 2 <%}%></td>
        </tr>
        <tr class="small">
          <td class = "small" height = "25" width="12%" align="left"><input type="radio" name="review" id="app7" value="app7"><%=APPROVER31==null?"":APPROVER31%>
			  <input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
		  </td>
          <td class = "small" height = "25" width="12%" align="left"><%if(APPROVER32 ==null){}else{%><input type="radio" name="review" id="app8" value="app8"><%}%><%=APPROVER32==null?"":APPROVER32%>
			  <input  name = "app8H" id="app8H" type="hidden" value="<%=AP32==null?"":AP32%>" />
		  </td>
        
			  <input name="priceid" id="priceid" type="hidden" value="<%=priceid%>" /> 
			  <input name="approverType" id="approverType" type="hidden" value="<%=approverType%>" /> 
			<td class = "small" height = "25" width="12%" align="left"><%if(APPROVER33 ==null){}else{%><input type="radio" name="review" id="app9" value="app9"><%}%><%=APPROVER33==null?"":APPROVER33%>
<input  name = "app9H" id="app9H" type="hidden" value="<%=AP33==null?"":AP33%>" />
		  </td>
			  <td class = "normal" height = "25" width="10%" align="left"><%if(APPROVER33 ==null){}else{%>Finance 1 <%}%></td>
		 
        </tr>
		<tr class="small">
		  <td colspan="2" >&nbsp;</td>
         
		  <td class = "small" height = "25" width="12%" align="left"><%if(APPROVER34 ==null){}else{%><input type="radio" name="review" id="app10" value="app10"><%}%><%=APPROVER34==null?"":APPROVER34%>
<input  name = "app10H" id="app10H" type="hidden" value="<%=AP34==null?"":AP34%>" />
		  </td><%//System.out.println("AP34= "+AP35);%>
		  <td class = "normal" height = "25" width="10%" align="left"><%if(APPROVER34 ==null){}else{%>Finance 2<%}%></td>
        </tr>
		<tr>
		 <td></td>
		 <td></td>
		  <td  class = "small"  height = "25" align="left"><%if(APPROVER35 ==null){}else{%><input type="radio" name="review"  id="app11" value="app11"><%}%><%=APPROVER35==null?"":APPROVER35%>
    <%//out.println(""+APPROVER35);%> 
		<input  name = "app11H" id="app11H" type="hidden" value="<%=AP35==null?"":AP35 %> " /></td>
		 <td class = "normal" height = "25" align="left"><%if(APPROVER35 ==null){}else{%>HR/Personnel<%}%></td>
		
        </tr>
		<tr>
		 <td></td>
		 <td></td>
		  <td  class = "small"  height = "25" align="left" ><%if(APPROVER36 ==null){}else{%><input type="radio" name="review"  id="app12" value="app12"><%}%><%=APPROVER36==null?"":APPROVER36%> 
		<input  name = "app12H" id="app12H" type="hidden" value="<%=AP36==null?"":AP36%>"  /></td>
		 <td class = "normal" height = "25" align="left"><%if(APPROVER36 ==null){}else{%>Branch Head<%}%></td>
        </tr>
      </table>
<br>
      <table width="100%" border="0" cellspacing="4" cellpadding="0">
<tr><td width="33%" align="right" valign="top" class="normal">Remarks :</td><td align="left"><textarea name="remarksContainer" cols="50" rows="5" maxlength="2000" onkeydown="textCounter(document.specialReview.remarksContainer,'lineCountDescription',2000)" onkeyup="textCounter(document.specialReview.remarksContainer,'lineCountDescription',2000)" ></textarea></td>
<div><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td id="lineCountDescription"  class="small"  width="55%" align="right">2000</td><td align="left" class="small">&nbsp;Characters Left</td></tr></table></div>
</td></tr>

        <tr>
          <td align="center" valign="middle"><br><input name="submitForm1" onclick="specialReview1();" type="button" class="bold" id="submitForm1" value="Submit" />&nbsp;&nbsp;<input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" /></td>
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