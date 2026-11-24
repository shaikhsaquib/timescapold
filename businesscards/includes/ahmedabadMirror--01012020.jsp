<table width="394" height="238" border="0" cellpadding="0" cellspacing="0" background="../images/110ahmedabadMirror.jpg" style ="background-repeat:no-repeat;">
  <tr>
    <th align="left"  scope="row"><table width="392" height="204" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="201" valign="middle" scope="row"><div align="right">
          <p><span class="name"><br />
            <br />
            </span><span class="namereverse"><%=firstName1.toUpperCase()%>&nbsp;<%=lastName.toUpperCase()%><br />
            </span><span class="designationreverse"><%=designation1.toUpperCase()%></span><span class="style5"><br />
            <span class="designationreverse"><%=workArea.toUpperCase()%></span></span></p>
        </div></td>
        <td width="77">&nbsp;</td>
        <td width="114">&nbsp;</td>
      </tr>
      <tr>
        <th height="83" colspan="2" valign="bottom" scope="row"><div align="right">
          <p><span class="addressreverse"><%=compName.toUpperCase()%><br><%=addressLine1.toUpperCase()%><br/><%=addressLine2.toUpperCase()%><br />
  TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> EXTN:<%=extensionNumber%><br />
          FAX : <%=fax%> MOBILE  : <%=mobileNumber%><br />
         EMAIL :</span><span class="emailreverse"><%=userEmail%></span><br />
		 <%if (!website.equals("-")){%>
<span class="addressreverse">WEBSITE :</span><span class="emailreverse"><%=website%></span><br/>
		<%}%>
            </p>
          </div></th>
        <td>&nbsp;</td>
      </tr>
    </table></th>
  </tr>
</table>
