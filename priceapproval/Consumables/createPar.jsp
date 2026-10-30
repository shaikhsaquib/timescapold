<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>

<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%
 String company = "1000";//(String)request.getParameter("company");
 String approverType="";
 String app4        ="";
 String app5        ="";
 String app6        ="";
 String app7        ="";
        Hashtable apprData = new Hashtable();
        approverType="AP4";
        apprData.put("companyCode",company);
        apprData.put("approverType",approverType);
		ArrayList approversLst	=  new ArrayList();
	    String apprsData[]       = null;
         int jj          =0;
		approversLst 			=	priceApprovalWebController.grpCompanyAppLst(apprData);
          if(approversLst.size()>0)
           {
            for(jj = 0; jj<approversLst.size(); jj++)
             {
                apprsData   = (String[])approversLst.get(jj);
                app4    += "<option value=\""+apprsData[0]+"\">"+apprsData[5]+"</option>";
           }
        apprData.remove("approverType");
}
        approverType="AP5";
        apprData.put("approverType",approverType);
		approversLst 			=	priceApprovalWebController.grpCompanyAppLst(apprData);
          if(approversLst.size()>0)
           {
            for(jj = 0; jj<approversLst.size(); jj++)
             {
                apprsData   = (String[])approversLst.get(jj);
                app5    += "<option value=\""+apprsData[0]+"\">"+apprsData[5]+"</option>";
          }
        apprData.remove("approverType");
}
        approverType="AP6";
        apprData.put("approverType",approverType);
		approversLst 			=	priceApprovalWebController.grpCompanyAppLst(apprData);
          if(approversLst.size()>0)
           {
            for(jj = 0; jj<approversLst.size(); jj++)
             {
                apprsData   = (String[])approversLst.get(jj);
                app6    += "<option value=\""+apprsData[0]+"\">"+apprsData[5]+"</option>";
          }
        apprData.remove("approverType");
}
        approverType="AP7";
        apprData.put("approverType",approverType);
		approversLst 			=	priceApprovalWebController.grpCompanyAppLst(apprData);
          if(approversLst.size()>0)
           {
            for(jj = 0; jj<approversLst.size(); jj++)
             {
                apprsData   = (String[])approversLst.get(jj);
                app7    += "<option value=\""+apprsData[0]+"\">"+apprsData[5]+"</option>";
          }
}
    String label1="";
    String label2="";
    String label3="";
    String label4="";

    if(company.equals("1000"))
    {
        //label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">(Delegated Authority) &nbsp; &#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
       // label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        label1 = "<span class=\"small\"><strong>Director B&C</strong></span>";
        //label2 = "<span class=\"small\"><strong>Executive Director</strong></span>";
        label2 = "<span class=\"small\"><strong>COO (Publishing)</strong></span>";
        label3 = "<span class=\"small\"><strong>COO</strong></span>";
        //label4 = "<span class=\"small\"><strong>CEC & ED</strong></span>";
        label4 = "<span class=\"small\"><strong>CEO (Publishing)</strong></span>";
    }else{
        label1  ="<span class=\"small\">Group Company CEO/COO</span>";
        label2 = "<span class=\"small\">Director B&C</span>";
        //label2 = "<span class=\"small\">Director B&C</span><span class=\"redsmall\" id=\"changeLabel2\"><br>(Delegated Authority)</span>";
        //label3 = "<span class=\"small\">Executive Director</span>";
        label3 = "<span class=\"small\">COO (Publishing)</span>";
        //label4 = "<span class=\"small\">CEC & ED - BCCL</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";

    }

	Hashtable dataHash = new Hashtable();
	ArrayList catList	=  new ArrayList();
	String catDataArry[] = null;
	String lstCat = "";
	

	//dataHash.put("STATUS","A");
//out.println("catList.size"+catList.size());
	catList =	priceApprovalWebController.categoryLst();

	if(catList.size()>0)
	{
		for(int kk= 0; kk<catList.size(); kk++)
		{
			catDataArry   = (String[])catList.get(kk);
			lstCat += "<option value=\""+catDataArry[0]+"\">"+catDataArry[0]+"</option>";
			
		}
	}

