<%
	GregorianCalendar thisDay = new GregorianCalendar( );
	String date = "";
	int monthNum = thisDay.get(Calendar.MONTH);
	monthNum = monthNum+1;
	String month = Integer.toString(monthNum);
	String insuredName = "BCCL";
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

	//hiddstatus = (String) request.getParameter("hiddstatus");
%>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg.png">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
        <tr>
          <td><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">GENERIC CLAIM FORM </span></div></td>
        </tr>
		</tbody></table>

      <table cellspacing="0" cellpadding="0" width="700" border="0">
		  <tr>
          <td height="20" colspan="100" align="left" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Claim Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=myClaimRequestValues[1]%></div></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Policy Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyNumber-")%></div></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Insurance Company: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyInsuCompany-")%></div></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
		<tr>
          <td height="50" align="right" class="style4"><div align="left"> Company Name: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3">
		  <select name = "companyName" class="style3" id="companyName">
				<option value = "BCCL" selected>BCCL</option>
				<option value = "ENIL">ENIL</option>
				<option value = "TVL">TVL</option>
				<option value = "TIM Delhi Airport Advertising Pvt. Ltd.">TIM Delhi Airport Advertising Pvt. Ltd.</option>
				<option value = "Times Innovative Media Ltd.">Times Innovative Media Ltd.</option>
				<option value = "Fourth Estate">Fourth Estate</option>
				<option value = "Zoom Entertainment Network Limited">Zoom Entertainment Network Limited</option>
				<option value = "21st Century">21st Century</option>
				<option value = "Aryabhata Properties Limited">Aryabhata Properties Limited</option>
				<option value = "Banhem Estates & IT Parks Ltd.">Banhem Estates & IT Parks Ltd.</option>
				<option value = "Sahu Jain Ltd.">Sahu Jain Ltd.</option>
				<option value = "Shubhan Properties">Shubhan Properties</option>
				<option value = "Suryashankar Properties Limited">Suryashankar Properties Limited</option>
				<option value = "Vaidehi Properties Limited">Vaidehi Properties Limited</option>
				<option value = "Sushena Properties Limited">Sushena Properties Limited</option>
				<option value = "The Times Research Foundation">The Times Research Foundation</option>
				<option value = "TPH">TPH</option>
				<option value = "Surge Enterprises Limited">Surge Enterprises Limited</option>
				<option value = "Anangha Estates Limited">Anangha Estates Limited</option>
				<option value = "Rama Jain Charitable Trust">Rama Jain Charitable Trust</option>
				<option value = "Aadidev Properties Limited">Aadidev Properties Limited</option>
				<option value = "Metropolitan Media Co Limited">Metropolitan Media Co Limited</option>
				<option value = "Alternate Brand Solutions Limited">Alternate Brand Solutions Limited</option>
				<option value = "Times Business Solutions Limited">Times Business Solutions Limited</option>
				<option value = "Times Global Broadcasting Co Limited">Times Global Broadcasting Co Limited</option>
				<option value = "Mirch Movies Ltd.">Mirch Movies Ltd.</option>
				<option value = "World Wide Media Pvt. Limited">World Wide Media Pvt. Limited</option>
				<option value = "Times Internet Ltd">Times Internet Ltd</option>
				<option value = "Times Society">Times Society</option>
				<option value = "Times Centre for Media & Managements">Times Centre for Media & Managements</option>
				<option value = "OMS-A">OMS-A</option>
				<option value = "Artee Viniyoga">Artee Viniyoga</option>
				<option value = "Bharat Nidhi Ltd.">Bharat Nidhi Ltd.</option>
				<option value = "Indu Jain">Indu Jain</option>
				<option value = "Strika Entertainment India Pvt. Ltd (BCCL Group Co.)">Strika Entertainment India Pvt. Ltd (BCCL Group Co.)</option>
				</select>
			</td>
        </tr>
	</table>

	 <table cellspacing="0" cellpadding="0" width="700" border="0">
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
	</table>

	<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value="<%=date%>" readOnly> </td>
		 </tr>		 
	</table>

  <table cellspacing="0" cellpadding="0" width="700" border="0">
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
	</table>
	<table width="250" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "generic_validate()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Submit
           </td>
		   <td align="center" class="blueButton" style="height:40px;" onclick= "this.form.reset();" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reset&nbsp;</td>
        </tr>
	</table> 
<table cellspacing="0" cellpadding="0" width="700" border="0">
        <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
	</table>
<%
	String claimNumber = (String)request.getParameter("claimNumber");
	//String requestNo = (String)request.getParameter("requestNo");

%>
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "submitClaim">
<input type = "hidden" name = "formsHeaderValue" value = "15">
