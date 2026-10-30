<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.text.SimpleDateFormat,java.util.GregorianCalendar,java.util.Calendar, java.util.Date,java.text.*" %>
<%@ include file="includes/sessionCheck.jsp"%>
<%//@ page errorPage="common/errorPage.jsp"%>
<%@ include file="includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 


<%  
    
   String company = (String)request.getParameter("company");
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
        label1 = "<span class=\"small\"><strong>Director B&C</strong></span><br><span class=\"redsmall\" id=\"changeLabel2\">&#42&nbsp;(for Contract value> 3L and < 20L)</span>";
        //label2 = "<span class=\"small\"><strong>Executive Director</strong></span>";
        label2 = "<span class=\"small\"><strong>COO (Publishing)</strong></span>";
        label3 = "<span class=\"small\"><strong>COO</strong></span>";
        //label4 = "<span class=\"small\"><strong>CEC & ED</strong></span>";
        label4 = "<span class=\"small\"><strong>CEO (Publishing)</strong></span>";
    }else{
        label1  ="<span class=\"small\"><strong>Group Company CEO</strong></span>";
        label2 = "<span class=\"small\"><strong>Director B&C</strong></span>";
        //label2 = "<span class=\"small\">Director B&C</span><span class=\"redsmall\" id=\"changeLabel2\"><br>(Delegated Authority)</span>";
        //label3 = "<span class=\"small\"><strong>Executive Director</strong></span>";
        label3 = "<span class=\"small\"><strong>COO (Publishing)</strong></span>";
        //label4 = "<span class=\"small\"><strong>CEC & ED - BCCL</strong></span>";
        label4 = "<span class=\"small\"><strong>CEO (Publishing)</strong></span>";

    }

	String faYear= "";
   
	GregorianCalendar thisDay = new GregorianCalendar( );

	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

      
    int currMonth1		= thisDay.get(Calendar.MONTH);
    String currMonth	= monthArr[currMonth1]  + "";	

 	faYear = thisDay.get(Calendar.YEAR) + "";
	String nextYear		=	thisDay.get(Calendar.YEAR) + 1 + "";
	if(currMonth.equals("JAN") || currMonth.equals("FEB")||currMonth.equals("MAR") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
		nextYear = (Integer.parseInt(nextYear)-1)+"";
	}


        Hashtable adminHash = new Hashtable();

		ArrayList adminList	=  new ArrayList();
	    String adData[]       = null;
        int adminId     = 0;
        int qq          =0;
        boolean checkAdmin = false;
		adminList 			=	priceApprovalWebController.getAdminData(adminHash);
          if(adminList.size()>0)
           {
            for(qq = 0; qq<adminList.size(); qq++)
                {
                    adData   = (String[])adminList.get(qq);
          adminId   = Integer.parseInt(adData[0]);

            if(timescapeUserOId==adminId)
                {
                    checkAdmin=true;
                }
             }
}
%>

