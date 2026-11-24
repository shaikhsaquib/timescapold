
<tr>
		   <td colspan = "100%" class = "small" height="30">
				<span class="bold">&nbsp;Note<br></span>
				<span class = "bold">
					<span class="bold">&nbsp;-</span>&nbsp;All fields marked with <img src="../images/tickmark.gif" width="13" height="13"/> are mandatory but editable.<br>
					<span class="bold">&nbsp;-</span>&nbsp;This is just a web-preview of the Business Card. The fonts appearing on the Business Card are web fonts,<br>
					<span class="bold">&nbsp;&nbsp;</span>&nbsp;&nbsp;the actual appearance of the printed Business Card would be in accordance with the pre-defined true-type font.<br>
<%
			if(compCode.equals("1000"))
			{	
%>

					<span class="bold">&nbsp;-</span>&nbsp;For all BCCL departments, the design template is Times Group. Kindly choose your relavent template if required.
				</span>
<%	
			}else{
%>

			</td>
<%
				 }
%>
	</tr>

<%@ include file="../includes/cardTemplateCode.jsp" %>

	<tr>
		<td class = "bold" align = "right" width = "30%">Card Template</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" width = "20%">
			<select name = "cardTemplate" class = "small" onchange="showCardDesign('<%=firstName%>','<%=lastName%>','<%=Utility.replaceAmparsandURL(designation)%>','<%=activityName%>','<%=Utility.replaceAmparsandURL(addressLine1)%>','<%=Utility.replaceAmparsandURL(addressLine2)%>','<%=directPhoneNo%>','<%=fax%>','<%=mobileNumber%>','<%=userBoardNumber%>','<%=extensionNumber%>','<%=Utility.replaceAmparsandURL(workArea)%>','<%=Utility.replaceAmparsandURL(compName)%>','<%=website%>')">
            
<%
		String deptKey = "";
		String sel = "";
		for (Enumeration e = deptCode.keys(); e.hasMoreElements();){

			deptKey = (String)e.nextElement();
            //System.out.println("deptCode--"+deptCode);
            //System.out.println("deptName--"+deptName);
            //System.out.println("deptKey--"+deptKey);
			if (deptCode.containsKey(deptName)){
				sel = (deptKey.equals(deptName))?"SELECTED":"";
                //System.out.println("1");
%>				
				<option value = "<%=deptKey%>" <%=sel%>><%=deptCode.get(deptKey)%></option>
<%
			}else{
				sel = (deptKey.equals("TG"))?"SELECTED":"";
                //System.out.println("2");
%>
				<option value = "<%=deptKey%>" <%=sel%>><%=deptCode.get(deptKey)%></option>
<%
			}
	}

%>
        </select>

        <td class = "small" align = "left">
			<div id="Card-Area" style="height:90px;padding:1px;padding-top:1px;text-align:center;"></div>
		</td>
	
	</tr>

	<tr>
	<td colspan="4">
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	<td width="55%">
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">First Name</td>
		<td class = "bold" align = "center"  width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=firstName%></td>
	</tr>

	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">Last Name</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=lastName%></td>
	</tr>

	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">Designation</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=designation%></td>
	</tr>

	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">Department</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=department%></td>
	</tr>
<%
if(compCode.equals("1000"))
{
%>
	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">Activity Name</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=activityName%></td>
	</tr>
<%
}else{
%>
<input type = "hidden" name = "activityName" value = "<%=activityName%>" class = "input" size = "50">
<%
}
%>

	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">Work Area</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=workArea%></td>
	</tr>

	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">EmailId</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=emailId%></td>
	</tr>

	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">Website</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=website%></td>
	</tr>

	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">Company Name</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=compName%></td>
	</tr>

	<tr height = "40">
		<td class = "bold" align = "left" width = "30%">Address</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2" ><%=addressLine1%><br/><%=addressLine2%></td>
	</tr>
<% if(compCode.equals("1000")&& toShowPersonalBelief!=null&&!toShowPersonalBelief.equals("")){
%>
	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">Personal Belief</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=toShowPersonalBelief%></td>
	</tr>
<%	}
%>
	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">Quantity</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=quantity%></td>
	</tr>

	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">Approver Email Id</td>
		<td class = "bold" align = "center" width = "2%">:</td>
		<td class = "small" align = "left" colspan = "2"><%=approverEmailId%></td>
	</tr>

<%   
		if("1003".equals(compCode) || "1024".equals(compCode) || "1025".equals(compCode) || "1026".equals(compCode) || "1027".equals(compCode) || companyCode.equals("1029") || companyCode.equals("1028")){
%>

	<tr height = "30">
		<td class = "bold" align = "left" width = "30%">Back Design Template</td>
		<td class = "bold" align = "center" width = "2%">:</td>
        <td class = "small" align = "left" colspan = "2">
		<a href="javascript:void window.open('../includes/CardBackDesign.jsp','','resizable=yes,border=0,scrollbars=yes,toolbars=no,width=1000,height=1000,top=0,left=0')" class="normal"><u>Click Here to select the Card Back Design</select><img src="../images/tickmark.gif" border ="0" width="15" height="13"/></a></u></td>
<%
		}
%>
	</tr>

	<tr>
		<td colspan = "100%" align = "center">&nbsp;</td>
	</tr>
	</table>
	</td>
	<td width="45%" valign="top" align="left"><div id="CardBack-Area" style="height:90px;padding:1px;padding-top:1px;text-align:left;"></div></td>
	</tr>
	</table>
	</td>
	</tr>

	<tr>
		<td colspan = "100%" class = "normal" align = "center" height = "20">
			<a href = "javascript:confirmRequest( )" class = "normal"><img src = "../images/but_submit.gif" border = "0"></a>&nbsp;&nbsp;
			<a href = "javascript:history.back( )" class = "normal"><img src = "../images/but_back.gif" border = "0"></a>&nbsp;&nbsp;
		</td>
	</tr>