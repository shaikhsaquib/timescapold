<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 

<% 
	ArrayList result = new ArrayList();
    
    String bgcolor      = "";
	String weekArr[]    = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[]   = {"0","JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );
   
    String ltaRoleId	= (String) session.getAttribute("ltaRoleId");
    String month	    = (String) request.getParameter("month");
    String faYear       = (String) request.getParameter("faYear");
	String status		= (String) request.getParameter("criteria");
	String monthStr		= "";
	
		
	int currMonth		=	0;
	int selYear			=	0;
	
	if ( faYear == null && month	==	null ) {

		currMonth		= thisDay.get(Calendar.MONTH)	+	1;
		faYear          = thisDay.get(Calendar.YEAR)	+	"";
		status			=	"A";
		month			= currMonth + "";

	} else {

		selYear = Integer.parseInt(faYear);
		currMonth = Integer.parseInt(month);
		
	}
	
	monthStr		= currMonth + "";	
	
	String isSelected	=	status == "A"? "selected" : "";
	String isSelected1	=	status == "R"? "selected" : "";
	

	String faDate	= faYear;
	//out.println(monthArr[currMonth]+"-"+faDate);
	int currYear	= thisDay.get(Calendar.YEAR)+1;
	int lastYear	= currYear - 3;
	selYear		= Integer.parseInt(faYear);

    result = ltaController.viewLtaRecord(monthArr[currMonth]+"-"+faDate, status, timescapeUserOId);

	Hashtable icons	=	new Hashtable();
	Hashtable requestStatus	=	new Hashtable();

	icons.put("L",	"inprocess.png");
	icons.put("A",	"processor_approved.png");
	icons.put("R",	"rejected.png");

	requestStatus.put("L",	"In Process");
	requestStatus.put("A",	"Processed");
	requestStatus.put("R",	"Rejected");
	
%>

 <head>
   
    <title>LTA Application</title>
	<script Language="JavaScript" src="../jscripts/jquery.js">
	</script>
    <style type="text/css">
    body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
        text-align: center;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 13px;
        color: #333;
    }
    .bold {
        font-weight: bold;
    }
</style>
		
<script type="text/javascript">
$(document).ready(function () {	
	
	$('#nav li').hover(
		function () {
			//show its submenu
			$('ul', this).slideDown(100);

		}, 
		function () {
			//hide its submenu
			$('ul', this).slideUp(100);			
		}
	);
	
});
</script>
<!-- menu CSS Starts -->
<style type="text/css">
	
	/* remove the list style */
	#nav {
		margin:0; 
		padding:0; 
		list-style:none;
		padding:35px 0;
	}	
	
		/* make the LI display inline */
		/* it's position relative so that position absolute */
		/* can be used in submenu */
		#nav li {
			float:left; 
			display:block; 
			width:184px; 
			position:relative;
			z-index:500; 
			margin:0 1px;
		}
		
		/* this is the parent menu */
		#nav li a {
			display:block; 
			padding:5px 5px 0 5px; 
			font-weight:700;  
			height:12px; 
			text-decoration:none; 
			color:#333333; 
			text-align:left;
		}

		#nav li a:hover {
			color:#000000;
		}
	
		/* you can make a different style for default selected value */
		#nav a.selected {
			color:#f00;
		}
	
		/* submenu, it's hidden by default */
		#nav ul {
			position:absolute; 
			left:0; 
			display:none; 
			margin:0 0 0 -1px; 
			padding:0; 
			list-style:none;
		}
		
		#nav ul li {
			width:184px; 
			float:left; 
			border-top:1px solid #fff;
			background:#f6f2f2;
		}
		
		/* display block will make the link fill the whole area of LI */
		#nav ul a {
			font-family:"Arial";
			display:block;  
			height:15px;
			padding: 5px 28px; 
			color:#666;
			background-image: url("../images/link_icon.jpg");
			background-repeat: no-repeat;
			background-position: 7px 8px;
		}
		
		#nav ul a:hover {
			text-decoration:none;	
		}

		/* fix ie6 small issue */
		/* we should always avoid using hack like this */
		/* should put it into separate file : ) */
		*html #nav ul {
			margin:0 0 0 -2px;
		}

	</style>
