

<table  width="795px" height="497px" border="1" class="table1" cellpadding="2" cellspacing="0" align="center">
	
  
	<tr>
		<td  height="26px" colspan="6" align="left" valign="middle" bgcolor="#666666"><span class="white"><font size="2" align="left">PURCHASE APPROVAL REQUEST NO - <%=priceid%></font></span></td>
		<td colspan="2" align="left" valign="middle" bgcolor="#666666"  ><span class="white"><font size="2" align="left">COMPANY : <%=COMPANYNAME%></font></span></td>
	</tr>
	<tr>
		<td height="26px" colspan="2" align="left" valign="middle"  class="greyBG">INITIATOR NAME : </td>
		<td colspan="2" align="left" class="greyBG BreakWord" valign="middle"><%=INITIATORNAME%></td>
		<td colspan="2" align="left" class="greyBG" valign="middle">INITIATED ON :</td>
		<td  colspan="2" align="left" valign="middle" class="greyBG"><%=INITIATEDON%></td>
	</tr>

	<tr>
		<td width="25%"height="26px"  align="left" valign="middle"  class="greyBG">SANCTIONED REF TYPE : </td>
		<td align="left" class="greyBG BreakWord" valign="middle"><%=SANCTIONEDREFTYPE%></td>
		<td  align="left" class="greyBG" valign="middle">REF NUMBER :</td>
		<td colspan="2"align="left" valign="middle" class="greyBG"><%=REFNUMBER%></td>
		<td  width="25%" align="left" class="greyBG" valign="middle">DATE OF APPROVAL :</td>
		<td colspan="2" align="left" valign="middle" class="greyBG"><%=DATEOFAPPROVAL%></td>
	</tr>

	<tr>
		<td  height="26px" colspan="4" align="center" valign="middle" class="greyBG"  >PROJECT DETAILS</td>
		<td colspan="5" align="center" valign="middle" class="greyBG"  >CONTRACT DETAILS</td>
	</tr>
	<tr>
		<td height="26px" colspan="2" align="left" valign="middle"  class="nav">Project name </td>
		<td colspan="2" align="left" class="normal BreakWord" valign="middle"><%=PROJECTNAME%></td>
		<td colspan="2" align="left" class="nav" valign="middle">Contract Validity</td>
		<td  colspan="2" align="left" valign="middle" class="normal"><%=FROMCONTRACTVALIDITY%> to <%=TOCONTRACTVALIDITY%></td>
	</tr>
	<tr>
		<td height="24px" colspan="2" align="left" valign="middle"  class="nav">Description</td>
		<td colspan="2" align="left" class="normal BreakWord" valign="middle"><%=DESCRIPTION%></td>
		<td colspan="2" align="left" class="nav" valign="middle">Contract value (Rs)</td>
		<td colspan="2" align="left" class="normal " valign="middle"><%=CONTRACTVALUE%></td>
	</tr>
	<tr>
		<td height="24px" colspan="2" align="left" valign="middle"  class="nav">User group  </td>
		<td colspan="2" align="left" class="normal" valign="middle"><%=USERGROUP%></td>
		<td colspan="2" align="left" class="nav" valign="middle">Vendor name</td>
		<td colspan="2" align="left" class="normal BreakWord" valign="middle"><%=VENDORNAME%></td>
	</tr>
	<tr>
		<td height="24px" colspan="2" align="left" valign="middle"  class="nav">Total Aop Budget (Rs.) :</td>
		<td colspan="2" align="left" class="normal" valign="middle"><%=TOTALBUDGET%></td>
		<td colspan="2" align="left" class="nav " valign="middle">Payment terms</td>
		<td colspan="2" align="left" class="normal BreakWord" valign="middle"><%=PAYMENTTERMS%></td>
	</tr>
	<tr>
		<td height="24px" colspan="2" align="left" valign="middle"  class="nav">Sanction note status</td>
		<td colspan="2" align="left" class="normal BreakWord" valign="middle"><%=SANCTIONNOTE%></td>
		<td colspan="2" align="left" class="nav" valign="middle">Savings If any</td>
		<td colspan="2" align="left" class="normal " valign="middle"><%=SAVINGS%></td>
	</tr>

	<!--end background-->
	<tr>
		<td  height="18px" colspan="8" align="center" valign="middle" class="greyBG"  >BACKGROUND</td>
	</tr>
	<tr>
		
		<td colspan="8"  class="normal" valign="middle"  ><textarea  cols="25"  rows="7" style ="width:985px;text-align:justify;padding-bottom:8px;" class="fontname normal" readonly ><%=BACKGROUND%></textarea></td> 
	</tr>
	<!--end background-->
	
	<!--tech specification-->
	
	<tr>
	<td  height="18px" colspan="8" align="center" valign="middle" class="greyBG"  >TECHNICAL SPECIFICATIONS</td>
	</tr>
	<tr>
	<td    colspan="8" valign="middle" class="" >
	<table width="992px"  border="1" cellpadding="2" cellspacing="0" bordercolor="#f0f0f0">
	<tr>
	<td width="263px" class="nav"  align="center">Vendor</td>
	<td width="263px" class="nav" align="center">Machine Type</td>
	<td width="263px" class="nav" align="center">No of Pages (colors)</td>
	<td width="263px" class="nav" align="center">No of CTP & Make</td>
	<td width="263px" class="nav" align="center">Speed/ hr</td>
	</tr>
