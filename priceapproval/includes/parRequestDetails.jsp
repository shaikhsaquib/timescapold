
   <tr>
    <td width="25" rowspan="12" bgcolor="#e8e8e8" class="nav"><img src="../images/basic.jpg" width="25" height="104" /></td>
    <td colspan="6"  valign="middle" bgcolor="#666666"><span class="white" ><font size="2" align="left"> PURCHASE APPROVAL REQUEST NO - <%=priceid%></font></span></td>
		<td  width="20%" align="left" align="left" colspan="2" bgcolor="#666666"><span class="white" ><font size="2" align="right">COMPANY : <%=COMPANYNAME%></font></span></td>

  </tr>

  <tr>
<td  align="left" class="travelMenuBG"  width="25%">INITIATOR NAME :</td>
<td align="left" class="travelMenuBG"colspan="2"><%=INITIATOR_NAME%></td>
<td align="left" class="travelMenuBG"colspan="2">INITIATED ON :</td>
<td align="left" class="travelMenuBG"colspan="4"><%=INITIATEDON%></td>
</tr>
  <tr>
	<td colspan="8">
	<table width="100%" border = "0"  cellspacing="1" cellpadding="1" >
	  <tr height="20">

		<td  width="20%" align="left" class="travelMenuBG"  >SANCTIONED REF TYPE :</td>
		<td  width="15%" align="left" class="travelMenuBG"align="left" ><%=SANCTIONEDREFTYPE%></td>

		<td  width="20%" align="left"   class="travelMenuBG" >REF NUMBER :</td>
		<td  width="15%" align="left" class="travelMenuBG" align="left" ><%=REFNUMBER%></td>
</tr>
 <tr height="20">
		<td  width="15%" align="left"   class="travelMenuBG" >DATE OF APPROVAL :</td>
		<td  width="15%" align="left" class="travelMenuBG" align="left" colspan="3"><%=DATEOFAPPROVAL%></td>

	  </tr>
	</table>

	  </td>

	</tr>
  

   <tr>
  <!--   <td width="25" rowspan="9" bgcolor="#e8e8e8" class="nav"><img src="../images/basic.jpg" width="25" height="104" /></td> -->
    <td height="20" colspan="8" align="center" valign="middle" class="travelMenuBG" ><span class ="nav">CATEGORY - <%=CATEGORY%></span></td>
  </tr>
  <tr>
    <td colspan="3" align="center" valign="middle" class="travelMenuBG">PC meeting details</td>
    <td colspan="5" align="center" valign="middle" class="travelMenuBG">Project Details</td>
  </tr>
  <tr>
    <td  class="nav" align="left">Negotiation/PC meeting date</td>
    <td colspan="2" class="normal" align="left"><%=NEGOTIATION_PC_DATE==null?"":NEGOTIATION_PC_DATE%></td>
    <td  class="nav" colspan="2" align="left">Description</td>
    <td colspan="3" class="normal" align="left"><%=PRODUCT_SERVICE__NAME==null?"":PRODUCT_SERVICE__NAME%></td>
  </tr>
  <tr>
    <td class="nav" align="left">Finalized vendor's name</td>
    <td colspan="2" class="normal" align="left"><%=FINALIZED_VENDOR_NAME==null?"":FINALIZED_VENDOR_NAME%></td>
    <td class="nav" colspan="2" align="left">Project</td>
    <td colspan="3" class="normal" align="left"><%=PACKAGE_NAME_SANCTION==null?"":PACKAGE_NAME_SANCTION%></td>
  </tr>
  <tr>
    <td class="nav" align="left">Negotiated value (Rs)</td>
    <td colspan="2" class="normal" align="left"><%=NEGOTIATION_VALUE==null?"":NEGOTIATION_VALUE%></td>
    <td class="nav"  colspan="2" rowspan="2" align="left">Budget    (Rs.)  / Sanction</td>
    <td colspan="3" rowspan="2" class="normal" align="left"><% if(TOTAL_BUDGET.equals("0")){out.println("-");}else{out.println(TOTAL_BUDGET);}%></td>
  </tr>
    <tr>
    <td class="nav" align="left">Validity Period</td>
    <td colspan="1" class="normal" align="left"><%=VALIDITY_PERIOD==null?"":VALIDITY_PERIOD%></td>
    
  </tr>

  <tr>
    <td class="nav" align="left">Payment terms</td>
    <td colspan="2" class="normal" align="left"><%=PAYMENT_TERMS==null?"":PAYMENT_TERMS%></td>
    <td class="nav" colspan="2" align="left">PO's Commited till date (Rs.)</td>
    <td colspan="3" class="normal" align="left"><%if(PO_COMMITTED_TILL_DATE.equals("0")){out.println("-");}else{out.println(PO_COMMITTED_TILL_DATE);}%></td>
  </tr>
  <tr>
    <td class="nav" align="left">Hard Savings (Rs.)</td>
    <td colspan="2"  class="normal" align="left"><%=SAVINGS%></td>
    <td class="nav" colspan="2" rowspan="2" align="left" align="left">Balance    Budget(Rs.)</td>
    <td colspan="3" rowspan="2" class="normal" align="left"><%if(BALANCE_BUDGET.equals("0")){out.println("-");}else{out.println(BALANCE_BUDGET);}%></td>
  
  </tr>
  <tr>
    <td class="nav" align="left">Cost Avoidance (Rs)</td>
    <td colspan="1" class="normal" align="left"><%=COST_AVOIDANCE==null?"":COST_AVOIDANCE%></td>
  </tr>
  <tr>
  </tr>
  <tr>
    <td height="70" bgcolor="#e8e8e8" class="nav"><img src="../images/background.jpg" width="25" height="104" /></td>
   <td colspan="8"  valign="top"  ><textarea  cols="25"  rows="7" style ="width:750px;text-align:justify;" class=" bgrdatacolor fontname" readonly><%=REQUIREMENT%></textarea></td> 
    <!-- <td colspan="8" class=" BreakWord bgrdatacolor" align="left" valign="top" width="20px" ><%=REQUIREMENT%></td>
 -->
  </tr>
  <tr>
    <td bgcolor="#e8e8e8" class="nav"><img src="../images/finalComparative.jpg" width="25" height="104" /></td>
    <td colspan="8" align="center"><table width="100%" border="1" cellpadding="2"cellspacing="0" bordercolor="#F8F8F8">
      <tr>
        <!-- <td height="30" align="left" valign="top" class="travelMenuBG">Item Description</td> -->
        <td width="15%" align="left" valign="top" class="travelMenuBG">Vendor</td>
        <td width="15%" align="left" valign="top" class="travelMenuBG">Initial Offer (Rs)</td>
        <td width="15%" align="left" valign="top" class="travelMenuBG">Final Offer (Rs)</td>
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

	 <%
   len = data2[3].length();

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
				
				temp = temp + data2[3].charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				data2[3] = temp;
		}

   len = data2[4].length();

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
				
				temp = temp + data2[4].charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				data2[4] = temp;
		}
