<table  width="760px"  border="1" border-color="#f0f0f0" cellpadding="2" cellspacing="0" align="center">
	
  
		
	<!--tech specification-->
	
	<tr>
	<td  height="18px" colspan="12" align="center" valign="top" class="travelMenuBG" style="background-color:#80807E;color:#FFF;"><font size="2"> DETAILS - <%=priceid%></font></td>
	</tr>
	<tr>
	<td  height= "30px" colspan="12" valign="top" class="travelMenuBG" >
	<table  width="992px" border-color="#f0f0f0" border="1" cellpadding="2" cellspacing="0">
	<tr>
	<td width="140px" class="normal" align="center">Category:</td>
	<td width="200px" class="normal" align="center"><%=CATEGORY%></td>
	<td width="120px" class="normal" align="center">PAR Value:</td>
	<td width="200px" class="normal" align="left"><%=PARVALUE%></td>
	<td width="120px" class="normal" align="center">Summary Sheet:</td>
	<td width="200px" class="normal" align="center"><%=SUMMARYSHEETCHK%></td>
	
	</tr>
	<tr>
	<td  height="18px" colspan="12" align="center" valign="top" class="travelMenuBG" style="background-color:#80807E;color:#FFF;"><font size="2"> ATTACHMENTS</font></td>
	</tr>

	<tr>
		<td width="55px" class="normal" align="center">Sr. No.</td>
		<td width="320px" class="normal" align="center">File Name</td>
		<td width="300px" class="normal" align="center">File Description</td>
		<td width="300px" colspan="3" class="normal" align="center">Type Of Document</td>
	</tr>

	<%
    for(int i=0;i<vStatus4.size();i++)
    {
        String[] data2 = (String [])vStatus4.get(i);	
		
		String	ATTACHMENT	= data2[1];

		String st1 = "";
		String st2 = "";
		String st3 = "";

				if(!(ATTACHMENT.equals("NA.NA_NA")))
				{
				 st1 = ATTACHMENT.substring(0, ATTACHMENT.lastIndexOf("."));
				 st2 = ATTACHMENT.substring(ATTACHMENT.lastIndexOf(".")+1,ATTACHMENT.length());
                 st3 = st1.substring(0, ATTACHMENT.lastIndexOf("_"));
                 display = st3 + "." + st2;

				//out.println(data2[2]);

				}
%>
	
	<tr>
		<td align="center" class="normal" valign="middle"><%=i+1%></td>
		<td align="center" class="normal" valign="middle" > <%if(!(ATTACHMENT.equals("NA.NA_NA")))	{%><a href="#"  onclick="javascript:showSelectedImage('<%=DOWNPATH+userEmailid+"/"+ATTACHMENT%>');" class="normal"><%=display%></a><%}%> 
		  <div id='divToShow' style='display:show;'>

		 <!-- <iframe src="<%//=DOWNPATH+userEmailid+"/"+ATTACHMENT%>" width="900" height="800px" style="border: none;"></iframe></div> -->

		</td> 
		<td align="center" class="normal" valign="middle" ><%=data2[2]%></td> 
		<td align="center" colspan="3"  class="normal" valign="middle" ><%=data2[3]%></td> 
	</tr>
<%
    }
