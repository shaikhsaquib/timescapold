<!--
	Author : Sachin Kale
	Version : 2.0
	Date : 11 Dec 2012
	Change : Removal of MAS Head from ADN workflow
-->

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.ArrayList, java.util.Calendar, java.util.Date" %>

<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController" />

<%
	ArrayList reqList = new ArrayList();
	Hashtable detailsHash = new Hashtable();

	String userOId = timescapeUserOId+"";

	detailsHash.put("STATUS", "'CL'");

	reqList = assetMgmt.getMyRequests(detailsHash);

	String roleCode = (String)session.getAttribute("roleCode");
	//out.println(reqList.size());
	//out.println(roleCode);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>SURPLUS ASSET MANAGEMENT</title>
		<link href="../style/global.css" rel="stylesheet" type="text/css" />
		<script src="../jscripts/reviewRequests.js" type="text/javascript"></script>
		<script src="../jscripts/viewDetails.js" type="text/javascript"></script>
		<script src="../jscripts/jquery.js" type="text/javascript"></script>
		<script src="../jscripts/common.js" type="text/javascript"></script>
	</head>

<body>
<form name="frmProcessRequests" method="post" >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%"><img src="../images/SAM_header.jpg" width="576" height="72" /></td>
	<td width="50%" valign="bottom">
		<%@ include file="../includes/relatedLinks.jsp" %>
	</td>
</tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">
    <tr>
      <td height="20" bgcolor="#E7EAEF" class="budgetMenuBG">&nbsp;APPROVE NOTES</td>
    </tr>
  <td height="5"></tbody>
</table>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right" class="normal">ATN In Process <img src="../images/ATN_Process.png" width="50" height="20"/>| ATN Completed <img src="../images/ATN_com.png" width="50" height="20"/>| ADN In Process <img src="../images/ADN_Process.png" width="50" height="20"/>| ADN Completed <img src="../images/ADN_com.png" width="50" height="20"/></td>
  </tr>
  <tr>
	<td colspan="100%" height="3px">&nbsp;</td>
  </tr>
  
</table>
<table width="99%" align="center" cellpadding="0" cellspacing="2">
	<tr class="greyBG">
		<td width="4%" height="29" align="center" valign="middle" >NO.</td>
	    <td width="12%" align="center" valign="middle">ASSET</td>
	    <td width="7%" align="center" valign="middle">ASSET NO</td>
		<td width="10%" align="center" valign="middle"> CATEGORY</td>
		<td width="8%" align="center" valign="middle">TYPE</td>
		<td width="18%" align="center" valign="middle">LOCATION</td>
		<td width="10%" align="center" valign="middle">POSTING DATE</td>
		<td width="17%" align="center" valign="middle">OWNERSHIP</td>
		<td width="8%" align="left" valign="middle"><input  type="radio" id="reject" name="accrej" onClick="selectAll1('accept')" />&nbsp;ACCEPT</td>
		<td width="8%" align="left" valign="middle"><input type="radio" id="reject" name="accrej" onClick="selectAll1('reject')" />&nbsp;REJECT</td>


	</tr>

