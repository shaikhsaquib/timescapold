<table width="394" height="238" border="0" cellpadding="0" cellspacing="0" background="../images/110arthaNew.jpg">
  <tr>
    <th align="left"  scope="row"><table width="100%" height="239" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="67" colspan="2" class="ARTHA">&nbsp;</td>
        <td width="28%">&nbsp;</td>
      </tr>
      <tr>
        <td width="3%" height="75">&nbsp;</td>
        <td width="69%"><table width="99%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="13%">&nbsp;</td>
            <td width="87%" class="ARTHA"><%=firstName1%>&nbsp;<%=lastName%><br />
              <span class="ARTHA2"><%=designation1%><BR><%=workArea%></span></td>
          </tr>
        </table></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="97">&nbsp;</td>
        <td colspan="2" class="ARTHA2"><strong><span class="ARTHA"><%=compName%></span><br />
          </strong><%=addressLine1%><br />
          <%=addressLine2.substring(0,addressLine2.lastIndexOf(","))%>,<br />
		  <%=addressLine2.substring(addressLine2.lastIndexOf(",")+1)%><br />
          Tel: <%=directPhoneNo%> Mobile: <%=mobileNumber%><br />
          <%=userEmail%></td>
      </tr>
    </table></th>
  </tr>
</table>