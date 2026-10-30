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
<meta http-equiv="X-UA-Compatible" content="IE=Edge" >

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL</title>
<link href="style/global.css" rel="stylesheet" type="text/css" />
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
</style>
<script src="jscripts/calendarControl.js" language="javascript"></script>
<link href="style/calendarControl.css" rel="stylesheet">
<script type="text/javascript">

var counter = 0;

function addRow()
{

  counter = document.priceApprovalMain.count.value;
  counter = parseInt(counter) + 1;
//alert("counter add : "+counter);
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
/*	if(document.priceApprovalMain.count.value.length==0)
	{
		counter = 2;
	}
	else
	{
		counter = document.priceApprovalMain.count.value;
	}

	if(counter > 2)
	{
	document.getElementById("inputtable").deleteRow(counter);
	counter = counter - 1;
	document.priceApprovalMain.count.value = counter;
	}*/
 
	//alert(counter);
	//alert(document.priceApprovalMain.count.value);

if(counter > 2)
	{
//alert("counter delete : "+counter);

	document.getElementById("inputtable").deleteRow(counter);
	counter = counter - 1;
	document.priceApprovalMain.count.value = counter;
	}
}
</script>
</head>
<%
        String tOId			= (String)request.getParameter("tOId");

		String priceid		= (String)request.getParameter("priceid");

		ArrayList vStatus	=  new ArrayList();
	
		vStatus 			=	priceApprovalWebController.viewStatusReview(tOId,priceid);

		ArrayList vStatus1	=  new ArrayList();
	
		vStatus1 			=	priceApprovalWebController.viewApp2(tOId,priceid);

		ArrayList vStatus2	=  new ArrayList();
	
		vStatus2 			=	priceApprovalWebController.viewApproverDetails(priceid);

	
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
		out.println(NEGOTIATION_VALUE);
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
//System.out.print("------"+AP13);
		String AP21							= data1[49];
		String AP22							= data1[50];
		String AP23							= data1[51];
		String AP31							= data1[52];
		String AP32							= data1[53];
		String AP33							= data1[54];
		out.println(AP33);
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
                    lstComps += "<option value=\""+companyDataArry[0]+"\" "+(COMPANY.equals(companyDataArry[0])? "SELECTED":"")+">"+companyDataArry[2]+"</option>";
               }
            } 
 String approverType="";
 String app4        ="";
 String app5        ="";
 String app6        ="";
 String app7        ="";
 String app9        ="";
 String cat = "";
	
	if(CATEGORY.equals("Group Company related buying")){
		cat = "9";
	}else if(CATEGORY.equals("Projects")){
		cat = "7";
	}else if(CATEGORY.equals("IT buying")){
		cat = "3";
	}else if(CATEGORY.equals("Logistics")){
		cat = "10";
	}
	
        Hashtable apprData = new Hashtable();
        approverType="AP4";
        apprData.put("companyCode",COMPANY);
        apprData.put("approverType",approverType);
		if(cat.equals("9") && (COMPANY.equals("1005") || COMPANY.equals("1006"))){
			apprData.put("category","GCRB");
		}else if(cat.equals("7") && (COMPANY.equals("1005") || COMPANY.equals("1006"))){
			apprData.put("category","PRJ");
		}else if(cat.equals("3") && (COMPANY.equals("1005") || COMPANY.equals("1006"))){
			apprData.put("category","ITB");
		}else if(cat.equals("10") && (deptGroup.equals("1026"))){
			apprData.put("category","LGS"); 
		}else {
			apprData.put("category","NA"); 
		}
		
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
}else{

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
	
	

    if(COMPANY.equals("1000") && (!deptGroup.equals("1026")))
    {
        //label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">(Delegated Authority) &nbsp; &#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        //label2 = "<span class=\"small\">Executive Director</span>";
        label2 = "<span class=\"small\">COO (Publishing)</span>";
        label3 = "<span class=\"small\">COO</span>";
        //label4 = "<span class=\"small\">CEC & ED</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";
		
    } else if (COMPANY.equals("1000") && (deptGroup.equals("1026")))
    {
        //label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">(Delegated Authority) &nbsp; &#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        label1 = "<span class=\"small\">Director RMD</span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        //label2 = "<span class=\"small\">Executive Director</span>";
        label2 = "<span class=\"small\">COO (Publishing)</span>";
        label3 = "<span class=\"small\">COO</span>";
        //label4 = "<span class=\"small\">CEC & ED</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";
		
    }
	else if(COMPANY.equals("1033"))
    {
        //label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">(Delegated Authority) &nbsp; &#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
		 label1 = "<span class=\"small\">CEO/COO Artha</span>";
        label2 = "<span class=\"small\">President Artha</span>";
        label3 = "<span class=\"small\">MD Artha</span>";
        //label4 = "<span class=\"small\">CEC & ED</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";
		
    }else if(COMPANY.equals("1005") || COMPANY.equals("1006"))
    {        //out.println(CATEGORY);
        if(CATEGORY.equals("Group Company related buying") || CATEGORY.equals("Projects") || CATEGORY.equals("IT buying") ){
			
			label1 = "<span class=\"small\">Group Company CEO</span>";
			label2 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
			//label3 = "<span class=\"small\">Executive Director</span>";
			label3 = "<span class=\"small\">COO (Publishing)</span>";
			//label4 = "<span class=\"small\">CEC & ED</span>";
			label4 = "<span class=\"small\">CEO (Publishing)</span>";
			
		}else{
			
			label1 = "<span class=\"small\">Sr VP Finance</span>";
			label2 = "<span class=\"small\">COO - E.P. - Finance</span>";
			label3 = "<span class=\"small\">MD / CEO</span>";
			label4 = "<span class=\"small\"></span>";
		
		}
		
    }else if(COMPANY.equals("1501")){

		label1 = "<span class=\"small\">Sr VP Finance</span>";
			label2 = "<span class=\"small\">COO - E.P. - Finance</span>";
			//label3 = "<span class=\"small\">MD / CEO</span>";
			label3 = "<span class=\"small\">MD'S Office</span>";
			label4 = "<span class=\"small\"></span>";	
	}	
	else{
        label1  ="<span class=\"small\">Group Company CEO/COO</span>";
        label2 = "<span class=\"small\">Director B&C</span>";
        //label2 = "<span class=\"small\">Director B&C</span><span class=\"redsmall\" id=\"changeLabel2\"><br>(Delegated Authority)</span>";
        //label3 = "<span class=\"small\">Executive Director</span>";
        label3 = "<span class=\"small\">COO (Publishing)</span>";
        if(COMPANY.equals("1003")){
			label4 = "<span class=\"small\">Head - TIL</span>";
		}else if(COMPANY.equals("1004")){
			label4 = "<span class=\"small\">Head - TBS (Div of TIL)</span>";
		}else if(COMPANY.equals("1035")){
			label4 = "<span class=\"small\">Head - MRSL</span>";
		}else if(COMPANY.equals("1017")){
			label1 = "<span class=\"small\">CFO TIML</span>";
			label3 = "<span class=\"small\">CEO TIML</span>";
			//label4 = "<span class=\"small\">CEC & ED - BCCL</span>";
			label4 = "<span class=\"small\">CEO (Publishing)</span>";
		}else{
			//label4 = "<span class=\"small\">CEC & ED - BCCL</span>";
			label4 = "<span class=\"small\">CEO (Publishing)</span>";
		}
    }



%>
<body onload="showStatus();showSAB();<%if(timescapeUserOId==3799 || timescapeUserOId==791 || timescapeUserOId==28163 || timescapeUserOId==28090){%>showAllRequests();<%flg = 1;}%>">
<form name="priceApprovalMain" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="77%"><img src="images/header_price1.jpg" width="842" height="44" /></td>
    <td width="23%" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="38"><img src="images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
  </tr>
	<% if(STATUS.equals("D") && CREATEDBY.equals(tOId)) { %>
    <tr>
		<td colspan="3" height="25" align="right"><a href="common/submitRequest.jsp?priceid=<%=priceid%>" class="normal"><b>Submit Request</b></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<%}%>
</table>
<table width="100%" cellspacing="2" cellpadding="2" border="0">

<tr bgcolor="#fbf9f9"  class="travelMenuBG">
     <td colspan="4" >
	 
	 <table width="100%" border = "0" cellspacing="1" cellpadding="1" >
	  <tr>

		<td  width="14%" align="left" class="travelMenuBG" >SANCTIONED REF TYPE :</td>
		<td  width="10%" align="left" >
		<select id="sanctionedRefType" name="sanctionedRefType"  class="small">
 			 <option value="Capex" <%if(SANCTIONEDREFTYPE.equals("Capex")){%>selected="selected"<%}%>>Capex</option>
			 <option value="Purchase request" <%if(SANCTIONEDREFTYPE.equals("Purchase request")){%>selected="selected"<%}%>>Purchase Request</option>
		</select> 
		 </span>
		</td> 
		<td  width="14%" align="left"   class="travelMenuBG" >REF NUMBER :</td>
		<td  width="10%" align="left" class="travelMenuBG"  ><span class="small">
		    <input name="refNumber" id ="refNumber" class="small" size="30" value="<%=REFNUMBER%>" /></span></td>

		<td  width="12%" align="left"   class="travelMenuBG" >DATE OF APPROVAL :</td>
		<td  width="15%" align="left" class="travelMenuBG"  ><span class="small">
		    <input name="dateOfApproval" id= "dateOfApproval" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" value="<%=DATEOFAPPROVAL%>" />
		 </span>
		 </td>
		<td  width="10%" align="left" class="travelMenuBG"  >Company :</td>
		<td  width="20%" align="left" >
		<select id="company" name="company"  class="small" style="width:130px;" disabled>
                    <%=lstComps%>
		<input type="hidden" id="COMPANY" name="COMPANY" value="<%=COMPANY%>">
 		</select> 
		 </span>
		</td> 
	  </tr>
	</table>
	 
	 
	 </td>
	
  <tr>
  <tr bgcolor="#fbf9f9"  class="travelMenuBG">
     <td colspan="2" align="right" ><span class="normal">CATEGORY&nbsp;:&nbsp;</span></td>
	 <td colspan="2"><span class="normal" ><%=CATEGORY%></span></td>
	 <input type="hidden" id="category" name="category" value="<%=CATEGORY%>">

  <tr>
    <td height="26" colspan="2" bgcolor="#fbf9f9" class="travelMenuBG">PC MEETING DETAILS</td>
    <td colspan="2" align="left" bgcolor="#fbf9f9" class="travelMenuBG">PURCHASE DETAILS</td>
  </tr>
  <tr>
    <td width="18%" height="27" bgcolor="#fbf9f9"><span class="small" id="top">Negotiation/PC meeting date:</span></td>
    <td width="26%" align="left"><span class="small">
<%    
  //  if (NEGOTIATION_PC_DATE == null){
  //      NEGOTIATION_PC_DATE=" ";
%>
      <input name="requestedBy" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" value="<%=NEGOTIATION_PC_DATE == null ? "" :NEGOTIATION_PC_DATE%>" /><font size="3" color="red">&nbsp;&#42&nbsp;</font>
<%//}else{%>
    <!-- <input name="requestedBy" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" value="<%//=NEGOTIATION_PC_DATE%>" /><font size="3" color="red">&nbsp;&#42&nbsp;</font> -->
<%
 //   }
%>
    </span></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Description:</span></td>
    <td width="35%" align="left"><span class="small">
     <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <textarea name="requestedBy2" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy2,'requestedBy2Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy2,'requestedBy2Description',100)" ><%=PRODUCT_SERVICE__NAME == null ? "" : PRODUCT_SERVICE__NAME%></textarea>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy2Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Negotiation/PC meeting venue:</span></td>
    <td width="30%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%"><textarea name="reason4" rows="2" class="small" onkeydown="textCounter(document.priceApprovalMain.reason4,'lineCountDescription',50)" onkeyup="textCounter(document.priceApprovalMain.reason4,'lineCountDescription',50)"><%=NEGOTIATION_PC_MEETING_VENUE== null ? "" :NEGOTIATION_PC_MEETING_VENUE%></textarea></td>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="lineCountDescription" align="left" width="8%">50</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
		<!--<input name="lineCountDescription" class="style3" value="100" size="3" maxlength="3" readonly="readOnly" />-->
    </span></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Intended User/ User group:</span></td>
    <td width="35%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy3" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy3,'requestedBy3Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy3,'requestedBy3Description',100)" value="<%=INDENTED_USER== null ? "" :INDENTED_USER%>"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy3Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
      </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><p class="small">Negotiated value (Rs):</p></td>
    <td width="26%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy7" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.requestedBy7,'requestedBy7Description',10)" onkeyup="textCounter(document.priceApprovalMain.requestedBy7,'requestedBy7Description',10);negValCheck1(); setSelectedIndex();spaceAlert(document.priceApprovalMain.requestedBy7.value);hideShowMsg();" value="<%=NEGOTIATION_VALUE%>"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy7Description" align="left" width="8%">10</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    <td width="21%" valign="middle" rowspan="2" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Project:</span></td>
    <td width="35%" valign="middle" rowspan="2"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%" >
	  <input name="requestedBy4" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy4,'requestedBy4Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy4,'requestedBy4Description',100)" value="<%=PACKAGE_NAME_SANCTION%>" />
	  <td width="3%"></td>
	  <td id="requestedBy4Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>

  <tr>
    <td bgcolor="#fbf9f9"><p class="small">Validity Period :</p></td>
    <td width="26%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="validity" class="small" maxlength="20" valign="middle" onkeydown="textCounter(document.priceApprovalMain.validity,'validityDescription',20)" onkeyup="textCounter(document.priceApprovalMain.validity,'validityDescription',20)"  value="<%=VALIDITY_PERIOD== null ? "" :VALIDITY_PERIOD%>"/>
	  <td width="3%"></td>
	  <td id="validityDescription" align="left" width="8%">20</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    
  </tr>

  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Finalized vendor(s) name :</span></td>
    <td width="26%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy8" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy8,'requestedBy8Description',50)" onkeyup="textCounter(document.priceApprovalMain.requestedBy8,'requestedBy8Description',50)" value="<%=FINALIZED_VENDOR_NAME== null ? "" :FINALIZED_VENDOR_NAME%>" />
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy8Description" align="left" width="8%">50</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Total Budget (Rs.) / Sanction:</span></td>
    <td width="35%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy5" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.requestedBy5,'requestedBy5Description',10)" onkeyup="textCounter(document.priceApprovalMain.requestedBy5,'requestedBy5Description',10);autoFillBalanceBudget();spaceAlert(document.priceApprovalMain.requestedBy5.value);" value="<%=TOTAL_BUDGET== null ? "" :TOTAL_BUDGET%>"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy5Description" align="left" width="8%">20</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Payment Terms:</span></td>
    <td width="26%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <textarea name="reason" rows="2" class="small" onkeydown="textCounter(document.priceApprovalMain.reason,'reasonDescription',150)" onkeyup="textCounter(document.priceApprovalMain.reason,'reasonDescription',150)"><%=PAYMENT_TERMS== null ? "" :PAYMENT_TERMS%></textarea>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="reasonDescription" align="left" width="8%">150</td>
	  <td align="left">Chars Left</td>
	  </tr>	
	  </table>
      </span></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">PO's Commited till date (Rs.)</span></td>
    <td width="35%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="fqtNumber" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.fqtNumber,'fqtNumberDescription',10)" onkeyup="textCounter(document.priceApprovalMain.fqtNumber,'fqtNumberDescription',10);autoFillBalanceBudget();spaceAlert(document.priceApprovalMain.fqtNumber.value);"value="<%=PO_COMMITTED_TILL_DATE== null ? "" :PO_COMMITTED_TILL_DATE%>"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="fqtNumberDescription" align="left" width="8%">10</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
      </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Savings (Rs.):</span></td>
    <td width="26%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy9" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.requestedBy9,'requestedBy9Description',10)" onkeyup="textCounter(document.priceApprovalMain.requestedBy9,'requestedBy9Description',10);savingsChk();spaceAlert(document.priceApprovalMain.requestedBy9.value);" value="<%=SAVINGS== null ? "" :SAVINGS%>"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy9Description" align="left" width="8%">10</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    <td width="21%" height="26" rowspan="2" align="left" valign="middle" bgcolor="#fbf9f9" class="small">Balance Budget(Rs.)</td>
    <td valign="middle" width="35%" rowspan="2" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy6" class="small" maxlength="100" readonly="readonly" value="<%=BALANCE_BUDGET== null ? "" :BALANCE_BUDGET%>" />
	  <!-- onkeydown="textCounter(document.priceApprovalMain.requestedBy6,'requestedBy6Description',20)" onkeyup="textCounter(document.priceApprovalMain.requestedBy6,'requestedBy6Description',20)" -->
	  <td width="3%"></td>
	  <td id="requestedBy6Description" align="left" width="8%"><!-- 20 --></td>
	  <td align="left"><!-- Chars Left --></td>
	  </tr>
	  </table>
    </span></td>
  </tr>
    <tr>
    <td bgcolor="#fbf9f9"><span class="small">Cost Avoidance (Rs):</span></td>
    <td width="26%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy10" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.requestedBy10,'requestedBy10Description',10)" onkeyup="textCounter(document.priceApprovalMain.requestedBy10,'requestedBy10Description',10);savingsChk();spaceAlert(document.priceApprovalMain.requestedBy10.value);" value="<%=COST_AVOIDANCE== null ? "" :COST_AVOIDANCE%>"/>
	  <td width="3%"></td>
	  <td id="requestedBy10Description" align="left" width="8%">10</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>

