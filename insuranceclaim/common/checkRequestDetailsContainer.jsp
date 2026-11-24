<!-- <table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
		<td height = "35">
			&nbsp;<%=breadcrumbs%>
		</td>
	</tr>
</table> -->
<%!
	ArrayList myClaimRequest = new ArrayList();
	String requestNo = "";
	String claimNo = "";
	ArrayList reviewer = new ArrayList();
	ArrayList courier = new ArrayList();
	ArrayList reviewerList = new ArrayList();
	ArrayList reviewerRemarkList = new ArrayList();
	ArrayList courierList = new ArrayList();
	ArrayList courierRemarkList = new ArrayList();
	ArrayList settleRemarkList = new ArrayList();
	ArrayList settleList = new ArrayList();
	ArrayList cheque = new ArrayList();

	Hashtable courierRemarkDetails = new Hashtable();
	Hashtable reviewerRemarkDetails = new Hashtable();
	Hashtable claimRequestHash = new Hashtable();
	Hashtable claimFormDetailHash = new Hashtable();
	Hashtable claimHash = new Hashtable();
	Hashtable claimFormDetailCourierHash = new Hashtable();
	Hashtable claimCourierHash = new Hashtable();
	Hashtable claimSettleHash = new Hashtable();
	Hashtable settleRemarkDetails = new Hashtable();
	
%>
<%
	String role = (String) session.getAttribute("claimUserRole");
	requestNo  = (String) request.getParameter("requestno");
	//System.out.println("requestno "+requestno);

	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = requestNo;

	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr);

	myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable userDetails = xmlObj.readSubNode(myClaimRequestValues[2], "userDetails");
	Hashtable userClaimDetails = xmlObj.readSubNode(myClaimRequestValues[3], "userClaimDetails");
	Hashtable approverClaimDetails = xmlObj.readSubNode(myClaimRequestValues[13], "approverClaimDetails");
	Hashtable attacmentClaimDetails = xmlObj.readSubNode(myClaimRequestValues[4], "claimAttachmentDetails");
%>
<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align="center">
<tr>
		<td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="100%" align="center" bgcolor="#ffffff" border="0">
	<tr>
		<td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/space.gif" width="1" /></td>
	</tr>
	<tr>
		<td align="left" background="../images/red_shadow.jpg" bgcolor="#D60202"width = "100%" height="20"><div align="center"><span class="style5Copy">I N S U R A N C E&nbsp;&nbsp;&nbsp;D E T A I L S</span></div></td>
	</tr>
	<tr>
		<td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/space.gif" width="1" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr> 
	<tr>
	<td align="left" bgcolor="#cccccc" height="1"><img height="1" src="spacer.gif" width="1" /></td>
	</tr>
</table>

<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
		<td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff">CLAIM  DETAILS </td>
	</tr>
	<tr>
		<td colspan="100" height="5"></td>
	</tr>

	<tr>
		<td height="1" colspan="4" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
	</tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Entity</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left"><%=  (String)userDetails.get("company-") %></td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Item Name</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
		<%=(String)userClaimDetails.get("claimItemName-")%>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
		<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Description of Damaged Item</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
		<%=(String)userClaimDetails.get("claimItemDesc-")%>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Date of Loss / Damage</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%=(String)userClaimDetails.get("damageDate-")%>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Cause of Loss</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%=(String)userClaimDetails.get("damageCause-")%>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Probable & Estimated Loss / Damage Amount</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%=(String)userClaimDetails.get("damageAmount-")%>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<%
		if( role.equals("2") || role.equals("3") ){
	%>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Updated Probable & Estimated Loss / Damage Amount</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%
			
			 String updatedValue = (userClaimDetails.get("updatedDamageAmount-") == null)? (String)userClaimDetails.get("damageAmount-") : (String)userClaimDetails.get("updatedDamageAmount-");
			%>
			<input type="number" id="updatedDamageValue" value="<%=updatedValue%>" />
			<button type="button" style="background: #9292df;color: white;border: 0;padding: 4px;cursor: pointer;" onclick="updateUserClaimField()" >Update</button>
			<div id="resultArea"></div>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
		<% } %>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Place of Loss</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%=myClaimRequestValues[7]%>
		</td>
	</tr>
	<tr>
		<td colspan="100" height="10"></td>
	</tr>
	<tr>
		<td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff">CONTACT PERSON DETAILS </td>
	</tr>
	<tr>
		<td colspan="100" height="5"></td>
	</tr>
	<tr>
		<td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
	</tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Name</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%=(String)userClaimDetails.get("contactName-")%>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Address</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%=(String)userClaimDetails.get("contactAddress-")%>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Phone No</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%=(String)userClaimDetails.get("contactPhoneNo-")%>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Fax</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%=(String)userClaimDetails.get("contactFaxNo-")%>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Mobile No</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%=(String)userClaimDetails.get("contactMobileNo-")%>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Email Id</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%=(String)userClaimDetails.get("contactEmailId-")%>
		</td>
	</tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<tr>
		<td class = "style5" width = "10%" height = "30" align = "center"></td>
		<td class = "style5" width = "30%" height = "30" align = "left">Department Name</td>
		<td class = "style5" width = "10%" height = "30" align = "center">:</td>
		<td class = "style3" width = "50%" height = "30" align = "left">
			<%=(String)userDetails.get("department-")%>
		</td>
	</tr>

