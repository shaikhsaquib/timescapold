<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.ArrayList"%>

<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController"/>
<jsp:useBean id="domainObj" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" />

<%
	String requestId	= (String)request.getParameter("requestId");
	String optValue		= (String)request.getParameter("optValue");

	optValue = optValue==null ? "" : optValue;

	Hashtable criteriaHash = new Hashtable();
	ArrayList compList = new ArrayList();
	ArrayList locationList = new ArrayList();
	ArrayList branchList = new ArrayList();
	ArrayList deptList = new ArrayList();

	//criteriaHash.put("COMPANYCODE", companyCode);

	//String expList ="'EPHL','PPL','TPHL'";

	compList = domainObj.listCompanies(criteriaHash);
	locationList = domainObj.listLocations(criteriaHash);
	branchList = domainObj.listBranches(criteriaHash);
	deptList = domainObj.listDepartments(criteriaHash);

	//out.println(compList.size());

	ArrayList reqList = new ArrayList();
	Hashtable detailsHash = new Hashtable();

	detailsHash.put("REQUESTID", requestId);

	reqList = assetMgmt.getMyRequests(detailsHash);


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>SURPLUS ASSET MANAGEMENT</title>
		<link href="../style/common.css" rel="stylesheet" type="text/css"/>
		<script src="../jscripts/util.js" type="text/javascript"></script>
		<script src="../jscripts/common.js" type="text/javascript"></script>
		<script src="../jscripts/characterCount.js" type="text/javascript"></script>
		<script src="../jscripts/viewDetails.js" type="text/javascript"></script>
	</head>
<body>
<form name="frmViewDetails" method="post" >
 <table width="100%" border="0" cellpadding="0" cellspacing="2">
    <tr>
      <td height="20" bgcolor="#E7EAEF" class="budgetMenuBG">SURPLUS ASSET DETAILS</td>
    </tr>
</table>
 <table width="100%" border ="0" cellspacing="0" cellpadding="1">
<input type="hidden" name="optValue" value ="<%=optValue%>"/>
<input type="hidden" name="requestId" value= "<%=requestId%>"/>

<%

	if(reqList.size()==0){
%>
   <tr>
    <td height="20" colspan="100%"><hr></td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle" class="bold" colspan="100%">There are no details to show!!</td>
  </tr>
   <tr>
    <td height="20" colspan="100%"><hr></td>
  </tr>

<%
	}else{

		for(int ii=0; ii< reqList.size(); ii++){

			String tmpArr[] = (String [])reqList.get(ii);

%>
   <tr>
	 <td width="2%" align="left" valign="middle" class="nav" >&nbsp;</td>
    <td width="30%" height="25-" align="left" valign="middle" class="nav" >NAME OF ASSET :</td>
    <td width="20%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[3]%></td>
    <td width="3%" height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td width="22%" height="25" align="left" valign="middle" class="nav" >AVAILABLE FROM :</td>
    <td width="25%" height="25" align="left" valign="middle" class="normal"><%=tmpArr[15]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >ASSET NO. :</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[1]%></td>
    <td height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >DATE OF INSTALLATION :</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[6]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>

   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >TYPE :</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[5]%></td>
    <td height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >CATEGORY</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[4]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>

  <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >ORIGINAL COST :</td>
    <td height="25" align="left" valign="middle" class="normal"><img src="../images/rupee.png" width="8" height="10">&nbsp;<%=tmpArr[7]%></td>
    <td height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >CURRENT VALUE/COST :</td>
    <td height="25" align="left" valign="middle" class="normal"><img src="../images/rupee.png" width="8" height="10">&nbsp;<%=tmpArr[8]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>

    <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >LOCATION :</td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"> <%=tmpArr[9].indexOf("-")>-1?tmpArr[9].substring(tmpArr[9].indexOf("-")+1).trim():tmpArr[9]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>

   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >MODEL :</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[11]%></td>
    <td height="25" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >SERIAL NUMBER :</td>
    <td height="25" align="left" valign="middle" class="normal"><%=tmpArr[2]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>

   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >DESCRIPTION <br> (make/capacity/specifications) : </td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"><%=tmpArr[13]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >PRESENT CONDITION : </td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"><%=tmpArr[14]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >OWNERSHIP :</td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"><%=tmpArr[19]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
   
   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >POSTING DATE :</td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"><%=tmpArr[20]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >CREATED BY :</td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"><%=tmpArr[17]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="25" align="left" valign="middle" class="nav" >CREATER EMAILID :</td>
    <td height="25" colspan="4" align="left" valign="middle" class="normal"><%=tmpArr[18]%></td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
	<tr>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="25" align="left" valign="middle" class="nav" >REVIEWED BY :</td>
		<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[23]%></td>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="25" align="left" valign="middle" class="nav">REVIEWED ON :</td>
		<td height="25" align="left" valign="middle" class="normal"><%=tmpArr[25]%></td>
	</tr>
	<tr>
		<td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
	<tr>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="25" align="left" valign="middle" class="nav" >STATUS :</td>
		<td height="25" colspan="4" align="left" valign="middle" class="normal"><img src="<%=statusImg.get(tmpArr[30].equals("CL")? tmpArr[69] : tmpArr[30])%>" border="0"></td>
	</tr>
	<tr>
		<td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
	</tr>
<%
		} //END OF FOR
	}//END OF ELSE
