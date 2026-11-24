<%--
 -- Governance Code
 -- @(#)countReport.jsp	11/05/2011
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Nitin Sharma
 -- @version 	1.00, 11-MAY-2011
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Collections" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<jsp:useBean id="governanceController" class="com.bccl.governancecode.web.controllerbeans.GovernanceReviewerWebController" />

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>Count Report</title>
		<link href="../style/governance.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		<!--
		body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
		}
		-->
	</style>
		<link href="../style/governance.css" rel="stylesheet" type="text/css" />
		<script Language="JavaScript" src="../jscripts/report.js"></script>
	</head>



<body>
<form name="frmCntReport" method = "post" action = "">


<%@ include file="../includes/headerMenu.jsp"%>
<%		
		String compCode= "1003";
		String roleCode = "3";
		
    	session.setAttribute("currLink","COUNT");
		session.setAttribute("leftLink","2");
%>
		<%@ include file="../includes/reportTabs.jsp"%> </td>


<%
	GregorianCalendar thisDay = new GregorianCalendar( );
	
	String currYear = thisDay.get(Calendar.YEAR)+"";
	String prevYear = thisDay.get(Calendar.YEAR)-1+"";
	
	String criteria = "department";

	ArrayList countResult = new ArrayList();
	ArrayList detailResult = new ArrayList();
	ArrayList reportResult = new ArrayList();
	ArrayList totalUsers =  new ArrayList();
	//ArrayList sesTotalUsers =  new ArrayList();
	ArrayList userAllOid =  new ArrayList();
	ArrayList sesUserAllOid =  new ArrayList();
	ArrayList userNtActOid =  new ArrayList();
	ArrayList sesUserNtActOid =  new ArrayList();
	ArrayList userPartOid =  new ArrayList();
	ArrayList sesUserPartOid =  new ArrayList();
	ArrayList totalAppr =  new ArrayList();
	//ArrayList sesTotalAppr =  new ArrayList();
	ArrayList apprAllOid =  new ArrayList();
	ArrayList sesApprAllOid =  new ArrayList();
	ArrayList apprNtActOid =  new ArrayList();
	ArrayList sesApprNtActOid =  new ArrayList();
	ArrayList apprPartOid =  new ArrayList();
	ArrayList sesApprPartOid =  new ArrayList();

	int yesCnt = 0;
	int noCnt = 0;
	int notRatedCnt = 0;
	int nonCompCnt = 0;

	countResult = governanceController.getCount(prevYear, currYear);
	detailResult = governanceController.viewReports(criteria, prevYear, currYear);
	reportResult = governanceController.getReportCount(prevYear, currYear);
	//out.println(reportResult.size());

	String function = "";
	int answered = 0;
	String ansYes = "";
	String ansNo = "";
	String ansNotRated = "";

	String bgColor = "#F3F5D6";
	int colorCnt = 0;




	if ( countResult.size() > 0){

%>
  <table width="70%" border="0" cellpadding="4" cellspacing="1" align="center">
        	
    <tr class="style3">
      <td width="16%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">Functions</td>
      <td width="12%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">No. of Users</td>
      <td width="18%" align="left" valign="middle" bgcolor="#B4E1E7" class="name"> Acted on all Questions</td>
      <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name"> Acted on partial Questions</td>
      <td width="12%" align="left" valign="middle" bgcolor="#B4E1E7" class="name"> Not Rated</td>
      <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name"> Complied</td>
      <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">Non Complied</td>
    </tr>
	

	<%

  
	for(int i = 0; i< countResult.size(); i++){
		
		String[] tmpArr1 = (String [] )countResult.get(i); 
		
			function = tmpArr1[0];
			//out.println(function);		
			
			for(int j = 0; j< detailResult.size(); j++){
		
				String[] tmpArr = (String [] )detailResult.get(j); 
		//		out.println(tmpArr[14]);	
				if (function.equals(tmpArr[14])) {

					if(!totalUsers.contains(tmpArr[22])) {
	  				
						totalUsers.add(tmpArr[22]);
		 
						if(!tmpArr[2].equals("Not Rated")){
						
							userAllOid.add(tmpArr[22]);

						}

						if(tmpArr[2].equals("Not Rated")){
							
							  userNtActOid.add(tmpArr[22]);
		//out.println(tmpArr[22]);				
						}
					
					}else{
        
					   if(tmpArr[2].equals("Not Rated") && (userAllOid.indexOf(tmpArr[22])>-1)) {
						
						 if(userAllOid.contains(tmpArr[22])) {
						
							userAllOid.remove(userAllOid.indexOf(tmpArr[22]));
							userPartOid.add(tmpArr[22]);
						  out.println(tmpArr[22]);
						 }
						
						} else if(!tmpArr[2].equals("Not Rated") && (userNtActOid.indexOf(tmpArr[22])>-1 )){
								
							if(userNtActOid.contains(tmpArr[22])) {
							 
							 userNtActOid.remove(userNtActOid.indexOf(tmpArr[22]));
							 userPartOid.add(tmpArr[22]);
							}
						}
					}

				} // end of while loop

				 if (colorCnt%2==0)
			        bgColor="#F8F8F8";
                    else
					bgColor = "#E9F7F8";
					  
					colorCnt++;

	}
	 
	 sesUserAllOid.addAll(userAllOid);
	 sesUserNtActOid.addAll(userNtActOid);
	 sesUserPartOid.addAll(userPartOid);
	 //Collections.copy(sesUserAllOid, userAllOid);
	 //Collections.copy(sesUserNtActOid, userNtActOid);
	 //Collections.copy(sesUserPartOid, userPartOid);

	 session.setAttribute("sesUserAllOid",sesUserAllOid);
	 session.setAttribute("sesUserNtActOid",sesUserNtActOid);
	 session.setAttribute("sesUserPartOid",sesUserPartOid);


	
%>

	<tr>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><%=function%></td>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><!-- <a href="#" onclick="userReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="users"%>')"> --><%=tmpArr1[7]%></td>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="userReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="usersAll"%>')"><%=userAllOid.size()%></td>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="userReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="userPart"%>')"><%=userPartOid.size()%></td>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="userReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="userNotAct"%>')"><%=userNtActOid.size()%></td>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="compliedReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="complied"%>')"><%=tmpArr1[6]%></td>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="nonCompliedReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="nonCompliedReport"%>')"><%=tmpArr1[5]%></td>
		</tr>


<%	 
	 totalUsers.clear();
	 userAllOid.clear();
	 userPartOid.clear();
	 userNtActOid.clear();


	
	}

%>
<tr class="style3">
      <td colspan="2" align="left" valign="middle">&nbsp;</td>
      <td colspan="2" align="left" valign="middle">&nbsp;</td>
</tr>

<tr class="style3">
      <td width="16%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">Functions</td>
      <td width="12%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">No. of Approvers</td>
      <td width="18%" align="left" valign="middle" bgcolor="#B4E1E7" class="name"> Acted on all Questions</td>
      <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name"> Acted on partial Questions</td>
      <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name"> Not Rated</td>
    <!--   <td width="12%" align="left" valign="middle" bgcolor="#B4E1E7" class="nameHEAD"> Not Rated</td> -->
      <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name"> Complied</td>
      <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">Non Complied</td>
     <!--  <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="nameHEAD">Overriden Questions</td> -->
    </tr>

<%
}

	for(int i = 0; i< countResult.size(); i++){
		
		String[] tmpArr1 = (String [] )countResult.get(i); 
		
			function = tmpArr1[0];
			//	out.println(function);		
			
			for(int j = 0; j< detailResult.size(); j++){
		
				String[] tmpArr = (String [] )detailResult.get(j); 
		//		out.println(tmpArr[14]);	
				if (function.equals(tmpArr[14])) {

					      if(!totalAppr.contains(tmpArr[24])) {
							 
							 	totalAppr.add(tmpArr[24]);
		 
								if(!tmpArr[23].equals("NA") && !apprAllOid.contains(tmpArr[24])){
								
									apprAllOid.add(tmpArr[24]);
	
								}

								if(tmpArr[23].equals("NA") && !apprNtActOid.contains(tmpArr[24])){
								
									apprNtActOid.add(tmpArr[24]);

								}

				}else{
						
						if(tmpArr[23].equals("NA") && (apprAllOid.indexOf(tmpArr[24])>-1)) {
							
							if(apprAllOid.contains(tmpArr[24])) {

							apprAllOid.remove(apprAllOid.indexOf(tmpArr[24]));
							apprPartOid.add(tmpArr[24]);

							}
		    
						} else if(!tmpArr[23].equals("NA") && (apprNtActOid.indexOf(tmpArr[24])>-1 )){
							
							if(apprNtActOid.contains(tmpArr[24])){

							apprNtActOid.remove(apprNtActOid.indexOf(tmpArr[24]));
							apprPartOid.add(tmpArr[24]);
							
							}
						}
				}
			}
		}

	 sesApprAllOid.addAll(apprAllOid);
	 sesApprPartOid.addAll(apprPartOid);
	 sesApprNtActOid.addAll(apprNtActOid);
//out.println(sesApprPartOid);

%>
	<tr>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><%=function%></td>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><%=tmpArr1[10]%></td>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="apprReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="apprAll"%>')"><%=apprAllOid.size()%></a></td>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="apprReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="apprPart"%>')"><%=apprPartOid.size()%></a></td>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="apprReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="apprNtAct"%>')"><%=apprNtActOid.size()%></a></td>
	<!-- 	 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><%=tmpArr1[9]%></td> -->
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="apprComplied('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="apprComplied"%>')"><%=tmpArr1[9]%></a></td>
		 <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="apprNonComplied('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="apprNonComplied"%>')"><%=tmpArr1[7]%></a></td>
		</tr>
<%
		session.setAttribute("sesApprAllOid",  sesApprAllOid);
		session.setAttribute("sesApprPartOid", sesApprPartOid);
		session.setAttribute("sesApprNtActOid", apprNtActOid);


	apprAllOid.clear();
	apprPartOid.clear();
	apprNtActOid.clear();
	totalAppr.clear();

	
	}
