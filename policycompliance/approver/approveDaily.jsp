<%@ page language="java" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%> 
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 

<%
	String currDate = "";
	String flag = "";
      
	int frequency = 1; //frequency 1 stands for daily controls
	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );
    String fromDate ="";
	String toDate ="";
  
	String date = (String)request.getParameter("date");

	
	 fromDate = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH)-1);
	 toDate = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
	
	if(fromDate.length() == 1){
			fromDate = "0" + fromDate;
	}
	fromDate += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);

	if(toDate.length() == 1){
			toDate = "0" + toDate;
	}
	toDate += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);

	currDate = toDate;
		 
	// flag, date and currDate used in requestor jsp so that it can be used to disable submit and  reset button for when past feedback data is searched. Variables used in feedbackOptions.jsp

	ArrayList policyResult = new ArrayList();   
	String status = "'L','A'";	// which controls should get in query

	String roleId = (String)session.getAttribute("roleId"); // rolecode of the user

	if(date == null || date.equals("")){
	     date = toDate;
		policyResult = policyController.viewUserPolicies(timescapeUserOId, frequency, roleId, status,toDate,toDate);

	}else{

		policyResult = policyController.viewUserPolicies(timescapeUserOId, frequency, roleId, status,date,date);
	}


	//Set session attribute for the link of current page
	//session.setAttribute("currLink", "../approver/approveDaily.jsp");
	//session.setAttribute("topLink", "2");

%>

<table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td colspan="3" class="style4" style="border-bottom:1px solid #EFEFEF">	Select Date : &nbsp;&nbsp;
		<input type="text" class="style2" id="date" name="date" onfocus="showCalendarControl(this);" readOnly value="<%=date%>">&nbsp;&nbsp;<img src="../images/orangearrow.gif" border="0" onclick="changeDateApp(<%=frequency%>)">
		</td>
		</td>
  </tr>
