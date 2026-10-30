<%--
 -- @(#)monthlyltaapply.jsp	08-09-15
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
 -- @version 	1.00, 08-09-15
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> LTA </title>
	<link href="../css/reset.css" rel="stylesheet"/>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/lta.css" rel="stylesheet"/>	
    <title>LTA Application</title>
	<script Language="JavaScript" src="../jscripts/jquery.js">
	</script>
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="js/bootstrap-maxlength.min.js"></script>	
	<script Language="JavaScript" src="../jscripts/apply.js">
	</script>
    
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
 
<form name  = "frmLtaApplication" method = "post" action="submit.jsp">
<%@ include file="../includes/relatedlinks.jsp" %>
<hr>
<div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default active" href="../requestor/monthlyltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default " href="../requestor/checkstatus.jsp"><font color="#4586BD">Mylist <i class="fa fa-list-ol"></i> </font></a></div>
</div>
<br>


<%	
	int currday1		= thisDay.get(Calendar.DAY_OF_MONTH);
	
	int currYear1		= thisDay.get(Calendar.YEAR);
	String currDay		= currday1 + "";		
	String currYear     = thisDay.get(Calendar.YEAR)	+	"";
	String ltaBal[]     =   new String[1];
    
    if ( ltaBalResult.size()> 0 ) {

     ltaBal		= (String []) ltaBalResult.get(0) ;

    }
if(ltaBal[0]!=null){
		int len = ltaBal[0].length();

		String temp = "";
			
		int lenCount = len-1;

		int counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + ltaBal[0].charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			ltaBal[0] = temp;
		}
}else
    {
        ltaBal[0]="0";
    }	
    String todayDate	=	currDay + "-" + currMonth + "-" + currYear;
	//out.println(joiningdate);
	//out.println(todayDate);

	DateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");	
	
	Date date1 = formatter.parse(joiningdate); 
	Date date2 = formatter.parse(todayDate); 
	//out.println("<BR> joiningdate "+date1);
	//out.println("today date = "+date2);
    //Date date3 = formatter.parse("15-aug-2015");
    
	long diff = date2.getTime() - date1.getTime(); 
	//out.println("Difference In Days: " + (diff / (1000 * 60 * 60 * 24))); 
	
	diff	=	(diff / (1000 * 60 * 60 * 24));
   //out.println("joinig date  "+date3);

Hashtable annualChkSta = new Hashtable();
String  timescapeUid			= Long.toString(timescapeUserOId);
 annualChkSta.put("TIMESCAPEUID",timescapeUid);
 annualChkSta.put("FAYEAR",faYear);

    ArrayList annualresultLst	= new ArrayList();
    annualresultLst		= ltaController.annualLtaCheckStatus(annualChkSta);
   



    
	
		if ( ltaBalResult.size() > 0 && ( ( currMonth.equals("OCT") && currday1 < 31  ) || ( diff < 31) ) && (result.size() == 0)&& (annualresultLst.size() == 0)) {
		

%>
<body>  
  

<div class="container">
<div class="row">
    <ul class="timeline">      
        <li class="timeline-inverted">
          <div class="timeline-badge warning"><i class="glyphicon glyphicon-user abc "></i></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <h4 class="timeline-title"></h4>
            </div>
            <div class="timeline-body">
	<p>I, <Strong><%= firstName + " " + surName  %></Strong>,wish to avail my entitlement of Leave Travel Allowance in my monthly salary on a taxable basis for the  Financial Year <%= faYear %> - <%= nextYear %> </p>
				<p>The total LTA  amount entitled to me for this year is RS.<%= ( ltaBal[0] ) %>/-</p>
				<p style="margin-top:20px;">I understand that this declaration is valid for the entire year <%= faYear %> - <%= nextYear %> and i will not be able to change the same till 31st March <%= nextYear %></p>
				<p>Should i wish to avail the same facility in the next financial year, I will be required to submit a fresh declaration</p>
				<p> Thank You</p>
				<p style="margin-top:30px;">
				<div class="note note-success">					
					<p>
						<%= firstName + " " + surName  %><br>
						<%= sapId %><br>
						<%= designation %><br>
						<%= deptname %><br>
						<%= branchName %><br>
						<Strong><%= day2 + "-" + monthArr[(thisDay.get(Calendar.MONTH))] + "-" + currYear1 %></Strong>
					</p>
				</div>
				<div class="col-xs-5"></div>
				<button type="button" class="btn btn-info abc " onClick = "javascript:apply()">Submit</button> 
				</p>
            </div>
          </div>
        </li>       
	</ul>
</div>
</div>
</form>
		</body>
		</html>

        
<%
    } else  if ( result.size() > 0 ) {
%>
<div class="row ">
<div class="col-md-2 "></div>
    <div class="col-md-8 bs-example" style="margin-top:80px;" >
    <div class="note1 note-info" style="margin-left:120px;">

	<p style="text-align:center;margin-top:10px;">You have already applied for Monthly LTA. <br>Click <a href="../requestor/checkstatus.jsp"> here</a> for status</p>
</div>
</div>
<div class="col-md-2 "></div>
</div>
</div>
</body>
</html>  
<% 
	} else if ( annualresultLst.size() > 0 ){
%>
<div class="row ">
<div class="col-md-2 "></div>
    <div class="col-md-8 bs-example" style="margin-top:80px;" >
    <div class="note1 note-info" style="margin-left:120px;">

	<p style="text-align:center;margin-top:10px;">You have already applied for Annual LTA. <br>Click <a href="../requestor/annualcheckstatus.jsp"> here</a> for status</p>
</div>
</div>
<div class="col-md-2"></div>
</div>
</div>
</body>
</html>  
<% 
	} else {
%>

<div class="row ">
    <div class="col-md-3 "></div>
    <div class="col-md-6 bs-example" style="margin-top:80px;">
        <div class="note1 note-info ">
            <p class= "style3">Leave Travel Allowance(LTA) is the amount given to the employees by <br />
            the employer. It is more or less a tax saving instrument under some circumstances.<br />
            </p>
            <p class= "style3">In case you want to claim the <strong>taxable</strong> Leave and Travel Allowance on a monthly basis,<br />
            you need to submit the declaration posted here.</p>
            <p class= "style3">This is open only from the 1st of Apr to the 17th of May for the current year.</p>
            <p><br />
            <br />
            <strong>Thank You.</strong>
            <br />
            </p>
        </div>
    </div>
    <div class="col-md-3"></div>
</div>

</div>
</body>
</html>  
		
<%
	}
%>