</table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">
 <tr>
    <td height="22" bgcolor="#ffffff" class="travelMenuBG">BACKGROUND</td>
  </tr>
  <tr>
  <td colspan="3" rowspan="4" align="left" valign="top"><textarea name="req" id="req" cols="25" rows="7" maxlength="2000" onkeydown="textCounter(document.priceApprovalMain.req,'reqChar',2000)" onkeyup="textCounter(document.priceApprovalMain.req,'reqChar',2000)" style ="height:130px;width:99%" ><%=REQUIREMENT%></textarea>
		<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="reqChar" width="3%" class="small">2000</td><td class="small">Chars Left</td></tr></table></div>
	</td>
	</tr>
</table>
<table width="100%" cellspacing="2" cellpadding="2">
<tbody id="inputtable">
<tr class="greyBG">
    <td width="13%" height="29" >VENDOR</td>
    <td width="9%" align="left">INITIAL OFFER (Rs)</td>
    <td width="9%" align="left">FINAL OFFER (Rs)</td>
    <td width="10%" align="left">DELIVERY / COMPLETION PERIOD</td>
<!--     <td width="4%" align="left">Warranty/ Defect Liability Period</td>
 -->    <td width="13%" align="left">PAYMENT TERMS</td>
    <td width="13%" align="left">VALUE ADD</td>
	</tr>
  
  

