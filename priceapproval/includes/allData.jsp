<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
		<script Language="JavaScript" src="jscripts/newsprint.js"></script>
		<script Language="JavaScript" src="jscripts/bcclvalue.js"></script>
    
		
  <%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%//@ page errorPage="common/errorPage.jsp"%>
<%//@ include file="empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceapprovalWebController" /> 
<jsp:useBean id="competitiondatacaptureWebController" class="com.bccl.competitiondatacapture.web.controller.competitiondatacaptureWebController" />
	
    <%
	String message1			= (String)request.getParameter("message");

	System.out.println("message1---"+message1);

	

	String[] parts = message1.split("-");

	String part1 = parts[0]; // 004
	String part2 = parts[1]; // 034556


	ArrayList dataList1	=  new ArrayList();
	String DataArry[] = null;
	String dataName = "";
	String dataSize = "";
	dataList1 =	priceApprovalWebController.listData(part1,part2);

	
	%>

	<input type="hidden" name="dataSize" id="dataSize" value="<%=dataList1.size()%>">
	<form name  = "frmParValue" method = "post" >
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">

  <tr>
    <td width="6%"	 height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">SUBCATEGORY.</td>
    <td width="6%"	 height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">METRICS</td>
    <td width="6%"	 height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">COMPETITION VALUE.</td>
    <td width="6%"	 height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">UOM.</td>
    <td width="6%"	 height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">COMPETITION.</td>
    <td width="6%"	 height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">SOURCE.</td>
    <td width="6%"	 height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">PLANT.</td>
    <td width="6%"	 height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">MONTHYEAR.</td>
    <td width="6%"	 height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">BCCL VALUE</td>
    
  </tr>
<%
		
		for(int k = 0; k< dataList1.size(); k++) {
			String[] tmpArr = (String [] )dataList1.get(k);

			String txnid = "txnid"+k;
			String bcclvalue = "bcclvalue"+k;

			System.out.println("txnid=="+txnid);
			System.out.println("bcclvalue=="+bcclvalue);
%>

</tr>
		
		<!-- <td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><//%=tmpArr[0]%> </td> -->
		<input type="hidden" name="txnid<%=k%>" value="<%=tmpArr[0]%>">
		<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[5]%> </td>
		<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[9]%> </td>
		<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[13]%> </td>
		<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[10]%> </td>
		<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[6]%> </td>
		<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[12]%> </td>
		<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[2]%> </td>
		<td bgcolor="#f8f8f8" width="36%" align="left" valign="middle" class="style3"><%=tmpArr[7]%> </td>
		<td class = "style3" width = "75%" height = "30" align = "left">
			<!-- <input type = "text" class = "style3" name = "bcclvalue" id = "bcclvalue" size = "20" maxlength = "20"> -->
			 <input type="text" name="bcclvalue<%=k%>" value=""> 
		</td>
		<!-- <td bgcolor = "#EDE9E8"><input name="Submit" type="button" class="redButton" value="Submit" onclick = "validateParValue(<//%=tmpArr[0]%>)"></td>
				</div></td>	 -->

	
<%
		}
%>
	</tr></table>
<%	
%>
