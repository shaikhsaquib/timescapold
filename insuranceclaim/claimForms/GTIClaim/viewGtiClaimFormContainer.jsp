<%
	String claimNumber = (String)request.getParameter("claimNumber");

	Object objArr1[] = new Object[3];
	objArr1[0] = "'DD-MON-YYYY'";
	objArr1[1] = requestNo;

	Hashtable claimRequestHash = new Hashtable();
	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr1);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable approverClaimDetails = xmlObj.readSubNode(myClaimRequestValues[13], "approverClaimDetails");

	Object objArr[] = new Object[2];
	objArr[0] = "'DD-MON-YYYY'" ;
	objArr[1] = claimNumber ;

	Hashtable searchHash = new Hashtable();
	searchHash.put("queryId","1000");
	searchHash.put("arguments",objArr);

	ArrayList marineClaimDetails = insuranceClaimController.viewClaimDetails(searchHash);

	for (int i = 0; i < marineClaimDetails.size(); i++)
	{
		String claimRequestDetail[] = (String[]) marineClaimDetails.get(i);

		Hashtable marineClaimDetailHash = xmlObj.readSubNode(claimRequestDetail[9],"gtiClaimForm");

%>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">GROUP TERM LIFE INSURANCE CLAIM FORM</span></div></td>
        </tr>
		<tr>
          <td width="100%" colspan="4" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td colspan="100%"align="right" class="redbold">
				Print
				<a href="javascript:void window.print()"><img src="../../images/print.gif" border="0"></a>
			</td>
		</tr>
		<tr>
          <td height="20" colspan="100" align="left" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="4" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		</tbody></table>

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
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("memberId-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Name of Policyholder: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("policyHolder-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Full Name of deceased Member: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("deceasedMember-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Birth: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("dateOfBirth-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Joining Company/ Group: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("dateOfJoining-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Joining Policy: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("joiningPolicy-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Death: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("dateOfDeath-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Cause of Death: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("deathCause-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date last attended duties: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("lastDuties-")%></td>
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
			<th colspan="1" align="center" class="style3">To date</th>	
			<th colspan="1" align="center" class="style3">No. Of Days</th>
			<th colspan="1" align="center" class="style3">Type Of Leave</th>
			<th colspan="1" align="center" class="style3">Reasons</th>
			<th colspan="1" align="center" class="style3">Date of resumption of duties</th>
    
       </tr>
 

<tr>

     <td width="16%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("fromdate0-")%></td>

     <td width="16%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("todate0-")%></td>

     <td width="9%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("noofdays0-")%></td>

     <td width="18%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("leavetype0-")%></td>

	  <td width="19%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("reasons0-")%></td>

	 <td width="20%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("resumptiondate0-")%></td>

</tr>

<tr>

     <td width="16%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("fromdate1-")%></td>

     <td width="16%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("todate1-")%></td>

     <td width="9%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("noofdays1-")%></td>

     <td width="18%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("leavetype1-")%></td>

	  <td width="19%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("reasons1-")%></td>

	 <td width="20%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("resumptiondate1-")%></td>

</tr>

<tr>

     <td width="16%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("fromdate2-")%></td>

     <td width="16%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("todate2-")%></td>

     <td width="9%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("noofdays2-")%></td>

     <td width="18%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("leavetype2-")%></td>

	  <td width="19%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("reasons2-")%></td>

	 <td width="20%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("resumptiondate2-")%></td>

</tr>

<tr>

     <td width="16%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("fromdate3-")%></td>

     <td width="16%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("todate3-")%></td>

     <td width="9%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("noofdays3-")%></td>

     <td width="18%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("leavetype3-")%></td>

	  <td width="19%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("reasons3-")%></td>

	 <td width="20%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("resumptiondate3-")%></td>

</tr>

<tr>

     <td width="16%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("fromdate4-")%></td>

     <td width="16%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("todate4-")%></td>

     <td width="9%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("noofdays4-")%></td>

     <td width="18%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("leavetype4-")%></td>

	  <td width="19%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("reasons4-")%></td>

	 <td width="20%" height="20" align="center" class="style3"><%=(String)marineClaimDetailHash.get("resumptiondate4-")%></td>

</tr>


   
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
			   <%=(String)marineClaimDetailHash.get("c1-")%></td>
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
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("beneficiaryName-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Relationship with the deceased member: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("relationship-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Age: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("age-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Full Address of the Beneficiary: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("beneficiaryAddress-")%></td>
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
				<%=(String)marineClaimDetailHash.get("c2-")%></td>
            </tr>



			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"><u> If yes please provide the below details: &nbsp;&nbsp;&nbsp;</u></div></td>
                 
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Account Holder Name: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("accountHolder-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Bank name: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("bankName-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Type of Bank Account: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("accountType-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Bank Account Number: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("accountNumber-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Branch Name & Address: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("branchAddress-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> MICR code: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("micrCode-")%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> IFSC code (Indian Financial Security code):&nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=(String)marineClaimDetailHash.get("ifscCode-")%></td>
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
      <tbody>
        <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>		
	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value = "<%=(String)marineClaimDetailHash.get("fillDate-")%>"> </td>
		 </tr>		 
		</tbody>
		</table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="right" class="style5" id="viewAttachment"></td>
		 </tr>		 
	</table>
	<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
		<td><img src="../images/shadowfooter.jpg" width="817" height="11" /></td>
	  </tr>
	</table>
<%
	}
%>
<input type = "hidden" name = "hiddRequestNumber" value = "<%=requestNo%>" />
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>" />
