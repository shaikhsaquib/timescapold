<%--
 -- @(#)searchNomineeDetails.jsp	8/6/2002
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
<%@ page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,com.bccl.util.Breadcrumbs,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>

<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" scope="session"/>
<script Language="JavaScript" src="../jscripts/bcclSearchNomineeDetails.js"></script>

<%!
String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
Hashtable gender = new Hashtable();
Hashtable maritalStatus = new Hashtable();
Hashtable isHandicapped = new Hashtable();
%>


<%
String compCode="01";
String selfGender= "M";
String parentGender="";
gender.put("M","Male");
gender.put("F","Female");
gender.put("O","Organization");

maritalStatus.put("S","Single");
maritalStatus.put("U","Single");
maritalStatus.put("M","Married");
maritalStatus.put("."," ");
maritalStatus.put(""," ");

isHandicapped.put("N"," ");


String tempStr = "";
session.setAttribute("currLink","search information");
session.setAttribute("leftLink","0");
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","myProfile.breadcrumb");
session.setAttribute("leftLink","3");

String displayMessage = "";
%>


<html>
	<head>
        <title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
        <script Language="JavaScript" src="../jscripts/utility.js"></script>
		<script Language="JavaScript" src="../jscripts/util.js"></script>
	</head>
	<%@ include file="../includes/empHeader.jsp" %>

	<!--  Get the company Code and pay id for the selected employee -->
<% String sapNumber = (String) request.getParameter("sapNumber");
	String userTitle=(String)profile.get("title");
	userTitle=userTitle.trim();
	String company=(String)profile.get("companyCode");
	String deptCode=(String)profile.get("deptGroup");
%>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form name="frmSearchNominee" action="" method="post">
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
			String message= "";

     		ArrayList nomineeDetails = new ArrayList();
			
			if(sapNumber == null || sapNumber.equals("")){
				//out.println("1");
				sapNumber= "";
			}else{
              //out.println(companyCode);
			  if(sapId.equals("14801344")|| sapId.equals("15605842") || sapId.equals("14802017") || sapId.equals("14802698") ){
				nomineeDetails = mediclaimController.getNominees(sapNumber, "1000");  ////done specifically for searching BTD employees on requirement from Stevenson Faroz (TGBCL HR employee)
			  }
			  else{
				nomineeDetails = mediclaimController.getNominees(sapNumber, companyCode);
			  }
			}
			nomineeCount=nomineeDetails.size();
			//out.println(nomineeCount);
			if ((!(sapNumber == null || sapNumber.equals(""))) && (nomineeCount==0))
			{
			%>
			<script Language="javascript">
				//alert(<%=sapNumber%>);
				javascript:norecordsfound(<%=sapNumber%>);
			</script>
			<%
			}
			
			int iCompany = 0;
			if(sapId.equals("15605842") ){
				iCompany = 1000;
			}else{
				 iCompany = Integer.parseInt(company);

			}
%>
	<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
			<td valign = "top">
				<%@ include file="../includes/profileTabs.jsp" %>
				<%//@ include file="../includes/mediclaimDetails.jsp"%>			
			</td>
		</tr>
		<tr><td height="40px"><block type="spacer" height="40px"></td>
		</tr>
		  <tr>
		<td width="100%" align="center" colspan="7" class = "small">Enter Sap No: <input type="text" class = "small" name="sapNumber" value="<%=sapNumber%>"/></td>
	</tr>  
		<tr><td height="20px"><block type="spacer" height="20px"></td>
		</tr>
	<tr>
		<td width="100%"align="center"colspan="7"><a href="javascript:check()"><img src="../images/but_submit.gif"border="0"><a/>&nbsp;&nbsp;<a href="javascript:clear()"><img src="../images/but_reset.gif" border="0"></a></td>
	</tr>

	</table>
<%
			switch(iCompany){
			
			case 1000:
				if(nomineeCount>0){
				//out.println(nomineeCount);
%>
					<%@ include file="hrBcclPolicySearch.jsp"%>			
<%			
				}
			break;
			case 1001:
				if(nomineeCount>0){
				//out.println(nomineeCount);
%>
					<%@ include file="hrenilPolicySearch.jsp"%>			
<%			
				}
			break;

			case 1017:
				if(nomineeCount>0){
				//out.println(nomineeCount);
%>
					<%@ include file="hrTimlPolicySearch.jsp"%>			
<%			
				}
			break;

			case 1009:
				if(nomineeCount>0){
				//out.println(nomineeCount);
%>
					<%@ include file="hrTimlPolicySearch.jsp"%>			
<%			
				}
			break;

			case 1005:	////done specifically for searching BTD employees on requirement from Stevenson Faroz (TGBCL HR employee)
				if(nomineeCount>0){
				//out.println(nomineeCount);
%>
					<%@ include file="hrBcclPolicySearch.jsp"%>			
<%			
				}
			break;

			default:
			break;
			}//switch		
	//} // if -ends
%>

			<input type="hidden" name="selfGender" value="<%=selfGender%>">
			<input type="hidden" name="parentGender" value="<%=parentGender%>">
</form>
</body>
</html>
