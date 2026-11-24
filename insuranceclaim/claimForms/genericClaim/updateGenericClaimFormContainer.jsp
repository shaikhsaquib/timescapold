<%
	String claimNumber = (String)request.getParameter("claimNumber");
	String[] companyArr = {"BCCL ", "ENIL", "TVL", "TIM Delhi Airport Advertising Pvt. Ltd.", "Times Innovative Media Ltd.", "Fourth Estate", "Zoom Entertainment Network Limited", "21st Century", "Aryabhata Properties Limited", "Banhem Estates & IT Parks Ltd.", "Sahu Jain Ltd.", "Shubhan Properties", "Suryashankar Properties Limited", "Vaidehi Properties Limited", "Sushena Properties Limited", "The Times Research Foundation", "TPH", "Surge Enterprises Limited", "Anangha Estates Limited", "Rama Jain Charitable Trust", "Aadidev Properties Limited", "Metropolitan Media Co Limited", "Alternate Brand Solutions Limited", "Times Business Solutions Limited", "Times Global Broadcasting Co Limited", "Mirch Movies Ltd.", "World Wide Media Pvt. Limited", "Times Internet Ltd", "Times Society", "Times Centre for Media & Managements", "OMS-A", "Artee Viniyoga", "Bharat Nidhi Ltd.", "Indu Jain", "Strika Entertainment India Pvt. Ltd (BCCL Group Co.)"};

	Object objArr1[] = new Object[3];
	objArr1[0] = "'DD-MON-YYYY'";
	objArr1[1] = requestNo;

	Object objArr[] = new Object[2];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = claimNumber;

	Object objArr2[] = new Object[1];
	objArr2[0] = claimNumber;

	Hashtable claimFormDetailHash = new Hashtable( );
	claimFormDetailHash.put("queryId", "1000");
	claimFormDetailHash.put("arguments", objArr);

	Hashtable claimFormDetailHash1 = new Hashtable( );
	claimFormDetailHash1.put("queryId", "1001");
	claimFormDetailHash1.put("arguments", objArr2);

	ArrayList myClaimFormDetails = new ArrayList();
	ArrayList myClaimFormDetails1 = new ArrayList();
	myClaimFormDetails = insuranceClaimController.viewClaimDetails(claimFormDetailHash);
	myClaimFormDetails1 = insuranceClaimController.viewClaimDetails(claimFormDetailHash1);

	Hashtable claimRequestHash = new Hashtable();
	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr1);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable approverClaimDetails = xmlObj.readSubNode(myClaimRequestValues[13], "approverClaimDetails");

	for (int j = 0; j < myClaimFormDetails1.size(); j++)
	{
		String claimFormDetail1[] = (String[]) myClaimFormDetails1.get(j);

		Hashtable genericClaimDetailHash = xmlObj.readSubNode(claimFormDetail1[1],"genericClaimForm");
		String companyName1 = (String)genericClaimDetailHash.get("companyName-");

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
<%
		for(int a=0; a < 35;a++)
		{
			if(companyName1.equals(companyArr[a]))
			{
%>
				<option value = "<%=companyArr[a]%>" selected><%=companyArr[a]%></option>
<%
			}else
			{
%>
				<option value = "<%=companyArr[a]%>"><%=companyArr[a]%></option>
<%
			}
		}
%>
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
         <input type="text" name="fillDate" size="26" class="style3" value="<%=(String)genericClaimDetailHash.get("fillDate-")%>" readOnly> </td>
		 </tr>		 
	</table>
    <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
	<table width="250" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "generic_validate()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Submit
           </td>
		   <td align="center" class="blueButton" style="height:40px;" onclick= "this.form.reset();" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reset&nbsp;</td>
        </tr>
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
<%
	}
%>
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "updateClaim">
<input type = "hidden" name = "formsHeaderValue" value = "15">