 <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="bg.png">

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
				<td width="50%" height="30" align="left" class="style5">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Entity: &nbsp;&nbsp;&nbsp;</td>
				<td width="74%" height="20" align="left" class="style3"><input class = "style3" type="text" value = "<%=companyName%>" size= "26" name="entity" readonly>  </td>
        </tr>
		
		
<%
			
			String [] contactDetailsValues = new String[3];


			if ( !legacyId.equals("N/A")) {
			
				ArrayList contactDetails = insuranceClaimController.getContacts(legacyId);
				String [] contactDetailsValues1 = new String[contactDetails.size()];
				
				if(contactDetails.size() > 0) {

					contactDetailsValues1 = (String[])contactDetails.get(0);
					contactDetailsValues	=	contactDetailsValues1;
				}

			} else {
				// Amit Chowdhary's contact details
				contactDetailsValues[0]	=	"91-22-66954123";// phone no
				contactDetailsValues[1]	=	"91-9820195809"; //mobile
				contactDetailsValues[2]	=	"91-22-731223"; //fax
		
			}

			ArrayList addressDetails = insuranceClaimController.getAddress(companyCode,location);
			String[] addressDetailsValues = new String[addressDetails.size()];
			String address = "";
			if(addressDetails.size() > 0)
			{
				addressDetailsValues = (String[])addressDetails.get(0);
				address = addressDetailsValues[0] + addressDetailsValues[1];
			}
			//System.out.println(contactDetailsValues[0]);

%>         
<!--         <tr>
          <td width="35%" height="30" align="right" class="style5"><div align="left">Items: &nbsp;</div></td>
          <td height="20" align="left" class="style3">
			<select class="style3" name = "claimItem" onchange = "otherItems()">
				<option value = "0">Select Item</option>
 -->
 <%
			
/*			for(int i = 0; i < claimItems.size(); i++)
			{
				String claimItemsValues[] = (String[]) claimItems.get(i);
*/
%>
 <%
//			}
%>
<!-- 				<option value = "others">Others</option>
		    </select>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<div id = "otherItem"></div>
			</td>
		</tr>
 -->		
		
		<tr>
			<td width="35%" height="30" align="left" class="style5">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Item / Claimant Name: &nbsp;</td>
		  <td height="20" align="left" class="style3"><input type="text" name="itemName" size= "26" class="style3"></td>
		  </tr>
        <tr>
		
		<tr>
			<td width="50%" height="30" align="left" class="style5">&nbsp;&nbsp;&nbsp;&nbsp;Description of Damaged Item / Incident: &nbsp;</td>
		  <td height="20" align="left" class="style3"><textarea name="itemDesc" rows = "4" size="26" class="style3"></textarea></td>
       </tr>
        <tr>

		<tr>
          <td height="50" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Date of Loss / Damage / Incident: </td>
		  <td height="20" align="left" class="style3"><input type="text" size= "26" name="damageDate" onfocus="showCalendarControl(this);" readonly class="style3"></td>
		  </tr>
        
		  <tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Cause of loss / Incident: </td>
		  <td height="20" align="left"  class="style3"><textarea name="damageCause" rows = "4" class="style3"></textarea></td>
        </tr>
        
		  <tr>
          <td height="50" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Probable & Estimated Loss / &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Damage Amount / Expenses: </td>
		  <td height="20" align="left" class="style3"><input type="text" name="damageAmount" size= "26" class="style3" ></td></tr>
        </tr>
        
		<tr>
          <td height="50" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Place of loss / Incident : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		  <td height="20" align="left" class="style3"><input type="text" size= "26" name="placeOfLoss" class="style3"></td>
        </tr>
		    </table>
		</td>

		<td>
		  <table cellspacing="0" cellpadding="0" width="400" border="0">
			   <tr>
				   <td height="50" align="left"  class="style5" color="#ffffff" >Particulars of the contact person for loss: </td>
				   <td height="20" align="left" class="style3">&nbsp;</td>
			  </tr>
		  <tr>
          <td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Name: &nbsp;</div></td>
          <td height="20" align="left" class="style3"><input type="text" size= "26" name="contactName" class="style3" value = "<%=title%> <%=firstName%> <%=lastName%>"></td>
        </tr>
        
           <tr>
			<td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Address:  &nbsp;&nbsp;&nbsp;</div></td>
          <td height="20" align="left" class="style3"><textarea name="contactAddress" rows = "4" class="style3"><%=address%></textarea></td>
        </tr>
         
		  <tr>
          <td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Phone No: &nbsp;&nbsp;</div></td>
          <td height="20" align="left" class="style3"><input type="text" size= "26" name="contactPhoneNo" size="26" class="style3" value = "<%=contactDetailsValues[0]%>"></td>
        </tr>
        
	      <tr>
          <td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Fax: &nbsp;</div></td>
          <td height="20" align="left" class="style3"><input type="text" size= "26" name="contactFaxNo" class="style3" value = "<%=contactDetailsValues[2]%>"></td>
        </tr>

        <tr>
          <td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Mobile No: &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</div></td>
          <td width="3" height="20" align="left" class="style3"><input type="text" id="contactMobileNo" name="contactMobileNo" size= "26" class="style3" value = "<%=contactDetailsValues[1]%>"></td>
        </tr>

		<tr>
          <td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Email Id: &nbsp;&nbsp;</div></td>
          <td height="20" align="left" class="style3"><input type="text" id="contactEmailId" name="contactEmailId" size= "26" class="style3" value = "<%=emailId%> "  ></td>
        </tr>

		<tr>
          <td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Department Name: &nbsp;&nbsp;</div></td>
          <td height="20" align="left" class="style3"><input type="text"  size= "26" class="style3" value = "<%=deptName%> " disabled ></td>
        </tr>

        <tr>
				   <td height="30" align="left"  class="style5" color="#ffffff">&nbsp; </td>
			   </tr>
			 <tr>
				   <td height="30" align="left"  class="style5" color="#ffffff">&nbsp; </td>
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
<input type = "hidden" name = "hidContactPhoneNo" value = "">
<input type = "hidden" name = "hidContactFaxNo" value = "">
<input type = "hidden" name = "hidSubmissionDate" value = "">