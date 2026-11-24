<style>
.BCCLname {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 15px;
	font-style: normal;
	font-weight: bold;
    text-decoration: none;
	color: #C00;
}	
.BCCLdesign {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-style: normal;
	font-weight: bold;
    text-decoration: none;
	color: #666666;
}	
.BCCLaddress {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-style: normal;
	font-weight: bold;
    text-decoration: none;
	color: #666666;
}
</style>
<%
// String workareastr = workArea.toUpperCase();

%>
<table width="509" height="240" border="1" cellpadding="0" cellspacing="0" background="../images/bgNEW.jpg" style ="background-repeat:no-repeat;">
  <tr >
    <th height="288" align="left" valign="top"  scope="row"><table width="100%" height="274" border="0">
      <tr>
        <td width="4%" height="83">&nbsp;</td>
        <td colspan="2" align="left" valign="bottom"><p class="BCCLname"><span class="BCCLname"><br />
          <%=firstName1%>&nbsp;<%=lastName%></span><strong><br />
          <span class="BCCLdesign"><%=designation1%><br />
        <%=workArea%></span></strong></p>
          <p><strong><br />
          </strong></p></td>
        </tr>
      <tr>
        <td height="40">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
        </tr>
      <tr>
        <td height="118">&nbsp;</td>
        <td width="28%">&nbsp;</td>
        <td width="68%"><p class="BCCLaddress"><br />
          <%=compName%><br><%=addressLine1%><br><%=addressLine2%><br/>
           T:&nbsp;(D) <%=directPhoneNo%> (B) <%=userBoardNumber%> Ext:&nbsp;<%=extensionNumber%><br/>
           M: <%=mobileNumber%><br/>
           E: <%=userEmail%>
           <br />
		    <%if (!website.equals("-")){%>
			<span class="BCCLaddress">W:&nbsp;</span><span><%=website%></span><br/>
			<%}%>
          </p>
          <p><span class="TCLname"> <br />
      </span></p></td>
      </tr>
    </table></th>
  </tr>
  
  
</table>
<p>&nbsp;</p>
