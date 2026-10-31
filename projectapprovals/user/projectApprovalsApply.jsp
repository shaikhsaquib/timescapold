<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<jsp:useBean id="projectApprovalsController" class="com.bccl.projectapprovals.web.controller.ProjectApprovalsWebController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>
<%@ include file="../includes/empHeader.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Project Approvals - Create Sanction Note</title>

<script Language="JavaScript" src="../jscripts/projectApprovalsApply.js"></script>
<script Language="JavaScript" src="../jscripts/uploadFile.js"></script>
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

<body>
<%
	ArrayList projectsList = new ArrayList();	

	projectsList   = projectApprovalsController.getProjectsList(timescapeUserOId);
%>
<form name="frmprojectApprovalsApply" method="post">
		<%@ include file="../includes/menu.jsp"%>

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
          <td align="left" class="style3">:</td>
          <td align="left"><textarea name="subject" cols="40" rows="5" class="style3" onkeydown="textCounter(document.frmprojectApprovalsApply.subject,document.frmprojectApprovalsApply.lineCountSubject,100)" onkeyup="textCounter(document.frmprojectApprovalsApply.subject,document.frmprojectApprovalsApply.lineCountSubject,100)" size="20" maxlength="100"></textarea>
              <input name="lineCountSubject" class="style3" value="100" size="3" maxlength="3" readonly="readOnly" />
              <span class="style3"><span class="menu1"><span class="style3">characters   left</span></span></span>
              <span class="menu1">
            </INPUT>
            &nbsp;<strong><img src="../images/tick.png" width="20" height="20" /></strong></span></td>
        </tr>
        <tr>
          <td width="39%" height="35%" align="right" class="style5"> PROJECT</td>
          <td align="left" width="2%" class="style3">:</td>
          <td align="left" width="52%">
			<select name="project" class="style3" >
			<option value="select">Select Project</option>
                   
<%
				for(int kk=0; kk< projectsList.size(); kk++){
		
				String tmpArr[] = (String[])projectsList.get(kk);
%>	
				<option value = "<%=tmpArr[1]%>"><%=tmpArr[1]%></option>
 <%
	
	
				}
%>  
		</select>
          
            &nbsp;<span class="style3"><strong><img src="../images/tick.png" width="20" height="20" /></strong></span></td>
        </tr>
        <tr>
          <td width="39%" height="54" align="right" class="style5">DESCRIPTION</td>
          <td align="left" width="2%" class="style3">:</td>
          <td align="left" width="59%"><textarea name="description" cols="40" rows="5" class="style3" onkeydown="textCounter(document.frmprojectApprovalsApply.description,document.frmprojectApprovalsApply.lineCountDescription,300)" onkeyup="textCounter(document.frmprojectApprovalsApply.description,document.frmprojectApprovalsApply.lineCountDescription,300)" maxlength="300"></textarea>
            <input name="lineCountDescription" class="style3" value="300" size="3" maxlength="3" readonly="readOnly" />
            <span class="style3">characters left</span><span class="menu1">
</INPUT>
            &nbsp;<strong><img src="../images/tick.png" width="20" height="20" /></strong></span></td>
        </tr>
        <tr>
          <td width="39%" height="52" align="right"><span class="style5">JUSTIFICATION</span><span class="style3"></span></td>
          <td align="left" width="2%" class="style3">:</td>
          <td align="left" width="59%"><textarea name="justification" cols="40" rows="5" class="style3" onkeydown="textCounter(document.frmprojectApprovalsApply.justification,document.frmprojectApprovalsApply.lineCountJustification,300)" onkeyup="textCounter(document.frmprojectApprovalsApply.justification,document.frmprojectApprovalsApply.lineCountJustification,300)" maxlength="300"></textarea>
            <input name="lineCountJustification" class="style3" value="300" size="3" maxlength="3" readonly="readOnly" />
            <span class="style3">characters   left
