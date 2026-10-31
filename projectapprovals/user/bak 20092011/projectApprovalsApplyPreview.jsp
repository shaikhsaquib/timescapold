<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<jsp:useBean id="projectApprovalsController" class="com.bccl.projectapprovals.web.controller.ProjectApprovalsWebController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Project Approvals - Create Sanction Note</title>
<script Language="JavaScript" src="../jscripts/projectApprovalsApplyPreview.js"></script>
<script Language="JavaScript" src="../jscripts/util.js"></script>
<script Language="JavaScript" src="../jscripts/common.js"></script>
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
</style></head>

<%
	String subject = (String) request.getParameter("subject");
	String project = (String) request.getParameter("project");
	String description = (String) request.getParameter("description");
	String justification = (String) request.getParameter("justification");
	String value = (String) request.getParameter("value");
	String workdone = (String) request.getParameter("workdone");
	String projecthead = (String) request.getParameter("projecthead");
	String attachment1 = (String) request.getParameter("attachment1");
	String attachment2 = (String) request.getParameter("attachment2");
	String attachment3 = (String) request.getParameter("attachment3");
	String recommendedby1 = (String) request.getParameter("recommendedby1");
	String recommendedby2 = (String) request.getParameter("recommendedby2");
	String approvedby = (String) request.getParameter("approvedby");

%>

