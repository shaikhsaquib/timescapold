<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>

<%@ include file="includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%
 String company = (String)request.getParameter("company");

  
 String category = (String)request.getParameter("opt");
 if(category == null){
	 category = "";
 }
 
 String approverType="";
 String app4        ="";
 String app5        ="";
 String app6        ="";
 String app7        ="";
        Hashtable apprData = new Hashtable();
        approverType="AP4";
        apprData.put("companyCode",company);
		//out.println("company"+company);
        apprData.put("approverType",approverType);
		if(category.equals("9") && (company.equals("1005") || company.equals("1006"))){
			apprData.put("category","GCRB");
		}else if(category.equals("7") && (company.equals("1005") || company.equals("1006"))){
			apprData.put("category","PRJ");
		}else if(category.equals("3") && (company.equals("1005") || company.equals("1006") )){
			apprData.put("category","ITB"); 
		}else if(category.equals("10") && (deptGroup.equals("1026"))){
			apprData.put("category","LGS"); 
		}else {
			apprData.put("category","NA"); 
		}

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
				//out.println(" app7"+ app7);
          }
}


    String label1="";
    String label2="";
    String label3="";
    String label4="";
	

    if(company.equals("1000") && (!deptGroup.equals("1026")))
    {
        //label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">(Delegated Authority) &nbsp; &#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        //label2 = "<span class=\"small\">Executive Director</span>";
        label2 = "<span class=\"small\">COO (Publishing)</span>";
        label3 = "<span class=\"small\">COO</span>";
        //label4 = "<span class=\"small\">CEC & ED</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";
		
    } else if (company.equals("1000") && (deptGroup.equals("1026")))
    {
        //label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">(Delegated Authority) &nbsp; &#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        label1 = "<span class=\"small\">Director RMD</span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        //label2 = "<span class=\"small\">Executive Director</span>";
        label2 = "<span class=\"small\">COO (Publishing)</span>";
        label3 = "<span class=\"small\">COO</span>";
        //label4 = "<span class=\"small\">CEC & ED</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";
		
    }
	else if(company.equals("1033"))
    {
        //label1 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">(Delegated Authority) &nbsp; &#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
        label1 = "<span class=\"small\">CEO/COO Artha</span>";
        label2 = "<span class=\"small\">President Artha</span>";
        label3 = "<span class=\"small\">MD Artha</span>";
        //label4 = "<span class=\"small\">CEC & ED</span>";
        label4 = "<span class=\"small\">CEO (Publishing)</span>";
		
    }else if(company.equals("1005") || company.equals("1006"))
    {        
        if(category.equals("9") || category.equals("3") || category.equals("7")){
			label1 = "<span class=\"small\">Group Company CEO</span>";
			label2 = "<span class=\"small\">Director B&C</span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span>";
			//label3 = "<span class=\"small\">Executive Director</span>";
			label3 = "<span class=\"small\">COO (Publishing)</span>";
			//label4 = "<span class=\"small\">CEC & ED</span>";
			label4 = "<span class=\"small\">CEO (Publishing)</span>";
		}else{
			
			label1 = "<span class=\"small\">Sr VP Finance</span>"; 
			label2 = "<span class=\"small\">COO - E.P. - Finance</span>";
			label3 = "<span class=\"small\">MD / CEO</span>";
			label4 = "<span class=\"small\"></span>";
		}
    } else if(company.equals("1501")){

		label1 = "<span class=\"small\">Sr VP Finance</span>";
			label2 = "<span class=\"small\">COO - E.P. - Finance</span>";
			//label3 = "<span class=\"small\">MD / CEO</span>";
			label3 = "<span class=\"small\">MD'S Office</span>";
			label4 = "<span class=\"small\"></span>";	
	}
	else{
        label1  ="<span class=\"small\">Group Company CEO/COO</span>";
        label2 = "<span class=\"small\">Director B&C</span>";
        //label2 = "<span class=\"small\">Director B&C</span><span class=\"redsmall\" id=\"changeLabel2\"><br>(Delegated Authority)</span>";
        //label3 = "<span class=\"small\">Executive Director</span>";
        label3 = "<span class=\"small\">COO (Publishing)</span>";
        if(company.equals("1003")){
			label4 = "<span class=\"small\">Head - TIL</span>";
		}else if(company.equals("1004")){
			label4 = "<span class=\"small\">Head - TBS (Div of TIL)</span>";
		}else if(company.equals("1035")){
			label4 = "<span class=\"small\">Head - MRSL</span>";
		}else if(company.equals("1017")){
			label1 = "<span class=\"small\">CFO TIML</span>";
			label3 = "<span class=\"small\">CEO TIML</span>";
			//label4 = "<span class=\"small\">CEC & ED - BCCL</span>";
			label4 = "<span class=\"small\">CEO (Publishing)</span>";
		}else{
			//label4 = "<span class=\"small\">CEC & ED - BCCL</span>";
			label4 = "<span class=\"small\">CEO (Publishing)</span>";
		}
    }



%>

<table width="100%" cellspacing="2" cellpadding="2" border="0">
<tr>
 <td  align="left" width="15%"   class="normal"><span class="redsmall">*&nbsp;-&nbsp;mandatory</span></td>