%>

<tr class="style3">
      <td colspan="2" align="left" valign="middle">&nbsp;</td>
      <td colspan="2" align="left" valign="middle">&nbsp;</td>
</tr>

<tr class="style3">
      <td width="16%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">Functions</td>
      <td width="12%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">Functional Head</td>
      <td width="18%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">No. of Users</td>
      <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">No. of Users Not Acted</td>
      <!-- <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">Status (Pass/Fail)</td> -->
    <!--   <td width="12%" align="left" valign="middle" bgcolor="#B4E1E7" class="nameHEAD"> Not Rated</td> -->
      <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name"> Complied</td>
      <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">Non Complied</td>
       <!-- <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="nameHEAD">Remarks</td> -->
    </tr>
	<% 
		String apprOId = "";
		String departmentName = "";
		for(int i = 0;i<reportResult.size();i++) {
		String tempArray[] = (String [])reportResult.get(i);
		apprOId  = (String)tempArray[9];
		departmentName  = (String)tempArray[0];
	%>
	<tr class="style3">
      <td width="16%" align="left" valign="middle" bgcolor="<%=bgColor%>" class="name"><%=tempArray[0]%></td>
      <td width="12%" align="left" valign="middle" bgcolor="<%=bgColor%>" class="name"><%=tempArray[1]%></td>
      <td width="18%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a class="style3underline" href="functionReport.jsp?apprOId=<%=tempArray[9]%>&departmentName=<%=tempArray[0]%>"><%=tempArray[8]%></td>
      <td width="14%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="userReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="userNotAct"%>')"><%=userNtActOid.size()%></td>
      <!-- <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">Status (Pass/Fail)</td> -->
    <!--   <td width="12%" align="left" valign="middle" bgcolor="#B4E1E7" class="nameHEAD"> Not Rated</td> -->
      <td width="14%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="compliedReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="complied"%>')"><%=tempArray[7]%></td>
      <td width="14%" align="left" valign="middle" bgcolor="<%=bgColor%>"><a href="#" class="style3underline" onclick="nonCompliedReport('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=currYear%>','<%="nonCompliedReport"%>')"><%=tempArray[6]%></td>
     <!--  <td width="14%" align="left" valign="middle" bgcolor="#B4E1E7" class="nameHEAD">Overriden Questions</td> -->
    </tr>
<% 
		}
%>

</table>
</form>
</body>

</html>