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
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">GROUP TERM LIFE INSURANCE CLAIM FORM<br></span></div></td>
        </tr>
		</tbody></table><br>

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody>

	<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp; Claim Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=myClaimRequestValues[1]%></div></td>
        </tr>
		
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp; Policy Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyNumber-")%></div></td>
        </tr>
		
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp; Insurance Company: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyInsuCompany-")%></div></td>
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
                <td colspan="100" height="5"></td>
				<td align="left">&nbsp;</td>
		    </tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Group Policy No: &nbsp;&nbsp;&nbsp;</div></td>
                 <td align="left" class="style3"><%=(String)approverClaimDetails.get("policyNumber-")%></td>
		    </tr>
		   
		    <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Member id: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="memberId" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Name of Policyholder: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="policyHolder" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Full Name of deceased Member: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="deceasedMember" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Birth: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="dateOfBirth" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Joining Company/ Group: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="dateOfJoining" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Joining Policy: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="joiningPolicy" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Death: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="dateOfDeath" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Cause of Death: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><textarea name="deathCause" cols="35" class="style3" id="area" ></textarea></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date last attended duties: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="lastDuties" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
            </tr>
		    <tr>
                 <td colspan="100" height="5"></td></tr>
		    <tr>
	</tbody>
	</table>


	

	<br>

    <table cellspacing="0" cellpadding="0" width="700" border="0">
	<tbody>
		 
		    <tr>
                 <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
            </tr>
    </tbody>
	</table>
	  
    <br>
    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
	       <tr>
                 <td colspan="100" height="5"></td></tr>
		   <tr>
		   <tr>
                 <td align="left" bgcolor="#FFFFFF" height="30"><span class="style4">* Particulars of Leave availed by the employee during the last two years: <br>(If required, please attach separate sheet duly signed by the Policyholder.)&nbsp;&nbsp;&nbsp;</span></td>
           </tr>
         
	</tbody>
	</table>
     <br>

	  <table cellspacing="0" cellpadding="0" width="700" border="0" id="addrow">
  
        <tr>

			<th colspan="1" align="center" class="style3">From Date</th>	
			<th colspan="1" align="center" class="style3">To Date</th>	
			<th colspan="1" align="center" class="style3">No. Of Days</th>
			<th colspan="1" align="center" class="style3">Type Of Leave</th>
			<th colspan="1" align="center" class="style3">Reasons</th>
			<th colspan="1" align="center" class="style3">Date of resumption of duties</th>
    
       </tr>
 
  
<%

	
    int noOfRows = 5;
	
    for(int ii = 0; ii < noOfRows; ii++){
		
		
%>
   
<tr>

     <td width="16%" height="20" align="center" class="style3"><input type="text" id="fromdate<%=ii%>"  name="fromdate<%=ii%>" class="style3" size="16" onfocus="showCalendarControl(this);"readonly></div></td>

     <td width="16%" height="20" align="center" class="style3"><input type="text" id="todate<%=ii%>" name="todate<%=ii%>" class="style3" size="16" onfocus="showCalendarControl(this);" readonly></div></td>

     <td width="9%" height="20" align="center" class="style3"><input type="text" id="noofdays<%=ii%>" name="noofdays<%=ii%>" class="style3" size="4" maxlength="5" onclick="test()"  readonly></div></td>

     <td width="18%" height="20" align="center" class="style3"><select name="leavetype<%=ii%>" class="style3">
	<option value = "0">Select LeaveType</option>
	 <option value="Casual Leave">Casual Leave</option>
	 <option value="Privilege Leave">Privilege Leave</option>
	 <option value="Sick Leave">Sick Leave</option>
	 <option value="Maternity Leave">Maternity Leave</option>
	 <option value="Nursing Leave">Nursing Leave</option>
	 <option value="Accident Leave">Accident Leave</option>
	 <option value="Without Pay">Without Pay</option>
	 <option value="Comp Off">Comp Off</option>
	 <option value="Outdoor Duty">Outdoor Duty</option>
	 <option value="Optional Holiday">Optional Holiday</option>
	 </select>
	 </td>

	  <td width="19%" height="20" align="center" class="style3"><input type="text" name="reasons<%=ii%>" class="style3" size="22" maxlength="5"></div></td>

	 <td width="20%" height="20" align="center" class="style3"><input type="text" name="resumptiondate<%=ii%>" class="style3" size="16" onfocus="showCalendarControl(this);" readonly></div></td>



</tr>



<%
	
	}
