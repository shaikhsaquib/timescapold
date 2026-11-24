<%--
 -- @(#)viewProfile.jsp	8/6/2002
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author  Vikrant Desai
 -- @version 	1.00, 24/8/2004
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs"%>

<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>

<%!
String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
Hashtable gender = new Hashtable();
Hashtable maritalStatus = new Hashtable();
Hashtable isHandicapped = new Hashtable();
%>


<%
gender.put("M","Male");
gender.put("F","Female");
gender.put("O","Organization");

maritalStatus.put("S","Single");
maritalStatus.put("U","Single");
maritalStatus.put("M","Married");
maritalStatus.put("."," ");
maritalStatus.put(""," ");

isHandicapped.put("N"," ");


String tempStr = "";
session.setAttribute("currLink","personal information");
session.setAttribute("leftLink","0");
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","myProfile.breadcrumb");

%>

<script>
function uploadPicture(emailId)
{

	    var frmObj = document.frmProfile;

			var url = "../profile/uploadPicture.jsp?emailId="+emailId;
			win = window.open(url,"Picture","width=375,height=150, resizable=no, status=no,toolbar=no,location=no,menubar=no,scrollbars=no");

}
</script>


<html>
	<head>
        <title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">

        <script Language="JavaScript" src="../jscripts/util.js">
        </script>

        <script Language="JavaScript" src="../jscripts/editProfile.js">
        </script>

    </head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name  = "frmProfile" method = "post">
			<%@ include file="../includes/empHeader.jsp" %>



         <%
             long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");

             // Getting the TimescapeUser Personal Details

			 Hashtable personalDetail = profileController.getPersonalDetail(timescapeUserOID, payId, legacyCompanyCode);
         %>

	
<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
		<td valign = "top">
			<%@ include file="../includes/profileTabs.jsp" %>
			<%@ include file="../includes/details.jsp" %>
		</td>
	</tr>
</table>

<%
 tempStr = (String)personalDetail.get("TITLE");
 if(tempStr == null){
    tempStr = "";
 }

String titleDesc = "";
if (personalDetail.containsKey("TITLEDESC")) {
    titleDesc = personalDetail.get("TITLEDESC") +"";
} else {
    titleDesc = tempStr;
}

 %>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td colspan="3" class="header" height="5">
		Personal Information
	</td>
  </tr>

   <tr>
	<td colspan="3" class="small" height="5">
		<img src="../images/spacer.gif" width="1" height="1">
	</td>
  </tr>

  <tr>
	<td colspan="3" class="normal" height = "20" align = "left">
		<span class = "bold">Note&nbsp;:&nbsp;</span><span class = "bluenormal">Please use Internet Explorer version 5.0 or above while browsing Timescape to ensure best functional / visual experience.</span>
	</td>
  </tr>

 <tr>
	<td colspan="3" class="small" height="5">
		<img src="../images/spacer.gif" width="1" height="1">
	</td>
  </tr>

   <tr>
	 <td width="25%" class="bold"> <div align="left">Title</div></td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> <div align="left"><%=titleDesc%></div></td>
     <input type="hidden" name="title" value="<%=tempStr%>">
  </tr>
<%
 tempStr = (String)personalDetail.get("FIRSTNAME");
 if(tempStr == null){
    tempStr = "";
 }
 %>
  <tr>
	 <td width="25%" class="bold" height = "25"> <div align="left">First Name</div></td>
	 <td width="5%"  height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> <div align="left"><%=tempStr%></div></td>
     <input type="hidden" name="firstName" value="<%=tempStr%>">
  </tr>
<%
 tempStr = (String)personalDetail.get("MIDDLENAME");
 if(tempStr == null){
    tempStr = "";
 }
 %>
  <tr>
	 <td width="25%" height = "25" class="bold"> <div align="left">Middle Name</div></td>
	 <td width="5%"  height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> <div align="left"><%=tempStr%></div></td>
     <input type="hidden" name="middleName" value="<%=tempStr%>">
  </tr>
<%
 tempStr = (String)personalDetail.get("LASTNAME");
 if(tempStr == null){
    tempStr = "";
 }
 %>
  <tr>
	 <td width="25%" class="bold">Last Name</td>
	 <td width="5%"  height="25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height="25" class="small"> <div align="left"><%=tempStr%></div></td>
     <input type="hidden" name="lastName" value="<%=tempStr%>">
  </tr>

<%
	
    tempStr = (String)personalDetail.get("DATEOFBIRTH");
    String yy = "";
    String mm = "";
    String dd = "";

    if(tempStr == null){
        tempStr = "";
    } else {
        //System.out.println(tempStr);

        if (tempStr.indexOf("-") > -1) {

            dd = tempStr.substring(0,2);
            mm = tempStr.substring(3,5);
            yy = tempStr.substring(6);
        } else {
            yy = tempStr.substring(0,4);
            mm = tempStr.substring(4,6);
            dd = tempStr.substring(6,8);
        }

    }

%>
  <!--
  <tr>
	 <td width="25%" class="bold"> <div align="left">Date of Birth</div></td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> <div align="left"><%//=dd + "-" + mm + "-" +yy%></div></td>
	 <input type="hidden" name="day" value="<%//=dd%>">
	 <input type="hidden" name="month" value="<%//=mm%>">   
	 <input type="hidden" name="year" value="<%//=yy%>">   
  </tr>
  -->
    <input type="hidden" name="day" value="<%=dd%>">
    <input type="hidden" name="month" value="<%=mm%>">   
    <input type="hidden" name="year" value="<%=yy%>">   
  
<%
 tempStr = (String)personalDetail.get("GENDER");
 if(tempStr == null){
    tempStr = "";
 }
 %>
  <tr>
	 <td width="25%" class="bold"> <div align="left">Gender</div></td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> <div align="left"><%=gender.containsKey(tempStr) ? gender.get(tempStr) : tempStr%></div></td>
     <input type="hidden" name="gender" value="<%=tempStr%>">   
  </tr>
<%
 tempStr = (String)personalDetail.get("MARITALSTATUS");
 if(tempStr == null){
    tempStr = "";
 }
%>
  <tr>
	 <td width="25%" class="bold"> <div align="left">Marital Status</div></td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> 
		<div align="left">
			<%=maritalStatus.containsKey(tempStr) ? maritalStatus.get(tempStr) : tempStr%>
		</div>
	</td>
     <input type="hidden" name="maritalStatus" value="<%=tempStr%>">   
  </tr>
<%
 tempStr = (String)personalDetail.get("NOOFFAMILYMEMBERS");
 if(tempStr == null){
    tempStr = "";
 }
%>
  <tr>
	 <td width="25%" class="bold"> <div align="left">No of Dependents</div></td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> <div align="left"><%=tempStr%></div></td>
     <input type="hidden" name="noOfFamilyMembers" value="<%=tempStr%>">
  </tr>
<%
 tempStr = (String)personalDetail.get("RELIGION");
 if(tempStr == null){
    tempStr = "";
 }
%>
  <tr>
	 <td width="25%" class="bold"> <div align="left">Religion</div></td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> <div align="left"><%=(personalDetail.containsKey("RELIGIONDESC")?personalDetail.get("RELIGIONDESC"):"")%></div></td>
     <input type="hidden" name="religion" value="<%=tempStr%>">
  </tr>
<%
 tempStr = (String)personalDetail.get("MOTHERTONGUE");
 if(tempStr == null){
    tempStr = "";
 }
%>
  <tr>
	 <td width="25%" class="bold"> <div align="left">Mother Tongue</div></td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> <div align="left"><%=(personalDetail.containsKey("LANGUAGEDESC")?personalDetail.get("LANGUAGEDESC"):"")%></div></td>
     <input type="hidden" name="motherTongue" value="<%=tempStr%>">
  </tr>


<%
/*
 tempStr = (String)personalDetail.get("BIRTHMARK");
 if(tempStr == null){
    tempStr = "";
 }
 */
%>
<!--
  <tr>
	 <td width="25%" class="bold"> <div align="left">Birth Mark</div></td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> <div align="left"><%//=tempStr%></div>
     <input type="hidden" name="birthMark" value="<%//=tempStr%>">
	 </td>
  </tr>
  -->
<%/*
 tempStr = (String)personalDetail.get("ISHANDICAPPED");
 if(tempStr == null){
    tempStr = "";
 }*/

%>
<!--
  <tr>
	 <td width="25%" class="bold">
		Handicap Description&nbsp;</td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> <div align="left"><%//=isHandicapped.containsKey(tempStr) ? isHandicapped.get(tempStr) : tempStr%></div></td>
     <input type="hidden" name="isHandicapped" value="<%//=tempStr%>">
  </tr>
  -->
<%
 tempStr = (String)personalDetail.get("PASSPORTNUMBER");
 if(tempStr == null){
    tempStr = "";
 }
%>
  <tr>
	 <td width="25%" class="bold"> <div align="left">Passport Number</div></td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"><%=tempStr%></td>
     <input type="hidden" name="passportNumber" value="<%=tempStr%>">
  </tr>
<%
 tempStr = (String)personalDetail.get("BLOODGROUP");
 if(tempStr == null){
    tempStr = "";
 }
%>
  <tr>
	 <td width="25%" class="bold">Blood Group</td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"><%=(personalDetail.containsKey("BLOODGROUPDESC")?personalDetail.get("BLOODGROUPDESC"):"")%></td>
     <input type="hidden" name="bloodGroup" value="<%=tempStr%>">
  </tr>
<%
 tempStr = (String)personalDetail.get("PANNUMBER");
 if(tempStr == null){
    tempStr = "";
 }
%>
  <tr>
	 <td width="25%" class="bold" height = "25">PAN Number</td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"><%=tempStr%></td>
     <input type="hidden" name="panNumber" value="<%=tempStr%>">
  </tr>
<%
 tempStr = (String)personalDetail.get("PFACCOUNTNUMBER");
 if(tempStr == null){
    tempStr = "";
 }
%>
  <tr>
	 <td width="25%" class="bold" height = "25"><font face="Verdana, Arial, Helvetica, sans-serif">PF
		Account Number</font></td>
	 <td width="5%" height = "25" class="bold"> <div align="center"><strong>:</strong></div></td>
	 <td width="70%" height = "25" class="small"> <div align="left"><%=tempStr%></div></td>
     <input type="hidden" name="pfAccountNumber" value="<%=tempStr%>">
  </tr>
<%
 tempStr = (String)personalDetail.get("ALTERNATEEMAILID");
 if(tempStr == null){
    tempStr = "";
 }
%>
  <tr>
	 <td width="25%" class="bold" height = "25"> <div align="left">Alternate Email ID</div></td>
	 <td width="5%" height = "25"> <div align="center" class="bold"><strong>:</strong></div></td>
	 <td width="70%" class="small" height = "25"><%=tempStr%></td>
     <input type="hidden" name="alternateEmailId" value="<%=tempStr%>">
  </tr>

<%

 if(personalDetail.containsKey("detailAction")){
    tempStr = (String)personalDetail.get("detailAction");
 } else {
     tempStr = "UPDATE";
 }
%>
<input type="hidden" name="detailAction" value="<%=tempStr%>">
  <tr>
	 <td width="25%" class="bold">&nbsp;</td>
	 <td width="5%">&nbsp;</td>
	 <td width="75%">&nbsp;</td>
  </tr>
  <tr>
	 <td width="25%" class="bold">&nbsp;</td>
	 <td width="5%">&nbsp;</td>
	 <td width="75%">
		<a href="javascript:editUser( )"><img src="../images/but_edit.gif" border="0"></a>
		</td>
  </tr>
</table>


</form>
</body>
</html>