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
 -- @author		Sachin Kale
 -- @version 	1.00, 04-DEC-2011
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Collections" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<jsp:useBean id="governanceController" class="com.bccl.governancecode.web.controllerbeans.GovernanceReviewerWebController" />
<%
	int k=1;
%>
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
		<script Language="JavaScript" src="../jscripts/allReports.js"></script>
        <script Language="JavaScript" src="../../jscripts/allModuleReports.js"></script>

	</head>
<!-- <body onLoad = "showDepartmentsCode()">
 -->	<form name="frmCntReport" method = "post">

<%		
		String criteria = "";
		companyCode = (String)request.getParameter("compCode");

        String selectedCompany  = (String) request.getParameter("selectedCompany");		
		session.setAttribute("selectedCompany",selectedCompany);
		
		String selectedModule  = (String) request.getParameter("selectedModule");		
		session.setAttribute("selectedModule",selectedModule);

        if((companyCode == null) || (companyCode == "" ))
				{
					companyCode = "1000";
				} else {
                    
                    session.setAttribute("companyCode",companyCode);
                }

		String departmentName = (String)request.getParameter("dept");
		criteria = (String)request.getParameter("SelValue");
        companyCode = (String) session.getAttribute("companyCode");
       
        if((departmentName == null) || (departmentName == "" ))
				{
					departmentName = "all";
				}
    
        session.setAttribute("companyCode",companyCode);

		GregorianCalendar thisDay = new GregorianCalendar( );
    	session.setAttribute("currLink","REPORT");
		session.setAttribute("leftLink","1");
		session.setAttribute("currLink","TOTAL COUNT REPORT");
		session.setAttribute("leftLink","3");
%>
	<%@ include file="../includes/headerMenu.jsp"%>
    <%@ include file="../../common/allModulePageCnt.jsp" %></td>

	<table width="100%" border="0" cellpadding="4" cellspacing="1" align="center">
		<tr>
			<td><%@ include file="../includes/governanceCodeMenuNew.jsp"%></td>
		</tr>
        <tr>
			<td width="100%" colspan="0" align="right" class="normal"><a href="../common/downloadNsoReport.jsp?compCode=<%=companyCode%>"><img src="../images/excel.png" border="0"  class="normal" align="right"></a>Total Not Signed-Off Users Report</td>
		</tr>
	</table>
  	
	<table width="100%" border="0" cellpadding="4" cellspacing="2" align="center">

