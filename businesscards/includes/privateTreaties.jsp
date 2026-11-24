<table width="394" height="232" border="0" cellpadding="0" cellspacing="0" background="../images/110privateTreaties.jpg" style ="background-repeat:no-repeat;">
  <tr>
    <th align="left"  scope="row"><table width="392" height="232" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="31" height="84" valign="middle" scope="row"><div align="right">
          <p><span class="name"><br />
            <br />
            &nbsp;</span><span class="style5"><br />
            </span><span class="style5"><br />
            </span></p>
        </div></td>
        <td width="247"><span class="name"><br />
	    <br /><br/>	<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%=firstName1.toUpperCase()%>&nbsp;<%=lastName.toUpperCase()%><br />
          <span class="designation"><%=designation1.toUpperCase()%><br />
          <%=workArea.toUpperCase()%></span></span></td>
        <td width="114">&nbsp;</td>
      </tr>
      <tr>
        <th height="83" colspan="2" valign="bottom" scope="row"><div align="right">
          <p><span class="address"><%=compName.toUpperCase()%><br><%=addressLine1.toUpperCase()%><br><%=addressLine2.toUpperCase()%><br/>
            TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> EXTN:<%=extensionNumber%><br/>
          </span><span class="address">FAX : <%=fax%> MOBILE  : <%=mobileNumber%><br/>
            EMAIL :</span><span class="email"><%=userEmail%></span><br/>
		 <%if (!website.equals("-")){%>
			<span class="address">WEBSITE :</span><span class="email"><%=website%></span><br/>
		<%}%>
            </p>
          </div></th>
        <td>&nbsp;</td>
      </tr>
    </table></th>
  </tr>
</table>
