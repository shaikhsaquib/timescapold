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
    
		
  <%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page errorPage="common/errorPage.jsp"%>
<%@ include file="empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<jsp:useBean id="competitiondatacaptureWebController" class="com.bccl.competitiondatacapture.web.controller.competitiondatacaptureWebController" />
	
    <%
	String message			= (String)request.getParameter("message");
Hashtable zoneData1 = new Hashtable();

	ArrayList zoneList1	=  new ArrayList();
	String zoneDataArry1[] = null;
	String lstZons1 = "";
	String plantName1 = "";
	String selected1 = "";
	String nprString1 = message;

	zoneList1 =	priceApprovalWebController.listMetrics(message);
	
%>
<h5>Metrics Section</h5>

<table border = "1" width = "100%">
<tr width = "100%">
	<td width = "100%">
    <select id="lstmetrics" multiple="multiple" onchange="getOptions(this);">
						
						<%
						for(int hh=0;hh<zoneList1.size();hh++)
						{
						String tempArr1[] = (String[])zoneList1.get(hh);

								if(plantName1.equals(tempArr1[0]))
								//selected="selected";
								//else
								//selected="";
								%>
						<option value="<%=tempArr1[0]%>-<%=tempArr1[1]%>" <%=selected1%>> <%=tempArr1[0]%> - <%=tempArr1[1]%></option>
						<%
						}
						%>
    </select>
	</td>
	 <!-- <td width = "20%" colspan = "4"><input type="button" id="btnSelected1" value="Select" /></td>   -->
</tr>
</table>	


</html>
