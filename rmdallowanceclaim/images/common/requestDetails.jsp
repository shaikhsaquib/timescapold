<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date" %>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />

 <html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	 </head>

 <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<%
	//List of all tags those are needed to read from the xml in the specific order
	String[] tags = {"travelOn", "dId"};

	String txnId = (String)request.getParameter("id");

	ArrayList viewClaimDetails = null;
	viewClaimDetails = rmdAllowanceClaimDetails.viewTxnId(txnId, tags);
	
	Hashtable icons = new Hashtable( );
	Hashtable requestStatus = new Hashtable( );

	icons.put("L",  "ico_inprocess.gif");
	icons.put("RA",  "ico_approved.gif");
	icons.put("A",  "ico_approved.gif");
	icons.put("P",  "ico_approved.gif");
	icons.put("R", "ico_rejected.gif");
	icons.put("C",  "ico_cancelled.gif");
	icons.put("O", "save.gif");

	requestStatus.put("L", "In Process");
	requestStatus.put("RA", "Accepted");
	requestStatus.put("A", "Accepted");
	requestStatus.put("P", "Processed");
	requestStatus.put("R", "Rejected");
	requestStatus.put("C", "Cancelled");
	requestStatus.put("O", "Saved");

	String[] header = (String[]) ((ArrayList)viewClaimDetails.get(0)).get(0);
	Hashtable claimHash = (Hashtable) viewClaimDetails.get(1);
	
    ArrayList claimDate = (ArrayList)claimHash.get(tags[0]);
    ArrayList claimParticulars = (ArrayList)claimHash.get(tags[1]);
	
    
%>

		<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
		<tr>
		<td class="whitesmall" bgcolor="#000000" align="center" colspan ="8" height="20" color="#ffffff">RMD REIMBURSEMENT CLAIM FORM</td>
		</tr>
		 <tr>
            <td colspan="100%" height="5">&nbsp;</td>
        </tr>
	
		<tr>
			<td width="16%" align="center" class="bold" height="20" >Txn No :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=header[0]%></td>
			<td width="16%" align="center" class="bold" height="20" >Name of Company :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=header[2]%></td>
		</tr>
		<tr>
			<td width="16%" align="center" class="bold" height="20">SAP ID :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=header[7]%></td>
			<td width="16%" align="center" class="bold" height="20">Name of Requester :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=header[3]%></td>
        </tr>
        <tr>
			<td width="16%" align="center" class="bold" height="20">PAY ID :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=header[4]%></td>
			<td width="16%" align="center" class="bold" height="20">Department :</td>
			<td width="34%" align="left" class="normal" height="20"style="padding-left:10px"><%=header[5]%></td>
			
            
        </tr>
        <tr>
            <td width="16%" align="center" class="bold" height="20" >Applied For Month :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=header[10]%></td>
			<td width="16%" align="center" class="bold" height="20">Designation :</td>
			<td width="34%" align="left" class="normal" height="20"style="padding-left:10px"><%=header[6]%></td>
		</tr> 
		
		<tr>
			<td height="10"colspan="100%"><block type="spacer" height="15"></td>
		</tr>
		 
	
		</table>

		<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
		<!-- <tr>
			<td colspan="6" bgcolor="#CCCCCC"><img src="../images/spacer.gif" border="0"></td>
		</tr> -->
			<tr>
				<td align="right" class="normal">In Process <img src="../images/ico_inprocess.gif" width="10" height="10"/>&nbsp;&nbsp; Verified <img src="../images/ico_approved.gif" width="10" height="10"/>&nbsp;&nbsp; Rejected <img src="../images/ico_rejected.gif" width="10" height="10"/>&nbsp;&nbsp;</td>
			</tr>

		</table>

		<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
		<tr bgcolor="#CCCCCC">
			<td class="boldsmall" width="40%" height="20">&nbsp;DATE</td>
			<td class="boldsmall" width="10%" height="20">DAY</td>
			<!-- <td class="boldsmall" width="20%" height="20">DETAILS</td> -->
			<td class="boldsmall" width="10%" height="20">APPROVERREMARKS</td>
		    <td class="boldsmall" width="40%" height="20">STATUS</td> 
			
		</tr>

<%
		for(int ii=0; ii<claimDate.size(); ii++)
		{
			//Hashtable claimHashDetails = (Hashtable) claimParticulars.get(ii);

			//out.println(processorStatus);

%>
		<tr>
			<td class="normal"  width="40%" height="20"><%=((Hashtable) claimDate.get(ii)).get("date")%></td>
			<td class="normal"  width="10%" height="20"><%=((Hashtable) claimDate.get(ii)).get("day")%></td>
			<!-- <td class="normal"  width="20%" height="20"><%//=((Hashtable) claimDate.get(ii)).get("remarks")%></td> -->
<%
			if (claimParticulars==null){
%>
            <td class="normal"  width="50%" height="20">-</td>
			<!-- <td class="normal"  width="10%" height="20">-</td> -->
			 <td class="normal"  width="10%" height="20"><img src="../images/ico_inprocess.gif"></td> 
<%
}else{
%>
			<td class="normal"  width="50%" height="10"><%=((Hashtable) claimParticulars.get(ii)).get("AR")%></td>
			<input type="hidden" name ="amount" value="<%=((Hashtable) claimParticulars.get(ii)).get("AT")%>">
<%
			Hashtable claimHashDetails = (Hashtable) claimParticulars.get(ii);
			
			String processorStatus = "ST" + ii;
			
			 processorStatus	= ( String ) claimHashDetails.get("ST");	
%>
			<!--  <td class="normal"  width="15%" height="20"><%//=processorStatus%></td>   -->
<%
		
	if(processorStatus.equals ("RA"))
	{
%>	
	<td class="normal"  width="40%" height="20"><img src="../images/ico_approved.gif"></td> 
	
<%	
	} else {
%>
	<td class="normal"  width="40%" height="20"><img src="../images/ico_rejected.gif"></td> 
<%		
	}

%>
</tr>

<%
		}
	}
%>
		<tr>
			<td colspan="6" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>
		<tr >
			<td class="boldsmall" height="25" width="20%" align="right">(Total Amount)&nbsp;</td>
			<td class="boldsmall" height="25" width="20%">Rs.<%=header[8]%></td>
			<td class="boldsmall" height="25" width="20%" align="right">(Approved Amount)&nbsp;</td>
			<td class="boldsmall" height="25" width="20%">Rs.<%=header[9]%></td>
		</tr>
    	<tr>
			<td colspan="6" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>
		<tr>
			<td colspan="6"><img src="../images/spacer.gif" border="0"></td>
		</tr>
		
		
		<tr>
			<td colspan="6" align="center" height="40"><a href="javascript:void window.close()"><img src="../images/but_close.gif" border="0"></a></td>
		</tr>
</table>
</body>
</html>