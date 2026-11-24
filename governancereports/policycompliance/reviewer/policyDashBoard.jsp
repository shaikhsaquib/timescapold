<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Date" %>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 
<html>
<head>
<title>Daily Controls</title>
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/common.js"></script>
<script Language="JavaScript" src="../jscripts/approveDaily.js"></script>
</title>
</head>

<body>
<form name="frmCreateRequest" method = "post" action = "">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#98BF00"><img src="../images/header.jpg" width="519px" height="39" /></td>
  </tr>
   <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style2"><div align="left"><a href="../requestor/daily.jsp" class="style2">MY COMPLIANCE</a>&nbsp;&nbsp;|&nbsp;&nbsp;DASHBOARD&nbsp;&nbsp;| </div>
		</td>
  </tr>
</table>
<%
	ArrayList policyResult = new ArrayList();   
	  
	String roleId = (String)session.getAttribute("roleId");
	String status = "A";		

	policyResult = policyController.getReviewCount();

	//out.println(policyResult.size());
%>
<%
	session.setAttribute("currLink","POLICYWISE");
	session.setAttribute("leftLink","0");
%>
	<%@ include file="../includes/dashBoardTabs.jsp" %>

   <table width="100%" border="0" cellpadding="1" cellspacing="1">
  
  <%
         if ( policyResult.size() > 0){

  %>

	
		<tr>
		<td width="50%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Policy Head</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Acted</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Not Acted</td>
		<td width="30%" colspan="3" align="center" valign="middle" bgcolor="#4498C6" class="style1">Exceptions</td>
		</tr>
		<tr>
		<td width="50%" align="left" valign="middle" bgcolor="#4498C6" class="style1">&nbsp;</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">&nbsp;</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">&nbsp;</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">User</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Approver</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Both</td>
		</tr>
<%
				String header = "";
				String freq = "";
				String freqTxt = "";
				int apprActCnt = 0, apprNoActCnt =0, usrNoCnt =0, apprNoCnt=0, bNoCnt=0;
	            for(int i = 0; i< policyResult.size(); i++){

					String bgcolor="#F7F7F7";
					String[] tmpArr = (String [] )policyResult.get(i); 

					if(i%2==0)
						bgcolor="";

					if(!freq.equals(tmpArr[0])&&!header.equals(tmpArr[1])){

						freq=tmpArr[0];
						header=tmpArr[2];
						freqTxt = tmpArr[1];
						if(apprActCnt !=0 || apprNoActCnt !=0 || usrNoCnt !=0 || apprNoCnt !=0 || bNoCnt !=0){
%>
			<tr>
				<td height="20px" colspan = "100%" align="left" valign="middle" bgcolor="#9DCAE1" class="redBold"><%=freqTxt%></td>
			</tr>
			<tr bgcolor="#8CD0AE" height="25px">
				<td align="left" valign="middle"  class="rednormal"><%=header%></td>
				<td align="left" valign="middle"  class="style1"><%=apprActCnt%></td>
				<td align="left" valign="middle"  class="style1"><%=apprNoActCnt%></td>
				<td align="left" valign="middle"  class="rednormal"><%=usrNoCnt%></td>
				<td align="left" valign="middle"  class="rednormal"><%=apprNoCnt%></td>
				<td align="left" valign="middle"  class="rednormal"><%=bNoCnt%></td>
			</tr>


<%	
					apprActCnt = 0;	apprNoActCnt =0; usrNoCnt =0; apprNoCnt=0; bNoCnt=0;
				}


						if (tmpArr[5].equals("No Action"))
						  apprNoActCnt += Integer.parseInt(tmpArr[6]);
						else
							apprActCnt += Integer.parseInt(tmpArr[6]);
						
						if(tmpArr[3].equals("No") && !tmpArr[5].equals("No"))
							usrNoCnt +=  Integer.parseInt(tmpArr[4]);

						if(!tmpArr[3].equals("No") && tmpArr[5].equals("No"))
							apprNoCnt +=  Integer.parseInt(tmpArr[6]);

                        if(tmpArr[3].equals("No") && tmpArr[5].equals("No"))
							bNoCnt +=  Integer.parseInt(tmpArr[6]);

					}
					else{
						if (tmpArr[5].equals("No Action"))
						  apprNoActCnt += Integer.parseInt(tmpArr[6]);
						else
							apprActCnt += Integer.parseInt(tmpArr[6]);
						
						if(tmpArr[3].equals("No") && !tmpArr[5].equals("No"))
							usrNoCnt +=  Integer.parseInt(tmpArr[4]);

						if(!tmpArr[3].equals("No") && tmpArr[5].equals("No"))
							apprNoCnt +=  Integer.parseInt(tmpArr[6]);

                        if(tmpArr[3].equals("No") && tmpArr[5].equals("No"))
							bNoCnt +=  Integer.parseInt(tmpArr[6]);
					}


					//out.println("Header == "+tmpArr[18]);
					//out.println("SubHeader == "+tmpArr[19]);
				}//END OF FOR

%>
<%	
		 }// end of if 
		 else{
%>
		  <tr>
			<td colspan="100%" height="25px"><block type="spacer" height="25px"></td>
		  <tr>
			<td colspan="100%" height="1px" bgcolor="#000000"><block type="spacer" height="1px"></td>
		  </tr>
		  <tr>
			<td colspan="100%" align="center" height="40px" style="normal">No Policy Compliance to be filled.</td>
		  </tr>
		  <tr>
			<td colspan="100%" height="1px" bgcolor="#000000"><block type="spacer" height="1px"></td>
		  </tr>

<%	
			
		 }// end of else
%>
</table>
</form>
</body>
</html>
