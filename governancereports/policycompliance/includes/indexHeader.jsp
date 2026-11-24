<%
String litecolor="#6699CC";
String darkcolor="#6699CC";
%>
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td rowspan="2" width="1%" valign="top" align="right" bgcolor="<%=litecolor%>" background="<%=Constants.COMMON_IMAGE_PATH%>rt_midimg.gif"><img src="<%=Constants.COMMON_IMAGE_PATH%>left_top_curve.gif" width="14" height="15"></td>
		<td colspan="2" bgcolor="#000000"><img src="<%=Constants.COMMON_IMAGE_PATH%>spacer.gif" width="1" height="3"></td>
		<td background="<%=Constants.COMMON_IMAGE_PATH%>lt_midimg.gif" rowspan="2" width="1%" valign="top" bgcolor="<%=darkcolor%>" align="right"><img src="<%=Constants.COMMON_IMAGE_PATH%>rt_top_curve.gif" width="14" height="14"></td>
	</tr>
		<tr>
		  <td colspan="2" bgcolor="<%=litecolor%>" height="34" class="whiteCopy" align="center">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
			  <tr>
				<td width="73%" valign="bottom" bgcolor="<%=darkcolor%>">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr bgcolor="<%=litecolor%>" align="right" valign="top">
					  <td colspan="3" class="normal"><img src="<%=Constants.COMMON_IMAGE_PATH%>travel_curve.gif" width="9" height="10"></td>
					</tr>
					<tr bgcolor="<%=litecolor%>" valign="top">
					  <td colspan="3" class="normal" height="15">
					  <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr bgcolor="<%=litecolor%>" valign="top">
						  <td colspan="3" class="normal">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
									  <td bgcolor="<%=litecolor%>" colspan="3" class="whitenormal" align="right" valign="baseline" height="20">
										<%=message%>
									  </td>
									</tr>
									<tr>
								  <td valign="top" height="20" align="left" bgcolor="#D8D8D8"><img src="<%=Constants.COMMON_IMAGE_PATH%>left.gif" width="9" height="10"></td>
									  <td bgcolor="#D8D8D8" class="normal" align="right">
											<span class="bold">company :</span>&nbsp;
											<%@ include file="../utils/companies.jsp" %>&nbsp;
											<span class="bold">pay id :</span>&nbsp;
											<input type="text" name="payId" size="10" maxlength="8" class="normal">&nbsp;
											<span class="bold">pin :</span>&nbsp;
											  <input type="password" name="pin" size="10"  class="normal" maxlength="250" onkeypress="submitViaEnter(window.event)">&nbsp;
											<a href="javascript:validate( )"><img src="<%=Constants.COMMON_IMAGE_PATH%>login.gif" align="absmiddle" border="0"></a>
											<img src="<%=Constants.COMMON_IMAGE_PATH%>spacer.gif" align="absmiddle" border="0">
										</td>
									  <td valign="top" height="20" align="right" bgcolor="#D8D8D8"><img src="<%=Constants.COMMON_IMAGE_PATH%>right.gif" width="9" height="10"></td>
									</tr>
							  </table>
							</td>
						</tr>
					  </table>
						</td>
					</tr>
				  </table>
				</td>
				<td bgcolor="<%=darkcolor%>" align="right" width="27%">
					<img src="<%=Constants.COMMON_IMAGE_PATH%>spacer.gif" width="141" height="37">
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
    <tr>
      <td width="1%" background="<%=Constants.COMMON_IMAGE_PATH%>rt_midimg.gif" height="2"><img src="<%=Constants.COMMON_IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
      <td height="4" width="54%"><img src="<%=Constants.COMMON_IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
      <td height="4" width="44%"><img src="<%=Constants.COMMON_IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
      <td align="right" width="1%" valign="top" background="<%=Constants.COMMON_IMAGE_PATH%>lt_midimg.gif" height="4"><img src="<%=Constants.COMMON_IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
    </tr>
  </table>
