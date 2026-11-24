<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%--@ page errorPage="../common/errorPage.jsp"--%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>

<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../requestor/createRequest.jsp");
	session.setAttribute("topLink", "1");

%>

<html>
<head>
<title>Untitled Document</title>
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px; 
	margin-bottom: 0px;
}
-->
</style>
<script Language="JavaScript" src="../jscripts/createRequest.js"></script>
</title>
</head>

<body>
<form name="frmCreateRequest" method = "post" action = "">

<%@ include file="../includes/policyComplianceMenu.jsp" %>


<%
	session.setAttribute("currLink","DAILY");
	session.setAttribute("leftLink","2");
%>

<table width="85%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#98BF00"><img src="../images/header.jpg" width="1000" height="64" /></td>
  </tr>
</table>

<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
 <tr>
		<td height="17" colspan="6" align="center" valign="middle" class="style4"><div align="left">My Compliance  </div>
		</td>
  </tr>
  
  <tr>
	<td valign = "top">
	<%@ include file="../includes/policyFrequecyTabs.jsp" %>
   </td>
  </tr>
<!-- </table> -->

<!-- <table width="85%" height="59" border="0" cellpadding="2" cellspacing="2"> -->
  
 <!--  <tr>
    <td width="15%" height="17" align="center" valign="middle" bgcolor="#999999" class="style1">DAILY</td>
    <td width="16%" align="center" valign="middle" bgcolor="#999999" class="style1">WEEKLY</td>
    <td width="18%" align="center" valign="middle" bgcolor="#999999" class="style1">MONTHLY</td>
    <td width="17%" align="center" valign="middle" bgcolor="#000000" class="style1">QUATERLY</td>
    <td width="18%" align="center" valign="middle" bgcolor="#999999" class="style1">HALF YEARLY</td>
    <td width="16%" align="center" valign="middle" bgcolor="#999999" class="style1">ANNUALLY</td>
  </tr> -->
  <tr >
    <td colspan="3" align="center" valign="middle" class="style1"><div align="left"><span class="menu2">MONTHLY : From  01-01-2011 to 31-03-2011 </span></div></td>
    <td colspan="3" align="center" valign="middle" class="style1" height = "30"><div align="right"></div></td>
  </tr>