%>
   
	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <br><br>
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
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Upon admissibility of Claim, the Payment to be made in favour of :<br></span></div></td>
		</tr>
		<tr>
			 <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">
		       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <input type="checkbox" name="c1" id="g1" value="Group Policyholder">Group Policyholder&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="checkbox" name="c1" id="g2" value="Beneficiary">Beneficiary
              </span></div></td>
		</tr>
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;(In case of Gratuity FSG Policy payment will be made in favour of Group Policyholder only & for other policies if none of the &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;option is opted for then payment will be made in favour of Group
            Policyholder)
            </span></div></td>		 
		   
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
                <td colspan="100" height="5"></td>
				<td align="left">&nbsp;</td>
		</tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> If Payment to be made in favour of Beneficiary then please provide the below details:&nbsp;&nbsp;&nbsp;</div></td>
                 
		    </tr>
		   
		    <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Full Name of the Beneficiary: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="beneficiaryName" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Relationship with the deceased member: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="relationship" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Age: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="age" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Full Address of the Beneficiary: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><textarea name="beneficiaryAddress" cols="35" class="style3" id="area" ></textarea></td>
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

	<!-- <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table> -->


<!-- <table cellspacing="0" cellpadding="0" width="700" border="0">
	<tbody>
		    <tr>
                <td colspan="100" height="5"></td>
				<td align="left">&nbsp;</td>
		</tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> If Payment to be made in favour of Group Policyholder then please provide the below details:&nbsp;&nbsp;&nbsp;</div></td>
                 
		    </tr>
		   
		    <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Do you want the claim proceeds to be transferred electronically: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"> 
				 <input type="checkbox" name="c2" value="Yes">Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="checkbox" name="c2" value="No">No</div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"><u> If yes please provide the below details: &nbsp;&nbsp;&nbsp;</u></div></td>
                 
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Account Holder Name: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="accountHolder" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Bank name: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="bankName" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Type of Bank Account: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="accountType" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Bank Account Number: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="accountNumber" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Branch Name & Address: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><textarea name="branchAddress" cols="35" class="style3" id="area" ></textarea></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> MICR code: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="micrCode" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> IFSC code (Indian Financial Security code):&nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="ifscCode" class="style3" size="20" maxlength="50"></div></td>
            </tr>
			
		    <tr>
                 <td colspan="100" height="5"></td></tr>
		    <tr>
	</tbody>
	</table> -->

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
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;<u>Declaration –<br></u></span></div></td>
		</tr>
		<tr>
			<td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;We agree to save and hold Birla Sun Life Insurance Company Limited (BSLI) harmless and indemnified
			<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;against any and/or all losses, claims, liabilities, legal proceedings (including attorney fees’), expenses, or
			<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;damages suffered by or taken against BSLI arising on account of any error or misrepresentation in the
			<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;information furnished for Electronic Fund Transfer.
			<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;We hereby declare that the particulars given above are true and correct .We undertake to indemnify Birla 
			<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Sun Life Insurance Company Limited the loss suffered, if any, due to wrong statement or information given 
			<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;in connection with this claim.
			<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;We agree that this statement and all other papers and declarations in connection with this claim called by
			<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Birla Sun Life Insurance shall constitute Proof of death and may be used in any court of law.
			<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;For and on behalf of the Policyholder

			<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;(Signature of Authorized Person along with seal of Group Policyholder)
            <br></span></div></td>
		</tr>
		
		
		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;DatePlace
		 </span></div></td>
		 
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
         <input type="text" name="fillDate" size="26" class="style3" value="<%=date%>" onfocus="onLoadDetail(<%=requestNo%>,'frmGtiInsuranceClaim');" readOnly> </td>
		 </tr>		 
</table>

		<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="center" class="style5">
				<u>GROUP TERM LIFE INSURANCE CLAIM DOCUMENTATION</u>
			</td>
		 </tr>
		<tr>
			<td height="30" colspan="2" align="left" class="style3">
				<input type="checkbox" name="deathCertificate">Copy of Death Certificate issued by Municipal Authority / Gram Panchyat duly attested by the Group Policyholder<br><br>				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Or In case of Unnatural death if Accidental Death / Accidental Death & Dismemberment Rider is opted for then attested copies <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(by Group Policyholder) of –<br><br>
				<input type="checkbox" name="fir">Copy of FIR <br>
				<input type="checkbox" name="postMortem">Copy of Post Mortem <br>
				<input type="checkbox" name="policeReport">Copy of Police Inquest Report<br>
				
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
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "gti_validate()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Preview
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