<%
	if(!myClaimRequestValues[12].equals("L") && !myClaimRequestValues[12].equals("R") && !myClaimRequestValues[1].equals("0"))
//	if(myClaimRequestValues[12].equals("A") || myClaimRequestValues[12].equals("UF") || myClaimRequestValues[12].equals("AR"))
	{
%>
		<tr>
			<td colspan="100" height="10"></td>
		</tr>
		<tr>
			<td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff">APPROVED CLAIM DETAILS </td>
		</tr>
		<tr>
			<td colspan="100" height="5"></td>
		</tr>
		<tr>
			<td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Claim Number</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style3" width = "50%" height = "30" align = "left">
				<%=myClaimRequestValues[1]%>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Policy Name</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style3" width = "50%" height = "30" align = "left">
				<%=(String)approverClaimDetails.get("policyName-")%>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Policy Number</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style3" width = "50%" height = "30" align = "left">
				<%=(String)approverClaimDetails.get("policyNumber-")%>
			</td>
		</tr>
		<tr>
			  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>  
			<td class = "style5" width = "30%" height = "30" align = "left">Insurance Company</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style3" width = "50%" height = "30" align = "left">
				<%=(String)approverClaimDetails.get("policyInsuCompany-")%>
			</td>
		</tr>
		<tr> 
			<td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Claim Form</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left">
				<%@ include file = "../includes/includeClaimForm.jsp"%>    
			</td>  

		</tr>
		<tr>
			<td colspan="100" height="10"></td>
		</tr>
<%
		if(!myClaimRequestValues[12].equals("HA") && !myClaimRequestValues[12].equals("L") && !myClaimRequestValues[12].equals("W") && !myClaimRequestValues[12].equals("R"))
		{
%>
		<tr>
			<td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff">SURVEYOR DETAILS </td>
		</tr>
		<tr>
			<td colspan="100" height="5"></td>
		</tr>
		<tr>
			<td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Surveyor Location</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style3" width = "50%" height = "30" align = "left">
				<%=(String)approverClaimDetails.get("surveyorLocation-")%>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Surveyor Name</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style3" width = "50%" height = "30" align = "left">
				<%=(String)approverClaimDetails.get("surveyorName-")%>
			</td>
		</tr>
		<tr>
			  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Surveyor Address</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style3" width = "50%" height = "30" align = "left">
				<%=(String)approverClaimDetails.get("surveyorAddr-")%>
			</td>
		</tr>
		<tr>
			  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Surveyor Phone Number</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style3" width = "50%" height = "30" align = "left">
				<%=(String)approverClaimDetails.get("surveyorPhone-")%>
			</td>
		</tr>
		<tr>
			  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Surveyor Mobile Number</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style3" width = "50%" height = "30" align = "left">
				<%=(String)approverClaimDetails.get("surveyorMobile-")%>
			</td>
		</tr>
		<tr>
			  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Surveyor Fax Number</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style3" width = "50%" height = "30" align = "left">
				<%=(String)approverClaimDetails.get("surveyorFax-")%>
			</td>
		</tr>
		<tr>
			  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Surveyor Email Id</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style3" width = "50%" height = "30" align = "left">
				<%=(String)approverClaimDetails.get("surveyorEmailId-")%>
			</td>
		</tr>


		<%//@ include file = "../includes/approverRemark.jsp" %>
<%
		}
	}
