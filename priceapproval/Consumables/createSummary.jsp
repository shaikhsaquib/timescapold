<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 


<%
	Hashtable dataHash = new Hashtable();
	ArrayList parList	=  new ArrayList();
	String parDataArry[] = null;
	String lstPar = "";

	//dataHash.put("STATUS","A");

	parList =	priceApprovalWebController.lstOfPar();

	if(parList.size()>0)
	{
		for(int kk= 0; kk<parList.size(); kk++)
		{
			parDataArry   = (String[])parList.get(kk);
			lstPar += "<option value=\""+parDataArry[0]+"\">"+parDataArry[0]+"</option>";
		}
	}
%>

<table width="100%" cellspacing="2" cellpadding="2" border="0">
	<tr>
	</tr>
	
	<tr>

    <td align="left" width="3%"   class="normal"><span class="small">Select PAR :</span></td>
		<td width="25%" align="left">
		<span class="small">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr>
				<td width="15%">
					<!-- <input type="text" name="parvalue" id="parvalue" class="small" maxlength="10" onkeydown=""/> -->

				<select class="small" id="parList" name="parList" multiple style="width:143px;">
				<option value="0">Select PAR</option>
				<%=lstPar%>
				</select>							

			</td>
				
				
				</tr>
			</table>
		</span>
			
	</tr>
<!--ATTACHMENTS-->
<table width="100%" cellspacing="2" cellpadding="2" border="0">

	<tr>
		<td height="26" colspan="100%" bgcolor="#fbf9f9" class="travelMenuBG">ATTACHMENTS:</td>
	</tr>
	<tr class="greyBG">
		<td width="2%" height="29" >Sr.No</td>
		<td width="4%" align="left">File Name</td>
		<td width="8%" align="left">File Description</td>
		<td width="10%" align="left">Type Of Document</td>
	</tr>

<tbody id="inputtable">

<tr>
	<td height="25" valign="top" align="left" >1</td>

	    <td height="22" align="left" valign="top"><textarea name="attach1" type="text" cols="20" class="small" id="attach1" value="" readonly="readonly"></textarea><a href="#" onclick="upload('attach1')"><img src="../images/attachment.gif" border="0" /></a><span class="redsmall" valign="top">&#42&nbsp;</span><input name="attach1New" type="hidden" id="attach1New" value="" />
		</td>
	
	<td height="25" valign="top" align="left">
	<span class="small">
		<textarea name="fileDesc1" id="fileDesc1" cols="25"  rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.fileDesc1,'fileDescChar1',50)" onkeyup="textCounter(document.priceApprovalMain.fileDesc1,'fileDescChar1',50)"></textarea>
	</span>
	<div>
		<table width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td id="fileDescChar1" width="10%" class="small">50</td>
			<td align="left" class="small">&nbsp;Chars Left</td></tr>
		</table>
	</div>
	</td>

   <td height="25" valign="top" align="left">
	<span class="small">
		<select name="attachType1" id="attachType1"  class="small selectboxheight" height="25">
		<option value="Supporting Document">Supporting Document </option>
		<option value="Summary Sheet">Summary Sheet </option>
		<!-- <option value="Vendor Comparative">Vendor Comparative </option>
		<option value="PAR Main Template">PAR Main Template</option>
 -->
		</select>
	</span>
	</td>
</tr>
	
</tbody>
	<tr>
		<td colspan="5" height="10" style="text-align:right;">
			<input  type="button" value="Add Row" name="add" onclick="addRow('S')" class="bold">
			<input type="button" value="Remove Row" name="add" onclick="delRow()" class="bold">
			<input type="hidden" name="count" value="1" />	
		</td>
   </tr>
</table>






  </table>




      <table width="100%" border="0" cellspacing="4" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;</td>
          
        </tr>
        <tr>
          <td align="center" width="10%" colspan="1">
		  <input  name="savedraft1" class="bold" type="button"  id="savedraft1" value="Save Draft" onclick="saveSummaryDraft(1);" />
		  <input name="submitForm"  type="button" class="bold" id="submitForm" onclick="submitSummary();" value="Submit" />
		  <input type="reset" class="bold" id="" value="Reset" />
		  </td>
         
        </tr>
      </table>