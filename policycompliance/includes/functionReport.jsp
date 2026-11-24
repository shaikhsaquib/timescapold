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
       String compCode       = request.getParameter("compCode");
        String createdDate        = request.getParameter("createdDate");
		//String department = (String)request.getParameter("dept");
       //String fromDate        = request.getParameter("fromDate");
       //String toDate        = request.getParameter("toDate");
       String function         = request.getParameter("Function");
       String dept = "all";
    // out.println("<br>"+createdDate); 
       String criteria           = request.getParameter("criteria");
       String orderBy          = "txnReport";

       int frequency            = Integer.parseInt(request.getParameter("frequency"));

       ArrayList reportResult = new ArrayList();
       ArrayList criteriaSel    = new ArrayList();
       ArrayList criteriaAppSel    = new ArrayList();
       // out.println(criteria);
        if (criteria .equals("1")) {
	       
           criteriaSel.add("Yes");
	       criteriaSel.add("No");
	       criteriaSel.add("Not Applicable");
        
        }else  if (criteria .equals("2")) {
	       
           criteriaAppSel.add("Yes");
	       criteriaAppSel.add("No");
	       criteriaAppSel.add("Not Applicable");
           criteriaAppSel.add("No Action Required");
        }else  if (criteria .equals("3")) {
        criteriaSel.add("Not Acted");
        }
        else  if (criteria .equals("4")) {
        criteriaSel.add("No");
        }
        else  if (criteria .equals("5")) {
        criteriaSel.add("Yes");
        }
        else  if (criteria .equals("6")) {
        criteriaSel.add("Not Applicable");

        }else  if (criteria .equals("7")) {
        criteriaAppSel.add("Not Acted");
        }
        else  if (criteria .equals("8")) {
        criteriaAppSel.add("No");
        }
        else  if (criteria .equals("9")) {
        criteriaAppSel.add("Yes");
        }
        else  if (criteria .equals("10")) {
        criteriaAppSel.add("Not Applicable");
        }

       reportResult = policyController.dashBoardReport(compCode, frequency, createdDate,  orderBy,dept);
        
%>

<html>
<head>
<title>OCA Report</title>
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />
<!-- <script Language="JavaScript" src="../jscripts/approveDaily.js"></script> -->
<script Language="JavaScript" src="../jscripts/common.js"></script>
<script Language="JavaScript" src="../jscripts/report.js"></script>
</title>
</head>