%>

    <td align="left" class="normal"><%=data2[2]%></td>
    <td align="right" class="normal"><%=data2[3]%></td>
    <td align="right" class="normal"><%=data2[4]%></td>
    <td align="center" class="normal"><%=data2[5]%></td>
    <!-- <td align="left" class="normal"><%=data2[6]%></td> -->
    <td align="center" class="normal"><%=data2[11]%></td>
    <!-- <td align="left" class="normal"><%//=data2[12]%></td>
 -->  
   <td  align="center"  ><textarea  cols="15"  style ="width:170px; " class=" bgrdatacolor fontname" id="txt" readonly><%=data2[12]%></textarea></td> 
</tr>
  <%
     }
  %>
     
    </table></td>
  </tr>
  <tr>
    <td valign="middle" bgcolor="#e8e8e8" class="nav"><img src="../images/attachments.jpg" width="25" height="104" /></td>
    <td colspan="8" class="normal"><table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#F8F8F8">
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


   len = RATE1.length();

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
				
				temp = temp + RATE1.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				RATE1 = temp;
		}
   len = RATE2.length();

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
				
				temp = temp + RATE2.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				RATE2 = temp;
		}

   len = RATE3.length();

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
				
				temp = temp + RATE3.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				RATE3 = temp;
		}


	  %>
      <tr> 
        <td width="10%" align="left" valign="top"><%=DESCRIPTION1%></td>
        <td width="25%" height="25" align="left" class="BreakWord" valign="top"><%if(!(ATTACHMENT1.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT1%>')" class="normal"><%=display%></a><%}%></td>
        <td width="15%" align="left" valign="top" ><%=COMPANY_NAME1%></td>
        <td width="19%" align="left" valign="top" ><%=PRODUCT1%></td>
        <td width="10%" align="right" valign="top"><%=RATE1%></td>
        <td width="16%" align="center" valign="top"><%=UMO1%></td>
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
        <td valign="top" align="right"><%=RATE2%></td>
        <td valign="top" align="center"><%=UMO2%></td>
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
        <td valign="top" align="right"><%=RATE3%></td>
        <td valign="top" align="center"><%=UMO3%></td>
        <td valign="top" align="left"><%=REMARKS3%></td>
      </tr>
	  <%

				if(!(ATTACHMENT4.equals("NA.NA_NA")))
				{
				 String st1 = ATTACHMENT4.substring(0, ATTACHMENT4.lastIndexOf("."));
				 String st2 = ATTACHMENT4.substring(ATTACHMENT4.lastIndexOf(".")+1,ATTACHMENT4.length());
                 String st3 = st1.substring(0, ATTACHMENT4.lastIndexOf("_"));
                 display = st3 + "." + st2;
				}
	
           if(DESCRIPTION4.equals("NA") && ATTACHMENT4.equals("NA.NA_NA"))
            {}else{
  %>
      <tr>
        <td valign="top" align="left"><%=DESCRIPTION4%></td>
        <td height="36" valign="top" align="left"><%if(!(ATTACHMENT4.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT4%>')" class="normal"><%=display%></a><%}%></td>

      </tr>
	  <%}

  if(DESCRIPTION5.equals("NA") && ATTACHMENT5.equals("NA.NA_NA"))
            {}else{
				if(!(ATTACHMENT5.equals("NA.NA_NA")))
				{
				 String st1 = ATTACHMENT5.substring(0, ATTACHMENT5.lastIndexOf("."));
				 String st2 = ATTACHMENT5.substring(ATTACHMENT5.lastIndexOf(".")+1,ATTACHMENT5.length());
                 String st3 = st1.substring(0, ATTACHMENT5.lastIndexOf("_"));
                 display = st3 + "." + st2;
				}
	  %>
      <tr>
        <td valign="top" align="left"><%=DESCRIPTION5%></td>
        <td height="36" valign="top" align="left"><%if(!(ATTACHMENT5.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT5%>')" class="normal"><%=display%></a><%}%></td>

      </tr>
	  <%}
if(DESCRIPTION6.equals("NA") && ATTACHMENT6.equals("NA.NA_NA"))
            {}else{

				if(!(ATTACHMENT6.equals("NA.NA_NA")))
				{
				 String st1 = ATTACHMENT6.substring(0, ATTACHMENT6.lastIndexOf("."));
				 String st2 = ATTACHMENT6.substring(ATTACHMENT6.lastIndexOf(".")+1,ATTACHMENT6.length());
                 String st3 = st1.substring(0, ATTACHMENT6.lastIndexOf("_"));
                 display = st3 + "." + st2;
				}
	  %>
      <tr>
        <td valign="top" align="left"><%=DESCRIPTION6%></td>
        <td height="36" valign="top" align="left"><%if(!(ATTACHMENT6.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT6%>')" class="normal"><%=display%></a><%}%></td>

      </tr>
	  <%}

if(DESCRIPTION7.equals("NA") && ATTACHMENT7.equals("NA.NA_NA"))
            {}else{

				if(!(ATTACHMENT7.equals("NA.NA_NA")))
				{
				 String st1 = ATTACHMENT7.substring(0, ATTACHMENT7.lastIndexOf("."));
				 String st2 = ATTACHMENT7.substring(ATTACHMENT7.lastIndexOf(".")+1,ATTACHMENT7.length());
                 String st3 = st1.substring(0, ATTACHMENT7.lastIndexOf("_"));
                 display = st3 + "." + st2;
				}
	  %>
      <tr>
        <td valign="top" align="left"><%=DESCRIPTION7%></td>
        <td height="36" valign="top" align="left"><%if(!(ATTACHMENT7.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT7%>')" class="normal"><%=display%></a><%}%></td>

      </tr>
	  <%}
if(DESCRIPTION8.equals("NA") && ATTACHMENT8.equals("NA.NA_NA"))
            {}else{
				if(!(ATTACHMENT8.equals("NA.NA_NA")))
				{
				 String st1 = ATTACHMENT8.substring(0, ATTACHMENT8.lastIndexOf("."));
				 String st2 = ATTACHMENT8.substring(ATTACHMENT8.lastIndexOf(".")+1,ATTACHMENT8.length());
                 String st3 = st1.substring(0, ATTACHMENT8.lastIndexOf("_"));
                 display = st3 + "." + st2;
				}
	  %>
      <tr>
        <td valign="top" align="left"><%=DESCRIPTION8%></td>
        <td height="36" valign="top" align="left"><%if(!(ATTACHMENT8.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT8%>')" class="normal"><%=display%></a><%}%></td>

      </tr>
	  <%}
if(DESCRIPTION9.equals("NA") && ATTACHMENT9.equals("NA.NA_NA"))
            {}else{
				if(!(ATTACHMENT9.equals("NA.NA_NA")))
				{
				 String st1 = ATTACHMENT9.substring(0, ATTACHMENT9.lastIndexOf("."));
				 String st2 = ATTACHMENT9.substring(ATTACHMENT9.lastIndexOf(".")+1,ATTACHMENT9.length());
                 String st3 = st1.substring(0, ATTACHMENT9.lastIndexOf("_"));
                 display = st3 + "." + st2;
				}
	  %>
      <tr>
        <td valign="top" align="left"><%=DESCRIPTION9%></td>
        <td height="36" valign="top" align="left"><%if(!(ATTACHMENT9.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT9%>')" class="normal"><%=display%></a><%}%></td>

      </tr>
	  <%}

if(DESCRIPTION10.equals("NA") && ATTACHMENT10.equals("NA.NA_NA"))
            {}else{
				if(!(ATTACHMENT10.equals("NA.NA_NA")))
				{
				 String st1 = ATTACHMENT10.substring(0, ATTACHMENT10.lastIndexOf("."));
				 String st2 = ATTACHMENT10.substring(ATTACHMENT10.lastIndexOf(".")+1,ATTACHMENT10.length());
                 String st3 = st1.substring(0, ATTACHMENT10.lastIndexOf("_"));
                 display = st3 + "." + st2;
				}
	  %>
      <tr>
        <td valign="top" align="left"><%=DESCRIPTION10%></td>
        <td height="36" valign="top" align="left"><%if(!(ATTACHMENT10.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT10%>')" class="normal"><%=display%></a><%}%></td>

      </tr>
<%}%>
    </table></td>
  </tr>

  <tr>
    <td bgcolor="#e8e8e8" class="nav"><img src="../images/recommendation.jpg" width="25" height="125" /></td>
    <td colspan="8" align="center" valign="top" style="text-align:justify;"><textarea  cols="25" rows="7" style ="width:750px; " class=" bgrdatacolor fontname"  readonly ><%=RECOMMENEDATION==null?"":RECOMMENEDATION%></textarea></td>
  </tr>
  <tr>
  <td align="left"  bgcolor="#e8e8e8" valign="middle"><!-- <img src="../images/supportedBy.jpg" width="25" height="78"/> --></td>
  </tr>
  <tr>
    <td bgcolor="#e8e8e8" class="nav"><img src="../images/remarks1.jpg" width="25" height="125" /></td>
    <td colspan="8" class="small BreakWord bgrdatacolor" align="left" valign="top" width="20px" ><%=PrintRemarks%></td>
  </tr>
  <tr>
    <td rowspan="13" bgcolor="#e8e8e8" class="nav"><img src="../images/approval.jpg" width="25" height="104" /></td>
<% //out.println(CATEGORY);out.println(COMPANY);
	if((COMPANY.equals("1005") || COMPANY.equals("1006")) && (!(CATEGORY.equals("Group Company related buying") || CATEGORY.equals("Projects") || CATEGORY.equals("IT buying"))) ){
%>
    <td width="18%" align="center" class="travelMenuBG" valign="middle">REQUISITIONER</td>
<%
  }else if((COMPANY.equals("1501") ) ){
%>
    <td width="18%" align="center" class="travelMenuBG" valign="middle">REQUISITIONER</td>
<%
  }else if(COMPANY.equals("1000") && deptGroup.equals("1026"))  {%>
<td width="18%" align="center" class="travelMenuBG" valign="middle">USER</td>
<%		}else {%> 
<td width="18%" align="center" class="travelMenuBG" valign="middle">B&C</td>
<%		}%>
<%
	if((COMPANY.equals("1005") || COMPANY.equals("1006")) && (!(CATEGORY.equals("Group Company related buying") || CATEGORY.equals("Projects") || CATEGORY.equals("IT buying"))) ){
%>
    <td width="18%" align="center" class="travelMenuBG" valign="middle">HOD</td>
<%
  }else if((COMPANY.equals("1501")) ){
%>
    <td width="18%" align="center" class="travelMenuBG" valign="middle">HOD</td>
<%
  }else if(COMPANY.equals("1000") && deptGroup.equals("1026"))  {%>
	<td width="18%" align="center" class="travelMenuBG" valign="middle">B&amp;C</td>
<%		}else {%> 
	<td width="18%" align="center" class="travelMenuBG" valign="middle">User</td>
<%		}%>
<%
	if((COMPANY.equals("1005") || COMPANY.equals("1006")) && (!(CATEGORY.equals("Group Company related buying") || CATEGORY.equals("Projects") || CATEGORY.equals("IT buying")) )){
%>
    <td width="18%" align="center" class="travelMenuBG" valign="middle">Finance/Budget Team/ Mas</td>
<%
  }else if((COMPANY.equals("1501") )){
%>
    <td width="18%" align="center" class="travelMenuBG" valign="middle">Finance/Budget Team/ Mas</td>
<%
  }else {
%>
	<td width="18%" align="center" class="travelMenuBG" valign="middle">Finance/Branch Head/ Mas</td>
<%
}
%>
    
    <td width="19%" align="center" class="travelMenuBG" valign="middle"><%=label1%><!-- DIRECTOR B&C --></td>
    <td width="15%" align="center" class="travelMenuBG" valign="middle"><%=label2%><!-- EP SUPP. CHAIN --></td>
    <td width="15%" align="center" class="travelMenuBG" valign="middle"><%=label3%><!-- COO --></td>
    <td width="15%" align="center" class="travelMenuBG" valign="middle"><%=label4%><!-- CEO --></td>
    <td width="12%" align="center" class="travelMenuBG" valign="middle">Managing Director</td>
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
	<td valign="top"  height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'" ><span id="test" style="padding:4px"><div id="ap4Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP4.equals("0") && AP4.equals(timescapeUId)&& (APPROVER4_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%><%}if(APPROVER4!=null){out.println(APPROVER4);}if(!APPROVER4_STATUS.equals("L")){%><br><%out.println(APPROVER4_DATE);}%><%if(APPROVER4_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER4_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER4_STATUS.equals("H")){%><span class="small">Review</span><%}%>
    </span></td>
	</tr>
	</table>
	</td>
	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP5.equals("0") && AP5.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP5%>,'AP5','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap5Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if (!AP5.equals("0") && AP5.equals(timescapeUId) && (APPROVER5_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}if(APPROVER5!=null){out.println(APPROVER5);}if(!APPROVER5_STATUS.equals("L")){%><br><%out.println(APPROVER5_DATE);}%><%if(APPROVER5_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER5_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER5_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>
    <td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP6.equals("0") && AP6.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP6%>,'AP6','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap6Remarks"><!-- Remarks Loads Here--></div></span><span class="small">
	<%
		//out.println("JJ.."+APPROVER6);

		if(!AP6.equals("0") && AP6.equals(timescapeUId) && (APPROVER6_STATUS.equals("L")))
		{
	%>
			<%@ include file="../common/insertStatus.jsp"%>
    <%}
		if(APPROVER6!=null)
		{
			//out.println(APPROVER6);
		  if (timescapeUId.equals("45450") || APPROVER6.contains("AYESHA") ){APPROVER6 = "MD'S OFFICE";}else{APPROVER6 = APPROVER6;} 

			out.println(APPROVER6);
		}
		if(!APPROVER6_STATUS.equals("L"))
		{
	%>
		<br><% out.println(APPROVER6_DATE);
		}
	%>
<!-- 		<a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+priceid+"/"%>')" class="normal"><%=display%></a>
 -->	
		<%
		if(APPROVER6_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER6_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER6_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	<tr><td colspan="2"  id="attachment1"></tr>
	</table>
	</td>




	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP7.equals("0") && AP7.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP7%>,'AP7','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap7Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP7.equals("0") && AP7.equals(timescapeUId) && (APPROVER7_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}if(APPROVER7!=null){out.println(APPROVER7);}if(!APPROVER7_STATUS.equals("L")){%><br><%out.println(APPROVER7_DATE);}%><%if(APPROVER7_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER7_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER7_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>
	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP8.equals("0") && AP8.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP8%>,'AP8','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap8Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP8.equals("0") && AP8.equals(timescapeUId) && (APPROVER8_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}if(APPROVER8!=null){out.println(APPROVER8);}if(!APPROVER8_STATUS.equals("L")){%><br><%out.println(APPROVER8_DATE);}%><%if(APPROVER8_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER8_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER8_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>




  </tr>
  <tr>

    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap11Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else  if(!AP11.equals("0") && AP11.equals(timescapeUId) && (APPROVER11_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER11!=null){out.println(APPROVER11);}if(!APPROVER11_STATUS.equals("L")){%><br><%out.println(APPROVER11_DATE);}%><%if(APPROVER11_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER11_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER11_STATUS.equals("H")){%><span class="small">Review</span><%}%></td>
    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap12Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP12.equals("0") && AP12.equals(timescapeUId) && (APPROVER12_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER12!=null){out.println(APPROVER12);}if(!APPROVER12_STATUS.equals("L")){%><br><%out.println(APPROVER12_DATE);}%><%if(APPROVER12_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER12_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER12_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>

    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap13Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else if(!AP35.equals("0") && AP35.equals(timescapeUId) && (APPROVER35_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}
 if(APPROVER35!=null){out.println(APPROVER35);}if(!APPROVER35_STATUS.equals("L")){%><br><%out.println(APPROVER35_DATE);}%><%if(APPROVER35_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER35_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER35_STATUS.equals("H")){%><span class="small">Review</span><%}%>
   </span></td>
  </tr>
  <tr>
    <td align="left"><%if(!AP21.equals("0") && AP21.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP21%>,'AP21','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP22.equals("0") && AP22.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP22%>,'AP22','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP36.equals("0") && AP36.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP36%>,'AP36','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
  </tr>
  <tr>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap21Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else if(!AP21.equals("0") && AP21.equals(timescapeUId) && (APPROVER21_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER21!=null){out.println(APPROVER21);}if(!APPROVER21_STATUS.equals("L")){%><br><%out.println(APPROVER21_DATE);}%><%if(APPROVER21_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER21_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER21_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap22Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP22.equals("0") && AP22.equals(timescapeUId) && (APPROVER22_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER22!=null){out.println(APPROVER22);}if(!APPROVER22_STATUS.equals("L")){%><br><%out.println(APPROVER22_DATE);}%><%if(APPROVER22_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER22_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER22_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap23Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else if(!AP36.equals("0") && AP36.equals(timescapeUId) && (APPROVER36_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER36!=null){out.println(APPROVER36);}if(!APPROVER36_STATUS.equals("L")){%><br><%out.println(APPROVER36_DATE);}%><%if(APPROVER36_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER36_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER36_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
  </tr>
  <tr>
    <td align="left"><%if(!AP31.equals("0") && AP31.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP31%>,'AP31','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP32.equals("0") && AP32.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP32%>,'AP32','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
    <td align="left"><%if(!AP33.equals("0") && AP33.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP33%>,'AP33','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>
  </tr>
  <tr>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap31Remarks"><!-- Remarks Loads Here--></div></span>
	<span class="small"><%if(STATUS.equals("C")){ } else if(!AP31.equals("0") && AP31.equals(timescapeUId) && (APPROVER31_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}
	if(APPROVER31!=null){out.println(APPROVER31);} if(!APPROVER31_STATUS.equals("L")){%><br><%out.println(APPROVER31_DATE);}%><%if(APPROVER31_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER31_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER31_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText"  
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap32Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP32.equals("0") && AP32.equals(timescapeUId) && (APPROVER32_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%}
if(APPROVER32!=null){out.println(APPROVER32);}if(!APPROVER32_STATUS.equals("L")){%><br><%out.println(APPROVER32_DATE);}%><%if(APPROVER32_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER32_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER32_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap33Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP13.equals("0") && AP13.equals(timescapeUId) && (APPROVER13_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER13!=null){out.println(APPROVER13);}if(!APPROVER13_STATUS.equals("L")){%><br><%out.println(APPROVER13_DATE);}%><%if(APPROVER13_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER13_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER13_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
  </tr>
<%if(AP23.equals("0")){}else{%>
  <tr>
  <td>&nbsp;<td>
  <td align="left"><%if(!AP34.equals("0") && AP34.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP34%>,'AP34','X','<%=COMPANY%>')"><img border="0" src="../images/post.jpg"></a><%}%></td>

  </tr>

  <tr>
  
  <td>&nbsp;<td>
  <td align="center" class="ToolText" 
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap34Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP23.equals("0") && AP23.equals(timescapeUId) && (APPROVER23_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER23!=null){out.println(APPROVER23);}if(!APPROVER23_STATUS.equals("L")){%><br><%out.println(APPROVER23_DATE);}%><%if(APPROVER23_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER23_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER23_STATUS.equals("H")){%><span class="small">Review</span> <%}%></span></td>

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
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap35Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP33.equals("0") && AP33.equals(timescapeUId) && (APPROVER33_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER33!=null){out.println(APPROVER33);}if(!APPROVER33_STATUS.equals("L")){%><br><%out.println(APPROVER33_DATE);}%><%if(APPROVER33_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER33_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER33_STATUS.equals("H")){%><span class="small">Review</span> <%}%></span></td>

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
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap36Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP34.equals("0") && AP34.equals(timescapeUId) && (APPROVER34_STATUS.equals("L"))){%><%@ include file="../common/insertStatus.jsp"%>
   <%} if(APPROVER34!=null){out.println(APPROVER34);}if(!APPROVER34_STATUS.equals("L")){%><br><%out.println(APPROVER34_DATE);}%><%if(APPROVER34_STATUS.equals("A")){%><img src="../images/approved.png"><%}else if(APPROVER34_STATUS.equals("R")){%><img src="../images/rejected.png"><%}else if(APPROVER34_STATUS.equals("H")){%><span class="small">Review</span> <%}%></span></td>

  </tr>
<%}%>
</table>
<table width="815" cellspacing="0" cellpadding="0">
<tr><td height="50"></td></tr>
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
		String PrintRemarksAPP35  = "";
		String PrintRemarksAPP36  = "";
		String PrintRemarksAPP7  = "";
		String PrintRemarksAPP8  = "";
		

		String data[]       = null;
		ArrayList remarks   = new ArrayList();
		String str          = ""; 
		int i = 0;

		//long priceid_L = Long.parseLong(priceid);

		// SD1 Remarks
		         
				   long SD1_L = Long.parseLong(SD1);
				   
				   remarks  = priceApprovalWebController.showRemarks(SD1_L,priceid,"SD1");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(SD2_L,priceid,"SD2");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP11_L,priceid,"AP11");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP12_L,priceid,"AP12");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP13_L,priceid,"AP13");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP21_L,priceid,"AP21");
				
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
					  //out.println("No Remarks");	
					  PrintRemarksAPP21= "No Remarks";
				   }	
	// AP21 remarks end
	// AP22 Remarks
		         
				   long AP22_L = Long.parseLong(AP22);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP22_L,priceid,"AP22");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP23_L,priceid,"AP23");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP31_L,priceid,"AP31");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP32_L,priceid,"AP32");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP33_L,priceid,"AP33");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP34_L,priceid,"AP34");
				
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
	// AP34 remarks end



// AP35 Remarks
		         
				   long AP35_L = Long.parseLong(AP35);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP35_L,priceid,"AP35");
				
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
						PrintRemarksAPP35 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP35= "No Remarks";
				   }
//System.out.println(PrintRemarksAPP36);
	// AP35 remarks end
    // AP36 Remarks
		         
				   long AP36_L = Long.parseLong(AP36);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP36_L,priceid,"AP36");
				
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
						PrintRemarksAPP36 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP36= "No Remarks";
				   }	

	// AP36 remarks end




	// AP4 Remarks
		         
				   long AP4_L = Long.parseLong(AP4);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP4_L,priceid,"AP4");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP5_L,priceid,"AP5");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP6_L,priceid,"AP6");
				
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
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP7_L,priceid,"AP7");
				
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


	// AP8 Remarks
		         
				   long AP8_L = Long.parseLong(AP8);
				   				   
		           remarks  = priceApprovalWebController.showRemarks(AP8_L,priceid,"AP7");
				
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
						PrintRemarksAPP8 = str;
				   }
				   else
				   {
					  //out.println("No Remarks");	
					  PrintRemarksAPP8= "No Remarks";
				   }	
	// AP8 remarks end

	%>
 <!--  <tr>
  <td height="23" colspan="2" align="center" valign="middle" bgcolor="#333333" class="white">R E M A R K S</td>
  </tr>
  <tr>
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
  </tr> 
</table>
  <table width="815" border="1"bordercolor="#F5F5F5"  cellspacing="0" cellpadding="2">
  <tr>
    <td width="30%" height="22" align="center" valign="middle" class="greyBG"> B &amp; C </td>
    <td width="30%" height="22" align="center" valign="middle" class="greyBG"> USER </td>
    <td width="30%" height="22" align="center" valign="middle" class="greyBG"> FINANCE/BRANCH HEAD/ MAS </td>
  </tr>
  <tr>
    <td height="22" class="travelMenuBG"><span class="small"><%//if(APPROVER11!=null){out.println(APPROVER11);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%//if(APPROVER12!=null){out.println(APPROVER12);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%//if(APPROVER13!=null){out.println(APPROVER13);}%></span></td>
  </tr>
  <tr>
    <td height="21" class="small"><%//=PrintRemarksAPP11%></td>
    <td class="small"><%//=PrintRemarksAPP12%></td>
    <td class="small"><%//=PrintRemarksAPP13%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="22" class="travelMenuBG"><span class="small"><%//if(APPROVER21!=null){out.println(APPROVER21);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%//if(APPROVER22!=null){out.println(APPROVER22);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%//if(APPROVER23!=null){out.println(APPROVER23);}%></span></td>
  </tr>
  <tr>
    <td height="21" class="small"><%//=PrintRemarksAPP21%></td>
    <td class="small"><%//=PrintRemarksAPP22%></td>
    <td class="small"><%//=PrintRemarksAPP23%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="22" class="travelMenuBG"><span class="small"><%//if(APPROVER31!=null){out.println(APPROVER31);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%//if(APPROVER32!=null){out.println(APPROVER32);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%//if(APPROVER33!=null){out.println(APPROVER33);}%></span></td>
  </tr>
  <tr>
    <td height="21" class="small"><%//=PrintRemarksAPP31%></td>
    <td class="small"><%//=PrintRemarksAPP32%></td>
    <td class="small"><%//=PrintRemarksAPP33%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="22" class="travelMenuBG"> <span class="small"><%if(APPROVER11!=null){out.println(APPROVER11);}%></span></td>
    <td class="travelMenuBG"> <span class="small"><%if(APPROVER21!=null){out.println(APPROVER21);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%//if(APPROVER34!=null){out.println(APPROVER34);}%></span></td>
  </tr>
  <tr>
    <td height="21" class="small"><%=PrintRemarksAPP11%></td>
    <td class="small"><%=PrintRemarksAPP21%> </td>
    <td class="small"><%//=PrintRemarksAPP34%></td>
  </tr>
 <tr>
    <td height="22" class="travelMenuBG"><span class="small"><%if(APPROVER11!=null){out.println(APPROVER11);}%></span> </td>
    <td class="travelMenuBG"> <span class="small"><%if(APPROVER21!=null){out.println(APPROVER21);}%></span></td>
    <td class="travelMenuBG"><span class="small"><%//if(APPROVER35!=null){out.println(APPROVER35);}%></span></td>
  </tr>
  <tr>
    <td height="21" class="small"><%=PrintRemarksAPP11%> </td>
    <td class="small"> <%=PrintRemarksAPP21%></td>
    <td class="small"><%//=PrintRemarksAPP35%></td>
  </tr>
 <tr>
    <td height="22" class="travelMenuBG"><span class="small"><%if(APPROVER11!=null){out.println(APPROVER11);}%></span></td>
    <td class="travelMenuBG"> <span class="small"><%if(APPROVER21!=null){out.println(APPROVER21);}%></span> </td>
    <td class="travelMenuBG"><span class="small"><%//if(APPROVER36!=null){out.println(APPROVER36);}%></span></td>
  </tr>
  <tr>
    <td height="21" class="small"><%=PrintRemarksAPP11%> </td>
    <td class="small"><%=PrintRemarksAPP21%></td>
    <td class="small"><%//=PrintRemarksAPP36%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <table width="815" border="8" bordercolor="#F5F5F5"  cellspacing="0" cellpadding="2">
  <tr>
    <td height="23" colspan="5" align="center" valign="middle" class="greyBG">DIRECTORS</td>
  </tr>
  <tr>
    <td width="258" height="22" class="travelMenuBG"><span class="travelMenuBG"><%//if(APPROVER4!=null){out.println(APPROVER4);}%></span></td>
    <td width="251" class="travelMenuBG"><%//if(APPROVER5!=null){out.println(APPROVER5);}%></td>
    <td width="258" class="travelMenuBG"><%//if(APPROVER6!=null){out.println(APPROVER6);}%></td>
    <td width="258" class="travelMenuBG"><%//if(APPROVER7!=null){out.println(APPROVER7);}%></td>
    <td width="258" class="travelMenuBG"><%//if(APPROVER8!=null){out.println(APPROVER8);}%></td>
    
  </tr>
  <tr>
    <td height="29" class="small"><%//=PrintRemarksAPP4%></td>
    <td class="small"><%//=PrintRemarksAPP5%></td>
    <td class="small"><%//=PrintRemarksAPP6%></td>
    <td class="small"><%//=PrintRemarksAPP8%></td>
    <td class="small"><%//=PrintRemarksAPP7%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>-->
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
<input type="hidden" name="AP35Remarks" value="<%=PrintRemarksAPP35%>">
<input type="hidden" name="AP36Remarks" value="<%=PrintRemarksAPP36%>">
<input type="hidden" name="AP7Remarks" value="<%=PrintRemarksAPP7%>">
<input type="hidden" name="AP8Remarks" value="<%=PrintRemarksAPP8%>">