</tr>
<%if (!deptGroup.equals("1026")){%>
  <tr height="30">
     <td  align="left" width="15%"  bgcolor="#fbf9f9" class="travelMenuBG">CATEGORY&nbsp;:&nbsp;</td>
	 <td colspan="4"  width="15%" bgcolor="#fbf9f9" class="travelMenuBG"><select class="small" id="category" name="category" onblur="arthaDisable();"onchange="changeApproverSec();">
		<option value="0">Select Category</option>
        <!-- <option value="NP & Logistics">NP & Logistics</option> -->
		<option value="IBO" <%if(category.equals("1")){%>selected<%}%> >IBO</option>
		<option value="Capex" <%if(category.equals("2")){%>selected<%}%> >Capex</option>
		<option value="IT buying" <%if(category.equals("3")){%>selected<%}%> >IT buying</option>
		<option value="Consumables" <%if(category.equals("4")){%>selected<%}%> >Consumables</option>
		<option value="Insurance" <%if(category.equals("5")){%>selected<%}%> >Insurance</option>
		<option value="Non conventional category" <%if(category.equals("6")){%>selected<%}%> >Non conventional category</option>
		<option value="Projects" <%if(category.equals("7")){%>selected<%}%> >Projects</option>
		<option value="OSP" <%if(category.equals("8")){%>selected<%}%> >OSP</option>
		<option value="Group Company related buying" <%if(category.equals("9")){%>selected<%}%> >Group Company related buying</option>
		<option value="Logistics" <%if(category.equals("10")){%>selected<%}%> >Logistics</option>

	</select><font size="3" color="red">&nbsp;&#42</font></td>

  </tr>
  <%}else {%>
  <tr height="30">
     <td  align="left" width="15%"  bgcolor="#fbf9f9" class="travelMenuBG">CATEGORY&nbsp;:&nbsp;</td>
	 <td colspan="4"  width="15%" bgcolor="#fbf9f9" class="travelMenuBG"><select class="small" id="category" name="category" onblur="arthaDisable();"onchange="changeApproverSec();">
		<option value="0">Select Category</option>
		<option value="Logistics" <%if(category.equals("10")){%>selected<%}%> >Logistics</option>

	</select><font size="3" color="red">&nbsp;&#42</font></td>

  </tr>
  <%}%>
  <tr>
    <td height="26" colspan="2" bgcolor="#fbf9f9" class="travelMenuBG">PC MEETING DETAILS</td>
    <td colspan="2" align="left" bgcolor="#fbf9f9" class="travelMenuBG">PROJECT DETAILS</td>
  </tr>
  <tr>
    <td width="18%" height="27" bgcolor="#fbf9f9"><span class="small" id="top">Negotiation/PC meeting date:</span></td>
    <td width="26%" align="left"><span class="small">
      <input name="requestedBy" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" />
    </span><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Description:</span></td>
    <td width="35%" align="left"><span class="small">


    <table width="100%" cellspacing="0" cellpadding="0" border="0">
	 <tr>
	  <td width="45%">
	  <textarea name="requestedBy2" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy2,'requestedBy2Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy2,'requestedBy2Description',100)"></textarea>
	  <input  name = "apprChk" id="apprChk" type="hidden" value="0" />
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy2Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Negotiation/PC meeting venue:</span></td>
    <td width="30%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%"><textarea name="reason4" rows="2" class="small" cols="19" onkeydown="textCounter(document.priceApprovalMain.reason4,'lineCountDescription',50)" onkeyup="textCounter(document.priceApprovalMain.reason4,'lineCountDescription',50)"></textarea></td>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="lineCountDescription" align="left" width="8%">50</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
		<!--<input name="lineCountDescription" class="style3" value="100" size="3" maxlength="3" readonly="readOnly" />-->
    </span></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Intended User/ User group:</span></td>
    <td width="35%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy3" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy3,'requestedBy3Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy3,'requestedBy3Description',100)"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy3Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
      </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><p class="small">Negotiated value (Rs):</p>
</td>
    <td width="26%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy7" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.requestedBy7,'requestedBy7Description',10)" onkeyup="textCounter(document.priceApprovalMain.requestedBy7,'requestedBy7Description',10); negValCheck(); setSelectedIndex();spaceAlert(document.priceApprovalMain.requestedBy7.value);hideShowMsg();"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy7Description" align="left" width="8%">10</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    <td valign="middle" width="21%" align="left" bgcolor="#fbf9f9" rowspan="2" class="normal"><span class="small">Project:</span></td>
    <td valign="middle" width="35%" align="left" rowspan="2"Description:><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%"  valign="middle">
	  <input name="requestedBy4" id="requestedBy4" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy4,'requestedBy4Description',100)" onkeyup="textCounter(document.priceApprovalMain.requestedBy4,'requestedBy4Description',100)"/>
	  <td width="3%"></td>
	  <td id="requestedBy4Description" align="left" width="8%">100</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>

  </tr>



<tr>
    <td bgcolor="#fbf9f9"><p class="small">Validity Period :</p></td>
    <td width="26%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="validity" class="small" maxlength="20" valign="middle" onkeydown="textCounter(document.priceApprovalMain.validity,'validityDescription',20)" onkeyup="textCounter(document.priceApprovalMain.validity,'validityDescription',20)"/>
	  <td width="3%"></td>
	  <td id="validityDescription" align="left" width="8%">20</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    
  </tr>



  <tr>

    <td bgcolor="#fbf9f9"><span class="small">Finalized vendor(s) name :</span></td>
    <td width="26%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy8" class="small" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.requestedBy8,'requestedBy8Description',50)" onkeyup="textCounter(document.priceApprovalMain.requestedBy8,'requestedBy8Description',50)"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy8Description" align="left" width="8%">50</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Total Budget (Rs.) / Sanction:</span></td>
    <td width="35%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy5" id="requestedBy5" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.requestedBy5,'requestedBy5Description',10)" onkeyup="textCounter(document.priceApprovalMain.requestedBy5,'requestedBy5Description',10);autoFillBalanceBudget();spaceAlert(document.priceApprovalMain.requestedBy5.value);"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy5Description" align="left" width="8%">10</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Payment terms:</span></td>
    <td width="26%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <textarea name="reason" rows="2" class="small" cols="19" onkeydown="textCounter(document.priceApprovalMain.reason,'reasonDescription',150)" onkeyup="textCounter(document.priceApprovalMain.reason,'reasonDescription',150)"></textarea>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="reasonDescription" align="left" width="8%">150</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
      </span></td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">PO's Commited till date (Rs.)</span></td>
    <td width="35%" align="left"><span class="small">
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="fqtNumber" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.fqtNumber,'fqtNumberDescription',10)" onkeyup="textCounter(document.priceApprovalMain.fqtNumber,'fqtNumberDescription',10);autoFillBalanceBudget();spaceAlert(document.priceApprovalMain.fqtNumber.value);"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="fqtNumberDescription" align="left" width="8%">10</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
      </span></td>
  </tr>
  <tr>


	<td bgcolor="#fbf9f9"><span class="small">Hard Savings (Rs):</span></td>
    <td width="26%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy9" class="small" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.requestedBy9,'requestedBy9Description',10)" onkeyup="textCounter(document.priceApprovalMain.requestedBy9,'requestedBy9Description',10);savingsChk();spaceAlert(document.priceApprovalMain.requestedBy9.value);"/>
	  <td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
	  <td id="requestedBy9Description" align="left" width="8%">10</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>

    <td width="21%" rowspan="2" height="26" align="left" valign="middle" bgcolor="#fbf9f9" class="small">Balance Budget (Rs.)</td>
    <td valign="middle" rowspan="2" width="35%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%" >
	  <input name="requestedBy6" class="small" maxlength="10" readonly="readonly" />
	  <!-- onkeydown="textCounter(document.priceApprovalMain.requestedBy6,'requestedBy6Description',20)" onkeyup="textCounter(document.priceApprovalMain.requestedBy6,'requestedBy6Description',20)" -->
	  <td width="3%"></td>
	  <td id="requestedBy6Description" align="left" width="8%"><!-- 20 --></td>
	  <td align="left"><!-- Chars Left --></td>
	  </tr>
	  </table>
    </span></td>
  </tr>
  <tr>
    <td bgcolor="#fbf9f9"><span class="small">Cost Avoidance (Rs):</span></td>
    <td width="26%" align="left"><span class="small">
      <table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
	  <td width="45%">
	  <input name="requestedBy10" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.requestedBy10,'requestedBy10Description',10)" onkeyup="textCounter(document.priceApprovalMain.requestedBy10,'requestedBy10Description',10);savingsChk();spaceAlert(document.priceApprovalMain.requestedBy10.value);"/>
	  <td width="3%"></td>
	  <td id="requestedBy10Description" align="left" width="8%">10</td>
	  <td align="left">Chars Left</td>
	  </tr>
	  </table>
    </span></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">
 <tr>
    <td height="22" bgcolor="#ffffff" class="travelMenuBG">BACKGROUND</td>
  </tr>
  <tr>
  <td  align="left" width="100%" valign="top"><textarea name="req" id="req" cols="35" rows="9" maxlength="3000" onkeydown="textCounter(document.priceApprovalMain.req,'reqChar',3000)" onkeyup="textCounter(document.priceApprovalMain.req,'reqChar',3000)" style ="height:130px;width:99%"></textarea>
		<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="reqChar" width="3%" class="small">3000</td><td class="small">Chars Left</td></tr></table></div>
	</td>
	</tr>
