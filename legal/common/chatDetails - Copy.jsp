<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="docKeyWordController" class="com.bccl.workflows.web.controller.DocumentKeywordsController"/>
<!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Create Request </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/legal.css" rel="stylesheet"/>		
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-table.min.css" rel="stylesheet"/> 	
	<style>
		.select2-container .select2-selection--single 
		{
			box-sizing: border-box;
			cursor: pointer;
			display: block;
			height: 32px;		
			border-radius: 0;
			  border: 1px solid #CCC;
		}
		.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
      color: #000;
      font-family: ...;
      font-size: 16px;
      font-weight: bold;
	 
}
	</style>
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>	
	<script src="../js/bootstrap-maxlength.min.js"></script>
	<script src="../js/bootstrap-table.min.js"></script>
	<script src="../js/bootstrap-table-toolbar.js"></script>
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/form-validation.js"></script>
	<script src="../js/additional-methods.min.js"></script>	
	<script src="../jscript/legal.js"></script>	
	<script src="../jscript/common.js"></script>	
	<script src="../jscript/util.js"></script>	

	<script>
	$(document).ready(function() {
	
    $('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});

	});
	</script>	
	
</head>
<%
	
	String requestoid			= (String)request.getParameter("requestoid");
	String id					= (String)request.getParameter("id");

	String msg = "";
	String keyWord = "-";
	String actionText = "-";
	Hashtable  insertHash = new Hashtable();
	Hashtable  detailHash = new Hashtable();
	ArrayList detailsList		= new ArrayList();

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");

	

	System.out.println("id----"+id);
	if("1".equals(id))
	{
		System.out.println("hi");

		boolean insertFlag = false;

		msg					= (String)request.getParameter("msg");
		insertHash.put("COMMENTS", msg);
		insertHash.put("DOCUMENTOID", "DOC1006");			
		insertHash.put("WORKITEMOID", requestoid);			
		insertHash.put("EMAILID", emailId);			
		insertHash.put("KEYWORDS", keyWord);			
		insertHash.put("ACTIONTEXT", actionText);			
		insertHash.put("APPLICATION_NAME", "legalContractManagement");	
		insertHash.put("APPLICATION", "legalContractManagement");	
		 
		insertFlag = docKeyWordController.create("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",insertHash);
		System.out.println("insertFlag----"+insertFlag);

	}

	if("0".equals(id))
	{

		detailHash.put("DOCUMENTOID", "DOC1006");
		detailHash.put("WORKITEMOID", requestoid); 
		detailHash.put("APPLICATION", "legalContractManagement");		
		detailsList = docKeyWordController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailHash);
		



	}else
	{
		out.println("no comments");
	}


	for (int ii=0; ii<detailsList.size(); ii++) 
	{
		String strArr[] = (String[])detailsList.get(ii);	
		String comments ="";
		String createdBy ="";
		String createdOn ="";
		comments = strArr[4];
		createdBy = strArr[5];
		createdBy				= createdBy.substring(0,createdBy.indexOf("@"));

		try 
		{
			Date date = (Date) format.parseObject(strArr[6]);

			createdOn = format2.format(date);	
										
		} catch (ParseException e) { 
		e.printStackTrace();
		}
		

%>
	<li class="left clearfix">
		<span class="chat-img pull-left">
			<img src="../images/user_2.png" alt="User Avatar" class="img-circle">
		</span>
		<div class="chat-body clearfix">
			<div class="header">
				<strong class="primary-font"><%=createdBy%></strong> <!--  <small class=" text-muted" style="margin-top:4px;margin-left:6px;">
								<i class="fa fa-calendar"></i>   15/10/2015</small><small class="pull-right text-muted">
					   Comment for:  Doc. Name</small> --><hr>
			</div>
			<p>
				<%=comments%>
			</p>
			<div class="footer1">
				<div class="row">
					<div class="col-xs-8 pull-right"><strong class="text-muted pull-right ">Commented On :  <%=createdOn%></strong> 
					</div>
				</div>
			</div>
		</div>
	</li>


<%
	}
%>