%>
<%
	
	if(optValue.equals("ATN")){
%>

	 <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
     <td height="30" align="left" valign="middle" class="nav" >COMPANY : *</td>
     <td height="30" colspan="4" align="left" valign="middle" class="normal"><select name="transferCompany" class="normal" id="transferCompany">
       <option value="0">Select Company</option>
<%
	for(int ii=0; ii<compList.size();ii++){
		String tmpArr[] = (String[])compList.get(ii);
%>
       <option value="<%=tmpArr[6]%>"><%=tmpArr[1]%></option>
<%
	 }
%>
</select></td>
   </tr>
	 <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
     <td height="30" align="left" valign="middle" class="nav" >BRANCH : *</td>
     <td height="30" colspan="4" align="left" valign="middle" class="normal"><select name="transferBranch" class="normal" id="transferBranch">
       <option value="0">Select Branch</option>
<%
	for(int ii=0; ii<branchList.size();ii++){
		String tmpArr[] = (String[])branchList.get(ii);
%>
       <option value="<%=tmpArr[5]%>"><%=tmpArr[3]%></option>
<%
	 }
%>
</select></td>
   </tr>

	<tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
     <td height="30" align="left" valign="middle" class="nav" >LOCATION : *</td>
     <td height="30" colspan="4" align="left" valign="middle" class="normal"><select name="transferLocation" class="normal" id="transferLocation">
       <option value="0">Select Locations</option>
<%
	for(int ii=0; ii<locationList.size();ii++){
		String tmpArr[] = (String[])locationList.get(ii);
%>
       <option value="<%=tmpArr[8]%>"><%=tmpArr[5]%></option>

<%
	 }
%>
</select></td>
   </tr>

	<tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
     <td height="30" align="left" valign="middle" class="nav" >DEPARTMENT : *</td>
     <td height="30" colspan="4" align="left" valign="middle" class="normal"><select name="transferDept" class="normal" id="transferDept">
       <option value="0">Select Department</option>
<%
	for(int ii=0; ii<deptList.size();ii++){
		String tmpArr[] = (String[])deptList.get(ii);
%>
       <option value="<%=tmpArr[5]%>"><%=tmpArr[3]%></option>

<%
	 }
%>
</select></td>
   </tr>

	<tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
  
    <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav" >REMARKS/JUSTIFICATION : *</td>
    <td height="30" colspan="4" align="left" class="normal">
		<textarea name="ATNJustification" cols="40" rows="3" class="normal" onKeyDown="textCounter(document.frmViewDetails.ATNJustification,document.frmViewDetails.remLen,500)" onKeyUp="textCounter(document.frmViewDetails.ATNJustification,document.frmViewDetails.remLen,500)"></textarea>
			<input readonly type="text" style="color:#8F8F8F;font-size:10px;padding-bottom:2px;"name="remLen" size="3" maxlength="3" value="500">characters left
	</td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
    <tr>
	<td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav">TRANSFEROR DEPT. HEAD : *</td>
    <td height="30" colspan="4" align="left" valign="middle" class="normal">
		<input name="senderDeptHead" size="30" class="normal" maxlength="100" id="senderDeptHead" onClick="addUser('senderDeptHead',this.id)" readonly/>
		<input type="hidden" name="senderDeptHeadH" size="30" class="normal" maxlength="100" id="senderDeptHeadH"/>
		<input type="hidden" name="senderDeptHeadN" size="30" class="normal" maxlength="100" id="senderDeptHeadN"/>
	</td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
  <tr>
	<td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav">TRANSFEROR BRANCH HEAD : *</td>
    <td height="30" colspan="4" align="left" valign="middle" class="normal">
		<input name="branchHead" size="30" class="normal" maxlength="100" id="branchHead" onClick="addUser('branchHead',this.id)" readonly/>
		<input type="hidden" name="branchHeadH" size="30" class="normal" maxlength="100" id="branchHeadH"/>
		<input type="hidden" name="branchHeadN" size="30" class="normal" maxlength="100" id="branchHeadN"/>
	</td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
  <tr>
	<td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav">TRANSFEREE BRANCH HEAD : *</td>
    <td height="30" colspan="4" align="left" valign="middle" class="normal">
		<input name="receiverBranchHead" size="30" class="normal" maxlength="100" id="receiverBranchHead" onClick="addUser('receiverBranchHead',this.id)" readonly/>
		<input type="hidden" name="receiverBranchHeadH" size="30" class="normal" maxlength="100" id="receiverBranchHeadH"/>
		<input type="hidden" name="receiverBranchHeadN" size="30" class="normal" maxlength="100" id="receiverBranchHeadN"/>
	</td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
    <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav">TRANSFEREE DEPT. HEAD : *</td>
    <td height="30" colspan="4" align="left" valign="middle" class="normal">
		<input name="receiverDeptHead" size="30" class="normal" maxlength="100" id="receiverDeptHead" onClick="addUser('receiverDeptHead',this.id)" readonly/>
		<input type="hidden" name="receiverDeptHeadH" size="30" class="normal" maxlength="100" id="receiverDeptHeadH"/>
		<input type="hidden" name="receiverDeptHeadN" size="30" class="normal" maxlength="100" id="receiverDeptHeadN"/>
	</td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
	<tr>
		<td height="60" colspan="100%" align="center" valign="middle" class="normal">
			<input type="button" class="button" onclick="validateValues('<%=optValue%>')" value="C R E A T E    A T N"/>&nbsp;&nbsp;
			<input type="button" class="button" onclick="javascript:window.close()" value="C L O S E"/></td>
	</tr>
<%
	}else if(optValue.equals("ADN")){
%>
  
    <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav">REASON FOR DISPOSAL  : *</td>
    <td height="30" colspan="4" align="left" class="normal">
		<textarea name="reasonForDisposal" cols="30" rows="3"  onKeyDown="textCounter(document.frmViewDetails.reasonForDisposal,document.frmViewDetails.remLen2,500)" onKeyUp="textCounter(document.frmViewDetails.reasonForDisposal,document.frmViewDetails.remLen2,500)"></textarea>
			<input readonly type="text" style="color:#8F8F8F;font-size:10px;padding-bottom:2px;"name="remLen2" size="3" maxlength="3" value="500">characters left
	</td>
  </tr>
   <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
    <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav">AUTHORITY1 : *</td>
    <td height="30" colspan="4" align="left" valign="middle" class="normal">
		<input name="verifiedBy" size="30" class="normal" maxlength="100" id="verifiedBy" onClick="addUser('verifiedBy',this.id)" readonly/>
        <input type="hidden" name="verifiedByH"  value="" size="30" class="normal" maxlength="100" id="verifiedByH"/>
        <input type="hidden" name="verifiedByN" value="" size="30" class="normal" maxlength="100" id="verifiedByN"/>
	</td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
    <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav">AUTHORITY2 : *</td>
    <td height="30" colspan="4" align="left" valign="middle" class="normal">
		<input name="proposedBy" size="30" class="normal" maxlength="100" id="proposedBy" onClick="addUser('proposedBy',this.id)" readonly/>
		<input type="hidden" name="proposedByH" size="30" class="normal" maxlength="100" id="proposedByH"/>
		<input type="hidden" name="proposedByN" size="30" class="normal" maxlength="100" id="proposedByN"/>
	</td>
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
    <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav">FINANCE HEAD : *</td>
    <td height="30" colspan="4" align="left" valign="middle" class="normal">
		<input name="approvedBy" size="30" class="normal" maxlength="100" id="approvedBy" onClick="addUser('approvedBy',this.id)" readonly/>
		<input type="hidden" name="approvedByH" size="30" class="normal" maxlength="100" id="approvedByH"/>
		<input type="hidden" name="approvedByN" size="30" class="normal" maxlength="100" id="approvedByN"/>
	</td>
  </tr>
<!--   <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
    <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav">MAS HEAD : *</td>
    <td height="30" colspan="4" align="left" valign="middle" class="normal">
		<input name="adminHead" size="30" class="normal" maxlength="100" id="adminHead" onClick="addUser('adminHead',this.id)" readonly/>
		<input type="hidden" name="adminHeadH" size="30" class="normal" maxlength="100" id="adminHeadH"/>
		<input type="hidden" name="adminHeadN" size="30" class="normal" maxlength="100" id="adminHeadN"/>
	</td>
  </tr>
 -->
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
    <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav">DIRECTOR : *</td>
    <td height="30" colspan="4" align="left" valign="middle" class="normal">
		<input name="branchHead" size="30" class="normal" maxlength="100" id="branchHead" onClick="addUser('branchHead',this.id)" readonly/>
		<input type="hidden" name="branchHeadH" size="30" class="normal" maxlength="100" id="branchHeadH"/>
		<input type="hidden" name="branchHeadN" size="30" class="normal" maxlength="100" id="branchHeadN"/>
	</td>
  </tr>
			<tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
    <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav">MD/COO/CEO :</td>
    <td height="30" colspan="4" align="left" valign="middle" class="normal">
		<input name="internalAudit" size="30" class="normal" maxlength="100" id="internalAudit" onClick="addUser('internalAudit',this.id)" readonly/>(Optional)
		<input type="hidden" name="internalAuditH" size="30" class="normal" maxlength="100" id="internalAuditH"/>
		<input type="hidden" name="internalAuditN" size="30" class="normal" maxlength="100" id="internalAuditN"/>
	</td>
  </tr> 
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
	<tr>
		<td height="60" colspan="100%" align="center" valign="middle" class="normal">
			<input type="button" class="button" onclick="validateValues('<%=optValue%>')" value="C R E A T E   A D N"/>&nbsp;&nbsp;
			<input type="button" class="button" onclick="javascript:window.close()" value="C L O S E"/></td>
	</tr>
<%
	}else{
%>
	<tr>
		<td height="60" colspan="100%" align="center" valign="middle" class="normal">
			<input type="button" class="button" onclick="javascript:window.close()" value="C L O S E"/></td>
	</tr>
<%
	}
%>
</table>
</form>
</body>
</html>