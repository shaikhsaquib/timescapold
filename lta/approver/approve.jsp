<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 


<%
	GregorianCalendar thisDay = new GregorianCalendar( );

	ArrayList result	= new ArrayList();
    int currMonth		=	0;
	String month		="";
    //String roleId     =  "";
    String faYear       = "";
    String bgcolor      = "";
	String weekArr[]    = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[]   = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	String status		=	"L";
		
	currMonth			= thisDay.get(Calendar.MONTH);
	
	int currMonth1		= thisDay.get(Calendar.MONTH);
	String currentMonth	= monthArr[currMonth1]  + "";	
	faYear = thisDay.get(Calendar.YEAR) + "";
	String nextYear		=	thisDay.get(Calendar.YEAR) + 1 + "";
	if(currentMonth.equals("JAN") || currentMonth.equals("FEB")||currentMonth.equals("MAR") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
		nextYear = (Integer.parseInt(nextYear)-1)+"";
	}
		
	month				= currMonth + "";
	//String faDate		= monthArr[Integer.parseInt(month)] + "-" + faYear;
    //faYear			= thisDay.get(Calendar.YEAR) + "";
	String faDate		=	faYear;
    String criteria	=	"approver";
    result				= ltaController.viewLtaRecord(timescapeUserOId, faDate, criteria);

    String ltaRoleId	= (String) session.getAttribute("ltaRoleId");
	//out.println("ltaRoleId"+ltaRoleId);


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
    <link href="../style/ltaMenu.css" rel="stylesheet" type="text/css" />
    <script Language="JavaScript" src="../jscripts/approve.js"></script>
    <script Language="JavaScript" src="../jscripts/downloadReport.js"></script>

    </head>
    <body>
    <form name = "frmApproveLta" method = "post" action = "">
    
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="left" valign="top" width="70%"><img src="../images/header.jpg"/></td>
						
			<td align = "right">
			<ul id="nav">
			 <li><a href="#"><img src="../images/button.png" width="184" height="25" border="0"></a><br>
			<ul>	
			 <li><a href="../requestor/apply.jsp" class="normal">Submit LTA</a></li>
			<li><a href="../approver/checkDetails.jsp" class="normal">Check History</a></li>
			</ul>
			<div class="clear"></div>
			 </li>
			</ul>
			<div class="clear"></div>
		</td>
    </tr>

    </table>

<%
    if(result.size() > 0) {

 %>

    <table width="100%" border="0" align="left" cellpadding="2" cellspacing="2">
   <BR><BR> 
	 <tr ><td height="29" colspan="5" bgcolor="#fbf9f9"><span class="small"><a href="javascript:downloadPendingReport('<%=faYear%>', '<%= monthArr[Integer.parseInt(month)] %>', '<%= status%>' )" class="style3">Download Report  </a> <img src="../images/excel.png" /></span></td></tr>
	<tr>
    <td width="20%" bgcolor="#E1EDED" class="style4" height="22">Transaction ID</td>
    <td width="25%" bgcolor="#E1EDED" class="style4">Employee Name</td>
    <td width="15%" bgcolor="#E1EDED" class="style4">Remarks</td>
    <td width="20%" bgcolor="#E1EDED" class="style4">Accept / Reject</td>
    <td width="20%" bgcolor="#E1EDED" class="style4">Created On</td>
  </tr>
   <input type="hidden" name="listSize" value="<%=result.size()%>">

<%
    for (int i = 0; i < result.size(); i++) {
        
		String hrRemarks = "hrRemarks" + i;

        if(i%2==0) {

		    bgcolor="#FFFFFF";
        
        } else {

            bgcolor="#F8F8F8";

        }

            String tmpArr[]         = (String [])result.get(i); 
        
%>

  <tr>
    <td  bgcolor="<%=bgcolor%>" class="style3Underline" ><a href ="#" onClick= "window.open('viewDetails.jsp?applicationId=<%=tmpArr[0]%>','','resizable=yes,scrollbars=yes,toolbars=no,width=600,height=300,top=150,left=150')" class="style3Underline"><%=tmpArr[0]%></td>
    <td  bgcolor="<%=bgcolor%>" class="style3"><%=tmpArr[3]%></td>
    <td  bgcolor="<%=bgcolor%>" class="style3"><input type = "text" name = "<%= hrRemarks %>" maxlength="255" size="20"></td>	
	<td  bgcolor="<%=bgcolor%>" class="style3">
		 <table>
			<td  bgcolor="<%=bgcolor%>" class="style3"><input type="radio" name="apprRadio<%=i%>" value="acc" checked>Accept</td>
			<td  bgcolor="<%=bgcolor%>" class="style3"><input type="radio" name="apprRadio<%=i%>" value="rej">Reject</td>
		</table>
	</td>
    <input type="hidden" name="applicationId<%=i%>" value="<%=tmpArr[0]%>"> 
	
	<td  bgcolor="<%=bgcolor%>" class="style3" ><%= tmpArr[10]%></td>
  </tr>
 
  <tr>
    <td colspan="100%" bgcolor="#CCCCCC"><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
 

<%
    }
%>
   <tr>

        <td height="44" align="center" valign="middle" colspan = "100%"><input name="Submit Request" type="button" class="style4" id="Submit Request" value="Submit Request" onClick = "javaScript:validate(<%=result.size()%>)" /></td>

   </tr>

<%
    } else {
%>

    <tr>
        <td align="center" valign="middle"><p class="style4">There are no applications to be processed</td>
    </tr>
    <tr>
<%
    } 
%>

</table>
</body>
</html>