<%--
 -- Interaction Center -- Common 
 -- @(#)annualltaapply.jsp	21-09-15
 --
 -- Copyright 2012 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Krishna Vishwakarma
 -- @version 	1.00, 21-09-15
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.text.DecimalFormat, java.util.Date, java.io.*" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 
<jsp:useBean id="BennetTouchController" class="com.bccl.bennettouch.web.controller.BennetTouchWebController"/>
<%@ page import="com.bccl.util.JcoGetDataFromSAP"%>

   <!DOCTYPE html>
 <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> LTA </title>
	<link href="../css/reset.css" rel="stylesheet"/>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/lta.css" rel="stylesheet"/>	
    <title>LTA Application</title>
	<script Language="JavaScript" src="../jscripts/jquery.js">
	</script>
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/bootstrap-maxlength.min.js"></script>
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/form-validation.js"></script>
	<script src="../js/additional-methods.min.js"></script>
	</script>
<style>                 
@media print {
  a[href]:after {
    content: none
  }
}
.table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
    padding-bottom: 5px;
	padding-left:8px;
	padding-right:8px;
	padding-top:5px;
    line-height: 1.42857;
    vertical-align: top;
    border-top: 1px solid #DDD;
}
</style>               


<script> 
    function hideImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'hidden'; 
           // document.getElementById('printlinks').style.visibility = 'hidden'; 
           // document.getElementById('printlinks1').style.visibility = 'hidden'; 
        } 
    }
    function showImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'visible'; 
           // document.getElementById('printlinks').style.visibility = 'visible'; 
           // document.getElementById('printlinks1').style.visibility = 'visible'; 
        } 
    } 

</script>
<script>
	$(document).ready(function(){		

	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
	});
