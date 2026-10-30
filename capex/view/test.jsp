<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable,java.util.HashMap,java.util.Map, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<%@ page import="org.json.JSONObject"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> View </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/capex.css" rel="stylesheet"/>		
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
	 
}.fixed-table-body {
  overflow-x: auto;
  overflow-y: auto;
  height: auto;}
	</style>
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../jscript/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../jscript/select2.min.js"></script>	
	<script src="../jscript/bootstrap-maxlength.min.js"></script>
	<script src="../jscript/bootstrap-table.min.js"></script>
	<script src="../jscript/bootstrap-table-toolbar.js"></script>
	<script>
	$(document).ready(function() {
	$('body').on('focus',".datepicker", function(){
			$(this).datepicker({ dateFormat: 'dd-mm-yy' });	
	});
	$('body').on('focus',"#textarea", function(){
			$(this).maxlength({alwaysShow: true});		
	});	
	$(".multi").select2({ width: '100%'  });
    $('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
});
	</script>	
</head>

<%

	GregorianCalendar today = new GregorianCalendar();
	Calendar cal = Calendar.getInstance();
	int currYear = cal.get(Calendar.YEAR);
	int currMonth = cal.get(Calendar.MONTH);
    if(currMonth<3)
        currYear = currYear - 1;
	int lastYear = currYear - 1;
	int selYear = 0;
    String faYearL = String.valueOf(lastYear);
    String faYearS = String.valueOf(currYear);
    String faYearE = String.valueOf(currYear+1);
	String faYearF = String.valueOf(currYear+2);
	
	out.println(faYearL + " : " +faYearS + " : "+faYearE);
	String faYearFutu = faYearE.substring(2,faYearL.length())+faYearF.substring(2,faYearS.length());
    String faYearCurr = faYearS.substring(2,faYearS.length())+faYearE.substring(2,faYearE.length());
    String faYearLast = faYearL.substring(2,faYearL.length())+faYearS.substring(2,faYearS.length());
	out.println(faYearCurr + " : " +faYearLast );

    String faYear = String.valueOf(cal.get(Calendar.YEAR));
	
%>
<table width="100%" border="0" cellspacing="1" cellpadding="2" >
	<tr>

			<td align="left" class="normal">
			Financial Year <select id="year" name="year" class="normal">   
				<option value="<%=faYearE+"-"+faYearF.substring(2,faYearF.length())%>" ><%=faYearE+"-"+faYearF.substring(2,faYearF.length())%></option>			
                <option value="<%=faYearS+"-"+faYearE.substring(2,faYearE.length())%>" selected><%=faYearS+"-"+faYearE.substring(2,faYearE.length())%></option>
                <option value=<%=faYearL+"-"+faYearS.substring(2,faYearS.length())%>" ><%=faYearL+"-"+faYearS.substring(2,faYearS.length())%></option>               
              
			</select>

		</td>

	</tr>
</table>