</table>
<table width="100%" cellspacing="2" cellpadding="2">
<tbody id="inputtable">
  <tr class="greyBG">
	<td width="13%" height="29" >VENDOR</td>
    <td width="9%" align="left">INITIAL OFFER (Rs)</td>
    <td width="9%" align="left">FINAL OFFER (Rs)</td>
    <td width="10%" align="left">DELIVERY / COMPLETION PERIOD</td>
<!--     <td width="4%" align="left">Warranty/ Defect Liability Period</td>
 -->    <td width="13%" align="left">PAYMENT TERMS</td>
    <td width="13%" align="left">VALUE ADD</td>
	</tr>
  <tr>
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="v1" cols="25"  rows="2" class="small" maxlength="50" onkeydown="textCounter(document.priceApprovalMain.v1,'vendorChar',50)" onkeyup="textCounter(document.priceApprovalMain.v1,'vendorChar',50)" ></textarea>
	  </span>

	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vendorChar" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="i1" id="i1"cols="10"  rows="2" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.i1,'initChar',10)" onkeyup="textCounter(document.priceApprovalMain.i1,'initChar',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.i1.value);"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="initChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="f1"  id="f1" rows="2" cols="10" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.f1,'finOffChar',10)" onkeyup="textCounter(document.priceApprovalMain.f1,'finOffChar',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.f1.value);"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="finOffChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="d1" rows="2" class="small" maxlength="30"  onkeydown="textCounter(document.priceApprovalMain.d1,'dcpChar',30)" onkeyup="textCounter(document.priceApprovalMain.d1,'dcpChar',30)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="dcpChar" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

<!--     <td height="25" valign="top" align="left"><span class="small">
      <textarea name="w1" rows="2" class="small" maxlength="30"   onkeydown="textCounter(document.priceApprovalMain.w1,'wdlChar',30)" onkeyup="textCounter(document.priceApprovalMain.w1,'wdlChar',30)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="wdlChar" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td> -->
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="pt1" rows="2" class="small" cols="20" maxlength="120"   onkeydown="textCounter(document.priceApprovalMain.pt1,'ptChar1',120)" onkeyup="textCounter(document.priceApprovalMain.pt1,'ptChar1',120)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="ptChar1" width="10%" class="small">120</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="va1" rows="2" class="small" maxlength="225" cols="20"  onkeydown="textCounter(document.priceApprovalMain.va1,'vaChar1',225)" onkeyup="textCounter(document.priceApprovalMain.va1,'vaChar1',225)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vaChar1" width="10%" class="small">225</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	

  </tr>
  <tr>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="v2" cols="25" class="small" size="15" maxlength="50" onkeydown="textCounter(document.priceApprovalMain.v2,'vendorChar2',50)" onkeyup="textCounter(document.priceApprovalMain.v2,'vendorChar2',50)" ></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vendorChar2" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>


    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="i2" cols="10" id="i2"class="small"  size="10" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.i2,'initChar2',10)" onkeyup="textCounter(document.priceApprovalMain.i2,'initChar2',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.i2.value);" ></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="initChar2" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="f2" id="f2"class="small" cols="10"  size="10" maxlength="10"    onkeydown="textCounter(document.priceApprovalMain.f2,'finChar2',10)" onkeyup="textCounter(document.priceApprovalMain.f2,'finChar2',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.f2.value);" ></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="finChar2" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="d2" rows="2" class="small" maxlength="30" onkeydown="textCounter(document.priceApprovalMain.d2,'dcpChar2',30)" onkeyup="textCounter(document.priceApprovalMain.d2,'dcpChar2',30)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="dcpChar2" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
<!--     <td height="25" valign="top" align="left"><span class="small">
      <textarea name="w2" rows="2" class="small" maxlength="30" onkeydown="textCounter(document.priceApprovalMain.w2,'wdlChar2',30)" onkeyup="textCounter(document.priceApprovalMain.w2,'wdlChar2',30)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="wdlChar2" width="10%" class="small">30</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td> -->
	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="pt2" rows="2" class="small" maxlength="120" cols="20"  onkeydown="textCounter(document.priceApprovalMain.pt2,'ptChar2',120)" onkeyup="textCounter(document.priceApprovalMain.pt2,'ptChar2',120)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="ptChar2" width="10%" class="small">120</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="va2" rows="2" class="small" maxlength="225" cols="20"  onkeydown="textCounter(document.priceApprovalMain.va2,'vaChar2',225)" onkeyup="textCounter(document.priceApprovalMain.va2,'vaChar2',225)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="vaChar2" width="10%" class="small">225</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
  </tr>
   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="add" onclick="addRow()" class="bold">
   <input type="button" value="  Remove Row   " name="add" onclick="delRow()" class="bold"></td></tr>
   <input type="hidden" name="count" value="2" />	

 </table>