%>
		<%@ include file = "../includes/approverRemark.jsp" %>
<%
	if(!myClaimRequestValues[12].equals("L") && !myClaimRequestValues[12].equals("R") && !myClaimRequestValues[12].equals("A") && !myClaimRequestValues[12].equals("UF") && !myClaimRequestValues[12].equals("AR") && !myClaimRequestValues[12].equals("AF") && !myClaimRequestValues[12].equals("HA"))
	{
%>
		<%@ include file = "../includes/courierRemark.jsp" %>

<%
	}
	if(!myClaimRequestValues[12].equals("L") && !myClaimRequestValues[12].equals("W") && !myClaimRequestValues[12].equals("R") && !myClaimRequestValues[12].equals("A") && !myClaimRequestValues[12].equals("UF") && !myClaimRequestValues[12].equals("AR") && !myClaimRequestValues[12].equals("AF") && !myClaimRequestValues[12].equals("UC") &&
	!myClaimRequestValues[12].equals("AC") && !myClaimRequestValues[12].equals("IR") &&
	!myClaimRequestValues[12].equals("P") && !myClaimRequestValues[12].equals("HA")
	&& !myClaimRequestValues[12].equals("H"))
	{
%>
		<%@ include file = "../includes/settleRemark.jsp" %>
<%
	}
%>

	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>
	<tr>
          <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
    </tr>

<%

	if( role.equals("2") || role.equals("3") )
	{
		 if(myClaimRequestValues[12].equals("P")){
%>
		<tr  bgcolor="#EDE9E8">
			<td  align="center"  colspan = "100%">
				<input name="Process" type="button" class="redButton" value="Settle" onclick = "settleClaim()" />
				<input name="Reject" type="button" class="redButton" value="Reject" onclick = "companyRejectClaimRemark()" />
				<input name="Hold" type="button" class="redButton" value="Hold" onclick = "holdClaimRemark()" />
			</td>
		</tr>
<%
		}else if(myClaimRequestValues[12].equals("H")){
%>
		<tr  bgcolor="#EDE9E8">
			<td  align="center"  colspan = "100%">
				<input name="Process" type="button" class="redButton" value="Settle" onclick = "settleClaim()" />
				<input name="Reject" type="button" class="redButton" value="Reject" onclick = "companyRejectClaimRemark()" />
			</td>
		</tr>
<%
		}else if(myClaimRequestValues[12].equals("L")){
%>
			<tr  bgcolor="#EDE9E8">
				<td  align="center"  colspan = "100%">
					<input name="Accept" type="button" class="redButton" value="Accept" onclick = "acceptClaim()" />
					<input name="Reject" type="button" class="redButton" value="Reject" onclick = "rejectClaimRemark()" />
				</td>
			</tr>
<%
		}else{
%>
			<tr  bgcolor="#EDE9E8">
				<td  align="center"  colspan = "100%">
				<input name="Close" type="button" class="redButton" value="Close" onclick = "window.close();" />
				</td>
			</tr>
<%
		}
	}else{
%>
	<tr  bgcolor="#EDE9E8">
		<td  align="center"  colspan = "100%">
			<div align="center">
				<input name="Close" type="button" class="redButton" value="Close" onclick = "window.close();" />
			</div>
		</td>
	</tr>
<%
	}
%>

</table>
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>" >
<input type = "hidden" name = "hiddClaimNo" value = "<%=myClaimRequestValues[1]%>" >
<input type = "hidden" name = "insuranceCompany" value = "<%=(String)approverClaimDetails.get("policyInsuCompany-")%>" >
<input type = "hidden" name = "claimNumber" value = "<%=(String)approverClaimDetails.get("myClaimRequestValues[1]-")%>" >
<input type = "hidden" name = "policyType" value = "<%=(String)approverClaimDetails.get("policyName-")%>" >
<input type = "hidden" name = "lossDescription" value = "<%=(String)userClaimDetails.get("damageAmount-")%>" >
<input type = "hidden" name = "updatedDamageAmount" value = "<%=(String)userClaimDetails.get("updatedDamageAmount-")%>" >
<input type = "hidden" name = "capturedEmailId" value = "<%=(String)userClaimDetails.get("contactEmailId-")%>" >
<input type = "hidden" name = "department" value = "<%=(String)userDetails.get("department-")%>" >