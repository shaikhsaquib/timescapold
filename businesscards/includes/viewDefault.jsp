<link href="style/tcl.css" rel="stylesheet" type="text/css" />
<%
 //firstName1 = (String)request.getParameter("firstName");
String lastName1 = (String)request.getParameter("lastName");
String mobileNumber1 = (String)request.getParameter("mobileNumber");
String emailId1 = (String)request.getParameter("emailId");
String companyName1  = (String)request.getParameter("compName");

//out.println("cardTemplate -> "+cardTemplate);


if(cardTemplate.equals("TML")){%>
<table width="394" height="238" border="1" cellpadding="0" cellspacing="0" background="../images/back-6.jpg" style ="background-repeat:no-repeat;">
 <tr >
    <th align="left" valign="top"  scope="row"><table width="100%" height="177" border="0">
      <tr>
        <td width="97%" height="67" align="left" valign="bottom">&nbsp;</td>
      </tr>
      <tr>
        <td height="33">&nbsp;</td>
      </tr>
	  <tr>
        <th align="center" valign="top" class="whitenormal" scope="row"></p></th>
        </tr>
    </table>
     </th>
  </tr>
</table>
<%}else if(cardTemplate.equals("TMDT")){%>
<table width="394" height="238" border="1" cellpadding="0" cellspacing="0" background="../images/back-6.jpg" style ="background-repeat:no-repeat;">
 <tr >
    <th align="left" valign="top"  scope="row"><table width="100%" height="177" border="0">
      <tr>
        <td width="97%" height="67" align="left" valign="bottom">&nbsp;</td>
      </tr>
      <tr>
        <td height="33">&nbsp;</td>
      </tr>
	  <tr>
        <th align="center" valign="top" class="whitenormal" scope="row"></p></th>
        </tr>
    </table>
     </th>
  </tr>
</table>
<%}else if(cardTemplate.equals("TCLL")){%>
<table width="394" height="238" border="1" cellpadding="0" cellspacing="0" background="../images/TCLL_back.jpg" style ="background-repeat:no-repeat;">
<tr >
    <th align="left" valign="top"  scope="row"><table width="100%" height="177" border="0">
      <tr>
        <td width="97%" height="67" align="left" valign="bottom">&nbsp;</td>
      </tr>
      <tr>
        <td height="33">&nbsp;</td>
      </tr>
	  <tr>
        <th align="center" valign="top" class="whitenormal" scope="row"><p class="whitenormal"><%=addressLine1%><br><%=addressLine2%></p>
           <p class="whitenormal">TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> EXTN:<%=extensionNumber%><br/>
		  FAX : <%=fax%>  | <%=website%></p></th>
        </tr>
    </table>
     </th>
  </tr>
</table>
<%}else if(((cardTemplate.equals("TG")) || (cardTemplate.equals("TGR")) || (!cardTemplate.equals("LH")) )&& (!cardTemplate.equals("WWM"))){
	%>
 <table width="354" height="206" border="1" cellpadding="0" cellspacing="0" background="../images/backSS.jpg" style ="background-repeat:no-repeat;">
 <tr >
    <th align="left" valign="top"  scope="row"><table width="100%" height="177" border="0">
      <tr>
        <td width="97%" height="67" align="left" valign="bottom">&nbsp;</td>
      </tr>
      <tr>
        <td height="33">&nbsp;</td>
      </tr>
	  <tr>
        <th align="center" valign="top" class="whitenormal" scope="row"></p></th>
        </tr>
    </table>
     </th>
  </tr>
</table> 
<%}else if((cardTemplate.equals("WWM"))){
	%>
 <table width="410" height="250" border="1" cellpadding="0" cellspacing="0" background="../images/wwmback.jpg" style ="background-repeat:no-repeat;">
 <tr >
    <th align="left" valign="top"  scope="row"><table width="100%" height="177" border="0">
      <tr>
        <td width="97%" height="67" align="left" valign="bottom">&nbsp;</td>
      </tr>
      <tr>
        <td height="33">&nbsp;</td>
      </tr>
	  <tr>
        <th align="center" valign="top" class="whitenormal" scope="row"></p></th>
        </tr>
    </table>
     </th>
  </tr>
</table> 

<%}else if(cardTemplate.equals("BE")){%>
  <table width="354" height="100" border="1" cellpadding="0" cellspacing="0" background="../images/110BC_Front.jpg" style ="background-repeat:no-repeat;">
  <tr>
    <th align="left"  scope="row"><table width="353" height="190" border="0" align="left" cellpadding="5" cellspacing="0">
      <tr>
        <td width="18" height="" align="left" valign="top" scope="row">&nbsp;</td> 
           <!-- <td width="240"> --><!-- <p class="name">&nbsp;</p> -->
          <!-- <p class="name">&nbsp;</p> -->
		  
    
        <td width="360" height = "">&nbsp;</td>
        </tr>
		<th height="" colspan="2" valign="bottom" scope="row"><div style="width: 100%; text-align: center;">
		<p class="BCCLname"> <%=firstName1.toUpperCase()%>&nbsp;<%=lastName.toUpperCase()%><br />
            <span class="designation"><%=designation1%></span>
            <span class="designation"><%=workArea%></span></p>

          <p><span class="address"><%=compName.toUpperCase()%><br>
		  </span><span class="address"><%=addressLine1.toUpperCase()%><br><%=addressLine2.toUpperCase()%><br/>
            TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> <br>EXTN:<%=extensionNumber%>
          <!-- </span><span class="address">FAX : <%//=fax%> --> MOBILE : <%=mobileNumber%><br>
            </span><span class="email"><%=userEmail%></span><br/>
		 <%//if (!website.equals("-")){%>
			<!-- <span class="address">WEBSITE :</span><span class="email"><%//=website%></span><br/> -->
		<%//}%>
            </p>
          </div></th>
        <td>&nbsp;</td>
      </tr>
</table></th>
  </tr>
</table>

<%}else if(cardTemplate.equals("SB")){%>
 <table width="354" height="100" border="1" cellpadding="0" cellspacing="0" background="../images/110BC_Front.jpg" style ="background-repeat:no-repeat;">
  <tr>
    <th align="left"  scope="row"><table width="353" height="190" border="0" align="left" cellpadding="5" cellspacing="0">
      <tr>
        <td width="18" height="" align="left" valign="top" scope="row">&nbsp;</td> 
           <!-- <td width="240"> --><!-- <p class="name">&nbsp;</p> -->
          <!-- <p class="name">&nbsp;</p> -->
		  
    
        <td width="360" height = "">&nbsp;</td>
        </tr>
		<th height="" colspan="2" valign="bottom" scope="row"><div style="width: 100%; text-align: center;">
		<p class="BCCLname"> <%=firstName1.toUpperCase()%>&nbsp;<%=lastName.toUpperCase()%><br />
            <span class="designation"><%=designation1%></span>
            <span class="designation"><%=workArea%></span></p>

          <p><span class="address"><%=compName.toUpperCase()%><br>
		  </span><span class="address"><%=addressLine1.toUpperCase()%><br><%=addressLine2.toUpperCase()%><br/>
            TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> <br>EXTN:<%=extensionNumber%>
          <!-- </span><span class="address">FAX : <%//=fax%> --> MOBILE : <%=mobileNumber%><br>
            </span><span class="email"><%=userEmail%></span><br/>
		 <%//if (!website.equals("-")){%>
			<!-- <span class="address">WEBSITE :</span><span class="email"><%//=website%></span><br/> -->
		<%//}%>
            </p>
          </div></th>
        <td>&nbsp;</td>
      </tr>
</table></th>
  </tr>
</table>
<%}else if(cardTemplate.equals("BS")){%>
  <table width="354" height="100" border="1" cellpadding="0" cellspacing="0" background="../images/110BC_Front.jpg" style ="background-repeat:no-repeat;">
  <tr>
    <th align="left"  scope="row"><table width="353" height="190" border="0" align="left" cellpadding="5" cellspacing="0">
      <tr>
        <td width="18" height="" align="left" valign="top" scope="row">&nbsp;</td> 
           <!-- <td width="240"> --><!-- <p class="name">&nbsp;</p> -->
          <!-- <p class="name">&nbsp;</p> -->
		  
    
        <td width="360" height = "">&nbsp;</td>
        </tr>
		<th height="" colspan="2" valign="bottom" scope="row"><div style="width: 100%; text-align: center;">
		<p class="BCCLname"> <%=firstName1.toUpperCase()%>&nbsp;<%=lastName.toUpperCase()%><br />
            <span class="designation"><%=designation1%></span>
            <span class="designation"><%=workArea%></span></p>

          <p><span class="address"><%=compName.toUpperCase()%><br>
		  </span><span class="address"><%=addressLine1.toUpperCase()%><br><%=addressLine2.toUpperCase()%><br/>
            TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> <br>EXTN:<%=extensionNumber%>
          <!-- </span><span class="address">FAX : <%//=fax%> --> MOBILE : <%=mobileNumber%><br>
            </span><span class="email"><%=userEmail%></span><br/>
		 <%//if (!website.equals("-")){%>
			<!-- <span class="address">WEBSITE :</span><span class="email"><%//=website%></span><br/> -->
		<%//}%>
            </p>
          </div></th>
        <td>&nbsp;</td>
      </tr>
</table></th>
  </tr>
</table>
<%}else if(cardTemplate.equals("BC")){%>
 <table width="354" height="100" border="1" cellpadding="0" cellspacing="0" background="../images/110BC_Front.jpg" style ="background-repeat:no-repeat;">
  <tr>
    <th align="left"  scope="row"><table width="353" height="190" border="0" align="left" cellpadding="5" cellspacing="0">
      <tr>
        <td width="18" height="" align="left" valign="top" scope="row">&nbsp;</td> 
           <!-- <td width="240"> --><!-- <p class="name">&nbsp;</p> -->
          <!-- <p class="name">&nbsp;</p> -->
		  
    
        <td width="360" height = "">&nbsp;</td>
        </tr>
		<th height="" colspan="2" valign="bottom" scope="row"><div style="width: 100%; text-align: center;">
		<p class="BCCLname"> <%=firstName1.toUpperCase()%>&nbsp;<%=lastName.toUpperCase()%><br />
            <span class="designation"><%=designation1%></span>
            <span class="designation"><%=workArea%></span></p>

          <p><span class="address"><%=compName.toUpperCase()%><br>
		  </span><span class="address"><%=addressLine1.toUpperCase()%><br><%=addressLine2.toUpperCase()%><br/>
            TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> <br>EXTN:<%=extensionNumber%>
          <!-- </span><span class="address">FAX : <%//=fax%> --> MOBILE : <%=mobileNumber%><br>
            </span><span class="email"><%=userEmail%></span><br/>
		 <%//if (!website.equals("-")){%>
			<!-- <span class="address">WEBSITE :</span><span class="email"><%//=website%></span><br/> -->
		<%//}%>
            </p>
          </div></th>
        <td>&nbsp;</td>
      </tr>
</table></th>
  </tr>
</table>
<%}else if(!cardTemplate.equals("LH")){%>

<table width="394" height="238" border="1" cellpadding="0" cellspacing="0" background="../images/backSS.jpg" style ="background-repeat:no-repeat;">
<tr >
    <th align="left" valign="top"  scope="row"><table width="100%" height="177" border="0">
      <tr>
        <td width="97%" height="67" align="left" valign="bottom">&nbsp;</td>
      </tr>
      <tr>
        <td height="33">&nbsp;</td>
      </tr>
	  <tr>
        <th align="center" valign="top" class="whitenormal" scope="row"><p class="whitenormal"><%=addressLine1%><br><%=addressLine2%></p>
           <p class="whitenormal">TEL: (D) <%=directPhoneNo%> (B) <%=userBoardNumber%> EXTN:<%=extensionNumber%><br/>
		  FAX : <%=fax%>  | <%=website%></p></th>
        </tr>
    </table>
     </th>
  </tr>
</table>
<%}%>
 
