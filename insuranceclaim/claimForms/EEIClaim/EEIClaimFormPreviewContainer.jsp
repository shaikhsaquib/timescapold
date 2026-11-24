<%
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String flag = (String)request.getParameter("hiddFlag");
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	int directorySize1 = Integer.parseInt(directorySize);
	System.out.println(directorySize1);

	//String periodOfInsurance = (String)request.getParameter("periodOfInsurance");
	String accidentDate = (String)request.getParameter("accidentDate");
	String insuredName = (String)request.getParameter("insuredName");
	String address = (String)request.getParameter("address");
	String insuredTelephone = (String)request.getParameter("insuredTelephone");
	String lossordamage = (String)request.getParameter("lossordamage");
	String HH = (String)request.getParameter("HH");
	String MM = (String)request.getParameter("MM");
	String address1 = (String)request.getParameter("address1");
	String inventoryItem = (String)request.getParameter("inventoryItem");
	//String sum = (String)request.getParameter("sum");
	String description = (String)request.getParameter("description");
	String manufactureDetails = (String)request.getParameter("manufactureDetails");
	String cost = (String)request.getParameter("cost");
	String property = (String)request.getParameter("property");
	String occasion = (String)request.getParameter("occasion");
	String serviceDate = (String)request.getParameter("serviceDate");
	String destroy = (String)request.getParameter("destroy");
	String replacement = (String)request.getParameter("replacement");
	String guarantee = (String)request.getParameter("guarantee");
	String estimatedloss = (String)request.getParameter("estimatedloss");
	String causeOfDamage = (String)request.getParameter("causeOfDamage");
	String repairs = (String)request.getParameter("repairs");
	String natureOfRepaires = (String)request.getParameter("natureOfRepaires");
	String nameAndAddress = (String)request.getParameter("nameAndAddress");
	String information = (String)request.getParameter("information");
	
	String fillDate = (String)request.getParameter("fillDate");
	
	String fileName[] = new String[directorySize1];
    int j;
	
	for(j = 0; j<directorySize1; j++)
	{
		fileName[j] = (String)request.getParameter("hiddFilesName"+j);
		//System.out.println(fileName[j]);
	}

	

	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = requestNo;

	Hashtable claimRequestHash = new Hashtable();
	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable approverClaimDetails = xmlObj.readSubNode(myClaimRequestValues[13], "approverClaimDetails");
%>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="right"><span class="style4">ELECTRONIC EQUIPMENT CLAIM FORM</span></div></td>
        </tr>
		
		
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Claim Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=myClaimRequestValues[1]%></div></td>
        </tr>
		
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Policy Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyNumber-")%></div></td>
        </tr>
		
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Insurance Company: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyInsuCompany-")%></div></td>
        </tr>
		</tbody></table>
	
      <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  <tr>
          <td height="20" colspan="100" align="left" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
		
        
		  <tr>
          <td height="50" align="right" class="style4"><div align="left"> Date Of Accident: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=accidentDate%></td>
        </tr>
		
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Claim Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=myClaimRequestValues[1]%></div></td>
        </tr>
		
		      <table cellspacing="0" cellpadding="0" width="700" border="0">
	<tbody>
		 
		    <tr>
                 <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
            </tr>
    </tbody>
	</table>
	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
	       <tr>
                 <td colspan="100" height="5"></td></tr>
		   <tr>
		   <tr>
                 <td align="left" bgcolor="#FFFFFF" height="30"><span class="style4">1. DETAILS OF INSURED&nbsp;&nbsp;&nbsp;</span></td>
           </tr>
           <br>
		   <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left">(i). Name: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=insuredName%></td>
		   </tr>
          
		   <tr>
                 <td height="50" align="right" class="style4"><div align="left">(ii). Address for correspondence : &nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=address%></td>
          </tr>
		  
		  <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left">(iii). Contact Number: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=insuredTelephone%></td>
		  </tr>
		 
	</tbody>
	</table>

    <table cellspacing="0" cellpadding="0" width="700" border="0">
	<tbody>
		 
		  <tr>
                 <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
    </tbody>
	</table>
	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
	      <tr>
                 <td colspan="100" height="5"></td>
		  </tr>
          <br>
		

		 <tr>
                <td width="56%" height="30" align="right" class="style4"><div align="left">2. When did the loss or damage occur?(State date and time): &nbsp;&nbsp;&nbsp;</div></td>
                <td width="28%" height="20" align="left" class="style3"><%=lossordamage%></td>
                <td width="54%" height="20" align="left" class="style3"><%=HH%> : <%=MM%></td>
                
		 </tr>
      
        

		<tr>
                <td colspan="100" height="5"></td></tr>
		<tr>
	</tbody>
	</table>

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
		 
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
    </tbody>
	</table>
	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
	    <tr>
                <td colspan="100" height="5"></td></tr>
		<tr>
		<br>
		<tr>
                <td width="56%" height="30" align="right" class="style4"><div align="left">3. The address where the property (item) covered is situated.: &nbsp;&nbsp;&nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><%=address1%></td>
		</tr>
		
		<tr>
               <td colspan="100" height="5"></td>
		</tr>
		
	</tbody>
	</table>

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
		 
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
    </tbody>
	</table>

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
	    <tr>
                <td colspan="100" height="5"></td>
		</tr>
		<tr>
                <td width="56%" height="30" align="right" class="style4"><div align="left">4. What was damaged?:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
		       
        </tr>
		
		
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(a). Item of the Inventory: &nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><%=inventoryItem%></td>
        </tr>
		
		
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(b). The description of the equipment: &nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><%=description%></td>
        </tr>
       <tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(c). Manufacturer’s name and year of manufacture. (Full details <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;as on maker’s plate to be given): &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=manufactureDetails%></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(d). What is the cost of replacement of the equipment by new &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;equipment of the same size and capacity: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=cost%></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;5(a). Was the property brand new or second hand?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=property%></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b). What was the last occasion before the damage?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=occasion%></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(c). when the equipment was serviced or attended to for &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;maintenance or damage?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=serviceDate%></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;6. Is the damaged property totally destroyed?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=destroy%></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;7. What has occurred and which parts of the property are <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;damaged to such an extent the replacement is necessary?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=replacement%></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;8. Has the period of guarantee expired? If so, when?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=guarantee%></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;9. What is the estimated amount of loss or damage?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=estimatedloss%></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;10. What was the cause of the damage and how did it occur?<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(This question must be answered in detail and a sketch <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;given wherever possible): &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=causeOfDamage%></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;11(a). Has the property undergone any repairs previously?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=repairs%></td>
        </tr>
		
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b). What was the nature of such repairs?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=natureOfRepaires%></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;12. Give the name and address of the repairer where repairs <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;will be executed:  (Provisional repairs will be indemnified): &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=nameAndAddress%></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;13. Any additional information relevant to processing of claim: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><%=information%></td>
        </tr>
		
		<tr>
                <td colspan="100" height="5"></td>
		</tr>
		
	</tbody>
	</table>
	 


		<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	
