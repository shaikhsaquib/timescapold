<%--
 -- @(#)checkRequestDetails.jsp - 1-APR-2010
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--

 -- @author  -  Sachin Mehta 21/09/2011
 -- @version -  1.0

 --%>

<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<jsp:useBean id="projectApprovalsController" class="com.bccl.projectapprovals.web.controller.ProjectApprovalsWebController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Project Approvals - Check Request Details</title>
<style type="text/css">
<!--

-->
</style>
<link href="../style/CA.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	background-color: #FBF9F9;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style6 {font-size: 12px; color: #e8e8e8; font-style: normal; text-transform: none; font-variant: normal; word-spacing: normal; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif;}
-->
</style>
<script> 
    function hideImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'hidden'; 
            document.getElementById('button').style.visibility = 'hidden'; 
        } 
    }
    function showImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'visible'; 
            document.getElementById('button').style.visibility = 'visible'; 
        } 
    } 
</script>
</head>
<%
	ArrayList chkRequestList = new ArrayList();

    String prjId = (String) request.getParameter("projectId");
	chkRequestList = projectApprovalsController.viewRequestList(prjId);

	//System.out.println(chkRequestList.size());
	String chkRequestDetail[] = (String[]) chkRequestList.get(0);
	Hashtable chkRequestDetailHash = xmlObj.readSubNode(chkRequestDetail[1], "reqDetails");
	
	 String DPATH = EnvironmentProperties.getValue("projectapprovals", "uploadPath");

	 String userEmailid = chkRequestDetail[8];
	 String projectName = (String) chkRequestDetailHash.get("project-");

	 String format1 = "";
	 String format2 = "";
	 String format3 = "";

	 if (userEmailid.indexOf("@") > -1) {

		userEmailid = userEmailid.substring(0, userEmailid.indexOf("@")); 

	 }

	String attachment1 = chkRequestDetail[4];

	if (!attachment1.equals("NA")&& attachment1.lastIndexOf(".")> -1) {
		
		format1= attachment1.substring(attachment1.lastIndexOf("."));

		if (attachment1.lastIndexOf("_") > -1) {

			attachment1 = attachment1.substring(0, attachment1.lastIndexOf("_")); 

		 }		
	}
	

	String attachment2 = chkRequestDetail[5];
	
	if (!attachment2.equals("NA") && attachment2.lastIndexOf(".")> -1) {
		
		 format2= attachment2.substring(attachment2.lastIndexOf("."));

		if (attachment2.lastIndexOf("_") > -1) {

			attachment2 = attachment2.substring(0, attachment2.lastIndexOf("_")); 

		 }		
	
	}
	
	String attachment3 = chkRequestDetail[6];

	if (!attachment3.equals("NA")&& attachment3.lastIndexOf(".")> -1) {

		 format3= attachment3.substring(attachment3.lastIndexOf("."));

		if (attachment3.lastIndexOf("_") > -1) {

			attachment3 = attachment3.substring(0, attachment3.lastIndexOf("_")); 

		}
	}
%>
<body>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="bg.png">
  <tr>
    <td bgcolor="#FFFFFF">
      <table cellspacing="0" cellpadding="0" width="800" align="center" bgcolor="#ffffff" border="0">
      <tbody>
        <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td height="20" colspan="3" align="left" background="../images/red_shadow.jpg" bgcolor="#666666"><div align="center"><span class="style5Copy">project details</span></div></td>
        </tr>
		<tr>
			<td colspan="2"><img height="1" src="../images/spacer.gif" width="1" />
			<td colspan = "1" align = "right" class="redbold"><input name="printbutton" type="submit" class="style4" id="printbutton" value="Print" onclick="javascript:hideImage();window.print();showImage();"/>
			</td>
		</tr>
       <!--  <tr>
          <td align="left" colspan="3" height="26">&nbsp;</td>
        </tr> -->
        
        <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td height="57" align="right" class="style5">PROJECT ID </td>
          <td align="left" class="style5">:</td>
          <td align="left" class="menu1"><%=prjId%></td>
        </tr>
        <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td height="57" align="right" class="style5">SUBJECT </td>
          <td align="left" class="style5">:</td>
          <td align="left" class="menu1"><%=chkRequestDetailHash.get("subject-")%></td>
        </tr>
        <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
         <tr>
          <td width="39%" height="40" align="right" class="style5"> PROJECT</td>
          <td width="2%" align="left" class="style5">:</td>
          <td align="left" width="59%">&nbsp;<span class="menu1"><%=chkRequestDetailHash.get("project-")%></span></td>
        </tr>
         <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td width="39%" height="54" align="right" class="style5">DESCRIPTION</td>
          <td width="2%" align="left" class="style5">:</td>
          <td width="59%" align="left" class="menu1"><%=chkRequestDetailHash.get("description-")%></td>
        </tr>
         <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td width="39%" height="77" align="right"><span class="style5">JUSTIFICATION</span><span class="style3"></span></td>
          <td width="2%" align="left" class="style5">:</td>
          <td width="59%" align="left" class="menu1"><%=chkRequestDetailHash.get("justification-")%></td>
        </tr>
         <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">VALUE OF WORKS (Rs.)</span></td>
          <td align="left" class="style5">:</td>
          <td height="34" align="left" class="menu1"><%=chkRequestDetailHash.get("value-")%></td>
        </tr>
         <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td height="40" align="right" class="style5"> WHETHER WORK IS DONE OR NOT</td>
          <td align="left" class="style5">:</td>
          <td align="left" class="menu1"><%=chkRequestDetailHash.get("workdone-")%></td>
        </tr>
         <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">HEAD UNDER PROJECTS TO WHICH COSTS ARE ATTACHED</span></td>
          <td align="left" class="style5">:</td>
          <td height="59" align="left" class="menu1"><%=chkRequestDetailHash.get("projecthead-")%></td>
        </tr>
         <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
          

