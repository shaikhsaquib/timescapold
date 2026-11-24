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
 -- @author  Amey Divekar
 -- @version 	1.00, April 29, 2007
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
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


<html>
	<head>
        <title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">

        <script Language="JavaScript" src="../jscripts/util.js">
        </script>

        <script Language="JavaScript" src="../jscripts/editNominee.js">
        </script>

		<script language="JavaScript">
			function editDetails()
			{
				window.location="editMediclaimNominations.jsp";
			}

		</script>

    </head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name  = "frmNominee" method = "post">
			<%@ include file="../includes/empHeader.jsp" %>



         <%
             long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");

             // Getting the TimescapeUser Personal Details
             Hashtable personalDetail = profileController.getPersonalDetail(timescapeUserOID, payId, companyCode);


			 //Retrieve employee Mediclaim Nomination Details here and display them in the table below later
			//Hashtable mediclaimNomineeDetail=profileController.getMediclaimNomineeDetail(timescapeUserIOD);

         %>

	
<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
		<td valign = "top">
			<%@ include file="../includes/profileTabs.jsp" %>
			
		</td>
	</tr>
</table>




<p><div class="header">Nomination Form for Comprehensive Medical Insurance</div></p>
<p><div class="normal">This Form may be used for Fresh Nominations, or Change in Nominations. Change in Nomination can be done only once a year during the month of May, to be effective from June of the same year.</p>
<p><strong>Only dependent family members may be nominated for Medical Insurance:</strong><BR />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. &nbsp;&nbsp;Spouse<BR />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. &nbsp;&nbsp;Dependent Children (Maximum up to 2 Children)<BR />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. &nbsp;&nbsp;Dependent Parents<BR />Married Female Employees may nominate either or both of parents-in-law, but not in a combination of one of parents and one of parents-in-law.</p>
<p><strong>Coverage:<br />
  </strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. &nbsp;&nbsp;Employee from Date of Joining<BR />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. &nbsp;&nbsp;3 dependents after completion of 1 year of service<BR />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. &nbsp;&nbsp;2 additional dependents after comlpetion of 5 years or service.</p>
<!--p><strong>  Employee Details </strong></p></div-->
<%@ include file="../includes/details.jsp" %><p><div class="header">Dependent Family Members' Details</div></p>
<table width="90%" border="1" cellspacing="0" cellpadding="1">
  <tr>
    <th height="66" scope="col"><div class="normal"><strong>Sr. No </th>
    <th scope="col"><div class="normal"><strong>Name of Family Member </th>
    <th scope="col"><div class="normal"><strong>Location (City/Town) where Family Member Resides </th>
    <th scope="col"><div class="normal"><strong>Relationship (Spouse/Child/Parent/Parent-in-Law</th>
    <th scope="col"><table width="90%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th colspan="3" scope="col"><div class="normal"><strong>Date of Birth </th>
        </tr>
      <!--tr>
        <td><strong><div class="normal"><strong>DD</strong></td>
        <td><strong><div class="normal"><strong>MM</strong></td>
        <td><strong><div class="normal"><strong>YYYY</strong></td>
      </tr-->
    </table></th>
    <th scope="col"><div class="normal"><strong>Gender</th>
  </tr>
  <tr>
    <td><div align="center" class="normal">1</div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center" class="normal">2</div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center" class="normal">3</div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center" class="normal">4</div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center" class="normal">5</div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<p>
<table width="90%" cellpadding="1">
	<tr>
		<td align="center">
			<a href="javascript:editDetails()"><img src="../images/but_edit.gif" border="0"></a>
		</td>

 </table>
</p>

</form>
</body>
</html>