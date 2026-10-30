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
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.io.*" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 
<jsp:useBean id="BennetTouchController" class="com.bccl.bennettouch.web.controller.BennetTouchWebController"/>
<%@ page import="com.bccl.util.JcoGetDataFromSAP"%>

   <!DOCTYPE html>
 <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> LTA </title>

<link href="../style/global.css" rel="stylesheet" type="text/css" />
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
          //  document.getElementById('printlinks').style.visibility = 'visible'; 
          //  document.getElementById('printlinks1').style.visibility = 'visible'; 
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
    </head>
<%


String[] tags = {"journey", "travellers"};

	//String txnId = (String)request.getParameter("Id");
	String applicationId = (String)session.getAttribute("applicationId");



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
    String  userStatus      =   "";
    String  approverStatus  =   "";
    String  modifiedOn  =   "";
    String  createdOn  =   "";
    String  ltaAmount  =   "";
    String empApplicationId ="";

        if(annualHeader.length>0)
        {
            selectedPl      =   annualHeader[18];
            exemption       =   annualHeader[1];
            ltaProposedAmt  =   annualHeader[2];
            ltaApprovedamt  =   annualHeader[3];
            userStatus      =   annualHeader[10];
            approverStatus  =   annualHeader[5];
            modifiedOn      =   annualHeader[9];
            ltaAmount       =   annualHeader[20];
            empApplicationId       =   annualHeader[0];
            createdOn       =   annualHeader[7];
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



	SAPConnectionDetails.put("CLIENT","700");
	SAPConnectionDetails.put("USERID","tsrfc");
	SAPConnectionDetails.put("PASSWORD","welcome");
	SAPConnectionDetails.put("LANGUAGE","EN");
	//SAPConnectionDetails.put("HOSTNAME","10.200.65.51"); // for ppr new
	//SAPConnectionDetails.put("HOSTNAME","10.200.67.56"); // for PROD new
	//SAPConnectionDetails.put("HOSTNAME","10.200.66.76"); // for QR3 new
	//SAPConnectionDetails.put("HOSTNAME",hostname); // for PROD new
	SAPConnectionDetails.put("HOSTNAME","10.200.67.176"); 
	SAPConnectionDetails.put("SYSTEMNO","01");
	//SAPConnectionDetails.put("SYSTEMNO",systemno);
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

<% String optionValue ="ARC";//A-annual,V-reviewer,C-checkstatus
session.setAttribute("optionValue",optionValue);
%>
<form name="annuallta"   >
<table border="0" bordercolor="#f0f0f0"  cellpadding="2" cellspacing="0" width="100%" >
<tr>
    <td width="100%" align="right" class="normal">
            <input name="printbutton" type="button" class="style4" id="printbutton" value="Print" onclick="javascript:hideImage();window.print();showImage();"/>	
    </td>
</tr>
</table>

<table border="1" bordercolor="#f0f0f0"  cellpadding="2" cellspacing="0" width="100%">
<tr>
    <td width="85%" align="center" class="normal" bgcolor="#337AB7"><span class="white"><h3>Application For Claiming Annual LTA - Application ID <%=empApplicationId%></h3></span></td>
    <td width="15%" align="center" class="normal" bgcolor="#337AB7"><span class="white">
<%if(userStatus.equals("A")){
    %><b>Status:</b> Approved
    <%}else if(userStatus.equals("L")){%>
    <b>Status:</b> In-Process
    <%}else if(userStatus.equals("R")){%>
    <b>Status:</b> Rejected
    <%}else if (userStatus.equals("C")){%>
    <b>Status:</b> Cancelled
<%}%></span>
</td>
</tr>
</table>
<br>
<table border="1" bordercolor="#f0f0f0"  cellpadding="2" align="center" cellspacing="0" width="80%">
<tr>
    <td class="normal"><b>Employee Name :</b></td>
    <td class="normal"><%=displayName%></td>
    <td class="normal"><b>SAP ID :</b></td>
    <td class="normal"><%=sapId%></td>
</tr>
<tr>
    <td class="normal"><b>Branch :</b></td>
    <td class="normal"><%=branchName%></td>
    <td class="normal"><b>DOJ :</b></td>
    <td class="normal"><%=joiningdate%></td>
</tr>
<tr>
    <td class="normal"><b>Designation :</b></td>
    <td class="normal"><%=designation%></td>
    <td class="normal"><b>Financial Year :</b></td>
    <td class="normal"><%= faYear %> - <%= nextYear %></td>
</tr>
<tr>
    <td class="normal"><b>Department :</b></td>
    <td class="normal"><%=deptname%></td>
    <td class="normal"><b>Tel/Mob :</b></td>
    <td class="normal"><%=employeeMobile%></td>
</tr>
<tr>
    <td class="normal"><b>Privilege Leave Period :</b></td>
    <td class="normal"><%=selectedPl%></td>
    <td class="normal"><b>LTA Amount :</b></td>
    <td class="normal"><%=ltaAmount%></td>
</tr>



			
<%if(exemption.equals("N")){%>
<tr>
    <td class="normal"></td>
    <td class="normal"></td>
    <td class="normal"><b>Approved Amount :</b></td>
    <td class="normal"><%=ltaApprovedamt%></td>
</tr>
           

</table>
   <%}//if(approverStatus.equals("NA")){}else{%>
<%if(exemption.equals("Y")){%>

<table border="0" bordercolor="#f0f0f0"  cellpadding="2" align="center" cellspacing="0" width="100%">
<br>
<tr> 
    <td align="left" class="normal"  width="15%"><b>Approver Remarks :</b></td>
    <td class="normal"><%=approverStatus%></td>
</tr>

</table>
<br>
<table border="0" bordercolor="#f0f0f0"  cellpadding="2" align="center" cellspacing="0" width="100%">
<tr>
<td class="normal">	<b><u>Travel Details</u> </b></td>
</tr>
<tr>
<td class="normal"><input type="checkbox" calss="myCheckbox" name="trav" id="trav"<%if(exemption.equals("Y")){%> checked disabled<%}else{%>  disabled<%}%>/> <b>Tax Exemption</b>
</td>
</tr>
<tr>
 <td class="normal" bgcolor="#337AB7"><h4><span class="white">Application to Claim Exemption on LTA Availed</h4></span></td>
        <td class="normal" align="right" bgcolor="#337AB7"><b><span class="white">Current LTA Exemption Block: <%=blockStartDate%> to <%=blockEndDate%>
</b></span></td>                             
</tr>
</table>
<br>
<table border="1" bordercolor="#f0f0f0"  cellpadding="2" align="center" cellspacing="0" width="100%">
<tr>
    <td class="normal" width="15%"><b>Tax Exemption Taken On:</b></td>
    <td class="normal" width="19%"><%=modifiedOn%></td>
    <td class="normal" width="17%" align="right"><b>Bill Amount:</b>&nbsp;</td>
    <td class="normal" width="17%" ><%=ltaProposedAmt%></td>
    <td class="normal" width="17%" align="right"><b>Approved Bill Amount:</b>&nbsp;</td>
    <td class="normal" width="15%"><%=ltaApprovedamt%></td>
</tr>
</table>

<table  border="1" bordercolor="#f0f0f0"  cellpadding="2" align="center" cellspacing="0" width="100%">	
<tr>
    <td class="normal"  width="2%" align="center"><b>Sr.No.</b></td>
    <td class="normal" width="15%" align="center"><b>From Date</b></td>
    <td class="normal" width="15%" align="center"><b>To Date</b></td>
    <td class="normal" width="10%" align="center"><b>Kms</b></td>
	<td class="normal" width="20%" align="center"><b>Origin</b> </td>
    <td class="normal" width="30%" align="center"><b>Destination</b> </td>
    <td class="normal" width="10%" align="center"><b>Mode of travel </b></td>
	<td class="normal" width="12%" align="center"><b>Class of Travel  </b></td>
	<td class="normal" width="18%" align="center"><b>Ticket Number  </b></td>
</tr>


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

	%>


<tr>
    <td class="normal"><%=ii+1%>  </td>
    <td class="normal" align="center"><%=fromdate%>  </td>
    <td class="normal" align="center"><%=todate%></td>
    <td class="normal" align="center"><%=kms%></td>
	<td class="normal" > <%=(origin ==null) ? "" : origin%></td>
    <td class="normal" > <%=(add ==null) ? "" : add%></td>
    <td class="normal" align="center"><%=mode%></td>
    <td class="normal" align="center"> <%=(clas ==null) ? "" : clas%></td>
    <td class="normal" align="center"><%=(ticket ==null) ? "" : ticket%></td>
</tr><br>
<%}}%>	
</table>
<br>
<table  border="0" bordercolor="#f0f0f0"  cellpadding="2" align="center" cellspacing="0" width="100%">	
<tr>
<td class="normal"><b><u>Traveller Details </u></b> </td>
</tr>
</table>		
<table  border="1" bordercolor="#f0f0f0"  cellpadding="2" align="center" cellspacing="0" width="100%">	

<tr>
    <td class="normal" width="2%"><b>Sr.No.</b></td>
    <td class="normal" width="30%"><b>Name of person</b></td>
    <td class="normal" width="30%"><b>Relationship with employee</b></td>
    <td class="normal" width="38%"><b>Remarks</b></td>
</tr>



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
	


<tr>
    <td class="normal"> <%=ii+1%></td>
    <td class="normal"><%=nameOfPerson%></td>
    <td class="normal"><%=relation%></td>
    <td class="normal"><%=remarks%></td>
</tr>
<%}}%>
</table>
<%}%>
<br>
<table  border="0" bordercolor="#f0f0f0"  cellpadding="2" align="center" cellspacing="0" width="100%">	
<tr>
    <td class="normal" width="15%" ><b>Requested By:</b> </td>
    <td class="normal" width="35%"><%=displayName%></td>
    <td class="normal" width="40%"  align="right"><b>Requested On:</b>&nbsp; </td>
    <td class="normal" width="10%"><%=createdOn%></td>
</tr>
</table>
		</form>
</body>
</html>

