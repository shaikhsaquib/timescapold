<%
	firstName1		=	firstName1.toUpperCase();
	lastName		=	lastName.toUpperCase();
	designation1	=	designation1.toUpperCase();
	workArea		=	workArea.toUpperCase();
	compName		=	compName.toUpperCase();
%>
<table width="394" height="238" border="1" cellpadding="0" cellspacing="0" background="../images/110BPHCL2.jpg" style ="background-repeat:no-repeat;">
  <tr>
    <th align="left"  scope="row"><table width="393" height="236" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="19">&nbsp;</td>
        <td width="374">&nbsp;</td>
      </tr>
      <tr>
        <td height="115" >&nbsp;</td>
        <td class="ARTHA"><p><span class="ARTHA"><br />
          <br />
          <br />
		  <br />
		  <br /><BR>

		  <%=firstName1%>&nbsp;<%=lastName%></span><br />
          <span class="designation"><%=designation1%></span>
            <br />
          </p></td>
      </tr>
      <tr>
        <td >&nbsp;</td>
       <td class="address"><strong><%=compName%></strong><br />
          <%=addressLine1%><br />
<%	
		if ( addressLine2.lastIndexOf(",") > - 1 ) {
%>
		 <%=addressLine2.substring(0,addressLine2.lastIndexOf(","))%>,<br/>
		 <%=addressLine2.substring(addressLine2.lastIndexOf(",")+1)%><br/>
<%		
		  } else {
%>
			  <%=addressLine2%><br />
<%
		}
%>
		Tel: <%=directPhoneNo%> Mobile: <%=mobileNumber%><br />
					  <span class="email"><%=userEmail%></span></td>      
		</tr>
    </table></th>
  </tr>
</table>