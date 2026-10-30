<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%@ include file="../includes/idCategory.jsp"%>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta name="description" content="">  
<meta name="author" content="">   
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Annexure 1 : Comparative quotes </title>
<link href="../style/global1.css" rel="stylesheet" type="text/css" />
<script> 
    function hideImage() { 
       // if (document.getElementById) { 
            document.getElementById("print").style.visibility = 'hidden'; 
            document.getElementById("back").style.visibility = 'hidden'; 
      //  } 
    }
    function showImage() { 
        if (document.getElementById) { 
            document.getElementById('print').style.visibility = 'visible'; 
            document.getElementById('back').style.visibility = 'visible'; 
        } 
    } 
    function backPage()
    {
        document.location.href = "../indexnp.jsp";
    }
</script>
</head>

<%
		//String DPATH        = EnvironmentProperties.getValue("priceapproval", "uploadPath");

	    //String userEmailid  = "";

		String timescapeUId = Long.toString(timescapeUserOId);
	    String tOId			= (String)request.getParameter("tOId");
//out.println("toid"+tOId);
        String priceid		= (String)request.getParameter("priceid");
        ArrayList vStatus	=  new ArrayList();
		vStatus 			=	priceApprovalWebController.viewStatusnp(tOId,priceid);
		ArrayList vStatus2	=  new ArrayList();
		vStatus2 			=	priceApprovalWebController.viewApproverNp(priceid);
		String[] data1		= (String [])vStatus.get(0);
		String pageType		= request.getParameter("viewSAB"); 
		String[] data3      = (String [])vStatus2.get(0);

        String priceId			        =  data1[0];
        String vendorName		        =  data1[1];
        String category			        =  data1[2];
        String mill			            =  data1[3];
        String paymentTerms		        =  data1[4];
        String sourcing			        =  data1[5];
        String quantity			        =  data1[6];
        String deliveryIn		        =  data1[7];
        String quality			        =  data1[8];
        String gsm			            =  data1[9];
        String thisLotcfr		        =  data1[10];
        String invoicePrice		        =  data1[11];
        String risi		                =  data1[12];
        String aopReceiptPrice		    =  data1[13];
        String aopReceiptForEx  	    =  data1[14];
        String aopDealValue       	    =  data1[15];
        String annualBudget		        =  data1[16];
        String contractedTonsytd	    =  data1[17];
        String currentQuarter   	    =  data1[18];
        String balanceToBought		    =  data1[19];
        String otherRemaks		        =  data1[20];
        String marketEvent		        =  data1[21];
        String ap1			            =  data1[22];
        String ap2			            =  data1[23];
        String ap3			            =  data1[24];
        String ap4			            =  data1[25];
        String ap5			            =  data1[26];
        String ap6			            =  data1[27];
        String STATUS			        =  data1[28];
        String totalPrice_unitRate	    =  data1[29];
        String totalPrice_rsperTon	    =  data1[30];
        String totalPrice_spend		    =  data1[31];
        String customsDuty_unitRate	    =  data1[32];
        String customsDuty_rsperTon	    =  data1[33];
        String customsDuty_spend	    =  data1[34];
        String freight_unitRate		    =  data1[35];
        String freight_rsperTon		    =  data1[36];
        String freight_spend		    =  data1[37];
        String insurance_unitRate	    =  data1[38];
        String insurance_rsperTon	    =  data1[39];
        String insurance_spend		    =  data1[40];
        String totalActualCost_unitRate =  data1[41];
        String totalActualCost_rsperTon =  data1[42];
        String totalActualCost_spend	=  data1[43];
        String budgetvsActual_unitRate  =  data1[44];
        String quarterOpeningQuantity	=  data1[45];
        String quarterOpeningDays	    =  data1[46];
        String expectedReceiptsQuantity     =  data1[47];
        String expectedReceiptsDays	        =  data1[48];
        String estimatedCons1   	        =  data1[49];
        String estimatedCons2   	        =  data1[50];
        String quarterEnd1         	        =  data1[51];
        String quarterEnd2         	        =  data1[52];

        String AP1Name                      =  data1[53];
        String AP2Name                      =  data1[54];
        String AP3Name                      =  data1[55];
        String AP4Name                      =  data1[56];
        String AP5Name                      =  data1[57];
        String AP6Name                      =  data1[58];
        String createdOn                    =  data1[64];

        String AP1_STATUS					=   data3[0]; 
        String AP1_DATE						=   data3[1]; 
        String AP2_STATUS					=   data3[2]; 
        String AP2_DATE						=   data3[3]; 
        String AP3_STATUS					=   data3[4]; 
        String AP3_DATE						=   data3[5]; 
        String AP4_STATUS					=   data3[6]; 
        String AP4_DATE						=   data3[7]; 
        String AP5_STATUS					=   data3[8]; 
        String AP5_DATE						=   data3[9]; 
        String AP6_STATUS					=   data3[10]; 
        String AP6_DATE						=   data3[11]; 



            ArrayList vStatus3	=  new ArrayList();
	        Hashtable vendorDataHash = new Hashtable();
            vendorDataHash.put("PRICEID",priceid);

            vStatus3 			=	priceApprovalWebController.vendorDataNp(vendorDataHash);


            ArrayList vStatus4	=  new ArrayList();
	        Hashtable commentDataHash = new Hashtable();
            commentDataHash.put("PRICEID",priceid);

            vStatus4 			=	priceApprovalWebController.commentDataNp(commentDataHash);



		    
	String Approver  = "";
	String appStatus = "";

	 if(ap1.equals(tOId) && AP1_STATUS.equals("L"))
	{
		Approver = "AP1";
		appStatus = AP1_STATUS;
	}
	else if(ap2.equals(tOId) && AP1_STATUS.equals("A") && AP2_STATUS.equals("L"))
	{
		Approver = "AP2";
		appStatus = AP2_STATUS;
	}
	else if(ap3.equals(tOId) && AP2_STATUS.equals("A")&& AP3_STATUS.equals("L"))
	{
		Approver = "AP3";
		appStatus = AP3_STATUS;
	}
	else if(ap4.equals(tOId) && AP3_STATUS.equals("A") && AP4_STATUS.equals("L"))
	{
		Approver = "AP4";
		appStatus = AP4_STATUS;
	}

	else if(ap5.equals(tOId) && AP4_STATUS.equals("A") && AP5_STATUS.equals("L"))
	{
		Approver = "AP5";
		appStatus = AP5_STATUS;
	}
	else if(ap6.equals(tOId) && AP5_STATUS.equals("A")&& AP6_STATUS.equals("L"))
	{
		Approver = "AP6";
		appStatus = AP6_STATUS;
	}
		    