<table width="100%" cellspacing="2" cellpadding="2" border="0">
	<tr>
		<td  align="left" width="15%"   class="normal"><span class="redsmall">*&nbsp;-&nbsp;mandatory</span></td>
	</tr>
	<!--<tr height="30">
		<td  align="left" width="15%"  bgcolor="#fbf9f9" class="travelMenuBG">CATEGORY&nbsp;:&nbsp;</td>
		<td colspan="4"  width="15%" bgcolor="#fbf9f9" class="travelMenuBG">
		<select class="small" id="category" name="category" onchange="project();freezcpx();setSelectedIndex();">
			<option value="0">Select Category</option>
			<!-- <option value="NP & Logistics">NP & Logistics</option> 
			<option value="IBO">IBO</option>
			<option value="Capex">Capex</option>
			<option value="IT buying">IT buying</option>
			<option value="Consumables">Consumables</option>
			<option value="Insurance">Insurance</option>
			<option value="Non conventional category">Non conventional category</option>
			<option value="Projects">Projects</option>
			<option value="OSP">OSP</option>
			<option value="Group Company related buying">Group Company related buying</option>
			<option value="Logistics">Logistics</option>
		</select>
	<font size="3" color="red">&nbsp;&#42</font></td>
	</tr>-->
	<tr>
		<td height="26" colspan="2"  class="greyBG">PROJECT DETAILS</td>
		<td colspan="2" align="left"  class="greyBG">CONTRACT DETAILS</td>
	 </tr>
	<tr>
    <td width="18%" height="27" bgcolor="#fbf9f9"><span class="small" id="top">Project Name</span></td>
    <td width="26%" align="left">
		<span class="small">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<tr>
				<td width="45%">
					<input type="text" size="25" name="projectName" class="small" maxlength="25" onkeydown="textCounter(document.priceApprovalMain.projectName,'projectChar',25)" onkeyup="textCounter(document.priceApprovalMain.projectName,'projectChar',25)">
				<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
				<td id="projectChar" align="left" width="8%" class="small">25</td>
				<td align="left" class="small">Chars Left</td>
				</tr>
			</table>
		</span>
			</td>
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Contract Validity:</span></td>
		<td width="35%" align="left">
		<span class="small">
			<table width="52%" cellspacing="0" cellpadding="0" border="0">
				<tr>
				<td width="10%">
      <input type="text" size="10" name="fromContractValidity" id="fromContractValidity" placeholder="from" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" />&nbsp;to&nbsp;</td>
 <td width="4%"><input type="text" size="10" name="toContractValidity" id="toContractValidity" placeholder="to" class="small" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly" style="margin-left:2px;" />

		  <!-- <input name="contractValidity" class="small" maxlength="25" onkeydown="textCounter(document.priceApprovalMain.contractValidity,'contractChar',25)" onkeyup="textCounter(document.priceApprovalMain.contractValidity,'contractChar',25)"> -->
				<td width="3%" align="left"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
				
				</tr>
			</table>
		</span>
			</td>
	<tr>
    <td bgcolor="#fbf9f9"><span class="small">Description</span></td>
    <td width="30%" align="left">
		<span class="small">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
			<td width="45%">
				<textarea name="description" class="small" maxlength="50" cols="24" onkeydown="textCounter(document.priceApprovalMain.description,'contractChar',50)" onkeyup="textCounter(document.priceApprovalMain.description,'descriptionChar',50)"></textarea>
			<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
			<td id="descriptionChar" align="left" width="8%" class="small" >50</td>
			<td align="left" class="small" >Chars Left</td>
			</tr>
			</table>
		</span>
			</td>
	
    <td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Contract value (Rs):</span></td>
    <td width="35%" align="left">
		<span class="small">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
			<td width="45%">
				<input type="text" size="25" name="contractValue" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.contractValue,'contractValueChar',10)" onkeyup="textCounter(document.priceApprovalMain.contractValue,'contractValueChar',10);negValCheck();"/>
			<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
			<td id="contractValueChar" align="left" width="8%" class="small">10</td>
			<td align="left" class="small"> Chars Left</td>
			</tr>
			</table>
		</span>
			</td>
	</tr>
	
	<tr>
	<td bgcolor="#fbf9f9"><p class="small">User group:</p></td>
	<td width="26%" align="left">
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td width="45%">
		  <input type="text" size="25" name="userGroup" class="small" maxlength="25" onkeydown="textCounter(document.priceApprovalMain.userGroup,'userGroupChar',25)" onkeyup="textCounter(document.priceApprovalMain.userGroup,'userGroupChar',25);"/>
		<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
		<td id="userGroupChar" align="left" width="8%" class="small">25</td>
		<td align="left" class="small">Chars Left</td>
		</tr>
		</table>
	</span>
		</td>

	<td valign="middle" width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Vendor name:</span></td>
	<td valign="middle" width="35%" align="left" >
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
			<td width="45%">
				<input type="text" size="25" name="vendorName" class="small" maxlength="25" onkeydown="textCounter(document.priceApprovalMain.vendorName,'vendorNameChar',25)" onkeyup="textCounter(document.priceApprovalMain.vendorName,'vendorNameChar',25);"/>
			<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
			<td id="vendorNameChar" align="left" width="8%" class="small">25</td>
			<td align="left" class="small">Chars Left</td>
			</tr>
		</table>
	</span>
		</td>
	</tr>
	
	<tr>
	<td bgcolor="#fbf9f9"><p class="small">Total Aop Budget (Rs.) :</p></td>
	<td width="26%" align="left">
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td width="45%">
			<input type="text" size="25" name="totalBudget" id="totalBudget" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.totalBudget,'totalBudgetChar',10)" onkeyup="textCounter(document.priceApprovalMain.totalBudget,'totalBudgetChar',10);"/>
		<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
		<td id="totalBudgetChar" align="left" width="8%" class="small">10</td>
		<td align="left" class="small"> Chars Left</td>
		</tr>
		</table>
	</span>
		</td>
		
	<td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Payment terms:</span></td>
    <td width="35%" align="left">
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td width="45%">
			<textarea  name="paymentTerms" rows="2" class="small" cols="24"  onkeydown="textCounter(document.priceApprovalMain.paymentTerms,'paymentTermsChar',50)" onkeyup="textCounter(document.priceApprovalMain.paymentTerms,'paymentTermsChar',50);"/></textarea>
		<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
		<td id="paymentTermsChar" align="left" width="8%" class="small">50</td>
		<td align="left" class="small">Chars Left</td>
		</tr>
		</table>
	</span>
		</td>
		
	</tr>
	
	<tr>
	<td bgcolor="#fbf9f9"><span class="small">Sanction note status:</span></td>
	<td width="26%" align="left">
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td width="45%">
			<input type="text" size="25" name="sanctionNote" class="small" maxlength="25" onkeydown="textCounter(document.priceApprovalMain.sanctionNote,'sanctionNoteChar',25)" onkeyup="textCounter(document.priceApprovalMain.sanctionNote,'sanctionNoteChar',25);"/>
		<td width="3%"><font size="3" color="red">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
		<td id="sanctionNoteChar" align="left" width="8%" class="small">25</td>
		<td align="left" class="small">Chars Left</td>
		</tr>
		</table>
	</span>
		</td>
		
	<td width="21%" align="left" bgcolor="#fbf9f9" class="normal"><span class="small">Savings If any:</span></td>
	<td width="35%" align="left">
	<span class="small">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
		<td width="45%">
			<input type="text" size="25" name="savings" class="small" maxlength="10" onkeydown="textCounter(document.priceApprovalMain.savings,'savingsChar',10)" onkeyup="textCounter(document.priceApprovalMain.savings,'savingsChar',10);"/>
		<td width="3%"><font size="3" color="red">&nbsp;&#42&nbsp;</font></td>
		<td id="savingsChar" align="left" width="8%" class="small">10</td>
		<td align="left" class="small">Chars Left</td>
		</tr>
		</table>
	</span>
		</td>
	</tr>
