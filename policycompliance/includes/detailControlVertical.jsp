<%@ page language="java" %>
    <%@ include file="../includes/sessionCheck.jsp" %>
    <%//@ page errorPage="../common/errorPage.jsp"%>
    <%@ include file="../includes/empHeader.jsp" %>
    <%@ page import="java.util.Hashtable, java.util.ArrayList" %>
    <%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
    <%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
    <%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
    <jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 

 <% 
        
        String policyId = request.getParameter("policyId");
        String subFunction = request.getParameter("process");
		String function = request.getParameter("function");
		String policySubHead = request.getParameter("subProcess");
        String compCode = request.getParameter("compCode");
        String frequency1 = request.getParameter("frequency");
        int frequency = Integer.parseInt(frequency1);
        String createdDate = request.getParameter("createdDate");

        

        ArrayList detailControl =  new ArrayList();
        
        detailControl = policyController.NewDetailsControlVertical(compCode, frequency, createdDate, function,subFunction, policySubHead, policyId);       

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
  

      <%
        //includes the control tabs for reviewer
        session.setAttribute("currLink","CONTROLS");
        session.setAttribute("leftLink","0");
    %>
        <%//@ include file="../includes/dashBoardTabs.jsp" %>

    </table>

<%
         if ( detailControl.size() > 0){
  %>
    <table width="100%" border="0" cellspacing="0" cellpadding="">
	<tr>
		<!-- <td width="4%" height="26" align="left" valign="middle" bgcolor="#4498C6" class="style1">No.</td> -->
		<td width="36%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Control</td> 
	    <td width="6%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Risk  Category </td>
		<td width="8%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Sample Size</td>
		<td width="15%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member Feedback</td>
		<!-- <td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Team Member <img src="../images/attachment_head.gif" title="attachment" border="0">&nbsp;/&nbsp;<img src="../images/remark_head.png" border="0"></td> -->
		<td width="6%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supervisor Feedback</td>
		<!-- <td width="5%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supervisor Attachment</td>
		<td width="10%" align="left" valign="middle" bgcolor="#4498C6" class="style1">Supervisor Remark</td> -->
	
	</tr>

 <%
		String userEmailid = "";
        String userName="";
		String approverName="";
		int jj=0;
		String header = "";
		String subHeader = "";
		String process = "";
		String bgName = "";
        String style2="style3";
        String bgcolor="#F7F7F7";
		//String createdDate="";
		String sampleColor="#C5CFA5";
    	String DPATH = EnvironmentProperties.getValue("policycompliance", "uploadPath");

		for(int i = 0; i< detailControl.size(); i++){

			String[] tmpArr = (String [] )detailControl.get(i); 

				if (policyId.equals(tmpArr[8]) && subFunction.equals(tmpArr[1]) && function.equals(tmpArr[0])) {  
                
			if(i%2==0)
				bgcolor="";

                        
			if (!header.equals(tmpArr[3])){
				header=tmpArr[3];
                //out.println(header);


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
             
			if (!userName.equals(tmpArr[10])){
				userName=tmpArr[10];
				approverName = tmpArr[12];
				jj=1;
				bgName="#e8e8e8";
				createdDate = "0"; 
       			userEmailid = tmpArr[9];
				 if (userEmailid.indexOf("@") > -1) {
                  userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
		  }   

%>

<input type="hidden" name="policyId<%=i%>" value="<%=tmpArr[0]%>">
<input type="hidden" name="disDate<%=i%>" value="<%//=disDate%>">

 -->
	<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="<%=bgName%>" class="name"><%=userName%>/<%=approverName%></td>
	</tr>
<%	
			}//end of user name check
			else{
				jj++;
			}
			 if (!createdDate.equals(tmpArr[13])){
				 createdDate = tmpArr[13];
%>
<tr>
		<td align="left" colspan = "100%"  valign="middle" bgcolor="<%="#F3F5D6"%>" class="name"><%=createdDate%></td>
</tr>
<%
			 }
%>
       <tr bgcolor="<%=bgcolor%>">
		<!-- <td width="4%" height="26" align="center" valign="middle" class="<%//=style2%>"><%=jj%></td> -->
		<td width="50%" align="left" valign="middle" class="style3""><%=tmpArr[6]%></td>
		<td width="5%" align="left" valign="middle" class="style3""><%=tmpArr[14]%></td>
		<td width="5%" align="left" valign="middle" class="style3""><%=tmpArr[15]%></td>
        <td width="10%" align="left" valign="middle" class="style3""><%=tmpArr[4]%></td>
		<td width="10%" align="left" valign="middle" class="style3""><%=tmpArr[5]%></td>
		<!-- <td width="15%" align="left" valign="middle" class="<%//=style2%>"><%//=tmpArr[7]%></td> --> 
     </tr>
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
 