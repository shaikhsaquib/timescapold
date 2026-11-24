<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" />
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/daily.js"></script>
<script Language="JavaScript" src="../jscripts/common.js"></script>


<table width="100%" border="0" cellpadding="1" cellspacing="1">

<%
	 String header = (String)request.getParameter("header");
	 String subHeader = (String)request.getParameter("subHeader");
	 int frequency = Integer.parseInt((String)request.getParameter("frequency"));
	 String date = (String)request.getParameter("date");
	 String roleId = (String)session.getAttribute("roleId");
	 String userEmailid = emailId;
	 if (userEmailid.indexOf("@") > -1) {
                  userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
  	 } 
     
	 String currDate= "";
	 String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );
	
		//System.out.println("requestdate"+ date);
	
		currDate = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));
		if(currDate.length() == 1){
			currDate = "0" + currDate;
		}
		currDate += "-" +monthArr[thisDay.get(Calendar.MONTH)]+ "-" + thisDay.get(Calendar.YEAR);
    
		if(date == null || date.equals("")){
			date=currDate;
			//flag="1";
			//date ="30-MAR-2011";
		}

	 ArrayList controlResult = new ArrayList();
	 String search = "control"; 
     
     controlResult = policyController.viewPolicies(search, header, subHeader, timescapeUserOId, frequency, roleId, date);
%>

<script Language="JavaScript" >

//setValue(<%=controlResult.size()%>)
//setValue()
</script>

<%	 if( controlResult.size()>0 ){
         
		 String DPATH = EnvironmentProperties.getValue("policycompliance", "uploadPath");
 
       for(int i = 0; i< controlResult.size(); i++){

		String policyFeedbackId = "policyFeedbackId"+i;
		String policyTxnId = "policyTxnId"+i;
		String remark = "remark"+i;
		String feedBackOption = "feedBackOption"+i;
		String bgcolor="#F7F7F7";
		String apprFdbk="-";
		String apprRmrks="";
		String attachment="";
		String apprAttach="-";

		String[] tmpArr = (String [] )controlResult.get(i); 

		if(i%2==0)
			bgcolor="";

        if(tmpArr[8]!=null && !tmpArr[8].equals(" ")&&!tmpArr[8].equals("Not Acted")&& tmpArr[16].equals("A")){
			apprFdbk=tmpArr[8];
		}else if((tmpArr[8].equals("-")|| tmpArr[8].equals("Not Acted"))&& tmpArr[16].equals("A")){
			apprFdbk = "Not Acted";
		}


		if(tmpArr[9]!=null && !tmpArr[9].equals(" "))
			apprRmrks=tmpArr[9];

		if(tmpArr[21]!=null && !tmpArr[21].equals("NA"))
			apprAttach = "<img src=\"../images/attachment.gif\" border=\"0\" title=\"Supervisor Attachment\">";


		if("A".equals(tmpArr[16])){   
			attachment = tmpArr[17].equals("NA")?"-":"<a href=\"../common/download.jsp?f="+DPATH+"/"+userEmailid+"/"+tmpArr[17]+"\"><img src=\"../images/attachment.gif\" border=\"0\" title=\"Attachment\"></a>";
		}

		else{
			attachment ="<a href=\"javascript:void window.open('../upload/uploadFile.jsp?attachNo="+i+"','','resizable=yes,scrollbars=no,toolbars=no,status=yes,width=350,height=150,top=0,left=0')\" ><img src=\"../images/attachment.gif\" border=\"0\"></a>";
		}
%>
   
	<input type="hidden" name="<%=policyTxnId%>" value="<%=tmpArr[1]%>">
	<input type="hidden" name="policyId<%=i%>" value="<%=tmpArr[2]%>">
	<input type="hidden" name="<%=policyFeedbackId%>" value="<%=tmpArr[0]%>">
	<input type="hidden" name="apprOId<%=i%>" value="<%=tmpArr[7]%>">
	<input type="hidden" name="apprFdbk<%=i%>" value="<%=apprFdbk%>">
	<input type="hidden" name="apprRmrks<%=i%>" value="<%=apprRmrks%>">
	<input type="hidden" name="status<%=i%>" value="<%=tmpArr[16]%>">
	<input type="hidden" name="isAttach<%=i%>" value="<%=tmpArr[23]%>">
	<input type= "hidden" name= "controlResultSize" value= "<%=controlResult.size()%>">
	<input type= "hidden" name= "test" value= "1">
    <input type="hidden" name="approverAttachmentName<%=i%>" value="<%=tmpArr[21]%>">
 
 <!--  attahmentName is the user's attached file name -->
<%  if(tmpArr[17].equals("NA")){ 
%>
	<input type="hidden" name="attachmentName<%=i%>" value="">
<%  }else{
%>
    <input type="hidden" name="attachmentName<%=i%>" value="<%=tmpArr[17]%>"> 
<% 
    } 
%>
    <tr bgcolor="<%=bgcolor%>">
		<td width="4%" height="26" align="center" valign="middle" class="style3"><%=++i%></td>
		<td width="35%" align="left" valign="middle" class="style3"><%=tmpArr[3]%> </td>
		<td width="5%" align="center" valign="middle" class="style3"><%=tmpArr[4]%></td>
		<td width="7%" align="center" valign="middle" class="style3"><%=tmpArr[22]%></td>
		<td width="7%" align="center" valign="middle" class="style3"><%=attachment%></td>

<%
	if (date.equals(currDate)){
%>
		<td width="11%" align="left" valign="middle" class="normal">
			<%@ include file="../includes/feedbackOptions.jsp"%>
		</td>
		<td width="12%" align="center" valign="middle" class="style3">
			<%@ include file="../includes/remark.jsp"%>
		</td>
<%
	}else{
%>
		<td width="10%" align="left" valign="middle" class="style3">
			<%=tmpArr[5]%>
		</td>
		<td width="10%" align="left" valign="middle" class="style3">
			<%=tmpArr[6]%>
		</td>
<%
	}
%>
<td width="14%" align="center" valign="middle" class="style3"><%=apprFdbk%></td>
		<td width="14%" align="center" valign="middle" class="style3"><%=apprAttach%>&nbsp;&nbsp;/&nbsp;
		<img src="../images/remark.png" border="0" title="Supervisor Remark" id="requestInfo<%=i%>" class="style3" onmouseover="show('<%=apprRmrks%>');xstooltip_show('tooltip', 'requestInfo<%=i%>',-90,25,100);" onmouseout="xstooltip_hide('tooltip');">
		<div id="tooltip" class="xstooltip" width="100%"></div>
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
	
	 }// end of main if size > 0
	 else{
%>
	<tr>
		<td colspan="100%" height="25px"><block type="spacer" height="25px"></td>
	<tr>
		<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
	</tr>
	<tr>
		<td colspan="100%" align="center" height="40px" style="normal">No Operational Controls to be filled.</td>
	</tr>
	<tr>
		<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
	</tr>
<%				
	}// end of else
%>

</table>