</table>
<!--end project and contract details-->


<table width="100%" border="0" cellpadding="2" cellspacing="2">
 <tr>
    <td height="22" class="greyBG">BACKGROUND</td>
  </tr>
  <tr>
  <td  align="left" width="100%" valign="top"><textarea name="background" cols="55" rows="12" maxlength="3000" style ="height:170px;width:96%" onkeydown="textCounter(document.priceApprovalMain.background,'backgroundChar',3000)" onkeyup="textCounter(document.priceApprovalMain.background,'backgroundChar',3000);"/></textarea>
		<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="backgroundChar" width="3%" class="small">3000</td><td class="small">Chars Left</td></tr></table></div>
	</td>
	</tr>
</table>
<hr>
<!--TECHNICAL SPECIFICATIONS-->
<table width="99%" cellspacing="2" cellpadding="2" align="center">
<tr>
		<td height="26" colspan="5" bgcolor="#fbf9f9" class="greyBG">A1. TECHNICAL SPECIFICATIONS:</td>
	</tr>
<tbody id="inputtable">

  <tr class="greyBG">
	<td width="2%" height="29" >VENDOR</td>
    <td width="2%" align="left">Machine Type</td>
    <td width="2%" align="left">No of Pages (colors)</td>
    <td width="2%" align="left">No of CTP & Make</td>
    <td width="2%" align="left">Speed/ hr</td>
	</tr>
  <tr>
	<td height="20" valign="top" align="left"><span class="small">
      <textarea name="tvendor1" id="tvendor1" cols="25" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.tvendor1,'tvendorChar1',50)" onkeyup="textCounter(document.priceApprovalMain.tvendor1,'tvendorChar1',50)" ></textarea>   
	  </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="tvendorChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="tmachine1" id="tmachine1"cols="25" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.tmachine1,'tmachineChar1',50)" onkeyup="textCounter(document.priceApprovalMain.tmachine1,'tmachineChar1',50)"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="tmachineChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="pagination1"  id="pagination1" cols="25" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.pagination1,'paginationChar1',50)" onkeyup="textCounter(document.priceApprovalMain.pagination1,'paginationChar1',50)"></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="paginationChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="ctp1" id="ctp1" cols="25" rows="2" class="small" maxlength="50"   onkeydown="textCounter(document.priceApprovalMain.ctp1,'ctpChar1',50)" onkeyup="textCounter(document.priceApprovalMain.ctp1,'ctpChar1',50);"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="ctpChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="speed1" id="speed1" class="small" cols="25" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.speed1,'speedChar1',50)" onkeyup="textCounter(document.priceApprovalMain.speed1,'speedChar1',50)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="speedChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

  </tr>

   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="tech" onclick="addRowTech()" class="bold">
   <input type="button" value="  Remove Row   " name="tech" onclick="delRowTech()" class="bold"></td></tr>
   <input type="hidden" name="countTech" value="1" />	

 </table>



