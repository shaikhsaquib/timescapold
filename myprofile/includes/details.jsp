<script>
function uploadPicture()
{

		var url = "../profile/uploadPicture.jsp";
		win = window.open(url,"Picture","width=400,height=200, resizable=no, status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
}

function sendMail()
{
	document.location.href = "../profile/exception.jsp";
}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">

    <tr>
	    <td colspan="3" class="header" height="30" align="left">my profile</td>
    </tr>

    <tr>

<%
        if(request.getParameter("detailAction") != null && request.getParameter("detailAction").equalsIgnoreCase("UPDATE")){

%>
            <td width="19%" height="5" valign="top" align="left">
				<img src="/timescape/myprofile/common/showImage.jsp?timescapeUserOID=<%=(String)profile.get("timescapeUserOID")%>&alternateImagePath=/WebSphere5/AppServer/installedApps/Staging/timescape_war.ear/timescape.war/myprofile/images/photograph.gif" alt = "Image Not Uploaded">
				<br><br>
				<a href="javascript:uploadPicture( )" class="smallunderline"><strong>upload picture</strong></a>
			</td>
<%
        }else{
%>
            <td width="19%" height="5" valign="top" align="left">
				<img src="/timescape/myprofile/common/showImage.jsp?timescapeUserOID=<%=(String)profile.get("timescapeUserOID")%>&alternateImagePath=/WebSphere5/AppServer/installedApps/Staging/timescape_war.ear/timescape.war/myprofile/images/photograph.gif" alt = "Image Not Uploaded">
				<br><br>
				<!--<a href="javascript:uploadPicture( )" class="smallunderline"><strong>upload picture</strong></a>-->
			</td>
<%
        }

String showCompany = "0";
if(companyCode.equals("02")){
	companyName = "";

	if( (locationCode.equals("1501")) || (locationCode.equals("1502")) || (locationCode.equals("1503")) || (locationCode.equals("1504")) || (locationCode.equals("1507")) || (locationCode.equals("1508"))  ){
		showCompany = "1";
	}else{
	     response.sendRedirect("/timescape/login/index.jsp?msg=1");
	     return;
	}
}
%>
		<td width="2%">&nbsp;</td>
		<td width="79%" class="bold">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

<%
			if(showCompany.equals("1")){
%>
				<tr>
					<td class="bold" height = "20" width = "24%">&nbsp;</td>
					<td  width = "6%" class="bold"><div align="center">&nbsp;</div></td>
					<td class="small" height = "20" width = "70%">&nbsp;</td>
				</tr>
<%
			}else{
%>
				<tr>
					<td class="bold" height = "20" width = "24%">Company</td>
					<td  width = "6%" class="bold"><div align="center">:</div></td>
					<td class="small" height = "20" width = "70%"><%=companyName%></td>
				</tr>
<%
		}
%>

				<tr>
					<td class="bold" height = "20" width = "24%">Branch</td>
					<td class="bold" height = "20" width = "6%"><div align="center">:</div></td>
					<td class="small" height = "20" width = "70%"><%=branchName%></td>
				</tr>

				<tr>
					<td class="bold" height = "20" width = "24%">Location</td>
					<td class="bold" height = "20" width = "6%"><div align="center">:</div></td>
					<td class="small" height = "20" width = "70%"><%=locationName%></td>
				</tr>

				<tr>
					<td class="bold" height = "20" width = "24%">Department</td>
					<td class="bold" height = "20" width = "6%"><div align="center">:</div></td>
					<td class="small" height = "20" width = "70%"><%=deptNameDesc%></td>
				</tr>

				<tr>
					<td class="bold" height = "20" width = "24%">Activity Description</td>
					<td class="bold" height = "20" width = "6%"><div align="center">:</div></td>
					<td class="small" height = "20" width = "70%"><%=activityName%></td>
				</tr>

				<tr>
					<td class="bold" height = "20" width = "24%">Payroll ID</td>
					<td class="bold" height = "20" width = "6%"><div align="center">:</div></td>
					<td class="small" height = "20" width = "70%"><%=payId%></td>
				</tr>

				<tr>
					<td class="bold" height = "20" width = "24%">HRD No / Ticket No</td>
					<td class="bold" height = "20" width = "6%"><div align="center">:</div></td>
					<td class="small" height = "20" height = "20" width = "70%"><%=empCode%></td>
				</tr>

				<tr>
					<td class="bold" height = "20" width = "24%">Email Address</td>
					<td class="bold" height = "20" width = "6%"><div align="center">:</div></td>
					<td class="small" height = "20" height = "20" width = "70%"><%=emailId%></td>
				</tr>

				<tr>
					<td class="bold" height = "20" width = "24%">Designation</td>
					<td class="bold" height = "20" width = "6%"><div align="center">:</div></td>
					<td class="small" height = "20" height = "20" width = "70%"><%=designation%></td>
				</tr>

				<%
					String dob = birthdate.substring(0,birthdate.indexOf(" "));
					String yy1 = "";
					String mm1 = "";
					String dd1 = "";

					if(dob == null){
						dob = "";
					} else {
						//System.out.println(tempStr);

							yy1 = dob.substring(0,4);
							mm1 = dob.substring(5,7);
							dd1= dob.substring(8,10);

					}
				%>

				<tr>
					<td class="bold" height = "20" width = "24%">Date Of Birth</td>
					<td class="bold" height = "20" width = "6%"><div align="center">:</div></td>
					<td class="small" height = "20" height = "20" width = "70%"><%=dd1 + "-" + monthArr[Integer.parseInt(mm1)-1] + "-" +yy1%></td>
				</tr>

				<tr>
					<td class="normal" height = "10" colspan = "3"></td>
				</tr>

				<tr>
					<td class="normal" height = "20" colspan = "3"><strong>Note:</strong><br><span class = "rednormal">Please <a href = "javascript:sendMail()" class = "boldunderline">click here</a> to inform the local Human Resource Authority if any of the above mentioned details have to be modified.</span></td>
				</tr>

		</table>
		</td>
	</tr>

   	<tr>
		<td colspan="3" height="5" align = "left" class="normal"><hr size="1"></td>
	</tr>
</table>