%>



<table width="100%" cellspacing="2" cellpadding="2" border="0">
	<tr>
		<td  align="left" width="3%"   class="normal"><span class="redsmall">*&nbsp;-&nbsp;mandatory</span></td>
	</tr>
	
	<tr>
    <td width="2%" height="27"  ><span class="small" id="top">Category</span></td>
    <td width="10%" align="left">
		<span class="small">
			<select name="category" id="category" align="left" class="small selectboxheight" height="25">
				<option value="0">select</option>
				<%=lstCat%>
</select>
		</span>
		
		
	</td>
    <td align="left" width="4%"   class="normal"><span class="small">PAR Value:</span></td>
		<td width="25%" align="left">
		<span class="small">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr>
				<td width="15%">
					<input type="number" name="parvalue" id="parvalue" class="small" maxlength="10" onkeydown=""/>
				<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
				<td id="" align="left" width="3%" class="small">10</td>
				<td align="left" class="small">Chars Left</td>
				</tr>
			</table>
		</span>
		
		
		
		</td>

			<td height="10" valign="top" align="left" class="normal">
	
		<input height="15" type="checkbox" name="summarySheetChk"  id="summarySheetChk" class="normal" / ><span style="margin-top:0px;">Summary Sheet</span>
	
	
	</td>	
	</tr>
  </table>
<!--end dropdowns-->
<hr>

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

	    <td height="22" align="left" valign="top"><textarea name="attach1" type="text" cols="20" class="small" id="attach1" value="" readonly="readonly"></textarea><a href="#" onclick="upload('attach1')"><img src="../images/attachment.gif" border="0" /></a><span class="redsmall" valign="top"></span><input name="attach1New" type="hidden" id="attach1New" value="" />
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
		<option value="PAR Main Template">PAR Main Template</option>
		<option value="Supporting Document">Supporting Document </option>
		<!-- <option value="Vendor Comparative">Vendor Comparative </option> -->
		</select>
	</span>
	</td>
</tr>
	
</tbody>
	<tr>
		<td colspan="5" height="10" style="text-align:right;">
			<input  type="button" value="Add Row" name="add" onclick="addRow('P')" class="bold">
			<input type="button" value="Remove Row" name="add" onclick="delRow()" class="bold">
			<input type="hidden" name="count" value="1" />	
		</td>
   </tr>
</table>


<hr>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="52%" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="2" cellspacing="2">
     
      <tr>
        <td height="22" colspan="100%" bgcolor="#fbf9f9" class="travelMenuBG">APPROVALS</td>
        </tr>
    </table>
      <table  border = "0" width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="12%" >B&amp;C <span class="small"></span><span class="redsmall"><br>(3rd approver is mandatory)</span></td>
          <td width="12%" height="29" >Category Head<span class="small"></span><span class="redsmall"><span class="small"></span>&nbsp;</span></td>
          <td width="11%" align="left" colspan="2">&nbsp;Supported By</td>

            <td width="12%" align="left"><%=label1%><!-- <span class="small" id="changeLabel1">Director B&C</span><br><span class="redsmall" id="changeLabel2">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span> --></td>
          <td width="12%" align="left"><%=label2%><!-- <span class="small" id="changeLabel3">EP Supply Chain</span> --></td>
          <td width="12%" align="left"><%=label3%><!-- <span class="small" id="changeLabel4">COO</span> --></td>
          <td width="12%" align="left"><%=label4%><!-- <span class="small">CEO/CEC</span> --></td>
          <td width="12%" align="left"><span class="small"><strong>Managing Director</strong> </span></td>
        </tr>

<%
		ArrayList approverList   = new ArrayList();
		String str          = ""; 
		int i = 0;
        String roleType     ="";
        String selected="";
        Hashtable approverData  = new Hashtable();