<%
    for(int i=0;i<vStatus1.size();i++)
    {
        String[] data2 = (String [])vStatus1.get(i);	 
%>
	<tr>
	<td align="center" class="normal" valign="middle"><%=data2[2]%></td>
	<td align="center"  class="normal" valign="middle"><%=data2[3]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[4]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[5]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[6]%></td> 
	</tr>
<%
    }
%>
	</table>
	</td>
	</tr>
	<!--end specification-->
   	
	<!-- commmercial-->
	<tr>
	<td  height="18px" colspan="8" align="center" valign="middle" class="greyBG"  >COMMERCIALS</td>
	</tr>
	<tr>
	<td    colspan="8" valign="middle" class="" >
	<table width="992px" border="1" cellpadding="2" cellspacing="0" bordercolor="#f0f0f0">
	<tr>
	<td width="263px"class="nav" align="center">Vendor</td>
	<td  width="263px"class="nav" align="center">Colour Page (paisa)</td>
	<td width="263px"class="nav" align="center">B&W Rate(paisa)</td>
	<td width="263px" class="nav" align="center">Plate cost(Rs.)</td>
	<td width="263px"class="nav" align="center">Bundling</td>
	<td width="263px"class="nav" align="center">Insertion</td>
	<td width="263px" class="nav" align="center">Other misc</td>
	</tr>
<%
    for(int i=0;i<vStatus2.size();i++)
    {
        String[] data2 = (String [])vStatus2.get(i);	 
%>
	<tr>
	<td align="center" class="normal" valign="middle"><%=data2[2]%></td>
	<td align="center" class="normal" valign="middle"><%=data2[3]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[4]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[5]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[6]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[7]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[8]%></td> 
	</tr>
<%
    }
	
%>	<!--end commercial-->
		</table>
	</td>
	</tr>
	<!--estimated spend-->
	<tr>
	<td  height="18px" colspan="8" align="center" valign="middle" class="greyBG"  >ESTIMATED SPEND & OTHER SPECS</td>
	</tr>
	<tr>
	<td    colspan="8" valign="middle" class="" >
	<table width="992px"  border="1" cellpadding="2" cellspacing="0" bordercolor="#f0f0f0">
	<tr>
	<td width="263px" class="nav" align="center">Vendor</td>
	<td width="263px" class="nav" align="center">PO/Daily</td>
	<td width="263px" class="nav" align="center">ALP/Year</td>
	<!-- <td width="263px" class="nav" align="center">No of B&W field</td> -->
	<td width="263px" class="nav" align="center">Total Spend  (Rs.)</td>
	<td width="263px" class="nav" align="center">Pagn. confg.</td>
	<td width="263px" class="nav" align="center">LPRS (eg. 20:21 or 8:21pm)</td>
	<td width="263px" class="nav" align="center">Waste %</td>
	</tr>
