 <table cellspacing="0" cellpadding="0" width="800" align="center" bgcolor="#ffffff" border="0">
      <tbody>
        <tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td height="20" align="left" background="../images/red_shadow.jpg" bgcolor="#666666"><div align="center"><span class="style5Copy">view &nbsp;status</span></div></td>
        </tr>
        <tr>
          <td><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="left" height="26"><table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tbody>
              <tr>
                <td align="left" colspan="3" height="26"><div align="right"><span class="menu1"><img src="../images/inProcess.png" width="20" height="20" /></span><span class="style3">In Process | <img src="../images/unitApproved.png" width="20" height="20" />Recommended   | <img src="../images/depApproved.png" width="20" height="20" />Recommended | <img src="../images/finalised.png" width="20" height="20" />Approved</span></div></td>
              </tr>
              <tr>
                <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="spacer.gif" width="1" /></td>
              </tr>
              <tr>
                <td height="26" colspan="3" align="left" class="style3">Note   -&nbsp;Once recommended<span class="menu1"> <img src="../images/depApproved.png" width="20" height="20" /></span> the Project is sent for approval.</td>
              </tr>
            </tbody>
          </table></td>
        </tr>

        <tr>
          <td align="left" height="26"><table width="800" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
            <tr>
              <td width="49" height="24" class="headBox"><div align="left">P. ID</div></td>
              <td width="112" class="headBox"><div align="left">Project Name</div></td>
              <td width="115" class="headBox"><div align="left"><span class="menu2">Submitted On </span></div></td>
              <td width="129" class="headBox"><div align="left"><span class="menu2">Recommended by</span></div></td>
              <td width="155" class="headBox"><div align="left"><span class="menu2">Recommended by</span></div></td>
              <td width="146" class="headBox"><div align="left"><span class="menu2">Approved by</span></div></td>
              <td width="78" class="headBox"><div align="center"><span class="menu2">Status</span></div></td>
              </tr>

<%

		if(requestList!=null && requestList.size()>0)
		{
			for (int i = 0; i < requestList.size(); i++)
			{
				String requestDetail[] = (String[]) requestList.get(i);

				Hashtable requestDetailHash = xmlObj.readSubNode(requestDetail[1], "reqDetails");

				String recommendedBy1 = requestDetail[23];
				String recommendedBy2 = requestDetail[24];
				String modifiedBy = requestDetail[25];
				String status = requestDetail[3];

				
			
%>
            <tr>

					<td class = "style3Underline" height = "20" align = "left">
					<a href="javascript:void window.open('../common/checkRequestDetails.jsp?projectId=<%=requestDetail[0]%>','','resizable=yes,toolbars=no,scrollbars=yes,width=850,height=600,top=50,left=50')" 			
					class="style3Underline"><%=requestDetail[0]%></a></td>
					<td class = "style3" height = "20" align = "left"><%=requestDetailHash.get("project-")%>
					<td class = "style3" height = "20" align = "left"><%=requestDetail[2]%></a></td>
					<td class = "style3" height = "20" align = "left"><%=modifiedBy.equals(recommendedBy1)&& ("R".equals(status)||"RR".equals(status))? recommendedBy1 : "-"%></td></td>
					<td class = "style3" height = "20" align = "left"><%=modifiedBy.equals(recommendedBy2)&& ("R".equals(status)||"RR".equals(status))? recommendedBy2 : "-"%></td></td>
					<td class = "style3" height = "20" align = "left"><%="A".equals(status)? requestDetail[19] : "-"%></td>
					<td class = "style3" height = "20" align = "center"><img src="../images/<%=(String)requestStatus.get(requestDetail[3])%>" width="20" height="20" /></td>

            <tr>
              <td colspan="7" bgcolor="#E3DDDD"><div align="left"><span class="style3"><img src="../images/spacer.gif" width="1" height="1" /></span></div></td>
            </tr>
  <%
			}
		}else{
%>         
          </table></td>
        </tr>
        <tr>
          <td bgcolor="#cccccc" height="1"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="left" bgcolor="#FFFFFF" height="10px"><img height="10px" src="../images/spacer.gif"/></td>
        </tr>
		 <tr>
          <td align="center" height="10px" class="normal">No project(s) have been created yet.</td>
        </tr>
        <tr>
          <td bgcolor="#cccccc" height="1"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
 <%
	}

%>         
  
</table>
<!--------------------------------- Dynametically include the Attribute JSPs for selected service Ends ------------------------------>
<!----------------------------------------------- Submit Table Begins ------------------------------------------------->