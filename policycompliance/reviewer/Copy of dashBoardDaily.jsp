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
	String date = (String)request.getParameter("date");
	if(date == null || date.equals("")){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH)-1);
		if(date.length() == 1){
			date = "0" + date;
		}
		date += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
	
		//date ="30-MAR-2011";
	}

	int frequency = 1; //frequency 1 stands for daily controls
	ArrayList policyResult = new ArrayList();

	String roleId = (String)session.getAttribute("roleId"); // rolecode of the user

	policyResult = policyController.dashBoardPolicies(frequency,date);
	//out.println("Size: "+ policyResult.size());
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

<body>
<form name="frmCreateRequest" method = "post" action = "">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#98BF00"><img src="../images/header.jpg" width="826px" height="64" /></td>
  </tr>
   <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../requestor/daily.jsp" class="style2">MY COMPLIANCE</a> | REVIEW COMPLIANCE |  </div>
		</td>
  </tr>
  <tr>
	<td colspan="100%" height="1px" bgcolor="#666666"><block type="spacer" height="1px"></td>
  </tr>

<%
	//includes the control tabs for reviewer

	session.setAttribute("currLink","CONTROLS");
	session.setAttribute("leftLink","0");
%>
<%@ include file="../includes/dashBoardTabs.jsp" %>
</table>
<%
	//includes the frequency tabs for reviewer

	session.setAttribute("currLink","DAILY");
	session.setAttribute("leftLink","0");
%>
<%@ include file="../includes/dashBoardFrequencyTabs.jsp" %>
<table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td colspan="100%" class="style4" style="border-bottom:1px solid #EFEFEF">	Select Date : &nbsp;&nbsp;
		<input type="text" class="style2" id="date" name="date" onfocus="showCalendarControl(this);" readOnly value="<%=date%>">&nbsp;&nbsp;<img src="../images/orangearrow.gif" border="0" onclick="changeDate()">
		</td>
	</tr>