</INPUT>
            </span>            &nbsp;<strong><img src="../images/tick.png" width="20" height="20" /></strong></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">VALUE OF WORKS (Rs.)</span></td>
          <td align="left" class="style3">:</td>
          <td align="left" height="34"><input name="cost" class="style3" size="25" maxlength="10" onblur="javascript:checkNumeric();"/>
            <strong><img src="../images/tick.png" width="20" height="20" /></strong><span class="style3"><span class="style3"><span class="style3">(<span class="menu1">10 digits)</span></span></span></span></td>
        </tr>
        <tr>
          <td height="40" align="right" class="style5"> WHETHER WORK IS DONE OR NOT</td>
          <td align="left" class="style3">:</td>
          <td align="left"><select name="workdone" class="menu1">
            <option value="Yes">Yes</option>
            <option value="No">No</option>
           </select>
            &nbsp;<span class="style3"><strong><img src="../images/tick.png" width="20" height="20" /></strong></span></td>
        </tr>
        <tr>
          <td align="right"><span class="style5">HEAD UNDER PROJECTS TO WHICH COSTS ARE ATTACHED</span></td>
          <td align="left" class="style5" class="style3">:</td>
          <td align="left" height="59"><textarea name="projecthead" cols="40" rows="5" class="menu1" onkeydown="textCounter(document.frmprojectApprovalsApply.projecthead,document.frmprojectApprovalsApply.lineCountHead,150)" onkeyup="textCounter(document.frmprojectApprovalsApply.projecthead,document.frmprojectApprovalsApply.lineCountHead,150)" maxlength="400"></textarea>
            <input name="lineCountHead" class="style3" value="150" size="3" maxlength="3" readonly="readOnly" />
			<span class="style3">characters   left
			</INPUT> &nbsp;<span class="style3"><strong><img src="../images/tick.png" width="20" height="20" /></strong></span></td>
            </span>  
        </tr>
        <tr>
          <td align="right"><span class="style5">ATTACHMENTS</span></td>
          <td align="left" class="style3">:</td>
          <td align="left" height="34"><input name="attachment1" class="style3" size="25" readOnly/>
            <span class="style3"><a href="#" onclick ="upload('attachment1')"   class="style3Underline">Click here to Attach a file</u></a></span></td>
			<td class="style3" bgColor="#f8f8f8" colspan="2"><input type= "hidden" name= "attachment11" /></td>
        </tr>
        <tr>
          <td align="right">&nbsp;</td>
          <td align="left">&nbsp;</td>
          <td align="left" height="34"><input name="attachment2" class="style3" size="25" readOnly/>
            <span class="style3"><a href="#" onclick ="upload('attachment2')" readOnly  class="style3Underline">Click here to Attach a file</u></a></span></td>
			<td class="style3" bgColor="#f8f8f8" colspan="2"><input type= "hidden" name= "attachment21" /></td>
        </tr>
        <tr>
          <td align="right"><a href="javascript:attachmentFile();" class="style3Underline"></a></td>
          <td align="left">&nbsp;</td>
          <td align="left" height="34"><input name="attachment3" class="style3" size="25" readOnly/>
            <span class="style3"><a href="#" onclick ="upload('attachment3')" readOnly  class="style3Underline">Click here to Attach a file</u></a></span></td>
			<td class="style3" bgColor="#f8f8f8" colspan="2"><input type= "hidden" name= "attachment31" /></td>
        </tr>        
        <tr>
          <td align="right"><span class="style5">RECOMMENDED BY</span></td>
          <td align="left" class="style3">:</td>
          <td align="left" height="34"><input name="recommendedby1" id="recommendedby1" class="style3"  size="25" onClick="addUser('recommendedby1')"/>
		  <input name="recommendedby1OId" id="recommendedby1OId" type="hidden" class="style3"  size="25" />
            <strong><img src="../images/tick.png" width="20" height="20" /></strong><span class="style3">(kindly key in the email ID of the person who recommends)</span></td>
        </tr>
       <!--  <tr>
          <td align="right"><span class="style5">RECOMMENDED BY</span></td>
          <td align="left" class="style3">:</td>
          <td align="left" height="34"><input name="recommendedby2" class="style3" size="25" onClick="addUser('recommendedby2')"/>
		   <input name="recommendedby2OId" type="hidden" class="style3"  size="25" />
            <strong><img src="../images/tick.png" width="20" height="20" /></strong><span class="style3">(kindly key in the email ID of the person who recommends)</span></td>
        </tr> -->
        <tr>
          <td align="right"><span class="style5">APPROVED BY</span></td>
          <td align="left" class="style3">:</td>
          <td align="left" height="34"><input name="approvedby" id="approvedby" class="style3" size="25" onClick="addUser('approvedby')"/>
		   
            <strong><img src="../images/tick.png" width="20" height="20" /></strong><span class="style3">(kindly key in the email ID of the person who approves)</span></td>
			<input name="approvedbyOId" id="approvedbyOId" class="style3" type="hidden" />
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
            <input name="button" type="submit" class="style4" id="button" value="Submit" onclick="javascript:document.getElementById('button').disabled = true;validate();"/>
          </span>            <span class="style4">&nbsp;&nbsp;
          </span>
          <input name="button2" type="submit" class="style4" id="button2" value="Reset" onclick="javascript:clear()"/>
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
</form>
</body>
</html>
