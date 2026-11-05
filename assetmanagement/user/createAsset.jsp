<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.Calendar, java.util.Date" %>

<jsp:useBean id="domainObj" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" />

<%
	Hashtable criteriaHash = new Hashtable();
	ArrayList locationList = new ArrayList();

	//criteriaHash.put("COMPANYCODE", companyCode);

	locationList = domainObj.listLocations(criteriaHash);

	String roleCode = (String)session.getAttribute("roleCode");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>SURPLUS ASSET MANAGEMENT</title>
		<link href="../style/global.css" rel="stylesheet" type="text/css" />
		<script src="../jscripts/util.js" type="text/javascript"></script>
		<script src="../jscripts/characterCount.js" type="text/javascript"></script>
		<script src="../jscripts/createAsset.js" type="text/javascript"></script>
		<script src="../jscripts/common.js" type="text/javascript"></script>
		<link href="../style/calendarControl.css"rel="stylesheet">
		<script src="../jscripts/calendarControl.js"language="javascript"></script>
		<script src="../jscripts/jquery.js"language="javascript"></script>
	</head>

<body>
<form name="frmCreateAsset" method="post" >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%"><img src="../images/SAM_header.jpg" width="576" height="72" /></td>
	<td width="50%" valign="bottom">
					<%@ include file="../includes/relatedLinks.jsp" %>
		</td>

    <!-- <td width="50%" valign="bottom" onmouseover="" onmouseout=""><img src="../images/related_links.png" width="18" height="18" /><span class="boldsmall">Related links&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
  </tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">
    <tr>
      <td height="20" bgcolor="#E7EAEF" class="budgetMenuBG">CREATE SURPLUS ASSET</td>
    </tr>
    <tr>
      <td height="20" class="small">All fields are mandatory.</td>
    </tr>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="0">
  <tr>
    <td width="12%" align="left" valign="middle" class="nav" >&nbsp;</td>
    <td width="15%" height="30" align="left" valign="middle" class="nav" >NAME OF ASSET :</td>
    <td width="9%" height="30" align="left" valign="middle" class="normal"><input name="nameOfAsset" size="30" class="normal" maxlength="100" /></td>
	<td width="5%" height="30" align="right" valign="middle" class="nav">&nbsp;</td>
	<td width="20%" height="30" align="left" valign="middle" class="nav">ASSET NO. :</td>
    <td width="40%" height="30" align="left" valign="middle" class="normal"><input name="assetNo" size="30" class="normal" maxlength="100" /></td>
  </tr>
  <tr>
    <td height="1" colspan="8" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="30" align="left" valign="middle" class="nav" >TYPE :</td>
		<td height="30" align="left" valign="middle" class="normal">
			<select name="assetType" class="small" id="assetType">
				<option value="0" selected="selected">Select </option>
				<option name="Reusable" value="Reusable">Reusable</option>
				<option name="Disposable" value="Disposable">Disposable</option>
			</select>
		</td>
		<td height="30" align="right" valign="middle" class="nav" >&nbsp;</td>
		<td height="30" align="left" valign="middle" class="nav" >CATEGORY :</td>
		<td height="30" align="left" valign="middle" class="normal">
			<select name="assetCategory" class="small" id="assetCategory">
				<option value="0">Select Category</option>
				<option value="Computers">Computers</option>
				<option value="Office Equipment">Office Equipment</option>
				<option value="Machinery">Machinery</option>
				<option value="Furniture Items">Furniture Items</option>
				<option value="Vehicle">Vehicle</option>
			</select>
		</td>
 </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
	<tr>
		<td align="left" valign="middle" class="nav" >&nbsp;</td>
		<td height="30" align="left" valign="middle" class="nav" >DATE OF INSTALLATION :</td>
		<td height="30" colspan="4" align="left" valign="middle" class="normal"><input type="text" class="normal" id="installationDate" name="installationDate" onfocus="showCalendarControl(this);" readOnly></td>
	</tr>
	<tr>
		<td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
	</tr>
  <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
     <td height="30" align="left" valign="middle" class="nav" >ORIGINAL COST :</td>
     <td height="30" align="left" valign="middle" class="normal"><img src="../images/rupee.png" width="8" height="10">&nbsp;<input name="originalCost" class="normal" maxlength="100" /></td>
     <td height="30" align="right" valign="middle" class="nav" >&nbsp;</td>
     <td height="30" align="left" valign="middle" class="nav" >CURRENT VALUE/COST :</td>
     <td height="30" align="left" valign="middle" class="normal"><img src="../images/rupee.png" width="8" height="10">&nbsp;<input name="currentCost" class="normal" maxlength="100" /></td>
  </tr>
   <tr>
     <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
   </tr>
      <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
     <td height="30" align="left" valign="middle" class="nav" >LOCATION :</td>
     <td height="30" colspan="4" align="left" valign="middle" class="normal"><select name="assetLocation" class="small" id="assetLocation">
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
     <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
   </tr>
<!--  <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="60" align="left" valign="middle" class="nav" >MAKE :</td>
    <td height="60" colspan="4" align="left" valign="middle" class="normal">
		<textarea name="assetMake" cols="40" rows="3" class="normal" onKeyDown="textCounter(document.frmCreateAsset.assetMake,document.frmCreateAsset.remLen1,500)" onKeyUp="textCounter(document.frmCreateAsset.assetMake,document.frmCreateAsset.remLen1,500)"></textarea>    <input readonly type="text" style="color:#8F8F8F;font-size:10px;padding-bottom:2px;" name="remLen1" size="3" maxlength="3" value="500">characters left
	</td>
  </tr>
   <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav"><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>-->
   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav" >MODEL :</td>
    <td height="30" align="left" valign="middle" class="normal"><input name="assetModel" size="30" class="normal" maxlength="100" /></td>
    <td height="30" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav" >SERIAL NUMBER :</td>
    <td height="30" align="left" valign="middle" class="normal"><input name="assetSerialNo" size="30" class="normal" maxlength="100" /></td>
  </tr>
   <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr> 