<!--END TECHNICAL SPECIFICATIONS-->
<hr>

<!--COMMERCIALS-->

<table width="99%" cellspacing="2" cellpadding="2" align="center">
<tr>
		<td height="26" colspan="7"  class="greyBG">B1). COMMERCIALS:</td>
	</tr>
<tbody id="inputtable2">

  <tr class="greyBG">
	<td width="2%" height="29" >Vendor</td>
    <td width="2%" align="left">Colour Page (paisa)</td>
    <td width="2%" align="left">B&W Rate(paisa)</td>
    <td width="2%" align="left">Plate cost(Rs.)</td>
    <td width="2%" align="left">Bundling</td>
    <td width="2%" align="left">Insertion</td>
    <td width="2%" align="left">Other misc</td>
	</tr>
  <tr>
	<td height="20" valign="top" align="left"><span class="small">
      <textarea name="cvendor1" id="cvendor1" cols="20" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.cvendor1,'cvendorChar1',50)" onkeyup="textCounter(document.priceApprovalMain.cvendor1,'cvendorChar1',50)" ></textarea>   
	  </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="cvendorChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="colourPage1" id="colourPage1"cols="20" class="small" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.colourPage1,'colourPageChar1',10)" onkeyup="textCounter(document.priceApprovalMain.colourPage1,'colourPageChar1',10);valCheck();"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="colourPageChar1" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	</td>
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="bAndw1"  id="bAndw1" cols="20" rows="2" class="small" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.bAndw1,'bAndwChar1',10)" onkeyup="textCounter(document.priceApprovalMain.bAndw1,'bAndwChar1',10);valCheck();"></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="bAndwChar1" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="plateCost1" id="plateCost1" cols="20" rows="2" class="small" maxlength="10"   onkeydown="textCounter(document.priceApprovalMain.plateCost1,'plateCostChar1',10)" onkeyup="textCounter(document.priceApprovalMain.plateCost1,'plateCostChar1',10);valCheck();"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="plateCostChar1" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="bundling1" id="bundling1" class="small" cols="20" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.bundling1,'bundlingChar1',50)" onkeyup="textCounter(document.priceApprovalMain.bundling1,'bundlingChar1',50)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="bundlingChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="insertion1" id="insertion1" class="small" cols="20" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.insertion1,'insertionChar1',50)" onkeyup="textCounter(document.priceApprovalMain.insertion1,'insertionChar1',50)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="insertionChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="otherMisc1" id="otherMisc1" class="small" cols="20" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.otherMisc1,'otherMiscChar1',50)" onkeyup="textCounter(document.priceApprovalMain.otherMisc1,'otherMiscChar1',50)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="otherMiscChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

  </tr>

   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="com" onclick="addRowCom()" class="bold">
   <input type="button" value="  Remove Row   " name="com" onclick="delRowCom()" class="bold"></td></tr>
   <input type="hidden" name="countCom" value="1" />	

 </table>

