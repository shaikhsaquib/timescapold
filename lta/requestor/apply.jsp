<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.io.*" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 

<%
	ArrayList result		= new ArrayList();
	ArrayList ltaBalResult	= new ArrayList();

    String flag = "";
	String faYear= "";
	String queryDate ="";
	
    //String roleId =  "";

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );
	//String date = (Stri ng)request.getParameter("date");
	//System.out.println("requestdate"+ date);

	String day2 = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));

	if ( day2.length() == 1) {

		day2	=	"0" + day2;
	}
	int currMonth1		= thisDay.get(Calendar.MONTH);
	String currMonth	= monthArr[currMonth1]  + "";	
	faYear = thisDay.get(Calendar.YEAR) + "";
	String nextYear		=	thisDay.get(Calendar.YEAR) + 1 + "";
	if(currMonth.equals("JAN") || currMonth.equals("FEB")||currMonth.equals("MAR") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
		nextYear = (Integer.parseInt(nextYear)-1)+"";
	}
		
	String ltaYear		=	faYear.substring(2,4) + "%";
	//out.println(ltaYear);

	


	
     
    String ltaRoleId	= (String) session.getAttribute("ltaRoleId");
	
	String criteria		=	"user";

    	result			= ltaController.viewLtaRecord(timescapeUserOId, faYear, criteria);

	ltaBalResult	= ltaController.getLtaBal(timescapeUserOId, ltaYear);
    
	
	String remarks	=	"";

    //out.println(ltaBalResult.size());
%>
    <html >
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>LTA Application</title>
	<script Language="JavaScript" src="../jscripts/jquery.js">
	</script>
	<script Language="JavaScript" src="../jscripts/apply.js">
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


    </head>

    <body>
    <form name  = "frmLtaApplication" method = "post" action="submit.jsp">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="left" valign="top" width="70%"><img src="../images/header.jpg"/></td>
			<td>

<%					
				if ( ltaRoleId.equals("2") ) {
%>			
					
						<td align = "right">
						<ul id="nav">
							<li><a href="#"><img src="../images/button.png" width="184" height="25" border="0"></a><br>
							<ul>	
							<li><a href="../approver/approve.jsp" class="normal">Approve LTA Request</a></li>
							<li><a href="../approver/checkDetails.jsp" class="normal">Check History</a></li>
<%
				}
%>
						</ul>
					<div class="clear"></div>
				</li>
			</ul>
			<div class="clear"></div>
		</td>
    </tr>

    </table>

    <table width="100%" border="0" cellspacing="2" cellpadding="2" align="centre">