<input type="hidden" name="questSize" value="<%=policyResult.size()%>">
<input type="hidden" name="pageName" value="daily">
  <%
 // out.println( policyResult.size());
	 if ( policyResult.size() > 0){
  %>
	<tr>
		<td width="3%" height="26" align="left" valign="middle" bgcolor="#4498C6" class="style1">No.</td>
		<td width="20%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Control</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">RCM Reference number</td>
		<td width="5%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Risk  Category </td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Risk  Statement </td>
		<td width="8%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Sample Size</td>
		<td width="5%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member Feedback</td>
		<td width="12%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member <img src="../images/attachment_head.gif" title="attachment" border="0">&nbsp;/&nbsp;<img src="../images/remark_head.png" border="0"></td>
		<td width="6%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Feedback</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Remark</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Attachment</td>
	</tr>

 <%
		String userEmailid = "";
        String name="";
		int jj=0;
		String header="";
		String disDate="";
		String subHeader="";
		String sampleColor="#C5CFA5";
		String DPATH = EnvironmentProperties.getValue("policycompliance", "uploadPath");
		//out.println("DPATH--"+DPATH);
		

		for(int i = 0; i< policyResult.size(); i++){

			String policyFeedbackId = "policyFeedbackId"+i;
			String policyId = "policyId"+i;
			String remark = "remark"+i;
			String feedBackOption = "feedBackOption"+i;
			String bgcolor="#F7F7F7";
			String bgName="";
			String apprFdbk="-";
			String apprRmrks="-";
			String style2="style3";

			String[] tmpArr = (String [] )policyResult.get(i); 

            String rmks = tmpArr[6];
            rmks = rmks.replaceAll("&","and");

			if(i%2==0)
				bgcolor="";

			

			if(tmpArr[4].equals("No")){
				style2="rednormal";
			}

			//out.println(tmpArr[11]);
			if (!disDate.equals(tmpArr[11])){
				disDate=tmpArr[11];
//out.println(tmpArr[0]);
%>
	<tr>
		<td height="20px" colspan = "100%" align="left" valign="middle" bgcolor="#FFFFFF" class="headCompliance"><%=disDate%></td>
	</tr>         
<%	
			}//end of date check

			if (!header.equals(tmpArr[18])){
				header=tmpArr[18];

%>
	<tr>
		<td height="20px" colspan = "100%" align="left" valign="middle" bgcolor="#E0E78F" class="headCompliance"><%=header%></td>
	</tr>         
<%	
			}//end of header check

			if (!subHeader.equals(tmpArr[19])){
				subHeader=tmpArr[19];
				name="";
%>
	<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="#F3F5D6" class="subHeadCompliance"><img src="../images/greenArrow.png"border="0">&nbsp;<%=subHeader%></td>
	</tr>
<%	
			}//end of sub header check

			if (!name.equals(tmpArr[17])){
				name=tmpArr[17];
				jj=1;
				bgName="#e8e8e8";
				 
				userEmailid = tmpArr[22];
				 if (userEmailid.indexOf("@") > -1) {
                  userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
  	      }   


%>
	<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="<%=bgName%>" class="name"><%=name%></td>
	</tr>
<%	
			}//end of user name check
			else{
				jj++;

			}
%>
	<input type="hidden" name="<%=policyId%>" value="<%=tmpArr[1]%>">
	<input type="hidden" name="<%=policyFeedbackId%>" value="<%=tmpArr[0]%>">
	<input type="hidden" name="userOId<%=i%>" value="<%=tmpArr[10]%>">
	<input type="hidden" name="userFdbk<%=i%>" value="<%=tmpArr[4]%>">
	<input type="hidden" name="userRmrks<%=i%>" value="<%=tmpArr[6]%>">
	<!-- <input type="text" name="isAttach<%=i%>" value="<%///=tmpArr[24]%>"> -->
		<!-- <input type="hidden" name="apprFdbk<%=i%>" value="<%//=apprFdbk%>"> -->
	<input type="hidden" name="userAttachmentName<%=i%>" value="<%=tmpArr[5]%>">
	
<%  if(tmpArr[21].equals("NA")){ 
%>
<!-- here attahmentName is the approver's attached file name -->
	<input type="hidden" name="attachmentName<%=i%>" value="">
<%  }else{
%>
    <input type="hidden" name="attachmentName<%=i%>" value="<%=tmpArr[21]%>"> 
<% 
    }
%>
	<tr bgcolor="<%=bgcolor%>">
		<td width="4%" height="26" align="center" valign="middle" class="<%=style2%>"><%=jj%></td>
		<td width="7%" align="left" valign="middle" class="<%=style2%>"><%=tmpArr[2]%></td>
		<td width="7%" align="left" valign="middle" class="<%=style2%>"><%=tmpArr[25]%></td>
		<td width="5%" align="center" valign="middle" class="<%=style2%>"><%=tmpArr[3]%></td>
		<td width="5%" align="center" valign="middle" class="<%=style2%>"><%=tmpArr[24]%></td>
		<td width="5%" align="center" valign="middle" class="<%=style2%>"><%=tmpArr[23]%></td>
		<td width="10%" align="left" valign="middle" class="<%=style2%>"><%=tmpArr[4]%></td>
    	<td width="7%" align="left" valign="middle" class="<%=style2%>">
<%   if(!tmpArr[5].equals("NA")){
		//out.println(tmpArr[5]);
%>
		<a href="../common/download.jsp?f=<%=DPATH%>/<%=userEmailid%>/<%=tmpArr[5]%>"><img src="../images/attachment.gif" border="0" title="Team Member Attachment"></a>&nbsp;/&nbsp;
<%   }else{
%>
       &nbsp;- &nbsp;&nbsp;/&nbsp;   
<%
	 }
%>
		<img src="../images/remark.png" border="0" title="Team Member Remark" id="requestInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=rmks%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,25,200);" onmouseout="xstooltip_hide('tooltip');">
		<div id="tooltip" class="xstooltip" width="100%"></div>
		</td>
<%
	//out.println("---"+fromDate);
	//out.println("toDate---"+toDate);
	//out.println("date---"+date);
	if (date.equals(fromDate)|| date.equals(toDate)){
%>
		<td width="10%" align="left" valign="middle" class="<%=style2%>">
		<%@ include file="../includes/feedbackOptions.jsp"%>
		</td>
		<input type="hidden" name="newFeedback2<%=i%>" value="<%=tmpArr[8]%>">
		<td width="15%" align="center" valign="middle">
		<%@ include file="../includes/remark.jsp" %></td>
<%
	}else{
%>
		<td width="10%" align="left" valign="middle" class="style3"><%=tmpArr[8]%></td>
		<td width="15%" align="center" valign="middle" class="style3"><%=tmpArr[9]%></td>

<%
	}
%>
		<td width="5%" align="center" valign="middle" class="<%=style2%>">
		<a href="javascript:void window.open('../upload/uploadFile.jsp?attachNo=<%=i%>','','resizable=yes,scrollbars=no,toolbars=no,status=yes,width=350,height=150,top=0,left=0')" ><img src="../images/attachment.gif" border="0"></a>
		</td>
		</tr>         
	<tr>
		<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
	</tr>

<%	
		}//end of for
%>
	<tr>
		<td colspan="100%" height="10px"><block type="spacer" height="10px"></td>
	</tr>
<%
	if (date.equals(fromDate)|| date.equals(toDate)){
%>
	<tr>
		<td height="15" colspan="100%" align="center" valign="middle" class="style4">
			<div align="center">
			<input type="button" name="Submit" value="Submit"  onclick="validate1(<%=policyResult.size()%>,<%=roleId%>)"/>  
			<input type="reset" name="reset" value="Reset"/>
			</div>
		</td>
	</tr>
<%	
	}//date check to show submit button
}// end of main if  size > 0
	else{
%>
	<tr>
		<td colspan="100%" height="25px"><block type="spacer" height="25px"></td>
	<tr>
		<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
	</tr>
	<tr>
		<td colspan="100%" align="center" height="40px" style="normal">No Operational Controls to be ensured.</td>
	</tr>
	<tr>
		<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
	</tr>

<%	
			
		 }// end of else
%>
</table>