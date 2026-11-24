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

        <script Language="JavaScript" src="<%=Constants.JSCRIPTS_PATH%>util.js">
        </script>

        <script Language="JavaScript" src="<%=Constants.JSCRIPTS_PATH%>editNominee.js">
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



<p>Nomination Form for Comprehensive Medical Insurance</p>
<p>This Form may be used for Fresh Nominations, or Change in Nominations. Change in Nomination can be done only once a year during the month of May, to be effective from June of the same year.</p>
<p><strong>Only dependent family members may be nominated for Medical Insurance:</strong><BR />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. &nbsp;&nbsp;Spouse<BR />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. &nbsp;&nbsp;Dependent Children (Maximum up to 2 Children)<BR />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. &nbsp;&nbsp;Dependent Parents<BR />Married Female Employees may nominate either or both of parents-in-law, but not in a combination of one of parents and one of parents-in-law.</p>
<p><strong>Coverage:<br />
  </strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. &nbsp;&nbsp;Employee from Date of Joining<BR />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. &nbsp;&nbsp;3 dependents after completion of 1 year of service<BR />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. &nbsp;&nbsp;2 additional dependents after comlpetion of 5 years or service.</p>
<p><strong>  Employee Details </strong></p>
<table width="90%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th width="18%" scope="row"><div align="left">Employee Name </div></th>
    <td width="82%">&nbsp;</td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Pay ID </div></th>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Department</div></th>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Branch</div></th>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Location</div></th>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Designation</div></th>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Date of Joining </div></th>
    <td>&nbsp;</td>
  </tr>