<%	
	int currday1		= thisDay.get(Calendar.DAY_OF_MONTH);
	
	int currYear1		= thisDay.get(Calendar.YEAR);
	String currDay		= currday1 + "";		
	String currYear     = thisDay.get(Calendar.YEAR)	+	"";
	String ltaBal[]     =   new String[1];
    
    if ( ltaBalResult.size()> 0 ) {

     ltaBal		= (String []) ltaBalResult.get(0) ;

    }
	
    String todayDate	=	currDay + "-" + currMonth + "-" + currYear;
	//out.println(joiningdate);
	//out.println(todayDate);

	DateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");	
	
	Date date1 = formatter.parse(joiningdate); 
	Date date2 = formatter.parse(todayDate); 
	//out.println("<BR>"+date1);
	//out.println(date2);

	long diff = date2.getTime() - date1.getTime(); 
	//out.println("Difference In Days: " + (diff / (1000 * 60 * 60 * 24))); 
	diff	=	(diff / (1000 * 60 * 60 * 24));
	
	
		
		if ( ltaBalResult.size() > 0 && ( ( currMonth.equals("MAY") && currday1 < 17  ) || ( diff < 31) ) && result.size() == 0 ) {

%>       

		<tr>
		<td align="left" valign="middle"><p class="headBoxReverse" align = "center"> Declaration for  claiming LTA on a monthly taxable basis (FY : <%= faYear %>- <%= nextYear %>) 
		  </p>
		  <p class="style4">&nbsp;</p>
		  <p class="style3">I,<span class="style4"> <%= firstName + " " + surName  %>,</span> wish to avail my  entitlement of Leave Travel Allowance in my monthly salary on a taxable basis  for the Financial Year <%= faYear %> - <%= nextYear %>.<br> The total LTA amount entitled to me for this year is Rs. <%= ( ltaBal[0] ) %> /-</p>
		  <p class="style3">I understand that this declaration is valid  for the entire financial year <%= faYear %> - <%= nextYear %> <br />
		  and I will not be able to change the  same till 31st March <%= nextYear %>. <br />
		  Should I wish to avail the same facility  in the next financial year, I will be required to submit a fresh declaration.</p>
		  <p class="style4">Thank you</p>
		  <p class="style3"><%= firstName + " " + surName  %><br />
							<%= sapId %><br />
							<%= designation %><br />
							<%= deptname %><br />
							<%= branchName %><br />							
							<span class="style4">&nbsp;  <%= day2 + "-" + monthArr[(thisDay.get(Calendar.MONTH))] + "-" + currYear1 %></span></p>
		  <p><br />
		</p></td>
	  </tr>
		  <tr>
			<td height="44" align="left" valign="middle"><input name="button" type="button" class="style4" id="button" value="Submit Declaration" onClick = "javascript:apply()" /></td>
		  </tr>

		  <input type = "hidden" name = "timescapeUserOId" value = "<%=timescapeUserOId%>">
		  <input type = "hidden" name = "timescapeUserOId" value = "<%=timescapeUserOId%>">
		</table>
		</body>
		</html>

        
<%
    } else  if ( result.size() > 0 ) {


		Hashtable icons	=	new Hashtable();
		Hashtable requestStatus	=	new Hashtable();

		icons.put("L",	"inprocess.png");
		icons.put("A",	"processor_approved.png");
		icons.put("R",	"rejected.png");

		requestStatus.put("L",	"In Process");
		requestStatus.put("A",	"Processed");
		requestStatus.put("R",	"Rejected");
		
%>
	<table width="100%" border="0" cellspacing="2" cellpadding="2" align="center">

	<tr>
		<td height="29" colspan="5" bgcolor="#fbf9f9"><span class="small">&nbsp;Tip : <img src="../images/inprocess.png" /> : In 
            Process <img src="../images/processor_approved.png" /> : 
            Processed <img src="../images/rejected.png" /> : 
            Rejected 
		</td>
	</tr>
<%
		for ( int i = 0; i < result.size(); i++ ) {

			String tmpArr[] = (String[]) result.get(0);

			if ( tmpArr[8].equals("NA")) {
				
				remarks	=	"-";
			
			} else {

				remarks	=	tmpArr[8];

			}
			
%>			
			<tr>
				<td align="left" valign="middle" bgcolor="#E1EDED" height="22"><p class="style4">Transaction ID</td>
				<td align="left" valign="middle" bgcolor="#E1EDED" ><p class="style4">Name</td>
				<td align="left" valign="middle" bgcolor="#E1EDED" ><p class="style4">SAP Number</td>
				<td align="left" valign="middle" bgcolor="#E1EDED" ><p class="style4">Remarks</td>
				<td align="left" valign="middle" bgcolor="#E1EDED" ><p class="style4">Status</td>
			  </tr>
			  <tr>
				<td align="left" valign="middle"><p class="style3"><%= tmpArr[0] %></td>
				<td align="left" valign="middle"><p class="style3"><%= tmpArr[3] %></td>
				<td align="left" valign="middle"><p class="style3"><%= tmpArr[5] %></td>
				<td align="left" valign="middle"><p class="style3"><%= remarks %></td>
				<td align="left" valign="middle"><p class="style3"><img src = "../images/<%=icons.get(tmpArr[7])%>" %></td>
			  </tr>
			  <tr>
				<td colspan="100%" bgcolor="#CCCCCC"><img src="../images/spacer.gif" width="1" height="1" /></td>
			  </tr>
			</table>
			</body>
			</html>  
<% 
		}

	} else {
		
%>
	  <tr>
          <td align="left" valign="top"><p>&nbsp;</p>
            <p class= "style3">Leave Travel Allowance(LTA) is the amount given to the employees by <br />
              the employer. It is more or less a tax saving instrument under some circumstances.<br />
            </p>
            <p class= "style3">In case you want to claim the <strong>taxable</strong> Leave and Travel Allowance on a monthly basis,<br />
            you need to submit the declaration posted here.</p>
            <p class= "style3">This is open only from the 1st of Apr to the 17th of May for the current year.</p>
            <p><br />
              <br />
              <strong>Thank You.</stron3/29/2012>
               <br />
          </p></td>
        </tr>
        <tr>
          <td align="left"><p class="style3">&nbsp;</p>
            <p><br />
        </p></td>
        </tr>
      </table>
      <p class="style4">&nbsp;</p>
    <p class="style3">&nbsp;</p></td>
  </tr>
  <tr>
    <td height="44" align="center" valign="middle">&nbsp;</td>
  </tr>
		
<%
	}

%>