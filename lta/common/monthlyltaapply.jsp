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
<%@ include file="../../../common/adirData.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.io.*, java.text.NumberFormat, java.util.Locale" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>
	
	<%
	//String redirectURL1	= "../common/claimMaintenancePageNew.html";
	//response.sendRedirect(redirectURL1);
%>

<%

	/*if (companyCode.equals("1003") || companyCode.equals("1043") || companyCode.equals("1046") || companyCode.equals("1031") || companyCode.equals("1030") || companyCode.equals("1041") || companyCode.equals("1040") || companyCode.equals("1051") || companyCode.equals("1050") || companyCode.equals("1004") ){
		String redirectURL	= "../common/claimMaintenancePage.html";
		response.sendRedirect(redirectURL);
	
	}*/

	if (companyCode.equals("1000") && (!(deptGroup.equals("1296") || deptGroup.equals("1297") || deptGroup.equals("1298") || deptGroup.equals("1299") || deptGroup.equals("1300") || deptGroup.equals("1498") || deptGroup.equals("1499") || deptGroup.equals("1500") || deptGroup.equals("1501") || deptGroup.equals("1559") || deptGroup.equals("1560") || deptGroup.equals("1581") || deptGroup.equals("1582") || deptGroup.equals("1739") || deptGroup.equals("1740") || deptGroup.equals("1741") || deptGroup.equals("1742") || deptGroup.equals("1743") || deptGroup.equals("1744") || deptGroup.equals("1745") || deptGroup.equals("1746") || deptGroup.equals("1747") || deptGroup.equals("1748") || deptGroup.equals("1749") || deptGroup.equals("1750") || deptGroup.equals("1751") || deptGroup.equals("1752") || deptGroup.equals("1753") || deptGroup.equals("1754") || deptGroup.equals("1755") || deptGroup.equals("1756") || deptGroup.equals("1757") || deptGroup.equals("1758") || deptGroup.equals("1759") || deptGroup.equals("1760") || deptGroup.equals("1761") || deptGroup.equals("1762") || deptGroup.equals("1763") || deptGroup.equals("1764") || deptGroup.equals("1765") || deptGroup.equals("1766") || deptGroup.equals("1767") || deptGroup.equals("1784") || deptGroup.equals("1785") || deptGroup.equals("1786") || deptGroup.equals("1787") || deptGroup.equals("1859") || deptGroup.equals("1994") || usersList.contains(sapId) ))){
		
		String redirectURL	= "/timescape/common/maintenance.html";
		response.sendRedirect(redirectURL);

	}else {

	ArrayList result		= new ArrayList();
	ArrayList ltaBalResult	= new ArrayList();

	String openForCompanyCode = (String)EnvironmentProperties.getValue("lta", "OPEN_FOR_COMPANY_CODE");
    String flag = "";
	String faYear= "";
	String queryDate ="";
	
    //String roleId =  "";
	NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);

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
    <!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/bootstrap-maxlength.min.js"></script>	
	<script Language="JavaScript" src="../jscripts/apply.js">
	</script>
    
	<script>
	$(document).ready(function() {
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide(); 
	});
	    $(".tip-bottom").tooltip({
        placement : 'bottom'
    });

	});
	
	</script>

    </head>
 
<form name  = "frmLtaApplication" method = "post">
<%@ include file="../includes/relatedlinks.jsp" %>

<% String optionValue ="MRA";//M-monthly,R-requestor,A-apply
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%@ include file="../includes/monthlymenutabs.jsp" %>
<!-- <div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default active" href="../requestor/monthlyltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default " href="../requestor/checkstatus.jsp"><font color="#4586BD">Mylist <i class="fa fa-list-ol"></i> </font></a></div>
</div> -->
</div>
<br>


<%	
	int currday1		= thisDay.get(Calendar.DAY_OF_MONTH);
	String ltaValue = "";
	
	int currYear1		= thisDay.get(Calendar.YEAR);
	String currDay		= currday1 + "";		
	String currYear     = thisDay.get(Calendar.YEAR)	+	"";
	String ltaBal[]     =   new String[1];
    
    if ( ltaBalResult.size()> 0 ) {

     ltaBal		= (String []) ltaBalResult.get(0) ;

    }
if(ltaBal[0]!=null){
		ltaValue = numberFormat.format(Double.parseDouble(ltaBal[0]));
		//out.println("value="+ltaValue);
		
	/*	int len = ltaBal[0].length();

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
		}*/
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
    //Date date3 = formatter.parse("4-SEP-2015");
    
	long diff = date2.getTime() - date1.getTime(); 
	//out.println("Difference In Days: " + (diff / (1000 * 60 * 60 * 24))); 
	
	diff	=	(diff / (1000 * 60 * 60 * 24));
   //out.println("joinig date  "+date3);
   //out.println("diff  "+diff);

Hashtable annualChkSta = new Hashtable();
String  timescapeUid			= Long.toString(timescapeUserOId);
 annualChkSta.put("TIMESCAPEUID",timescapeUid);
 annualChkSta.put("FAYEAR",faYear);

    ArrayList annualresultLst	= new ArrayList();
    annualresultLst		= ltaController.annualLtaCheckStatus(annualChkSta);
   
	
		if ( ltaBalResult.size() > 0 && ( (currMonth.equals("APR")) || ( currMonth.equals("MAY") && currday1 <= 18  ) || ( diff < 31) || (companyCode.equals(openForCompanyCode))  ) && (result.size() == 0)&& (annualresultLst.size() == 0)) {
		

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
				<p>The total LTA  amount entitled to me for this year is Rs. <%= ( ltaValue ) %>/-</p>
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
				<button type="button" class="btn btn-info abc " id="submitForm" onClick = "javascript:apply()">Submit</button> 
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
<div class="col-xs-2 "></div>
    <div class="col-xs-8 bs-example" style="margin-top:80px;" >
    <div class="note1 note-info" style="margin-left:120px;">

	<p style="text-align:center;margin-top:10px;">You have already applied for Monthly LTA. <br>Click <a href="../common/checkstatus.jsp"> here</a> for status</p>
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
<div class="col-xs-2 "></div>
    <div class="col-xs-8 bs-example" style="margin-top:80px;" >
    <div class="note1 note-info" style="margin-left:120px;">

	<p style="text-align:center;margin-top:10px;">You have already applied for Annual LTA. <br>Click <a href="../common/annualcheckstatus.jsp"> here</a> for status</p>
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
    <div class="col-xs-3 "></div>
    <div class="col-xs-6 bs-example" style="margin-top:80px;">
        <div class="note1 note-info " style="margin-left:15px;">
            <p class= "style3">The date for submitting the Monthly Taxable LTA has been lapsed.<br />
            You will be able to submit the application in the next financial year.<br />
            </p>
             <p><br />

            <strong>Thank You,</strong><br />
            <strong>HR Administrator</strong>
            <br />
            </p>
        </div>
    </div>
    <div class="col-xs-3"></div>
</div>

</div>
</body>
</html>  
		
<%
	}
}
%>