%>	

	<tr>
	<td  height= "30px" colspan="12" valign="top" class="travelMenuBG" >
	<table  width="992px" border-color="#f0f0f0" border="1" cellpadding="2" cellspacing="0">

	<%
    for(int i=0;i<vStatus4.size();i++)
    {
        String[] data2 = (String [])vStatus4.get(i);	
		
		String	ATTACHMENT	= data2[1];

		String st1 = "";
		String st2 = "";
		String st3 = "";

				if(!(ATTACHMENT.equals("NA.NA_NA")))
				{
				 st1 = ATTACHMENT.substring(0, ATTACHMENT.lastIndexOf("."));
				 st2 = ATTACHMENT.substring(ATTACHMENT.lastIndexOf(".")+1,ATTACHMENT.length());
                 st3 = st1.substring(0, ATTACHMENT.lastIndexOf("_"));
                 display = st3 + "." + st2;

				//out.println(data2[2]);

				}
if(i == 1 && data2[3].equals("PAR Main Template") && st2.equals("jpg")){


%>
	  <tr>
	  <td align="center" class="normal" valign="middle" colspan="5">
	  
	  <div id='divToShow' style='display:show;'>
	  <h5  align="center"><%//=display%></h5>
		 <!-- <object src="PAR Consumables - Use Cases.xlsx"><embed src="PAR Consumables - Use Cases.xlsx"></embed></object>
 	
 <object width="900" height="800px" style="overflow:hidden;" data="<%//=DOWNPATH+userEmailid+"/"+ATTACHMENT%>" ></object>
 -->
		 <iframe src="" width="100%" height="600px" style="border: none;" id="test"></iframe>
		 
	
		 </div>
 </td>
	</tr>

<%}}%>

	

	<!--end specification-->
   	
	
	
	
	
	<!--approvals-->
	<tr>
  <td  height="18px" colspan="12" align="center" valign="middle" class="travelMenuBG" style="background-color:#80807E;color:#FFF;"><font size="2"> APPROVALS</font></td>
</tr>

