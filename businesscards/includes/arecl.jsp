<%
	firstName1		=	firstName1.toUpperCase();
	lastName		=	lastName.toUpperCase();
	designation1	=	designation1.toUpperCase();
	workArea		=	workArea.toUpperCase();
	compName		=	compName.toUpperCase();
%>
<link href="style/global.css" rel="stylesheet" type="text/css" />
<table width="238" height="238" border="0" cellpadding="0" cellspacing="0"  background="../images/Artha_bg.jpg">
  <tr>
    <th align="left"  scope="row"><table width="238" height="348" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="19">&nbsp;</td>
        <td width="236">&nbsp;</td>
      </tr>
      <tr>
        <td height="100" >&nbsp;</td>
        <td class="ARTHA"><p><span class="ARTHA"><br />
          <br />
          <br />
         <%=firstName1%>&nbsp;<%=lastName%></span><br />
          <span class="designation"><%=designation1%><br />
         </span><br />
            <br />
          </p></td>
      </tr>
      <tr>
        <td height="219" >&nbsp;</td>
        <td align="left" valign="top" class="addressBPHCL"><p><strong><br />
          <br />
        </strong><strong><br />
            <br />
            </strong></p>
          <table width="132" height="98" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td><span class="bold">Artha Real Estate<br />
				Corporation Limited</span><span class="boldsmall"><br />
               <span class="address"><%=addressLine1%>
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
		Tel: <%=directPhoneNo%><br /> Mobile: <%=mobileNumber%><br />
					 <%=userEmail%>  </span></td>
            </tr>
        </table></td>
      </tr>
    </table></th>
  </tr>
</table>