<table width="100%" bgcolor="#ffffff" border="0" cellpadding="2" cellspacing="2">
<tr>
    <td width="55%" height="50" colspan="1" bgcolor="#ffffff" class="travelMenuBG">RECOMMENDATION</td>
	<td width="45%" height="25" colspan="2" class="travelMenuBG">ATTACHMENTS<span class="redsmall">&#42&nbsp;(atleast one discription and attachment is mandatory)</span></td>
  </tr>
<tr>
 <td  width="55%" height ="25" rowspan="4" align="left" valign="middle"><textarea name="recommendation" id="recommendation" maxlength="3000" cols="55" rows="12" onkeydown="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" onkeyup="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" style ="height:170px;width:96%"></textarea><div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="recommendationChar" width="3%" class="small">3000</td><td class="small">&nbsp;Chars Left</td></tr></table></div></td>
 
  <td width="22%" height="25" align="left" valign="top" class="greyBG">DESCRIPTION</td>
    <td width="22%" height="25" align="left" valign="top" class="greyBG">ATTACH</td> 
	</tr>
	<tr>
	 <td  height="22" align="left" valign="top"><span class="small">
	  <select name="reason1" class="small" id="reason1">
         <option value="NA">Select Description</option>
         <option value="Comparative chart">Comparative chart</option>
		 <option value="Final recommended summary">Final recommended summary</option>
		 <option value="Others">Others</option>
	  </select>
   
    </span><span class="redsmall">&#42&nbsp;</span></td>

    <td height="22" align="left" valign="top"><textarea name="attach1" type="text" cols="20" class="small" id="attach1" value="" readonly="readonly"></textarea><a href="#" onclick="upload('attach1')"><img src="images/attachment.gif" border="0" /></a><span class="redsmall" valign="top">&#42&nbsp;</span><a href="javascript:void(0)" onclick="delAttach1('1')"><img src="images/delete.gif" border="0" /></a><input name="attach1New" type="hidden" id="attach1New" value="" /></td>
	</tr>
	<tr>
    <td height="22" valign="top" align="left"><span class="small">
	<select name="reason2" class="small" id="reason2">
	    <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
     
    </span></td>
    <td height="22" valign="top" align="left"><textarea name="attach2" type="text" cols="20" class="small" id="attach2" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach2')"><img src="images/attachment.gif" border="0" /></a><input name="attach2New" type="hidden" id="attach2New" value="" /><a href="javascript:void(0)" onclick="delAttach1('2')"><img src="images/delete.gif" border="0" /></a></td>
	</tr>
	
	<tr>
	
	 <td height="22" valign="top" align="left"><span class="small">
	 <select name="reason3" id="reason3" class="small">
       <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
    </span></td>
    <td height="22" valign="top" align="left"><textarea name="attach3" type="text" cols="20" class="small" id="attach3" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach3')"><img src="images/attachment.gif" border="0" /></a><input name="attach3New" type="hidden" id="attach3New" value="" /><a href="javascript:void(0)" onclick="delAttach1('3')"><img src="images/delete.gif" border="0" /></a>
	</td> 
	</tr>
	<tr>
	<td height="22" valign="top" align="left"><span class="small">  
	 <td height="22" valign="top" align="left"><span class="small">
	 <select name="reason44" id="reason44" class="small">
       <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
    </span></td>

    <td height="22" valign="top" align="left"><textarea name="attach4" type="text" cols="20" class="small" id="attach4" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach4')"><img src="images/attachment.gif" border="0" /></a><input name="attach4New" type="hidden" id="attach4New" value="" /><a href="javascript:void(0)" onclick="delAttach44()"><img src="images/delete.gif" border="0" /></a>
	</td>
	</tr>
  <tr>
   <td colspan="5" align="left" valign="middle" class="travelMenuBG">Additional Attachments</td>
     </tr>
	<tr>
<table>
<tr>
<td height="22" valign="top" align="left"><span class="small"></td>
	 <td height="22" valign="top" align="left"><span class="small">
	 <select name="reason5" id="reason5" class="small">
       <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
    </span></td>
<td height="22" valign="top" align="left"><span class="small">&nbsp;&nbsp;&nbsp;&nbsp;</td>
   <td height="22" valign="top" align="left"><textarea name="attach5" type="text" cols="20" class="small" id="attach5" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach5')"><img src="images/attachment.gif" border="0" /></a><input name="attach5New" type="hidden" id="attach5New" value="" /><a href="javascript:void(0)" onclick="delAttach1('5')"><img src="images/delete.gif" border="0" /></a>
	</td>


<td height="22" valign="top" align="left"><span class="small"></td>
	 <td height="22" valign="top" align="left"><span class="small">
	 <select name="reason6" id="reason6" class="small">
       <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
    </span></td>
<td height="22" valign="top" align="left"><span class="small">&nbsp;&nbsp;&nbsp;&nbsp;</td>
   <td height="22" valign="top" align="left"><textarea name="attach6" type="text" cols="20" class="small" id="attach6" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach6')"><img src="images/attachment.gif" border="0" /></a><input name="attach6New" type="hidden" id="attach6New" value="" /><a href="javascript:void(0)" onclick="delAttach1('6')"><img src="images/delete.gif" border="0" /></a>
	</td>
<td height="22" valign="top" align="left"><span class="small">
	 <td height="22" valign="top" align="left"><span class="small">
	 <select name="reason7" id="reason7" class="small">
       <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
    </span></td>

<td height="22" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

    <td height="22" valign="top" align="left"><textarea name="attach7" type="text" cols="20" class="small" id="attach7" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach7')"><img src="images/attachment.gif" border="0" /></a><input name="attach7New" type="hidden" id="attach7New" value="" /><a href="javascript:void(0)" onclick="delAttach1('7')"><img src="images/delete.gif" border="0" /></a>
	</td> 
</tr>
</table>
</tr>
<table>
	<tr>
	<td height="22" valign="top" align="left"><span class="small">
	 <td height="22" valign="top" align="left"><span class="small">
	 <select name="reason8" id="reason8" class="small">
       <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
    </span></td>