<%
	
    //if(timescapeUserOId == 28163 || timescapeUserOId == 28821 || timescapeUserOId == 24939 || timescapeUserOId == 11855 || timescapeUserOId == 28476 || timescapeUserOId == 29838 || timescapeUserOId == 18732 || timescapeUserOId == 27598 || timescapeUserOId == 21929 ) {
		//companyCode = "1004";
	//}

	String currYear = thisDay.get(Calendar.YEAR)+"";
	String prevYear = thisDay.get(Calendar.YEAR)-1+"";
    //deptName = (String)request.getParameter("dept");

	ArrayList countList = new ArrayList();
	ArrayList dataArrList = new ArrayList();

	int completed = 0;
	int notCompleted = 0;
	int nonCompliance = 0;
	int compliance = 0;
	int totalUsers = 0;

    if(timescapeUserOId == 1851 || timescapeUserOId == 21069){

        companyCode = "1000";
        departmentName = deptName;

        }

	countList = governanceController.getTotalCount(companyCode,departmentName);
	//out.println(countList.size());

	String function = "";
	String functionHeadOId = "";
	String functionHead = "";
	String bgColor = "#f8f8f8";//"#F3F5D6";
    String dpCode = "";

	if ( countList.size() > 0){

		for(int i = 0; i< countList.size(); i++){
			
			String[] tmpArr = (String [] )countList.get(i); 
			
			/*if(!function.equals(tmpArr[0])){
			
				function = tmpArr[0];
				//functionHeadOId = "";
				//functionHead = "";
			
			}*/

			if(!functionHeadOId.equals(tmpArr[1])|| !function.equals(tmpArr[0])){
				

				String dataArr[] = new String [9];
				if(i > 0){

					totalUsers = completed + notCompleted; 
					dataArr[0] = function;
					dataArr[1] = functionHeadOId;
					dataArr[2] = functionHead;
					dataArr[3] = totalUsers+"";
					dataArr[4] = completed+"";
					dataArr[5] = notCompleted+"";
					dataArr[6] = compliance+"";
					dataArr[7] = nonCompliance+"";
                    dataArr[8] = dpCode;

					dataArrList.add(dataArr);
				}

				if(!function.equals(tmpArr[0])){
			
				function = tmpArr[0];
				dpCode = tmpArr[6];
				//functionHeadOId = "";
				//functionHead = "";
			
				}
				functionHeadOId = tmpArr[1];
				functionHead = tmpArr[2];

				completed = 0; notCompleted = 0; nonCompliance = 0; compliance = 0; totalUsers = 0;
				
			}
			
			if(tmpArr[3].equals("C")){
				completed += Integer.parseInt(tmpArr[5]); 
			}else{
				notCompleted += Integer.parseInt(tmpArr[5]); 
			}
			
			if(tmpArr[4].equals("Y")){
				compliance += Integer.parseInt(tmpArr[5]); 
			}else{
				if(tmpArr[3].equals("C")){
				 nonCompliance += Integer.parseInt(tmpArr[5]);
				}
			}

	}// end of for	

			totalUsers = completed + notCompleted; 
			String dataArr[] = new String [9];

			dataArr[0] = function;
			dataArr[1] = functionHeadOId;
			dataArr[2] = functionHead;
			dataArr[3] = totalUsers+"";
			dataArr[4] = completed+"";
			dataArr[5] = notCompleted+"";
			dataArr[6] = compliance+"";
			dataArr[7] = nonCompliance+"";
            dataArr[8] = dpCode;

			dataArrList.add(dataArr);

			completed = 0; notCompleted = 0; nonCompliance = 0; compliance = 0; totalUsers = 0;

%>
   <tr>
      <td width="18%" align="left"   valign="middle"  class="travelMenuBG">Functions</td>
	  <td width="17%" align="left"   valign="middle"  class="travelMenuBG">Function Head</td> 
      <td width="15%" align="center" valign="middle"  class="travelMenuBG">Total No. of Users</td>
      <td width="12%" align="center" valign="middle"  class="travelMenuBG">Signed Off</td>
      <td width="14%" align="center" valign="middle"  class="travelMenuBG">Not Signed Off</td>
      <td width="12%" align="center" valign="middle"  class="travelMenuBG">Complied</td>
      <td width="12%" align="center" valign="middle"  class="travelMenuBG">Not Complied</td>
    </tr>

	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
	<td valign="top">
	<div style="height:180px; overflow:scroll;">
	<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center"> 
<%
		for(int jj = 0; jj < dataArrList.size(); jj++){

			
		String []tmpArr = (String [] )dataArrList.get(jj); 
		long apprID = Long.parseLong(tmpArr[1]);
        //out.println(tmpArr[8]);
%>
		<tr <%if((jj%2)==0){%>bgcolor="#f6f6f6"<%}%> height="20px">
			 <td align="left"   width="18%" valign="middle"  class="normal"><%=tmpArr[0]%></td>
			 <td align="left"   width="17%" valign="middle"  class="normal"><%=tmpArr[2]%></td>
			 <td align="center" width="15%" valign="middle"  class="normal"><%=tmpArr[3]%></td>
<%
			 if(!("0".equals(tmpArr[4]))){
			 
%>
			 <td align="center" width="12%" valign="middle"  class="normal"><a href="javascript:userReport('<%=companyCode%>', '<%=tmpArr[8]%>','<%=prevYear%>','<%=apprID%>','<%="C"%>')" class="normal"><%=tmpArr[4]%></td>

<%
			 }else if("0".equals(tmpArr[4])){
%>
			 <td align="center" width="12%" valign="middle"  class="normal"><%=tmpArr[4]%></td>

<%
			 }
%>

<%
			 if(!("0".equals(tmpArr[5]))){
%>
			<td align="center" width="14%" valign="middle"  class="normal"><a href="javascript:userReport('<%=companyCode%>', '<%=tmpArr[8]%>','<%=prevYear%>','<%=apprID%>','<%="I"%>')" class="normal"><%=tmpArr[5]%></td>

<%
			 }else if("0".equals(tmpArr[5])){
%>
			 <td align="center" width="14%" valign="middle"  class="normal"><%=tmpArr[5]%></td>

<%
			 }

			 if(!("0".equals(tmpArr[6]))){
%>
			 <td align="center" width="12%" valign="middle"  class="normal"><a href="javascript:compliedReport('<%=companyCode%>', '<%=tmpArr[8]%>','<%=prevYear%>','<%=apprID%>','<%="C"%>','<%="Y"%>')" class="style3underline"><%=tmpArr[6]%></td>

<%
			 }else if("0".equals(tmpArr[6])){
%>
			 <td align="center" width="12%" valign="middle"  class="normal"><%=tmpArr[6]%></td>

<%
			 }

			 if(!("0".equals(tmpArr[7]))){
				
			 String criteriaA = "'C'," + "'I'" ;
			 //out.println(criteriaA);
				 
%>

			 <td align="center" width="12%" valign="middle"  class="normal"><a href="javascript:compliedReport('<%=companyCode%>', '<%=tmpArr[8]%>','<%=prevYear%>','<%=apprID%>','<%="C"%>','<%="N"%>')" class="style3underline"><%=tmpArr[7]%></td>

<%
			 }else if("0".equals(tmpArr[7])){
%>
			 <td align="center" width="12%" valign="middle"  class="normal"><%=tmpArr[7]%></td>

<%
			 }
%>
		</tr>
	
<%

		}//end of display data for
		
	
	}else {

%>
	<tr class="style3">
      <td colspan="100%" align="left" valign="middle" bgcolor="#B4E1E7" class="name">There is no data to display!!</td>
	</tr>

<%	
	}//end of main if--else

%>
</table>
 </div>
 </td>
 </tr>
 </table>
			<!-- <table width="100%" height="40" border="0" cellpadding="2" cellspacing="2">
			  <tr>
			  <td width="100%" height="17" colspan="4" align="center" valign="middle" bgcolor="#CBECEF" class="style4"><div align="center"> <input type="button" name="Back" value="Home" onclick = "returnMainPage()"></div></td>
			  </tr>
			</table> -->
</form>
</body>
</html>