<body>
<form name="frmprojectApprovalsApplyPreview" method="post">
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg.png">
 <tr bgcolor="#CCCCCC">
    <td align="left" valign="top" bgcolor="#FFFFFF"><table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#086aa2"><img src="../images/header.jpg" width="798" height="78" /></td>
        </tr>
      
      
    </table>    </td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#EDE9E8">
      <tr>
        <td width="200" height="25" background="../images/menubg.jpg" bgcolor="#E1DAD9"><div align="left" class="menu1">
          <div align="center"><span class="style4">CREATE SANCTION NOTE</span></div>
        </div></td>
        <td width="147" background="../images/menubg.jpg" bgcolor="#E1DAD9"><div align="left" class="menu1">
          <div align="center"><span class="menu1"><a href="../user/viewProjectApprovals.jsp" class="menu1">VIEW STATUS</a></span></div>
        </div></td>
        <td width="241" background="../images/menubg.jpg" bgcolor="#E1DAD9"><div align="left" class="menu1">
          <div align="center"><a href="../user/projectApprovalsApply.jsp" class="menu1">RECOMMEND SANCTION NOTE</a></div>
        </div></td>
        <td width="212" background="../images/menubg.jpg" bgcolor="#E1DAD9"><div align="center"><span class="menu1"><a href="../user/projectApprovalsApply.jsp" class="menu1">APPROVE SANCTION NOTE</a></span></div></td>
      </tr>
      <tr>
        <td align="left" bgcolor="#cccccc" colspan="6" height="1"><img height="1" src="../images/spacer.gif" width="1" /></td>
      </tr>
    </table>
      <table cellspacing="0" cellpadding="0" width="800" align="center" bgcolor="#ffffff" border="0">
      <tbody>
        <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td height="20" colspan="3" align="left" background="../images/red_shadow.jpg" bgcolor="#666666"><div align="center"><span class="style5Copy">create &nbsp;&nbsp;sanction &nbsp;note</span></div></td>
        </tr>
        <tr>
          <td colspan="3"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="left" colspan="3" height="26"><span class="menu1"><span class="style3">Note</span></span><span class="style3"><span class="menu1"> -&nbsp; </span>Fields marked with<span class="menu1"> <img src="../images/tick.png" width="20" height="20" /> </span>are mandatory</span></td>
        </tr>
        <tr>
          <td align="left" colspan="3" height="26">&nbsp;</td>
        </tr>
        <tr>
          <td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td height="57" align="right" class="style5">SUBJECT </td>
          <td align="left">:</td>
          <td align="left" class="style3"><%=subject%>              
            &nbsp;<strong><img src="../images/tick.png" width="20" height="20" /></strong></span></td>
        </tr>
        <tr>
          <td width="39%" height="40" align="right" class="style5"> PROJECT</td>
          <td align="left" width="2%">:</td>
          <td align="left" width="59%" class="style3"><%=project%>
            &nbsp;<span class="style3"><strong><img src="../images/tick.png" width="20" height="20" /></strong></span></td>
        </tr>
        <tr>
          <td width="39%" height="54" align="right" class="style5">DESCRIPTION</td>
          <td align="left" width="2%">:</td>
          <td align="left" width="59%" class="style3"><%=description%>
            &nbsp;<strong><img src="../images/tick.png" width="20" height="20" /></strong></span></td>
        </tr>
        <tr>
          <td width="39%" height="52" align="right"><span class="style5">JUSTIFICATION</span><span class="style3"></span></td>
          <td align="left" width="2%">:</td>
          <td align="left" width="59%" class="style3"><%=justification%>&nbsp;<strong><img src="../images/tick.png" width="20" height="20" /></strong></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">VALUE OF WORKS Rs.</span></td>
          <td align="left">:</td>
          <td align="left" height="34" class="style3"><%=value%></td>
        </tr>
        <tr>
          <td height="40" align="right" class="style5"> WHETHER WORK IS DONE OR NOT</td>
          <td align="left">:</td>
          <td align="left" class="style3"><%=workdone%>
            &nbsp;<span class="style3"><strong><img src="../images/tick.png" width="20" height="20" /></strong></span></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">HEAD UNDER PROJECTS TO WHICH COSTS ARE ATTACHED</span></td>
          <td align="left" class="style5">:</td>
          <td align="left" height="59" class="style3"><%=projecthead%></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">ATTACHMENTS</span></td>
          <td align="left" class="style5">:</td>
          <td align="left" height="34" class="style3"><%=attachment1%></td>
        </tr>
        <tr>
          <td align="right">&nbsp;</td>
          <td align="left">&nbsp;</td>
          <td align="left" height="34" class="style3"><%=attachment2%></td>
        </tr>
        <tr>
          <td align="right"><a href="javascript:attachmentFile();" class="style3Underline"></a></td>
          <td align="left">&nbsp;</td>
          <td align="left" height="34" class="style3"><%=attachment3%></td>
        </tr>        
        <tr>
          <td align="right"><span class="style5">RECOMMENDED BY</span></td>
          <td align="left">:</td>
          <td align="left" height="34" class="style3"><%=recommendedby1%></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">RECOMMENDED BY</span></td>
          <td align="left">:</td>
          <td align="left" height="34" class="style3"><%=recommendedby2%></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">APPROVED BY</span></td>
          <td align="left">:</td>
          <td align="left" height="34" class="style3"><%=approvedby%></td>
        </tr>
        <tr>
          <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
          <td bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td colspan="3">&nbsp;</td>
        </tr>
      </tbody>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><table width="800" height="29" border="0" align="center" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td width="711" height="29" colspan="5" align="right" bgcolor="#EDE9E8"><div align="center" > <span class="menu2Copy">
            <input name="button" type="submit" class="style4" id="button" value="Submit" onclick="javascript:createRequest();"/>
          </span>            <span class="style4">&nbsp;&nbsp;
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


	<input type="hidden" name="hidsubject" value="<%=subject%>"/>
	<input type="hidden" name="hidproject" value="<%=project%>"/>
	<input type="hidden" name="hiddescription" value="<%=description%>"/>
	<input type="hidden" name="hidjustification" value="<%=justification%>"/>
	<input type="hidden" name="hidvalue" value="<%=value%>"/>
	<input type="hidden" name="hidworkdone" value="<%=workdone%>"/>
	<input type="hidden" name="hidprojecthead" value="<%=projecthead%>"/>
	<input type="hidden" name="hidattachment1" value="<%=attachment1%>"/>
	<input type="hidden" name="hidattachment2" value="<%=attachment2%>"/>
	<input type="hidden" name="hidattachment3" value="<%=attachment3%>"/>
	<input type="hidden" name="hidrecommendedby1" value="<%=recommendedby1%>"/>
	<input type="hidden" name="hidrecommendedby2" value="<%=recommendedby2%>"/>
	<input type="hidden" name="hidapprovedby" value="<%=approvedby%>"/>

</body>
</html>