<%
    for(int i=0;i<vStatus3.size();i++)
    {
        String[] data2 = (String [])vStatus3.get(i);	 
%>
	<tr>
	<td align="center" class="normal" valign="middle"><%=data2[2]%></td>
	<td align="center" class="normal" valign="middle"><%=data2[5]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[3]%></td> 
	<!-- <td align="center" class="normal" valign="middle"><%=data2[4]%></td> --> 
	<%
	String totalSpend = data2[6];
	if(!(!totalSpend.matches(".*[^a-z].*") || !totalSpend.matches(".*[^A-Z].*"))){
		totalSpend = totalSpend.replaceAll("[^0-9]", "");
		if(totalSpend.length() > 3){
			int[] arr = {3,2,2};
			int j = 3;
			int k = 0;
			while(totalSpend.length() > j){
				int commaPosition = totalSpend.length() - j;
				System.out.println("comma Positon "+ commaPosition);
				totalSpend = totalSpend.substring(0, commaPosition) + "," + totalSpend.substring(commaPosition, totalSpend.length());
				j++;
				k = (k+1)%3;
				j = j + arr[k];
			}
		}
	}
	
	%> 
	<!--<td align="center" class="normal" valign="middle"><%=data2[6]%></td> -->
	<td align="center" class="normal" valign="middle"><%=totalSpend%></td>
	<td align="center" class="normal" valign="middle"><%=data2[7]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[8]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[9]%></td> 
	</tr>
<%
    }
%>
	</table>
	</td>
	</tr>

	
	<!--end estimated spend-->
	<!--innovations-->
	<tr>
	<td  height="18px" colspan="8" align="center" valign="middle" class="greyBG"  >INNOVATIONS & GNP PRINTING</td>
	</tr>
	<tr>
	<td    colspan="8" valign="middle" class="" >
	<table width="992px"  border="1" cellpadding="2" cellspacing="0" bordercolor="#f0f0f0">
	<tr>
	<td width="263px" class="nav" align="center">Vendor</td>
	<td width="263px" class="nav" align="center">PO</td>
	<td width="263px" class="nav" align="center">Total Spend</td>
	<td width="263px" class="nav" align="center">Details</td>
	</tr>
<%
    for(int i=0;i<vStatus4.size();i++)
    {
        String[] data2 = (String [])vStatus4.get(i);	 
%>

	<tr>
	<td align="center" class="normal" valign="middle"><%=data2[2]%></td>
	<td align="center" class="normal" valign="middle"><%=data2[3]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[4]%></td> 
	<td align="center" class="normal" valign="middle"><%=data2[5]%></td> 
	</tr>
<%
    }
%>	</table>
	</td>

	</tr>
	
	<!--end innovations-->

	
	
	<!-- recommendations-->
	<tr>
		<td  height="18px" colspan="8" align="center" valign="middle" class="greyBG"  >RECOMMENDATIONS:</td>
	</tr>
	<tr>
		<td    colspan="8" valign="middle" class="greyBG" >
	<table width="992px"  border="1" cellpadding="2" cellspacing="0" bordercolor="#f0f0f0">
	<tr>
		<td width="263px" align="left" colspan="5"><textarea  cols="25"  rows="7" style ="width:980px;text-align:justify;padding-bottom:8px;" class="fontname normal" readonly><%=RECOMMENDATION%></textarea></td>
	</tr>
	</table>
	</td>
	</tr>
	<!--end recommendations-->
	
	
		<!-- REMARKS-->
	<tr>
		<td  height="18px" colspan="8" align="center" valign="middle" class="greyBG"  >REMARKS:</td>
	</tr>
	<tr>
		<td    colspan="8" valign="middle" class="normal"  >
	<table width="992px"  border="1" cellpadding="2" cellspacing="0" bordercolor="#f0f0f0">
	<tr>
		<td width="263px" align="left" colspan="5"><%=PrintRemarks%></td>
	</tr>
	</table>
	</td>
	</tr>
	<!--end REMARKS-->
	
  

	<!--approvals-->
	<tr>
  <td  height="18px" colspan="8" align="center" valign="middle" class="greyBG"  >APPROVALS</td>