<td height="22" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td height="22" valign="top" align="left"><textarea name="attach8" type="text" cols="20" class="small" id="attach8" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach8')"><img src="images/attachment.gif" border="0" /></a><input name="attach8New" type="hidden" id="attach8New" value="" /><a href="javascript:void(0)" onclick="delAttach1('8')"><img src="images/delete.gif" border="0" /></a>
	</td> 
	<td height="22" valign="top" align="left"><span class="small">
	 <td height="22" valign="top" align="left"><span class="small">
	 <select name="reason9" id="reason9" class="small">
       <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
    </span></td>
<td height="22" valign="top" align="left"><span class="small">&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td height="22" valign="top" align="left"><textarea name="attach9" type="text" cols="20" class="small" id="attach9" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach9')"><img src="images/attachment.gif" border="0" /></a><input name="attach9New" type="hidden" id="attach9New" value="" /><a href="javascript:void(0)" onclick="delAttach1('9')"><img src="images/delete.gif" border="0" /></a>
	</td>

<td height="22" valign="top" align="left"><span class="small">
	 <td height="22" valign="top" align="left"><span class="small">
	 <select name="reason10" id="reason10" class="small">
       <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
    </span></td>
<td height="22" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td height="22" valign="top" align="left"><textarea name="attach10" type="text" cols="20" class="small" id="attach10" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach10')"><img src="images/attachment.gif" border="0" /></a><input name="attach10New" type="hidden" id="attach10New" value="" /><a href="javascript:void(0)" onclick="delAttach1('10')"><img src="images/delete.gif" border="0" /></a>
	</td> 
	</tr>
</table>
	<tr>
 
	</tr>
	<tr>
	
	</tr>
	<tr>
	<!-- <td height="22" valign="top" align="left"><span class="small">
	 <td height="22" valign="top" align="left"><span class="small">
	 <select name="reason10" id="reason10" class="small">
       <option value="NA">Select Description</option>
        <option value="Comparative chart">Comparative chart</option>
		<option value="Final recommended summary">Final recommended summary</option>
		<option value="Others">Others</option>
	  </select>
   
    </span></td>
    <td height="22" valign="top" align="left"><textarea name="attach10" type="text" cols="20" class="small" id="attach10" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach10')"><img src="images/attachment.gif" border="0" /></a><input name="attach10New" type="hidden" id="attach10New" value="" />
	</td> --> 
	</tr>
 </table>


<table width="100%" cellspacing="2" cellpadding="2">
<!-- <tbody id="inputtable1"> -->
  <tr>
   <!--  <td height="32"  colspan="2" valign="middle" class="travelMenuBG">ATTACHMENTS</td> -->
    <td colspan="5" align="left" valign="middle" class="travelMenuBG">BENCHMARKING</td>
    <!-- <td width="10"  valign="middle" class="travelMenuBG">RECOMMENDATION</td> -->
  </tr>
  <tr>
   <!--  <td width="12%" height="25" align="left" valign="top" class="greyBG">DESCRIPTION</td>
    <td width="15%" height="25" align="left" valign="top" class="greyBG">ATTACH</td> -->
    <td width="13%" valign="left" valign="top" class="greyBG">VENDOR NAME</td>
    <td width="12%" valign="left" valign="top" class="greyBG">PRODUCT/SERVICE</td>
    <td width="8%" valign="left" valign="top" class="greyBG">RATE (Rs.)</td>
    <td width="8%" align="left" valign="top" class="greyBG">UOM</td>
    <td width="13%" valign="left" valign="top" class="greyBG">REMARKS</td>
    <!-- <td align="left" valign="top" class="greyBG">Benchmark Rate</td> -->
   
  </tr>
  <tr>
   <!--  <td  height="25" align="left" valign="top"><span class="small">
      <textarea name="reason1" rows="2" cols="28" class="small" cols="20" maxlength="50"></textarea>
    </span></td>

    <td height="25" align="left" valign="top"><textarea name="attach1" type="text" cols="7" class="small" id="attach1" value="" readonly="readonly"></textarea><a href="#" onclick="upload('attach1')"><img src="images/attachment.gif" border="0" /></a><input name="attach1New" type="hidden" id="attach1New" value="" /></td> -->


    <td valign="top" align="left"><span class="small">
      <textarea name="compName1" class="small" cols="28" id="compName1"  size="25" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.compName1,'cNChar1',100)" onkeyup="textCounter(document.priceApprovalMain.compName1,'cNChar1',100)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cNChar1" width="10%" class="small">100</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>


    <td  align="left" valign="top" class="small"><textarea name="reason14" rows="2" class="small" cols="28" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.reason14,'pncChar',50)" onkeyup="textCounter(document.priceApprovalMain.reason14,'pncChar',50)"  ></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="pncChar" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td  align="left" valign="top"><span class="small">
      <textarea name="fromDateAir1" class="small" id="fromDateAir1" cols="10"  size="10" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.fromDateAir1,'rateChar',10)" onkeyup="textCounter(document.priceApprovalMain.fromDateAir1,'rateChar',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.fromDateAir1.value);" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rateChar" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
    
	<td  align="left" valign="top">
	<span class="small">
      <textarea name="UOM1" class="small" id="UOM1"  rows="2" cols="15" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.UOM1,'UOM1Char',15)" onkeyup="textCounter(document.priceApprovalMain.UOM1,'UOM1Char',15)" ></textarea>
    </span>
	
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="UOM1Char" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>	

	<td  align="left" valign="top" class="small"><textarea name="rem1" rows="2" class="small" cols="28" maxlength="200"  onkeydown="textCounter(document.priceApprovalMain.rem1,'rem1Char',200)" onkeyup="textCounter(document.priceApprovalMain.rem1,'rem1Char',200)"  ></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rem1Char" width="10%" class="small">200</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>


  </tr>
    <tr>
   <!--  <td height="25" valign="top" align="left"><span class="small">
      <textarea name="reason2" rows="2" cols="28" class="small" cols="20" maxlength="50"></textarea>
    </span></td>
    <td height="25" valign="top" align="left"><textarea name="attach2" type="text" cols="7" class="small" id="attach2" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach2')"><img src="images/attachment.gif" border="0" /></a><input name="attach2New" type="hidden" id="attach2New" value="" /></td> -->
	<td valign="top" align="left"><span class="small">
      <textarea name="compName2" class="small" cols="28" id="compName2"  size="25" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.compName2,'cNChar2',100)" onkeyup="textCounter(document.priceApprovalMain.compName2,'cNChar2',100)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cNChar2" width="10%" class="small">100</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
	<td valign="top" align="left"><span class="small">
      <textarea name="reason15" rows="2" class="small" cols="28" maxlength="50" onkeydown="textCounter(document.priceApprovalMain.reason15,'pncChar2',50)" onkeyup="textCounter(document.priceApprovalMain.reason15,'pncChar2',50)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="pncChar2" width="10%" class="small" >50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
    <td valign="top" align="left"><span class="small">
      <textarea name="fromDateAir2" class="small" id="fromDateAir2" cols="10"  size="10" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.fromDateAir2,'rateChar2',10)" onkeyup="textCounter(document.priceApprovalMain.fromDateAir2,'rateChar2',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.fromDateAir2.value);" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rateChar2" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>



	<td  align="left" valign="top">
	<span class="small">
      <textarea name="UOM2" class="small" id="UOM2"  rows="2" cols="16" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.UOM2,'UOM2Char',15)" onkeyup="textCounter(document.priceApprovalMain.UOM2,'UOM2Char',15)" ></textarea>
    </span>
	
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="UOM2Char" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
	<td align="left" valign="top" class="small"><textarea name="rem2" rows="2" class="small" cols="28" maxlength="200"  onkeydown="textCounter(document.priceApprovalMain.rem2,'rem2Char',200)" onkeyup="textCounter(document.priceApprovalMain.rem2,'rem2Char',200)"  ></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rem2Char" width="10%" class="small">200</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

  </tr>
  <tr>
    <!-- <td height="36" valign="top" align="left"><span class="small">
      <textarea name="reason3" rows="2" cols="28" class="small" cols="20" maxlength="50"></textarea>
    </span></td>
    <td height="36" valign="top" align="left"><textarea name="attach3" type="text" cols="7" class="small" id="attach3" value="" readonly="readonly" ></textarea><a href="#" onclick="upload('attach3')"><img src="images/attachment.gif" border="0" /></a><input name="attach3New" type="hidden" id="attach3New" value="" />
	</td> -->
	<td valign="top" align="left"><span class="small">
      <textarea name="compName3" class="small" cols="28" id="compName3"  size="25" maxlength="100" onkeydown="textCounter(document.priceApprovalMain.compName3,'cNChar3',100)" onkeyup="textCounter(document.priceApprovalMain.compName3,'cNChar3',100)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cNChar3" width="10%" class="small">100</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td valign="top" align="left"><span class="small">
      <textarea name="reason16" rows="2" class="small" maxlength="50" cols="28" onkeydown="textCounter(document.priceApprovalMain.reason16,'pncChar3',50)" onkeyup="textCounter(document.priceApprovalMain.reason16,'pncChar3',50)" ></textarea>
    </span>
    <div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="pncChar3" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td valign="top" align="left"><span class="small">
      <textarea name="fromDateAir3" class="small" id="fromDateAir3" cols="10" size="10" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.fromDateAir3,'rateChar3',10)" onkeyup="textCounter(document.priceApprovalMain.fromDateAir3,'rateChar3',10);validateNumericData(this.id, this.value);spaceAlert(document.priceApprovalMain.fromDateAir3.value);" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rateChar3" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td  align="left" valign="top">
	<span class="small">
      <textarea name="UOM3" class="small" id="UOM3"  rows="2" cols="16" maxlength="15"  onkeydown="textCounter(document.priceApprovalMain.UOM3,'UOM3Char',15)" onkeyup="textCounter(document.priceApprovalMain.UOM3,'UOM3Char',15)" ></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="UOM3Char" width="10%" class="small">15</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
	<td  align="left" valign="top" class="small"><textarea name="rem3" rows="2" cols="28" class="small" maxlength="200"  onkeydown="textCounter(document.priceApprovalMain.rem3,'rem3Char',200)" onkeyup="textCounter(document.priceApprovalMain.rem3,'rem3Char',200)"  ></textarea>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="rem3Char" width="10%" class="small">200</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

  </tr>
