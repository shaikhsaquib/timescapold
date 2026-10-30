<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<script src="../jscripts/jquery.js"language="javascript"></script>
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
  bottom:100px;
  background-color:#17C6EE; color:white;
  font-size:4pt;
  font-family:Verdana, Arial, Helvetica, sans-serif;
  text-align: right;
  width:300px;


  /* css ends here */
}
</style>
	<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<link href="../style/calendarControl.css" rel="stylesheet">

<script> 
    function hideImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'hidden'; 
            document.getElementById('back').style.visibility = 'hidden'; 
        } 
    }
    function showImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'visible'; 
            document.getElementById('back').style.visibility = 'visible'; 
        } 
    } 
    function backPage()
    {
        document.location.href = "../index.jsp";
    }
</script>


</head>
<body>
<%
		String DPATH        = EnvironmentProperties.getValue("priceapproval", "uploadPath");

	    String userEmailid  = "";

		String timescapeUId = Long.toString(timescapeUserOId);
	    		
		String tOId			= (String)request.getParameter("tOId");

		String priceid		= (String)request.getParameter("priceid");

		ArrayList vStatus	=  new ArrayList();
	
		vStatus 			=	priceApprovalWebController.viewStatus(tOId,priceid);

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
		  String APPROVER34_STATUS  = data3[28];
		  String APPROVER7_STATUS  = data3[29];
		  String APPROVER34_DATE  = data3[30];
		  String APPROVER7_DATE  = data3[31];


		//String priceid1						= data1[0];
		String NEGOTIATION_PC_DATE			= data1[1];
		String NEGOTIATION_PC_MEETING_VENUE	= data1[2];
		String NEGOTIATION_VALUE			= data1[3];
		int negVal							= Integer.parseInt(NEGOTIATION_VALUE);
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
		String AP7							= data1[75];
		String APPROVER34					= data1[77];
		String APPROVER7					= data1[78];
		String CATEGORY						= data1[79];
		       userEmailid				    = data1[76];

		if (userEmailid.indexOf("@") > -1) {
        userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
	    } 

		String display						= "NA";
		
		//String VENDORID					=  data2[0];
		//String PRICEID					=  data2[1];
		//String VENDOR						=  data2[2];
		//String INITIALOFFER				=  data2[3];
		//String FINALOFFER					=  data2[4];
		//String DELIVERYPERIOD				=  data2[5];
		//String WARRANTYPERIOD				=  data2[6];
		//String CREATEDBY					=  data2[7];
		//String CREATEDON					=  data2[8];
		//String MODIFIEDBY					=  data2[9];
		//String MODIFIEDON					=  data2[10];
		//String STATUS						=  data2[11];

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
		    
	String Approver  = "";
	String appStatus = "";
	//out.println("negVal"+negVal);
    // For support - Approve
       
	/*if(SD1!=null && SD1.equals(tOId) && SUPPORTEDBY_DIRECTOR1_STATUS.equals("L"))
	{
		Approver  = "SD1";
		appStatus = SUPPORTEDBY_DIRECTOR1_STATUS;
	}
	else if(SD2!=null && SD2.equals(tOId) && SUPPORTEDBY_DIRECTOR2_STATUS.equals("L"))
	{
		Approver = "SD2";
		appStatus = SUPPORTEDBY_DIRECTOR2_STATUS;
	}*/
	 if(!AP11.equals("0") && AP11.equals(tOId) && APPROVER11_STATUS.equals("L"))
	{
		Approver = "AP11";
		appStatus = APPROVER11_STATUS;
	}
	else if(!AP21.equals("0") && AP21.equals(tOId) && APPROVER11_STATUS.equals("A") && APPROVER21_STATUS.equals("L"))
	{
		Approver = "AP21";
		appStatus = APPROVER21_STATUS;
	}
	else if(!AP31.equals("0") && AP31.equals(tOId) && APPROVER21_STATUS.equals("A")&& APPROVER31_STATUS.equals("L"))
	{
		Approver = "AP31";
		appStatus = APPROVER31_STATUS;
	}
	else if(!AP12.equals("0") && AP12.equals(tOId) && APPROVER31_STATUS.equals("A") && APPROVER12_STATUS.equals("L"))
	{
		Approver = "AP12";
		appStatus = APPROVER12_STATUS;
	}

	else if(!AP22.equals("0") && AP22.equals(tOId) && APPROVER12_STATUS.equals("A") && APPROVER22_STATUS.equals("L"))
	{
		Approver = "AP22";
		appStatus = APPROVER22_STATUS;
	}
	else if(!AP32.equals("0") && AP32.equals(tOId) && APPROVER22_STATUS.equals("A")&& APPROVER32_STATUS.equals("L"))
	{
		Approver = "AP32";
		appStatus = APPROVER32_STATUS;
	}
	else if(!AP13.equals("0")&& AP13.equals(tOId) && (((((!AP12.equals("0") && APPROVER12_STATUS.equals("A"))||(AP12.equals("0") && APPROVER12_STATUS.equals("L"))) && ((!AP22.equals("0") && APPROVER22_STATUS.equals("A"))||(AP22.equals("0") && APPROVER22_STATUS.equals("L"))) && ((!AP32.equals("0") && APPROVER32_STATUS.equals("A"))||(AP32.equals("0") && APPROVER32_STATUS.equals("L")))) && APPROVER31_STATUS.equals("A"))) && APPROVER13_STATUS.equals("L"))
	{  
		Approver = "AP13";
		appStatus = APPROVER13_STATUS;
	}
	else if(!AP23.equals("0") && AP23.equals(tOId) && (((((!AP12.equals("0") && APPROVER12_STATUS.equals("A"))||(AP12.equals("0") && APPROVER12_STATUS.equals("L"))) && ((!AP22.equals("0") && APPROVER22_STATUS.equals("A"))||(AP22.equals("0") && APPROVER22_STATUS.equals("L"))) && ((!AP32.equals("0") && APPROVER32_STATUS.equals("A"))||(AP32.equals("0") && APPROVER32_STATUS.equals("L")))) && APPROVER31_STATUS.equals("A"))) && APPROVER23_STATUS.equals("L"))
	{
		Approver = "AP23";
		appStatus = APPROVER23_STATUS;
	}
	
	
	else if(!AP33.equals("0") && AP33.equals(tOId) && (((((!AP12.equals("0") && APPROVER12_STATUS.equals("A"))||(AP12.equals("0") && APPROVER12_STATUS.equals("L"))) && ((!AP22.equals("0") && APPROVER22_STATUS.equals("A"))||(AP22.equals("0") && APPROVER22_STATUS.equals("L"))) && ((!AP32.equals("0") && APPROVER32_STATUS.equals("A"))||(AP32.equals("0") && APPROVER32_STATUS.equals("L")))) && APPROVER31_STATUS.equals("A"))) && APPROVER33_STATUS.equals("L"))
	{   // out.println("hiiii");
		Approver = "AP33";
		appStatus = APPROVER33_STATUS;
	}
	else if(!AP34.equals("0") && AP34.equals(tOId) && (((((!AP12.equals("0") && APPROVER12_STATUS.equals("A"))||(AP12.equals("0") && APPROVER12_STATUS.equals("L"))) && ((!AP22.equals("0") && APPROVER22_STATUS.equals("A"))||(AP22.equals("0") && APPROVER22_STATUS.equals("L"))) && ((!AP32.equals("0") && APPROVER32_STATUS.equals("A"))||(AP32.equals("0") && APPROVER32_STATUS.equals("L")))) && APPROVER31_STATUS.equals("A"))) && APPROVER34_STATUS.equals("L"))
	{	
		Approver = "AP34";
		appStatus = APPROVER34_STATUS;
	}
	else if(!AP4.equals("0") && AP4.equals(tOId) && ((((!AP13.equals("0") && APPROVER13_STATUS.equals("A")) ||(AP13.equals("0") && APPROVER13_STATUS.equals("L"))) && ((!AP23.equals("0") && APPROVER23_STATUS.equals("A")) ||(AP23.equals("0") && APPROVER23_STATUS.equals("L"))) && ((!AP33.equals("0") && APPROVER33_STATUS.equals("A")) || (AP33.equals("0") && APPROVER33_STATUS.equals("L"))) && ((!AP34.equals("0") && APPROVER34_STATUS.equals("A")) || (AP34.equals("0") && APPROVER34_STATUS.equals("L")))) || negVal<=1999999 ) && (((((!AP12.equals("0") && APPROVER12_STATUS.equals("A"))||(AP12.equals("0") && APPROVER12_STATUS.equals("L"))) && ((!AP22.equals("0") && APPROVER22_STATUS.equals("A"))||(AP22.equals("0") && APPROVER22_STATUS.equals("L"))) && ((!AP32.equals("0") && APPROVER32_STATUS.equals("A"))||(AP32.equals("0") && APPROVER32_STATUS.equals("L")))) && APPROVER31_STATUS.equals("A")))/* (APPROVER34_STATUS.equals("A")|| APPROVER33_STATUS.equals("A") || APPROVER23_STATUS.equals("A")||APPROVER13_STATUS.equals("A")||APPROVER32_STATUS.equals("A") )&& APPROVER32_STATUS.equals("A")*/ && APPROVER4_STATUS.equals("L"))
	{	//out.println("HI");
		Approver = "AP4";
		appStatus = APPROVER4_STATUS;
	}
	else if(!AP5.equals("0") && AP5.equals(tOId) && APPROVER4_STATUS.equals("A") && APPROVER5_STATUS.equals("L"))
	{
		Approver = "AP5";
		appStatus = APPROVER5_STATUS;
	}
	else if(!AP6.equals("0") && AP6.equals(tOId) && APPROVER5_STATUS.equals("A") && APPROVER6_STATUS.equals("L"))
	{
		Approver = "AP6";
		appStatus = APPROVER6_STATUS;
	}
	else if(!AP7.equals("0")&& AP7.equals(tOId) && APPROVER6_STATUS.equals("A")&& APPROVER7_STATUS.equals("L"))
	{	
		Approver = "AP7";
		appStatus = APPROVER7_STATUS;
	}
	
	  
	//out.println("My TEst :" + APPROVER22_STATUS);
	//out.println("My TEst :" + Approver);
	//out.println("Full name"+ displayName);
		
