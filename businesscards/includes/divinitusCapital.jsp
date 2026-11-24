<table width="394" height="238" border="0" cellpadding="0" cellspacing="0" background="../images/divinitusCapital.jpg" style ="background-repeat:no-repeat;">
  <tr>
    <th align="left"  scope="row"><table width="392" height="204" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="18" height="112" align="left" valign="top" scope="row">&nbsp;</td> 
           <td width="240"><p class="name">&nbsp;</p>
          <p class="name">&nbsp;</p>
           <p class="name"> <%=firstName1.toUpperCase()%>&nbsp;<%=lastName.toUpperCase()%><br />
            <span class="designation"><%=designation1.toUpperCase()%></span><br />
            <span class="designation"><%=workArea.toUpperCase()%></span></p>
        </td>
    
        <td width="114">&nbsp;</td>
      </tr>
      <tr>
        <th height="112" colspan="2" valign="bottom" scope="row"><div align="right">
          <p><span class="address"><%=compName.toUpperCase()%><br>
		  </span><span class="address"><%=addressLine1.toUpperCase()%><br><%=addressLine2.toUpperCase()%><br/>
            TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> EXTN:<%=extensionNumber%><br/>
          <!-- </span><span class="address">FAX : <%//=fax%> --> MOBILE  : <%=mobileNumber%><br/>
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