%>

<body>
<table align="center">
<br>
<div class="row">
    <button type="button" id="back" class="btn btn-info" style="margin-bottom:8px;margin-top:5px;margin-left:210px;" onclick="javascript:window.close();">Close</button>
    <button type="printbutton" id="print" class="btn btn-primary" style="margin-bottom:8px;margin-top:5px;margin-left:870px;" onclick="javascript:hideImage();window.print();showImage();">Print</button><br>
</div>

<tr>
<td>
<p><h4 style="margin-top:10px;margin-left:20px;" class="travelMenuBG">Annexure 1 : Comparative Quotes </h4></p>
<p><h4 style="margin-top:10px;margin-left:20px;" class="travelMenuBG">Reference to Sanction <%=priceId%> dated <%=createdOn%></h4></p>
<table width="1000" border="1" border-color="#f0f0f0" cellpadding="2" cellspacing="0">

  <tr>
    <td colspan="6" border="0">&nbsp;</td>
    
    
    <td colspan="4" align="center"  style="background-color:#F2DDDC;" class="travelMenuBG">Offers</td>
   
  </tr>
  <tr  >
    <td width="10" align="center" style="padding:1px;background-color:#F2DDDC;" class="travelMenuBG">Sr.No.</td>
    <td width="130"  align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Vendor Name </td>
    <td width="85" align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Country</td>
    <td width="155" align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Mill</td>
    <td width="80" align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Grade</td>
    <td width="80" align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Agent Name </td>
    <td width="88" align="center" style="padding:2px;background-color:#F2DDDC;" class="travelMenuBG">Offer Quantity <br />(MT)</td>
    <td width="88" align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Offer Price<br/>(per/MT) </td>
    <td width="88" align="center" style="background-color:#F2DDDC;" style="background-color:#F2DDDC;" class="travelMenuBG">Final Quantity<br/>(MT) </td>
    <td width="88" align="center" style="background-color:#F2DDDC;" style="background-color:#F2DDDC;"class="travelMenuBG">Final Price   <br/>(per/MT) </td>
  </tr>
<%
    if(vStatus3.size()>0)
	{
      for ( int ii = 0; ii < vStatus3.size(); ii++ ) 
        {

		String[] data4 = (String [])vStatus3.get(ii);


  int len =data4[6].length();

		 String temp = "";
			
	int	lenCount = len-1;

	int	counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + data4[6].charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				data4[6] = temp;
		}


   len = data4[8].length();

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
				
				temp = temp + data4[8].charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				data4[8] = temp;
		}