%>
<center>

<form name="priceApprovalMain" method="post" action="">
<table width="795px" height="493" border="1" bordercolor="#f0f0f0"cellpadding="2" cellspacing="0">
<!--  <tr><td height="10" colspan="7"></td></tr> -->
 <tr><td colspan="3" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="back" type="button" class="style4" id="back" value="Back" onclick="javascript:backPage();"/></td><td height="10" align="right" colspan="5" class="redbold"><input name="printbutton" type="button" class="style4" id="printbutton" value="Print" onclick="javascript:hideImage();window.print();showImage();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
  <tr><td height="5" colspan="7"></td></tr>
  <tr>
	<!-- <td colspan="8" align="right" class="travelMenuBG"> STATUS : <%//if(STATUS.equals("L")){%>In Process<%//}else if(STATUS.equals("A")){%>Approved<%//}else if(STATUS.equals("R")){%>Rejected<%//}%>&nbsp;&nbsp;&nbsp;&nbsp;
    </td> -->
	</tr>
	  <tr><td height="10" class="boldsmall" align="right" colspan="9"><%if(true/*pageType!=null*/){if(true/*pageType.equals("YES")*/){if(appStatus.equals("L") && !STATUS.equals("CL")){if(Approver.equals("AP13")||Approver.equals("AP23")||Approver.equals("AP33")||Approver.equals("AP34")){%><a class="normal" href="javascript:void(0)" onClick="openRemarks(<%=priceid%>,<%=tOId%>,'<%=Approver%>' ,'A')"<b>Support</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%}else{%><a class="normal" href="supportApprove.jsp?priceid=<%=priceid%>&appType=<%=Approver%>&statusType=A"><b>Approve</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="normal" onClick="openRemarks(<%=priceid%>,<%=tOId%>,'<%=Approver%>' ,'H')" href="javascript:void(0)"><b>Review</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onClick="openRemarks(<%=priceid%>,<%=tOId%>,'<%=Approver%>' ,'R')" class="normal"><b>Reject</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%}}else{if(STATUS.equals("CL")){%><b>STATUS: Approved</b><%}else if(STATUS.equals("CR")){%><b>STATUS: Rejected</b><%}else if(STATUS.equals("URE")){%><b>STATUS: Review</b><%}}}}%>&nbsp;&nbsp;</td></tr>
   <tr>
    <td width="25" rowspan="10" bgcolor="#e8e8e8" class="nav"><img src="../images/basic.jpg" width="25" height="104" /></td>
    <td colspan="7" align="center" valign="middle" bgcolor="#666666"><span class="white">PRICE APPROVAL REQUEST NO - <%=priceid%></span></td>
  </tr>
   <tr>
  <!--   <td width="25" rowspan="9" bgcolor="#e8e8e8" class="nav"><img src="../images/basic.jpg" width="25" height="104" /></td> -->
    <td colspan="7" align="center" valign="middle" class="travelMenuBG" ><span class ="nav">CATEGORY - <%=CATEGORY%></span></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="middle" class="travelMenuBG">PC meeting details</td>
    <td colspan="5" align="center" valign="middle" class="travelMenuBG">Project Details</td>
  </tr>
  <tr>
    <td  class="nav" align="left">Negotiation/PC meeting date</td>
    <td colspan="1" class="normal" align="left"><%=NEGOTIATION_PC_DATE%></td>
    <td  class="nav" align="left">Description</td>
    <td colspan="4" class="normal" align="left"><%=PRODUCT_SERVICE__NAME%></td>
  </tr>
  <tr>
    <td class="nav" align="left">Finalized vendor's name</td>
    <td colspan="1" class="normal" align="left"><%=FINALIZED_VENDOR_NAME%></td>
    <td class="nav" align="left">Project</td>
    <td colspan="4" class="normal" align="left"><%=PACKAGE_NAME_SANCTION%></td>
  </tr>
  <tr>
    <td class="nav" align="left">Negotiated value (Rs)</td>
    <td colspan="1" class="normal" align="left"><%=NEGOTIATION_VALUE%></td>
    <td class="nav" rowspan="2" align="left">Budget    (Rs.)  / Sanction</td>
    <td colspan="4" rowspan="2" class="normal" align="left"><% if(TOTAL_BUDGET.equals("0")){out.println("-");}else{out.println(TOTAL_BUDGET);}%></td>
  </tr>
    <tr>
    <td class="nav" align="left">Valididty Period</td>
    <td colspan="1" class="normal" align="left"><%=NEGOTIATION_VALUE%></td>
    
  </tr>

  <tr>
    <td class="nav" align="left">Payment terms</td>
    <td colspan="1" class="normal" align="left"><%=PAYMENT_TERMS%></td>
    <td class="nav" align="left">PO's Commited till date (Rs.)</td>
    <td colspan="4" class="normal" align="left"><%if(PO_COMMITTED_TILL_DATE.equals("0")){out.println("-");}else{out.println(PO_COMMITTED_TILL_DATE);}%></td>
  </tr>
  <tr>
    <td class="nav" align="left">Hard Savings (Rs.)</td>
    <td colspan="1"  class="normal" align="left"><%=SAVINGS%></td>
    <td class="nav" rowspan="2" align="left" align="left">Balance    Budget(Rs.)</td>
    <td colspan="4" rowspan="2" class="normal" align="left"><%if(BALANCE_BUDGET.equals("0")){out.println("-");}else{out.println(BALANCE_BUDGET);}%></td>
  
  </tr>
  <tr>
    <td class="nav" align="left">Cost Avoidance (Rs)</td>
    <td colspan="1" class="normal" align="left"><%=COST_AVOIDANCE%></td>
  </tr>
  <tr>
  </tr>
  <tr>
    <td height="70" bgcolor="#e8e8e8" class="nav"><img src="../images/background.jpg" width="25" height="104" /></td>
    <td colspan="7" class="normal" align="left" valign="top"><%=REQUIREMENT%></td>
  </tr>
  <tr>
    <td bgcolor="#e8e8e8" class="nav"><img src="../images/finalComparative.jpg" width="25" height="104" /></td>
    <td colspan="7" align="center"><table width="100%" border="1" cellpadding="2"cellspacing="0" bordercolor="#F8F8F8">
      <tr>
        <!-- <td height="30" align="left" valign="top" class="travelMenuBG">Item Description</td> -->
        <td width="15%" align="left" valign="top" class="travelMenuBG">Vendor</td>
        <td width="15%" align="left" valign="top" class="travelMenuBG">Initial all-incl. offer</td>
        <td width="15%" align="left" valign="top" class="travelMenuBG">Final all-incl. offer</td>
        <td width="15%" align="left" valign="top" class="travelMenuBG">Delivery/Completion Period</td>
        <!-- <td align="left" valign="top" class="travelMenuBG">Warranty/Defect Liability Period</td> -->
        <td width="15%" align="left" valign="top" class="travelMenuBG">Payment Terms</td>
        <td width="25%" align="left" valign="top" class="travelMenuBG">Value Add</td>


      </tr>
      
	   <%
			for(int i=0;i<vStatus1.size();i++)
			{
				String[] data2 = (String [])vStatus1.get(i);	 
	   %>
  <tr>
<!--     <%if(i==0){%><td width="14%" align="left" class="normal" valign="top" rowspan="<%=vStatus1.size()+1%>"><%=PACKAGE_NAME_SANCTION%></td><%}%> -->
    <td align="left" class="normal"><%=data2[2]%></td>
    <td align="left" class="normal"><%=data2[3]%></td>
    <td align="left" class="normal"><%=data2[4]%></td>
    <td align="left" class="normal"><%=data2[5]%></td>
    <!-- <td align="left" class="normal"><%=data2[6]%></td> -->
    <td align="left" class="normal"><%=data2[11]%></td>
    <td align="left" class="normal"><%=data2[12]%></td>
  </tr>
  <%
     }
  %>
     
    </table></td>
  </tr>
  <tr>
    <td valign="middle" bgcolor="#e8e8e8" class="nav"><img src="../images/attachments.jpg" width="25" height="104" /></td>
    <td colspan="7" class="normal"><table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#F8F8F8">
      <tr>
        <td align="left" valign="top" class="travelMenuBG">Description</td>
        <td height="25" align="left" valign="top" class="travelMenuBG">Files</td>
        <td width="3%" rowspan="4" align="left" valign="middle" bgcolor="#E8E8E8"><img src="../images/benchmarking.jpg" width="25" height="104" /></td>
        <td align="left" valign="top" class="travelMenuBG">Vendor Name</td>
        <td align="left" valign="top" class="travelMenuBG">Product / Service</td>
        <td align="left" valign="top" class="travelMenuBG">Rate</td>
        <td align="left" valign="top" class="travelMenuBG">U O M</td>
        <td align="left" valign="top" class="travelMenuBG">Remarks</td>
      </tr>
	  <%
				if(!(ATTACHMENT1.equals("NA.NA_NA")))
				{
				 String st1 = ATTACHMENT1.substring(0, ATTACHMENT1.lastIndexOf("."));
				 String st2 = ATTACHMENT1.substring(ATTACHMENT1.lastIndexOf(".")+1,ATTACHMENT1.length());
                 String st3 = st1.substring(0, ATTACHMENT1.lastIndexOf("_"));
                 display = st3 + "." + st2;
				}
	  %>
      <tr> 
        <td width="10%" align="left" valign="top"><%=DESCRIPTION1%></td>
        <td width="11%" height="25" align="left" valign="top"><%if(!(ATTACHMENT1.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT1%>')" class="normal"><%=display%></a><%}%></td>
        <td width="15%" align="left" valign="top" ><%=COMPANY_NAME1%></td>
        <td width="19%" align="left" valign="top" ><%=PRODUCT1%></td>
        <td width="10%" align="left" valign="top"><%=RATE1%></td>
        <td width="16%" align="left" valign="top"><%=UMO1%></td>
        <td width="16%" align="left" valign="top"><%=REMARKS1%></td>
      </tr>
	  <%
				if(!(ATTACHMENT2.equals("NA.NA_NA")))
				{
				 String st1 = ATTACHMENT2.substring(0, ATTACHMENT2.lastIndexOf("."));
				 String st2 = ATTACHMENT2.substring(ATTACHMENT2.lastIndexOf(".")+1,ATTACHMENT2.length());
                 String st3 = st1.substring(0, ATTACHMENT2.lastIndexOf("_"));
                 display = st3 + "." + st2;
				}
	  %>
      <tr>
        <td valign="top" align="left"><%=DESCRIPTION2%></td>
        <td height="25" valign="top" align="left"><%if(!(ATTACHMENT2.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT2%>')" class="normal"><%=display%></a><%}%></td>
        <td valign="top" align="left"><%=COMPANY_NAME2%></td>
        <td valign="top" align="left"><%=PRODUCT2%></td>
        <td valign="top" align="left"><%=RATE2%></td>
        <td valign="top" align="left"><%=UMO2%></td>
        <td valign="top" align="left"><%=REMARKS2%></td>
      </tr>
	  <%
				if(!(ATTACHMENT3.equals("NA.NA_NA")))
				{
				 String st1 = ATTACHMENT3.substring(0, ATTACHMENT3.lastIndexOf("."));
				 String st2 = ATTACHMENT3.substring(ATTACHMENT3.lastIndexOf(".")+1,ATTACHMENT3.length());
                 String st3 = st1.substring(0, ATTACHMENT3.lastIndexOf("_"));
                 display = st3 + "." + st2;
				}
	  %>
      <tr>
        <td valign="top" align="left"><%=DESCRIPTION3%></td>
        <td height="36" valign="top" align="left"><%if(!(ATTACHMENT3.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT3%>')" class="normal"><%=display%></a><%}%></td>
        <td valign="top" align="left"><%=COMPANY_NAME3%></td>
        <td valign="top" align="left"><%=PRODUCT3%></td>
        <td valign="top" align="left"><%=RATE3%></td>
        <td valign="top" align="left"><%=UMO3%></td>
        <td valign="top" align="left"><%=REMARKS3%></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#e8e8e8" class="nav"><img src="../images/recommendation.jpg" width="25" height="104" /></td>
    <td colspan="7" class="normal" align="left" valign="top"><%=RECOMMENEDATION%></td>
  </tr>
  <tr>
  <td align="left"  bgcolor="#e8e8e8" valign="middle"><!-- <img src="../images/supportedBy.jpg" width="25" height="78"/> --></td>
    <!-- <td colspan="8" align="center">
	<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#F8F8F8">
	<tr></td><td align="left"><%if(!SD1.equals("0") && SD1.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=SD1%>,'SD1','X')"><img border="0" src="../images/post.jpg"></a><%}%></td><td align="left"><%if(!SD2.equals("0") && SD2.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=SD2%>,'SD2','X')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td  valign="bottom" align="center" class="ToolText" onMouseOver="javascript:this.className='ToolTextHover';loadRemarks(<%=priceid%>,<%=SD1%>,'sd1Remarks','SD1')" onMouseOut="javascript:this.className='ToolText'" width="50%"><span id="test" style="padding:4px"><div id="sd1Remarks"><!-- Remarks Loads Here</div></span><span class="small"><%if(SUPPORTEDBY_DIRECTOR1!=null){out.println(SUPPORTEDBY_DIRECTOR1);}%><%if(!SUPPORTEDBY_DIRECTOR1_STATUS.equals("L")){%><br><%out.println(SUPPORTEDBY_DIRECTOR1_DATE);}%><%if(SUPPORTEDBY_DIRECTOR1_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(SUPPORTEDBY_DIRECTOR1_STATUS.equals("R")){%><img src="../images/rejected.png"><%}%></span>
	</td>
    <td width="50%" valign="bottom" class="ToolText" onMouseOver="javascript:this.className='ToolTextHover';loadRemarks(<%=priceid%>,<%=SD2%>,'sd2Remarks','SD2')" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="sd2Remarks"><!-- Remarks Loads Here</div></span><span class="small"><%if(SUPPORTEDBY_DIRECTOR2!=null){out.println(SUPPORTEDBY_DIRECTOR2);}%><%if(!SUPPORTEDBY_DIRECTOR2_STATUS.equals("L")){%><br><%out.println(SUPPORTEDBY_DIRECTOR2_DATE);}%><%if(SUPPORTEDBY_DIRECTOR2_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(SUPPORTEDBY_DIRECTOR2_STATUS.equals("R")){%><img src="../images/rejected.png"><%}%></span></td>
  </tr>
  </table>
  </td> -->
  </tr>
  <tr>
    <td rowspan="9" bgcolor="#e8e8e8" class="nav"><img src="../images/approval.jpg" width="25" height="104" /></td>
    <td width="21%" align="center" class="travelMenuBG" valign="top">B&C</td>
    <td width="21%" align="center" class="travelMenuBG" valign="top">USER</td>
    <td width="22%" align="center" class="travelMenuBG" valign="top">FINANCE/BRANCH HEAD/ MAS</td>
    <td width="9%" align="center" class="travelMenuBG" valign="top">DIRECTOR B&C</td>
    <td width="9%" align="center" class="travelMenuBG" valign="top">EP SUPP. CHAIN</td>
    <td width="9%" align="center" class="travelMenuBG" valign="top">COO / CEO</td>
    <td width="9%" align="center" class="travelMenuBG" valign="top">Managing Director</td>
  </tr>
  <tr>
   <td align="left" class="normal"><%if(!AP11.equals("0") && AP11.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP11%>,'AP11','X')"><img border="0" src="../images/post.jpg"></a><%}%></td>

<!-- <td align="left"><%if(!AP11.equals("0") && AP11.equals(timescapeUId)){%><%@ include file="../common/mynew.jsp"%>
   <%}%></td> -->

 <!-- <td class="normal" align="left"><%if(!AP12.equals("0") && AP12.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP12%>,'AP12','X')"><img border="0" src="../images/post.jpg"></a><%}%></td> -->

	<td align="left"><%if(!AP12.equals("0") && AP12.equals(timescapeUId)){%><%@ include file="../common/mynew.jsp"%>
   <%}%></td>

   <!--  <td class="normal" align="left"><%if(!AP13.equals("0") && AP13.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP13%>,'AP13','X')"><img border="0" src="../images/post.jpg"></a><%}%></td> -->

   <td align="left"><%if(!AP13.equals("0") && AP13.equals(timescapeUId)){%><%@ include file="../common/mynew.jsp"%>
   <%}%></td>
    <td rowspan="8" valign="top">
	<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP4.equals("0") && AP4.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP4%>,'AP4','X')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
	<td valign="top" height="200" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap4Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER4!=null){out.println(APPROVER4);}if(!APPROVER4_STATUS.equals("L")){%><br><%out.println(APPROVER4_DATE);}%><%if(APPROVER4_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER4_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER4_STATUS.equals("H")){%><span class="small">Review</span><%}
	if(!AP4.equals("0") && AP4.equals(timescapeUId)&& (!APPROVER4_STATUS.equals("L"))){%><%@ include file="../common/mynew.jsp"%><%}%>
    </span></td>
	</tr>
	</table>
	</td>
	<td rowspan="8" valign="top">
	<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP5.equals("0") && AP5.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP5%>,'AP5','X')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="200" class="ToolText"><span id="test" style="padding:4px"><div id="ap5Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER5!=null){out.println(APPROVER5);}if(!APPROVER5_STATUS.equals("L")){%><br><%out.println(APPROVER5_DATE);}%><%if(APPROVER5_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER5_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER5_STATUS.equals("H")){%><span class="small">Review</span><%} if (!AP5.equals("0") && AP5.equals(timescapeUId) && (!APPROVER5_STATUS.equals("L"))){%><%@ include file="../common/mynew.jsp"%>
   <%}%>
	</span></td>
	</tr>
	</table>
	</td>
    <td rowspan="8" valign="top">
	<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP6.equals("0") && AP6.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP6%>,'AP6','X')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="200" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap6Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER6!=null){out.println(APPROVER6);}if(!APPROVER6_STATUS.equals("L")){%><br><%out.println(APPROVER6_DATE);}%><%if(APPROVER6_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER6_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER6_STATUS.equals("H")){%><span class="small">Review</span><%}if(!AP6.equals("0") && AP6.equals(timescapeUId) && (!APPROVER6_STATUS.equals("L"))){%><%@ include file="../common/mynew.jsp"%>
   <%}%> </span></td>
	</tr>
	</table>
	</td>


	<td rowspan="8" valign="top">
	<table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP7.equals("0") && AP7.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP7%>,'AP7','X')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="200" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap7Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER7!=null){out.println(APPROVER7);}if(!APPROVER7_STATUS.equals("L")){%><br><%out.println(APPROVER7_DATE);}%><%if(APPROVER7_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER7_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER7_STATUS.equals("H")){%><span class="small">Review</span><%}
	 if(!AP7.equals("0") && AP7.equals(timescapeUId) && (!APPROVER7_STATUS.equals("L"))){%><%@ include file="../common/mynew.jsp"%>
   <%}%>
	</span></td>
	</tr>
	</table>
	</td>




  </tr>
  <tr>

    <td align="center" > <span id="test" style="padding:4px"><div id="ap11Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER11!=null){out.println(APPROVER11);}if(!APPROVER11_STATUS.equals("L")){%><br><%out.println(APPROVER11_DATE);}%><%if(APPROVER11_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER11_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER11_STATUS.equals("H")){%><span class="small">Review</span><%} %> </td>

    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap12Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER12!=null){out.println(APPROVER12);}if(!APPROVER12_STATUS.equals("L")){%><br><%out.println(APPROVER12_DATE);}%><%if(APPROVER12_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER12_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER12_STATUS.equals("H")){%><span class="small">Review</span><%System.out.println("Approver status" +APPROVER12_STATUS); }%></span></td>
    
	<td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap13Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER13!=null){out.println(APPROVER13);}if(!APPROVER13_STATUS.equals("L")){%><br><%out.println(APPROVER13_DATE);}%><%if(APPROVER13_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER13_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER13_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
  </tr>
  <tr>
   <!--  <td align="left"><%if(!AP21.equals("0") && AP21.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP21%>,'AP21','X')"><img border="0" src="../images/post.jpg"></a><%}%></td> -->
	  <td align="left"><%if(!AP21.equals("0") && AP21.equals(timescapeUId) && (!APPROVER21_STATUS.equals("L"))){%><%@ include file="../common/mynew.jsp"%>
   <%}%></td>
   <!--  <td align="left"><%if(!AP22.equals("0") && AP22.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP22%>,'AP22','X')"><img border="0" src="../images/post.jpg"></a><%}%></td> -->
  <td align="left"><%if(!AP22.equals("0") && AP22.equals(timescapeUId) && (!APPROVER22_STATUS.equals("L"))){%><%@ include file="../common/mynew.jsp"%>
   <%}%></td>

   <!--  <td align="left"><%if(!AP23.equals("0") && AP23.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP23%>,'AP23','X')"><img border="0" src="../images/post.jpg"></a><%}%></td> -->

     <td align="left"><%if(!AP23.equals("0") && AP23.equals(timescapeUId) && (!APPROVER23_STATUS.equals("L"))){%><%@ include file="../common/mynew.jsp"%>
   <%}%></td>

  </tr>
  <tr>
    <td align="center" class="ToolText"
   
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap21Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER21!=null){out.println(APPROVER21);}if(!APPROVER21_STATUS.equals("L")){%><br><%out.println(APPROVER21_DATE);}%><%if(APPROVER21_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER21_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER21_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"  <span id="test" style="padding:4px"><div id="ap22Remarks"><!-- Remarks Loads Here--></div></span>
	<span class="small"><%if(APPROVER22!=null){out.println(APPROVER22);}if(!APPROVER22_STATUS.equals("L")){%><br><%out.println(APPROVER22_DATE);}%><%if(APPROVER22_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER22_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER22_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText"  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap23Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER23!=null){out.println(APPROVER23);}if(!APPROVER23_STATUS.equals("L")){%><br><%out.println(APPROVER23_DATE);}%><%if(APPROVER23_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER23_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER23_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
  </tr>
  <tr>
   <!--  <td align="left"><%if(!AP31.equals("0") && AP31.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP31%>,'AP31','X')"><img border="0" src="../images/post.jpg"></a><%}%></td> -->
   <td align="left"><%if(!AP31.equals("0") && AP31.equals(timescapeUId)){%><%@ include file="../common/mynew.jsp"%>
   <%}%></td>
   <!--  <td align="left"><%if(!AP32.equals("0") && AP32.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP32%>,'AP32','X')"><img border="0" src="../images/post.jpg"></a><%}%></td> -->
	<td align="left"><%if(!AP32.equals("0") && AP32.equals(timescapeUId)){%><%@ include file="../common/mynew.jsp"%>
   <%}%></td>
    <!-- <td align="left"><%if(!AP33.equals("0") && AP33.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP33%>,'AP33','X')"><img border="0" src="../images/post.jpg"></a><%}%></td> -->
	<td align="left"><%if(!AP33.equals("0") && AP33.equals(timescapeUId)){%><%@ include file="../common/mynew.jsp"%>
   <%}%></td>
  </tr>
  <tr>
    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap31Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER31!=null){out.println(APPROVER31);}if(!APPROVER31_STATUS.equals("L")){%><br><%out.println(APPROVER31_DATE);}%><%if(APPROVER31_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER31_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER31_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap32Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER32!=null){out.println(APPROVER32);}if(!APPROVER32_STATUS.equals("L")){%><br><%out.println(APPROVER32_DATE);}%><%if(APPROVER32_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER32_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER32_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap33Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER33!=null){out.println(APPROVER33);}if(!APPROVER33_STATUS.equals("L")){%><br><%out.println(APPROVER33_DATE);}%><%if(APPROVER33_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER33_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER33_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
  </tr>
  <tr>
  <td>&nbsp;<td>
  <td align="left"><%if(!AP33.equals("0") && AP33.equals(timescapeUId)){%><a href="#" onclick="openRemarks(<%=priceid%>,<%=AP33%>,'AP33','X')"><img border="0" src="../images/post.jpg"></a><%}%></td>
  </tr>
  <tr>
  
  <td>&nbsp;<td>
  <td align="center" class="ToolText"  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap34Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(APPROVER34!=null){out.println(APPROVER34);}if(!APPROVER34_STATUS.equals("L")){%><br><%out.println(APPROVER34_DATE);}%><%if(APPROVER34_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER34_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER34_STATUS.equals("H")){%><span class="small">Review</span> <%}%></span></td>

  </tr>
</table>
 


<table width="815" border="1" bordercolor="#F5F5F5" cellspacing="0" cellpadding="2">
    <%
		String PrintRemarksSD1   = "";
		String PrintRemarksSD2   = "";
		String PrintRemarksAPP11 = "";
		String PrintRemarksAPP12 = "";
		String PrintRemarksAPP13 = "";
		String PrintRemarksAPP21 = "";
		String PrintRemarksAPP22 = "";
		String PrintRemarksAPP23 = "";
		String PrintRemarksAPP31 = "";
		String PrintRemarksAPP32 = "";
		String PrintRemarksAPP33 = "";
		String PrintRemarksAPP4  = "";
		String PrintRemarksAPP5  = "";
		String PrintRemarksAPP6  = "";
		String PrintRemarksAPP34  = "";
		String PrintRemarksAPP7  = "";
		

		String data[]       = null;
		ArrayList remarks   = new ArrayList();
		String str          = ""; 
		int i = 0;
		long priceid_L = Long.parseLong(priceid);

		// SD1 Remarks
		         
				   long SD1_L = Long.parseLong(SD1);
				   
				   remarks  = priceApprovalWebController.showRemarks(SD1_L,priceid_L,"SD1");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksSD1 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksSD1= "No Remarks";
				   }	
	// SD1 remarks end

	// SD2 Remarks
		         
				   long SD2_L = Long.parseLong(SD1);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(SD2_L,priceid_L,"SD2");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksSD2 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksSD2= "No Remarks";
				   }	
	// SD2 remarks end

	// AP11 Remarks
		         
				   long AP11_L = Long.parseLong(AP11);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP11_L,priceid_L,"AP11");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				 if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP11 = str;
				   }
				 else
				  {
					  //out.println("No Remarks");	
					 PrintRemarksAPP11= "No Remarks";
				   }	
	// AP11 remarks end
	// AP12 Remarks
		         
				   long AP12_L = Long.parseLong(AP12);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP12_L,priceid_L,"AP12");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP12 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP12= "No Remarks";
				   }	
	// AP12 remarks end
	// AP13 Remarks
		         
				   long AP13_L = Long.parseLong(AP13);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP13_L,priceid_L,"AP13");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP13 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP13= "No Remarks";
				   }	
	// AP13 remarks end
	// AP21 Remarks
		         
				   long AP21_L = Long.parseLong(AP21);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP21_L,priceid_L,"AP21");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP21 = str;
				   }
				   else
				   {
					 // out.println("No Remarks");	
					 PrintRemarksAPP21= "No Remarks";
					
				   }	
	// AP21 remarks end
	// AP22 Remarks
		         
				   long AP22_L = Long.parseLong(AP22);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP22_L,priceid_L,"AP22");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP22 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP22= "No Remarks";
				   }	
	// AP22 remarks end
	// AP23 Remarks
		         
				   long AP23_L = Long.parseLong(AP23);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP23_L,priceid_L,"AP23");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP23 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP23= "No Remarks";
				   }	
	// AP23 remarks end
	// AP31 Remarks
		         
				   long AP31_L = Long.parseLong(AP31);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP31_L,priceid_L,"AP31");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP31 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP31= "No Remarks";
				   }	
	// AP31 remarks end
	// AP32 Remarks
		         
				   long AP32_L = Long.parseLong(AP32);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP32_L,priceid_L,"AP32");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP32 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP32= "No Remarks";
				   }	
	// AP32 remarks end
	// AP33 Remarks
		         
				   long AP33_L = Long.parseLong(AP33);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP33_L,priceid_L,"AP33");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP33 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP33= "No Remarks";
				   }	
	// AP33 remarks end

	// AP34 Remarks
		         
				   long AP34_L = Long.parseLong(AP34);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP34_L,priceid_L,"AP34");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP34 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP34= "No Remarks";
				   }	
	// AP33 remarks end









	// AP4 Remarks
		         
				   long AP4_L = Long.parseLong(AP4);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP4_L,priceid_L,"AP4");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP4 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP4= "No Remarks";
				   }	
	// AP4 remarks end
	// AP5 Remarks
		         
				   long AP5_L = Long.parseLong(AP5);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP5_L,priceid_L,"AP5");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP5 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP5= "No Remarks";
				   }	
	// AP5 remarks end
	// AP6 Remarks
		         
				   long AP6_L = Long.parseLong(AP6);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP6_L,priceid_L,"AP6");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP6 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP6= "No Remarks";
				   }	
	// AP6 remarks end

	// AP7 Remarks
		         
				   long AP7_L = Long.parseLong(AP7);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP7_L,priceid_L,"AP7");
				
		           str      = "<table width='100%' cellpadding='0' cellspacing='0'>";
					
				
 				   if(remarks.size()>0)
				   {
						
						for(i = 0; i<remarks.size(); i++)
						{
							       data   = (String[])remarks.get(i);
							       str    = str + "<tr><td align='left'>";
								   str	  = str + data[3];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='6px'></td></tr>";
								   str	  = str + "<tr><td align='right'>";
								   str	  = str + "&nbsp;"+ data[4];
								   str	  = str + "</td></tr>";
								   str	  = str + "<tr><td height='8px' align='center'></td></tr>";
						}
							
						str = str + "</table>";
						//out.println(str);
						PrintRemarksAPP7 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP7= "No Remarks";
				   }	
	// AP7 remarks end

	%>
  <tr>
  <td height="23" colspan="2" align="center" valign="middle" bgcolor="#333333" class="white">R E M A R K S</td>
  </tr>
  <!-- <tr>
    <td height="23" colspan="2" align="center" valign="middle" class="greyBG">D I R E C T O R S</td>
  </tr>
  <tr>
    <td width="401" height="22" class="travelMenuBG"><%if(SUPPORTEDBY_DIRECTOR1!=null){out.println(SUPPORTEDBY_DIRECTOR1);}%></td>
    <td width="408" class="travelMenuBG"><%if(SUPPORTEDBY_DIRECTOR2!=null){out.println(SUPPORTEDBY_DIRECTOR2);}%></td>
  </tr>
  <tr>
    <td height="29" class="small"><%=PrintRemarksSD1%></td>
    <td class="small"><%=PrintRemarksSD2%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr> -->
