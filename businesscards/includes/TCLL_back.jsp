<link href="style/tcl.css" rel="stylesheet" type="text/css" />
<%
/*String compCode = (String)request.getParameter("compCode");
String addressLine1 = (String)request.getParameter("addressLine1");
String addressLine2 = (String)request.getParameter("addressLine2");
String directPhoneNo = (String)request.getParameter("directPhoneNo");
String userBoardNumber = (String)request.getParameter("userBoardNumber");
String extensionNumber = (String)request.getParameter("extensionNumber");
String fax = (String)request.getParameter("fax");
String website = (String)request.getParameter("website");*/ //commented on 13-dec-2013 by sachin mehta due to error for TIL
%>
<table width="394" height="238" border="1" cellpadding="0" cellspacing="0" background="../images/TCLL_back.jpg" style ="background-repeat:no-repeat;">
  <tr >
    <th align="left" valign="top"  scope="row"><table width="100%" height="177" border="0">
      <tr>
        <td width="97%" height="67" align="left" valign="bottom">&nbsp;</td>
      </tr>
      <tr>
        <td height="60">&nbsp;</td>
      </tr>
	  <tr>
        <th align="center" valign="top" class="address" scope="row"><p class="address"><%=addressLine1.toUpperCase()%><br><%=addressLine2.toUpperCase()%><br /></p>
           TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> EXTN:<%=extensionNumber%><br/>
		  FAX : <%=fax%>  | <%=website%></th>
        </tr>
    </table>
     </th>
  </tr>
  
  
</table>
