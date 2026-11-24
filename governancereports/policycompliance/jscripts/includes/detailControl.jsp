<%@ page language="java" %>
    <%@ include file="../includes/sessionCheck.jsp" %>
    <%@ page errorPage="../common/errorPage.jsp"%>
    <%@ include file="../includes/empHeader.jsp" %>
    <%@ page import="java.util.Hashtable, java.util.ArrayList" %>
    <%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
    <%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
    <jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>

 <% 
        
        String policyId1 = request.getParameter("policyId");
        String frequency = "0";
        String riskCat = "0";
        String Function = "0";
        String fromDate = "23-JUN-2011" ;
        String toDate = "23-JUN-2011" ;


        ArrayList detailControl =  new ArrayList();
        
        detailControl = policyController.viewReviewerPolicies(frequency, riskCat, Function,fromDate, toDate);

 %>

 <html>
    <head>
    <title>OCA Report</title>

    <link href="../style/compliance.css" rel="stylesheet" type="text/css" />
 
     <script Language="JavaScript" src="../jscripts/report.js"></script>
     <script Language="JavaScript" src="../jscripts/common.js"></script>

    </title>
    </head>

    <body>
    <form name="frmMainControl" method = "post" action = "">

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td bgcolor="#98BF00"><img src="../images/header.jpg" width="519px" height="39" /></td>
      </tr>
       <tr>
            <td height="25" colspan="100%" align="center" valign="middle" class="style4"><div align="left"><a href="../requestor/daily.jsp" class="style2">MY COMPLIANCE</a>&nbsp;&nbsp;|&nbsp;&nbsp;DASHBOARD&nbsp;&nbsp;|  </div>
            </td>
      </tr>
      <tr>
        <td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
      </tr>

      <%
        //includes the control tabs for reviewer
        session.setAttribute("currLink","REPORT");
        session.setAttribute("leftLink","0");
    %>
        <%@ include file="../includes/dashBoardTabs.jsp" %>

         <tr>
        <td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
      </tr>

        <br>
    </table>

