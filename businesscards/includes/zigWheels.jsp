<style type="text/css">
</style>
<link href="style/TIL.css" rel="stylesheet" type="text/css" />
<table width="394" height="225" border="1" cellpadding="0" cellspacing="0" background="../images/zigwheels.jpg"  style ="background-repeat:no-repeat;">
  <tr>
    <th align="left"  scope="row"><table width="394" height="236" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="middle" scope="row">&nbsp;</td>
        <td height="86" valign="middle" class="bigblue" scope="row">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="11" valign="middle" scope="row">&nbsp;</td>
        <td width="210" height="40" valign="middle" class="bigblue" scope="row"><p><strong class="bold1"><em></em></strong> <span class="name"><%=firstName1.toUpperCase()%>&nbsp;<%=lastName.toUpperCase()%></span><strong class="bold1"><em> </em></strong><br />
            <span class="designation"><%=designation1.toUpperCase()%></span><br />
            <span class="email">MOBILE  : <%=mobileNumber%><br />
			<span class="email"><%=userEmail%> </span><br />
<%
            if (!website.equals("-"))
            {
%>
             <span class="email"><%=website%></span><br/>
              </span><br />
<%
            }
%>

              </span><br />
      </p></td>
       <td width="27">&nbsp;</td>
        <td width="179">&nbsp;</td>
        <td width="18">&nbsp;</td>
		</tr>
	<tr>
        <th height="32" colspan="4" align="center" valign="top" class="address" scope="row"><img src="../images/TILlogo.png" width="178" height="32" /></th>
        <th height="32" valign="bottom" scope="row">&nbsp;</th>
      </tr>
<tr>
        <th height="48" colspan="4" align="center" valign="top" class="address" scope="row"><p class="address"><%=compName.toUpperCase()%>,&nbsp;<%=addressLine1.toUpperCase()%>&nbsp;
           <%=addressLine2.toUpperCase()%><br />
           TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> EXTN:<%=extensionNumber%><br/>
		  FAX : <%=fax%></th>
        <th height="48" valign="bottom" scope="row">&nbsp;</th>
        </tr>
    </table></th>
  </tr>
</table> 