<tr>
  <td    colspan="12" valign="top" class="travelMenuBG" >
   
   <table width="992px"  border-color="#f0f0f0" border="1" cellpadding="2" cellspacing="0">
  <tr>
    <td width="263px" class="normal" align="center"><strong>B&C</strong></td>
    <td width="263px" class="normal" align="center"><strong>Category Head</strong> </td>
    <td width="263px" class="normal" align="center"><strong>Supported By</strong></td>
    <td width="263px" class="normal" align="center"><strong>Director B&C </strong></td>
    <td width="263px" class="normal" align="center"><strong>Executive Director</strong></td>
    <td width="263px" class="normal" align="center"><strong>COO</strong></td>
    <td width="263px" class="normal" align="center"><strong>CEO/CEC</strong></td>
    <td width="263px" class="normal" align="center"><strong>Managing Director</strong></td>
  </tr>
  <tr>
    <td align="left" class="normal">
	<%if(!AP11.equals("0") && AP11.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP11%>,'AP11','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td>
    <td class="normal" align="left"><%if(!AP12.equals("0") && AP12.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP12%>,'AP12','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td>
    <td class="normal" align="left"><%if(!AP35.equals("0") && AP35.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP35%>,'AP35','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td> 
    <td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP4.equals("0") && AP4.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP4%>,'AP4','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td></tr>
	<tr>
	<td valign="top"  height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'" ><span id="test" style="padding:4px"><div id="ap4Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP4.equals("0") && AP4.equals(timescapeUId)&& (APPROVER4_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%><%}if(APPROVER4!=null){out.println(APPROVER4);}if(!APPROVER4_STATUS.equals("L")){%><br><%out.println(APPROVER4_DATE);}%><%if(APPROVER4_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER4_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER4_STATUS.equals("H")){%><span class="small">Review</span><%}%>
    </span></td>
	</tr>
	</table>
	</td>
	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP5.equals("0") && AP5.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP5%>,'AP5','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap5Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if (!AP5.equals("0") && AP5.equals(timescapeUId) && (APPROVER5_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}if(APPROVER5!=null){out.println(APPROVER5);}if(!APPROVER5_STATUS.equals("L")){%><br><%out.println(APPROVER5_DATE);}%><%if(APPROVER5_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER5_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER5_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>
    <td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP6.equals("0") && AP6.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP6%>,'AP6','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap6Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP6.equals("0") && AP6.equals(timescapeUId) && (APPROVER6_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}if(APPROVER6!=null){out.println(APPROVER6);}if(!APPROVER6_STATUS.equals("L")){%><br><%out.println(APPROVER6_DATE);}%><%if(APPROVER6_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER6_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER6_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>




	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP7.equals("0") && AP7.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP7%>,'AP7','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap7Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP7.equals("0") && AP7.equals(timescapeUId) && (APPROVER7_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}if(APPROVER7!=null){out.println(APPROVER7);}if(!APPROVER7_STATUS.equals("L")){%><br><%out.println(APPROVER7_DATE);}%><%if(APPROVER7_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER7_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER7_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>
	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP8.equals("0") && AP8.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP8%>,'AP8','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap8Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP8.equals("0") && AP8.equals(timescapeUId) && (APPROVER8_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}if(APPROVER8!=null){out.println(APPROVER8);}if(!APPROVER8_STATUS.equals("L")){%><br><%out.println(APPROVER8_DATE);}%><%if(APPROVER8_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER8_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER8_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>




  </tr>
  <tr>
    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap11Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else  if(!AP11.equals("0") && AP11.equals(timescapeUId) && (APPROVER11_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER11!=null){out.println(APPROVER11);}if(!APPROVER11_STATUS.equals("L")){%><br><%out.println(APPROVER11_DATE);}%><%if(APPROVER11_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER11_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER11_STATUS.equals("H")){%><span class="small">Review</span><%}%></td>
    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap12Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP12.equals("0") && AP12.equals(timescapeUId) && (APPROVER12_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER12!=null){out.println(APPROVER12);}if(!APPROVER12_STATUS.equals("L")){%><br><%out.println(APPROVER12_DATE);}%><%if(APPROVER12_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER12_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER12_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>

    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap13Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else if(!AP35.equals("0") && AP35.equals(timescapeUId) && (APPROVER35_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}
 if(APPROVER35!=null){out.println(APPROVER35);}if(!APPROVER35_STATUS.equals("L")){%><br><%out.println(APPROVER35_DATE);}%><%if(APPROVER35_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER35_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER35_STATUS.equals("H")){%><span class="small">Review</span><%}%>
   </span></td>
  </tr>
  <tr>
    <td align="left"><%if(!AP21.equals("0") && AP21.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP21%>,'AP21','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP22.equals("0") && AP22.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP22%>,'AP22','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP36.equals("0") && AP36.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP36%>,'AP36','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td>
  </tr>
  <tr>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap21Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else if(!AP21.equals("0") && AP21.equals(timescapeUId) && (APPROVER21_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER21!=null){out.println(APPROVER21);}if(!APPROVER21_STATUS.equals("L")){%><br><%out.println(APPROVER21_DATE);}%><%if(APPROVER21_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER21_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER21_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap22Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP22.equals("0") && AP22.equals(timescapeUId) && (APPROVER22_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER22!=null){out.println(APPROVER22);}if(!APPROVER22_STATUS.equals("L")){%><br><%out.println(APPROVER22_DATE);}%><%if(APPROVER22_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER22_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER22_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap23Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else if(!AP36.equals("0") && AP36.equals(timescapeUId) && (APPROVER36_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER36!=null){out.println(APPROVER36);}if(!APPROVER36_STATUS.equals("L")){%><br><%out.println(APPROVER36_DATE);}%><%if(APPROVER36_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER36_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER36_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
  </tr>
  <tr>
    <td align="left"><%if(!AP31.equals("0") && AP31.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP31%>,'AP31','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP32.equals("0") && AP32.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP32%>,'AP32','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP33.equals("0") && AP33.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP33%>,'AP33','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td>
  </tr>
  <tr>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap31Remarks"><!-- Remarks Loads Here--></div></span>
	<span class="small"><%if(STATUS.equals("C")){ } else if(!AP31.equals("0") && AP31.equals(timescapeUId) && (APPROVER31_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}
	if(APPROVER31!=null){out.println(APPROVER31);} if(!APPROVER31_STATUS.equals("L")){%><br><%out.println(APPROVER31_DATE);}%><%if(APPROVER31_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER31_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER31_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText"  
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap32Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP32.equals("0") && AP32.equals(timescapeUId) && (APPROVER32_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}
if(APPROVER32!=null){out.println(APPROVER32);}if(!APPROVER32_STATUS.equals("L")){%><br><%out.println(APPROVER32_DATE);}%><%if(APPROVER32_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER32_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER32_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap33Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP13.equals("0") && AP13.equals(timescapeUId) && (APPROVER13_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER13!=null){out.println(APPROVER13);}if(!APPROVER13_STATUS.equals("L")){%><br><%out.println(APPROVER13_DATE);}%><%if(APPROVER13_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER13_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER13_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
  </tr>
<%if(AP23.equals("0")){}else{%>
  <tr>
  <td>&nbsp;<td>
  <td align="left"><%if(!AP34.equals("0") && AP34.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP34%>,'AP34','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td>

  </tr>

  <tr>
  
  <td>&nbsp;<td>
  <td align="center" class="ToolText" 
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap34Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP23.equals("0") && AP23.equals(timescapeUId) && (APPROVER23_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER23!=null){out.println(APPROVER23);}if(!APPROVER23_STATUS.equals("L")){%><br><%out.println(APPROVER23_DATE);}%><%if(APPROVER23_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER23_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER23_STATUS.equals("H")){%><span class="small">Review</span> <%}%></span></td>

  </tr>
<%}%>
<%if(AP33.equals("0")){}else{%>
  <tr>
  <td colspan="0">&nbsp;<td>

  <td align="left"><%if(!AP33.equals("0") && AP33.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP33%>,'AP33','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td>

  </tr>
  <tr>
  
<td colspan="0">&nbsp;<td>
  <td align="center" class="ToolText" 
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap35Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP33.equals("0") && AP33.equals(timescapeUId) && (APPROVER33_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER33!=null){out.println(APPROVER33);}if(!APPROVER33_STATUS.equals("L")){%><br><%out.println(APPROVER33_DATE);}%><%if(APPROVER33_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER33_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER33_STATUS.equals("H")){%><span class="small">Review</span> <%}%></span></td>

  </tr>
<%}%>
<%if(AP34.equals("0")){}else{%>
<tr>
  <td colspan="0">&nbsp;<td>

  <td align="left"><%if(!AP34.equals("0") && AP34.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP34%>,'AP34','X')"><img border="0" src="../../images/post.jpg"></a><%}%></td>

  </tr>
  <tr>
  
  <td colspan="0">&nbsp;<td>
  <td align="center" class="ToolText" 
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap36Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP34.equals("0") && AP34.equals(timescapeUId) && (APPROVER34_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER34!=null){out.println(APPROVER34);}if(!APPROVER34_STATUS.equals("L")){%><br><%out.println(APPROVER34_DATE);}%><%if(APPROVER34_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER34_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER34_STATUS.equals("H")){%><span class="small">Review</span> <%}%></span></td>

  </tr>
<%}%>
 
</table>

   
   </td>
   
</tr>
	<tr>
		<td  height="18px" colspan="12" align="center" valign="middle" class="travelMenuBG" style="background-color:#80807E;color:#FFF;"><font size="2"> REMARKS</font></td>
	</tr>
	<tr height="35px">
		<td    colspan="12" valign="top" class="travelMenuBG" >
	<table width="992px"  border="1" cellpadding="2" cellspacing="0" border-color="#EBEAE6" >
	<tr height="125" >
		<td width="263px" class="small BreakWord bgrdatacolor" valign="top" align="left" colspan="5"><%=PrintRemarks%></td>
	</tr>
	</table>
	</td>
	</tr>
	<!--end recommendations-->

	

	</table>
	
	
	</td>

	</tr>
	

</table>
