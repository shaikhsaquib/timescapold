<%
	GregorianCalendar thisDay = new GregorianCalendar( );
	String date = "";
	String assuredName = "BCCL";
    String policyNumber = "";
	int monthNum = thisDay.get(Calendar.MONTH);
	monthNum = monthNum+1;
	String month = Integer.toString(monthNum);
	if(date == null || date.equals("")){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));

		if(date.length() == 1){
			date = "0" + date;
		}
		if(month.length() == 1){
			month = "0" + month;
		}
		date += "/" + month;
		
		date += "/" +Integer.toString(thisDay.get(Calendar.YEAR));
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
        policyNumber = (String)approverClaimDetails.get("policyNumber-");
        //System.out.println("policyNumber-----"+policyNumber);
%>
<input type = "hidden" name = "ploicyNumber" value = "<%=policyNumber%>">

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">ELECTRONIC EQUIPMENT CLAIM FORM</span></div></td>
        </tr>
		</tbody></table>

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody>
		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Claim No:</span></div></td>
		 <td align="left" class="style3"><%=myClaimRequestValues[1]%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Policy No:</span></div></td>
		 <td align="left" class="style3"><%=(String)approverClaimDetails.get("policyNumber-")%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Insurance Company Name:</span></div></td>
		 <td align="left" class="style3"><%=(String)approverClaimDetails.get("policyInsuCompany-")%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		</tbody></table>

		
<table cellspacing="0" cellpadding="0" width="700" border="0">
	<tbody>
		   <tr>
                 <td width="100%" colspan="4" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
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
	<tbody>
		    <tr>
		
                  <td colspan="100" height="5"></td></tr>
		  
		   
		    <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date Of Accident: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="accidentDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
		    </tr>
		   
		    <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Claim Number: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"> <%=myClaimRequestValues[1]%></div></td>
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
		   <tr>
                 <td align="left" bgcolor="#FFFFFF" height="30"><span class="style4">1. DETAILS OF INSURED&nbsp;&nbsp;&nbsp;</span></td>
           </tr>
           <br>
		   <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left">(i). Name: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="insuredName" class="style3" size="20" maxlength="50"></div></td>
		   </tr>
          
		   <tr>
                 <td height="50" align="right" class="style4"><div align="left">(ii). Address for correspondence : &nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><textarea name="address" cols="35" class="style3" id="area"></textarea>  </td>
          </tr>
		  
		  <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left">(iii). Contact Number: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="insuredTelephone" class="style3" size="17"></div></td>
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
                <td width="28%" height="20" align="left" class="style3"><input type="text" name="lossordamage" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
				<td width="54%" height="20" align="left" class="style3"><select name="HH" class="style3">
      <option value="0" selected>00 </option>
<%
	for(int ii=1; ii < 24; ii++)
	{
		NumberFormat formatter = new DecimalFormat("00");
		String number = formatter.format(ii); 
%>
		<option value="<%=number%>"><%=number%></option>
<%
	}
%>
    </select> : <select name="MM" class="style3">
      <option value="0" selected>00 </option>
<%
	for(int ii=1; ii < 60; ii++)
	{
		NumberFormat formatter = new DecimalFormat("00");
		String number = formatter.format(ii); 
%>
		<option value="<%=number%>"><%=number%></option>
<%
	}
%>
    </select></td>
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
                <td width="74%" height="20" align="left" class="style3"><textarea name="address1" cols="35" class="style3" id="area" ></textarea></td>
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
                <td width="74%" height="20" align="left" class="style3"><input type="text" name="inventoryItem" class="style3" size="20" maxlength="50"></div></td>
        </tr>
		
		
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(b). The description of the equipment: &nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><textarea name="description" cols="35" class="style3" id="area" ></textarea></td>
        </tr>
       <tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(c). Manufacturer’s name and year of manufacture. (Full details <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;as on maker’s plate to be given): &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><textarea name="manufactureDetails" cols="35" class="style3" id="area" ></textarea></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(d). What is the cost of replacement of the equipment by new &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;equipment of the same size and capacity: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><input type="text" name="cost" class="style3" size="17"></div></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;5(a). Was the property brand new or second hand?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><input type="text" name="property" class="style3" size="17"></div></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b). What was the last occasion before the damage?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><input type="text" name="occasion" class="style3" size="17"></div></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(c). when the equipment was serviced or attended to for &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;maintenance or damage?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><input type="text" name="serviceDate" class="style3" size="17"></div></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;6. Is the damaged property totally destroyed?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><input type="text" name="destroy" class="style3" size="17"></div></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;7. What has occurred and which parts of the property are <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;damaged to such an extent the replacement is necessary?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><textarea name="replacement" cols="35" class="style3" id="area" ></textarea></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;8. Has the period of guarantee expired? If so, when?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><input type="text" name="guarantee" class="style3" size="17"></div></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;9. What is the estimated amount of loss or damage?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><input type="text" name="estimatedloss" class="style3" size="17"></div></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;10. What was the cause of the damage and how did it occur?<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(This question must be answered in detail and a sketch <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;given wherever possible): &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><textarea name="causeOfDamage" cols="35" class="style3" id="area" ></textarea></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;11(a). Has the property undergone any repairs previously?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><input type="text" name="repairs" class="style3" size="17"></div></td>
        </tr>
		
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b). What was the nature of such repairs?: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><textarea name="natureOfRepaires" cols="35" class="style3" id="area" ></textarea></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;12. Give the name and address of the repairer where repairs <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;will be executed:  (Provisional repairs will be indemnified): &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><textarea name="nameAndAddress" cols="35" class="style3" id="area" ></textarea></td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;13. Any additional information relevant to processing of claim: &nbsp;</div></td>
               <td width="74%" height="20" align="left" class="style3"><textarea name="information" cols="35" class="style3" id="area" ></textarea></td>
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
        <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		
</table>


<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value="<%=date%>" onfocus="onLoadDetail(<%=requestNo%>,'frmMarineInsuranceClaim');" readOnly> </td>
		 </tr>		 
</table>

		<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="center" class="style5">
				<u>ELECTRONIC EQUIPMENT CLAIM DOCUMENTATION</u>
			</td>
		 </tr>
		<tr>
			<td height="30" colspan="2" align="left" class="style3">
				<input type="checkbox" name="format">Claim Form - duly completed, signed and stamped (format attached)<br>				
				<input type="checkbox" name="repairbill">Repair Bill/Repair Quotation<br>
				<input type="checkbox" name="photographs">Photographs <br>
				<input type="checkbox" name="engineerreport">Service Engineer Report <br>
				<input type="checkbox" name="lossdetails">Occurrence of loss in details from Insured on their CO.Letter head<br>
				
			</td>
		 </tr>			
</table>

		 <table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="right" class="style5" id="attachment"></td>
		 </tr>		 
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

	
		
		
		
		
<table width="250" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "eei_validate()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Preview
           </td>
		   <td align="center" class="blueButton" style="height:40px;" onclick= "this.form.reset();" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reset</td>
        </tr>
	</table> 



<%
	String claimNumber = (String)request.getParameter("claimNumber");
	//String requestNo = (String)request.getParameter("requestNo");

%>
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "submitClaim">
<input type = "hidden" name = "hiddFormName" value = "EeiInsurance">
