<%--
 -- Governance Code
 -- @(#)governanceAppr.jsp	11/02/2011
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
 -- @version 	1.00, 11-FEB-2011
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<jsp:useBean id="governanceApprover" class="com.bccl.governancecode.web.controllerbeans.GovernanceAppWebController" />

<%
	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	int questionNum;
	ArrayList getUserFeedback= new ArrayList();
	ArrayList approverResult = new ArrayList(); 
	ArrayList getUserNRFeedback = new ArrayList(); 
   

	GregorianCalendar thisDay = new GregorianCalendar( );
	String currDate = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
	String currYear = thisDay.get(Calendar.YEAR)+"";
	String prevYear = thisDay.get(Calendar.YEAR)-1+"";
	int flag = 0;int a=0;
		if(currDate.length() == 1){
			currDate = "0" + currDate;
}

			currDate =  currDate + "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);

			approverResult = governanceApprover.viewChklist(timescapeUserOId, prevYear, currYear);
		getUserNRFeedback = governanceApprover.getUserNRFeedback(timescapeUserOId, prevYear, currYear);
    boolean nrStatus = false;
	if(getUserNRFeedback.size()>0)
	{
        nrStatus=true;
	}
//out.println(nrStatus);
			//out.println(currYear);
			//out.println(prevYear);

	 String toDate = "";
	 String status = "";
	 String roleIds = "";
	 String isAttach="";
	 String policyHeader = "";
	 //String roleCode = "2"; 
	 //String userEmailid ="";

	session.setAttribute("currLink", "../approver/governanceAppr.jsp");
	session.setAttribute("topLink", "2");

		session.setAttribute("leftLink", "0");
%>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>Untitled Document</title>
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
		<script Language="JavaScript" src="../jscripts/savechklist.js"></script>

	</head>


	<body>
	<form name="frmSaveChklist" method = "post" action = "governanceApproverSubmit.jsp">
	<%@ include file="../includes/headerMenu.jsp"%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		    

		<tr>
			<td colspan="20">
				<%@ include file="../includes/governanceCodeMenu.jsp"%>
			</td>
		</tr>
		<tr>
			<td height="17" colspan="3" align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> From  01-04-2024 to 31-03-2025 </span></div></td>
			<td width="72%" colspan="3" align="center" valign="middle" class="style1"><div align="right"></div></td>
		</tr>
	 </table>

<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">

<% 	if (approverResult.size() > 0){ %>
				<tr>
					 <td width="2%" rowspan="2" align="left" valign="middle" bgcolor="#74CAD3" class="style1">Sr. No.</td>   
					
					<td width="30%" height = "26" rowspan="2" align="left" valign="middle" bgcolor="#74CAD3" class="style1">ACTION LEVEL</td>
					<td width="10%" height = "26" rowspan="2" align="left" valign="middle" bgcolor="#74CAD3" class="style1">STATUS SELF</td>
					<td width="15%" height = "26" rowspan="2" align="left" valign="middle" bgcolor="#74CAD3" class="style1" maxlength="255">Remarks (If Non Comply)</td> 
					<td width="13%" height = "26" rowspan="2" align="left" valign="middle" bgcolor="#74CAD3" class="style1">SUBORDINATE STATUS</td>
				</tr>
				<tr>
				<input type="hidden" name="roleCode" value="2"> 
<%	for(int i=0;i<approverResult.size();i++) {

	int cnt1 = 0;
	String feedBackOptions = "feedBackOptions"+i;
//out.println(feedBackOptions);
	String remarks = "remark"+i;
	String overriddenRemarks1 = "overriddenRemarks"+i;
	String overriddenRemarks = "";
	String overriddenRating = "";
	String overriddenRating1 = "overriddenRating"+i;
	String isChecked = "isChecked"+i;
	String noncomplianceText = "noncomplianceText"+i;
	String usrFeedback = "";
	String chkList = "";
	String[] tmpArr = (String[]) approverResult.get(i);	
	//remarks = tmpArr[3];
	String feedbackopt = tmpArr[2];
	String approverRemarks = tmpArr[10];
	
	System.out.println(tmpArr[11]);
 //overriddenRating = tmpArr[11];
	 if (tmpArr[11].equalsIgnoreCase("Yes")) {
		
		 isChecked ="checked";

}	else {

		 isChecked ="";

}
	//out.println( approverRemarks);
	
	if (remarks == null|| remarks.equals("") || remarks.equals("null") || remarks.equals("NA")) {
		
		remarks = "";

}
	
	if (approverRemarks == null||approverRemarks.equals("") || approverRemarks.equals("null") || approverRemarks.equals("NA")) {
		
		approverRemarks = "";

}


	//out.println(feedbackopt);    
	
		questionNum = Integer.parseInt(tmpArr[0]);
		getUserFeedback = governanceApprover.getUserFeedback(questionNum, timescapeUserOId, prevYear, currYear);

	for ( int k = 0; k < getUserFeedback.size(); k++ ) {
			
			String[] tmpArr1		= (String[]) getUserFeedback.get(k);
			
			//userEmailid = (String) tmpArr1[6];

					
				 //if (userEmailid.indexOf("@") > -1) {
                 
					//userEmailid = userEmailid.substring(0, userEmailid.indexOf("@")); 
					//out.println(userEmailid);
				 //}
			
			if (cnt1 == 1) {

				break;
	}
     //out.println(tmpArr1[1]);
			if ( tmpArr1[1].equalsIgnoreCase("Not Rated") ) {

				usrFeedback = "Not Rated" ;
				a = 1;
				cnt1 = 1;
	} 
			
			if ( !(tmpArr1[1].equalsIgnoreCase("Not Rated")) ) {

				if (tmpArr1[1].equalsIgnoreCase(tmpArr1[2])) {

					usrFeedback = "Non Complied" ;
	
					overriddenRemarks		= (String) tmpArr1[8];
					overriddenRating		= (String) tmpArr1[9];

					cnt1 =1;
				
	}		else {
				
					
					usrFeedback = "Complied" ;
					 overriddenRemarks		= (String) tmpArr1[8];
					 overriddenRating		= (String) tmpArr1[9];

				} 
			}
		}
//out.println(tmpArr[4]);
%>
	
	<input type="hidden" name="feedbackid<%=i%>" value="<%=tmpArr[4]%>"> 
	<input type="hidden" name="noncomplianceText<%=i%>" value="<%=tmpArr[13]%>"> 
	<input type="hidden" name="questionno<%=i%>" value="<%=tmpArr[0]%>">
	<input type="hidden" name="checklist<%=i%>" value="<%=tmpArr[1]%>">
	<input type="hidden" name="timescapeUserOId<%=i%>" value="<%=timescapeUserOId%>">
	 <!-- <input type="hidden" name="userAttachment<%=i%>" value="<%=tmpArr[6]%>">  --> 
<%	

	if (!policyHeader.equals(tmpArr[12])) {

		policyHeader = tmpArr[12];

%>
			<tr>
				<td bgcolor="#C0C0C0" height = "30" width="15%" align="left" valign="middle" class="name" colspan = "100%"> <b><%=tmpArr[12]%></b></td>
			</tr>
<%
			}

%>	
	<tr>
		<td bgcolor="#f8f8f8" class="style3"><%=i+1%></td>
		<td bgcolor="#f8f8f8" class="style3"><%=tmpArr[1]%></td>
	

		<!-- <td bgcolor="#f8f8f8" class="style3"><%=tmpArr[3]%></td> -->
<%
	if(usrFeedback.equalsIgnoreCase("Not Rated") && !tmpArr[14].equals("C")){
		//out.println(usrFeedback);	
%>
    <td bgcolor="#f8f8f8" class="style3">
		<select name="<%=feedBackOptions%>" class="normal" >
			<option value="NOT RATED" selected>Not Rated</option>
		</select></td>
	
<%
	}else {
//out.println(feedBackOptions);


%>
		 <td bgcolor="#f8f8f8" class="style3">
			<%@ include file="../includes/feedbackOptions.jsp"%>
		</td>	

<%	
	//out.println(overriddenRemarks);
		}

		
%>
	<td bgcolor="#f8f8f8">
		<textarea name="<%=remarks%>"rows="2" cols="25"   class="normal"><%=tmpArr[3]%></textarea>
	</td> 
	
<%
	if(nrStatus == true)
	{
%>
	<td bgcolor="#f8f8f8" class="style3" class="style3Underline">Not Rated</td>
<%
	}
	else
	{
	   if(usrFeedback.equalsIgnoreCase("Non Complied")){
	
	//out.println(overriddenRemarks);
%> 
	<td bgcolor="#f8f8f8" class="style3"><a class="style3Underline" href="../approver/governanceApprover.jsp?questionNo=<%=tmpArr[0]%>&checklist=<%=tmpArr[1]%>&userFeedback=<%=usrFeedback%>"><font color = "red"><%=usrFeedback%></font></td>

	</td> 
	<!-- <td bgcolor="#f8f8f8" class="style3" ><input type="checkbox" name="<%=overriddenRating1%>" value="yes" <%=isChecked%> ><br>
		
	</td> 
	<td bgcolor="#f8f8f8">
		<textarea name="<%=overriddenRemarks1%>" rows="2" cols="25"  class="normal" ><%=overriddenRemarks.equals("NA")?"":overriddenRemarks%></textarea>
    </td> -->
 	</tr>
<%
	}else if (usrFeedback.equalsIgnoreCase("Complied")){

%>	

<td bgcolor="#f8f8f8" class="style3" class="style3Underline">Complied</td>
	<!-- <td bgcolor="#f8f8f8" class="style3" > <input type="checkbox" name="<%=overriddenRating1%>" value="yes" disabled="disable" <%=isChecked%> ><br>
		
	</td> 
	<td bgcolor="#f8f8f8">
		  <textarea name="<%=overriddenRemarks1%>" rows="2" cols="25"  class="normal" disabled="disable" ><%=overriddenRemarks.equals("NA")?"":overriddenRemarks%></textarea> 
		<input type="hidden" name="<%=overriddenRemarks1%>" id="<%=overriddenRemarks1%>" value="NA"> 
    </td> -->
<%	
	
		} //else {

			//overriddenRemarksValue = "NA";
			//overriddenRating = "NA";
			//out.println(overriddenRemarks);
		
%>
		 <!-- <td bgcolor="#f8f8f8" class="style3" class="style3Underline">Not Rated -->
<!-- 	<%if(flag==0){%><input type="hidden" value="NR" name="notRated" id="notRated"><%flag++;}%></td>
	<td bgcolor="#f8f8f8" class="style3">
	<input type="checkbox" name="<%=overriddenRating1%>" value="yes" disabled="disable" <%=isChecked%> ><br>
	
	</td> 
	<td bgcolor="#f8f8f8">
		<textarea name="<%=overriddenRemarks1%>" rows="2"  cols="25"  class="normal" disabled="disable" ></textarea>
		<input type="hidden" name="<%=overriddenRemarks1%>" id="<%=overriddenRemarks1%>" value="NA">	
 -->    <!-- </td>  -->
<%  //}
	}
      status = tmpArr[14];
	  toDate = tmpArr[9];
	//out.println("status"+ status);
	}
  }

%> 

	<%@ include file = "../includes/checkApprDate.jsp"%>


			<p>&nbsp;</p>
		</table>
	</body>
</html>