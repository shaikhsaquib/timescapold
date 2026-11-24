<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.util.StringTokenizer" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.Utility , com.bccl.util.HtmlUtil"%>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>

<html>
	<head>
		<title>B2E</title>
        <link href="../style/compliance.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="../style/global.css">
		<script Language="JavaScript" src="../jscripts/dashBoard.js"></script>
		<script Language="JavaScript" src="../jscripts/common.js"></script>
	</head>
	
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<form name  = "frmSearchRequest" method = "post">
    
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="#98BF00"><img src="../images/header.jpg" width="519px" height="39" >
		</td>
    </tr>
   </table>
<%    
     ArrayList searchResult = new ArrayList();
	  
	 String frequency   = (String) request.getParameter("frequency");
     String fromDate    = (String) request.getParameter("frmDate");
	 String toDate      = (String) request.getParameter("toDate");
	// String roleId      = (String)session.getAttribute("roleId"); 
     //String status      = "A"; 
     
    
     
     if ( !frequency.equals("0")) {

	 	  frequency = frequency.substring(0, frequency.indexOf("|"));
	 }

  

    searchResult = policyController.viewUserSearch( timescapeUserOId, frequency, fromDate, toDate);
	

  %>

      <table  width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
		<td height="20px" colspan = "100%" valign="middle" bgcolor="#FFFFFF"><span style="width:90%;align:left" class="headCompliance"  ></span><span style="align:right" class= "style3"><a href="#" class="normal">Download All</a></span></td>
	</tr>         
		  <tr>
				<td bgcolor="#4498C6" colspan="100%" class="style1" height="20px" align="center">
					Operational Controls Search
				</td>
			</tr>
		<tr>
			<td height="5"colspan="100%"><block type="spacer" height="25"></td>
		</tr>

<%
	 if ( searchResult.size() > 0){
%>
	<tr>
		<td width="4%" height="26" align="left" valign="middle" bgcolor="#4498C6" class="style1">No.</td>
		<td width="36%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Control</td>
		<td width="6%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Risk  Category </td>
		<td width="8%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Sample Size</td>
		<td width="15%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member Feedback</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member <img src="../images/attachment_head.gif" title="attachment" border="0">&nbsp;/&nbsp;<img src="../images/remark_head.png" border="0"></td>
		<td width="12%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Feedback</td>
		<td width="5%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Attachment</td>
		<td width="15%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Remark</td>
	
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

		for(int i = 0; i< searchResult.size(); i++){

			String policyFeedbackId = "policyFeedbackId"+i;
			String policyId = "policyId"+i;
			String remark = "remark"+i;
			String feedBackOption = "feedBackOption"+i;
			String bgcolor="#F7F7F7";
			String bgName="";
			String apprFdbk="-";
			String apprRmrks="-";
			String style2="style3";

			String[] tmpArr = (String [] )searchResult.get(i); 

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
        <td width="10%" align="left" valign="middle" class="<%=style2%>">
<%   if(!tmpArr[9].equals("NA")){
		//out.println(tmpArr[5]);
%>
		 <a href="../common/download.jsp?f=<%=DPATH%>/<%=userEmailid%>/<%=tmpArr[9]%>"><img src="../images/attachment.gif" border="0" title="Team Member Attachment"></a>&nbsp;/&nbsp;
<%
	 }else{
%> 
  &nbsp;- &nbsp;&nbsp;/&nbsp;   
<%  }
%>
        <img src="../images/remark.png" border="0" title="Team Member Remark" id="requestInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[8]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,25,200);" onmouseout="xstooltip_hide('tooltip');">
		<div id="tooltip" class="xstooltip" width="100%"></div></td>

        <td width="12%" align="left" valign="middle" class="style3"><%=tmpArr[12]%></td>
		
		 <td width="5%" align="left" valign="middle" class="<%=style2%>">
<%   if(!tmpArr[14].equals("NA")){
		//out.println(tmpArr[5]);
%>
		 <a href="../common/download.jsp?f=<%=DPATH%>/<%=userEmailid%>/<%=tmpArr[14]%>"><img src="../images/attachment.gif" border="0" title="Team Member Attachment"></a>&nbsp;&nbsp;
    
<%
	     }else{
%> 
  &nbsp;- &nbsp;&nbsp;&nbsp;   
<%     } 
%>
     <td width="15%" align="center" valign="middle" class="style3"><img src="../images/remark.png" border="0" title="Team Member Remark" id="requestInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[13]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,30,250);" onmouseout="xstooltip_hide('tooltip');">
		<div id="tooltip" class="xstooltip" width="100%"></div></td>
<%
		}//policy result
%>
           <tr>
       <td colspan="3" class="normal" height="30px">&nbsp;
       </td>
    </tr>
    <tr bgcolor="#FFFFFF">
       <td colspan="100" align="center" class="normal">&nbsp;
          <input type="button" name="Return" value="Return" onclick="javascript:history.go(-1)">
       </td>
    </tr>
<%
       }
          else{
%>
				<tr>
					<td colspan="100%" height="25px"><block type="spacer" height="25px"></td>
				</tr>
				<tr>	
					<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
				</tr>
				<tr>
					<td colspan="100%" align="center" height="40px" style="normal">No Operational Controls to be ensured.</td>
				</tr>
				<tr>
					<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
				</tr>
				 <tr>
       <td colspan="3" class="normal" height="30px">&nbsp;
       </td>
    </tr>
    <tr bgcolor="#FFFFFF">
       <td colspan="3" align="center" class="normal">&nbsp;
            <input type="button" name="Back" value="Back" onclick="javascript:history.back()">
       </td>
    </tr>

<%	
				
					 }// end of else
%>
</table>
</table>
</body>
</html>