<!-- </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="add" onclick="addRow1()" class="bold">
   <input type="button" value="  Remove Row   " name="add" onclick="delRow1()" class="bold"></td></tr>
   <input type="hidden" name="count1" value="3" />	
 --></table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">

  <tr>
   <!--  <td height="22" bgcolor="#ffffff" class="travelMenuBG">SUPPORTED BY</td> -->
  </tr>
</table>
<!-- <table width="100%" cellspacing="2" cellpadding="2">
  <tr >
    <td width="18%" bgcolor="#fbf9f9" class="small" >AUTHORITY</td>
    <td width="34%" height="29" bgcolor="#fbf9f9" class="small" >
	 <select name="sbd1" class="small" id="sbd1">
      <option value="0">Select</option>
	  <option value="28476">Sachin Mehta</option>
	  <option value="31321">Sudhir Kamath</option>
	  <option value="11934">Ashok Raparia</option>
	  <option value="27031">Puneet Suri</option>
	  <option value="5785">Sidhant Khosla</option>
	  <option value="3459">Mohit Jain</option>
	  <option value="2889">Sanjeev Vohra</option>
	  <option value="57">CR Srinivasan</option>
	  <option value="21929">Thiyagarajan Kumar</option>
	  <option value="11112">Sanjay Singh</option>
	  <option value="109">Sujoy Ghosh</option>
	  <option value="27760">Nandan Srinath</option>
	  <option value="2696">Ranjeet Kate</option>
	  <option value="323">Debashish Ghosh</option>
	  <option value="30898">Sanat Hazra</option>
	  <option value="32055">Shrenik Khasgiwala</option>
	  <option value="21184">Sanjeev Shah</option>
	  <option value="19513">Amit Rai</option>
	  <option value="112">Shashank Chavan</option>
	  <option value="20411">Shyam Shanker</option>
	  <option value="5459">Ashish Bhushan</option>
	  <option value="38849">Joy Chakraborthy</option>
	  <option value="38758">Sameer Sainani</option>
	  <option value="91">V S Sundaram</option>
      </select></td>
    <td width="14%" align="left" bgcolor="#fbf9f9" class="small">AUTHORITY</td>
    <td width="34%" align="left" bgcolor="#fbf9f9"><span class="small">
      <select name="sbd2" class="small" id="sbd2">
        <option value="0">Select</option>
	  <option value="28476">Sachin Mehta</option>
	  <option value="31321">Sudhir Kamath</option>
	  <option value="11934">Ashok Raparia</option>
	  <option value="27031">Puneet Suri</option>
	  <option value="5785">Sidhant Khosla</option>
	  <option value="3459">Mohit Jain</option>
	  <option value="2889">Sanjeev Vohra</option>
	  <option value="57">CR Srinivasan</option>
	  <option value="21929">Thiyagarajan Kumar</option>
	  <option value="11112">Sanjay Singh</option>
	  <option value="109">Sujoy Ghosh</option>
	  <option value="27760">Nandan Srinath</option>
	  <option value="2696">Ranjeet Kate</option>
	  <option value="323">Debashish Ghosh</option>
	  <option value="30898">Sanat Hazra</option>
	  <option value="32055">Shrenik Khasgiwala</option>
	  <option value="21184">Sanjeev Shah</option>
	  <option value="19513">Amit Rai</option>
	  <option value="112">Shashank Chavan</option>
	  <option value="20411">Shyam Shanker</option>
	  <option value="5459">Ashish Bhushan</option>
	  <option value="38849">Joy Chakraborthy</option>
	  <option value="38758">Sameer Sainani</option>
	  <option value="91">V S Sundaram</option>
      </select>
    </span></td>
  </tr>
