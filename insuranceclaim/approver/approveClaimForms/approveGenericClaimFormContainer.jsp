<%
	String claimNumber = (String)request.getParameter("claimNumber");

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
          <td width="74%" height="20" align="left" class="style3"><%=(String)genericClaimDetailHash.get("companyName-")%></td>
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
         <%=(String)genericClaimDetailHash.get("fillDate-")%></td>
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
<%
	}
%>			
<input type = "hidden" name = "hiddRequestNumber" value = "<%=requestNo%>" />
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>" />