<body>
<form name="frmReport" method = "post" action = "">
<%//@ include file="../includes/policyComplianceMenu.jsp" %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td bgcolor="#98BF00"><img src="../images/header.jpg" width="519px" height="39" /></td>
  </tr>

    <tr>
		<td height="20px" colspan = "100%" valign="middle" bgcolor="#FFFFFF"><span style="width:90%;align:left" class="headCompliance"  ></span><span style="align:right" class= "style3"><a href="#" onclick="downloadFunctionReport(<%=compCode%>, '<%=frequency%>','<%=createdDate%>','<%=function%>','<%=criteria%>')"	class="normal">Download All</a></span></td>
 </tr>


 </table>

  <table width="100%" border="0" cellpadding="1" cellspacing="1">


 <%
     
	 if(reportResult.size()>0){
%>	
	<tr>
		<td width="3%" height="26" align="left" valign="middle" bgcolor="#4498C6" class="style1">No.</td>
		<td width="36%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Control</td>
		<td width="6%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Risk  Category </td>
		<td width="8%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Sample Size</td>
		<td width="15%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member Feedback</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member <img src="../images/attachment_head.gif" title="attachment" border="0">&nbsp;/&nbsp;<img src="../images/remark_head.png" border="0"></td>
		<td width="12%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supervisor Feedback</td>
		<td width="15%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supervisor Remark</td>
		<td width="5%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supervisor Attachment</td>
	</tr>
<%

	    int jj=0;
		String header = "";
		String subHeader = "";
		String userEmailid = "";
        String userName="";
		String approverName="";
		String disDate="";
		String sampleColor="#C5CFA5";
		String DPATH = EnvironmentProperties.getValue("policycompliance", "uploadPath");
//out.println(DPATH);
		for(int i = 0; i< reportResult.size(); i++){

	    String tmpArr [] = (String [])reportResult.get(i);
	    String apprFdbk="-";
		String apprRmrks="-";
		String style2 = "";
		String bgcolor="#F7F7F7";
		String bgName = "";
    	
 /*
out.println("<br>"+tmpArr[5]);
out.println("<br>"+criteriaSel);
out.println(tmpArr[11]);
*/
		if (function.equals(tmpArr[5].trim())) { 
            if (criteriaSel.contains(tmpArr[11].trim())){
	
			 if (i%2==0)
				bgcolor="";
/*
			if(tmpArr[4].equals("No") || tmpArr[4].equals("No")){
				style2="rednormal";
			}
   */         
			
			
			if (!disDate.equals(tmpArr[27])){
				disDate=tmpArr[27];
			//	toDate = disDate;
  //              header = "";
		//		subHeader = "";

%>
	 
<%	
			}//end of date check
            
			if (!header.equals(tmpArr[03])){
				header=tmpArr[03];
			
%>
	<tr>
		<td height="20px" colspan = "100%" align="left" valign="middle" bgcolor="#E0E78F" class="headCompliance"><%=header%></td>
	</tr>         
<%	
			}//end of header check
             	if (!subHeader.equals(tmpArr[4])){
				subHeader=tmpArr[4];
				userName="";
                approverName="";
%>
	<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="#F3F5D6" class="subHeadCompliance"><img src="../images/greenArrow.png"border="0">&nbsp;<%=subHeader%></td>
	</tr>
<%	
			}//end of sub header check
             
			if (!userName.equals(tmpArr[17])){
				userName=tmpArr[17];
				approverName = tmpArr[23];
			//	jj=1;
				bgName="#e8e8e8";
				 
		userEmailid = tmpArr[18];
				 if (userEmailid.indexOf("@") > -1) {
                  userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
		  }   



%>

<!-- policy id or policyfeebackid --><input type="hidden" name="policyId<%=i%>" value="<%=tmpArr[1]%>">
<input type="hidden" name="disDate<%=i%>" value="<%=disDate%>">

	<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="<%=bgName%>" class="name"><%=userName%>/<%=approverName%></td>
	</tr>
<%	
			}//end of user name check
		
%>

	<tr bgcolor="<%=bgcolor%>">
		<td width="3%" height="26" align="center" valign="middle" class="style3"><%=++jj%></td>
		<td width="36%" align="left" valign="middle" class="style3"><%=tmpArr[8]%></td>
		<td width="5%" align="center" valign="middle" class="style3"><%=tmpArr[9]%></td>
		<td width="5%" align="center" valign="middle" class="style3"><%=tmpArr[10]%></td>
		<td width="10%" align="left" valign="middle" class="style3"><%=tmpArr[11]%></td>
        <td width="7%" align="left" valign="middle" class="style3">
<%   if(!tmpArr[13].equals("NA")){
		//out.println(tmpArr[5]);

%>

		 <a href="../common/download.jsp?f=<%=DPATH%>/<%=userEmailid%>/<%=tmpArr[13]%>"><img src="../images/attachment.gif" border="0" title="Team Member Attachment"></a>&nbsp;/&nbsp;
<%
	 }else{
%> 
  &nbsp;- &nbsp;&nbsp;/&nbsp;   
<%  }
%>
        <img src="../images/remark.png" border="0" title="Team Member Remark" id="requestInfo<%=i%>" class="style3" onmouseover="show('<%=tmpArr[12]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,25,200);" onmouseout="xstooltip_hide('tooltip');">
		<div id="tooltip" class="xstooltip" width="100%"></div></td>

        <td width="10%" align="left" valign="middle" class="style3"><%=tmpArr[19]%></td>
		<!-- <td width="15%" align="center" valign="middle" class="style3"><%=tmpArr[9]%></td> -->
		<td width="10%" align="left" valign="middle" class="style3"><img src="../images/remark.png" border="0" title="Team Member Remark" id="requestInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[21]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,25,200);" onmouseout="xstooltip_hide('tooltip');">
		<div id="tooltip" class="xstooltip" width="100%"></div></td>
		 <td width="7%" align="left" valign="middle" class="style3">
<%   if(!tmpArr[20].equals("NA")){
		//out.println(tmpArr[5]);
%>
		 <a href="../common/download.jsp?f=<%=DPATH%>/<%=userEmailid%>/<%=tmpArr[5]%>"><img src="../images/attachment.gif" border="0" title="Team Member Attachment"></a>&nbsp;&nbsp;
       </td>
	 </tr>
       
<%
	     }else{
%> 
  &nbsp;- &nbsp;&nbsp;/&nbsp;   
<%     } 
%>
         
<%
			}
           else if (criteriaAppSel.contains(tmpArr[19].trim())){
	
			 if (i%2==0)
				bgcolor="";
/*
			if(tmpArr[4].equals("No") || tmpArr[4].equals("No")){
				style2="rednormal";
			}
   */         
			
			
			if (!disDate.equals(tmpArr[27])){
				disDate=tmpArr[27];
			//	toDate = disDate;
  //              header = "";
		//		subHeader = "";

%>
	 
<%	
			}//end of date check
            
			if (!header.equals(tmpArr[03])){
				header=tmpArr[03];
			
%>
	<tr>
		<td height="20px" colspan = "100%" align="left" valign="middle" bgcolor="#E0E78F" class="headCompliance"><%=header%></td>
	</tr>         
<%	
			}//end of header check
             	if (!subHeader.equals(tmpArr[4])){
				subHeader=tmpArr[4];
				userName="";
                approverName="";
%>
	<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="#F3F5D6" class="subHeadCompliance"><img src="../images/greenArrow.png"border="0">&nbsp;<%=subHeader%></td>
	</tr>
<%	
			}//end of sub header check
             
			if (!userName.equals(tmpArr[17])){
				userName=tmpArr[17];
				approverName = tmpArr[23];
			//	jj=1;
				bgName="#e8e8e8";
				 
		userEmailid = tmpArr[18];
				 if (userEmailid.indexOf("@") > -1) {
                  userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
		  }   



%>

<!-- policy id or policyfeebackid --><input type="hidden" name="policyId<%=i%>" value="<%=tmpArr[1]%>">
<input type="hidden" name="disDate<%=i%>" value="<%=disDate%>">

	<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="<%=bgName%>" class="name"><%=userName%>/<%=approverName%></td>
	</tr>
<%	
			}//end of user name check
		
%>

	<tr bgcolor="<%=bgcolor%>">
		<td width="3%" height="26" align="center" valign="middle" class="style3"><%=++jj%></td>
		<td width="36%" align="left" valign="middle" class="style3"><%=tmpArr[8]%></td>
		<td width="5%" align="center" valign="middle" class="style3"><%=tmpArr[9]%></td>
		<td width="5%" align="center" valign="middle" class="style3"><%=tmpArr[10]%></td>
		<td width="10%" align="left" valign="middle" class="style3"><%=tmpArr[11]%></td>
        <td width="7%" align="left" valign="middle" class="style3">
<%   if(!tmpArr[13].equals("NA")){
		//out.println(tmpArr[5]);

%>

		 <a href="../common/download.jsp?f=<%=DPATH%>/<%=userEmailid%>/<%=tmpArr[13]%>"><img src="../images/attachment.gif" border="0" title="Team Member Attachment"></a>&nbsp;/&nbsp;
<%
	 }else{
%> 
  &nbsp;- &nbsp;&nbsp;/&nbsp;   
<%  }
%>
        <img src="../images/remark.png" border="0" title="Team Member Remark" id="requestInfo<%=i%>" class="style3" onmouseover="show('<%=tmpArr[12]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,25,200);" onmouseout="xstooltip_hide('tooltip');">
		<div id="tooltip" class="xstooltip" width="100%"></div></td>

        <td width="10%" align="left" valign="middle" class="style3"><%=tmpArr[19]%></td>
		<!-- <td width="15%" align="center" valign="middle" class="style3"><%=tmpArr[9]%></td> -->
		<td width="10%" align="left" valign="middle" class="style3"><img src="../images/remark.png" border="0" title="Team Member Remark" id="requestInfo<%=i%>" class="<%=style2%>" onmouseover="show('<%=tmpArr[21]%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',10,25,200);" onmouseout="xstooltip_hide('tooltip');">
		<div id="tooltip" class="xstooltip" width="100%"></div></td>
		 <td width="7%" align="left" valign="middle" class="style3">
<%   if(!tmpArr[20].equals("NA")){
		//out.println(tmpArr[5]);
%>
		 <a href="../common/download.jsp?f=<%=DPATH%>/<%=userEmailid%>/<%=tmpArr[5]%>"><img src="../images/attachment.gif" border="0" title="Team Member Attachment"></a>&nbsp;&nbsp;
       </td>
	 </tr>
       
<%
	     }else{
%> 
  &nbsp;- &nbsp;&nbsp;/&nbsp;   
<%     } 
%>
         
<%
			}// end of if
            }
		}//end of policy result for loop
	 } //end of main if
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

<tr>
	<td colspan="100%" height="3px" ><block type="spacer" height="1px"></td>
  </tr>


</table>
</table>
</body>
</html>