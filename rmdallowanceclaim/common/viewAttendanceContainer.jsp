<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
		<td class="small" bgcolor="#FFFFFF" width="30%" height="30">&nbsp;ATTENDANCE</td>
		<td class="onlybg" bgcolor="#FFFFFF" width="70%">
		<table>
			<tr>
				<td class="normal">
					Year <select name="fromYear" class="normal" id="fromYear" >
								<%= HtmlUtil.getYearList(lastYear, currYear, selYear,"desc")%>
							</select>
						Month <select name="fromMonth" class="normal" id="fromMonth">
								<%= HtmlUtil.getMonthList(selMonth)%>
							  </select>
							<!-- &nbsp;<a href="javascript:go( )"></a>
							<input type = "button" class = "button" value = "S E L E C T" onClick = "validateDate()"> -->
						<td class="onlybg" colspan = "3%"><img src="../images/spacer.gif" width="1" border="0"></td>
				  <td><a href="javascript:validateDate(document.getElementById('fromYear').value,document.getElementById('fromMonth').value,<%=empNumber%>);"><img src="../images/button_go.png" border="0"><a/></td>
				 </td>
			</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td colspan="100%" class="small" bgcolor="#E8E8E8"><img src="../images/spacer.gif" width="1" border="0"></td>
	</tr>
	<tr>
		<td colspan="100%"><div id="loadData"></div></td>
	</tr>
	<tr>
		<td colspan="100%" class="small" bgcolor="#E8E8E8"><img src="../images/spacer.gif" width="1" border="0"></td>
	</tr>
</table>

