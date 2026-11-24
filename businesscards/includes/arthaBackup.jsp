<table width="394" height="238" border="0" cellpadding="0" cellspacing="0" background="../images/110artha.jpg">
  <tr>
  <tr>
    <th align="left"  scope="row"><table width="392" height="204" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="201" valign="middle" scope="row"><div align="right">
          <p><span class="ARTHA"><br /><br /><br />
            <br />
            <%=firstName1%>&nbsp;<%=lastName%></span><span class="style5"><br />
            </span><span class="ARTHA2"><%=designation1%></span><span class="style5"><br />
            <span class="ARTHA2"><%=workArea%></span></span></p>
        </div></td>
        <td width="77">&nbsp;</td>
        <td width="114">&nbsp;</td>
      </tr>
      <tr>
        <th height="83" colspan="2" valign="bottom" scope="row" class="ARTHA2"><div align="right">
          <p><span class="ARTHA"><%=compName%></span><br><%=addressLine1%><br><%=addressLine2%><br/>
            TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> EXTN:<%=extensionNumber%><br/>
          </span><span class="ARTHA2">FAX : <%=fax%> MOBILE  : <%=mobileNumber%><br/>
            EMAIL :</span><span class="ARTHA2"><%=userEmail%></span><br/>
		 <%if (!website.equals("-")){%>
			<span class="ARTHA2">WEBSITE :</span><span class="ARTHA2"><%=website%></span><br/>
		<%}%>
            </p>
          </div></th>
        <td>&nbsp;</td>
      </tr>
    </table></th>
  </tr>
</table>