%>

		<tr>
		<td colspan="2">&nbsp;</td>
		<td class = "small" height = "15" >&nbsp;<b>Name</b>
		</td>
		<td class = "small" height = "15" width="5%" >&nbsp;<b>Role</b>
		</td>
			<input type="hidden" name="app11" value="0" />	
			<input type="hidden" name="app11H" value="0" />	
		</tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app1" id="app1" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app1H" id="app1H" type="hidden" value="" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" >
			 <input  name = "app2H" id="app2H" type="hidden" value="" />
		  </td>

		<td class = "normal" height = "25"  align="left">
		<select name = "app3" id="app3" class = "normal" style="width:174px;" >
		<option value="0">Select</option>
<%
			    roleType    =   "MAS 1";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
%>
		<option value="<%=tempArr[2]%>" <%=selected%>><%=tempArr[3]%></option>
<%
		}
%>

        </select>
		</td>
		  <td class = "normal" height = "25"  align="left">MAS 1 </td>




		  
          <td rowspan="3" align="left" valign="top" class="small"><span class="boldunderline_small">
            <select name="select12" class="small" id="select12" style="width:130px;">
        <option value="0">Select</option>
			<%=app4%>
</select>
			</span></td>
          <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
		<select name="select13" class="small" id="select13" style="width:130px;">
		<option value="0">Select</option>	
	   <%=app5%>

	   </select> </span></td>
         
		<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select14" class="small" id="select14" style="width:130px;">
		<option value="0">Select</option>
      	  <%=app6%>

	  </select></span></td>

	  <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select15" class="small" id="select15" style="width:130px;">
		<option value="0">Select</option>

	  <%=app7%>
		
      </select></span></td>

	  <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
	  <select name="select16" class="small" id="select16" style="width:130px;">
       <option value="0">Select</option>
      <option value="29616">Vineet Jain</option>
      </select></span>
	  </td>
        </tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app4H" id="app4H" type="hidden" value="" />
		 </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app5H" id="app5H" type="hidden" value="" />
		  </td>
   
		  <td  class = "normal"  height = "25" align="left">
		<select name = "app6" id="app6" class = "normal" style="width:174px;" >
		<option value="0">Select</option>
<%			    roleType    =   "MAS 2";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
%>
		<option value="<%=tempArr[2]%>" <%=selected%>><%=tempArr[3]%></option>
<%
		}
%>
        </select>
		</td>
		 <td class = "normal" height = "25" align="left">MAS 2</td>

			<input type="hidden" name="app12" value="0" />	
			<input type="hidden" name="app12H" value="0" />	


       </tr>
        <tr class="small">
          <td class = "normal" height = "25" align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app7H" id="app7H" type="hidden" value="" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app8H" id="app8H" type="hidden" value="" />
		  </td>
      
		<td class = "normal" height = "25"  align="left">
		<select name = "app9" id="app9" class = "normal" style="width:174px;" >
		<option value="0">Select</option>
<%			    roleType    =   "Finance 1";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
%>
		<option value="<%=tempArr[2]%>" <%=selected%>><%=tempArr[3]%></option>
<%
		}
%>        </select>
		</td>
		  <td class = "normal" height = "25"  align="left" >Finance 1 </td>




		  
        </tr>

		<tr class="small">
		  <td colspan="2" >&nbsp;</td>
         
	  <td class = "normal" height = "25"  align="left" >
		  <select name = "app10" id="app10" class = "normal" style="width:174px;">
          <option value="0"  selected="selected">Select</option>
<%			    roleType    =   "Finance 2";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
%>
		<option value="<%=tempArr[2]%>" <%=selected%>><%=tempArr[3]%></option>
<%
		}
%>
</select>
    </td> 
	  <td class = "normal" height = "25" align="left"> Finance 2</td>
		 </tr>
		 
		
      </table>
      <table width="100%" border="0" cellspacing="4" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;</td>
          
        </tr>
        <tr>
          <td align="center" width="10%" colspan="1">
		  <input  name="savedraft1" class="bold" type="button"  id="savedraft1" onclick="saveDraft(1);" value="Save Draft"  />
		  <input name="submitForm"  type="button" class="bold" id="submitForm" onclick="validateForm(1);" value="Submit" />
		  <input type="reset" class="bold" id="" value="Reset" />
		  </td>
         
        </tr>
      </table>