<%--
 -- @(#)viewNomineeDetails.jsp	8/6/2002
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author  Amey Divekar
 -- @version 	1.00, April 29, 2007

 -- Comments...
 --		Included sendMail.jsp file to send an email to HR on alteration of nominee list.
 -- @author		Manisha Wadhawane
 -- @version 	2.00, May 07, 2008

 -- Comments...
 --		Added Medicalim policy for ZEN.
 -- @author		Manisha Wadhawane
 -- @version 	3.00, Sep 24, 2009
 --%> 

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList, java.text.DateFormat, java.text.SimpleDateFormat" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,java.util.Date,com.bccl.util.Breadcrumbs,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>

<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" scope="session"/>


<%!
String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
Hashtable gender = new Hashtable();
Hashtable maritalStatus = new Hashtable();
Hashtable isHandicapped = new Hashtable();
Hashtable month = new Hashtable();


%>


<%
String selfGender= "M";
String parentGender="";
String lastUpdated="";
gender.put("M","Male");
gender.put("F","Female");
gender.put("O","Organization");
//out.println(parentGender);
maritalStatus.put("S","Single");
maritalStatus.put("U","Single");
maritalStatus.put("M","Married");
maritalStatus.put("."," ");
maritalStatus.put(""," ");

isHandicapped.put("N"," ");

String tempStr = "";
session.setAttribute("currLink","personal information");
session.setAttribute("leftLink","0");
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","myProfile.breadcrumb");
session.setAttribute("leftLink","0");
String displayMessage = "";

month.put("JAN","1");
month.put("FEB","2");
month.put("MAR","3");
month.put("APR","4");
month.put("MAY","5");
month.put("JUN","6");
month.put("JUL","7");
month.put("AUG","8");
month.put("SEP","9");
month.put("OCT","10");
month.put("NOV","11");
month.put("DEC","12");
%>

<html>
	<head>
        <title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
        <link href="../style/style.css" rel="stylesheet" type="text/css" />
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
		
        <script Language="JavaScript" src="../jscripts/jquery-1.3.2.min.js"></script>
        <script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript">
			function openMediclaimNominee()
			{
				window.open('../utils/mediclaimInsurance.html','MediclaimNominee','resizable=yes,scrollbars=yes,toolbars=no,width=900,height=550,top=100,left=50');
				window.focus();
				return;
			}
			function openTimlMediclaimNominee()
			{
				window.open('../utils/mediclaimInsuranceTiml.html','MediclaimNominee','resizable=yes,scrollbars=yes,toolbars=no,width=900,height=550,top=100,left=50');
				//window.focus();
				return;
			}

			function openMediclaimNomineeEnil()
			{
				window.open('../utils/mediclaimInsuranceEnil.html','MediclaimNominee','resizable=yes,scrollbars=yes,toolbars=no,width=900,height=550,top=100,left=50');
				window.focus();
				return;
			}




        </script>
	</head>
	<%@ include file="../includes/empHeader.jsp" %>
		<%@ include file="../../common/adirData.jsp"%>

    <% long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");
        String userTitle=(String)profile.get("title");
        userTitle=userTitle.trim();
		
	
        String company=(String)profile.get("companyCode");
        String deptCode=(String)profile.get("deptGroup");
    %>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" 
     <%
        if (( company.equals("1042"))&& (!(deptCode.equals("1296")|| deptCode.equals("1297")|| deptCode.equals("1298")|| deptCode.equals("1299")|| deptCode.equals("1300")|| deptCode.equals("1498")|| deptCode.equals("1499")|| deptCode.equals("1500")|| deptCode.equals("1501")|| deptCode.equals("1559")|| deptCode.equals("1560")|| deptCode.equals("1581")|| deptCode.equals("1582")|| deptCode.equals("1784")|| deptCode.equals("1785")|| deptCode.equals("1786")|| deptCode.equals("1787")|| deptCode.equals("1859")|| deptCode.equals("1994")))) {
    %> 
           onload="javascript:void openMediclaimNominee()"
    <%
        }
		else if (company.equals("1017")) {
    %>
          onload="javascript:void openTimlMediclaimNominee()"
    <%
        }
    
else if (company.equals("1001")) {
    %>
          onload="javascript:void openMediclaimNomineeEnil()"
    <%
        }
    %>


>
<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
		<td valign = "top">
			<%@ include file="../includes/profileTabs.jsp" %>
				
		</td>
	</tr>
</table>

<%
if (companyCode.equals("1000") && (!(deptCode.equals("1296") || deptCode.equals("1297") || deptCode.equals("1298") || deptCode.equals("1299") || deptCode.equals("1300") || deptCode.equals("1498") || deptCode.equals("1499") || deptCode.equals("1500") || deptCode.equals("1501") || deptCode.equals("1559") || deptCode.equals("1560") || deptCode.equals("1581") || deptCode.equals("1582") || deptCode.equals("1739") || deptCode.equals("1740") || deptCode.equals("1741") || deptCode.equals("1742") || deptCode.equals("1743") || deptCode.equals("1744") || deptCode.equals("1745") || deptCode.equals("1746") || deptCode.equals("1747") || deptCode.equals("1748") || deptCode.equals("1749") || deptCode.equals("1750") || deptCode.equals("1751") || deptCode.equals("1752") || deptCode.equals("1753") || deptCode.equals("1754") || deptCode.equals("1755") || deptCode.equals("1756") || deptCode.equals("1757") || deptCode.equals("1758") || deptCode.equals("1759") || deptCode.equals("1760") || deptCode.equals("1761") || deptCode.equals("1762") || deptCode.equals("1763") || deptCode.equals("1764") || deptCode.equals("1765") || deptCode.equals("1766") || deptCode.equals("1767") || deptCode.equals("1784") || deptCode.equals("1785") || deptCode.equals("1786") || deptCode.equals("1787") || deptCode.equals("1859") || deptCode.equals("1994")|| usersList.contains(sapId) ))){

%>				
						<div id="vpf-details" class="vpf-details">
							<!-- <h3 class="vpf-title-h3">Dear Applicant, Please note that, Claims are being migrated to My-HR. You shall receive a communication soon with further updates.</a></b></h3> -->
							<h3 class="vpf-title-h3">To add / update / view  <b>Mediclaim nominations</b>, please go to <a href="https://performancemanager5.successfactors.eu/sf/liveprofile/login?company=bennett" target="_blank" > MyHR</a></h3>
						</div>

<%			}else{

	if( (company.equals("1000") && deptCode.equalsIgnoreCase("ZOOM")) || (company.equals("1000") && deptCode.equalsIgnoreCase("TJ"))){	
				
		displayMessage = "This Medical Insurance Scheme is available for BCCL Employees only.";

	

	}else if(!(company.equals("1000")||company.equals("1005")||company.equals("1003")||company.equals("1006")||company.equals("1004")||company.equals("1002")||company.equals("1017") || company.equals("1025") || company.equals("1026") || company.equals("1027") || company.equals("1030") || company.equals("1031") || company.equals("1036") || company.equals("1042") || company.equals("1001") || company.equals("1039")|| company.equals("1040")|| company.equals("1041") || company.equals("1034") || company.equals("1009")  || company.equals("1035") || company.equals("1043") || company.equals("1044") || company.equals("1048") || company.equals("1046") || company.equals("1047") ||  company.equals("1035") || company.equals("1007") || company.equals("2109") || company.equals("1042"))) {

		displayMessage = "This Medical Insurance Scheme is available for BCCL,ENIL, BIHE, TIL, TGBCL, TBSL, ZEN, BETL, TIML, A2Z, TML, GGL, TCT, ETIN, BTSL & BBDSL Employees only.";
	}else{
		displayMessage = "";
	}
    
	
	if((company.equals("1000")||company.equals("1005")||company.equals("1003")||company.equals("1006")|| company.equals("1004")||company.equals("1002")||company.equals("1017")||company.equals("1031") || company.equals("1032") || company.equals("1027") || company.equals("1030") ||   company.equals("1031") || company.equals("1036") || company.equals("1042") || company.equals("1001") || company.equals("1039")|| company.equals("1040")|| company.equals("1041") || company.equals("1034") || company.equals("1009")  || company.equals("1035") || company.equals("1043") || company.equals("1044") || company.equals("1048") || company.equals("1046") || company.equals("1047") ||  company.equals("1035") || company.equals("2109") || company.equals("1007") || company.equals("1042")) && displayMessage.equals(""))
	{
		
%>

<%
			GregorianCalendar today =  new GregorianCalendar( );
		
			String curDay=today.get(Calendar.DATE)+"";
			String curMonth=(today.get(Calendar.MONTH)+1)+"";
			String curYear=today.get(Calendar.YEAR)+"";
			int nomineeCount=0;
			int spouseCount=0;
			int parentCount=0;
			int inlawCount=0;
			int childrenCount=0;


			String empBDay = birthdate.substring(0,2);
			String empBMonth = birthdate.substring(3,6);
			String empBYear = birthdate.substring(7,11);

			/*out.println("AA"+birthdate);
			out.println("BB"+empBDay);
			out.println("CC"+empBMonth);
			out.println("DD"+empBYear);*/

			ArrayList nomineeDetails = null;
			nomineeDetails = mediclaimController.getNominees(timescapeUserOID);

			nomineeCount=nomineeDetails.size();
	
			int iCompany = Integer.parseInt(company);
			%>
			<%@ include file="switchPage.jsp" %>	
	<%
	} 

}
%>
	
	<tr>
			 <td colspan = "100%" height = "30" class="rednormal" align = "center">
				&nbsp;
			 </td>
		  </tr>

		

		  <tr>
			 <td colspan = "100%" align = "center" class="rednormal">
				<div align="center" class="rednormal"><%=displayMessage%></div>			 
			</td>
		  </tr>

			<input type="hidden" name="selfGender" value="<%=selfGender%>">
			<input type="hidden" name="parentGender" value="<%=parentGender%>">
			<input type="hidden" name="lastUpdated" value="<%=lastUpdated%>">
</form>
</table>
</body>
</html>   