<!--END COMMERCIALS-->
<hr>

<!--Estimated Spend & other specs-->

<table width="99%" cellspacing="2" cellpadding="2" align="center">
<tr>
		<td height="26" colspan="7"  class="greyBG">B2). ESTIMATED SPEND & OTHER SPECS:</td>
	</tr>
<tbody id="inputtable3">

  <tr class="greyBG">
	<td width="2%" height="29" >Vendor</td>
    <td width="2%" align="left">PO/Daily</td>
    <td width="2%" align="left">ALP/Year</td>
    <!-- <td width="2%" align="left">No of B&W field</td>
 -->    <td width="2%" align="left">Total Spend (Rs.)</td>
    <td width="2%" align="left">Pagn. confg.</td>
    <td width="2%" align="left">LPRS (eg. 20:21 or 8:21pm)</td>
    <td width="2%" align="left">Waste %</td>
	</tr>
  <tr>
	<td height="20" valign="top" align="left"><span class="small">
      <textarea name="esVendor1" id="esVendor1" cols="20" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.esVendor1,'esVendorChar1',50)" onkeyup="textCounter(document.priceApprovalMain.esVendor1,'esVendorChar1',50)" ></textarea>   
	  </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="esVendorChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>


    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="po1"  id="po1" cols="20" rows="2" class="small" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.po1,'poChar1',10)" onkeyup="textCounter(document.priceApprovalMain.po1,'poChar1',10);valCheck();"></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="poChar1" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="alp1" id="alp1"cols="20" class="small" maxlength="10"  onkeydown="textCounter(document.priceApprovalMain.alp1,'alpChar1',10)" onkeyup="textCounter(document.priceApprovalMain.alp1,'alpChar1',10);valCheck();"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="alpChar1" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>
<!-- 
    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="esBandW1" id="esBandW1"cols="20" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.esBandW1,'esBandWChar1',50)" onkeyup="textCounter(document.priceApprovalMain.esBandW1,'esBandWChar1',50)"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="esBandWChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td> -->


    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="totalSpend1" id="totalSpend1" cols="20" rows="2" class="small" maxlength="10"   onkeydown="textCounter(document.priceApprovalMain.totalSpend1,'totalSpendChar1',10)" onkeyup="textCounter(document.priceApprovalMain.totalSpend1,'totalSpendChar1',10);valCheck();"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="totalSpendChar1" width="10%" class="small">10</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="esPagination1" id="esPagination1" class="small" cols="20" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.esPagination1,'esPaginationChar1',50)" onkeyup="textCounter(document.priceApprovalMain.esPagination1,'esPaginationChar1',50)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="esPaginationChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="lprs1" id="lprs1" class="small" cols="20" maxlength="8"  onkeydown="textCounter(document.priceApprovalMain.lprs1,'lprsChar1',8)" onkeyup="textCounter(document.priceApprovalMain.lprs1,'lprsChar1',8)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="lprsChar1" width="10%" class="small">8</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

	<td height="25" valign="top" align="left"><span class="small">
      <textarea name="waste1" id="waste1" class="small" cols="25" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.waste1,'wasteChar1',50)" onkeyup="textCounter(document.priceApprovalMain.waste1,'wasteChar1',50)"></textarea>
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="wasteChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>	
	</td>

  </tr>

   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="es" onclick="addRowEs()" class="bold">
   <input type="button" value="  Remove Row   " name="es" onclick="delRowEs()" class="bold"></td></tr>
   <input type="hidden" name="countEs" value="1" />	

 </table>


