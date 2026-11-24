<link rel="stylesheet" href="../style/newBCCL.css">
<%
 //String workareastr = workArea.toUpperCase();

%>
<table width="354" height="206" border="1" cellpadding="0" cellspacing="0" background="../images/bgSS.jpg" style ="background-repeat:no-repeat;" >
  <tr >
    <th width="482" height="204" align="left" valign="top"  scope="row"><table width="354" height="186" border="0">
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
        <td height="97">&nbsp;</td>
        <td width="28%">&nbsp;</td>
        <td width="68%"><p class="BCCLaddress"><%=compName%><br><%=addressLine1%><br><%=addressLine2%><br/>
            T:&nbsp;(D) <%=directPhoneNo%> (B) <%=userBoardNumber%> Ext:&nbsp;<%=extensionNumber%><br/>
           M: <%=mobileNumber%><br/>
           E: <%=userEmail%>
           <br />
		    <%if (!website.equals("-")){%>
			<span class="BCCLaddress">W:&nbsp;</span><span><%=website%></span><br/>
			<%}%></td>
      </tr>
    </table></th>
  </tr>
  
  
</table>
<p>&nbsp;</p>