<%
         if ( detailControl.size() > 0){
  %>
    <table width="100%" border="0" cellspacing="0" cellpadding="">
	<tr>
		<td width="4%" height="26" align="left" valign="middle" bgcolor="#4498C6" class="style1">No.</td>
		<td width="36%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Control</td> 
		<td width="6%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Risk  Category </td>
		<td width="8%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Sample Size</td>
		<td width="15%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member Feedback</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member <img src="../images/attachment_head.gif" title="attachment" border="0">&nbsp;/&nbsp;<img src="../images/remark_head.png" border="0"></td>
		<td width="6%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supervisor Feedback</td>
		<td width="5%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supervisor Attachment</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supervisor Remark</td>
	
	</tr>

 <%
		String userEmailid = "";
        String userName="";
		String approverName="";
		int jj=0;
		String header = "";
		String subHeader = "";
		String createdDate="";
		String sampleColor="#C5CFA5";
    	String DPATH = EnvironmentProperties.getValue("policycompliance", "uploadPath");

		for(int i = 0; i< detailControl.size(); i++){

			String policyFeedbackId = "policyFeedbackId"+i;
			String policyId = "policyId"+i;
			String remark = "remark"+i;
			String feedBackOption = "feedBackOption"+i;
			String bgcolor="#F7F7F7";
			String bgName="";
			String apprFdbk="-";
			String apprRmrks="-";
			String style2="style3";

			String[] tmpArr = (String [] )detailControl.get(i); 

            if (policyId1.equals(tmpArr[3])) {  
                
			if(i%2==0)
				bgcolor="";

			if(tmpArr[7].equals("No") || tmpArr[4].equals("12")){
				style2="rednormal";
			}
                        
			if (!header.equals(tmpArr[1])){
				header=tmpArr[1];

%>
	<tr>
			<td height="20px" colspan = "50%" align="left" valign="middle" bgcolor="#E0E78F" class="headCompliance"><%=header%></td>
	</tr>         
<%	
			}//end of header check
             	if (!subHeader.equals(tmpArr[2])){
				subHeader=tmpArr[2];
				userName="";
                approverName="";
%>
	<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="#F3F5D6" class="subHeadCompliance"><img src="../images/greenArrow.png"border="0">&nbsp;<%=subHeader%></td>
	</tr>
<%	
			}//end of sub header check
             
			if (!userName.equals(tmpArr[11])){
				userName=tmpArr[11];
				approverName = tmpArr[16];
				jj=1;
				bgName="#e8e8e8";
				createdDate = "0"; 
       			userEmailid = tmpArr[24];
				 if (userEmailid.indexOf("@") > -1) {
                  userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
		  }   

%>

<input type="hidden" name="policyId<%=i%>" value="<%=tmpArr[0]%>">
<input type="hidden" name="disDate<%=i%>" value="<%//=disDate%>">
<!-- <input type="hidden" name="selectedOption" value="<%//=selectedOption%>">
<input type="hidden" name="selectedOptionVal" value="<%//=selectedOptionVal%>">
 -->
	<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="<%=bgName%>" class="name"><%=userName%>/<%=approverName%></td>
	</tr>
<%	
			}//end of user name check
			else{
				jj++;
			}
			 if (!createdDate.equals(tmpArr[18])){
				 createdDate = tmpArr[18];
%>
<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="<%="#F3F5D6"%>" class="name"><%=createdDate%></td>
</tr>
<%
			 }
%>
       <tr bgcolor="<%=bgcolor%>">
		<td width="4%" height="26" align="center" valign="middle" class="<%=style2%>"><%=jj%></td>
		<td width="36%" align="left" valign="middle" class="<%=style2%>"><%=tmpArr[4]%></td>
        <td width="6%" align="center" valign="middle" class="<%=style2%>"><%=tmpArr[5]%></td>
		<td width="8%" align="center" valign="middle" class="<%=style2%>"><%=tmpArr[6]%></td>
		<td width="15%" align="left" valign="middle" class="<%=style2%>"><%=tmpArr[7]%></td> 

        <td width="6%" align="left" valign="middle" class="<%=style2%>">
<%   if(!tmpArr[9].equals("NA")){
		//out.println(tmpArr[5]);
%>
		 <a href="../common/download.jsp?f=<%=DPATH%>/<%=userEmailid%>/<%=tmpArr[9]%>"><img src="../images/attachment.gif" border="0" title="Team Member Attachment"></a>&nbsp;/&nbsp;
<%
	 }else{
%> 
   &nbsp;&nbsp;- &nbsp;/&nbsp;&nbsp;   
<%  }
%>
        <img src="../images/remark.png" border="0" title="Team Member Remark" id="requestInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[8]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,25,200);" onmouseout="xstooltip_hide('tooltip');">
		<div id="tooltip" class="xstooltip" width="100%"></div></td>

        <td width="6%" align="left" valign="middle" class="style3"><%=tmpArr[12]%></td>
		
		 <td width="5%" align="left" valign="middle" class="<%=style2%>">
<%   if(!tmpArr[14].equals("NA")){
		//out.println(tmpArr[5]);
%>
		 <a href="../common/download.jsp?f=<%=DPATH%>/<%=userEmailid%>/<%=tmpArr[14]%>"><img src="../images/attachment.gif" border="0" title="Team Member Attachment"></a>&nbsp;&nbsp;
    
<%
	     }else{
%> 
    &nbsp;&nbsp;&nbsp;&nbsp;- &nbsp;&nbsp;&nbsp;   
<%     } 
%>
     <td width="10%" align="center" valign="middle" class="style3"><img src="../images/remark.png" border="0" title="Team Member Remark" id="requestInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[13]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,30,250);" onmouseout="xstooltip_hide('tooltip');">
		<div id="tooltip" class="xstooltip" width="100%"></div></td>

<%     }
         }
        }
  %>

<td colspan="3" class="normal" height="30px">&nbsp;</td>
    </tr>
<tr>
  <td colspan="100%" class="normal" height="30px">&nbsp;</td>
 </tr>
  
  <tr >
       <td colspan="100%" align="center" class="normal">&nbsp;
            <input type="button" name="Back" value="Back" onclick="javascript:history.back()">
       </td>
   </tr>

</table>
</table>
</table>
</body>
</html>