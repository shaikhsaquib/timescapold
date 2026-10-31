 <table cellspacing="0" cellpadding="0" width="800" align="center" bgcolor="#ffffff" border="0">
      <tbody>
        <tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td height="20" align="left" background="../images/red_shadow.jpg" bgcolor="#666666"><div align="center"><span class="style5Copy">Recommend &nbsp;Sanction &nbsp;Note</span></div></td>
        </tr>
        <tr>
          <td><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="left" height="26"><table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
            <tbody>
              <tr>
                <td align="left" colspan="3" height="26"><div align="right"><span class="menu1"><img src="../images/inProcess.png" width="20" height="20" /></span><span class="style3">In Process | <!-- <img src="../images/unitApproved.png" width="20" height="20" />Recommended   |  --><img src="../images/depApproved.png" width="20" height="20" />Recommended | <img src="../images/finalised.png" width="20" height="20" />Approved | <img src="../images/rejected.jpg" width="20" height="20" />Rejected</span></div></td>
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
			  <td width="60" class="headBox"><div align="left">Value(Rs.)</div></td>
              <td width="109" class="headBox"><div align="left"><span class="menu2">Recommended by</span></div></td>
              <!-- <td width="155" class="headBox"><div align="left"><span class="menu2">Recommended by</span></div></td> -->
              <td width="109" class="headBox"><div align="left"><span class="menu2">Approved by</span></div></td>
              <td width="115" class="headBox"><div align="left"><span class="menu2">Submitted On </span></div></td>
              <td width="39" class="headBox"><div align="center"><span class="menu2">Action</span></div></td>
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

				String statusToChange = status;

				//1 -- recommendedBy1 && 2-- recommendedBy2

				String byWhom = recommendedBy1.equals(timescapeUserOId+"")? "1" : "2"; 

				if(recommendedBy1.equals(recommendedBy2))
				{
					statusToChange = "RR"; 
					byWhom = "12"; // 12 -- both are same

				}
				

				/*String bgColor1 = modifiedBy.equals(recommendedBy1)&& ("R".equals(status)||"RR".equals(status))? "#92BC85" : "#BEC05F";
				String bgColor2 = modifiedBy.equals(recommendedBy2)&& ("R".equals(status)||"RR".equals(status))? "#92BC85" : "#BEC05F";
				String bgColor3 = modifiedBy.equals(requestDetail[19])&& "A".equals(status)? "#92BC85" : "#BEC05F";
				*/
				String class1 = modifiedBy.equals(recommendedBy1)&& ("R".equals(status)||"RR".equals(status))? "done" : "pending";
				String class2 = modifiedBy.equals(recommendedBy2)&& ("R".equals(status)||"RR".equals(status))? "done" : "pending";
				String class3 = modifiedBy.equals(requestDetail[19])&& "A".equals(status)? "done" : "pending";

				if(!(("done".equals(class1)&& recommendedBy1.equals(timescapeUserOId+"")) || ("done".equals(class2)&& recommendedBy2.equals(timescapeUserOId+""))))
				{  // to show row or not if user has processsed already

%>
            <tr>

					<td class = "style3Underline" height = "20" align = "left">
					<a href="javascript:void window.open('../common/checkRequestDetails.jsp?projectId=<%=requestDetail[0]%>','','resizable=yes,toolbars=no,scrollbars=yes,width=850,height=600,top=50,left=50')" 			
					class="style3Underline"><%=requestDetail[0]%></a></td>
					<td class = "style3" height = "20" align = "left"><%=requestDetailHash.get("project-")%>
					<td class = "style3" height = "20" align = "left"><%=requestDetailHash.get("value-")%>
					<td class = "<%=class1%>" height = "20" align = "left" bgcolor=""><%=requestDetail[11]%></td></td>
					<!-- <td class = "<%//=class2%>" height = "20" align = "left" bgcolor=""><%//=requestDetail[15]%></td></td> -->
					<td class = "<%=class3%>" height = "20" align = "left" bgcolor=""><%=requestDetail[19]%></td>
					<td class = "style3" height = "20" align = "left"><%=requestDetail[2]%></a></td>
					<td class = "style3" height = "20" align = "center"><a href="../reviewer/recommendSubmit.jsp?projectId=<%=requestDetail[0]%>&status=<%=statusToChange%>&byWhom=<%=byWhom%>&approverEmailId=<%=requestDetail[20]%>">Recommend</a></td>
            <tr>
              <td colspan="7" bgcolor="#E3DDDD"><div align="left"><span class="style3"><img src="../images/spacer.gif" width="1" height="1" /></span></div></td>
            </tr>
  <%
				}//to show row ends
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
          <td align="center" height="10px" class="style3">No project(s) to recommend.</td>
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