</table>
 --><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="52%" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="2" cellspacing="2">
     
      <tr>
        <td height="22" bgcolor="#ffffff" class="travelMenuBG">APPROVALS</td>
        </tr>
    </table>
      <table  border = "0" width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">

		<% if(company.equals("1033")){%>
			<td width="12%" >Artha  Procurement<span class="small"></span><span class="redsmall"><br> (All approvers are mandatory)</span></td>
		<% }else if((company.equals("1005") || company.equals("1006")) && (!(category.equals("9")|| category.equals("7") || category.equals("3")) )) {%>
			<td width="12%" >Requisitioner<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span></td>
<%		}else if((company.equals("1501")) ) {%>
			<td width="12%" >Requisitioner<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span></td>
<%		}else if(company.equals("1000") && deptGroup.equals("1026"))  {%>
			<td width="12%" >User<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span></td>
<%		}else {%> 
			<td width="12%" >B&amp;C<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span></td>
<%		}%>

		
          
          <% if((company.equals("1005") || company.equals("1006")) && (!(category.equals("9")|| category.equals("7") || category.equals("3")) ) ) {%>

	   <td width="12%" height="29" >HOD<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span><span class="small"></span>&nbsp;</span></td>

          <td width="11%" align="left" colspan="2">&nbsp;Commercial<br><span class="redsmall" id="negval"><span class="small"></span>&nbsp;</span></td>

<%		}else if((company.equals("1501")) )  {%>

	   <td width="12%" height="29" >HOD<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span><span class="small"></span>&nbsp;</span></td>

          <td width="11%" align="left" colspan="2">&nbsp;Commercial<br><span class="redsmall" id="negval"><span class="small"></span>&nbsp;</span></td>

<%		}else if(company.equals("1000") && deptGroup.equals("1026"))   {%>

			<td width="12%" height="29" >B&amp;C<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span><span class="small"></span>&nbsp;</span></td>

          <td width="11%" align="left" colspan="2">&nbsp;Supported By<br><span class="redsmall" id="negval"><span class="small"></span>&nbsp;</span></td>

<%		} else {%>

          <td width="12%" height="29" >User<span class="small"></span><span class="redsmall"><span class="small"></span>&nbsp;</span></td>

          <td width="11%" align="left" colspan="2">&nbsp;Supported By<br><span class="redsmall" id="negval">&#42&nbsp;(for Negotiated value >= 1999999)</span><!-- <span class="redsmall"><span class="small"></span>&nbsp; (all are mandatory)</span> --></td>

<%		}%>

          
          <td width="12%" align="left"><%=label1%><!-- <span class="small" id="changeLabel1">Director B&C</span><br><span class="redsmall" id="changeLabel2">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span> --></td>
          <td width="12%" align="left"><%=label2%><!-- <span class="small" id="changeLabel3">EP Supply Chain</span> --></td>
          <td width="12%" align="left"><%=label3%><!-- <span class="small" id="changeLabel4">COO</span> --></td>
          <td width="12%" align="left"><%=label4%><!-- <span class="small">CEO</span> --></td>

    <% if((company.equals("1005") || company.equals("1006")) && (!(category.equals("9")|| category.equals("7") || category.equals("3")) )){%>
		<td width="12%" align="left"><span class="small"></span></td>
	<% }else{%>

          <td width="12%" align="left"><span class="small">Managing Director </span></td>

	<% }%>

        </tr>
		<tr>
		<td colspan="2">&nbsp;</td>
		<td class = "small" height = "15" >&nbsp;<b>Name</b>
		</td>
		<td class = "small" height = "15" >&nbsp;<b>Role</b>
		</td>
		
		</tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app1" id="app1" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app1H" id="app1H" type="hidden" value="" />
		  </td>

			<td class = "normal" height = "25"  align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" >
			 <input  name = "app2H" id="app2H" type="hidden" value="" />
		  </td>

          
		  </td>
          <!-- <td class = "normal" height = "25"  align="left"><input type = "text" name = "app3" id="app3" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app3H" id="app3H" type="hidden" value="" />
			  
            	  

			  
		  </td> -->

<%
		ArrayList approverList   = new ArrayList();
		String str          = ""; 
		int i = 0;
        String roleType     ="";
        String selected="";
        Hashtable approverData  = new Hashtable();
%>

			<td  class = "normal"  height = "25" align="left" >
		 <input type = "text" name = "app11" id="app11"  class = "normal" size="26" onClick="addUser('approvedby',this.id)" >
		<input  name = "app11H" id="app11H" type="hidden" value="" /></td>

		 

<%		if(company.equals("1017")){%>
			<td class = "normal" height = "25" align="left">VP -Finance TIML</td>
			
<%		}else{%>
			<td class = "normal" height = "25" align="left">HR/Personnel</td>
<%		}%>
		 
<%/* out.println(app6);
   if (app5.contains("Shreedhar") || app5.contains("Ayesha"))
	   {
		out.println("jjjj");
		app5="MDS Office";
	   }else{
		   app5 = app5;
	   }*/
	%>