</table>
<p>Dependent Family Members' Details</p>
<table width="90%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th width="3%" height="66" scope="col">Sr. No </th>
    <th width="35%" scope="col">Name of Family Member </th>
    <th width="19%" scope="col">Location (City/Town) where Family Member Resides </th>
    <th width="15%" scope="col">Relationship (Spouse / Child / Parent / Parent-in-Law)</th>
    <th width="22%" scope="col"><table width="90%" height="90" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <th colspan="3" scope="col">Date of Birth </th>
        </tr>
      <tr>
        <td><div align="center"><strong>DD</strong></div></td>
        <td><div align="center"><strong>MM</strong></div></td>
        <td><div align="center"><strong>YYYY</strong></div></td>
      </tr>
    </table></th>
    <th width="6%" scope="col">Gender</th>
  </tr>
  <tr>
    <td><div align="center">1</div></td>
    <td><input name="tfmember" type="text" id="tfmember" size="50" maxlength="50" /></td>
    <td><input name="tflocation" type="text" id="tflocation" size="20" maxlength="20" /></td>
    <td><select name="lstRel" id="lstRel">
      <option value="1" selected="selected">Spouse</option>
      <option value="2">Child</option>
      <option value="3">Parent</option>
      <option value="4">Parent-in-Law</option>
    </select>
    </td>
    <td><table width="90%" border="0" cellspacing="0" cellpadding="1">
      <tr>
        <td><div align="center">
          <select name="lstDD" id="lstDD">
            <option value="1" selected="selected">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
          </select>
          </div></td>
        <td><div align="center">
          <select name="lstMM" id="lstMM">
            <option value="1" selected="selected">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
                                        </select>
        </div></td>
        <td><div align="center">
          <select name="lstYY" id="lstYY">
            <option value="1900" selected="selected">1900</option>
                                        </select>
        </div></td>
      </tr>
    </table></td>
    <td><select name="lstGen1" id="lstGen1">
      <option value="M">M</option>
      <option value="F">F</option>
            </select></td>
  </tr>
  <tr>
    <td><div align="center">2</div></td>
    <td><input name="tfmember" type="text" id="tfmember" size="50" maxlength="50" /></td>
    <td><input name="tflocation" type="text" id="tflocation" size="20" maxlength="20" /></td>
    <td><select name="lstRel" id="lstRel">
      <option value="1" selected="selected">Spouse</option>
      <option value="2">Child</option>
      <option value="3">Parent</option>
      <option value="4">Parent-in-Law</option>
    </select></td>
    <td><table width="90%" border="0" cellspacing="0" cellpadding="1">
      <tr>
        <td><div align="center">
            <select name="lstDD" id="lstDD">
                        </select>
        </div></td>
        <td><div align="center">
            <select name="lstMM" id="lstMM">
                        </select>
        </div></td>
        <td><div align="center">
            <select name="lstYY" id="lstYY">
                        </select>
        </div></td>
      </tr>
    </table></td>
    <td><select name="lstGen2" id="lstGen2">
      <option value="M" selected="selected">M</option>
      <option value="F">F</option>
        </select></td>
  </tr>
  <tr>
    <td><div align="center">3</div></td>
    <td><input name="tfmember" type="text" id="tfmember" size="50" maxlength="50" /></td>
    <td><input name="tflocation" type="text" id="tflocation" size="20" maxlength="20" /></td>
    <td><select name="lstRel" id="lstRel">
      <option value="1" selected="selected">Spouse</option>
      <option value="2">Child</option>
      <option value="3">Parent</option>
      <option value="4">Parent-in-Law</option>
    </select></td>
    <td><table width="90%" border="0" cellspacing="0" cellpadding="1">
      <tr>
        <td><div align="center">
            <select name="lstDD" id="lstDD">
                        </select>
        </div></td>
        <td><div align="center">
            <select name="lstMM" id="lstMM">
                                                </select>
        </div></td>
        <td><div align="center">
            <select name="lstYY" id="lstYY">
                        </select>
        </div></td>
      </tr>
    </table></td>
    <td><select name="lstGen3" id="lstGen3">
      <option value="M">M</option>
      <option value="F">F</option>
    </select></td>
  </tr>
  <tr>
    <td><div align="center">4</div></td>
    <td><input name="tfmember" type="text" id="tfmember" size="50" maxlength="50" /></td>
    <td><input name="tflocation" type="text" id="tflocation" size="20" maxlength="20" /></td>
    <td><select name="lstRel" id="lstRel">
      <option value="1" selected="selected">Spouse</option>
      <option value="2">Child</option>
      <option value="3">Parent</option>
      <option value="4">Parent-in-Law</option>
    </select></td>
    <td><table width="90%" border="0" cellspacing="0" cellpadding="1">
      <tr>
        <td><div align="center">
            <select name="lstDD" id="lstDD">
                        </select>
        </div></td>
        <td><div align="center">
            <select name="lstMM" id="lstMM">
                        </select>
        </div></td>
        <td><div align="center">
            <select name="lstYY" id="lstYY">
                        </select>
        </div></td>
      </tr>
    </table></td>
    <td><select name="lstGen4" id="lstGen4">
      <option value="M">M</option>
      <option value="F">F</option>
    </select></td>
  </tr>
  <tr>
    <td><div align="center">5</div></td>
    <td><input name="tfmember" type="text" id="tfmember" size="50" maxlength="50" /></td>
    <td><input name="tflocation" type="text" id="tflocation" size="20" maxlength="20" /></td>
    <td><select name="lstRel" id="lstRel">
      <option value="1" selected="selected">Spouse</option>
      <option value="2">Child</option>
      <option value="3">Parent</option>
      <option value="4">Parent-in-Law</option>
    </select></td>
    <td><table width="90%" border="0" cellspacing="0" cellpadding="1">
      <tr>
        <td><div align="center">
            <select name="lstDD" id="lstDD">
                        </select>
        </div></td>
        <td><div align="center">
            <select name="lstMM" id="lstMM">
                        </select>
        </div></td>
        <td><div align="center">
            <select name="lstYY" id="lstYY">
                        </select>
        </div></td>
      </tr>
    </table></td>
    <td><select name="lstGen5" id="lstGen5">
      <option value="M">M</option>
      <option value="F">F</option>
    </select></td>
  </tr>
</table>
<p>
  <input type="submit" name="Submit" value="Submit" />
</p>