<!--END Estimated Spend & other specs-->
<hr>

<!--innovations-->
<table width="99%" cellspacing="2" cellpadding="2" align="center">
<tr>
		<td height="26" colspan="5"   class="greyBG">C1). INNOVATIONS & GNP PRINTING:</td>
	</tr>
<tbody id="inputtable4">

  <tr class="greyBG">
	<td width="2%" height="29" >Vendor</td>
    <td width="2%" align="left">PO</td>
    <td width="2%" align="left">Total Spend</td>
    <td width="2%" align="left">Details</td>
	</tr>
  <tr>
	<td height="20" valign="top" align="left"><span class="small">
      <textarea name="inVendor1" id="inVendor1" cols="25" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.inVendor1,'inVendorChar1',50)" onkeyup="textCounter(document.priceApprovalMain.inVendor1,'inVendorChar1',50)" ></textarea>   
	  </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="inVendorChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="inPo1" id="inPo1"cols="25" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.inPo1,'inPoChar1',50)" onkeyup="textCounter(document.priceApprovalMain.inPo1,'inPoChar1',50)"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="inPoChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="inTotalSpend1" id="inTotalSpend1"cols="25" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.inTotalSpend1,'inTotalSpendChar1',50)" onkeyup="textCounter(document.priceApprovalMain.inTotalSpend1,'inTotalSpendChar1',50)"></textarea>    
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="inTotalSpendChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

    <td height="25" valign="top" align="left"><span class="small">
      <textarea name="inMisc1"  id="inMisc1" cols="25" rows="2" class="small" maxlength="50"  onkeydown="textCounter(document.priceApprovalMain.inMisc1,'inMiscChar1',50)" onkeyup="textCounter(document.priceApprovalMain.inMisc1,'inMiscChar1',50)"></textarea>  
    </span>
	<div><table width="100%" cellpadding="0" cellspacing="0"><tr><td id="inMiscChar1" width="10%" class="small">50</td><td align="left" class="small">&nbsp;Chars Left</td></tr></table></div>
	</td>

  </tr>

   </tbody>
   <tr><td colspan="5" height="10"><input type="button" value="     Add Row     " name="in" onclick="addRowIn()" class="bold">
   <input type="button" value="  Remove Row   " name="in" onclick="delRowIn()" class="bold"></td></tr>
   <input type="hidden" name="countIn" value="1" />	

 </table>

<!--END Innovation-->
<table width="100%"   border="0" cellpadding="2" cellspacing="2">
	<tr>
		<td width="55%" height="50" colspan="5"   class="greyBG">ADDITIONAL ATTACHMENT</td>
	</tr>
	<tr>
        <td>
            <table  width="100%"   border="1" cellpadding="2" cellspacing="0" >			
                <tbody>
                    <tr>
                        <td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('compulsory','0');" > <img src="images/attachmentNp.png" border="0" /></a> </td>	
                    </tr>	
                    <tr>
                        <td colspan="2"  id="attachment"></td>												
                    </tr>
                </tbody>				
            </table>
        </td>
        <td>
            <table width="100%" border="1" cellpadding="2" cellspacing="0">			

                <tbody>
                    <tr>
                        <td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('additional','0');" ><img src="images/attachmentNp.png" border="0" /></a> </td>	
                    </tr>	
                    <tr>
                        <td colspan="2"  id="attachment1"></td>											
                    </tr>
                </tbody>			
            </table>
        </td>
    </tr>
</table>
<HR>

