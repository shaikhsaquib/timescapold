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
/*
			Object objArr[] = new Object[3];
			objArr[0] = "'DD-MON-YYYY'";
			objArr[1] = companyCode;
			objArr[2] = "'A'";

			Hashtable searchHash = new Hashtable();
			searchHash.put("queryId", "1000");
			searchHash.put("arguments", objArr);

			ArrayList claimItems = insuranceClaimController.searchClaimItems(searchHash);
*/
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
			<td width="35%" height="30" align="left" class="style5">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Item Name: &nbsp;</td>
		  <td height="20" align="left" class="style3"><input type="text" name="itemName" size= "26" class="style3"></td>
		  </tr>
        <tr>
		
		<tr>
			<td width="35%" height="30" align="left" class="style5">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Description of Damaged Item: &nbsp;</td>
		  <td height="20" align="left" class="style3"><textarea name="itemDesc" rows = "4" size="26" class="style3"></textarea></td>
       </tr>
        <tr>

		<tr>
          <td height="50" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Date of Loss / Damage: </td>
		  <td height="20" align="left" class="style3"><input type="text" size= "26" name="damageDate" onfocus="showCalendarControl(this);" readonly class="style3"></td>
		  </tr>
        
		  <tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Cause of loss: </td>
		  <td height="20" align="left"  class="style3"><textarea name="damageCause" rows = "4" class="style3"></textarea></td>
        </tr>
        
		  <tr>
          <td height="50" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Probable & Estimated Loss / &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Damage Amount: </td>
		  <td height="20" align="left" class="style3"><input type="text" name="damageAmount" size= "26" class="style3" ></td></tr>
        </tr>
        
		<tr>
          <td height="50" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Place of loss &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
          <td height="20" align="left" class="style3"><input type="text" size= "26" name="contactName" class="style3"></td>
        </tr>
        
           <tr>
			<td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Address:  &nbsp;&nbsp;&nbsp;</div></td>
          <td height="20" align="left" class="style3"><textarea name="contactAddress" rows = "4" class="style3"></textarea></td>
        </tr>
         
		  <tr>
          <td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Phone No: &nbsp;&nbsp;</div></td>
          <td height="20" align="left" class="style3"><input type="text" size= "26" name="contactPhoneNo" size="26" class="style3"></td>
        </tr>
        
	      <tr>
          <td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Fax: &nbsp;</div></td>
          <td height="20" align="left" class="style3"><input type="text" size= "26" name="contactFaxNo" class="style3"></td>
        </tr>

        <tr>
          <td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Mobile No: &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</div></td>
          <td width="3" height="20" align="left" class="style3"><input type="text" name="contactMobileNo" size= "26" class="style3"></td>
        </tr>

		<tr>
          <td height="30" align="left" class="style5"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Email Id: &nbsp;&nbsp;</div></td>
          <td height="20" align="left" class="style3"><input type="text" name="contactEmailId" size= "26" class="style3"></td>
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