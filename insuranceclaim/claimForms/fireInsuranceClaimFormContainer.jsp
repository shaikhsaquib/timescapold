<%
	GregorianCalendar thisDay = new GregorianCalendar( );
	String date = "";
	String month = Integer.toString(thisDay.get(Calendar.MONTH));
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
%>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg.png">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
        <tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="left" bgcolor="#05B1C7" height="30"><div align="center"><span class="style5Copy">THE ORIENTAL INSURANCE COMPANY LIMITED </span></div></td>
        </tr>
        <tr>
          <td><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        
        <tr>
          <td align="left" bgcolor="#cccccc" height="1"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style7">(Incorporated in India, subsidiary of General Insurance Corporation of India) </span></div></td>
        </tr>
		 <tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style3">Head Office: A-25/27, Asaf Ali Road, New Delhi-110 002 </span></div></td>
        </tr>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">FIRE INSURANCE CLAIM FORM</span></div></td>
        </tr>
		</tbody></table>
		<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg.png">
		<tbody>
        <tr>
          <td align="left" bgcolor="#FFFFFF" height="20"><div align="center"><span class="style5">CLAIM UNDER FIRE POLICY</span></div></td>
        </tr>
    </table>

      <table cellspacing="0" cellpadding="0" width="700" border="0">
		  <tr>
          <td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
        <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">1. State the day of the week: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3">
			<select name = "weekDay" class="style3" >
				<option value = "Monday" selected>Monday</option>
				<option value = "Tuesday">Tuesday</option>
				<option value = "Wednesday">Wednesday</option>
				<option value = "Thusday">Thusday</option>
				<option value = "Friday">Friday</option>
				<option value = "Saturday">Saturday</option>
				<option value = "Sunday">Sunday</option>
			</select>
        </tr>
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 2. State the room or place where the fire originated: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="area" cols="35" class="style3"></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 3. Insert description of premises e.g. Dwelling house, Grocer’s <br>&nbsp;&nbsp;&nbsp;&nbsp;Shop, Cotton Mill etc: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="areaDesc" cols="35" class="style3"></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 4. State by what means the fire is supposed to have been caused: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="fireCause" cols="35" class="style3"></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 5. State the nature of any other interest
			eg. Mortgagee, Leassee, Purchaser on Deposit etc: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="otherInterest" cols="35" class="style3"></textarea>  </td>
        </tr>
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr>
</table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
        <tr>
          <td  height="30" align="right" class="style4"><div align="left">6. Insurances affected on the said property. (If there are other insurance(except ORIENTAL), full copies of all policies must <br>&nbsp;&nbsp;&nbsp;&nbsp;be attached):</div></td>
        </tr>
</table>

	<table cellspacing="0" cellpadding="0" width="700" border="0">
	  <tr><br></td></tr>
		<tr >
			<td width="3%">&nbsp;</td>
			<td bgcolor="#E0E0E0" width="30%" height="30" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount:</div></td>
			<td bgcolor="#E0E0E0" width="15%" height="30" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Company:</div></td>
			<td bgcolor="#E0E0E0" width="30%" height="30" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Policy:</div></td>
			<td width="40%">&nbsp;</td>
		</tr>
		<tr>
			<td class="style3">1.</td>
			<td width="15%" height="50" valign="top" align="left" class="style3"> <br>
			 <input type="text" name="ammount1" class="style3" size="17"></td>
			<td height="50" valign="top" class="style3"><div align="left"><br><textarea cols="30" name="company1" class="style3"></textarea></div></td>
			<td height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea cols="30" name="policy1" class="style3"></textarea></div></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="style3">2.</td>
			<td height="50" valign="top"align="left" class="style3"><br>
			<input type="text" name="ammount2" class="style3" size="17"></td>
			<td width="15%" height="50" valign="top" class="style3"><div align="left"><br>
			<textarea cols="30" name="company2" class="style3"></textarea></div></td>
			<td width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea cols="30" name="policy2" class="style3"></textarea></div></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="style3">3.</td>
			<td height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <input type="text" name="ammount3" class="style3" size="17"></div></td>
			<td width="15%" height="50" valign="top" class="style3"><div align="left"><br><textarea cols="30" name="company3" class="style3"></textarea></div></td>
			<td width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea cols="30" name="policy3" class="style3"></textarea></div></td>
			<td>&nbsp;</td>
		</tr>
		</tbody></table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>
		<tr>
          <td height="1" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td  height="40" align="right" class="style4"><div align="left">7. Details of claim for property destroyed or damaged (A Fire Policy being a contract of INDEMNITY only, all claims must be <br>&nbsp;&nbsp;&nbsp;&nbsp;based upon the actual value of the goods at the time of the Fire no trade profit whatever being included in the claim) :</div></td>
        </tr>
</table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
	  <tr><br></tr>
		<tr bgcolor="#E0E0E0">
			<th colspan="4" width="30%"height="50" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Description of the article claimed:</div></td>
			<!-- <td><input type="text" name="make" class="style3" size="26"></td> -->
			<th colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left">Value at the time of fire:</div></td>
			<th colspan="4" width="20%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Deduction for
			value of &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Salvage:</div></td>
			<th colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount claimed i.e. actual loss &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;after deduction of salvage value:</div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br>1. 
			 <textarea cols="30" name="claimedArticle1" class="style3"></textarea> </div></td>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue1" class="style3" size="17"></div></td>
			<td colspan="4" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue1" class="style3" size="17"></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount1" class="style3" size="17"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br>2. 
			 <textarea cols="30" name="claimedArticle2" class="style3"></textarea> </div></td>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue2" class="style3" size="17"></div></td>
			<td colspan="4" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue2" class="style3" size="17"></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount2" class="style3" size="17"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br>3. 
			 <textarea cols="30" name="claimedArticle3" class="style3"></textarea> </div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue3" class="style3" size="17"></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue3" class="style3" size="17"></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount3" class="style3" size="17"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br>4. 
			 <textarea cols="30" name="claimedArticle4" class="style3"></textarea> </div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue4" class="style3" size="17"></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue4" class="style3" size="17"></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount4" class="style3" size="17"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%"height="60" valign="top"align="left" class="style3"><div align="left"><br>5. 
			 <textarea cols="30" name="claimedArticle5" class="style3"></textarea> </div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue5" class="style3" size="17"></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue5" class="style3" size="17"></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount5" class="style3" size="17"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
</table>

 <table cellspacing="0" cellpadding="0" width="700" border="0">
        <tr>
          <td height="20" colspan="100" align="center" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
</table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tr>
		<td height="30" colspan="2" align="right" class="style5"><div align="left">I/we the above named do hereby, to the best of my/our knowledge and belief, warrant the truth of the foregoing statement every respect. I/we also further declare that the insurances affected on the said property mentioned in point 6 are true and complete.</div></td>
		</tr>
</table>



<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value="<%=date%>"> </td>
		 </tr>		 
</table>

  <table cellspacing="0" cellpadding="0" width="700" border="0">
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
		</table>
	<table width="250" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "fire_validate()">Preview
           </td>
		   <td align="center" class="blueButton" style="height:40px;"> &nbsp;Reset&nbsp;</td>
        </tr>
	</table> 
<table cellspacing="0" cellpadding="0" width="700" border="0">
        <tr>
          <td height="20" colspan="100" align="center" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
	</table>
<%
	String claimNumber = (String)request.getParameter("claimNumber");
	String requestNo = (String)request.getParameter("requestNo");

%>
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "submitClaim">