<%
    if(vStatus1.size()>=1)
	{
		String[] data2 = (String [])vStatus1.get(0);
%>
  <tr>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="v1" cols="25"  rows="2" class="small" maxlength="50" onkeydown="textCounter(document.priceApprovalMain.v1,'vendorChar',50)" onkeyup="textCounter(document.priceApprovalMain.v1,'vendorChar',50)" ><%=data2[2]%></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vendorChar" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="i1" id="i1"cols="15"  rows="2" class="small"  size="30" maxlength="15" onkeydown="textCounter(document.priceApprovalMain.i1,'initChar',10)" onkeyup="textCounter(document.priceApprovalMain.i1,'initChar',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.i1.value);"><%=data2[3]%></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="initChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="f1" id="f1"  rows="2" cols="15" class="small" size="10" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.f1,'finOffChar',10)" onkeyup="textCounter(document.priceApprovalMain.f1,'finOffChar',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.f1.value);"><%=data2[4]%></textarea>       
    </span>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="finOffChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="d1" rows="2" class="small" maxlength="30" onkeydown="textCounter(document.priceApprovalMain.d1,'dcpChar',30)" onkeyup="textCounter(document.priceApprovalMain.d1,'dcpChar',30)" ><%=data2[5]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="dcpChar" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="pt1" rows="2" class="small" cols="25" maxlength="120" onkeydown="textCounter(document.priceApprovalMain.pt1,'ptChar1',120)" onkeyup="textCounter(document.priceApprovalMain.pt1,'ptChar1',120)"><%=data2[11]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="ptChar1" width="10%" class="small">120</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="va1" rows="2" class="small" maxlength="225" cols="25" onkeydown="textCounter(document.priceApprovalMain.va1,'vaChar1',225)" onkeyup="textCounter(document.priceApprovalMain.va1,'vaChar1',225)"><%=data2[12]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vaChar1" width="10%" class="small">225</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

 </tr>
 <%
    }
    //out.println("size:"+vStatus1.size());
    for(int i=1;i<vStatus1.size();i++)
	{
		String[] data2 = (String [])vStatus1.get(i);
 %>
  <tr>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="v<%=i+1%>" cols="25"  rows="2"  maxlength="50" class="small" onkeydown="textCounter(document.priceApprovalMain.v2,'vendorChar2',50)" onkeyup="textCounter(document.priceApprovalMain.v2,'vendorChar2',50)" ><%=data2[2]%></textarea> 
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vendorChar2" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="i<%=i+1%>" id="i<%=i+1%>" cols="15"  rows="2" class="small"  size="30" maxlength="10" value="" onkeydown="textCounter(document.priceApprovalMain.i2,'initChar2',10)" onkeyup="textCounter(document.priceApprovalMain.i2,'initChar2',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.i<%=i+1%>.value);" ><%=data2[3]%></textarea>    
    </span>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="initChar2" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea class="small" name="f<%=i+1%>"  id="f<%=i+1%>" rows="2" cols="15"  size="10" maxlength="10"    onkeydown="textCounter(document.priceApprovalMain.f2,'finChar2',10)" onkeyup="textCounter(document.priceApprovalMain.f2,'finChar2',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.f<%=i+1%>.value);"><%=data2[4]%></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="finChar2" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
    
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="d<%=i+1%>" rows="2" class="small"  size="20" maxlength="30" onkeydown="textCounter(document.priceApprovalMain.d2,'dcpChar2',30)" onkeyup="textCounter(document.priceApprovalMain.d2,'dcpChar2',30)" ><%=data2[5]%></textarea>
    </span>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="dcpChar2" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="pt<%=i+1%>" rows="2" class="small" maxlength="120" cols="25"  onkeydown="textCounter(document.priceApprovalMain.pt2,'ptChar2',120)" onkeyup="textCounter(document.priceApprovalMain.pt2,'ptChar2',120)"><%=data2[11]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="ptChar2" width="10%" class="small">120</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="va<%=i+1%>" rows="2" class="small" maxlength="225" cols="25"  onkeydown="textCounter(document.priceApprovalMain.va2,'vaChar2',225)" onkeyup="textCounter(document.priceApprovalMain.va2,'vaChar2',225)"><%=data2[12]%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vaChar2" width="10%" class="small">225</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    
  </tr>
<%
   }
%>
   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="Add Textbox" name="add" onclick="addRow()" class="bold">
   <input type="button" value="Remove Textbox" name="add" onclick="delRow()" class="bold"></td></tr>
   <input type="hidden" name="count" value="<%=vStatus1.size()%>" />	
 </table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">
<tr>
    <td height="55" bgcolor="#ffffff" class="travelMenuBG">RECOMMENDATION</td>
	<td height="45" colspan="2" align="left" valign="middle" class="travelMenuBG">ATTACHMENTS</td> 
  </tr>
<tr>
<td width="55%" rowspan="4" align="left" valign="top"><textarea name="recommendation" id="recommendation" maxlength="3000" cols="55" rows="12" onkeydown="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" onkeyup="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" style ="height:170px;width:96%" ><%=RECOMMENEDATION%></textarea><div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="recommendationChar" width="3%" class="small">3000</td><td class="small">Chars Left</td></tr></table></div></td>
<td width="22%" height="25" align="left" valign="top" class="greyBG">DESCRIPTION</td>
 <td width="22%" height="25" align="left" valign="top" class="greyBG">ATTACH</td>