<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody>
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;  I/We hereby agree, affirm and declare that:<br></span></div></td>
		</tr>
		<tr>
			<td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;(a) The statements/information given/stated by me/us in this claim form are true, correct and complete.<br></span></div></td>
		</tr>
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;(b) The details of all persons having an interest in the property in respect of which the claim is being made are provided <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;as per the proposal form or by way of an endorsement in the policy. Furthermore, save and except as provided or &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;disclosed in this claim form, no claim made hereunder (or the same/similar claim) has been made or lodged with <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;any other insurance company. </span></div></td>		 
		    <td align="left">&nbsp;</td>
		</tr>
		
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;(c) No material information which is relevant to the processing of the claim or which in any manner has a bearing on the <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;claim has been withheld or not disclosed.<br></span></div></td>
		</tr>
		
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;(d) If I/we have given/made any false or fraudulent statement/information, or suppressed or concealed or in any manner <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;failed to disclose material information, the policy shall be void and that I/We shall not be entitled to all/any rights to <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;recover thereunder in respect of any or all claims, past, present or future.<br></span></div></td>
		</tr>

		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;(e) The receipt of this claim form/other supporting/related documents does not constitute or be deemed to constitute an &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;agreement by the Company of the claim and the Company reserves the right to process or reject or require &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;further/additional information in respect of the claim.<br><br><br></span></div></td>
		</tr>
		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Place
		 <br></span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Date
		 <br></span></div>
		 </td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		 <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Signature of the Insured
		 <br></span></div>
		 </td>
		  <td align="left">&nbsp;</td>
		  </tr>
		 
		</tbody>
</table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>


<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <%=fillDate%></td>
		 </tr>		 
</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="right" class="style5" id="viewAttachment"></td>
		 </tr>		 
	</table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>

		<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="../images/shadowfooter.jpg" width="817" height="11" /></td>
  </tr>
</table>
</td></tr>
</tbody></table>

<input type = "hidden" name = "hiddAccidentDate" value = "<%=accidentDate%>">
<input type = "hidden" name = "hiddInsuredName" value = "<%=insuredName%>">
<input type = "hidden" name = "hiddInsuredTelephone" value = "<%=insuredTelephone%>">
<input type = "hidden" name = "hiddAddress" value = "<%=address%>">
<input type = "hidden" name = "hiddLossordamage" value = "<%=lossordamage%>">
<input type = "hidden" name = "hiddHH" value = "<%=HH%>">
<input type = "hidden" name = "hiddMM" value = "<%=MM%>">
<input type = "hidden" name = "hiddAddress1" value = "<%=address1%>">
<input type = "hidden" name = "hiddInventoryItem" value = "<%=inventoryItem%>">

<input type = "hidden" name = "hiddDescription" value = "<%=description%>">
<input type = "hidden" name = "hiddManufactureDetails" value = "<%=manufactureDetails%>">
<input type = "hidden" name = "hiddCost" value = "<%=cost%>">
<input type = "hidden" name = "hiddProperty" value = "<%=property%>">
<input type = "hidden" name = "hiddOccasion" value = "<%=occasion%>">
<input type = "hidden" name = "hiddServiceDate" value = "<%=serviceDate%>">
<input type = "hidden" name = "hiddDestroy" value = "<%=destroy%>">
<input type = "hidden" name = "hiddReplacement" value = "<%=replacement%>">
<input type = "hidden" name = "hiddGuarantee" value = "<%=guarantee%>">
<input type = "hidden" name = "hiddEstimatedloss" value = "<%=estimatedloss%>">
<input type = "hidden" name = "hiddCauseOfDamage" value = "<%=causeOfDamage%>">
<input type = "hidden" name = "hiddRepairs" value = "<%=repairs%>">
<input type = "hidden" name = "hiddNatureOfRepaires" value = "<%=natureOfRepaires%>">
<input type = "hidden" name = "hiddNameAndAddress" value = "<%=nameAndAddress%>">
<input type = "hidden" name = "hiddInformation" value = "<%=information%>">



<%
for(int i = 0;i<directorySize1;i++)
{
%>
	<input type = "hidden" name = "hiddFilesName<%=i%>" value = "<%=fileName[i]%>">
<%
}
%>
<input type = "hidden" name = "hiddFillDate" value = "<%=fillDate%>">
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "formsHeaderValue" value = "2">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "<%=flag%>">
<input type = "hidden" name = "hiddDirectorySize" value = "<%=directorySize1%>">

       