<table width="100%"   border="0" cellpadding="2" cellspacing="2">
	<tr>
		<td width="55%" height="50" colspan="2"   class="greyBG">RECOMMENDATION</td>
	</tr>
	<tr>
	<td  width="55%" height ="25" rowspan="4" align="left" valign="middle">
	<textarea name="recommendation" id="recommendation" maxlength="3000" cols="55" rows="12" onkeydown="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" onkeyup="textCounter(document.priceApprovalMain.recommendation,'recommendationChar',3000)" style ="height:170px;width:96%" onfocus="onLoadDetail('1');"></textarea>
	<div>
	<table width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td id="recommendationChar" width="3%" class="small">3000
		</td>
		<td class="small">&nbsp;Chars Left
		</td>
	</tr>
	</table>
	</div>
	</td>
	</tr>
</table>
<HR>

<table width="100%" border="0" cellpadding="2" cellspacing="2">

 
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="52%" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="2" cellspacing="2">
     
      <tr>
        <td height="22" bgcolor="#ffffff" class="greyBG">APPROVALS</td>
        </tr>
    </table>
      <table  border = "0" width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="12%" ><strong>B&amp;C</strong><span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span></td>
          <td width="12%" height="29" ><strong>USER</strong><span class="small"></span><span class="redsmall"><span class="small"></span>&nbsp;</span></td>
          <td width="11%" align="left" colspan="2">&nbsp;<strong>SUPPORTED BY</strong></td>

          
          <td width="12%" align="left" ><span class="small" ><%=label1%> </span></td>
          <td width="12%" align="left"><span class="small" ><%=label2%> </span></td>
          <td width="12%" align="left"><span class="small" ><%=label3%> </span></td>
          <td width="12%" align="left"><span class="small" ><%=label4%> </span></td>
          <td width="12%" align="left"><span class="small"><strong>Managing Director</strong> </span></td>
        </tr>
		<tr>
		<td colspan="2">&nbsp;</td>
		<td class ="small" height ="15">&nbsp;<b>Name</b>
		</td>
		<td class ="small" height ="15" >&nbsp;<b>Role</b>
		</td>
		
		</tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app1" id="app1" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app1H" id="app1H" type="hidden" value="" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" >
			 <input  name = "app2H" id="app2H" type="hidden" value="" />
		  </td>
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
		 <td class = "normal" height = "25" align="left">HR/Personnel</td>


		  
          <td rowspan="3" align="left" valign="top" class="small"><span class="boldunderline_small">
            <select name="select12" class="small" id="select12" style="width:130px;">
                <option value="0">Select</option>
                <!-- <option value="20411">Shyam  Shanker</option> -->
                <%=app4%>
	  </select>
			</span></td>
          <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
		<select name="select13" class="small" id="select13" style="width:130px;">
		<option value="0">Select</option>	
        <!-- <option value="3459">Mohit  Jain</option> -->
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
		 <input type = "text" name = "app12" id="app12"  class = "normal" size="26" onClick="addUser('approvedby',this.id)">
		<input  name = "app12H" id="app12H" type="hidden" value="" /></td>
		 <td class = "normal" height = "25" align="left">Branch Head</td>



       </tr>
        <tr class="small">
          <td class = "normal" height = "25" align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app7H" id="app7H" type="hidden" value="" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)">
			  <input  name = "app8H" id="app8H" type="hidden" value="" />
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




		  
        </tr>

		<tr class="small">
		  <td colspan="2" >&nbsp;</td>
         
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
		 <td class = "normal" height = "25" align="left">Finance 2</td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="4" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;</td>
          
        </tr>
        <tr>
          <td align="center" width="10%" colspan="1">
		  <input  name="savedraft1"class="bold" type="button"  id="savedraft1" value="Save Draft" onclick="saveDraftOsp(1);" />
		  <input name="submitForm" onclick="validateForm(1);" type="button" class="bold" id="submitForm" value="Submit" />
		  <input name="resetButton" type="reset" class="bold" id="resetButton" value="Reset" />
		  </td>
         
        </tr>
      </table>
<br><br>
</form>										



</body>

</html>