<!-- menu CSS ends -->


    <link href="../style/lta.css" rel="stylesheet" type="text/css" />

    <script Language="JavaScript" src="../jscripts/approve.js"></script>
	<script Language="JavaScript" src="../jscripts/downloadReport.js"></script>
    </head>
    <body>
    <form name = "frmCheckDetails" method = "post" action = "">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="left" valign="top" width="70%"><img src="../images/header.jpg"/></td>
						
			<td align = "right">
			<ul id="nav">
			 <li><a href="#"><img src="../images/button.png" width="184" height="25" border="0"></a><br>
			<ul>	
			 <li><a href="../requestor/apply.jsp" class="normal">Submit LTA</a></li>
			 <li><a href="../approver/approve.jsp" class="normal">Approve LTA</a></li>
			</ul>
			<div class="clear"></div>
			 </li>
			</ul>
			<div class="clear"></div>
		</td>
    </tr>

    </table>

	 <%//@ include file = "../includes/ltaMenu.jsp" %>

	<table width="100%" cellspacing="2" cellpadding="2">

    <tr class="greyBG">
	
	<td height="29" colspan="5" bgcolor="#fbf9f9"><span class="small">&nbsp;Tip : <img src="../images/inprocess.png" /> : In 
		Process <img src="../images/processor_approved.png" /> : 
		Processed <img src="../images/rejected.png" /> : 
		Rejected | 
		<a href="javascript:downloadReport('<%=faYear%>', '<%= monthArr[Integer.parseInt(month)] %>', '<%= status%>' )" class="style3">Download Report  </a> <img src="../images/excel.png" /></span>
	</td>

    <td align="right" class="normal" colspan = "3" bgcolor="#fbf9f9"> <span class="style4">Select
		Year <select id="year" name="year" class="style4">
				<%= HtmlUtil.getYearList(lastYear,currYear, selYear,"desc") %>
			</select>
			Month<select id="month" name="month" class="style4">
				<%= HtmlUtil.getMonthList(monthStr) %>
			</select>
			&nbsp;
			<select id = "criteria" name = "criteria" class="style4">
				<option value = "A" <%= isSelected %> >Approved</option>
				<option value = "R" <%= isSelected1 %> >Rejected</option>
			</select>&nbsp;
			<input type = "button" value = "GO" class = "normal" onClick = "javascript:checkDetails( )">
		</span></td>
  
  <tr> 
<%
	if(result.size() > 0) {

%>
    <table width="100%" border="0" align="left" cellpadding="2" cellspacing="2">
    <tr>
    <td width="10%" align="left" bgcolor="#E1EDED" class="style4">Transaction ID</td>
    <td width="15%" align="left"  bgcolor="#E1EDED" class="style4">Employee Name</td>
    <td width="10%" align="left" bgcolor="#E1EDED" class="style4">SAP Number</td>
    <td width="15%" align="left" bgcolor="#E1EDED" class="style4">Department</td>
    <td width="15"  align="left" bgcolor="#E1EDED" class="style4">Designation</td>
    <td width="15"  align="left" bgcolor="#E1EDED" class="style4">Branch</td>
    <td width="15"  align="left" bgcolor="#E1EDED" class="style4">Remarks</td>
    <td width="15%" bgcolor="#E1EDED" class="style4">Date of Joining</td>
    <td width="15%" align="left" bgcolor="#E1EDED" class="style4">Requested On</td>
    <td width="15%" align="left" bgcolor="#E1EDED" class="style4">Processed On</td>
    <td width="15%" align="left" bgcolor="#E1EDED" class="style4">Satus</td>
  </tr>
   <input type="hidden" name="listSize" value="<%=result.size()%>">

<%
    for (int i = 0; i < result.size(); i++) {
        
		
        if (i%2==0) {

		    bgcolor	= "#FFFFFF";
        
        } else {

            bgcolor = "#F8F8F8";

        }

        String tmpArr[] = (String [])result.get(i); 
        
%>

  <tr >
    <td  width="5%" align="left"  bgcolor="<%=bgcolor%>" class="style3"><%= tmpArr[0] %></td>
    <td  width="15%" align="left"  bgcolor="<%=bgcolor%>" class="style3"><%= tmpArr[3] %></td>
    <td  width="10%" align="left"  bgcolor="<%=bgcolor%>" class="style3"><%= tmpArr[5] %></td>
    <td  width="20%" align="left"  bgcolor="<%=bgcolor%>" class="style3"><%= tmpArr[6] %></td>
    <td  width="15%" align="left"  bgcolor="<%=bgcolor%>" class="style3"><%= tmpArr[7] %></td>
    <td  width="15%" align="left"  bgcolor="<%=bgcolor%>" class="style3"><%= tmpArr[12] %></td>
    <td  width="15%" align="left"  bgcolor="<%=bgcolor%>" class="style3"><%= tmpArr[9] %></td>
    <td  width="15%" align="left"  bgcolor="<%=bgcolor%>" class="style3"><%= tmpArr[13] %></td>
    <td  width="15%" align="left"  bgcolor="<%=bgcolor%>" class="style3"><%= tmpArr[10] %></td>
    <td  width="15%" align="left"  bgcolor="<%=bgcolor%>" class="style3"><%= tmpArr[11] %></td>
    <td align="left" valign="middle"><p class="style3"><img src = "../images/<%=icons.get(tmpArr[8])%>" %></td>
  </tr>
 
  <tr>
    <td colspan="100%" bgcolor="#CCCCCC"><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
 

<%
    }

	} else {
%>

    <tr>
        <td colspan="100%" align="center" valign="middle" bgcolor = "#E1EDED"><p class="style4">No applications processed for FA-Year: <%= faYear %> </td>
    </tr>
    <tr>
<%
    } 
%>

</table>
</body>
</html>