</table>
  <table width="815" border="1"bordercolor="#F5F5F5"  cellspacing="0" cellpadding="2">
  <tr>
    <td width="30%" height="22" align="center" valign="middle" class="greyBG"> B &amp; C </td>
    <td width="30%" height="22" align="center" valign="middle" class="greyBG"> USER </td>
    <td width="30%" height="22" align="center" valign="middle" class="greyBG"> FINANCE/BRANCH HEAD/ MAS </td>
  </tr>
  <tr>
    <td height="22" class="travelMenuBG"><span class="small"><%if(APPROVER11!=null){out.println(APPROVER11);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%if(APPROVER12!=null){out.println(APPROVER12);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%if(APPROVER13!=null){out.println(APPROVER13);}%></span></td>
  </tr>
  <tr>
    <td height="21" class="small"><%=PrintRemarksAPP11%></td>
    <td class="small"><%=PrintRemarksAPP12%></td>
    <td class="small"><%=PrintRemarksAPP13%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="22" class="travelMenuBG"><span class="small"><%if(APPROVER21!=null){out.println(APPROVER21);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%if(APPROVER22!=null){out.println(APPROVER22);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%if(APPROVER23!=null){out.println(APPROVER23);}%></span></td>
  </tr>
  <tr>
    <td height="21" class="small"><%=PrintRemarksAPP11%></td>
    <td class="small"><%=PrintRemarksAPP22%></td>
    <td class="small"><%=PrintRemarksAPP23%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="22" class="travelMenuBG"><span class="small"><%if(APPROVER31!=null){out.println(APPROVER31);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%if(APPROVER32!=null){out.println(APPROVER32);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%if(APPROVER33!=null){out.println(APPROVER33);}%></span></td>
  </tr>
  <tr>
    <td height="21" class="small"><%=PrintRemarksAPP31%></td>
    <td class="small"><%=PrintRemarksAPP32%></td>
    <td class="small"><%=PrintRemarksAPP33%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="22" class="travelMenuBG"><!-- <span class="small"><%if(APPROVER11!=null){out.println(APPROVER11);}%></span> --></td>
    <td class="travelMenuBG"><!-- <span class="small"><%if(APPROVER21!=null){out.println(APPROVER21);}%></span> --></td>
    <td class="travelMenuBG"><span class="small"><%if(APPROVER34!=null){out.println(APPROVER34);}%></span></td>
  </tr>
  <tr>
    <td height="21" class="small"><!-- <%=PrintRemarksAPP11%> --></td>
    <td class="small"><!-- <%=PrintRemarksAPP21%> --></td>
    <td class="small"><%=PrintRemarksAPP34%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <table width="815" border="1"bordercolor="#F5F5F5"  cellspacing="0" cellpadding="2">
  <tr>
    <td height="23" colspan="4" align="center" valign="middle" class="greyBG">DIRECTORS</td>
  </tr>
  <tr>
    <td width="258" height="22" class="travelMenuBG"><span class="travelMenuBG"><%if(APPROVER4!=null){out.println(APPROVER4);}%></span></td>
    <td width="251" class="travelMenuBG"><%if(APPROVER5!=null){out.println(APPROVER5);}%></td>
    <td width="258" class="travelMenuBG"><%if(APPROVER6!=null){out.println(APPROVER6);}%></td>
    <td width="258" class="travelMenuBG"><%if(APPROVER7!=null){out.println(APPROVER7);}%></td>
  </tr>
  <tr>
    <td height="29" class="small"><%=PrintRemarksAPP4%></td>
    <td class="small"><%=PrintRemarksAPP5%></td>
    <td class="small"><%=PrintRemarksAPP6%></td>
    <td class="small"><%=PrintRemarksAPP7%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  </table>

  </table>

  
<input type="hidden" name="SD1Remarks" value="<%=PrintRemarksSD1%>">
<input type="hidden" name="SD2Remarks" value="<%=PrintRemarksSD2%>">
<input type="hidden" name="AP11Remarks" value="<%=PrintRemarksAPP11%>">
<input type="hidden" name="AP12Remarks" value="<%=PrintRemarksAPP12%>">
<input type="hidden" name="AP13Remarks" value="<%=PrintRemarksAPP13%>">
<input type="hidden" name="AP21Remarks" value="<%=PrintRemarksAPP21%>">
<input type="hidden" name="AP22Remarks" value="<%=PrintRemarksAPP22%>">
<input type="hidden" name="AP23Remarks" value="<%=PrintRemarksAPP23%>">
<input type="hidden" name="AP31Remarks" value="<%=PrintRemarksAPP31%>">
<input type="hidden" name="AP32Remarks" value="<%=PrintRemarksAPP32%>">
<input type="hidden" name="AP33Remarks" value="<%=PrintRemarksAPP33%>">
<input type="hidden" name="AP4Remarks" value="<%=PrintRemarksAPP4%>">
<input type="hidden" name="AP5Remarks" value="<%=PrintRemarksAPP5%>">
<input type="hidden" name="AP6Remarks" value="<%=PrintRemarksAPP6%>">
<input type="hidden" name="AP34Remarks" value="<%=PrintRemarksAPP34%>">
<input type="hidden" name="AP7Remarks" value="<%=PrintRemarksAPP7%>">
</form>
</center>
</body>
</html>