</tr>
 <%
        String tempName = "";
		if(!(ATTACHMENT1.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT1.substring(0, ATTACHMENT1.lastIndexOf("."));
				 String  st2 = ATTACHMENT1.substring(ATTACHMENT1.lastIndexOf(".")+1,ATTACHMENT1.length());
                 String  st3 = st1.substring(0, ATTACHMENT1.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
 %>
 <tr>
    <td  height="25" align="left" valign="top"><span class="small">
	 <select name="reason1" id="reason1" class="small">
	
	 <% if(DESCRIPTION1.equals("NA")){%>
        <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
        <option value="Final recommended summary">Final recommended summary</option>
        <option value="Others">Others</option>
      <%} else { %>
        <option value="Comparative chart"  <%if(DESCRIPTION1.equals("Comparative chart")){%>selected="selected"<%}%>>Comparative chart</option>
		<option value="Final recommended summary" <%if(DESCRIPTION1.equals("Final recommended summary")){%>selected="selected"<%}%>>Final recommended summary</option>
		<option value="Others" <%if(DESCRIPTION1.equals("Others")){%>selected="selected"<%}%>>Others</option>
<% } %>
	  </select>
   
     <!--  <textarea name="reason1" rows="2" class="small" maxlength="50"><%=DESCRIPTION1%></textarea> -->
    </span></td>

    <td  height="25" align="left" valign="top"><textarea name="attach1" type="text" class="small" id="attach1" readonly="readonly"><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach1')"><img src="images/attachment.gif" border="0" /></a><a href="javascript:void(0)" onclick="delAttach1('1')"><img src="images/delete.gif" border="0" /></a><input name="attach1New" type="hidden" id="attach1New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT1:""%>" /></td>
</tr>
	<%
        tempName = "";
		if(!(ATTACHMENT2.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT2.substring(0, ATTACHMENT2.lastIndexOf("."));
				 String  st2 = ATTACHMENT2.substring(ATTACHMENT2.lastIndexOf(".")+1,ATTACHMENT2.length());
                 String  st3 = st1.substring(0, ATTACHMENT2.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
  %>
  <tr>
    <td height="25" valign="top" align="left"><span class="small">
	 <select name="reason2" id="reason2" class="small">
	 
	  <% if(DESCRIPTION2.equals("NA")){%>
        <option value="NA">Select Description</option>
         <option value="Comparative chart">Comparative chart</option>
         <option value="Final recommended summary">Final recommended summary</option>
         <option value="Others">Others</option>
      <%} else { %>
        <option value="Comparative chart"  <%if(DESCRIPTION2.equals("Comparative chart")){%>selected="selected"<%}%>>Comparative chart</option>
		<option value="Final recommended summary" <%if(DESCRIPTION2.equals("Final recommended summary")){%>selected="selected"<%}%>>Final recommended summary</option>
		<option value="Others" <%if(DESCRIPTION2.equals("Others")){%>selected="selected"<%}%>>Others</option>
<% } %>
	  </select>
   
    <!--   <textarea name="reason2" rows="2" class="small" maxlength="50"><%=DESCRIPTION2%></textarea> -->
    </span></td>
    <td height="25" valign="top" align="left"><textarea name="attach2" type="text" class="small" id="attach2"  readonly="readonly" value="" ><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach2')"><img src="images/attachment.gif" border="0" /><a href="javascript:void(0)" onclick="delAttach1('2')"><img src="images/delete.gif" border="0" /></a></a><input name="attach2New" type="hidden" id="attach2New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT2:""%>" /></td>
	</tr>

    <%
            tempName = "";
			if(!(ATTACHMENT3.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT3.substring(0, ATTACHMENT3.lastIndexOf("."));
				 String  st2 = ATTACHMENT3.substring(ATTACHMENT3.lastIndexOf(".")+1,ATTACHMENT3.length());
                 String  st3 = st1.substring(0, ATTACHMENT3.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
    %>
  <tr>
    <td height="36" valign="top" align="left"><span class="small">

	 <select name="reason3" id="reason3" class="small">

	  <% if(DESCRIPTION3.equals("NA")){%>
        <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
        <option value="Final recommended summary">Final recommended summary</option>
        <option value="Others">Others</option>
      <%} else { %>
        <option value="Comparative chart"  <%if(DESCRIPTION3.equals("Comparative chart")){%>selected="selected"<%}%>>Comparative chart</option>
		<option value="Final recommended summary" <%if(DESCRIPTION3.equals("Final recommended summary")){%>selected="selected"<%}%>>Final recommended summary</option>
		<option value="Others" <%if(DESCRIPTION3.equals("Others")){%>selected="selected"<%}%>>Others</option>
<% } %>
	  </select>
   
     <!--  <textarea name="reason3" rows="2" class="small" maxlength="50"><%=DESCRIPTION3%></textarea> -->
    </span></td>
    <td height="36" valign="top" align="left"><textarea name="attach3" type="text" class="small" id="attach3" value="" readonly="readonly" ><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach3')"><img src="images/attachment.gif" border="0" /></a><a href="javascript:void(0)" onclick="delAttach1('3')"><img src="images/delete.gif" border="0" /></a><input name="attach3New" type="hidden" id="attach3New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT3:""%>" /></td>
	</tr>
<%
         tempName = "";
		if(!(ATTACHMENT4.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT4.substring(0, ATTACHMENT4.lastIndexOf("."));
				 String  st2 = ATTACHMENT4.substring(ATTACHMENT4.lastIndexOf(".")+1,ATTACHMENT4.length());
                 String  st3 = st1.substring(0, ATTACHMENT4.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
 %>
 <tr>
    <td height="22" valign="top" align="left"><span class="small">
    <td height="22" valign="top" align="left"><span class="small">
	 <select name="reason44" id="reason44" class="small">
	
	 <% if(DESCRIPTION4.equals("NA")){%>
        <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
        <option value="Final recommended summary">Final recommended summary</option>
        <option value="Others">Others</option>
      <%} else { %>
        <option value="Comparative chart"  <%if(DESCRIPTION4.equals("Comparative chart")){%>selected="selected"<%}%>>Comparative chart</option>
		<option value="Final recommended summary" <%if(DESCRIPTION4.equals("Final recommended summary")){%>selected="selected"<%}%>>Final recommended summary</option>
		<option value="Others" <%if(DESCRIPTION4.equals("Others")){%>selected="selected"<%}%>>Others</option>
<% } %>
	  </select>
   
     <!--  <textarea name="reason1" rows="2" class="small" maxlength="50"><%=DESCRIPTION1%></textarea> -->
    </span></td>

    <td  height="25" align="left" valign="top"><textarea name="attach4" type="text" class="small" id="attach4" readonly="readonly"><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach4')"><img src="images/attachment.gif" border="0" /></a><a href="javascript:void(0)" onclick="delAttach1('4')"><img src="images/delete.gif" border="0" /></a><input name="attach4New" type="hidden" id="attach4New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT4:""%>" /></td>
</tr>
  <tr>
     <td colspan="5" align="left" valign="middle" class="travelMenuBG">Additional Attachments</td>
  </tr>
	<tr>
<table>
<%
         tempName = "";
		if(!(ATTACHMENT5.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT5.substring(0, ATTACHMENT5.lastIndexOf("."));
				 String  st2 = ATTACHMENT5.substring(ATTACHMENT5.lastIndexOf(".")+1,ATTACHMENT5.length());
                 String  st3 = st1.substring(0, ATTACHMENT5.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
 %>
 <tr>
    <td height="22" valign="top" align="left"><span class="small">
    <td  height="25" align="left" valign="top"><span class="small">
	 <select name="reason5" id="reason5" class="small">
	
	 <% if(DESCRIPTION5.equals("NA")){%>
        <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
        <option value="Final recommended summary">Final recommended summary</option>
        <option value="Others">Others</option>
      <%} else { %>
        <option value="Comparative chart"  <%if(DESCRIPTION5.equals("Comparative chart")){%>selected="selected"<%}%>>Comparative chart</option>
		<option value="Final recommended summary" <%if(DESCRIPTION5.equals("Final recommended summary")){%>selected="selected"<%}%>>Final recommended summary</option>
		<option value="Others" <%if(DESCRIPTION5.equals("Others")){%>selected="selected"<%}%>>Others</option>
<% } %>
	  </select>
   
     <!--  <textarea name="reason1" rows="2" class="small" maxlength="50"><%=DESCRIPTION1%></textarea> -->
    </span></td>
<td height="22" valign="top" align="left"><span class="small">&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td  height="25" align="left" valign="top"><textarea name="attach5" type="text" class="small" id="attach5" readonly="readonly"><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach5')"><img src="images/attachment.gif" border="0" /></a><a href="javascript:void(0)" onclick="delAttach1('5')"><img src="images/delete.gif" border="0" /></a><input name="attach5New" type="hidden" id="attach5New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT5:""%>" /></td>
<!-- </tr> -->
<%
         tempName = "";
		if(!(ATTACHMENT6.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT6.substring(0, ATTACHMENT6.lastIndexOf("."));
				 String  st2 = ATTACHMENT6.substring(ATTACHMENT6.lastIndexOf(".")+1,ATTACHMENT6.length());
                 String  st3 = st1.substring(0, ATTACHMENT6.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
 %>
 <!-- <tr> -->
    <td height="22" valign="top" align="left"><span class="small">
    <td  height="25" align="left" valign="top"><span class="small">
	 <select name="reason6" id="reason6" class="small">
	
	 <% if(DESCRIPTION6.equals("NA")){%>
        <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
        <option value="Final recommended summary">Final recommended summary</option>
        <option value="Others">Others</option>
      <%} else { %>
        <option value="Comparative chart"  <%if(DESCRIPTION6.equals("Comparative chart")){%>selected="selected"<%}%>>Comparative chart</option>
		<option value="Final recommended summary" <%if(DESCRIPTION6.equals("Final recommended summary")){%>selected="selected"<%}%>>Final recommended summary</option>
		<option value="Others" <%if(DESCRIPTION6.equals("Others")){%>selected="selected"<%}%>>Others</option>
<% } %>
	  </select>
   
     <!--  <textarea name="reason1" rows="2" class="small" maxlength="50"><%=DESCRIPTION1%></textarea> -->
    </span></td>
<td height="22" valign="top" align="left"><span class="small">&nbsp;&nbsp;&nbsp;</td>
    <td  height="25" align="left" valign="top"><textarea name="attach6" type="text" class="small" id="attach6" readonly="readonly"><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach6')"><img src="images/attachment.gif" border="0" /></a><a href="javascript:void(0)" onclick="delAttach1('6')"><img src="images/delete.gif" border="0" /></a><input name="attach6New" type="hidden" id="attach6New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT6:""%>" /></td>
<!-- </tr> -->
<%
         tempName = "";
		if(!(ATTACHMENT7.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT7.substring(0, ATTACHMENT7.lastIndexOf("."));
				 String  st2 = ATTACHMENT7.substring(ATTACHMENT7.lastIndexOf(".")+1,ATTACHMENT7.length());
                 String  st3 = st1.substring(0, ATTACHMENT7.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
 %>
 <!-- <tr> -->
    <td height="22" valign="top" align="left"><span class="small">
    <td  height="25" align="left" valign="top"><span class="small">
	 <select name="reason7" id="reason7" class="small">
	
	 <% if(DESCRIPTION7.equals("NA")){%>
        <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
        <option value="Final recommended summary">Final recommended summary</option>
        <option value="Others">Others</option>
      <%} else { %>
        <option value="Comparative chart"  <%if(DESCRIPTION7.equals("Comparative chart")){%>selected="selected"<%}%>>Comparative chart</option>
		<option value="Final recommended summary" <%if(DESCRIPTION7.equals("Final recommended summary")){%>selected="selected"<%}%>>Final recommended summary</option>
		<option value="Others" <%if(DESCRIPTION7.equals("Others")){%>selected="selected"<%}%>>Others</option>
<% } %>
	  </select>
   
     <!--  <textarea name="reason1" rows="2" class="small" maxlength="50"><%=DESCRIPTION1%></textarea> -->
    </span></td>
<td height="22" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td  height="25" align="left" valign="top"><textarea name="attach7" type="text" class="small" id="attach7" readonly="readonly"><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach7')"><img src="images/attachment.gif" border="0" /></a><a href="javascript:void(0)" onclick="delAttach1('7')"><img src="images/delete.gif" border="0" /></a><input name="attach7New" type="hidden" id="attach7New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT7:""%>" /></td>
</tr>
</table>
</tr>
<%
         tempName = "";
		if(!(ATTACHMENT8.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT8.substring(0, ATTACHMENT8.lastIndexOf("."));
				 String  st2 = ATTACHMENT8.substring(ATTACHMENT8.lastIndexOf(".")+1,ATTACHMENT8.length());
                 String  st3 = st1.substring(0, ATTACHMENT8.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
 %>
<table>

 <tr>

    <td height="22" valign="top" align="left"><span class="small">
    <td  height="25" align="left" valign="top"><span class="small">
	 <select name="reason8" id="reason8" class="small">
	
	 <% if(DESCRIPTION8.equals("NA")){%>
        <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
        <option value="Final recommended summary">Final recommended summary</option>
        <option value="Others">Others</option>
      <%} else { %>
        <option value="Comparative chart"  <%if(DESCRIPTION8.equals("Comparative chart")){%>selected="selected"<%}%>>Comparative chart</option>
		<option value="Final recommended summary" <%if(DESCRIPTION8.equals("Final recommended summary")){%>selected="selected"<%}%>>Final recommended summary</option>
		<option value="Others" <%if(DESCRIPTION8.equals("Others")){%>selected="selected"<%}%>>Others</option>
<% } %>
	  </select>
   
     <!--  <textarea name="reason1" rows="2" class="small" maxlength="50"><%=DESCRIPTION1%></textarea> -->
    </span></td>
<td height="22" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td  height="25" align="left" valign="top"><textarea name="attach8" type="text" class="small" id="attach8" readonly="readonly"><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach8')"><img src="images/attachment.gif" border="0" /></a><a href="javascript:void(0)" onclick="delAttach1('8')"><img src="images/delete.gif" border="0" /></a><input name="attach8New" type="hidden" id="attach8New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT8:""%>" /></td>
<!-- </tr> -->
<%
         tempName = "";
		if(!(ATTACHMENT9.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT9.substring(0, ATTACHMENT9.lastIndexOf("."));
				 String  st2 = ATTACHMENT9.substring(ATTACHMENT9.lastIndexOf(".")+1,ATTACHMENT9.length());
                 String  st3 = st1.substring(0, ATTACHMENT9.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
 %>
 <!-- <tr> -->
    <td height="22" valign="top" align="left"><span class="small">
    <td  height="25" align="left" valign="top"><span class="small">
	 <select name="reason9" id="reason9" class="small">
	
	 <% if(DESCRIPTION9.equals("NA")){%>
        <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
        <option value="Final recommended summary">Final recommended summary</option>
        <option value="Others">Others</option>
      <%} else { %>
        <option value="Comparative chart"  <%if(DESCRIPTION9.equals("Comparative chart")){%>selected="selected"<%}%>>Comparative chart</option>
		<option value="Final recommended summary" <%if(DESCRIPTION9.equals("Final recommended summary")){%>selected="selected"<%}%>>Final recommended summary</option>
		<option value="Others" <%if(DESCRIPTION9.equals("Others")){%>selected="selected"<%}%>>Others</option>
<% } %>
	  </select>
   
     <!--  <textarea name="reason1" rows="2" class="small" maxlength="50"><%=DESCRIPTION1%></textarea> -->
    </span></td>
<td height="22" valign="top" align="left"><span class="small">&nbsp;&nbsp;&nbsp;</td>
    <td  height="25" align="left" valign="top"><textarea name="attach9" type="text" class="small" id="attach9" readonly="readonly"><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach9')"><img src="images/attachment.gif" border="0" /></a><a href="javascript:void(0)" onclick="delAttach1('9')"><img src="images/delete.gif" border="0" /></a><input name="attach9New" type="hidden" id="attach9New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT9:""%>" /></td>
<!-- </tr> -->

<%
         tempName = "";
		if(!(ATTACHMENT10.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT10.substring(0, ATTACHMENT10.lastIndexOf("."));
				 String  st2 = ATTACHMENT10.substring(ATTACHMENT10.lastIndexOf(".")+1,ATTACHMENT10.length());
                 String  st3 = st1.substring(0, ATTACHMENT10.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
 %>
 <!-- <tr> -->
    <td height="22" valign="top" align="left"><span class="small">
    <td  height="25" align="left" valign="top"><span class="small">
	 <select name="reason10" id="reason10" class="small">
	
	 <% if(DESCRIPTION10.equals("NA")){%>
        <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
        <option value="Final recommended summary">Final recommended summary</option>
        <option value="Others">Others</option>
      <%} else { %>
        <option value="Comparative chart"  <%if(DESCRIPTION10.equals("Comparative chart")){%>selected="selected"<%}%>>Comparative chart</option>
		<option value="Final recommended summary" <%if(DESCRIPTION10.equals("Final recommended summary")){%>selected="selected"<%}%>>Final recommended summary</option>
		<option value="Others" <%if(DESCRIPTION10.equals("Others")){%>selected="selected"<%}%>>Others</option>
<% } %>
	  </select>
   
     <!--  <textarea name="reason1" rows="2" class="small" maxlength="50"><%=DESCRIPTION1%></textarea> -->
    </span></td>
<td height="22" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td  height="25" align="left" valign="top"><textarea name="attach10" type="text" class="small" id="attach10" readonly="readonly"><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach10')"><img src="images/attachment.gif" border="0" /></a><a href="javascript:void(0)" onclick="delAttach1('10')"><img src="images/delete.gif" border="0" /></a><input name="attach10New" type="hidden" id="attach10New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT10:""%>" /></td>
</tr>
 </table>
<table width="100%" cellspacing="2" cellpadding="2">
  <tr>
   <!-- <td height="32" colspan="2" align="left" valign="middle" class="travelMenuBG">ATTACHMENTS</td> --> 
    <td colspan="5" align="left" valign="middle" class="travelMenuBG">BENCHMARKING</td>
    <!-- <td colspan="2" align="left" valign="middle" class="travelMenuBG">RECOMMENDATION</td> -->
  </tr>
  <tr>
   <!--  <td width="12%" height="25" align="left" valign="top" class="greyBG">DESCRIPTION</td>
    <td width="15%" height="25" align="left" valign="top" class="greyBG">ATTACH</td> -->

    <td width="20%" valign="left" valign="top" class="greyBG">VENDOR NAME</td>
    <td width="20%" valign="left" valign="top" class="greyBG">PRODUCT/SERVICE</td>
    <td width="20%" valign="left" valign="top" class="greyBG">RATE (Rs.)</td>
    <td width="20%" align="left" valign="top" class="greyBG">UOM</td>
    <td width="20%" valign="left" valign="top" class="greyBG">REMARKS</td>
    
    
  </tr>
 
  <tr>

    <td width="21%" align="left" valign="top" class="small"><textarea name="compName1" id="compName1" rows="2" class="small" maxlength="50" onkeydown="textCounter(document.priceApprovalMain.compName1,'cNChar1',100)" onkeyup="textCounter(document.priceApprovalMain.compName1,'cNChar1',100)"><%=COMPANY_NAME1%></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cNChar1" width="10%" class="small">100</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
    <td  align="left" valign="top"><span class="small">
      <textarea name="reason14" rows="2" class="small" cols="28" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.reason14,'pncChar',50)" onkeyup="textCounter(document.priceApprovalMain.reason14,'pncChar',50)"  ><%=PRODUCT1%></textarea>
    </span><div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="pncChar" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
	<td  align="left" valign="top"><span class="small">
      <textarea name="fromDateAir1" id="fromDateAir1" class="small" cols="10"  size="10" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.fromDateAir1,'rateChar',10)" onkeyup="textCounter(document.priceApprovalMain.fromDateAir1,'rateChar',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.fromDateAir1.value);"><%=RATE1%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rateChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
    
	<td  align="left" valign="top"><span class="small">
      <textarea name="UOM1"class="small" id="UOM1"  rows="2" cols="15" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.UOM1,'UOM1Char',15)" onkeyup="textCounter(document.priceApprovalMain.UOM1,'UOM1Char',15)"><%=UMO1%></textarea>
    </span>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="UOM1Char" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
	<td  align="left" valign="top"><span class="small">
      <textarea name="rem1" class="small" id="rem1"rows="2" class="small" cols="28" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.rem1,'rem1Char',200)" onkeyup="textCounter(document.priceApprovalMain.rem1,'rem1Char',200)"  ><%=REMARKS1%></textarea>
    </span>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rem1Char" width="10%" class="small">200</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
  </tr>

  <tr>
   
    <td valign="top" align="left"><span class="small">
      <textarea name="compName2" class="small" cols="28" id="compName2"  size="25" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.compName2,'cNChar2',100)" onkeyup="textCounter(document.priceApprovalMain.compName2,'cNChar2',100)" ><%=COMPANY_NAME2%></textarea>
    </span>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cNChar2" width="10%" class="small">100</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
	<td valign="top" align="left"><span class="small">
       <textarea name="reason15" rows="2" class="small" cols="28" maxlength="50" onkeydown="textCounter(document.priceApprovalMain.reason15,'pncChar2',50)" onkeyup="textCounter(document.priceApprovalMain.reason15,'pncChar2',50)" ><%=PRODUCT2%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="pncChar2" width="10%" class="small" >50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>

    <td valign="top" align="left"><span class="small">
      <textarea name="fromDateAir2" class="small" id="fromDateAir2" cols="10"  size="10" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.fromDateAir2,'rateChar2',10)" onkeyup="textCounter(document.priceApprovalMain.fromDateAir2,'rateChar2',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.fromDateAir2.value);" ><%=RATE2%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rateChar2" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
   
	<td  align="left" valign="top"><span class="small">
      <textarea name="UOM2" class="small" id="UOM2"  rows="2" cols="16" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.UOM2,'UOM2Char',15)" onkeyup="textCounter(document.priceApprovalMain.UOM2,'UOM2Char',15)" ><%=UMO2%></textarea>
    </span>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="UOM2Char" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
	<td  align="left" valign="top"><span class="small">
      <textarea name="rem2" rows="2" class="small" cols="28" maxlength="200"  onkeydown="textCounter(document.priceApprovalMain.rem2,'rem2Char',200)" onkeyup="textCounter(document.priceApprovalMain.rem2,'rem2Char',200)"  ><%=REMARKS2%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rem2Char" width="10%" class="small">200</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
  </tr>
   <!--  <%
            tempName = "";
			if(!(ATTACHMENT3.equals("NA.NA_NA")))
				{
				 String  st1 = ATTACHMENT3.substring(0, ATTACHMENT3.lastIndexOf("."));
				 String  st2 = ATTACHMENT3.substring(ATTACHMENT3.lastIndexOf(".")+1,ATTACHMENT3.length());
                 String  st3 = st1.substring(0, ATTACHMENT3.lastIndexOf("_"));
                 tempName    = st3 + "." + st2;
				}
    %> -->
  <tr>
    <!-- <td height="36" valign="top" align="left"><span class="small">
      <textarea name="reason3" rows="2" class="small" maxlength="50"><%=DESCRIPTION3%></textarea>
    </span></td>
    <td height="36" valign="top" align="left"><textarea name="attach3" type="text" class="small" id="attach3" value="" readonly="readonly" ><%=!tempName.equals("NA.NA_NA")?tempName:""%></textarea><a href="#" onclick="upload('attach3')"><img src="images/attachment.gif" border="0" /></a><input name="attach3New" type="hidden" id="attach3New" value="<%=!tempName.equals("NA.NA_NA")?ATTACHMENT3:""%>" /></td> -->
   	<td valign="top" align="left"><span class="small">
      <textarea name="compName3" class="small" cols="28" id="compName3"  size="25" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.compName3,'cNChar3',100)" onkeyup="textCounter(document.priceApprovalMain.compName3,'cNChar3',100)" ><%=COMPANY_NAME3%></textarea>
    </span>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cNChar3" width="10%" class="small">100</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
	<td valign="top" align="left"><span class="small">
       <textarea name="reason16" rows="2" class="small" maxlength="50" cols="28" onkeydown="textCounter(document.priceApprovalMain.reason16,'pncChar3',50)" onkeyup="textCounter(document.priceApprovalMain.reason16,'pncChar3',50)" ><%=PRODUCT3%></textarea>
    </span>
 <div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="pncChar3" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
    <td valign="top" align="left"><span class="small">
      <textarea name="fromDateAir3" class="small" id="fromDateAir3" cols="10" size="10" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.fromDateAir3,'rateChar3',10)" onkeyup="textCounter(document.priceApprovalMain.fromDateAir3,'rateChar3',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.fromDateAir3.value);" ><%=RATE3%></textarea>
    </span>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rateChar3" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
   	<td  align="left" valign="top"><span class="small">
       <textarea name="UOM3" class="small" id="UOM3"  rows="2" cols="16" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.UOM3,'UOM3Char',15)" onkeyup="textCounter(document.priceApprovalMain.UOM3,'UOM3Char',15)" ><%=UMO3%></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="UOM3Char" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
	<td  align="left" valign="top"><span class="small">
      <textarea name="rem3" rows="2" cols="28" class="small" maxlength="200"  onkeydown="textCounter(document.priceApprovalMain.rem3,'rem3Char',200)" onkeyup="textCounter(document.priceApprovalMain.rem3,'rem3Char',200)"  ><%=REMARKS3%></textarea>
    </span>
<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rem3Char" width="10%" class="small">200</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">

</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="52%" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="2" cellspacing="2">
     
      <tr>
        <td height="22" bgcolor="#ffffff" class="travelMenuBG">APPROVALS</td>
        </tr>
    </table>
      <table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
		<% if(COMPANY.equals("1033")){%>
			<td width="10%" >Artha  Procurement<span class="small"></span><span class="redsmall"><br> (All approvers are mandatory)</span></td>
<% 		}else if((COMPANY.equals("1005") || COMPANY.equals("1006")) && (!(cat.equals("9")||cat.equals("3")||cat.equals("7")))){%>
			<td width="12%" >Requisitioner<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span></td>
<%		}else if((COMPANY.equals("1501"))){%>
			<td width="12%" >Requisitioner<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span></td>
<%		}else if(COMPANY.equals("1000") && deptGroup.equals("1026"))  {%>
			<td width="12%" >User<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span></td>
<%		}else {%> 
			<td width="12%" >B&amp;C<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span></td>
<%		}%>

<% if((COMPANY.equals("1005") || COMPANY.equals("1006")) && (!(cat.equals("9")||cat.equals("3")||cat.equals("7")))){%>

	   <td width="12%" height="29" >HOD<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span><span class="small"></span>&nbsp;</span></td>

          <td width="11%" align="left" colspan="2">&nbsp;Commercial<br><span class="redsmall" id="negval"><span class="small"></span>&nbsp;</span></td>

<%		}else if((COMPANY.equals("1501"))){%>

	   <td width="12%" height="29" >HOD<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span><span class="small"></span>&nbsp;</span></td>

          <td width="11%" align="left" colspan="2">&nbsp;Commercial<br><span class="redsmall" id="negval"><span class="small"></span>&nbsp;</span></td>

<%		}else if(COMPANY.equals("1000") && deptGroup.equals("1026"))   {%>

			<td width="12%" height="29" >B&amp;C<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span><span class="small"></span>&nbsp;</span></td>

          <td width="11%" align="left" colspan="2">&nbsp;Supported By<br><span class="redsmall" id="negval"><span class="small"></span>&nbsp;</span></td>

<%		} else {%>

          <td width="12%" height="29" >User<span class="small"></span><span class="redsmall"><span class="small"></span>&nbsp;</span></td>

          <td width="11%" align="left" colspan="2">&nbsp;Supported By<br><span class="redsmall" id="negval">&#42&nbsp;(for Negotiated value >= 1999999)</span><!-- <span class="redsmall"><span class="small"></span>&nbsp; (all are mandatory)</span> --></td>

<%		}%>
      

          <td width="10%" align="left"><%=label1%><!--<span class="small"> </span><br><span class="redsmall">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span> --></td>
          <td width="10%" align="left"><%=label2%><!-- <span class="small">EP Supply Chain</span> --></td>
          <td width="10%" align="left"><%=label3%><!-- <span class="small">COO</span> --></td>
          <td width="10%" align="left"><%=label4%><!-- <span class="small">CEO</span> --></td>

		  
<% if((COMPANY.equals("1005") || COMPANY.equals("1006")) && (!(cat.equals("9")||cat.equals("3")||cat.equals("7")))){%>
		<td width="12%" align="left"><span class="small"></span></td>
	<% }else{%>

          <td width="12%" align="left"><span class="small">Managing Director </span></td>

	<% }%>

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
		  <% if(COMPANY.equals("1033")){%>
			<td class = "normal" height = "25"  align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER12==null?"":APPROVER12%>" disabled>
			 <input  name = "app2H" id="app2H" type="hidden" value="<%=AP12==null?"":AP12%>" />
		  </td>
<%		}else{%>
			<td class = "normal" height = "25"  align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER12==null?"":APPROVER12%>">
			 <input  name = "app2H" id="app2H" type="hidden" value="<%=AP12==null?"":AP12%>" />
		  </td>
<%		}%>
          
<%
		ArrayList approverList   = new ArrayList();
		String str          = ""; 
		int i = 0;
        String roleType     ="";
        String selected="";
        Hashtable approverData  = new Hashtable();
%>
<%		if(COMPANY.equals("1033")){%>
			 <td  class = "normal"  height = "25" align="left">
		 <input type = "text" name = "app11" id="app11"  class = "normal" size="26" onClick="addUser('approvedby',this.id)"  value="<%=APPROVER35==null?"":APPROVER35%>"  class = "normal"disabled >
		<input  name = "app11H" id="app11H" type="hidden" value="<%=AP35==null?"":AP35%>"  / ></td>
		<!--  <td class = "normal" height = "25" align="left">HR/Personnel</td> -->
			
<%		}else{%>
			 <td  class = "normal"  height = "25" align="left">
		 <input type = "text" name = "app11" id="app11"  class = "normal" size="26" onClick="addUser('approvedby',this.id)"  value="<%=APPROVER35==null?"":APPROVER35%>"  class = "normal" >
		<input  name = "app11H" id="app11H" type="hidden" value="<%=AP35==null?"":AP35%>"  / ></td>
		<!--  <td class = "normal" height = "25" align="left">HR/Personnel</td> -->
<%		}%>
		 
<%		if(COMPANY.equals("1017")){%>
			<td class = "normal" height = "25" align="left">VP -Finance TIML</td>
			
<%		}else{%>
			<td class = "normal" height = "25" align="left">HR/Personnel</td>
<%		}%>


<%if((COMPANY.equals("1005") || COMPANY.equals("1006")) && ((cat.equals("9")||cat.equals("3")||cat.equals("7")))){%>

<%	if(COMPANY.equals("1033")){%>
		 <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select14" class="small" id="select14" style="width:130px;">
		<option value="0">Select</option>
         <!-- <option value="31891" <%//if(AP6.equals("31891")){%>selected="selected"<%//}%>>Shrijeet Mishra</option> -->
            <%=app6%>
	  </select>         </span></td>
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
	  
      </select>         </span></td>
			
<%		}else{//out.println("vvvvvv");%>
			 <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select12" class="small" id="select12" style="width:130px;"> <%//if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%><%//}%>
		<option value="0">Select</option>
         <!-- <option value="31891" <%//if(AP6.equals("31891")){%>selected="selected"<%//}%>>Shrijeet Mishra</option> -->
            <%=app4%>
	  </select>         </span></td>
	  <td rowspan="3" align="left" valign="top" class="small"><span class="boldunderline_small">
            <select name="select13" class="small" id="select13" style="width:130px;">
        <option value="0">Select</option>
	    <!-- <option value="20411" <%//if(AP4.equals("20411")){%>selected="selected"<%//}%>>Shyam Shanker</option> -->
                    <%=app5%>
	  </select>
			</span></td>
		 
       
          <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">

<select name="select14" class="small" id="select14" style="width:130px;">
		<option value="0">Select</option>	
	  <!-- <option value="3459" <%//if(AP5.equals("3459")){%>selected="selected"<%//}%>>Mohit Jain</option> -->
            <%=app6%>
	  
      </select>         </span></td>
<%		}%>
        
   



 <% if(COMPANY.equals("1033")){%>
			<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select15" class="small" id="select15" style="width:130px;"disabled>
		<option value="0">Select</option>
         <!-- <option value="48795" <%//if(AP7.equals("48795")){%>selected="selected"<%//}%>>Raj Jain</option> -->
                    <%=app7%>
		</select> </span></td>

<%		}else{%>
			<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select15" class="small" id="select15" style="width:130px;"<%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
		<option value="0">Select</option>
         <!-- <option value="48795" <%//if(AP7.equals("48795")){%>selected="selected"<%//}%>>Raj Jain</option> -->
                    <%=app7%>
		</select> </span></td>

<%		}%>

		
<%}else{%>

		 
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
	  
      </select>         </span></td>

<%		if(COMPANY.equals("1033")){%>
		 <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select14" class="small" id="select14" style="width:130px;">
		<option value="0">Select</option>
         <!-- <option value="31891" <%//if(AP6.equals("31891")){%>selected="selected"<%//}%>>Shrijeet Mishra</option> -->
            <%=app6%>
	  </select>         </span></td>
			
<%		}else{%>
			 <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select14" class="small" id="select14" style="width:130px;"<%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
		<option value="0">Select</option>
         <!-- <option value="31891" <%//if(AP6.equals("31891")){%>selected="selected"<%//}%>>Shrijeet Mishra</option> -->
            <%=app6%>
	  </select>         </span></td>
<%		}%>
        


 <% if(COMPANY.equals("1033")){%>
			<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select15" class="small" id="select15" style="width:130px;"disabled>
		<option value="0">Select</option>
         <!-- <option value="48795" <%//if(AP7.equals("48795")){%>selected="selected"<%//}%>>Raj Jain</option> -->
                    <%=app7%>
		</select> </span></td>

<%		}else{%>
			<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select15" class="small" id="select15" style="width:130px;"<%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
		<option value="0">Select</option>
         <!-- <option value="48795" <%//if(AP7.equals("48795")){%>selected="selected"<%//}%>>Raj Jain</option> -->
                    <%=app7%>
		</select> </span></td>

<%		}%>


<%}%>

		
<% if(COMPANY.equals("1033")){%>
			<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select16" class="small" id="select16" style="width:130px;"disabled>
		<option value="0">Select</option>
	   <option value="29616" <%if(AP8.equals("29616")){%>selected="selected"<%}%>>Vineet Jain</option>
        </select>         </span></td>

<%		}else{%>
			<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select16" class="small" id="select16" style="width:130px;"<%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
		<option value="0">Select</option>
	   <option value="29616" <%if(AP8.equals("29616")){%>selected="selected"<%}%>>Vineet Jain</option>
        </select>         </span></td>

<%		}%>
   
        </tr>
	
		
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER21==null?"":APPROVER21%>">
			  <input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
		 </td>
		 	<% if(COMPANY.equals("1033")){%>
			<td class = "normal" height = "25"  align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER22==null?"":APPROVER22%>"disabled>
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />
		  </td>
<%		}else{%>
			<td class = "normal" height = "25"  align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER22==null?"":APPROVER22%>">
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />
		  </td>
<%		}%>
          
		  <% if(COMPANY.equals("1033")){%>
			 <td  class = "normal"  height = "25" align="left">
		 <input type = "text" name = "app12" id="app12"  class = "normal" size="26" onClick="addUser('approvedby',this.id)" value="<%=APPROVER36==null?"":APPROVER36%>" disabled >
		<input  name = "app12H" id="app12H" type="hidden" value="<%=AP36==null?"":AP36%>"  /></td>
		 <!-- <td class = "normal" height = "25" align="left">Branch Head</td> -->

<%		}else{%>
			 <td  class = "normal"  height = "25" align="left">
		 <input type = "text" name = "app12" id="app12"  class = "normal" size="26" onClick="addUser('approvedby',this.id)" value="<%=APPROVER36==null?"":APPROVER36%>" >
		<input  name = "app12H" id="app12H" type="hidden" value="<%=AP36==null?"":AP36%>"  /></td>
		 <!-- <td class = "normal" height = "25" align="left">Branch Head</td> -->

<%		}%>
		 
<%		if(COMPANY.equals("1017")){%>
			<td class = "normal" height = "25" align="left">EVP TIML</td>
			
<%		}else if ((COMPANY.equals("1005") || COMPANY.equals("1006")) && (!(cat.equals("9")||cat.equals("3")||cat.equals("7")))) {%>
			 <td class = "normal" height = "25" align="left">Budget Team</td>
<%		} else if ((COMPANY.equals("1501") )) {%>
			 <td class = "normal" height = "25" align="left">Budget Team</td>
<%		} else {%>
			 <td class = "normal" height = "25" align="left">Branch Head</td>
<%		}%>

		
        </tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER31==null?"":APPROVER31%>">
			  <input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
		  </td>
		  	<% if(COMPANY.equals("1033")){%>
			 <td class = "normal" height = "25"  align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER32==null?"":APPROVER32%>"disabled>
			  <input  name = "app8H" id="app8H" type="hidden" value="<%=AP32==null?"":AP32%>" />
		  </td>
			  <input name="priceid" id="priceid" type="hidden" value="<%=priceid%>" />
<%		}else{%>
			 <td class = "normal" height = "25"  align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER32==null?"":APPROVER32%>">
			  <input  name = "app8H" id="app8H" type="hidden" value="<%=AP32==null?"":AP32%>" />
		  </td>
			  <input name="priceid" id="priceid" type="hidden" value="<%=priceid%>" />
<%		}%>

         
<% if(COMPANY.equals("1033")){%>
			 <td class = "normal" height = "25"  align="left">
		<select name="app3" id="app3" class = "normal" style="width:174px;" disabled>
			<option value="0">Select</option>
			</select>
<%		}else{%>
			 <td class = "normal" height = "25"  align="left">
		<select name="app3" id="app3" class = "normal" style="width:174px;"<%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
			<option value="0">Select</option>
<%
			   roleType    =   "MAS 1";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
			out.println("tempArr[2]"+tempArr[2]);
%>
		<option value="<%=tempArr[2]%>" <%if(AP13.equals(tempArr[2])){%>selected="selected"<%}%>><%=tempArr[3]%></option>
<%
		}
%>
        </select>
		
		</td> 

<%		}%>
 
		   <td class = "normal" height = "25" width="10%" align="left">MAS 1 </td>


		  </td>
        </tr>
		<tr class="small">

			<% if(COMPANY.equals("1033")){%>
			<td colspan="2" >&nbsp;</td>
			<td class = "normal" height = "25" width="12%" align="left">
		<select name = "app6" id="app6" class = "normal" style="width:174px;"disabled>
			<option value="0"> Select</option>
			</select>
<%		}else{%>
			  <td colspan="2" >&nbsp;</td>
				<td class = "normal" height = "25" width="12%" align="left">
		<select name = "app6" id="app6" class = "normal" style="width:174px;"<%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
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
<%		}%>
		 
		  <td class = "normal" height = "25" width="10%" align="left">MAS 2</td>



	
        </tr>
		<tr>
		 <td></td><%//System.out.println("AP35:--"+AP35+AP36+"  - "+AP34);%>
		 <td></td>

		<% //out.println("nnn"+COMPANY);
		if(COMPANY.equals("1033")){%>
			  <td class = "normal" height = "25" width="12%" align="left">
		<select name = "app9" id="app9" class = "normal" style="width:174px;"disabled>
			<option value="0">Select</option>
			</select>
<%		}else{%>
			 <td class = "normal" height = "25" width="12%" align="left">
		<select name = "app9" id="app9" class = "normal" style="width:174px;"<%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
			<option value="0">Select</option>
<%
			   roleType    =   "Finance 1";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);

			   out.println("hhh");

		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
			//out.println("tempArr[2]"+tempArr[2]);
%>
		<option value="<%=tempArr[2]%>" <%if(AP33.equals(tempArr[2])){%>selected="selected"<%}%>><%=tempArr[3]%></option>
<%
		}
%>
        </select>
		  </td>
<%		}%>
			  
			  <td class = "normal" height = "25" width="10%" align="left">Finance 1</td>
        </tr>
		<tr>
		 <td></td>
		 <td></td>
		 <% if(COMPANY.equals("1033")){%>
			 <<td class = "normal" height = "25" width="12%" align="left">
		<select name = "app10" id="app10" class = "normal" style="width:174px;"disabled>
			<option value="0"> Select</option>
<%		}else{%>
			<td class = "normal" height = "25" width="12%" align="left">
		<select name = "app10" id="app10" class = "normal" style="width:174px;"<%if(Integer.parseInt(NEGOTIATION_VALUE) <= 1999999){%>disabled<%}%>>
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
<%		}%>
	  
		<% if((COMPANY.equals("1005") || COMPANY.equals("1006")) && ((cat.equals("9")|| cat.equals("7") || cat.equals("3")) )){%>
		  <td class = "normal" height = "25" width="10%" align="left">President Finance / COO & EP</td>
		<%}else if((COMPANY.equals("1501") )){%>
		  <td class = "normal" height = "25" width="10%" align="left">President Finance / COO & EP</td>
		<%}else{%>
		  <td class = "normal" height = "25" width="10%" align="left">Finance 2</td>
		<%}%>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="4" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;</td>
          <td width="50%">&nbsp;</td>
        </tr>

        <tr>
          <td align="right" valign="middle"><input  name="savedraft1"class="bold" type="button"  id="savedraft1" value="Save Draft" onclick="savedraft2();" />&nbsp;<input name="submitForm" onclick="validateForm(2);" type="button" class="bold" id="submitForm" value="Submit" /></td>
          <td><input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" /></td>
        </tr>
      </table>
<%if (data1[62].equals("UD")){%>

      <%}else{%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">Supported By / Approved By</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /></td>
          </tr>
				<tr><td height="10" colspan="5"></td></tr>
		  <tr>
		<td>
		<table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="17%" height="29" >PURCHASE APPROVAL ID</td>
          <td width="35%" align="left">INTENDED USER</td>
          <td width="32%" align="left">PROJECT - PACKAGE NAME</td>
         <!--   <td width="19%" align="left">Delivery/ Completion Period</td> -->
          <td width="16%" align="left">STATUS</td>
        </tr>
		<tr><td id = "sab" width="100%" colspan="7" height="60"></td></tr>
		 <tr>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" colspan="2" align="center" valign="top">&nbsp;</td>
        </tr> 
	</table>
	</td></tr>
		<tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
        <tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">VIEW STATUS</td>
        </tr>
      </table>
      <table border="0" cellspacing="0" cellpadding="0" width="100%">
       
          <tr>
            <td class="small" height="20"  align="left">&nbsp;Tip : In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /></td>
          </tr>
				<tr><td height="10" colspan="5"></td></tr>
           </table>
	      <table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="17%" height="29" >PURCHASE APPROVAL ID</td>
          <td width="35%" align="left">INTENDED USER</td>
		  <td width="32%" align="left">PROJECT - PACKAGE NAME</td>
         <!--  <td width="27%" align="left">FINAL OFFER (Rs)</td>
          <td width="19%" align="left">Delivery/ Completion Period</td> -->
          <td width="16%" align="left">STATUS</td>
        </tr>
		<tr><td id = "status" width="100%" colspan="5" height="60"></td></tr>
		 <tr>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" colspan="2" align="center" valign="top">&nbsp;</td>
        </tr> 
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
            <td class="small" height="20"  align="left">&nbsp;Tip : In Process <img src="images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="images/approved.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="images/rejected.jpg" /></td>
          </tr>
				<tr><td height="10" colspan="5"></td></tr>
		  <tr>
		<td>
		<table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="17%" height="29" >PURCHASE APPROVAL ID</td>
          <td width="35%" align="left">INTENDED USER</td>
          <td width="32%" align="left">PROJECT - PACKAGE NAME</td>
         <!--   <td width="19%" align="left">Delivery/ Completion Period</td> -->
          <td width="16%" align="left">STATUS</td>
        </tr>
		<tr><td id = "allProcess" width="100%" colspan="7" height="60"></td></tr>
		 <tr>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" valign="top" align="left">&nbsp;</td>
          <td height="25" colspan="2" align="center" valign="top">&nbsp;</td>
        </tr> 
	</table>
<%}%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <!-- <tr>
    <td width="45%" bgcolor="#E6DED1"><img src="images/price_footer.jpg" width="347" height="25" /></td>
    <td width="55%" bgcolor="#E6DED1"><img src="images/related_links.png" width="18" height="18" /><span class="boldsmall">Related links&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;  | <img src="images/otherESSlinks.png" width="18" height="18" /> <span class="boldsmall">Other ESS links</span></td>
  </tr>-->
</table>
<%}%>

<p>&nbsp;</p>
<table width="100%" cellpadding="0" cellspacing="0" >
</tbody>
</form>
</body>
</html>