<!-- </table> -->
<table width="85%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">
	  <tr>
			<td width="3%" height="26" align="left" valign="middle" bgcolor="#4498C6" class="style1">No.</td>
			<td width="25%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Risk  Category </td>
			<td width="44%" align="left" valign="middle" bgcolor="#4498C6" class="style1">POLICY</td>
			<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">ATTACHMENT</td>
			<td width="14%" align="left" valign="middle" bgcolor="#4498C6" class="style1">COMPLIANCE ASSURED </td>
			<td width="19%" align="left" valign="middle" bgcolor="#4498C6"><span class="style1">Remarks (in ANY) </span></td>
			<td width="5%" align="left" valign="middle" bgcolor="#4498C6" class="style1">COMPLIANCE<br />
			ENsured </td>
	  </tr>
	  <tr>
			<td height="36" bgcolor="#f8f8f8" class="style3">1</td>
			<td bgcolor="#f8f8f8" class="style3">A</td>
			<td bgcolor="#f8f8f8"><span class="style3">Rights to update price master are centralised</span></td>
			<td class="style3">
				<a href="javascript:void window.open('../common/attach.jsp','','resizable=yes,scrollbars=no,toolbars=no,width=300,height=20,top=0,left=0')" ><u>attach</u>
				</a>
		    </td>
			<td bgcolor="#f8f8f8" class="style3">Yes</td>
			<td valign="middle" bgcolor="#f8f8f8"><span class="style3">
			  - </span></td>
			<td valign="middle" bgcolor="#f8f8f8" class="style3">Yes</td>
	  </tr>
	  <tr>
		<td class="style3">2</td>
		<td class="style3">A</td>
		<td><span class="style3">Quarterly  review of price master viz-a-viz applicable rate card</span></td>
		<td class="style3">
			<a href="javascript:void window.open('../common/attach.jsp','','resizable=yes,scrollbars=no,toolbars=no,width=300,height=20,top=0,left=0')" ><u>attach</u>
			</a>
		</td>
		<td align="left"><span class="style3">
		  <select name="q1" class="style3">
			<option selected="selected" value = '0' id="notRated">Select</option>
			<option value = '1'>Yes</option>
			<option value = '2'>No</option>
			<option value = '3' >Not applicable</option>
		  </select>
		</span></td>
		<td>-</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
		<td bgcolor="#f8f8f8" class="style3">3</td>
		<td bgcolor="#f8f8f8" class="style3">A</td>
		<td bgcolor="#f8f8f8"><span class="style3">Controls    on Sales Order forms</span></td>
		<td class="style3">
			<a href="javascript:void window.open('../common/attach.jsp','','resizable=yes,scrollbars=no,toolbars=no,width=300,height=20,top=0,left=0')" ><u>attach</u>
			</a>
		</td>
		<td bgcolor="#f8f8f8"><span class="style3">
		  <select name="q2" class="style3">
			<option selected="selected" value= '0'>Select</option>
			<option value = '1'>Yes</option>
			<option value = '2'>No</option>
			<option value = '3' >Not applicable</option>
		  </select>
		</span></td>
		<td bgcolor="#f8f8f8"><span class="style3">
		  <textarea name="textarea"></textarea>
		</span></td>
		<td bgcolor="#f8f8f8">&nbsp;</td>
	  </tr>
	  <tr>
		<td class="style3">4</td>
		<td class="style3">A</td>
		<td><span class="style3">Printing    of the order form is centralised</span></td>
		<td  class="style3">
			<a href="javascript:void window.open('../common/attach.jsp','','resizable=yes,scrollbars=no,toolbars=no,width=300,height=20,top=0,left=0')" ><u>attach</u>
			</a>
		</td>
		<td><span class="style3">
		  <select name="q3"  class="style3">
			<option selected="selected" value = '0'>Select</option>
			<option value = '1'>Yes</option>
			<option value = '2'>No</option>
			<option value = '3' >Not applicable</option>
		  </select>
		</span></td>
		<td><span class="style3">
		  <textarea name="textarea"></textarea>
		</span></td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
		<td bgcolor="#f8f8f8" class="style3">5</td>
		<td bgcolor="#f8f8f8" class="style3">A</td>
		<td bgcolor="#f8f8f8"><span class="style3">Stationery    of the order forms and its custody is centralised</span></td>
		<td bgcolor="#f8f8f8" class="style3">
			<a href="javascript:void window.open('../common/attach.jsp','','resizable=yes,scrollbars=no,toolbars=no,width=300,height=20,top=0,left=0')" ><u>attach</u>
			</a></td>
		<td bgcolor="#f8f8f8"><span class="style3">
		  <select name="q4" class="style3">
			<option selected="selected" value = '0'>Select</option>
			<option value = '1'>Yes</option>
			<option value = '2'>No</option>
			<option value = '3' >Not applicable</option>
		  </select>
		</span></td>
		<td bgcolor="#f8f8f8"><span class="style3">
		  <textarea name="textarea"></textarea>
		</span></td>
		<td bgcolor="#f8f8f8">&nbsp;</td>
	  </tr>
	  
	  <tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
</table>
<table width="85%" height="40" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td width="100%" height="17" colspan="4" align="center" valign="middle" class="style4">
      <div align="center">
        <input type="button" name="Submit" value="Submit"  onclick="validate()"/>  
        <input type="button" name="reset" value="Reset" onclick = "javascript:clear()" />
    </div></td>
  </tr>
</table>
<p>&nbsp;</p>
</form>
</body>
</html>
