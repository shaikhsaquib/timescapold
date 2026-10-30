<%--
 -- @(#)delegateAdminSubmit.jsp	12-01-16
 --
 -- Copyright 2012 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments....
 -- @author		Krishna Vishwakarma
 -- @version 	1.00, 08-07-16
 --%>

<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<%
	Hashtable changeUser  = new Hashtable();
	Hashtable vendorData = new Hashtable();
	Hashtable userTable	 = new Hashtable();

	boolean status			= false;
	boolean status1			= false;
	boolean status2			= false;
	boolean status3			= false;
    String priceid         ="";
	String createdby		= "NA";
	String createdon		= "NA";
	String modifiedby		= "NA";
	String modifiedon		= "NA";

	String app1				= "0";
	String app2				= "0";
	String app3				= "0";
	String app4				= "0";
	String app5				= "0";
	String app6				= "0";
	String app7				= "0";
	String app8				= "0";
	String app9				= "0";
	String app10			= "0";
	String app11			= "0";
	String app12			= "0";
	String select12			= "0";
	String select13			= "0";
	String select14			= "0";
	String select15			= "0";
	String select16			= "0";
    String delegateRemarks = "";

String app1Tid ="";
String app2Tid ="";
String app5Tid ="";
String app4Tid ="";
String app7Tid ="";
String app8Tid ="";
String app11Tid ="";
String app12Tid ="";
	 app1				= (String)request.getParameter("app1H");
        	 if(app1.contains("|"))
            {
                app1Tid = app1.substring(0,app1.indexOf("|"));
                app1=app1Tid;
            }else if(!app2.equals("0"))
            {
                app2 = (String)request.getParameter("app2H");
            }
	 app2				= (String)request.getParameter("app2H");
	        if(app2.contains("|"))
            {
                app2Tid = app2.substring(0,app2.indexOf("|"));
                app2=app2Tid;
            }else if(!app2.equals("0"))
            {
                app2 = (String)request.getParameter("app2H");
            }
	 app4				= (String)request.getParameter("app4H");
	    	if(app4.contains("|"))
            {System.out.println("ff");
                app4Tid = app4.substring(0,app4.indexOf("|"));
                app4=app4Tid;
                }else if(!app4.equals("0"))
                {
                    app4=(String)request.getParameter("app4H");
                }
	 app5				= (String)request.getParameter("app5H");
	        if(app5.contains("|"))
            {
                app5Tid = app5.substring(0,app5.indexOf("|"));
                app5=app5Tid;
                }else if(!app5.equals("0"))
                {
                    app5=(String)request.getParameter("app5H");
                }
	 app7				= (String)request.getParameter("app7H");
            if(app7.contains("|")) {
                app7Tid = app7.substring(0,app7.indexOf("|"));
                app7=app7Tid;
           }else if(!app7.equals("0"))
                {
                app7=(String)request.getParameter("app7H");
                }
	 app8				= (String)request.getParameter("app8H");
         if(app8.contains("|"))
            {
                app8Tid = app8.substring(0,app8.indexOf("|"));
                app8=app8Tid;
           }else if(!app8.equals("0"))
                {
                app8=(String)request.getParameter("app8H");
                }
 	 select12			= (String)request.getParameter("select12");
	 select13			= (String)request.getParameter("select13");
	 //int negVal				= Integer.parseInt(request.getParameter("requestedBy7"));

	 app3				= (String)request.getParameter("app3");
	 if(app3 == null){app3="0";}
	 app6				= (String)request.getParameter("app6");
	  if(app6 == null){app6="0";}
	 app9				= (String)request.getParameter("app9");
	  if(app9 == null){app9="0";}
	 app10				= (String)request.getParameter("app10");
	  if(app10 == null){app10="0";}
	 select14			= (String)request.getParameter("select14");
	 select15			= (String)request.getParameter("select15");
	 select16			= (String)request.getParameter("select16");

	 app11				= (String)request.getParameter("app11H");
         if(app11.contains("|"))
            {
                app11Tid = app11.substring(0,app11.indexOf("|"));
                app11=app11Tid;
           }else if(!app11.equals("0"))
                {
                app11=(String)request.getParameter("app11H");
                }
	 app12				= (String)request.getParameter("app12H");
         if(app12.contains("|"))
            {

                app12Tid = app12.substring(0,app12.indexOf("|"));
                app12=app12Tid;
           }else if(!app12.equals("0"))
                {
                app12=(String)request.getParameter("app12H");
                }
     priceid                         = (String)request.getParameter("priceid");

	 createdby			= Long.toString(timescapeUserOId);
	 createdon			= "NA";
	 modifiedby			= Long.toString(timescapeUserOId);
	 modifiedon			= "NA";
	 //userstatus			= "SPLR";

    delegateRemarks                = (String)request.getParameter("remarksContainer");

/*out.println("app1"+app1);
out.println("app2"+app2);
out.println("app3"+app3);
out.println("app4"+app4);
out.println("app5"+app5);
out.println("app6"+app6);
out.println("app7"+app7);
out.println("app8"+app8);
out.println("app9"+app9);
out.println("app11"+app11);
out.println("app12"+app12);
out.println("select12"+select12);
out.println("select13"+select13);
out.println("select14"+select14);
out.println("select15"+select15);
out.println("select16"+select16);*/


	changeUser.put("PRICEID",priceid);
    changeUser.put("APPROVER11",app1);
	changeUser.put("APPROVER12",app2);
	changeUser.put("APPROVER13",app3);
	changeUser.put("APPROVER21",app4);
	changeUser.put("APPROVER22",app5);
	changeUser.put("APPROVER23",app6);
	changeUser.put("APPROVER31",app7);
	changeUser.put("APPROVER32",app8);
	changeUser.put("APPROVER33",app9);
	changeUser.put("APPROVER34",app10);
	changeUser.put("APPROVER35",app11);
	changeUser.put("APPROVER36",app12);
	changeUser.put("APPROVER4",select12);
	changeUser.put("APPROVER5",select13);
	changeUser.put("APPROVER6",select14);
	changeUser.put("APPROVER7",select15);
	changeUser.put("APPROVER8",select16);
	changeUser.put("CREATEDBY",createdby);
	changeUser.put("MODIFIEDBY",modifiedby);
	changeUser.put("REMARKS",delegateRemarks);
	changeUser.put("CREATEDBYAPPROVERTYPE","AD");
	//changeUser.put("MODIFIEDON","SYSDATE");
	changeUser.put("SPLRVFLAG","N");

	status  = priceApprovalWebController.updateApproverDataOsp(changeUser);
//status=true;



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PRICE APPROVAL - SUBMIT DATA</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
</head>
<body>
<% if(status == true )
		{

%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="../../images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="../../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">You have delegated the approver rights successfully ...</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="../../indexOsp.jsp" class="normal"><b>here</b></a> to go back</td></tr>
			</table>
<%
		}else{
%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="../../images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="../../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Sorry there was an Error while creating your request.</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="../../indexOsp.jsp" class="normal"><b>here</b></a> to check the status</td></tr>
			</table>
<%}%>
</body>
</html>