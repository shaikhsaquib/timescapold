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


    <html >
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
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

    </head>
<%


String[] tags = {"journey", "travellers"};

	//String txnId = (String)request.getParameter("Id");
	String applicationId = (String)request.getParameter("applicationId");

//String applicationId="201509015455";

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

        if(annualHeader.length>0)
        {
            selectedPl      =   annualHeader[18];
            exemption       =   annualHeader[1];
            ltaProposedAmt  =   annualHeader[2];
            ltaApprovedamt  =   annualHeader[3];
        }else
            {
                selectedPl          ="NA";
                exemption           ="NA";    
                ltaProposedAmt      ="NA";    
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
				
				tempvalue = tempvalue + annualHeader[2].charAt(lengthCount);
				
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
    
    ArrayList ltaBalResult	= new ArrayList();

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
		}
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
}}

%>
<%String ltaRoleId	= (String) session.getAttribute("ltaRoleId");%>
<%@ include file="../includes/relatedlinks.jsp" %>

<% String optionValue ="APC";//A-annual,P-processor,A-apply
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%@ include file="../includes/annualmenutabs.jsp" %>
<div class="container">
<div class="row">
    <div class="col-xs-1"></div>
	
	<div class="col-xs-10 bs-example">	
		<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i>    Application For Claiming Annual LTA/TAX Exemption
			</div>			
		</div>
	<div class="portlet-body">
	<div class="alert alert-warning ">
	<p> <span style="color: #e32;">*</span>  Mandatory, only in case of claiming tax Exemption.</p>	
	<p> <span style="color: #e32;">*</span><span style="color: #e32;">*</span> Mandatory, for all types of claim requests.</p>		
	</div>
		<form name="annuallta" action="../requestor/submitannuallta.jsp"  method="post" class="form-horizontal" role="form" style="margin-top:15px;" id="ann_lta">
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
							<label class="control-label col-xs-4">DOR/JOC</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-calendar-o" style="width:12px;"></i>
									</span>
									<input type="text" class="form-control" placeholder="DOR/JOC" id="joc" name="joc" readonly>
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

				<div class="row">
					<div class="col-xs-6">
						<div class="form-group grp has-feedback">							
							<label class="control-label col-xs-4">Select Privilege Leave Period <span style="color: #e32;">*</span><span style="color: #e32;">*</span></label>
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
						
					<div class="col-xs-6">
						<div class="form-group ">
							<label class="control-label col-xs-4">Claim Balance</label>
							<div class="col-xs-8">
								<div class="input-group">
								<div class="input-icon">
										<i class="fa fa-inr" style="width:15px;" ></i>
									<input type="text" class="form-control" placeholder="Claim Balance" name="claimbalance" id="claimbalance"  style="width:285px;"  value= "<%=ltaBal[0]%>"readonly>
									</span>
								</div>
								</div>
							</div>
						</div>
					</div>														
				</div>
			</div>
<hr>
	<h3>Travel Details : </h3><hr>

		<div class="row">
			<input type="checkbox" calss="myCheckbox" name="trav" id="trav"style="margin-left:15px;margin-bottom:15px;"<%if(exemption.equals("Y")){%> checked disabled<%}else{%>  disabled<%}%>/> Exemption <i class="fa fa-info-circle" data-toggle="tooltip" data-placement="right" data-html="true" data-original-title="if checked,then above fields will be mandatory.If unchecked, & submitted,then 'Claim Exemption' link  would be available against the same TXN  for submitting the Exemption at a later date!"></i>
		</div>


        <div class="row">
            <div class="col-xs-6">
                <div class="form-group grp has-feedback">
                    <label class="control-label col-xs-3">Proposed LTA Amount <span style="color: #e32;">*</span></label>
                <div class="col-xs-8">
                <div class="input-group">
                <div class="input-icon">
                    <i class="fa fa-inr" style="width:15px;" ></i>

                    <input type="text" class="form-control hidden-sm xyz " placeholder="LTA Amount" name="amount" id="amt"  style="width:285px;" value= "<%=ltaProposedAmt%>"disabled>
                <input  name = "amount1" id="amount1" type="hidden" value="<%=ltaProposedAmt%>" />
                <!-- <input type="text" class="form-control hidden-md hidden-lg" placeholder="LTA Amount" name="amount" id="amt"  style="width:332px;"> -->
                    </span>

                </div>
                </div>
                </div>
                </div>

 </div>
                <div class="col-xs-6">
                <div class="form-group grp has-feedback">
                    <label class="control-label col-xs-3">Approved LTA Amount <span style="color: #e32;">*</span></label>
                <div class="col-xs-8">
                <div class="input-group">
                <div class="input-icon">
                    <i class="fa fa-inr" style="width:15px;" ></i>

                    <input type="text" class="form-control hidden-sm xyz " placeholder="Approved LTA Amount" name="approvedamount" id="approvedamount"  style="width:285px;" value= "<%=ltaApprovedamt%>"disabled>
                <input  name = "amount1" id="amount1" type="hidden" value="<%=ltaApprovedamt%>" />
                <!-- <input type="text" class="form-control hidden-md hidden-lg" placeholder="LTA Amount" name="amount" id="amt"  style="width:332px;"> -->
                    </span>

                </div>
                </div>
                </div>
                </div>
            </div>	
        </div>

<%if(exemption.equals("Y")){%>
			<table class="table table-bordered table-hover table-responsive" id="tab_logic">	
				<thead>
					<tr>
						<th colspan="1" class="text-left">
							
						</th>
						<th colspan="2" class="text-center ">							
							Place <span style="color: #e32;">*</span>							
						
						</th>
						<th colspan="1" class="text-left">
							
						</th>
						<th colspan="1" class="text-left">
							
						</th>
						<th colspan="3" class="text-left">
							
						</th>
					</tr>
				</thead>
				<thead>
					<tr >
						<th class="text-center" width="2%;">
							Sr.No.
						</th>
						<th class="text-center" width="15%;">							
								From <span style="color: #e32;">*</span>							
						</th>
						<th class="text-center" width="15%;">							
								To <span style="color: #e32;">*</span>
						</th>
						<th class="text-center" width="10%;">
							Kms
						</th>
						<th class="text-center" width="20%;">
							Address
						</th>
						<th class="text-center " width="20%;">							
								Mode of travel <span style="color: #e32;">*</span>							
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

			fromdate	    = ( String ) travelDetails1.get("fromdate");
			todate		    = ( String ) travelDetails1.get("todate");
			kms             = ( String ) travelDetails1.get("kms");
			add             = ( String ) travelDetails1.get("add");
			mode            = ( String ) travelDetails1.get("mode");

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
                        <%=add%>
						</td>
						<td>
							<div class="grp has-feedback"> <%=mode%></div>
						</td>														
					</tr>					
<%}}%>	                     <tr id='addr1'></tr> 
					
				</tbody>
					
			</table>
			
			
<input type="hidden" name="count" value="0" />
<input type="hidden" name="count1" value="0" />
			
			
			<hr>
			<h3 >Traveller Details : </h3> 
			<hr>
				<table class="table table-bordered table-hover table-responsive" id="tab_logic2" >	

				<thead>
					<tr >
						<th class="text-center" style="width:2%;">
							Sr.No.
						</th>
						<th class="text-center" style="width:20%;">							
								Name of person<span style="color: #e32;">*</span>							
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
			</table>
			</div>
<%}%>
		</form>
	</div>
</div>
	</div>
	<div class="col-xs-1"></div>
</div>
</div>

</body>
</html>

