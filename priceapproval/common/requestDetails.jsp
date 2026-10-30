<%
	String bgcolor = "#ff1a1a";

	//out.println (rData1[0]);

	/*if(rData1[0].equals("1")){
		bgcolor="#afb03a";
	}else if(rData1[0].equals("2")){
		bgcolor="#ff1a1a";
	}else if(rData1[0].equals("3")){
		bgcolor="#1a1aff";
	}else {
		bgcolor="#b35900";
	}*/
%>
<table  width="795px" height="497px" border="1" border-color="#f0f0f0" cellpadding="2" cellspacing="0">
<%//out.println("STATUSNNN---"+STATUS);

	//if(!STATUS.equals("AM")|| STATUS.equals("UCA")	){
	if(rData1[0].equals("0")){
%>
	<tr>
     <td width="25px" rowspan="7" bgcolor="#F2DDDC" class="nav" ><img src="../images/details_final.jpg" width="30px" height="100px" /></td>
    <td colspan="8" align="center" valign="middle" bgcolor="#666666" height="12px"><span class="white" ><font size="2"> Sanction Number - <%=priceid%> 
	</font></span></td>
	<td colspan="2" align="center" valign="middle" bgcolor="#666666" height="12px"><span class="white" ><font size="2">
	Initiated On : <%=createdOn%></font></span></td>
  </tr>
<%
} else if(!rData1[0].equals("0")){
%> 

	<tr>
     <td width="25px" rowspan="7" bgcolor="#F2DDDC" class="nav" ><img src="../images/details_final.jpg" width="30px" height="100px" /></td>
    <td colspan="8" align="center" valign="middle" bgcolor=<%=bgcolor%> height="12px"><span class="white" ><font size="2"> Sanction Number - <%=priceid%> (AMENDMENT NO <%=rData1[0]%>)<%//=rData1[0]%>
	</font></span></td>
	<td colspan="2" align="center" valign="middle" bgcolor=<%=bgcolor%> height="12px"><span class="white" ><font size="2">
	Initiated On : <%=createdOn%></font></span></td>
  </tr>
<%
}
%>  <!-- <tr>
    <td  height="26px" colspan="0"  width="230px" align="left" valign="middle" class="travelMenuBG" >Initiator Name</td>
    <td colspan="5" align="left"    valign="middle" class="normal" ><%//=creatorName%></td>
    <td  height="26px" colspan="0"  width="210px" align="left" valign="middle" class="travelMenuBG">Initiated On</td>
    <td colspan="5" align="left"    width="35px" valign="middle" class="normal" ><%//=createdOn%></td>
  </tr> -->
  <tr>
    <td  height="26px" colspan="5" align="center" valign="middle" class="travelMenuBG" style="background-color:#F2DDDC;">VENDOR DETAILS</td>
    <td colspan="5" align="center" valign="middle" class="travelMenuBG" style="background-color:#F2DDDC;">ITEM DETAILS</td>
  </tr>
  <tr>
	<td height="26px" colspan="2" align="left" width="190px" valign="middle"  class="travelMenuBG">Vendor Name </td>
	<td colspan="3" align="left" class="normal" width="249px" valign="middle"><%=vendorName==null?"NA":vendorName%></td>
	<td colspan="2" align="left" class="travelMenuBG" valign="middle">Quantity (MT)</td>
	<td width="239px" colspan="3" align="left" valign="middle" class="normal"><%=quantity%></td>
  </tr>
  <tr>
	<td height="24px" colspan="2" align="left" valign="middle"  class="travelMenuBG">Mill </td>
	<td colspan="3" align="left" class="normal" valign="middle"><%=mill==null?"NA":mill%></td>
	<td colspan="2" align="left" class="travelMenuBG" valign="middle">Delivery In</td>
	<td colspan="3" align="left" class="normal" valign="middle"><%=deliveryIn==null?"NA":deliveryIn%></td>
  </tr>
   <tr>
	<td height="24px" colspan="2" align="left" valign="middle"  class="travelMenuBG">Payment Terms </td>
	<td colspan="3" align="left" class="normal" valign="middle"><%=paymentTerms==null?"NA":paymentTerms%></td>
	<td colspan="2" align="left" class="travelMenuBG" valign="middle">Quality</td>
	<td colspan="3" align="left" class="normal" valign="middle"><%=quality==null?"NA":quality%></td>
  </tr>
   <tr>
	<td height="24px" colspan="2" align="left" valign="middle"  class="travelMenuBG">Sourcing </td>
	<td colspan="3" align="left" class="normal" valign="middle"><%=sourcing==null?"NA":sourcing%></td>
	<td colspan="2" align="left" class="travelMenuBG" valign="middle">GSM</td>
	<td colspan="3" align="left" class="normal" valign="middle"><%=gsm==null?"NA":gsm%></td>
  </tr>
   
  <!--second table-->
	<tr>
    </tr>
	<tr>
     <td  rowspan="8" style="background-color:#ECF0DF;" class="nav"><img src="../images/bench_final.jpg" width="25"   /></td>
  	 <td  height="26px" colspan="5" align="center" valign="middle" class="travelMenuBG" style="background-color:#ECF0DF;">PURCHASE BENCHMARK</td>
    <td colspan="5" align="center" valign="middle" class="travelMenuBG" style="background-color:#ECF0DF;">PRICE BUILDUP</td>
  </tr>
  <tr>
  	<% 
	if (vendorName.equals("khanna") || vendorName.equals("Khanna") || vendorName.equals("KHANNA")){
		%>
	<td height="26px" colspan="2" align="left" valign="middle"  class="travelMenuBG">This Lot (CFR,India) Delivered</td>
	<%}else if (!vendorName.equals("khanna")){
		%>
	<td height="26px" colspan="2" align="left" valign="middle"  class="travelMenuBG">This Lot (CFR,India)</td>
	<%}
	%>
	<td height="26px" colspan="3" align="right" valign="middle"  class="normal"><%=currency%><%=thisLotcfr%></td>	
	<td colspan="2" align="center" class="travelMenuBG" valign="middle" ></td>
	<td colspan="1" align="center" valign="middle" class="travelMenuBG" width="110px">Unit Rate</td>
		<td colspan="1" align="center" valign="middle" class="travelMenuBG" width="110px">&#8377; Per Ton</td>
		<td colspan="1" align="center" valign="middle" class="travelMenuBG" width="110px">Spend (&#8377; Cr)</td>
  </tr>
   <tr>
	<td height="26px" colspan="2" align="left" valign="middle"  class="travelMenuBG">Invoice Price</td>
	<td height="26px" colspan="3" align="right" valign="middle"  class="normal"><%=currency%><%=invoicePrice%>  </td>
	<td colspan="2" align="left" class="travelMenuBG" valign="middle">Exchange Rate (&#8377;/$)</td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=totalPrice_unitRate%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=totalPrice_rsperTon%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=totalPrice_spend%></td>
  </tr>
   <tr>
	<td height="26px" colspan="2" align="left" valign="middle"  class="travelMenuBG">RISI (CFR,India)</td>
	<td height="26px" colspan="3" align="right" valign="middle"  class="normal"><%=currency%><%=risi%></td>
	<!-- <td colspan="2" align="left" class="travelMenuBG" valign="middle">Custom Duty/Taxes</td> -->
	<td colspan="2" align="left" class="travelMenuBG" valign="middle">Custom Duty/GST(%)</td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=customsDuty_unitRate%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=customsDuty_rsperTon%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=customsDuty_spend%></td>
  </tr>
   <tr>
	<td height="26px" colspan="2" align="left" valign="middle"  class="travelMenuBG">AOP Receipt Price </td>
	<td height="26px" colspan="3" align="right" valign="middle"  class="normal"><%=currency%><%=aopReceiptPrice%></td>
	<td colspan="2" align="left" class="travelMenuBG" valign="middle">Logistics Cost</td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=freight_unitRate%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=freight_rsperTon%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=freight_spend%></td>
  </tr>
    <tr>
	<td height="26px" colspan="2" align="left" valign="middle"  class="travelMenuBG">AOP Receipt ForEx (&#8377;/$) </td>
	<td height="26px" colspan="3" align="right" valign="middle"  class="normal"><%=aopReceiptForEx%></td>
	<td colspan="2" align="left" class="travelMenuBG" valign="middle">Insurance</td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=insurance_unitRate%>%</td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=insurance_rsperTon%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=insurance_spend%></td>
  </tr>
  <tr>
	<td height="26px" colspan="2" align="left" valign="middle"  class="travelMenuBG">AOP Deal value (&#8377; Cr)</td>
	<td height="26px" colspan="3" align="right" valign="middle"  class="normal"><%=aopDealValue%></td>
	<td colspan="2" align="left" class="travelMenuBG" valign="middle">Actual Deal Value</td>
	<td colspan="1" align="right" valign="middle" class="normal"></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=totalActualCost_rsperTon%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=totalActualCost_spend%></td>
  </tr>
  <tr>
	<td height="26px" colspan="2" align="left" valign="middle"  class="travelMenuBG"></td>
	<td height="26px" colspan="3" align="right" valign="middle"  class="normal"></td>
	<td colspan="2" align="left" class="travelMenuBG" valign="middle" style="background-color:#EBEBEB;" >Budget vs. Actual (&#8377; Cr)</td>
	<td colspan="1" align="right" valign="middle" class="normal" style="background-color:#EBEBEB;"></td>
	<td colspan="1" align="right" valign="middle" class="normal" style="background-color:#EBEBEB;"></td>
	<td colspan="1" align="right" valign="middle" class="normal" style="background-color:#EBEBEB;"><b><%=budgetvsActual_unitRate%></b></td>
  </tr>
  <!--end sec-->
  
  <!-- third-->
  <tr>
    </tr>
	<tr>
     <td width="25px" rowspan="6" style="background-color:#FDE9D9;" class="nav"><img src="../images/internal_final.jpg" width="30" height="150" /></td>
  	 <td  height="26px" colspan="5" align="center" valign="middle" class="travelMenuBG" style="background-color:#FDE9D9;">BUDGET BUY (TONS)</td>
    <td colspan="5" align="center" valign="middle" class="travelMenuBG" style="background-color:#FDE9D9;">INVENTORY DETAILS</td>
  </tr>
   <tr>
	<td height="26px" colspan="2" align="left" valign="middle"  class="travelMenuBG"></td>
	<td height="26px" colspan="3" align="right" valign="middle"  class="travelMenuBG"><%//=creatorName%></td>
	<td colspan="3" align="left" class="travelMenuBG" valign="middle"></td>
	<td colspan="1" align="center" valign="middle" class="travelMenuBG">Quantity</td>
	<td colspan="1" align="center" valign="middle" class="travelMenuBG">Days</td>

	

  </tr>
  <tr>
	<td height="28px" colspan="2" align="left" valign="middle"  class="travelMenuBG">Annual Budget</td>
	<td height="28px" colspan="3" align="right" valign="middle"  class="normal"><%=annualBudget%></td>
	<td colspan="3" align="left" class="travelMenuBG" valign="middle">Opening Inventory (<%=pparts[1]+" "+pparts[2]%>)</td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=quarterOpeningQuantity%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=quarterOpeningDays%></td>

  </tr>
   <tr>
	<td height="28px" colspan="2" align="left" valign="middle"  class="travelMenuBG"> Contracted Tons Till Last Qtr</td>
	<td height="28px" colspan="3" align="right" valign="middle"  class="normal"><%=contractedTonsytd%></td>
	<td colspan="3" align="left" class="travelMenuBG" valign="middle">Estimated Receipts for balance of the Qtr</td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=expectedReceiptsQuantity%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=expectedReceiptsDays%></td>

  </tr>
  <tr>
	<td height="28px" colspan="2" align="left" valign="middle"  class="travelMenuBG"> Current Qtr (incl. this deal)</td>
	<td height="28px" colspan="3" align="right" valign="middle"  class="normal"><%=currentQuarter%></td>
	<td colspan="3" align="left" class="travelMenuBG" valign="middle">Estimated Cons for balance of the Qtr</td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=estimatedCons1%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=estimatedCons2%></td>

  </tr>
   <tr>
	<td height="28px" colspan="2" align="left" valign="middle"  class="travelMenuBG"> Balance to be bought</td>
	<td height="28px" colspan="3" align="right" valign="middle"  class="normal"><%=balanceToBought%></td>
	<td colspan="3" align="left" class="travelMenuBG" valign="middle">Qtr-End Physical Inventory/Stock</td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=quarterEnd1%></td>
	<td colspan="1" align="right" valign="middle" class="normal"><%=quarterEnd2%></td>

  </tr>
  <!--end third-->
  <!--other remarks-->
  <!-- <tr>
    <td height="30px" bgcolor="#FFFFF" class="nav" colspan="11" align="middle" ><b><font size="2">Click </font></b> <a  href="#" onclick="javascript:window.open('showDetailsNpAnnexure2.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=priceid%>&viewSAB=YES','','','fullscreen=yes')"><b><font size="2">here</b></a><b> to view Annexure 1 : Comparative Quotes </font></b></td> 
   
  </tr> -->
  <tr>
    <td height="70px"  class="nav"><img src="../images/OTHER.jpg" width="30" height="100" /></td>
   <td colspan="10"  valign="middle"  ><textarea  cols="25"  rows="7" style ="width:950px;text-align:justify;padding-bottom:8px;" class=" bgrdatacolor fontname normal" readonly><%=otherRemaks==null || otherRemaks.equals("null") ?"NA":otherRemaks%></textarea></td> 
   
  </tr>
    <!--end other remarks-->
	<!--market events-->
	<tr>
    <td height="70px"  class="nav"><img src="../images/market_Final_copy.jpg" width="30" height="120" /></td>
   <td colspan="10"  valign="middle"  ><textarea  cols="25"  rows="7" style ="width:950px;text-align:justify;padding-bottom:8px;" class=" bgrdatacolor fontname normal" readonly><%=amenRemarks==null || amenRemarks.equals("null")?"NA":amenRemarks%></textarea></td> 
   
  </tr>
	<tr>
    <td height="70px"  class="nav"><img src="../images/market_Final.jpg" width="30" height="120" /></td>
   <td colspan="10"  valign="middle"  ><textarea  cols="25"  rows="7" style ="width:950px;text-align:justify;padding-bottom:8px;" class=" bgrdatacolor fontname normal" readonly><%=marketEvent==null || marketEvent.equals("null") ?"NA":marketEvent%></textarea></td> 
   
  </tr>



	  <!--end events-->
	<!--approvals-->


<!-- <tr>
  <td  height="18px" colspan="18" align="center" valign="middle" class="travelMenuBG" style="background-color:#F2DDDC;">COMPETITION DATA</td>
</tr>
   <table width="992px"  border="1" cellpadding="2" cellspacing="0">
   <tr>
    <td width="110px" align="center" class="travelMenuBG">SUB CATEGORY</td>
	<td width="110px" align="center" class="travelMenuBG">METRICS</td>
    <td width="110px" align="center" class="travelMenuBG">COMPETITION VALUE</td>
    <td width="110px" align="center" class="travelMenuBG">UOM</td>
    <td width="110px" align="center" class="travelMenuBG">COMPETITION</td>
    <td width="110px" align="center" class="travelMenuBG">SOURCE</td>
    <td width="110px" align="center" class="travelMenuBG">PLANT</td>
    <td width="110px" align="center" class="travelMenuBG">MONTHYEAR</td>
    <td width="110px" align="center" class="travelMenuBG">BCCL VALUE</td>
  </tr>-->
  <% 
/*competition data

String compSubcattegory						=   "";
String compMetrics							=   "";
String compValue							=   "";
String compUom								=   "";
String competition							=   "";
String compSource							=   "";
String compPlant							=   "";
String compMonthyear						=   "";
String compBcclvalue						=   "";
ArrayList compDataValue						=	new ArrayList();
String compeDataArry[]						=	null;
compDataValue 								=	priceApprovalWebController.viewCompDataValue(priceid);


						for(int kk=0;kk<compDataValue.size();kk++)
						{
							String comptempArr[] = (String[])compDataValue.get(kk);

								compSubcattegory	= comptempArr[0];
								compMetrics			= comptempArr[1];
								compValue			= comptempArr[2];
								compUom				= comptempArr[3];
								competition			= comptempArr[4];
								compSource			= comptempArr[5];
								compPlant			= comptempArr[6];
								compMonthyear		= comptempArr[7];
								compBcclvalue		= comptempArr[8];
%>
	<tr>
    <td width="110px" align="center"><span class="normal"><%=compSubcattegory%></span></td>
	<td width="110px" align="center"><span class="normal"><%=compMetrics%></span></td>
    <td width="110px" align="center"><span class="normal"><%=compValue%></span></td>
    <td width="110px" align="center"><span class="normal"><%=compUom%></span></td>
    <td width="110px" align="center"><span class="normal"><%=competition%></span></td>
    <td width="110px" align="center"><span class="normal"><%=compSource%></span></td>
    <td width="110px" align="center"><span class="normal"><%=compPlant%></span></td>
    <td width="110px" align="center"><span class="normal"><%=compMonthyear%></span></td>
    <td width="110px" align="center"><span class="normal"><%=compBcclvalue%></span></td>
  </tr>
<%						}*/

%>



	<tr>
  <td  height="18px" colspan="12" align="center" valign="middle" class="travelMenuBG" style="background-color:#F2DDDC;">APPROVALS</td>
</tr>
<tr>
  <td    colspan="12" valign="middle" class="travelMenuBG" >
   
   <table width="992px"  border="1" cellpadding="2" cellspacing="0">

<%  
	SimpleDateFormat format1 = new SimpleDateFormat("dd-MMM-yyyy");

	Date createdOnDate1 = format1.parse(createdOn);
	//String date2Temp = format.format(new Date());
	Date changedDate1 = format1.parse("11-FEB-2022");
	Date changedDateNew = format1.parse("01-JUN-2023");
	Date changedDateNew1 = format1.parse("19-JUN-2023");

	//to show designation CEC or ED & CEC
	Date changedDate2 = format1.parse("12-JAN-2023");
	String showDesig = "CEC";
	
	if (!STATUS.equals("UCC") && !STATUS.equals("C")){ 
	
		if (createdOnDate1.compareTo(changedDate2) < 0 && STATUS.equals("CL") ) {
			showDesig = "CEC";
		}else if (createdOnDate1.compareTo(changedDateNew1) < 0  ) {
			showDesig = "CEC & ED";
		}else{
			showDesig = "CEO (Publishing) & ED";
		}

%>  
  <tr>
    <td width="168px" align="center">Category Head - Newsprint</td>
	<td width="166px" align="center">Director B & C</td>
<%
	if (createdOnDate1.compareTo(changedDateNew1) < 0){%>

    <td width="166px" align="center">Executive Director</td>
<%}else {%>
	<td width="166px" align="center">COO (Publishing) & ED</td>
	<%}%>
<%	
	if (createdOnDate1.compareTo(changedDate1) < 0) {
	
	if (!ap4.equals("0")){
%>
    <td width="166px" align="center">COO</td>
	<%	}%>
	<%
		if (ap5.equals("48795")){
	%>
	<td width="166px" align="center">CEO</td>
	<%}else {%>
	<td width="166px" align="center"><%=showDesig%></td>
	<%}
		if (createdOnDate1.compareTo(changedDateNew) < 0){
	%>
		<td width="166px" align="center">MD</td> 
   <%}%>
	
	
	
	
	<%	} else {%>

	<%
		if (ap5.equals("48795")){
	%>
	<td width="166px" align="center">CEO</td>
	<%}else {%>
	<td width="166px" align="center"><%=showDesig%></td>
	<%}
		if (createdOnDate1.compareTo(changedDateNew) < 0){
	%>
	<td width="166px" align="center">MD</td>
	<%}
	if (createdOnDate1.compareTo(changedDateNew) < 0){
	%>
    <td width="166px" align="center">VC & MD</td>
     
    <%	}
	} 
	%>
  </tr>

<%
   }else if (STATUS.equals("UCC") || STATUS.equals("C")){ 
%>
	<td width="168px" align="center">Category Head - Newsprint</td>
	<td width="166px" align="center">Director B & C</td>
    <td width="166px" align="center">COO (Publishing) & ED</td>
<%
   } 
%>

  <%	if (!STATUS.equals("UCC") && !STATUS.equals("C")){
%>
  <tr height = "25px">
    <td align="center" valign="middle" rowspan="5"><span class="normal"><%if(ap1.equals(timescapeUId)&& (AP1_STATUS.equals("L"))){%><%@ include file="../common/insertStatusnp.jsp"%><%}if(AP1Name!=null){out.println(AP1Name);}if(!AP1_STATUS.equals("L")){%><br><%out.println(AP1_DATE);}%><%if(AP1_STATUS.equals("A") || AP1_STATUS.equals("M")){%><img src="../images/approved.png"><%}else if(AP1_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(AP1_STATUS.equals("H")){%><span class="small">Review</span><%}%>
    </span></td>
	<td align="center" valign="middle" rowspan="5"><span class="normal"><%if(ap2.equals(timescapeUId)&& (AP2_STATUS.equals("L"))){%><%@ include file="../common/insertStatusnp.jsp"%><%}if(AP2Name!=null){out.println(AP2Name);}if(!AP2_STATUS.equals("L")){%><br><%out.println(AP2_DATE);}%><%if(AP2_STATUS.equals("A") || AP2_STATUS.equals("M")){%><img src="../images/approved.png"><%}else if(AP2_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(AP2_STATUS.equals("H")){%><span class="small">Review</span><%}%>
    </span></td>
    <td align="center" valign="middle" rowspan="5" ><span class="normal" ><%if(ap3.equals(timescapeUId)&& (AP3_STATUS.equals("L"))){%><%@ include file="../common/insertStatusnp.jsp"%><%}if(AP3Name!=null){out.println(AP3Name);}if(!AP3_STATUS.equals("L")){%><br><%out.println(AP3_DATE);}%><%if(AP3_STATUS.equals("A") || AP3_STATUS.equals("M")){%><img src="../images/approved.png"><%}else if(AP3_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(AP3_STATUS.equals("H")){%><span class="small">Review</span><%}%>
    </span></td> 
	<%	if (!ap4.equals("0")){
	%>
    <td align="center" valign="middle" rowspan="5"><span class="normal"><%if(ap4.equals(timescapeUId)&& (AP4_STATUS.equals("L"))){%><%@ include file="../common/insertStatusnp.jsp"%><%}if(AP4Name!=null){out.println(AP4Name);}if(!AP4_STATUS.equals("L")){%><br><%out.println(AP4_DATE);}%><%if(AP4_STATUS.equals("A") || AP4_STATUS.equals("M")){%><img src="../images/approved.png"><%}else if(AP4_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(AP4_STATUS.equals("H")){%><span class="small">Review</span><%}%>
    </span></td>
	<%}
	if (createdOnDate1.compareTo(changedDateNew) < 0){
	%>
     <td align="center" valign="middle" rowspan="5"><span class="normal"><%if(ap5.equals(timescapeUId)&& (AP5_STATUS.equals("L"))){%><%@ include file="../common/insertStatusnp.jsp"%><%}if(AP5Name!=null){out.println(AP5Name);}if(!AP5_STATUS.equals("L")){%><br><%out.println(AP5_DATE);}%><%if(AP5_STATUS.equals("A") || AP5_STATUS.equals("M")){%><img src="../images/approved.png"><%}else if(AP5_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(AP5_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
	<%//}%>
	
    <td align="center" valign="middle" rowspan="5"><span class="normal"><%if(ap6.equals(timescapeUId)&& (AP6_STATUS.equals("L"))){%><%@ include file="../common/insertStatusnp.jsp"%><%}if(AP6Name!=null){out.println(AP6Name);}if(!AP6_STATUS.equals("L")){%><br><%out.println(AP6_DATE);}%><%if(AP6_STATUS.equals("A") || AP6_STATUS.equals("M")){%><img src="../images/approved.png"><%}else if(AP6_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(AP6_STATUS.equals("H")){%><span class="small">Review</span><%}%>
    </span></td>
	<%}%>
  </tr>
  <%	} else if (STATUS.equals("UCC") || STATUS.equals("C")){
%>
  <tr>
    <td align="center" valign="middle" rowspan="5"><span class="normal"><%if(ap1.equals(timescapeUId)&& (AP1_STATUS.equals("L") || AP1_STATUS.equals("A") || AP1_STATUS.equals("H"))){%><%@ include file="../common/insertStatusnp.jsp"%><%}if(AP1Name!=null){out.println(AP1Name);}if(!AP1_STATUS.equals("L")){%><br><%out.println(AP1_DATE);}%><%if(AP1_STATUS.equals("A") || AP1_STATUS.equals("M")){%><img src="../images/approved.png"><%}else if(AP1_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(AP1_STATUS.equals("H")){%><span class="small">Review</span><%}%>
    </span></td>
	<td align="center" valign="middle" rowspan="5"><span class="normal"><%if(ap2.equals(timescapeUId)&& (AP2_STATUS.equals("L") || AP2_STATUS.equals("A") || AP2_STATUS.equals("H"))){%><%@ include file="../common/insertStatusnp.jsp"%><%}if(AP2Name!=null){out.println(AP2Name);}if(!AP2_STATUS.equals("L")){%><br><%out.println(AP2_DATE);}%><%if(AP2_STATUS.equals("A") || AP2_STATUS.equals("M")){%><img src="../images/approved.png"><%}else if(AP2_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(AP2_STATUS.equals("H")){%><span class="small">Review</span><%}%>
    </span></td>
    <td align="center" valign="middle" rowspan="5" ><span class="normal" ><%if(ap3.equals(timescapeUId)&& (AP3_STATUS.equals("L") || AP3_STATUS.equals("A") || AP3_STATUS.equals("H"))){%><%@ include file="../common/insertStatusnp.jsp"%><%}if(AP3Name!=null){out.println(AP3Name);}if(!AP3_STATUS.equals("L")){%><br><%out.println(AP3_DATE);}%><%if(AP3_STATUS.equals("A") || AP3_STATUS.equals("M")){%><img src="../images/approved.png"><%}else if(AP3_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(AP3_STATUS.equals("H")){%><span class="small">Review</span><%}%>
    </span></td> 
	
  <%	}
  %> 
</table>
</table>

<div class="pagebreak"> </div>
<table width="1000px"  border="1" >
  <tr cellpadding="2" cellspacing="0">
    <td height="70px" class="nav" width="30px"><img src="../images/remarks_final.jpg" width="30px" height="100px" /></td>
   <td colspan="10"  valign="middle"  class="small BreakWord bgrdatacolor"><%=PrintRemarks%></td> 
   
  </tr>
  
    <!--end remarks-->
<!--attachment-->
<tr>
  <td  height="18px" colspan="12" align="center" valign="middle" class="travelMenuBG" style="background-color:#ECF0DF;">ATTACHMENTS</td>
</tr>
<!-- <tr>
    <td  height="18px" colspan="6" align="center" valign="middle" class="travelMenuBG">Attachment</td>
    <td colspan="6" align="center" valign="middle" class="travelMenuBG" width="397px">Additional Attachments</td>
  </tr> -->
<tr>
    <td  height="18px" colspan="6" align="left" valign="middle" class="travelMenuBG" id="attachment"></td>
    <td colspan="6" align="left" valign="middle" class="travelMenuBG" width="397px"id="attachment1"></td>
  </tr>
<!--end attachments-->
</table>
</center>
</body>
</html>
