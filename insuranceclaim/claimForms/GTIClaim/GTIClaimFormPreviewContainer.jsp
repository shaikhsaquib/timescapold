<%
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String flag = (String)request.getParameter("hiddFlag");
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	int directorySize1 = Integer.parseInt(directorySize);
	//System.out.println(directorySize1);

	String grPolicy = (String)request.getParameter("grPolicy");
	String memberId = (String)request.getParameter("memberId");
	String policyHolder = (String)request.getParameter("policyHolder");
	String deceasedMember = (String)request.getParameter("deceasedMember");
	dateOfBirth = (String)request.getParameter("dateOfBirth");
	String dateOfJoining = (String)request.getParameter("dateOfJoining");
	String joiningPolicy = (String)request.getParameter("joiningPolicy");
	String dateOfDeath = (String)request.getParameter("dateOfDeath");
	String deathCause = (String)request.getParameter("deathCause");
	String lastDuties = (String)request.getParameter("lastDuties");
	String c1 = (String)request.getParameter("c1");
	String beneficiaryName = (String)request.getParameter("beneficiaryName");
	String relationship = (String)request.getParameter("relationship");
	String age = (String)request.getParameter("age");
	String beneficiaryAddress = (String)request.getParameter("beneficiaryAddress");
	String c2 = (String)request.getParameter("c2");
	String accountHolder = (String)request.getParameter("accountHolder");
	String bankName = (String)request.getParameter("bankName");
	String accountType = (String)request.getParameter("accountType");
	String accountNumber = (String)request.getParameter("accountNumber");
	String branchAddress = (String)request.getParameter("branchAddress");
	String micrCode = (String)request.getParameter("micrCode");
	String ifscCode = (String)request.getParameter("ifscCode");
	
	
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
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">GROUP TERM LIFE INSURANCE CLAIM FORM<br></span></div></td>
        </tr>
		</tbody></table><br><br>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
		<!-- <tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="right"><span class="style4">GROUP TERM LIFE INSURANCE CLAIM FORM</span></div></td>
        </tr>
		 -->
		
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
                <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyNumber-")%></div></td>
		    </tr>
		   
		    <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Member id: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=memberId%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Name of Policyholder: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=policyHolder%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Full Name of deceased Member: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=deceasedMember%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Birth: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=dateOfBirth%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Joining Company/ Group: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=dateOfJoining%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Joining Policy: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=joiningPolicy%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date of Death: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=dateOfDeath%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Cause of Death: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=deathCause%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date last attended duties: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=lastDuties%></td>
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
 
  
<%
	
    int noOfRows = 5;
	 
    for(int ii = 0; ii < noOfRows; ii++){

		    String fromdate        = (String) request.getParameter("fromdate" + ii);
			String todate          = (String) request.getParameter("todate" + ii);
			String noofdays        = (String) request.getParameter("noofdays" + ii);
			String leavetype       = (String) request.getParameter("leavetype" + ii);
			String reasons         = (String) request.getParameter("reasons" + ii);
			String resumptiondate  = (String) request.getParameter("resumptiondate" + ii);
			
		
%>
  

<%
     if(leavetype.equals("0")){

	fromdate="-";
	todate="-";
	noofdays="-";
	leavetype="-";
	reasons="-";
	resumptiondate="-";

%>

<tr>

     <td width="16%" height="20" align="center" class="style3"><%=fromdate%></td>

     <td width="16%" height="20" align="center" class="style3"><%=todate%></td>

     <td width="9%" height="20" align="center" class="style3"><%=noofdays%></td>

     <td width="18%" height="20" align="center" class="style3"><%=leavetype%></td>

     <td width="19%" height="20" align="center" class="style3"><%=reasons%></td>

	 <td width="20%" height="20" align="center" class="style3"><%=resumptiondate%></td>

</tr>

<%
    }else {
%>

<tr>

     <td width="16%" height="20" align="center" class="style3"><%=fromdate%></td>

     <td width="16%" height="20" align="center" class="style3"><%=todate%></td>

     <td width="9%" height="20" align="center" class="style3"><%=noofdays%></td>

     <td width="18%" height="20" align="center" class="style3"><%=leavetype%></td>

     <td width="19%" height="20" align="center" class="style3"><%=reasons%></td>

	 <td width="20%" height="20" align="center" class="style3"><%=resumptiondate%></td>

</tr>

<%
    }
%>

<input type = "hidden" name = "hiddFromdate<%=ii%>" value = "<%=fromdate%>">
<input type = "hidden" name = "hiddTodate<%=ii%>" value = "<%=todate%>">
<input type = "hidden" name = "hiddNoofdays<%=ii%>" value = "<%=noofdays%>">
<input type = "hidden" name = "hiddLeavetype<%=ii%>" value = "<%=leavetype%>">
<input type = "hidden" name = "hiddReasons<%=ii%>" value = "<%=reasons%>">
<input type = "hidden" name = "hiddResumptiondate<%=ii%>" value = "<%=resumptiondate%>">

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
			   <%=c1%></td>
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
<%
     if(c1.equals("Beneficiary")){
%>
    
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
                 <td width="74%" height="20" align="left" class="style3"><%=beneficiaryName%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Relationship with the deceased member: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=relationship%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Age: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=age%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Full Address of the Beneficiary: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=beneficiaryAddress%></td>
            </tr>
			
		    <tr>
                 <td colspan="100" height="5"></td></tr>
		    <tr>
	</tbody>
	</table>
<%
    }else {
		beneficiaryName="-";
		relationship="-";
		age="-";
		beneficiaryAddress="-";
%>
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
                 <td width="74%" height="20" align="left" class="style3"><%=beneficiaryName%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Relationship with the deceased member: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=relationship%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Age: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=age%></td>
            </tr>
			<tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Full Address of the Beneficiary: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><%=beneficiaryAddress%></td>
            </tr>
			
		    <tr>
                 <td colspan="100" height="5"></td></tr>
		    <tr>
	</tbody>
	</table>
<%
		}
%>


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

<input type = "hidden" name = "hiddGrPolicy" value = "<%=grPolicy%>">
<input type = "hidden" name = "hiddMemberId" value = "<%=memberId%>">
<input type = "hidden" name = "hiddPolicyHolder" value = "<%=policyHolder%>">
<input type = "hidden" name = "hiddDeceasedMember" value = "<%=deceasedMember%>">
<input type = "hidden" name = "hiddDateOfBirth" value = "<%=dateOfBirth%>">
<input type = "hidden" name = "hiddDateOfJoining" value = "<%=dateOfJoining%>">
<input type = "hidden" name = "hiddJoiningPolicy" value = "<%=joiningPolicy%>">
<input type = "hidden" name = "hiddDateOfDeath" value = "<%=dateOfDeath%>">
<input type = "hidden" name = "hiddDeathCause" value = "<%=deathCause%>">
<input type = "hidden" name = "hiddLastDuties" value = "<%=lastDuties%>">
<input type = "hidden" name = "hiddC1" value = "<%=c1%>">
<input type = "hidden" name = "hiddBeneficiaryName" value = "<%=beneficiaryName%>">
<input type = "hidden" name = "hiddRelationship" value = "<%=relationship%>">
<input type = "hidden" name = "hiddAge" value = "<%=age%>">
<input type = "hidden" name = "hiddBeneficiaryAddress" value = "<%=beneficiaryAddress%>">
<input type = "hidden" name = "hiddC2" value = "<%=c2%>">
<input type = "hidden" name = "hiddAccountHolder" value = "<%=accountHolder%>">
<input type = "hidden" name = "hiddBankName" value = "<%=bankName%>">
<input type = "hidden" name = "hiddAccountType" value = "<%=accountType%>">
<input type = "hidden" name = "hiddAccountNumber" value = "<%=accountNumber%>">
<input type = "hidden" name = "hiddBranchAddress" value = "<%=branchAddress%>">
<input type = "hidden" name = "hiddMicrCode" value = "<%=micrCode%>">
<input type = "hidden" name = "hiddIfscCode" value = "<%=ifscCode%>">





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

       