<!--   <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
     <td height="30" align="right" valign="middle" class="nav" >CAPACITY :</td>
     <td height="30" align="right" valign="middle" class="nav" >&nbsp;</td>
     <td height="30" colspan="4" align="left" valign="middle" class="normal"><input name="assetCapacity" class="normal" maxlength="100" /></td>
  </tr>
 <tr> 
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>-->
  <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
     <td height="60" align="left" valign="middle" class="nav" >DESCRIPTION <br>(make/capacity/specifications) :</td>
     <td height="60" colspan="4" align="left" valign="middle" class="normal">
		<textarea name="assetSpecification" cols="40" rows="3" class="normal" onKeyDown="textCounter(document.frmCreateAsset.assetSpecification,document.frmCreateAsset.remLen2,500)" onKeyUp="textCounter(document.frmCreateAsset.assetSpecification,document.frmCreateAsset.remLen2,500)"></textarea>    <input readonly type="text" style="color:#8F8F8F;font-size:10px;padding-bottom:2px;"name="remLen2" size="3" maxlength="3" value="500">characters left
  </tr>
   <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
     <td height="60" align="left" valign="middle" class="nav">PRESENT CONDITION :</td>
     <td height="60" colspan="4" align="left" valign="middle" class="normal">
		<textarea name="assetCondition" cols="40" rows="3" class="normal" onKeyDown="textCounter(document.frmCreateAsset.assetSpecification,document.frmCreateAsset.remLen3,500)" onKeyUp="textCounter(document.frmCreateAsset.assetSpecification,document.frmCreateAsset.remLen3,500)"></textarea>    <input readonly type="text" style="color:#8F8F8F;font-size:10px;padding-bottom:2px;"name="remLen3" size="3" maxlength="3" value="500">characters left
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
  <td width="12%" align="left" valign="middle" class="nav" >&nbsp;</td>
    <td width="15%" height="30" align="left" valign="middle" class="nav" >DATE OF AVAILABILITY :</td>
    <td width="9%" height="30" align="left" valign="middle" class="normal"><input type="text" class="normal" id="assetAvailableFromDate" name="assetAvailableFromDate" onfocus="showCalendarControl(this);" readOnly></td>
	<td width="5%" height="30" align="right" valign="middle" class="nav">&nbsp;</td>
	<td width="20%" height="30" align="left" valign="middle" class="nav">ATTACHMENT :</td>
    <td width="40%" height="30" align="left" valign="middle" class="normal"><input class="style7" value="Attachment" type="text" name="attachment1" id="attachment1" onclick ="javascript:void window.open('../upload/uploadFile.jsp?attachmentName=attachment1','','resizable=yes,scrollbars=no,toolbars=no,status=yes,width=450,height=150,top=70,left=100')" readOnly/></td>
<!--  
	 <td align="left" valign="middle" class="nav" >&nbsp;</td>
    <td height="30" align="left" valign="middle" class="nav" > DATE OF AVAILABILITY :</td>
    <td height="30" colspan="4" align="left" valign="middle" class="normal"><input type="text" class="normal" id="assetAvailableFromDate" name="assetAvailableFromDate" onfocus="showCalendarControl(this);" readOnly></td>
	<td width="5%" height="30" align="right" valign="middle" class="nav">&nbsp;</td>
	<td width="20%" height="30" align="left" valign="middle" class="nav">ASSET NO. :</td>
    <td width="40%" height="30" align="left" valign="middle" class="normal"><input name="assetNo" size="30" class="normal" maxlength="100" /></td>-->
  </tr>
  <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
	<input type="hidden" name="reviewedBy" value="44861|saibal.nag@timesgroup.com">
	<!-- <input type="hidden" name="reviewedBy" value="28821|sachin.kale@timesgroup.com">  -->
 <!--  <tr>
    <td height="60" align="right" valign="middle" class="nav" >REVIEWED BY :</td>
    <td height="60" colspan="4" align="left" valign="middle" class="normal">
		<select name="reviewedBy" class="small" id="reviewedBy">
			<option value="">Select Authority</option>
			<option value="11112|sanjay.singh5@timesgroup.com">Authority 1</option>
			<option value="91|sundaram.sethuraman@timesgroup.com">Authority 2</option>
		</select>
	</td>
  </tr>
 <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr> -->
  <tr>
    <td height="40" align="right" valign="middle" class="nav" >&nbsp;</td>
    <td align="right" valign="middle" class="nav" >&nbsp;</td>
    <td colspan="4" align="left" valign="middle" class="normal"><input type="button" class="button" onclick="validateValues()" value="C R E A T E   A S S E T" />&nbsp;&nbsp;<input type="button" class="button" onclick="this.form.reset()" value="R E S E T" /></td>
</tr>
 <tr>
    <td height="1" colspan="6" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
</table>
<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="54" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td width="51%" bgcolor="#F8F8F8"><img src="../images/SAM_footer.jpg" width="514" height="25" /></td>
			<td width="49%" bgcolor="#F8F8F8" valign="bottom">
					<%//@ include file="../includes/relatedLinks.jsp" %>
		</td>
  </tr>
</table>
 -->
</form>
</body>
</html>