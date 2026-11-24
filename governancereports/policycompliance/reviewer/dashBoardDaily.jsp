<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 
<%
	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );
	String roleId = (String)session.getAttribute("roleId"); // rolecode of the user
	String date = (String)request.getParameter("date");
	if(date == null || date.equals("")){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
		if(date.length() == 1){
			date = "0" + date;
		}
		date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	
		//date ="30-MAR-2011";
	}
	//("date: "+ date);

	int frequency = 1; //frequency 1 stands for daily controls
	ArrayList policyResult = new ArrayList();

	//String roleId = (String)session.getAttribute("roleId"); // rolecode of the user

	policyResult = policyController.dashBoardPolicies(frequency,date);
	////("Size: "+ policyResult.size());
%>
<html>
<head>
<title>Daily Policy</title>
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />
<!-- <script Language="JavaScript" src="../jscripts/approveDaily.js"></script> -->
<script Language="JavaScript" src="../jscripts/common.js"></script>
<script Language="JavaScript" src="../jscripts/dashBoard.js"></script>
<link href="../style/calendarControl.css"rel="stylesheet">
<script src="../jscripts/calendarControl.js"language="javascript"></script>
</title>
</head>

<body onload="showCount(<%=policyResult.size()%>)">
<form name="frmCreateRequest" method = "post" action = "">
<%@ include file="../includes/headerMenu.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">

   <%
    
    if(roleId.equals("4")) {

  %>
   <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../requestor/daily.jsp" class="style2">MY COMPLIANCE</a> |<a href="../approver/approveDaily.jsp" class="style2"> ENSURE COMPLIANCE</a> | DASHBOARD |  </div>
		</td>
  </tr>

  <%
    } else{
%>
    <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../requestor/daily.jsp" class="style2">MY COMPLIANCE</a>| DASHBOARD |  </div>
		</td>
  </tr>

  <%
  }
  %>
  
	<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
  </tr>

<%
	//includes the control tabs for reviewer
	session.setAttribute("currLink","CONTROLS");
	session.setAttribute("leftLinkA","0");
%>
</table>
<table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td colspan="70%" class="style4" style="border-bottom:1px solid #EFEFEF">Select Date : &nbsp;&nbsp;
		<input type="text" class="style2" id="date" name="date" onfocus="showCalendarControl(this);" readOnly value="<%=date%>">&nbsp;&nbsp;<img src="../images/orangearrow.gif" border="0" onclick="changeDate()">
		<!-- <td colspan="30%" class="style4" align="right"><a href="#" class="style2">Download All</a>
		</td> -->
	</tr>
	
</table>
<%
	//includes the frequency tabs for reviewer
	session.setAttribute("currLink","DAILY");
	session.setAttribute("leftLink","0");
%>
<%@ include file="../includes/dashBoardFrequencyTabs.jsp" %>

<table width="100%" border="0" cellpadding="1" cellspacing="1">
<%
	if ( policyResult.size() > 0){
%>
 	<tr>
		<td width="3%" height="26" align="left" valign="middle" bgcolor="#4498C6" class="style1">No.</td>
		<td width="48%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Control</td>
		<td width="6%" align="left"  valign="middle" bgcolor="#4498C6" class="style1">Risk Category</td>
		<td width="12%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member Feedback</td>
		<td width="12%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supervisor Feedback</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Count</td>
		<td width="12%" align="left" valign="middle" bgcolor="#4498C6" class="style1">View/Download</td>
	</tr>
<%
		String controlVal="";
		String optArr[]={"No Action Required","Not Acted","Yes","No","Not Applicable"};
		String optValArr[]={"No Action Required","Not Acted","Yes","No","Not Applicable"};
		String selected="";

		int srNo = 0;
		for(int i = 0; i< policyResult.size(); i++){
			String bgcolor="#F7F7F7";
			
			String[] tmpArr = (String [] )policyResult.get(i); 
			////(bgcolor);
			////(tmpArr[4]);
			if (!controlVal.equals(tmpArr[4])){
				controlVal=tmpArr[4];
			if(srNo%2==0)
				bgcolor="";
			////("Assurerfdbk"+srNo);
%>
<input type="hidden" name="policyId<%=srNo%>" value="<%=tmpArr[3]%>">
	<tr bgcolor="<%=bgcolor%>">
		<td height="26" align="left" valign="middle" class="style3"><%=srNo+1%></td>
		<td align="left" valign="middle" class="style3"><%=controlVal%></td>
		<td align="center" valign="middle" class="style3"><%=tmpArr[5]%></td>
		<td align="left" valign="middle" class="style3">
			<select name="assurerfdbk<%=srNo%>" id="feedBackOption" class="normal" onchange="loadCount(<%=srNo%>)">
<%
			for(int kk=1;kk<optArr.length;kk++){
			if(kk==3)
				selected="selected";
			else
				selected="";
%>
			<option value="<%=optArr[kk]%>" <%=selected%>><%=optValArr[kk]%></option>
<%		
			}//end of for
%>
			</select>
		</td>
		<td align="left" valign="middle" class="style3">
			<select name="ensurerfdbk<%=srNo%>" id="feedBackOption" class="normal" onchange="loadCount(<%=srNo%>)">
<%
			for(int kk=0;kk<optArr.length;kk++){   
			if(kk==3)
				selected="selected";
			else
				selected="";
%>
			<option value="<%=optArr[kk]%>" <%=selected%>><%=optValArr[kk]%></option>
<%		
			}//end of for
%>
			</select>
		</td>
		<td align="center" id="count<%=srNo%>" valign="middle" class="style3"></td>
		<td align="left" valign="middle" class="style3"><a href="#" onclick="viewData(<%=srNo%>)" class="normal">View </a>/ <a href="#" onclick="downloadData(<%=srNo%>)"	class="normal">Download</a></td>
	</tr>
<%	
				srNo++;
			}//end of if for control Value		
		}//end of for
	}// end of main if size > 0
	else{
%>
	<tr>
		<td colspan="100%" height="25px"><block type="spacer" height="25px"></td>
	<tr>
		<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
	</tr>
	<tr>
		<td colspan="100%" align="center" height="40px" style="normal">No Operational Controls to be reviewed.</td>
	</tr>
	<tr>
		<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
	</tr>
<%	
	 }// end of else
%>
	<tr>
		<td colspan="100%"><div id="showingData" style="border:0px solid #ff0000;display:block;"></div></td>
	<tr>

</table>
</form>
</body>
</html>