<%
    int reqCount =0;
	//out.println(reqList.size());
	if(reqList.size()> 0){

		for(int ii=0; ii< reqList.size(); ii++){
			
			
			String tmpArr[] = (String [])reqList.get(ii);

			//out.println(tmpArr[51]);out.println(userOId);
			//out.println(tmpArr[69]);
			
			//out.println();

			String userRole = "";
			String userRemarks = "";
			String noteAcceptStatus = "";
			String noteRejectStatus = "";
			String mailToWhom = "";

			 if(userOId.equals(tmpArr[61])&& "DBH".equals(tmpArr[69])){

				userRole = "AUDITOR";
				userRemarks = "AUDITORREMARKS";
				noteAcceptStatus = "ATN".equals(tmpArr[35]) ? "-" : "DCL";
				noteRejectStatus = "ATN".equals(tmpArr[35]) ? "-" : "DIAR";
			}

			if(userOId.equals(tmpArr[56])&& "DA".equals(tmpArr[69])){

				userRole = "BRANCHHEAD";
				userRemarks = "BRHEADREMARKS";
				
				if(!"0".equals(tmpArr[61])){
					mailToWhom = tmpArr[63];
					noteAcceptStatus = "ATN".equals(tmpArr[35]) ? "-" : "DBH";
					noteRejectStatus = "ATN".equals(tmpArr[35]) ? "-" : "DBHR";
				}else{
					mailToWhom = "";
					noteAcceptStatus = "ATN".equals(tmpArr[35]) ? "-" : "DCL";
					noteRejectStatus = "ATN".equals(tmpArr[35]) ? "-" : "DBHR";
				}

			}
			
			if(userOId.equals(tmpArr[51])&& ("TA".equals(tmpArr[69]))){

				userRole = "ADMINHEAD";
				userRemarks = "ADHEADREMARKS";
				mailToWhom = tmpArr[58];
				noteAcceptStatus = "ATN".equals(tmpArr[35]) ? "TCL" : "DAH";
				noteRejectStatus = "ATN".equals(tmpArr[35]) ? "TAHR" : "DAHR";

			} 

			if(userOId.equals(tmpArr[46])&& ("TP".equals(tmpArr[69]) || "DP".equals(tmpArr[69]))){

				userRole = "APPROVEDBY";
				userRemarks = "APPROVERREMARKS";
				mailToWhom = tmpArr[53];
				noteAcceptStatus = "ATN".equals(tmpArr[35]) ? "TA" : "DA";
				noteRejectStatus = "ATN".equals(tmpArr[35]) ? "TAR" : "DAR";

			} 
			//out.println( userRole);
			if(userOId.equals(tmpArr[41]) && ("TV".equals(tmpArr[69]) || "DV".equals(tmpArr[69]))){

				userRole = "PROPOSEDBY";
				userRemarks = "PROPOSORREMARKS";
				mailToWhom = tmpArr[48];
				noteAcceptStatus = "ATN".equals(tmpArr[35]) ? "TP" : "DP";
				noteRejectStatus = "ATN".equals(tmpArr[35]) ? "TPR" : "DPR";

			} 

			if(userOId.equals(tmpArr[36])&& ("TS".equals(tmpArr[69]) || "DS".equals(tmpArr[69]))){

				userRole = "VERIFIEDBY";
				userRemarks = "VERIFIERREMARKS";
				mailToWhom = tmpArr[43];
				noteAcceptStatus = "ATN".equals(tmpArr[35]) ? "TV" : "DV";
				noteRejectStatus = "ATN".equals(tmpArr[35]) ? "TVR" : "DVR";

			} 	
			//out.println(userRole);
			//out.println(tmpArr[34]);

			if(!"".equals(tmpArr[34]) && tmpArr[34]!=null){
				
				if((userRole.equals("VERIFIEDBY") && ("TS".equals(tmpArr[69]) || "DS".equals(tmpArr[69]))) ||
					(userRole.equals("PROPOSEDBY") && ("TV".equals(tmpArr[69]) || "DV".equals(tmpArr[69])))||
					(userRole.equals("APPROVEDBY") && ("TP".equals(tmpArr[69]) || "DP".equals(tmpArr[69])))||
					(userRole.equals("ADMINHEAD") && ("TA".equals(tmpArr[69])))||
					(userRole.equals("BRANCHHEAD") && "DA".equals(tmpArr[69]))||
					(userRole.equals("AUDITOR") && "DBH".equals(tmpArr[69]))){
	            //out.println(userRole);
	            //out.println(noteAcceptStatus);
				reqCount++;

								
%>
  <tr>
	 
	<input type="hidden" id="noteType<%=reqCount%>" name="noteType<%=reqCount%>" value="<%=tmpArr[35]%>">
	<input type="hidden" id="userRole<%=reqCount%>" name="userRole<%=reqCount%>" value="<%=userRole%>">
	<input type="hidden" id="updateStatus<%=reqCount%>" name="updateStatus<%=reqCount%>" value="">
	<input type="hidden" id="requestId<%=reqCount%>" name="requestId<%=reqCount%>" value="<%=tmpArr[0]%>">
	<input type="hidden" id="userRemarks<%=reqCount%>" name="userRemarks<%=reqCount%>" value="<%=userRemarks%>">
	<input type="hidden" id="remarks<%=reqCount%>" name="remarks<%=reqCount%>" id="remarks<%=reqCount%>" value="-">
	
	<input type="hidden" id="counter" name="counter" value="">
	<input type="hidden" id="mailToWhom<%=reqCount%>" name="mailToWhom<%=reqCount%>" value="<%=mailToWhom%>">
	<input type="hidden" id="action<%=reqCount%>" name="action<%=reqCount%>" id="action<%=reqCount%>" value="Accept">
	

    <td height="30" align="center" valign="middle" class="normal"><%=reqCount%></td>
    <td height="30" align="left" valign="middle" class="boldunderline"><a href="javascript:void(0);" onclick="showDetails('<%=tmpArr[0]%>')" class="boldunderline" ><%=tmpArr[3]%></a></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[1]%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[4]%></td>
    <td align="center" valign="middle" class="normal"><%=tmpArr[5]%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[9].indexOf("-")>-1?tmpArr[9].substring(tmpArr[9].indexOf("-")+1).trim():tmpArr[9]%></td>
    <td height="30" align="center" valign="middle" class="normal"><%=tmpArr[20].substring(0,tmpArr[20].indexOf(" "))%></td>
	
	<td height="30" align="center" valign="middle" class="normal"><%=tmpArr[19]%></td>
    <td height="30" align="left" valign="middle" class="normal"><input type="checkbox" id="accept<%=reqCount%>" name="accept<%=reqCount%>" value="<%=noteAcceptStatus%>" onClick="atoggle1('<%=reqCount%>')"><td align="left"><input type="checkbox" valign="middle" id="reject<%=reqCount%>" name="reject" value="<%=noteRejectStatus%>"  onClick="showRemarksBox1('<%=reqCount%>'); rtoggle1('<%=reqCount%>')"></td>
  </tr>

	<tr id="req<%=reqCount%>" style="display:none;">
		<td colspan="100%" align="right" class="normal"><textarea name="rejectReq<%=reqCount%>" id="rejectReq<%=reqCount%>" cols="30" rows="2" class="normal" onKeyDown="return imposeMaxLength(event, this, 100, 'reqLen<%=reqCount%>');" onKeyUp="return imposeMaxLength(event, this, 100, 'reqLen<%=reqCount%>');"></textarea><input readonly type="text" name="reqLen" id="reqLen<%=reqCount%>" size="2" maxlength="2" value="100" class="normal">characters left&nbsp;&nbsp;<input type="button" name="submit2" value="submit" onclick="processRequest('<%=reqCount%>')"></td>
	</tr>

  <tr>
    <td height="1" colspan="9" align="left" valign="middle" bgcolor="#F7F7F7"><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
  

<%			}//end of inner if
			}//end of if
		}//end of for 
%>   
	<tr <% if(reqCount==0){%>style="display:none;"<%}else{%> style="display:block;"<%}%> ><td colspan="9" align="center"><input name="button7" type="button" class="button" id="button7" value="S U B M I T" onclick="processRequest(<%=reqCount%>)" /></td></tr>
<%	}//end of main if

	  if(reqList.size()==0 || reqCount==0){
%>
   <tr>
    <td height="20" colspan="100%"><hr></td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle" class="bold" colspan="100%">There are no request(s) to process!!</td>
  </tr>
   <tr>
    <td height="20" colspan="100%"><hr></td>
  </tr>
<%			
	}//end of else

%>
<input type="hidden" id="size" name="size" value="<%=reqCount%>">
</table>
<input type="hidden" id="acceptArr" name="acceptArr" value="">
<input type="hidden" id="rejectArr" name="rejectArr" value="">
<input type="hidden" id="aStArr" name="aStArr" value="">
<input type="hidden" id="rStArr" name="rStArr" value="">
<input type="hidden" id="remArr" name="remArr" value="">


</form>
</body>
</html>
