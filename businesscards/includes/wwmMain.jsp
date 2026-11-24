<link rel="stylesheet" href="../style/newBCCL.css">
<%
 //String workareastr = workArea.toUpperCase();

%>
<table width="354" height="206" border="1" cellpadding="0" cellspacing="0" background="../images/wwmfront.jpg" style ="background-repeat:no-repeat;" >
  <tr >
    <th width="482" height="204" align="left" valign="top"  scope="row">
	<table width="400" height="250" border="0">
      <!-- <tr>
        <td width="4%" height="83">&nbsp;</td>
        <td colspan="2" align="left" valign="bottom"><p class="BCCLname"><span class="BCCLname"><br />
         <%=firstName1%>&nbsp;<%=lastName%></span><strong><br />
            <span class="BCCLdesign"><%=designation1%><br />
               <%=workArea%></span></strong></p>
          <p><strong><br />
          </strong></p></td>
      </tr> -->
      <tr>
		<td colspan="2" align="left" valign="bottom">
			<p class="" style="margin-left: 13%;margin-bottom: 12%;font-family: Calibri;">
			<span class="BCCLname" style="color: #6b6969;" ><br />
			<%=firstName1%>&nbsp;<%=lastName%>
			</span><br />
            <span class="BCCLdesign" style="font-family: Calibri;" ><%=designation1%><br />
               <%=workArea%></span></p>
        </td>

        <td width="68%"><p class="BCCLaddress" style="margin-left: 38%;margin-top: 39%;font-family: Calibri;"><%=compName%><br><%=addressLine1%><br><%=addressLine2%><br/>
            T:&nbsp;(D) <%=directPhoneNo%> <br>(B) <%=userBoardNumber%> <!-- Ext: -->&nbsp;<%//=extensionNumber%><br/>
           M: <%=mobileNumber%><br/>
           E: <%=userEmail%>
           <br/>
		    <%if (!website.equals("-")){%>
			<span class="BCCLaddress">W:&nbsp;</span><span><%=website%></span><br/>
			<%}%>
		</td>
      </tr>

    </table>
	</th>
  </tr>
</table>
<p>&nbsp;</p>
