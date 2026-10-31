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
<% 
        Hashtable userData = new Hashtable();

		ArrayList userList	=  new ArrayList();
	    String adData[]       = null;
        int userId     = 0;
        int ii          =0;
        boolean checkUser = false;
		userList 			=	projectApprovalsController.viewAllRequest(userData);
          if(userList.size()>0)
           {
            for(ii = 0; ii<userList.size(); ii++)
                {
                    adData   = (String[])userList.get(ii);
                    userId   = Integer.parseInt(adData[0]);

            if(timescapeUserOId==userId)
                {
                    checkUser=true;
                }
             }
}

	//if (timescapeUserOId == 91 || timescapeUserOId == 28476 || timescapeUserOId == 28821 || timescapeUserOId == 28904 || timescapeUserOId == 28285 || timescapeUserOId == 45040 || timescapeUserOId == 3799 || timescapeUserOId == 14649 || timescapeUserOId == 813 || timescapeUserOId == 10909 || timescapeUserOId == 11425 || timescapeUserOId == 211 || timescapeUserOId == 10543 || timescapeUserOId == 30153 || timescapeUserOId == 44861 || timescapeUserOId == 24939 || timescapeUserOId == 295 || timescapeUserOId == 273 || timescapeUserOId == 205 || timescapeUserOId == 3526 || timescapeUserOId == 839 || timescapeUserOId == 2656 || timescapeUserOId == 18962 || timescapeUserOId == 299 || timescapeUserOId == 16855 || timescapeUserOId == 14728 || timescapeUserOId == 26398 || timescapeUserOId == 22419 || timescapeUserOId == 392 || timescapeUserOId == 19027 || timescapeUserOId == 746 || timescapeUserOId == 6614 || timescapeUserOId == 5057 || timescapeUserOId == 4269 || timescapeUserOId == 732 || timescapeUserOId == 3190 || timescapeUserOId == 8596 || timescapeUserOId == 798 || timescapeUserOId == 28163 || timescapeUserOId == 11112 || timescapeUserOId == 46678) {	
if(checkUser){	
%>
				<td align = "left" colspan ="1"><a href="javascript:void window.open('../user/viewAllRequest.jsp','','resizable=yes,scrollbars=yes,toolbars=no,width=850,height=500,top=0,left=100')" class="style3"><u>View All Requests</a></td>
              
<%
		  }
%>				<td align="left" colspan="2" height="26"><div align="right"><span class="menu1"><img 								src="../images/inProcess.png" width="20" height="20" /></span><span class="style3">In Process | <!-- 				<img src="../images/unitApproved.png" width="20" height="20" />Recommended   |  --><img src="../images/depApproved.png" width="20" height="20" />Recommended | <img src="../images/finalised.png" width="20" height="20" />Approved | <img src="../images/rejected.jpg" width="20" height="20" />Rejected</span></div></td>
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
              <td width="39" class="headBox"><div align="center"><span class="menu2">Status</span></div></td>
              </tr>

<%

		if(requestList!=null && requestList.size()>0)
		{
			for (int i = 0; i < requestList.size(); i++)
			{
				String requestDetail[] = (String[]) requestList.get(i);

				Hashtable requestDetailHash = xmlObj.readSubNode(requestDetail[1], "reqDetails");
				//out.println(requestDetailHash.get("project-"));
				String recommendedBy1 = requestDetail[23];
				String recommendedBy2 = requestDetail[24];
				String modifiedBy = requestDetail[25];
				String status = requestDetail[3];

				/*String bgColor1 = modifiedBy.equals(recommendedBy1)&& ("R".equals(status)||"RR".equals(status))? "#92BC85" : "#BEC05F";
				String bgColor2 = modifiedBy.equals(recommendedBy2)&& ("R".equals(status)||"RR".equals(status))? "#92BC85" : "#BEC05F";
				String bgColor3 = modifiedBy.equals(requestDetail[19])&& "A".equals(status)? "#92BC85" : "#BEC05F";
				*/
				String class1 = "";//modifiedBy.equals(recommendedBy1)&& ("R".equals(status)||"RR".equals(status))? "done" : "pending";
				String class2 = "";//modifiedBy.equals(recommendedBy2)&& ("R".equals(status)||"RR".equals(status))? "done" : "pending";
				String class3 = "pending";//modifiedBy.equals(requestDetail[19])&& "A".equals(status)? "done" : "pending";

				if("P".equals(status))
				{
					class1="pending";
					class2="pending";

				}else if("R".equals(status))
				{
					class1="done";
					class2="done";
				}else if("RR".equals(status)&& modifiedBy.equals(recommendedBy1))
				{
					class1="done";
					class2="pending";
				}else if("RR".equals(status)&& modifiedBy.equals(recommendedBy2))
				{
					class2="done";
					class1="pending";
				}else if("A".equals(status))
				{
					class1="done";
					class2="done";
					class3="done";
				
				}
				else if("C".equals(status))
				{
					class1="done";
					class2="done";
					class3="done";
				
				}

%>
            <tr>

					<td class = "style3Underline" height = "20" align = "left">
					<a href="javascript:void window.open('../common/checkRequestDetails.jsp?projectId=<%=requestDetail[0]%>','','resizable=yes,toolbars=no,scrollbars=yes,width=850,height=600,top=50,left=50')" 			
					class="style3Underline"><%=requestDetail[0]%></a></td>
					<td class = "style3" height = "20" align = "left"><%=requestDetailHash.get("project-")%>
					<td class = "style3" height = "20" align = "right"><%=requestDetailHash.get("value-")%>
					<td class = "<%=class1%>" height = "20" align = "left" bgcolor=""><%=requestDetail[11]%></td></td>
					<!-- <td class = "<%//=class2%>" height = "20" align = "left" bgcolor=""><%//=requestDetail[15]%></td></td> -->
					<td class = "<%=class3%>" height = "20" align = "left" bgcolor=""><%=requestDetail[19]%></td>
					<td class = "style3" height = "20" align = "left"><%=requestDetail[2]%></a></td>
					<td class = "style3" height = "20" align = "center"><img src="../images/<%=(String)requestStatus.get(status)%>" width="20" height="20" /></td>

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
          <td align="center" height="10px" class="style3">No project(s) have been created yet.</td>
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