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
<%@ page errorPage="../common/errorPage.jsp"%>
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
		<script Language="JavaScript" src="../jscripts/report.js"></script>
	</head>
<body>
	<form name="frmCntReport" method = "post">
	
<%		
		
		GregorianCalendar thisDay = new GregorianCalendar( );
    	session.setAttribute("currLink","REPORT");
		session.setAttribute("leftLink","1");
		session.setAttribute("currLink","TOTAL COUNT REPORT");
		session.setAttribute("leftLink","3");
%>
	<%@ include file="../includes/headerMenu.jsp"%>
	<table width="100%" border="0" cellpadding="4" cellspacing="1" align="center">
		<tr>
			<td><%@ include file="../includes/governanceCodeMenu.jsp"%></td>
		</tr>
	</table>
  	
	<table width="100%" border="0" cellpadding="4" cellspacing="2" align="center">

<%
	
    if(timescapeUserOId == 28163) {
		deptName = "1002";
	}

	String currYear = thisDay.get(Calendar.YEAR)+"";
	String prevYear = thisDay.get(Calendar.YEAR)-1+"";

	ArrayList countList = new ArrayList();
	ArrayList dataArrList = new ArrayList();

	int completed = 0;
	int notCompleted = 0;
	int nonCompliance = 0;
	int compliance = 0;
	int totalUsers = 0;
    //String departmentName = (String)request.getParameter("dept");
    String departmentName = deptName;
    
    if (!companyCode.equals("1000")) {

        departmentName = "all";

    }

	if(timescapeUserOId == 28163) {
		departmentName = "1002";
	}

     if((departmentName == null) || (departmentName == "" ))
				{
					departmentName = "all";
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
   <tr class="style3">
      <td width="20%" align="left" valign="middle"  class="travelMenuBG">Functions</td>
	  <td width="20%" align="left" valign="middle"  class="travelMenuBG">Function Head</td> 
      <td width="12%" align="right" valign="middle" class="travelMenuBG">Total No. of Users</td>
      <td width="12%" align="right" valign="middle" class="travelMenuBG">Signed Off</td>
      <td width="12%" align="right" valign="middle" class="travelMenuBG">Not Signed Off</td>
      <td width="12%" align="right" valign="middle" class="travelMenuBG">Complied</td>
      <td width="12%" align="right" valign="middle" class="travelMenuBG">Not Complied</td>
    </tr>

	</table>
	<div style="height:200px; overflow:scroll">
	<table width="100%" border="0" cellpadding="1" cellspacing="1" align="center">
<%
		for(int jj = 0; jj < dataArrList.size(); jj++){

		
			
		String []tmpArr = (String [] )dataArrList.get(jj); 
		long apprID = Long.parseLong(tmpArr[1]);
        //out.println(tmpArr[8]);
%>
		<tr <%if((jj%2)==0){%>bgcolor="#f6f6f6"<%}%> height="20px">
			 <td align="left" width="20.5%" valign="middle"  class="normal"><%=tmpArr[0]%></td>
			 <td align="left" width="21%" valign="middle"  class="normal"><%=tmpArr[2]%></td>
			 <td align="right" width="12%" valign="middle"  class="normal"><%=tmpArr[3]%></td>
<%
			 if(!("0".equals(tmpArr[4]))){
			 
%>
			 <td align="right" width="12%" valign="middle"  class="normal"><a href="javascript:userReport('<%=companyCode%>', '<%=tmpArr[8]%>','<%=prevYear%>','<%=apprID%>','<%="C"%>')" class="style3underline"><%=tmpArr[4]%></td>

<%
			 }else if("0".equals(tmpArr[4])){
%>
			 <td align="right" width="12%" valign="middle"  class="normal"><%=tmpArr[4]%></td>

<%
			 }
%>

<%
			 if(!("0".equals(tmpArr[5]))){
%>
			<td align="right" width="12%" valign="middle"  class="normal"><a href="javascript:userReport('<%=companyCode%>', '<%=tmpArr[8]%>','<%=prevYear%>','<%=apprID%>','<%="I"%>')" class="style3underline"><%=tmpArr[5]%></td>

<%
			 }else if("0".equals(tmpArr[5])){
%>
			 <td align="right" width="12%" valign="middle"  class="normal"><%=tmpArr[5]%></td>

<%
			 }

			 if(!("0".equals(tmpArr[6]))){
%>
			 <td align="right" width="12.5%" valign="middle"  class="normal"><a href="javascript:compliedReport('<%=companyCode%>', '<%=tmpArr[8]%>','<%=prevYear%>','<%=apprID%>','<%="C"%>','<%="Y"%>')" class="style3underline"><%=tmpArr[6]%></td>

<%
			 }else if("0".equals(tmpArr[6])){
%>
			 <td align="right"width="12.5%" valign="middle"  class="normal"><%=tmpArr[6]%></td>

<%
			 }

			 if(!("0".equals(tmpArr[7]))){
				
			 String criteriaA = "'C'," + "'I'" ;
			 //out.println(criteriaA);
				 
%>

			 <td align="right" width="11%" valign="middle"  class="normal"><a href="javascript:compliedReport('<%=companyCode%>', '<%=tmpArr[8]%>','<%=prevYear%>','<%=apprID%>','<%="C"%>','<%="N"%>')" class="style3underline"><%=tmpArr[7]%></td>

<%
			 }else if("0".equals(tmpArr[7])){
%>
			 <td align="right" width="11%" valign="middle"  class="normal"><%=tmpArr[7]%></td>

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
</form>
</body>
</html>