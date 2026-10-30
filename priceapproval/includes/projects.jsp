<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<% int flg = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL</title>
<link href="style/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/util.js"></script>
<script Language="JavaScript" src="../jscripts/common.js"></script>
<script Language="JavaScript" src="../jscripts/search.js"></script>
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
<script src="../jscripts/calendarControl.js" language="javascript"></script>
<link href="../style/calendarControl.css" rel="stylesheet">

<script>

var count=0;
var limit=0;
var count1=0;
function add(type) {
	
	if(count1!=0){
	
	var contentID = document.getElementById('fooBar');
	var contentID1 = document.getElementById('fooBar1');
	contentID.removeChild(document.getElementById('pname1'));
	contentID1.removeChild(document.getElementById('pbudg1'));
	document.getElementById("text").innerHTML = "&nbsp";
	document.getElementById("text1").innerHTML = "&nbsp";
	count1=0;
	}
	document.getElementById("data").style.display='none';

    //Create an input type dynamically.
    if(limit==0 || count==0){
	var element = document.createElement("input");
    document.getElementById('projectList').value = 0;

    //Assign different attributes to the element.
    element.setAttribute("id", "pname");
    element.setAttribute("type", type);
    element.setAttribute("name", "pname");
	document.getElementById("text").innerHTML = 'Enter Project Name:';

	var element1 = document.createElement("input");
    
    //Assign different attributes to the element.
    element1.setAttribute("id", "pbudg");
    element1.setAttribute("type", type);
    element1.setAttribute("name", "pbudg");
	document.getElementById("text1").innerHTML = 'Enter Budget / Sanction:'; 
 
    var foo = document.getElementById("fooBar");
    var foo1 = document.getElementById("fooBar1");

    //Append the element in page (in span).
    foo.appendChild(element);
	foo1.appendChild(element1);
	limit=1;
	
	}
	count=1;
}

function delRow()
{	
	if(count!=0){
	
	var contentID = document.getElementById('fooBar');
	var contentID1 = document.getElementById('fooBar1');
	contentID.removeChild(document.getElementById('pname'));
	contentID1.removeChild(document.getElementById('pbudg'));
	document.getElementById("text").innerHTML = "&nbsp";
	document.getElementById("text1").innerHTML = "&nbsp";
	count=0;
	}
	var projnbudg	= document.getElementById('projectList').value;
	var res			= projnbudg.split(",");
	projectName		= res[0];
	budget			= res[1];
	

	if(document.getElementById('projectList').value!=0 ){
	//alert();
	if(count1==0){
	var projectName;
	var budget;
	
	
	var element = document.createElement("input");

    //Assign different attributes to the element.
    element.setAttribute("id", "pname1");
    element.setAttribute("type", "textbox");
    element.setAttribute("name", "pname1");
    element.setAttribute("value", projectName );
	document.getElementById("text").innerHTML = 'Enter Project Name:';
	document.getElementById("text").bgcolor='#fbf9f9';

	var element1 = document.createElement("input");
    
    //Assign different attributes to the element.
    element1.setAttribute("id", "pbudg1");
    element1.setAttribute("type", "textbox");
    element1.setAttribute("name", "pbudg1");
	element1.setAttribute("value", budget);
	document.getElementById("text1").innerHTML = 'Enter Budget / Sanction:'; 
	document.getElementById("text1").bgcolor='#fbf9f9';
 
    var foo = document.getElementById("fooBar");
    var foo1 = document.getElementById("fooBar1");
	
    //Append the element in page (in span).
    foo.appendChild(element);
	foo1.appendChild(element1);
	
	document.getElementById("pname1").readOnly = true;
	document.getElementById("pbudg1").readOnly = true;
	count1=1;
	}
	else{
	document.getElementById('pname1').value = projectName;
	document.getElementById('pbudg1').value = budget;
	document.getElementById("pname1").readOnly = true;
	document.getElementById("pbudg1").readOnly = true;
	}
	}
	
}




</script>
<%
	
    ArrayList projectList = priceApprovalWebController.getProjectNames("Projects");
    //String = "hi";
%>
<body>
<form name="projectSub" id="projectSub" >
<table width="100%" border="0">

	<tr>
    <td height="26" colspan="100"  class="travelMenuBG" >PROJECT DETAILS</td>
	</tr>
	<tr>
		<td colspan ="100" height ="30%">&nbsp;</td>
	</tr>
	<tr>
		<td width ="10%" bgcolor="#fbf9f9">&nbsp;</td>
		<td width ="25%" bgcolor="#fbf9f9">Select Project</td>
		<td width ="30%" bgcolor="#fbf9f9" >
			<select id="projectList"  name ="projectList" onchange="delRow();addData()">
				<option value="0">Select Project</option>
				<%
				  for(int ii=0 ; ii < projectList.size( ); ii++) {
		
					String project[ ] = (String[ ]) projectList.get(ii); 	
				%>
					<option value="<%=project[0]+","+project[1]%>"><%=project[0]%></option>
				<%
					}
				%>
			</select>
		</td>
		<td width ="35%"  bgcolor="#fbf9f9">
			<input type="button" type="button" name="ap" id="ap" value="Create New Project" value="Add" onclick="add('textbox')"/>
		<td>
	</tr>
	<tr>
		<td width ="10%" bgcolor="#fbf9f9">&nbsp;</td>
		<td width ="25%" bgcolor="#fbf9f9"><span id="text">&nbsp;</span></td>
		<td width ="20%" bgcolor="#fbf9f9"><span id="fooBar">&nbsp;</span><span id="fooBar2">&nbsp;</span></td>
		<td width ="35%" bgcolor="#fbf9f9"> &nbsp;</td>
	</tr>
	
	<tr>
		<td width ="10%" bgcolor="#fbf9f9">&nbsp;</td>
		<td width ="25%" bgcolor="#fbf9f9"><span id="text1" bgcolor="#fbf9f9">&nbsp;</span></td>
		<td width ="20%" bgcolor="#fbf9f9"><span id="fooBar1">&nbsp;</span><span id="fooBar3">&nbsp;</span></td>
		<td width ="35%" bgcolor="#fbf9f9">&nbsp;</td>
	</tr>
	<tr>
		<td colspan ="100%" >
		<div id="data" name="data"></div>
		</td>
	</tr>
	
	<tr>
		<td width ="9%"  >&nbsp;</td>
		<td width ="25%">&nbsp;</td>
		<td width ="20%">&nbsp;&nbsp;<input type="button" name="bckbutton" id="bckbutton" value="C O N F I R M" onclick="readValues()"/></td>
		<td width ="35%" >&nbsp;</td>
	</tr>

</table>
</form>
</body>