<%		  if(!chkRequestDetail[4].equals("NA")) {
            //out.println(userEmailid +"-"+projectName+"-"+chkRequestDetail[4]);

%>			
        <tr>
          <td align="right"><span class="style5">ATTACHMENT(S)</span></td>
          <td align="left" class="style5">:</td>
			<td height="34" align="left" class="style3Underline">
			<a href="../common/download.jsp?f=<%=DPATH%><%=userEmailid%>/<%=projectName%>/<%=chkRequestDetail[4]%>" class="style3Underline"><%=attachment1+format1%></a></td>
		</tr>
<%
		} 
	  if(!chkRequestDetail[5].equals("NA")) {

%>	
		<tr>
          <td align="right">&nbsp;</td>
          <td align="left">&nbsp;</td>
		  <td height="34" align="left" class="style3Underline">
		  <a href="../common/download.jsp?f=<%=DPATH%><%=userEmailid%>/<%=projectName%>/<%=chkRequestDetail[5]%>" class="style3Underline"><%=attachment2+format2%></a></td>
		  </tr>
<%
		}
	  if(!chkRequestDetail[6].equals("NA")) {

%>			
        <tr>
          <td align="right"><a href="javascript:attachmentFile();" class="style3Underline"></a></td>
          <td align="left">&nbsp;</td>
          
			<td height="34" align="left" class="style3Underline">
			<a href="../common/download.jsp?f=<%=DPATH%><%=userEmailid%>/<%=projectName%>/<%=chkRequestDetail[6]%>" class="style3Underline"><%=attachment3+format3%></a></td>
		</tr>
<%
		}
%>
         <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">PREPARED BY </span></td>
          <td align="left" class="style5">:</td>
          <td height="34" align="left" class="menu1"><%=chkRequestDetail[7]%></td>
        </tr>
         <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">RECOMMENDER</span></td>
          <td align="left" class="style5">:</td>
          <td height="34" align="left" class="menu1"><%=chkRequestDetail[11]%></td>
        </tr>
        <!--  <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr> -->
        <!-- <tr>
          <td align="right"><span class="style5">RECOMMENDER</span></td>
          <td align="left" class="style5">:</td>
          <td height="34" align="left" class="menu1"><%=chkRequestDetail[15]%></td>
        </tr> -->
         <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">APPROVER</span></td>
          <td align="left" class="style5">:</td>
          <td height="34" align="left" class="menu1"><%=chkRequestDetail[19]%></td>
        </tr>
         <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="/images/spacer.gif" width="1" /></td>
        </tr>
      </tbody>
  </table></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="800" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td width="711" height="29" colspan="5" align="center" valign="middle" bgcolor="#EDE9E8">
		  <div align="center" > <span class="menu2Copy">
            <input name="button" type="submit" class="style4" id="button" value="Close" onclick="javascript:window.close();"/>
          </span>
		  </div>            
           </td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>
<!--------------------------------- Dynametically include the Attribute JSPs for selected service Ends ------------------------------>
<!----------------------------------------------- Submit Table Begins ------------------------------------------------->
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
