<tr>
	   <td colspan = "3" class = "small" height="30"><span class = "bold">
			<span class="boldsmall">Note<br>
			<span class="bold">-</span>&nbsp;<span class = "bold">All fields marked with <img src="../images/tickmark.gif" width="13" height="13"/> are mandatory but editable.</span><br>
		</td>
</tr>

<tr>
	<td width="30%" class="boldsmall" align="right" height="30">&nbsp;First Name</td>
	<td width="5%" class="boldsmall" align="center" height="30">:</td>
	<td width="65%" class="small" align="left" height="30">
		<%=fstName%>
	</td>
</tr>
	<input type="hidden" name="firstName" value="<%=fstName%>"/> 
<tr>
	<td width="30%" class="boldsmall" align="right" height="30">&nbsp;Last Name</td>
	<td width="5%" class="boldsmall" align="center" height="30">:</td>
	<td width="65%" class="small" align="left" height="30"><%=lstName%>
	</td>
</tr>
	 <input type="hidden" name="lastName" value="<%=lstName%>"/>
<tr>
	<td width="30%" class="boldsmall" align="right" height="30">&nbsp;Direct PhoneNo 1</td>
	<td width="5%" class="boldsmall" align="center" height="30">:</td>
	<td width="65%" class="small" align="left" height="30">
		<input type="text" name="directNumber" value="<%=directPhoneNo%>" maxlength="20" size="20" class="small"><img src="../images/tickmark.gif" width="13" height="13"/> (e.g. 91-22-56354548)
	</td>
</tr>

<tr>
	<td width="30%" class="boldsmall" align="right" height="30">&nbsp;Direct PhoneNo 2</td>
	<td width="5%" class="boldsmall" align="center" height="30">:</td>
	<td width="65%" class="small" align="left" height="30">
		<input type="text" name="directNumber2" value="<%=directPhoneNo1%>"  maxlength="20" size="20" class="small"> (e.g. 91-22-56354548)
	</td>
</tr>

<tr>
	<td width="30%" class="boldsmall" align="right" height="30">&nbsp;Board Number</td>
	<td width="5%" class="boldsmall" align="center" height="30">:</td>
	<td width="65%" class="small" align="left" height="30">
		<input type="text" name="boardNumber" value="<%=boardNumber%>"  maxlength="20" size="20" class="small"><img src="../images/tickmark.gif" width="13" height="13"/> (e.g. 91-22-56353535)
	</td>
</tr>

<tr>
	<td width="30%" class="boldsmall" align="right" height="30">&nbsp;Fax Number</td>
	<td width="5%" class="boldsmall" align="center" height="30">:</td>
	<td width="65%" class="small" align="left" height="30">
		<input type="text" name="faxNumber" value="<%=faxNumber%>"  maxlength="20" size="20" class="small"> (e.g. 91-22-2731218)
	</td>
</tr>

<tr>
	<td width="30%" class="boldsmall" align="right" height="30">&nbsp;Extension Number</td>
	<td width="5%" class="boldsmall" align="center" height="30">:</td>
	<td width="65%" class="small" align="left" height="30">
		<input type="text" name="extensionNumber" value="<%=extensionNumber%>"  maxlength="6" size="20" class="small"><img src="../images/tickmark.gif" width="13" height="13"/> (e.g. 4197)
	</td>
</tr>

<!-- <tr>
	<td width="30%" class="boldsmall" align="right" height="30">&nbsp;Hotline</td>
	<td width="5%" class="boldsmall" align="center" height="30">:</td>
	<td width="65%" class="small" align="left" height="30">
		<input type="text" name="hotline" size="20" value="<%//=hotline%>" maxlength="6" class="small"> (e.g. 2654)
	</td>
</tr> -->

<tr>
	<td width="30%" class="boldsmall" align="right" height="30">&nbsp;Mobile Number</td>
	<td width="5%" class="boldsmall" align="center" height="30">:</td>
	<td width="65%" class="small" align="left" height="30">
	 <input type="text" name="mobileNumber" value="<%=mobileNumber%>"  maxlength="20" size="20" class="small"><img src="../images/tickmark.gif" width="13" height="13"/>(e.g. 91-9892212345)
	</td>

</tr>

<tr>
	<td width="30%" class="boldsmall" align="right" height="30">&nbsp;Residence Number</td>
	<td width="5%" class="boldsmall" align="center" height="30">:</td>
	<td width="65%" class="small" align="left" height="30">
		<input type="text" name="residenceNumber" value="<%=residencePhoneNumber%>" maxlength="20" size="20" class="small">  (e.g. 91-22-56354548)
	</td>
</tr>

<tr>
	<td colspan="3" class="small">&nbsp;</td>
</tr>
<tr>
	<td colspan="3" class="small" align="center">
		<a href="javascript:validate( )"><img src="../images/but_submit.gif" border="0"></a>
		<a href="javascript:clear( )"><img src="../images/but_reset.gif" border="0"></a>
	</td>
</tr>