</script>
<script>
function showAttachmentFile(str,  emailId, formName){	
	//alert("kk");
	loadFragment("../requestor/showDirListing.jsp?attachment=additional&str=1&userEmailId="+emailId+"&formName="+formName,"attachment1","Attachment");
}
function  openFile(fileName,emailId,attachmentName){
		
	var url = "../common/popup.jsp?fileName="+fileName+"&emailid="+emailId+"&str=1&attachment="+attachmentName;
	win = window.open(url,"Attachments","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
}
function loadFragment(fragment_url, element_id, for_what) {
	var xmlhttp = "";
	if (window.XMLHttpRequest) {
		// code for Mozilla, etc.
		xmlhttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		// code for IE
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else {
		alert("Sorry Your Browser is not Supported");
	}
	var element = document.getElementById(element_id);
	//alert(element);
	var message = "";
	var processingRequest = '<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
	+ for_what + ' Loading...</span></div></td></tr></table>';
	$("#"+element_id).html(processingRequest);
	//element.innerHTML = processingRequest;
	try {
		xmlhttp.open("GET", fragment_url);
		xmlhttp.onreadystatechange = function(){
				 
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var gotresponse = xmlhttp.responseText;
				message = gotresponse;
				//alert(message);
				$("#"+element_id).html(message);
				//element.innerHTML = message;
			}
		}
		xmlhttp.send(null);
	}// display an error in case of failure
	catch (e) {
		alert("Can't connect to server:\n" + e.toString());
	}
}
</script>
    </head>
<%


String[] tags = {"journey", "travellers"};

	//String txnId = (String)request.getParameter("Id");
	String applicationId = "";//(String)request.getParameter("applicationId");
	int id = Integer.parseInt((String)request.getParameter("applicationId"));
	//String billType = (String)request.getParameter("billType");
	String txnIds = (String)session.getAttribute("LTA_IDS");

	String txnArr[] = txnIds.split(",");
	
	if(txnArr.length > id){
		applicationId = txnArr[id];
session.setAttribute("applicationId",applicationId);

Hashtable detailsHash = new Hashtable();

detailsHash.put("APPLICATIONID",applicationId);



	ArrayList ltaRquestDetails = null;
	ltaRquestDetails = ltaController.requestDetails(detailsHash, tags);

    String[] annualHeader = (String[]) ((ArrayList)ltaRquestDetails.get(0)).get(0);

	Hashtable requestHash = (Hashtable) ltaRquestDetails.get(1);
    

    ArrayList travelDetails = (ArrayList)requestHash.get(tags[0]);

    ArrayList travellerDetails = (ArrayList)requestHash.get(tags[1]);

	String  selectedPl      =   "";
    String  exemption       =   "";
    String  ltaProposedAmt  =   "";
    String  ltaApprovedamt  =   "";
    String  ltaApprovedamtE  =   "";
    String  ltaExemptedamt  =   "";
    String  userStatus      =   "";
    String  approverStatus  =   "";
    String  modifiedOn  =   "";
    String  ltaAmount  =   "";
    String empApplicationId ="";
    String exemptedAmount ="";

        if(annualHeader.length>0)
        {
            selectedPl      =   annualHeader[18];
            exemption       =   annualHeader[1];
            ltaProposedAmt  =   annualHeader[2];
            ltaApprovedamt  =   annualHeader[3];
            ltaApprovedamtE  =   annualHeader[3];
            userStatus      =   annualHeader[10];
            approverStatus  =   annualHeader[5];
            modifiedOn      =   annualHeader[9];
            ltaAmount       =   annualHeader[20];
            empApplicationId       =   annualHeader[0];
            exemptedAmount       =   annualHeader[26];
//System.out.println(approverStatus);
        }else
            {
                selectedPl          ="NA";
                exemption           ="NA";    
                ltaProposedAmt      ="NA";    
                ltaApprovedamt      ="NA";    
                ltaApprovedamt      ="NA";    
            }
		int amt = annualHeader[2].length();

		String tempvalue = "";
			
		int lengthCount = amt-1;

		int counterVal = 1;

		if(amt>3)
		{
			while(lengthCount>=0)
			{
				if((counterVal>3) && (counterVal%2==0))
					{
						tempvalue = tempvalue + ",";
					}
				
				tempvalue = tempvalue + annualHeader[2].charAt(lengthCount);
				
				lengthCount--;
				counterVal++;
			}
			tempvalue =  new StringBuffer(tempvalue).reverse().toString();
	   
			ltaProposedAmt = tempvalue;
		}



		 amt = annualHeader[3].length();

		 tempvalue = "";
			
		 lengthCount = amt-1;

		 counterVal = 1;

		if(amt>3)
		{
			while(lengthCount>=0)
			{
				if((counterVal>3) && (counterVal%2==0))
					{
						tempvalue = tempvalue + ",";
					}
				
				tempvalue = tempvalue + annualHeader[3].charAt(lengthCount);
				
				lengthCount--;
				counterVal++;
			}
			tempvalue =  new StringBuffer(tempvalue).reverse().toString();
	   
			ltaApprovedamt = tempvalue;
		}

/*----------------------------------------------------------------------*/

    String flag = "";
	String faYear= "";
	String queryDate ="";
	
    //String roleId =  "";

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );

	String day2 = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));

	if ( day2.length() == 1) {

		day2	=	"0" + day2;
	}
	int currMonth1		= thisDay.get(Calendar.MONTH);
	String currMonth	= monthArr[currMonth1]  + "";	
	faYear = thisDay.get(Calendar.YEAR) + "";
	String nextYear		=	thisDay.get(Calendar.YEAR) + 1 + "";
	if(currMonth.equals("JAN") || currMonth.equals("FEB")||currMonth.equals("MAR") ){
		faYear = (Integer.parseInt(faYear)-1)+"";
		nextYear = (Integer.parseInt(nextYear)-1)+"";
	}
		
	String ltaYear		=	faYear.substring(2,4) + "%";
    
   /* ArrayList ltaBalResult	= new ArrayList();

    ltaBalResult	= ltaController.getLtaBal(timescapeUserOId, ltaYear);

	String ltaBal[]     =   new String[1];
    String ltaAmount    =  "";
    if ( ltaBalResult.size()> 0 ) {

     ltaBal		= (String []) ltaBalResult.get(0) ;
     ltaAmount  =  ltaBal[0];
    }

		int len = ltaBal[0].length();

		String temp = "";
			
		int lenCount = len-1;

		int counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + ltaBal[0].charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			ltaBal[0] = temp;
		}*/