</tr>

  <tr>
    <!-- <td rowspan="13" bgcolor="#e8e8e8" class="nav"><img src="../images/approval.jpg" width="25" height="104" /></td> -->
    <td width="18%" align="center" class="greyBG" valign="middle">B&C</td>
    <td width="18%" align="center" class="greyBG" valign="middle">User</td>
    <td width="18%" align="center" class="greyBG" valign="middle">Finance/Branch Head/ Mas</td>
    <td width="19%" align="center" class="greyBG" valign="middle"><%=label1%><!-- DIRECTOR B&C --></td>
    <td width="15%" align="center" class="greyBG" valign="middle"><%=label2%><!-- EP SUPP. CHAIN --></td>
    <td width="15%" align="center" class="greyBG" valign="middle"><%=label3%><!-- COO --></td>
    <td width="15%" align="center" class="greyBG" valign="middle"><%=label4%><!-- CEO --></td>
    <td width="12%" align="center" class="greyBG" valign="middle">Managing Director</td>
  </tr>
  <tr>
    <td align="left" class="normal">
	<%if(!AP11.equals("0") && AP11.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP11%>,'AP11','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
    <td class="normal" align="left"><%if(!AP12.equals("0") && AP12.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP12%>,'AP12','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
    <td class="normal" align="left"><%if(!AP35.equals("0") && AP35.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP35%>,'AP35','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td> 
    <td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP4.equals("0") && AP4.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP4%>,'AP4','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
	<td valign="top"  height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'" ><span id="test" style="padding:4px"><div id="ap4Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if(!AP4.equals("0") && AP4.equals(timescapeUId)&& (APPROVER4_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%><%}if(APPROVER4!=null){out.println(APPROVER4);}if(!APPROVER4_STATUS.equals("L")){%><br><%out.println(APPROVER4_DATE);}%><%if(APPROVER4_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER4_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER4_STATUS.equals("H")){%><span class="normal">Review</span><%}%>
    </span></td>
	</tr>
	</table>
	</td>
	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP5.equals("0") && AP5.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP5%>,'AP5','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap5Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if (!AP5.equals("0") && AP5.equals(timescapeUId) && (APPROVER5_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%}if(APPROVER5!=null){out.println(APPROVER5);}if(!APPROVER5_STATUS.equals("L")){%><br><%out.println(APPROVER5_DATE);}%><%if(APPROVER5_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER5_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER5_STATUS.equals("H")){%><span class="normal">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>
    <td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP6.equals("0") && AP6.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP6%>,'AP6','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap6Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if(!AP6.equals("0") && AP6.equals(timescapeUId) && (APPROVER6_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%}if(APPROVER6!=null){out.println(APPROVER6);}if(!APPROVER6_STATUS.equals("L")){%><br><%out.println(APPROVER6_DATE);}%><%if(APPROVER6_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER6_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER6_STATUS.equals("H")){%><span class="normal">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>




	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP7.equals("0") && AP7.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP7%>,'AP7','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap7Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if(!AP7.equals("0") && AP7.equals(timescapeUId) && (APPROVER7_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%}if(APPROVER7!=null){out.println(APPROVER7);}if(!APPROVER7_STATUS.equals("L")){%><br><%out.println(APPROVER7_DATE);}%><%if(APPROVER7_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER7_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER7_STATUS.equals("H")){%><span class="normal">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>
	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP8.equals("0") && AP8.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP8%>,'AP8','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap8Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if(!AP8.equals("0") && AP8.equals(timescapeUId) && (APPROVER8_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%}if(APPROVER8!=null){out.println(APPROVER8);}if(!APPROVER8_STATUS.equals("L")){%><br><%out.println(APPROVER8_DATE);}%><%if(APPROVER8_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER8_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER8_STATUS.equals("H")){%><span class="normal">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>




  </tr>
  <tr>


    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap11Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if(STATUS.equals("C")){ } else  if(!AP11.equals("0") && AP11.equals(timescapeUId) && (APPROVER11_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%} if(APPROVER11!=null){out.println(APPROVER11);}if(!APPROVER11_STATUS.equals("L")){%><br><%out.println(APPROVER11_DATE);}%><%if(APPROVER11_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER11_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER11_STATUS.equals("H")){%><span class="normal">Review</span><%}%></td>
    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap12Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if(!AP12.equals("0") && AP12.equals(timescapeUId) && (APPROVER12_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%} if(APPROVER12!=null){out.println(APPROVER12);}if(!APPROVER12_STATUS.equals("L")){%><br><%out.println(APPROVER12_DATE);}%><%if(APPROVER12_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER12_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER12_STATUS.equals("H")){%><span class="normal">Review</span><%}%></span></td>

    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap13Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if(STATUS.equals("C")){ } else if(!AP35.equals("0") && AP35.equals(timescapeUId) && (APPROVER35_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%
}
 if(APPROVER35!=null){out.println(APPROVER35);}if(!APPROVER35_STATUS.equals("L")){%><br><%out.println(APPROVER35_DATE);}%><%if(APPROVER35_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER35_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER35_STATUS.equals("H")){%><span class="normal">Review</span><%}%>
   </span></td>
  </tr>
  <tr>
    <td align="left"><%if(!AP21.equals("0") && AP21.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP21%>,'AP21','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP22.equals("0") && AP22.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP22%>,'AP22','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP36.equals("0") && AP36.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP36%>,'AP36','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
  </tr>
  <tr>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap21Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if(STATUS.equals("C")){ } else if(!AP21.equals("0") && AP21.equals(timescapeUId) && (APPROVER21_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%} if(APPROVER21!=null){out.println(APPROVER21);}if(!APPROVER21_STATUS.equals("L")){%><br><%out.println(APPROVER21_DATE);}%><%if(APPROVER21_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER21_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER21_STATUS.equals("H")){%><span class="normal">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap22Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if(!AP22.equals("0") && AP22.equals(timescapeUId) && (APPROVER22_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%} if(APPROVER22!=null){out.println(APPROVER22);}if(!APPROVER22_STATUS.equals("L")){%><br><%out.println(APPROVER22_DATE);}%><%if(APPROVER22_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER22_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER22_STATUS.equals("H")){%><span class="normal">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap23Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if(STATUS.equals("C")){ } else if(!AP36.equals("0") && AP36.equals(timescapeUId) && (APPROVER36_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%} if(APPROVER36!=null){out.println(APPROVER36);}if(!APPROVER36_STATUS.equals("L")){%><br><%out.println(APPROVER36_DATE);}%><%if(APPROVER36_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER36_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER36_STATUS.equals("H")){%><span class="normal">Review</span><%}%></span></td>
  </tr>
  <tr>
    <td align="left"><%if(!AP31.equals("0") && AP31.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP31%>,'AP31','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP32.equals("0") && AP32.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP32%>,'AP32','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP33.equals("0") && AP33.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP33%>,'AP33','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
  </tr>
  <tr>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap31Remarks"><!-- Remarks Loads Here--></div></span>
	<span class="normal"><%if(STATUS.equals("C")){ } else if(!AP31.equals("0") && AP31.equals(timescapeUId) && (APPROVER31_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%}
	if(APPROVER31!=null){out.println(APPROVER31);} if(!APPROVER31_STATUS.equals("L")){%><br><%out.println(APPROVER31_DATE);}%><%if(APPROVER31_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER31_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER31_STATUS.equals("H")){%><span class="normal">Review</span><%}%></span></td>
    <td align="center" class="ToolText"  
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap32Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><%if(!AP32.equals("0") && AP32.equals(timescapeUId) && (APPROVER32_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%}
if(APPROVER32!=null){out.println(APPROVER32);}if(!APPROVER32_STATUS.equals("L")){%><br><%out.println(APPROVER32_DATE);}%><%if(APPROVER32_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER32_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER32_STATUS.equals("H")){%><span class="normal">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap33Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><% if(!AP13.equals("0") && AP13.equals(timescapeUId) && (APPROVER13_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%} if(APPROVER13!=null){out.println(APPROVER13);}if(!APPROVER13_STATUS.equals("L")){%><br><%out.println(APPROVER13_DATE);}%><%if(APPROVER13_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER13_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER13_STATUS.equals("H")){%><span class="normal">Review</span><%}%></span></td>
  </tr>
<%if(AP23.equals("0")){}else{%>
  <tr>
  <td>&nbsp;<td>
  <td align="left"><%if(!AP34.equals("0") && AP34.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP34%>,'AP34','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>

  </tr>

  <tr>
  
  <td>&nbsp;<td>
  <td align="center" class="ToolText" 
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap34Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><% if(!AP23.equals("0") && AP23.equals(timescapeUId) && (APPROVER23_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%} if(APPROVER23!=null){out.println(APPROVER23);}if(!APPROVER23_STATUS.equals("L")){%><br><%out.println(APPROVER23_DATE);}%><%if(APPROVER23_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER23_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER23_STATUS.equals("H")){%><span class="normal">Review</span> <%}%></span></td>

  </tr>
<%}%>
<%if(AP33.equals("0")){}else{%>
  <tr>
  <td colspan="0">&nbsp;<td>

  <td align="left"><%if(!AP33.equals("0") && AP33.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP33%>,'AP33','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>

  </tr>
  <tr>
  
<td colspan="0">&nbsp;<td>
  <td align="center" class="ToolText" 
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap35Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><% if(!AP33.equals("0") && AP33.equals(timescapeUId) && (APPROVER33_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%} if(APPROVER33!=null){out.println(APPROVER33);}if(!APPROVER33_STATUS.equals("L")){%><br><%out.println(APPROVER33_DATE);}%><%if(APPROVER33_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER33_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER33_STATUS.equals("H")){%><span class="normal">Review</span> <%}%></span></td>

  </tr>
<%}%>
<%if(AP34.equals("0")){}else{%>
<tr>
  <td colspan="0">&nbsp;<td>

  <td align="left"><%if(!AP34.equals("0") && AP34.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP34%>,'AP34','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>

  </tr>
  <tr>
  
  <td colspan="0">&nbsp;<td>
  <td align="center" class="ToolText" 
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap36Remarks"><!-- Remarks Loads Here--></div></span><span class="normal"><% if(!AP34.equals("0") && AP34.equals(timescapeUId) && (APPROVER34_STATUS.equals("L"))){%><%@ include file="../common/insertStatusOsp.jsp"%>
   <%} if(APPROVER34!=null){out.println(APPROVER34);}if(!APPROVER34_STATUS.equals("L")){%><br><%out.println(APPROVER34_DATE);}%><%if(APPROVER34_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER34_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER34_STATUS.equals("H")){%><span class="normal">Review</span> <%}%></span></td>

  </tr>
<%}%> 
</table>
<!--attachment-->
<table  width="795px"  border="1" bordercolor="#f0f0f0" cellpadding="2" cellspacing="0" align="center">
    <tr>
      <td  height="18px" colspan="8" align="center" valign="middle" class="greyBG" >ATTACHMENTS</td>
    </tr>
	<tr>
        <td    colspan="8" valign="middle"  >
            <table width="992px"  border="1" cellpadding="2" cellspacing="0" bordercolor="#f0f0f0">
	<tr>
	<td width="263px" height="18px" class="normal" align="left" valign="middle" id="attachment"></td>
	<td width="263px" class="normal" align="left" valign="middle" id="attachment1"></td>
	</tr>
    </table>    
</td>
</tr>
<!-- <tr>
    <td  height="18px"colspan="3" align="left" valign="middle" class="greyBG" id="attachment"></td>
    <td  align="left" colspan="4"valign="middle" class="greyBG" id="attachment1"></td>
  </tr> -->
<!--end attachments-->
</table>
</center>
</body>
</html>