%>
  <tr>
    <td align="left" style="padding:2px;" class="normal">&nbsp;<%=ii+1%></td>
    <td align="left" style="padding:2px;" class="normal">&nbsp;<%=data4[1]%></td>
    <td align="left" style="padding:2px;" class="normal">&nbsp;<%=data4[2]%></td>
    <td align="left" style="padding:2px;" class="normal">&nbsp;<%=data4[3]%></td>
    <td align="left" style="padding:2px;" class="normal">&nbsp;<%=data4[4]%></td>
    <td align="left" style="padding:2px;" class="normal">&nbsp;<%=data4[5]%></td>
    <td align="right" style="padding:2px;" class="normal">&nbsp;<%=data4[6]%></td>
    <td align="right" style="padding:2px;" class="normal">&nbsp;<%=data4[7]%></td>
    <td align="right" style="padding:2px;" class="normal">&nbsp;<%=data4[8]%></td>
    <td align="right" style="padding:2px;" class="normal">&nbsp;<%=data4[9]%></td>
  </tr>
<%
   
} }

%>
</table>
<h4 style="margin-top:30px;margin-left:20px;" class="travelMenuBG">Comments</h4>
<table width="1000" border="1" border-color="#f0f0f0" cellpadding="2" cellspacing="0">
  <tr  bgcolor="#D8D8D8">
    <td width="66" align="center" style="padding:5px;background-color:#F2DDDC;" class="travelMenuBG">Sr.No.</td>
    <td width="139" align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Vendor Name </td>
    <td width="127" align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Country</td>
    <td width="155" align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Mill</td>
    <td width="122" align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Grade</td>
    <td width="100" align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Q Score</td>
    <td width="149" align="center" style="background-color:#F2DDDC;" class="travelMenuBG">Remarks</td>
  </tr>
<%
    if(vStatus4.size()>0)
	{
      for ( int ii = 0; ii < vStatus4.size(); ii++ ) 
        {

		String[] data5 = (String [])vStatus4.get(ii);
%>
  <tr>
    <td class="normal">&nbsp;<%=ii+1%></td>
    <td class="normal">&nbsp;<%=data5[2]%></td>
    <td class="normal">&nbsp;<%=data5[3]%></td>
    <td class="normal">&nbsp;<%=data5[4]%></td>
    <td class="normal">&nbsp;<%=data5[5]%></td>
    <td class="normal">&nbsp;<%=data5[6]%></td>
    <td class="normal">&nbsp;<%=data5[7]%></td>
  </tr>
<%
   
} }

%>
</table>

<table width="754" border="0" style="margin-top:30px;" >
  <tr>
    <td width="233"><table width="200" border="1" border-color="#f0f0f0" cellpadding="2" cellspacing="0">
      <tr>
          <td valign="top"  bgcolor="#D8D8D8" align="center" class="travelMenuBG"><span id="test" style="padding:4px">B & C Category Head</td>
      </tr>
      <tr>
     <td valign="top" align="center" height="60px"><span class="normal"><%if(AP1Name!=null){%><br><%out.println(AP1Name);}%><%if(ap1.equals(timescapeUId)&& (AP1_STATUS.equals("L"))){%><br>In-process<br><%}if(!AP1_STATUS.equals("L")){%><br><br><%out.println(AP1_DATE);}%><%if(AP1_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(AP1_STATUS.equals("H")){%><span class="normal">Review</span><%}%>
    </span></td>
      </tr>
    </table></td>
    <td width="230"><table width="200" border="1" border-color="#f0f0f0" cellpadding="2" cellspacing="0">
      <tr>
         <td valign="top" bgcolor="#D8D8D8" align="center" class="travelMenuBG"><span id="test" style="padding:4px">Director - B & C</td>
      </tr>
      <tr>
     <td valign="top" align="center" height="60px"><span class="normal"><%if(AP2Name!=null){%><br><%out.println(AP2Name);}%><%if(ap2.equals(timescapeUId)&& (AP2_STATUS.equals("L"))){%><br>In-process<br><%}if(!AP2_STATUS.equals("L")){%><br><br><%out.println(AP2_DATE);}%><%if(AP2_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(AP2_STATUS.equals("H")){%><span class="normal">Review</span><%}%>
    </span></td>
      </tr>
    </table></td>
    <td width="237"><table width="200" border="1" border-color="#f0f0f0" cellpadding="2" cellspacing="0">
      <tr>
    <td valign="top" align="center" bgcolor="#D8D8D8" class="travelMenuBG"><span id="test" style="padding:4px">Executive Director</td>
      </tr>
      <tr>
          <td valign="top"  align="center" height="60px"><span class="normal"><%if(AP3Name!=null){%><br><%out.println(AP3Name);}%>
    </span></td>
      </tr>
    </table></td>
  </tr>
</table>

</td>
</tr>
</table>
</body>
</html>