/*----------------------------------------------------------------------*/
    String employeeMobile="";
	Hashtable dataHash = new Hashtable();

	ArrayList employeeMobile1 = new ArrayList();

	dataHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	

	employeeMobile1 = BennetTouchController.employeeMobileNumber(dataHash);
	//out.println(employeeMobile1.size());
	
	if(employeeMobile1.size()!=0)
		{
			for(int j = 0; j < employeeMobile1.size(); j++ )
				{
			String temparray[] = (String[]) employeeMobile1.get(j);

			employeeMobile = temparray[0];
if(employeeMobile==null){
employeeMobile="NA";
}
}}



/*----------------------------------------------------------------------*/

	Hashtable SAPConnectionDetails = new Hashtable();

	Hashtable SAPColumnHeads1 = new Hashtable();

	Hashtable SAPValues1 = new Hashtable();
	Hashtable SAPDataHash1		= new Hashtable();

	ArrayList importValues1 =  new ArrayList( );
	ArrayList SAPReturnValues3	= new ArrayList();



/* COMMENTED FOR HANA CHANGES

	SAPConnectionDetails.put("CLIENT","700");
	SAPConnectionDetails.put("USERID","tsrfc");
	SAPConnectionDetails.put("PASSWORD","welcome");
	SAPConnectionDetails.put("LANGUAGE","EN");
 // SAPConnectionDetails.put("HOSTNAME","10.100.229.39"); // fOR ppr
	//SAPConnectionDetails.put("HOSTNAME","10.100.223.250"); // for PROD
	SAPConnectionDetails.put("HOSTNAME",hostname); // for PROD new
	//SAPConnectionDetails.put("SYSTEMNO","00");
	SAPConnectionDetails.put("SYSTEMNO",systemno);*/

/* END OF COMMENTED FOR HANA CHANGES*/

	SAPConnectionDetails.put("RFCNAME","ZPY_LTA_BLOCK_TRANSFER");
	//SAPConnectionDetails.put("TOTALTABLESTOUPDATE","0");
	//SAPConnectionDetails.put("TABLENAME1","PERKS_ENTRIES");
    //Only for Investment due exeBatch_inv in SQLUtility
	SAPConnectionDetails.put("applicationName","lta");

    String application11 = "lta";

	//String importKeys1[] = {};

	String exportKeys[] = {"S_DATE", "E_DATE"};

    //SAPColumnHeads1.put("IMPORTKEYS",importKeys1);

	//SAPValues1.put("IMPORTVALUES","");

	SAPColumnHeads1.put("EXPORTKEYS",exportKeys);


	JcoGetDataFromSAP jcoObj = new JcoGetDataFromSAP(application11);

	SAPDataHash1 = jcoObj.jcoGetData(SAPConnectionDetails,SAPColumnHeads1,SAPValues1);	

	/*if(SAPDataHash1.containsKey("RETURNDATA"))
	{
	
		SAPReturnValues3 = (ArrayList)SAPDataHash1.get("RETURNDATA");
	}*/
   String     sDate         = (String)SAPDataHash1.get("S_DATE");
   String     eDate         = (String)SAPDataHash1.get("E_DATE");
    String blockStartDate    = "";
    String blockEndDate      = "";
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date date1      =   new Date();
    Date date2      =   new Date();
         date1      =    (Date)formatter.parse(sDate);
         date2      =    (Date)formatter.parse(eDate);
    DateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy");

        blockStartDate      =    formatter1.format(date1);
        blockEndDate        =    formatter1.format(date2);






%>
<%String ltaRoleId	= (String) session.getAttribute("ltaRoleId");%>
<%@ include file="../includes/relatedlinks.jsp" %>

<% String optionValue ="ARC";//A-annual,V-reviewer,C-checkstatus
session.setAttribute("optionValue",optionValue);


%>

<hr>
<%@ include file="../includes/annualmenutabs.jsp" %>
<body onload = "showAttachmentFile('1','<%=emailId%>','create')"> 

<div class="container">
<div class="row">
	<div class="col-xs-12 bs-example">
        <div class="row" style="margin-bottom:5px;">
        <div class="col-xs-offset-11">
            <input name="printbutton" type="button" class="style4" id="printbutton" value="Print" onclick="javascript:window.open('printRequestDetails.jsp');"/>	
        </div>
    </div>
		<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i>     Application For Claiming Annual LTA - Application ID <%=empApplicationId%>
			</div>
