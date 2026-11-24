<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController"/> 
<%
	
	String date = (String)request.getParameter("date");
	//String frequency = (String)request.getParameter("frequency");
	String policyId = (String)request.getParameter("policyId");
	String assurerfdbk = (String)request.getParameter("assurerfdbk");
	String ensurerfdbk = (String)request.getParameter("ensurerfdbk");
	String DPATH = EnvironmentProperties.getValue("policycompliance", "uploadPath");
	
	Hashtable details = new Hashtable();

	details.put("date",date);
	//details.put("frequency",frequency);
	details.put("policyId",policyId);
	details.put("assurerfdbk",assurerfdbk);
	details.put("ensurerfdbk",ensurerfdbk);

	//out.println("details: "+ details);

	ArrayList policyResult = new ArrayList();
	policyResult = policyController.dashBoardPolicies(details);
	//out.println("Size: "+ policyResult.size());
%>
<table width="100%" border="0" cellpadding="1" cellspacing="1">
<%
	if ( policyResult.size() > 0){
%>

<!--  	
	<tr>
		<td width="3%" height="26" align="left" valign="middle" bgcolor="#4498C6" class="style1">No.</td>
		<td width="40%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Control</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Risk  Category </td>
		<td width="13%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member Feedback </td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member<br>Attach&nbsp;/&nbsp;Remark</td>
		<td width="13%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supevisor Feedback </td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supevisor<br>Attach&nbsp;/&nbsp;Remark</td>
	</tr>
 -->
<%
		String name="";
		String apprName="";
		int jj=0;
		String header="";
		String subHeader="";

		for(int i = 0; i< policyResult.size(); i++){
			String bgcolor="#F7F7F7";
			String bgName="";
			String style2="style3";

			String[] tmpArr = (String [] )policyResult.get(i); 

			if(i%2==0)
				bgcolor="";

			if(tmpArr[4].equals("No")){
				style2="rednormal";
			}

			if (!header.equals(tmpArr[1])){
				header=tmpArr[1];
%>
	<tr>
		<td height="20px" colspan = "100%" align="left" valign="middle" bgcolor="#E0E78F" class="headCompliance"><%=header%></td>
	</tr>        
<%	
			} //end of header check
			if (!subHeader.equals(tmpArr[2])){
				subHeader=tmpArr[2];
				name="";
%>
	<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="#F3F5D6" class="subHeadCompliance"><img src="../images/greenArrow.png" border="0" valign="absmiddle">&nbsp;<%=subHeader%></td>
	</tr>
<%	
			}//end of sub header check

			if (!name.equals(tmpArr[11])){
				name=tmpArr[11];
				apprName=tmpArr[17];
				jj=1;
				bgName="#e8e8e8";
%>
				  <tr>
						<td align="left" colspan = "100%"  valign="middle" bgcolor="<%=bgName%>" class="name"><%=name%>&nbsp;/&nbsp;<%=apprName%></td>
					 <!-- <td align="center" colspan = "4" >&nbsp;</td> -->
                   </tr>
<%	
			}//end of user /approver name check
			else{
				jj++;
			}
%>

	<tr bgcolor="<%=bgcolor%>">
		<td width="45%" align="left" valign="middle" class="<%=style2%>"><%=tmpArr[4]%></td>
		<td width="5%" align="center" valign="middle" class="<%=style2%>"><%=tmpArr[5]%></td>
		<td width="5%" align="center" valign="middle" class="<%=style2%>"><%=tmpArr[6]%></td>
		<td width="13%" align="left" valign="middle" class="<%=style2%>"><%=tmpArr[7]%></td>
<%
	if("NA".equals(tmpArr[9])){
%>
		<td width="10%" align="left" valign="middle" class="<%=style2%>">
			&nbsp;&nbsp;&nbsp;&nbsp;	
			<img src="../images/remark.png" border="0" title="User Remark" id="requestInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[8]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,25,150);" onmouseout="xstooltip_hide('tooltip');">
			<div id="tooltip" class="xstooltip" width="100%"></div>
		</td>
<% 
	}else{
		String userEmailId = tmpArr[12];
		if (userEmailId.indexOf("@") > -1) {
			userEmailId = userEmailId.substring(0, userEmailId.indexOf("@"));        
		}   

%>
		<td width="10%" align="left" valign="middle" class="<%=style2%>">
			<a href="../common/download.jsp?f=<%=DPATH%>/<%=userEmailId%>/<%=tmpArr[9]%>"><img src="../images/attachment.gif" border="0" title="Team Member Attachment"></a>&nbsp;/&nbsp;
			<img src="../images/remark.png" border="0" title="User Remark" id="requestInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[8]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,25,150);" onmouseout="xstooltip_hide('tooltip');">
			<div id="tooltip" class="xstooltip" width="100%"></div>
		</td>

<% 
	}
%>
		<td width="13%" align="left" valign="middle" class="<%=style2%>"><%=tmpArr[13]%></td>
<%
	if("NA".equals(tmpArr[15])){
%>
		<td width="10%" align="left" valign="middle" class="<%=style2%>">
			&nbsp;&nbsp;&nbsp;&nbsp;	
			<img src="../images/remark.png" border="0" title="Supervisor Remark" id="appInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[14]%>');xstooltip_show('tooltip', 'appInfo<%=i%>',-100,25,150);" onmouseout="xstooltip_hide('tooltip');">
			<div id="tooltip" class="xstooltip" width="100%"></div>
		</td>
<% 
	}else{
		String apprEmailId = tmpArr[18];
		if (apprEmailId.indexOf("@") > -1) {
			apprEmailId = apprEmailId.substring(0, apprEmailId.indexOf("@"));        
		}   

%>
		<td width="10%" align="left" valign="middle" class="<%=style2%>">
			<a href="../common/download.jsp?f=<%=DPATH%>/<%=apprEmailId%>/<%=tmpArr[15]%>"><img src="../images/attachment.gif" border="0" title="Supervisor Member Attachment"></a>&nbsp;/&nbsp;
			<img src="../images/remark.png" border="0" title="Supervisor Remark" id="requestInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[14]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,25,150);" onmouseout="xstooltip_hide('tooltip');">
			<div id="tooltip" class="xstooltip" width="100%"></div>
		</td>

<% 
	}
%>
	</tr>         
	<tr>
		<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
	</tr>

<%	
			   }//end of for
%>
  <tr>
    <td colspan="100%" height="10px"><block type="spacer" height="10px"></td>
  </tr>
<%	
	}// end of main if size > 0
	else{
%>
	<tr>
		<td colspan="100%" height="25px"><block type="spacer" height="25px"></td>
	<tr>
		<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
	</tr>
	<tr>
		<td colspan="100%" align="center" height="40px" style="normal">No Data Available.</td>
	</tr>
	<tr>
		<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
	</tr>
<%	
	 }// end of else
%>
</table>
</form>
</body>
</html>