<%
	if ( policyResult.size() > 0){

%>
	<tr height="15px">
		<td width="40%" rowspan="2"align="left" valign="middle" bgcolor="#4498C6" class="style1">Control Header</td>
		<td width="10%" rowspan="2"align="left" valign="middle" bgcolor="#4498C6" class="style1">Acted</td>
		<td width="10%" rowspan="2"align="left" valign="middle" bgcolor="#4498C6" class="style1">Not Acted</td>
		<td width="30%" colspan="3" align="center" valign="middle" bgcolor="#4498C6" class="style1">Exceptions</td>
	</tr>
	<tr height="15px">
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">User</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Approver</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Both</td>
	</tr>
<%
int apprActCnt = 0, apprNoActCnt =0, usrNoCnt =0, apprNoCnt=0, bNoCnt=0;
	String header2="";
	for(int i = 0; i< policyResult.size(); i++){

		String[] tmpArr = (String [] )policyResult.get(i);
	

		if (tmpArr[8].equals("No Action")|| tmpArr[8].equals("-")){
			apprNoActCnt ++;
				//= Integer.parseInt(tmpArr[6]);
			//out.println("in if part apprNoActCnt == "+apprNoActCnt);
		}else{
			apprActCnt ++;
				//= Integer.parseInt(tmpArr[6]);
			//out.println("in if part apprActCnt == "+apprActCnt);
		}
		if(tmpArr[4].equals("No") && !tmpArr[8].equals("No")){
			usrNoCnt ++;
				//=  Integer.parseInt(tmpArr[4]);
			//out.println(usrNoCnt);
		}
		if(!tmpArr[4].equals("No") && tmpArr[8].equals("No")){
			apprNoCnt ++;
				//=  Integer.parseInt(tmpArr[6]);
			//out.println(apprNoCnt);
		}
		if(tmpArr[4].equals("No") && tmpArr[8].equals("No")){
			bNoCnt ++;
				//=  Integer.parseInt(tmpArr[6]);
			//out.println(bNoCnt);
		}
		if (!header2.equals(tmpArr[18])){
			header2=tmpArr[18];

%>
	<tr height="25px" bgcolor="#E0E78F" onclick="showTable()">
		<td align="left" valign="middle"  class="style4"><%=header2%></td>
		<td align="left" valign="middle"  class="style4"><%=apprActCnt%></td>
		<td align="left" valign="middle"  class="style4"><%=apprNoActCnt%></td>
		<td align="left" valign="middle"  class="rednormal"><%=usrNoCnt%></td>
		<td align="left" valign="middle"  class="rednormal"><%=apprNoCnt%></td>
		<td align="left" valign="middle"  class="rednormal"><%=bNoCnt%></td>
	</tr>
<%
			apprActCnt = 0;	apprNoActCnt =0; usrNoCnt =0; apprNoCnt=0; bNoCnt=0;
		}
	}//end of for
%>
</table>
<table width="100%" id="tableToShow" border="0" cellpadding="1" cellspacing="1" style="visibility:hidden;">
<input type="hidden" name="questSize" value="<%=policyResult.size()%>">

 	<tr>
		<td width="3%" height="26" align="left" valign="middle" bgcolor="#4498C6" class="style1">No.</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Risk  Category </td>
		<td width="40%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Policy</td>
		<td width="13%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Compliance Assured </td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Requestor<br>Attach&nbsp;/&nbsp;Remark</td>
		<td width="13%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Compliance Ensured </td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Approver<br>Attach&nbsp;/&nbsp;Remark</td>
	</tr>

<%
		String name="";
		String apprName="";
		int jj=0;
		String header="";
		String subHeader="";

		for(int i = 0; i< policyResult.size(); i++){
			String bgcolor="#F7F7F7";
			String bgName="";
			String style2="style3";

			String[] tmpArr = (String [] )policyResult.get(i); 

			if(i%2==0)
			bgcolor="";

			if(tmpArr[4].equals("No")){
				style2="rednormal";
			}

			if (!header.equals(tmpArr[18])){
				header=tmpArr[18];
%>
	<tr>
		<td height="20px" colspan = "100%" align="left" valign="middle" bgcolor="#E0E78F" class="headCompliance"><%=header%></td>
	</tr>        
<%	
			} //end of header check
			if (!subHeader.equals(tmpArr[19])){
				subHeader=tmpArr[19];
				name="";
%>
	<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="#F3F5D6" class="subHeadCompliance"><img src="../images/greenArrow.png" border="0" valign="absmiddle">&nbsp;<%=subHeader%></td>
	</tr>
<%	
			}//end of sub header check

			if (!name.equals(tmpArr[17])){
				name=tmpArr[17];
				apprName=tmpArr[20];
				jj=1;
				bgName="#e8e8e8";
%>
				  <tr>
						<td align="left" colspan = "100%"  valign="middle" bgcolor="<%=bgName%>" class="name"><%=name%>&nbsp;/&nbsp;<%=apprName%></td>
					 <!-- <td align="center" colspan = "4" >&nbsp;</td> -->
                   </tr>
<%	
			}//end of user /approver name check
			else{
				jj++;
			}
%>

	<tr bgcolor="<%=bgcolor%>">
		<td width="3%" height="30px" align="center" valign="middle" class="<%=style2%>"><%=jj%></td>
		<td width="10%"align="center" valign="middle" class="<%=style2%>"><%=tmpArr[3]%></td>
		<td width="40%"align="left" valign="middle" class="<%=style2%>"><%=tmpArr[2]%></td>
		<td width="13%" align="left" valign="middle" class="<%=style2%>"><%=tmpArr[4]%></td>
		<td width="10%"align="left" valign="middle" class="<%=style2%>">
			<img src="../images/attachment.gif" border="0" title="Attachment">&nbsp;/&nbsp;	
			<img src="../images/remark.png" border="0" title="User Remark" id="requestInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[6]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,25,150);" onmouseout="xstooltip_hide('tooltip');">
			<div id="tooltip" class="xstooltip" width="100%"></div>
		</td>
		<td width="13%"align="left" valign="middle" class="<%=style2%>"><%=tmpArr[8]%></td>
		<td width="10%"align="left" valign="middle" class="<%=style2%>">
			<img src="../images/attachment.gif" border="0" title="Attachment">&nbsp;/&nbsp;	
			<img src="../images/remark.png" border="0" title="Approver Remark" id="appInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[9]%>');xstooltip_show('tooltip', 'appInfo<%=i%>',-100,25,150);" onmouseout="xstooltip_hide('tooltip');">
			<div id="tooltip" class="xstooltip" width="100%"></div>
		</td>
	</tr>         
	<tr>
		<td colspan="100%" height="1px" bgcolor="#666666"><block type="spacer" height="1px"></td>
	</tr>

<%	
			   }//end of for
%>
<%	
	}// end of main if size > 0
	else{
%>
	<tr>
		<td colspan="100%" height="25px"><block type="spacer" height="25px"></td>
	<tr>
		<td colspan="100%" height="1px" bgcolor="#666666"><block type="spacer" height="1px"></td>
	</tr>
	<tr>
		<td colspan="100%" align="center" height="40px" style="normal">No Operational Controls to be reviewed.</td>
	</tr>
	<tr>
		<td colspan="100%" height="1px" bgcolor="#666666"><block type="spacer" height="1px"></td>
	</tr>
<%	
	 }// end of else
%>
</table>
</form>
</body>
</html>