<%//System.out.println(userStatus);%>
        <div class="actions pull-right"style="margin-top:8px;">



        <%if(userStatus.equals("A")){
%><i class="fa fa-check"></i> 
Approved
<%}else if(userStatus.equals("L")){%>
<i class="fa fa-clock-o"></i>
In-Process
<%}else if(userStatus.equals("R")){%>
<i class="fa fa-minus-circle"></i>
Rejected
<%}else if (userStatus.equals("C")){%>
<i class="fa fa-times"></i> 
Cancelled
<%}%>

        </div>			
		</div>
	<div class="portlet-body">
	
		<form name="annuallta" action="../requestor/submitannuallta.jsp"  method="post" class="form-horizontal" role="form"  id="ann_lta">
			<div class="form-body">												
				<h3 class="form-section"></h3>
				<!--/row-->
				<div class="row">
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Employee Name</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-user" style="width:12px;"></i>
									</span>
									<input type="text" class="form-control" placeholder="Employee Name" id="empname" name="empname" value="<%=displayName%>" readonly>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">SAP ID</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-list-ol" style="width:12px;"></i>
									</span>
									<input type="text" class="form-control" placeholder="SAP ID" id="sapnumber" name="sapnumber" value="<%=sapId%>" readonly>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Branch</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-cogs" style="width:12px;"></i>										
									</span>
									<input type="text" class="form-control" placeholder="Branch" id="branch" name="branch" value="<%=branchName%>" readonly>
								</div>
							</div>
						</div>
					</div>	
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">DOJ</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-calendar" style="width:12px;"></i>
									</span>
									<input type="text" class="form-control" placeholder="DOJ" id="doj" name="doj" value="<%=joiningdate%>" readonly>
								</div>
							</div>
						</div>
					</div>					
				</div>
	<!--/row-->
				<div class="row">
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Designation</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-cog" style="width:12px;"></i>
									</span>
									<input type="text" class="form-control" placeholder="Designation" id="desg" name="desg" value="<%=designation%>" readonly>
								</div>
							</div>
						</div>
					</div>	
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Financial Year</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-calendar-o" style="width:12px;"></i>
									</span>
									<input type="text" class="form-control" placeholder="Financial Year" id="joc" name="joc"  value=" <%= faYear %> - <%= nextYear %>" readonly>
								</div>
							</div>
						</div>
					</div>					
				</div>
				<div class="row">
					<div class="col-xs-6 ">
						<div class="form-group">
							<label class="control-label col-xs-4">Department</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-sitemap " style="width:12px;"></i>
									</span>
									<input type="text" class="form-control" placeholder="Department" id="dep" name="dep" value="<%=deptname%>" readonly>
								</div>
							</div>
						</div>
					</div>	
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Tel/Mob </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-phone" style="width:12px;"></i>
									</span>
									<input type="text"  class="form-control" placeholder="Tel/Mob" id="tel" name="tel" value="<%=employeeMobile%>"readonly>
								</div>
							</div>
						</div>
					</div>					
				</div>
				<!--/row-->
				<%if(exemption.equals("N") || exemption.equals("YTB") || exemption.equals("Y")){%>
				<div class="row">
					<div class="col-xs-6">
						<div class="form-group grp has-feedback">							
							<label class="control-label col-xs-4">Select Privilege Leave Period </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-umbrella" style="width:12px;"></i>
									</span>
										
									<input type="text"  class="form-control" placeholder="Tel/Mob" id="tel" name="tel" value="<%=selectedPl%>"readonly>
								</div>
							</div>
							</div>
						</div>
			<%}else { %>
				<div class="row">
					<div class="col-xs-6">
						<div class="form-group grp has-feedback">							
							<label class="control-label col-xs-4">Select Privilege Leave Period </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-umbrella" style="width:12px;"></i>
									</span>
										
									<input type="text"  class="form-control" placeholder="Tel/Mob" id="tel" name="tel" value="NA"readonly>
								</div>
							</div>
							</div>
						</div>
			<%} %>
			
					<div class="col-xs-6">
						<div class="form-group ">
							<label class="control-label col-xs-4">LTA Amount</label>
							<div class="col-xs-8">
								<div class="input-group">
								<span class="input-group-addon">
										<i class="fa fa-inr" style="width:15px;" ></i>
									</span>
										
									<input type="text" class="form-control" placeholder="" name="claimbalance" id="claimbalance"    value= "<%=ltaAmount%>"readonly>
								
								
							</div>
							</div>
						</div>
					</div>														
				</div>
			