<% if((company.equals("1005") || company.equals("1006")) && (category.equals("9")|| category.equals("7") || category.equals("3") )){%>
		   
<!-- 		<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select14" class="small" id="select14" style="width:130px;">
		<option value="0">Select</option>
      	  <%=app6%>
      </select></span></td>
	  
	  
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
        <select name="select15" class="small" id="select15" style="width:130px;">
		<option value="0">Select</option>
	  <%=app7%>
      </select></span></td> -->
	            <td rowspan="3" align="left" valign="top" class="small"><span class="boldunderline_small">
            <select name="select12" class="small" id="select12" style="width:130px;">
        <option value="0">Select</option>
	  <!-- <option value="20411">Shyam Shanker</option> -->
            <%=app4%>
	  </select>
			</span></td>
          <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
		<select name="select13" class="small" id="select13" style="width:130px;">
		<option value="0">Select</option>	
	  <!-- <option value="3459">Mohit Jain</option> -->
	   <%=app5%>
	   </select> </span></td>
         
		<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select14" class="small" id="select14" style="width:130px;">
		<option value="0">Select</option>
      	  <!-- <option value="31891">Shrijeet Mishra</option> -->
      	  <%=app6%>
      </select></span></td>
		<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select15" class="small" id="select15" style="width:130px;">
		<option value="0">Select</option>
      	  <!-- <option value="48795">Raj Jain</option> -->	
	  <%=app7%>
      </select></span></td>
	
<%}else{%>

   
          <td rowspan="3" align="left" valign="top" class="small"><span class="boldunderline_small">
            <select name="select12" class="small" id="select12" style="width:130px;">
        <option value="0">Select</option>
	  <!-- <option value="20411">Shyam Shanker</option> -->
            <%=app4%>
	  </select>
			</span></td>
          <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
		<select name="select13" class="small" id="select13" style="width:130px;">
		<option value="0">Select</option>	
	  <!-- <option value="3459">Mohit Jain</option> -->
	   <%=app5%>
	   </select> </span></td>
         
		<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select14" class="small" id="select14" style="width:130px;">
		<option value="0">Select</option>
      	  <!-- <option value="31891">Shrijeet Mishra</option> -->
		 <%=app6%>
      </select></span></td>
		<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select15" class="small" id="select15" style="width:130px;">
		<option value="0">Select</option>
      	  <!-- <option value="48795">Raj Jain</option> -->	
	  <%=app7%>
      </select></span></td>
	
<%}%>

		<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
	  <select name="select16" class="small" id="select16" style="width:130px;">
       <option value="0">Select</option>
      <option value="29616">Vineet Jain</option>
      </select></span>
	  </td> 

	 
        </tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20" onClick="addUser('approvedby',this.id)" >
			  <input  name = "app4H" id="app4H" type="hidden" value="" />
		 </td>

	
			 <td class = "normal" height = "25"  align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app5H" id="app5H" type="hidden" value="" />
		  </td>

         
     

		
		<td  class = "normal"  height = "25" align="left">
		 <input type = "text" name = "app12" id="app12"  class = "normal" size="26" onClick="addUser('approvedby',this.id) ">
		<input  name = "app12H" id="app12H" type="hidden" value="" /></td>
			

		  

<%		if(company.equals("1017")){%>
			<td class = "normal" height = "25" align="left">EVP TIML</td>
			
<%		}else if((company.equals("1005") || company.equals("1006")) && (!(category.equals("9")|| category.equals("7") || category.equals("3")) )){%>
			<td class = "normal" height = "25" align="left">BUDGET TEAM</td>
			
<%		}else if(company.equals("1501") ){%>
			<td class = "normal" height = "25" align="left">BUDGET TEAM</td>
			
<%		}else{%>
			 <td class = "normal" height = "25" align="left">Branch Head</td>
<%		}%>

       </tr>
        <tr class="small">
          <td class = "normal" height = "25" align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app7H" id="app7H" type="hidden" value="" />
		  </td>
 
			 <td class = "normal" height = "25"  align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app8H" id="app8H" type="hidden" value="" />

		  </td>
         <!--  <td class = "normal" height = "25"  align="left"><input type = "text" name = "app9" id="app9" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app9H" id="app9H" type="hidden" value="" />
		  </td>
		  <td class = "normal" height = "25" align="left"> HR/Personnel  </td> -->

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




		  
        </tr>

		<tr class="small">
		  <td colspan="2" >&nbsp;</td>
          <!-- <td  class = "normal"  height = "25" align="left"><input type = "text" name = "app10" id="app10"  class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app10H" id="app10H" type="hidden" value="" />
		  </td>
		  <td class = "normal" height = "25" width="10%" align="left">Branch Head</td> -->

 
			<td class = "normal" height = "25"  align="left" >
		  <select name = "app6" id="app6" class = "normal" style="width:174px;">
          <option value="0"  selected="selected">Select</option>

		
	  
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
	  <td class = "normal" height = "25" align="left"> MAS 2</td>



		 </tr>
		 <tr>
		 <td></td>
		 <td></td>

			<td class = "normal" height = "25"  align="left">
		  <select name = "app9" id="app9" class = "normal" style="width:174px;">
		  <option value="0"  selected="selected">Select</option>

		 
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
%>
        </select>
		</td>
		 <td class = "normal" height = "25" align="left">Finance 1</td>
        </tr>
		<tr>
		 <td></td>
		 <td></td>

	
			<td  class = "normal"  height = "25" align="left">
		 <select name = "app10" id="app10"  class = "normal" style="width:174px;">
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
		
		<% if((company.equals("1005") || company.equals("1006")) && ((category.equals("9")|| category.equals("7") || category.equals("3")) )){%>
		<td class = "normal" height = "25" align="left">President Finance / COO & EP</td>
		<%}else if((company.equals("1501"))){%>
		<td class = "normal" height = "25" align="left">President Finance / COO & EP</td>
		<%}else{%>
		  <td class = "normal" height = "25" align="left">Finance 2</td>
		<%}%>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="4" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;</td>
          <!-- <td width="50%">&nbsp;</td> -->
        </tr>
        <tr>
          <td align="center" width="10%" colspan="1">
		  <input  name="savedraft1"class="bold" type="button"  id="savedraft1" value="Save Draft" onclick="savedraft();" />
		  <input name="submitForm" onclick="validateForm(1);" type="button" class="bold" id="submitForm" value="Submit" />
		  <input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" />
		  </td>
          <!-- <td  valign="middle" width="10%">
		  <input name="submitForm" onclick="validateForm(1);" type="button" class="bold" id="submitForm" value="Submit" />
          <input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" /></td> -->
        </tr>
      </table>
	  	