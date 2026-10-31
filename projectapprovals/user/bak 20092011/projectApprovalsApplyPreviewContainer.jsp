<%
	String entity = (String)request.getParameter("entity");
	String claimItemName = (String)request.getParameter("itemName");
	String claimItemDesc = (String)request.getParameter("itemDesc");
	String damageDate = (String)request.getParameter("damageDate");
	String damageCause = (String)request.getParameter("damageCause");
	String damageAmount = (String)request.getParameter("damageAmount");
	String contactName = (String)request.getParameter("contactName");
	String contactAddress = (String)request.getParameter("contactAddress");
	String contactPhoneNo = (String)request.getParameter("hidContactPhoneNo");
	String contactFaxNo = (String)request.getParameter("hidContactFaxNo");
	String contactMobileNo = (String)request.getParameter("contactMobileNo");
	String contactEmailId = (String)request.getParameter("contactEmailId");
	String submissionDate = (String)request.getParameter("hidSubmissionDate");
	String placeOfLoss = (String)request.getParameter("placeOfLoss");
%>

<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align="center">
	<!-- <tr>
		  <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="../images/space.gif" width="1" />
		  </td>
	</tr> -->
	<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
		<tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style2">INSURANCE CLAIM  </span></div></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </tbody>
    </table>
<table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
		<tr>
          <td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
	      <td>
		     <table cellspacing="0" cellpadding="0" width="400" border="0">
		  <tr>
				   <td height="30" align="left"  class="style5" color="#ffffff">Claim Details: </td>
				   <td height="20" align="left" class="style3">&nbsp;</td>
			   </tr> 

	<tr>
		<td width="50%" height="30" align="left" class="style5">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Entity &nbsp;&nbsp;&nbsp;</td>
		<td  height = "50" align = "center" class = "style5">:&nbsp;</td>
		<td class = "style3"  height = "30" align = "left">
			<%=entity%> 
		</td>
	</tr>

	<tr>
		<td height="30" align="left" class="style5">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Item Name &nbsp;</td>
		<td  height = "50" align = "center" class = "style5">:&nbsp;</td>
		<td class = "style3"  height = "30" align = "left">
			<%=claimItemName%> 
		</td>
	</tr>
	<tr>
		<td height="30" align="left" class="style5">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Description of Damaged Item &nbsp;</td>
		<td  height = "50" align = "center" class = "style5">:&nbsp;</td>
		<td class = "style3" width = "75%" height = "30" align = "left">
			<%=claimItemDesc%> 
		</td>
	</tr>

	<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Date of Loss / Damage </td>
		  <td height = "50" align = "center" class = "style5">:&nbsp;</td>
		<td class = "style3" height = "30" align = "left">
			<%=damageDate%> 
		</td>
	</tr>

	<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Cause of loss </td>
		<td class = "style5" height = "50" align = "center">:&nbsp;</td>
		<td class = "style3" height = "30" align = "left">
			<%=damageCause%> 
		</td>

	</tr>
	<tr>
		<td height="50" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Probable & Estimated Loss / &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Damage Amount</td>
		<td class = "style5"  height = "50" align = "center">:&nbsp;</td>
		<td class = "style3" height = "30" align = "left">
			<%=damageAmount%> 
		</td>
	</tr>
	<tr>
		<td height="50" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Place of Loss &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
		<td class = "style5" height = "50" align = "center">:&nbsp;</td>
		<td class = "style3" height = "30" align = "left">
		    <%=placeOfLoss%> 
		</td>
	</tr>
	 </table>
		</td>

		<td>
		  <table cellspacing="0" cellpadding="0" width="400" border="0">
			   <tr>
				   <td height="30" align="left"  class="style5" color="#ffffff" >Particulars of the contact person for loss: </td>
			  </tr>
		  <tr>
          <td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Name &nbsp;</div></td>
		<td class = "style5" height = "50" align = "center">:&nbsp;</td>
		<td class = "style3" height = "30" align = "left">
			<%=contactName%> 
		</td>

	</tr>
	<tr>
		<td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Address  &nbsp;&nbsp;&nbsp;</div></td>
		<td class = "style5" height = "50" align = "center">:&nbsp;</td>
		<td class = "style3" height = "30" align = "left">
		    <%=contactAddress%> 
		</td>

	</tr>
	<tr>
		<td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Phone No &nbsp;&nbsp;</div></td>
		<td class = "style5" height = "50" align = "center">:&nbsp;</td>
		<td class = "style3" height = "30" align = "left">
		    <%=contactPhoneNo%> 
		</td>

	</tr>
	<tr>
		<td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Fax &nbsp;</div></td>
		<td class = "style5" height = "50" align = "center">:&nbsp;</td>
		<td class = "style3" height = "30" align = "left">
		    <%=contactFaxNo%> 
		</td>

	</tr>
	<tr>
		<td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Mobile No &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</div></td>
		<td class = "style5" height = "50" align = "center">:&nbsp;</td>
		<td class = "style3" height = "30" align = "left">
		    <%=contactMobileNo%> 
		</td>
	</tr>
	<tr>
		<td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Email Id &nbsp;&nbsp;</div></td>
		<td class = "style5" height = "50" align = "center">:&nbsp;</td>
		<td class = "style3" height = "30" align = "left">
		    <%=contactEmailId%> 
		</td>
	</tr>
<tr>
				   <td height="30" align="left"  class="style5" color="#ffffff">&nbsp; </td>
			   </tr>
			   <tr>
				   <td height="30" align="left"  class="style5" color="#ffffff">&nbsp; </td>
			   </tr>
		  </table>
		 </td>
		 </tr>
		  
        
        
      </tbody>
    </table>
</table>
<input type = "hidden" name = "hiddCompanyCode" value = "<%=companyCode%>">
<input type = "hidden" name = "hiddClaimItemName" value = "<%=claimItemName%>">
<input type = "hidden" name = "hiddClaimItemDesc" value = "<%=claimItemDesc%>">
<input type = "hidden" name = "hiddDamageDate" value = "<%=damageDate%>">
<input type = "hidden" name = "hiddDamageCause" value = "<%=damageCause%>">
<input type = "hidden" name = "hiddDamageAmount" value = "<%=damageAmount%>">
<input type = "hidden" name = "hiddContactName" value = "<%=contactName%>">
<input type = "hidden" name = "hiddContactAddress" value = "<%=contactAddress%>">
<input type = "hidden" name = "hiddContactPhoneNo" value = "<%=contactPhoneNo%>">
<input type = "hidden" name = "hiddContactFaxNo" value = "<%=contactFaxNo%>">
<input type = "hidden" name = "hiddContactMobileNo" value = "<%=contactMobileNo%>">
<input type = "hidden" name = "hiddContactEmailId" value = "<%=contactEmailId%>">
<input type = "hidden" name = "hiddSubmissionDate" value = "<%=submissionDate%>">
<input type = "hidden" name = "hiddPlaceOfLoss" value = "<%=placeOfLoss%>">