<%if(exemption.equals("N")){%>

            <div class="row">
            <div class="col-xs-6">
            </div>

            <div class="col-xs-6">
                                    <div class="form-group ">
                                        <label class="control-label col-xs-4">Approved Amount</label>
                                        <div class="col-xs-8">
                                            <div class="input-group">
                                            <div class="input-icon">
                                                    <i class="fa fa-inr" style="width:15px;" ></i>
                                                <input type="text" class="form-control" placeholder="LTA Amount" name="claimbalance" id="claimbalance"  style="width:285px;"  value= "<%=ltaApprovedamt%>" readonly>
                                                </span>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>														
                            </div>
                        </div>
            </div>


   <%}//if(approverStatus.equals("NA")){}else{%>
<%if(exemption.equals("Y") || exemption.equals("YPB")||exemption.equals("YTB")){%>
<hr>
    <div class="row">
    <div class="col-xs-12">
	
    <table class="table table-bordered table-hover table-responsive" style="margin-bottom:10px;">	
    <tbody>
    <tr>
    <td width="20%;">
    <h4>Approver Remarks : </h4>
    </td>
    <td style="padding-bottom:1px;">
      <p > <%=approverStatus%></p>
    </td>
    </tr>
    </tbody>
    </table>
    </div>
    </div>
<%//}%>

	<h3>Travel Details : </h3><hr>

		<div class="row">
        <div class="col-xs-3">
			<input type="checkbox" calss="myCheckbox" name="trav" id="trav"style="margin-left:15px;margin-bottom:15px;"<%if(exemption.equals("Y") || exemption.equals("YPB")||exemption.equals("YTB")){%> checked disabled<%}else{%>  disabled<%}%>/> Tax Exemption <i class="fa fa-info-circle" data-toggle="tooltip" data-placement="right" data-html="true" data-original-title="if checked,then above fields will be mandatory.If unchecked, & submitted,then 'Claim Exemption' link  would be available against the same TXN  for submitting the Exemption at a later date!"></i>
 </div>

		</div>
		<div class="row">
        <div class="col-xs-4">
			<%
				if (exemption.equals("YPB")){
%>
				<div style="margin-left:15px;margin-bottom:15px;">Purchased Goods Bill(s) has been selected.</div>
				<%
				} else if (exemption.equals("YTB")){
%>
				<div style="margin-left:15px;margin-bottom:15px;">Travel Bill(s) has been selected.</div>
				<%
				}
	%>
 </div>

		</div>

    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-th"></i>   Application to Claim Exemption on LTA Availed
            </div>  
        <div class="actions pull-right"style="margin-top:8px;">Current LTA Exemption Block: <%=blockStartDate%> to <%=blockEndDate%>
</div>                                 
        </div>
    </div>
<div class="row">
        <div class="col-xs-4 ">
                <div class="form-group grp has-feedback">
                    <label class="control-label col-xs-4">Tax Exemption Taken On</label>
                <div class="col-xs-7">
                <div class="input-group">
               <span class="input-group-addon">
									    <i class="fa fa-calendar" style="width:15px;" ></i>
									</span>
										
                

                    <input type="text" class="form-control hidden-sm xyz " placeholder="LTA Amount" name="amount" id="amt"   value= "<%=modifiedOn%>"disabled>
                <input  name = "amount1" id="amount1" type="hidden" value="<%=modifiedOn%>" />
                <!-- <input type="text" class="form-control hidden-md hidden-lg" placeholder="LTA Amount" name="amount" id="amt"  style="width:332px;"> -->
                   

                
                </div>
                </div>
                </div>

 </div>
        
            <div class="col-xs-4">
                <div class="form-group grp has-feedback">
                    <label class="control-label col-xs-4">Bill Amount </label>
                <div class="col-xs-7">
                <div class="input-group">
              <span class="input-group-addon">
									     <i class="fa fa-inr" style="width:15px;" ></i>
									</span>
                   

                    <input type="text" class="form-control hidden-sm xyz " placeholder="LTA Amount" name="amount" id="amt" onfocus="showAttachmentFile('additional','<%=emailId%>','create');"  value= "<%=ltaProposedAmt%>"disabled>
                <input  name = "amount1" id="amount1" type="hidden" value="<%=ltaProposedAmt%>" />
                <!-- <input type="text" class="form-control hidden-md hidden-lg" placeholder="LTA Amount" name="amount" id="amt"  style="width:332px;"> -->
                  
               
                </div>
                </div>
                </div>

 </div>

                <div class="col-xs-4">
                <div class="form-group grp has-feedback">
                    <label class="control-label col-xs-4">Approved Bill Amount </label>
                <div class="col-xs-7">
                <div class="input-group">
				 <span class="input-group-addon">
									    <i class="fa fa-inr" style="width:15px;" ></i>
									</span>
               
                  

                    <input type="text" class="form-control hidden-sm xyz " placeholder="Approved LTA Amount" name="approvedamount" id="approvedamount"   value= "<%=ltaApprovedamt%>"disabled>
                <input  name = "amount1" id="amount1" type="hidden" value="<%=ltaApprovedamt%>" />
                <!-- <input type="text" class="form-control hidden-md hidden-lg" placeholder="LTA Amount" name="amount" id="amt"  style="width:332px;"> -->
                    </span>

                
                </div>
                </div>
                </div>
            </div>	
        </div>


		<div class="col-xs-4">
                <div class="form-group grp has-feedback">
                    <label class="control-label col-xs-4">Exempted Bill Amount </label>
                <div class="col-xs-7">
                <div class="input-group">
				 <span class="input-group-addon">
									    <i class="fa fa-inr" style="width:15px;" ></i>
									</span>
               
<%
				if (exemption.equals("YPB")){
				 float ltaProposedAmtPB       = Float.parseFloat(exemptedAmount);
				 //out.println(ltaApprovedamtE);
				//ltaProposedAmtPB = ltaProposedAmtPB/3;	
				DecimalFormat df = new DecimalFormat("0.00");	
				ltaExemptedamt = df.format(ltaProposedAmtPB);
				
				}else {
					ltaExemptedamt = ltaApprovedamtE;
				}
%>              

                    <input type="text" class="form-control hidden-sm xyz " placeholder="Approved LTA Amount" name="approvedamount" id="approvedamount"   value= "<%=ltaExemptedamt%>"disabled>
                <input  name = "amount1" id="amount1" type="hidden" value="<%=ltaExemptedamt%>" />
                <!-- <input type="text" class="form-control hidden-md hidden-lg" placeholder="LTA Amount" name="amount" id="amt"  style="width:332px;"> -->
                    </span>

                
                </div>
                </div>
                </div>
            </div>	
        </div>

			<table class="table table-bordered table-hover table-responsive" id="tab_logic">	
				<thead>
					<tr class="warning">

						<th colspan="9" class="text-center ">							
							Journey Details 						
						
						</th>
					</tr>
				</thead>
				<thead>
					<tr class="info">
						<th class="text-center" width="2%;">
							Sr.No.
						</th>
						<th class="text-center" width="15%;">							
								From 							
						</th>
						<th class="text-center" width="15%;">							
								To 
						</th>
						<th class="text-center" width="10%;">
							Kms
						</th>
						<th class="text-center" width="20%;">
							Origin
						</th>
						<th class="text-center" width="20%;">
							Destination
						</th>
						<th class="text-center " width="20%;">							
								Mode of travel 						
						</th>
						<th class="text-center " width="20%;">							
								Class of Travel 						
						</th>
						<th class="text-center " width="20%;">							
								Ticket Number 						
						</th>
						
					</tr>
				</thead>
				<tbody>
<%
		    if(travelDetails.size() > 0) {
      for ( int ii = 0; ii < travelDetails.size(); ii++ ) {

    Hashtable travelDetails1= (Hashtable) travelDetails.get(ii);

            String fromdate = "fromdate" + ii;
			String todate	= "todate" + ii;
			String kms	= "kms" + ii;
			String add	= "add" + ii;
			String mode	= "mode" + ii;
			String clas ="class"+ ii;
			String ticket ="ticket"+ ii;
			String origin ="origin"+ ii;

			fromdate	    = ( String ) travelDetails1.get("fromdate");
			todate		    = ( String ) travelDetails1.get("todate");
			kms             = ( String ) travelDetails1.get("kms");
			add             = ( String ) travelDetails1.get("add");
			mode            = ( String ) travelDetails1.get("mode");
			clas			= ( String ) travelDetails1.get("class");
			ticket			= ( String ) travelDetails1.get("ticket");
			origin			= ( String ) travelDetails1.get("origin");

        /*out.println("fromdate ="+fromdate);
        out.println("todate= "+todate);
        out.println("kms ="+kms);
        out.println("add="+add);
        out.println("mode= "+mode);*/

	%>
					<tr id='addr0'>
						<td class="text-center">
							<%=ii+1%>   
						</td>
						<td>
						<div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;">
							<%=fromdate%>   
						</div>
						</td>
						<td>
							<div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;">
							<%=todate%>
</div>
						</td>
						<td>
                           <div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;">
							<%=kms%>
                            </div>
						</td>
						<td>
						<%=(origin ==null) ? "" : origin%>
                       
						</td>
						<td>
						<%=(add ==null) ? "" : add%>
                      
						</td>
						<td>
							<div class="grp has-feedback"> <%=mode%></div>
						</td>	
						<td>
							<div class="grp has-feedback"> <%=(clas ==null) ? "" : clas%></div>
						</td>	
						<td>
							<div class="grp has-feedback"><%=(ticket ==null) ? "" : ticket%></div>
						</td>	
					</tr>					
<%}}%>	                     <tr id='addr1'></tr> 
					
				</tbody>
					
			</table>
			
			
<input type="hidden" name="count" value="0" />
<input type="hidden" name="count1" value="0" />
			
			
			<hr style="margin-bottom:10px;">
			<h3 >Family / Traveller Details : </h3> 
			<hr style="margin-bottom:10px;">
				<table class="table table-bordered table-hover table-responsive" id="tab_logic2" >	

				<thead>
					<tr class="info">
						<th class="text-center" style="width:2%;">
							Sr.No.
						</th>
						<th class="text-center" style="width:20%;">							
								Name of person							
						</th>
						<th class="text-center" style="width:15%">							
								Relationship with employee
						</th>
						<th class="text-center" style="width:30%">
							Remarks
						</th>
						
						
					</tr>
				</thead>
<%

    if(travellerDetails.size() > 0) {
        for ( int ii = 0; ii < travellerDetails.size(); ii++ ) {

    Hashtable travellerDetails2= (Hashtable) travellerDetails.get(ii);

        String nameOfPerson = "nameOfPerson" + ii;
        String relation	= "relation" + ii;
        String remarks	= "remarks" + ii;

        nameOfPerson	    = ( String ) travellerDetails2.get("nameOfPerson");
        relation		    = ( String ) travellerDetails2.get("relation");
        remarks             = ( String ) travellerDetails2.get("remarks");
%>		
				<tbody>
	
					<tr id='addr20'>
						<td class="text-center" >
							 <%=ii+1%>
						</td>
						<td style="width:10px;"><input type="hidden" id="refreshed" value="no"/>
						<div class="form-group grp has-feedback" style="margin-left:5px;margin-right:5px;">
								<div class="input-icon">
									<%=nameOfPerson%>
									
								</div>
						</div>		
						</td>
						<td>
                            <%=relation%>
						</td>
						<td>
                            <%=remarks%>
						</td>
					</tr>					

<%}}%>	
                    <tr id='addr21'></tr>									
				</tbody>		
				<thead>
										<tr >
											<th colspan="4" class="text-left" >
												Attached Documents
											</th>
										</tr>
									</thead>
				<!-- <tr>
											<td colspan="2"  id="attachment1"></td>											
										</tr> -->
				<thead>
										<tr >
											<th colspan="4" class="text-center" id="attachment1">
												Attached Documents
											</th>
										</tr>
									</thead>
			</table>
			</div>
<%}%>
		</form>
	</div>
</div>
	</div>
	
</div>
</div>
<%
}else{
		response.sendRedirect("/timescape/includes/unauthorized.html");
	}


%>
</body>
</html>

