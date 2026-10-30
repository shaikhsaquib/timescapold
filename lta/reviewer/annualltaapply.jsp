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
<%@ page errorPage="../common/errorPage.jsp"%>
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
    
<script type="text/javascript">
        onload=function(){
            var e=document.getElementById("refreshed");
            if(e.value=="no"){
                e.value="yes";
            }

            else{
                e.value="no";
                location.reload();
            }
        }
    </script>   
	<script>
	$(document).ready(function(){		
      var i=0;
     $("#add_row").click(function(){
     i++;
  	$('#addr'+i).html("<td class='text-center'>"+ (i+1) +"</td> <td> <div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'> <input name='from"+i+"' id='from"+i+"' type='text' placeholder='From' class='form-control input-xs datepicker from'  /> </div></td><td> <div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'> <input name='to"+i+"' id='to"+i+"' type='text' placeholder='To' class='form-control input-xs datepicker to'  /> </div></td> <td> <div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='km"+i+"' id='km"+i+"' type='text' placeholder='Kms' class='form-control input-xs km'  /> </div></td> <td><textarea name='add"+i+"'  placeholder='Address' class='form-control abc noresize' rows='3' maxlength='1000' id='textarea' rel='tooltip' title=''/></textarea> </td> <td> <div class='grp has-feedback'>  <select  name='mode"+i+"' id='mode"+i+"' class='form-control mode pqr'>' '<option value=''>select</option>' '</option value='air'><option>Air</option>' '<option value='road'>Road</option>' '<option value='rail'>Rail</option>' '<option value='searoute'>Sea Route</option>' </div></td>  ");	
        
	$('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
    document.annuallta.count.value = i;	
//alert(document.annuallta.count.value+" I "+i); 
 
		$('.from').each(function () {
			$(this).rules("add", {
			required: true,
		});
		});
		$('.to').each(function () {
			$(this).rules("add", {
			required: true,
		});
		});

		$('.datepicker').datepicker({
			onClose: function() {$(this).valid(); }
		});
        $('.km').each(function () {
			$(this).rules("add", {
			required: false,
           pattern: /^(?=.*\d)\d*(?:\.\d\d)?$/,
        messages: {
            pattern:  "<font color=red>invalid format</font> "
        }

		});
		});
		$('.mode').each(function () {
			$(this).rules("add", {
			required: true,
		});
		});
		
	});
    $("#delete_row").click(function(){
    //alert(" i val "+i);
    
    	if(i>=1){

			$("#addr"+(i)).html('');
			i=i-1;
    document.annuallta.count.value = i;
    //alert(document.annuallta.count.value+" del "+i);
	}
	});		
	
	$('body').tooltip({
		selector: '[rel=tooltip]'
	});	   
	});
  </script>
  <script>
	$(document).ready(function(){		
      var j=0;
    $("#add_row2").click(function(){
j++;
		$('#addr2'+j).html("<td class='text-center'>"+ (j+1) +"</td> <td> <div  class='form-group grp has-feedback' style='margin-left:5px;margin-right:5px;'> <div  class='input-icon'><input name='person"+j+"' type='text' placeholder='Name of person' class='form-control xyz person '  id='person"+j+"'  style='padding-left:10px;'  /> </div></div></td> <td><select  name='sel"+j+"' id='sel"+j+"'  class='form-control input-xs pqr'>'<option>Self</option>' '<option>Spouse</option>' '<option>Child</option>' '<option>dependent Parent</option>'</td> <td><textarea name='head"+j+"' placeholder='Remarks' class='form-control abc noresize' rows='2' maxlength='25' id='head"+j+"' rel='tooltip' title=''/></textarea> </td>    ");	
	$('#tab_logic2').append('<tr id="addr2'+(j+1)+'"></tr>');

 document.annuallta.count1.value = j;	
		 
		$('.person').each(function () {
		$(this).rules("add", {
        required: true,
		pattern: /^[-a-zA-Z. ]+$/
		});
		});
				
	});   
	$("#delete_row2").click(function(){
    	if(j>=1){

			$("#addr2"+(j)).html('');
			j=j-1;
    document.annuallta.count1.value = j;
    //alert(document.annuallta.count1.value+" del "+j);
	}
	});
	
	$('body').on('focus',"#textarea", function(){
		$(this).maxlength({alwaysShow: true});		
	});	
	
	$('[data-toggle="tooltip"]').tooltip();
	
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
	$('body').on('focus',".datepicker", function(){
		$(this).datepicker({ dateFormat: 'dd-mm-yy' });		
	});	
	$('.datepicker').datepicker({
      onClose: function() {$(this).valid(); }
	});
	
	$("input:checkbox").click(function() {
    $(".xyz").attr("disabled", !this.checked); 
	$(".abc").attr("disabled", !this.checked); 
	$(".pqr").attr("disabled", !this.checked); 
	$(".ad").attr("disabled", !this.checked); 
	$(".ad1").attr("disabled", !this.checked); 
	$(".del").attr("disabled", !this.checked);
	$(".del1").attr("disabled", !this.checked); 
    
	});
	
	
	//jQuery.validator.addMethod('selectcheck', function (value) {
       // return (value != '0');
   // }, "This field is required");
	$("#ann_lta").validate({
    rules: {
        amount: {
           required: true,
			pattern: /^(?=.*\d)\d*(?:\.\d\d)?$/
        },
		prvl0: {
               required: true
        },
		mode0: {
               required: true
        },
		from0: {
                required: true
        },
		to0: {
                 required: true
        },
        km0: {
           required: false,
			pattern: /^(?=.*\d)\d*(?:\.\d\d)?$/
        },
		person0: {
			required: true,
			pattern: /^[-a-zA-Z. ]+$/
        }
		
    },
	messages:{
		
		person: {
			 required: "this field is required",
			pattern:  "invalid format "
        },
       km0:{
			pattern:  "invalid format ",
pattern:  "<font color=red>invalid format</font> "
        }		
	
	},
    highlight: function(element) {
        var id_attr = "#" + $( element ).attr("id") + "1";
        $(element).closest('.grp').removeClass('has-success').addClass('has-error');
        $(id_attr).removeClass('fa-check').addClass('fa-warning');         
    },
    unhighlight: function(element) {
        var id_attr = "#" + $( element ).attr("id") + "1";
        $(element).closest('.grp').removeClass('has-error').addClass('has-success');
        $(id_attr).removeClass('fa-warning').addClass('fa-check'); 
		
    },
    unhighlight1: function(element) {
        var id_attr = "#" + $( element ).attr("id") + "1";
        $(element).closest('.grp1').removeClass('has-error').addClass('');
        $(id_attr).removeClass('fa-warning').addClass('fa-check'); 
		
    },
    errorElement: 'span',
        errorClass: 'help-block',
        errorPlacement: function(error, element) {
            if(element.length) {
                error.insertAfter(element);
            } else {
            error.insertAfter(element);
            }
        } 
	});
	
	});
  </script>
<script  type="text/javascript">
function clearAmt(){
var newamt = document.annuallta.amount.value;
if(document.annuallta.trav.value){
    document.annuallta.amount.value="";
    
    }

}
</script>

    </head>
<%
    ArrayList ltaBalResult	= new ArrayList();
    ArrayList plBal	= new ArrayList();

    String flag = "";
	String faYear= "";
	String queryDate ="";
	
    //String roleId =  "";

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );
	//String date = (Stri ng)request.getParameter("date");
	//System.out.println("requestdate"+ date);

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
    
    Hashtable plHash    =   new Hashtable();
    String plStartDate  ="";
    String plEndDate    ="";

    String leaveType    =   "PL";
    String startDate    =   faYear;
    String endDate      =   faYear;
    String status       =   "A";
    String timescapeUId = Long.toString(timescapeUserOId);

           plHash.put("LEAVETYPE",leaveType);	
           plHash.put("TIMESCAPEUID",timescapeUId);	
           plHash.put("STARTDATE",startDate);	
           plHash.put("ENDDATE",endDate);	
           plHash.put("STATUS",status);	

  plBal	= ltaController.getListOfLeaves(plHash);
  //out.println(plBal.size());



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

Hashtable annualChkSta = new Hashtable();
String  timescapeUid			= Long.toString(timescapeUserOId);
 annualChkSta.put("TIMESCAPEUID",timescapeUid);
 annualChkSta.put("FAYEAR",faYear);

    ArrayList annualresultLst	= new ArrayList();
    annualresultLst		= ltaController.annualLtaCheckStatus(annualChkSta);
    String remarks	=	"";
//out.println("annualresultLst== "+annualresultLst.size());


    ArrayList monthlyLtaLst	= new ArrayList();
    String criteria		=	"user";
           monthlyLtaLst		= ltaController.viewLtaRecord(timescapeUserOId, faYear, criteria);

%>

<%String ltaRoleId	= (String) session.getAttribute("ltaRoleId");%>
<%@ include file="../includes/relatedlinks.jsp" %>
<% String optionValue ="AVA";//A-annual,V-reviewer,A-apply
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%@ include file="../includes/annualmenutabs.jsp" %>

</div>
<%
if (( annualresultLst.size() == 0 ) &&( monthlyLtaLst.size() == 0 ))
{
%>

<br>
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
		<form name="annuallta" action="../reviewer/submitannuallta.jsp"  method="post" class="form-horizontal" role="form" style="margin-top:15px;" id="ann_lta">
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
<%

%>
				<div class="row">
					<div class="col-xs-6">
						<div class="form-group grp">							
							<label class="control-label col-xs-4">Select Privilege Leave Period <span style="color: #e32;">*</span><span style="color: #e32;">*</span></label>
							<div class="col-xs-8">
								<div class="input-group">
									<div class="input-icon">
                        
										<i class="fa fa-umbrella" style="width:12px;"></i>
									
									<select class="form-control input-xs" name="prvl0" id="prvl0" style="width:288px;">
                                    <option value="">Select</option>
<%        
        String plStartAndEndDate  ="";
        String selected="";

            for (int i = 0; i < plBal.size(); i++){
                String plBalArr[]		= (String []) plBal.get(0) ;
                    plStartAndEndDate  = plBalArr[3]+" to "+plBalArr[5];
%>
		            <option value="<%=plStartAndEndDate%>"><%=plStartAndEndDate%></option>
<%
		}
%>
									</select>
									</div>
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
			<input type="checkbox" calss="myCheckbox" name="trav" id="trav" value="Y"style="margin-left:15px;margin-bottom:15px;" onclick="clearAmt()"/> Tax Exemption <i class="fa fa-info-circle" data-toggle="tooltip" data-placement="right" data-html="true" data-original-title="if checked,then above fields will be mandatory.If unchecked, & submitted,then 'Claim Exemption' link  would be available against the same TXN  for submitting the Exemption at a later date!"></i>
		</div>
        <div class="row">
            <div class="col-xs-6">
                <div class="form-group grp has-feedback">
                    <label class="control-label col-xs-3">Proposed LTA Amount <span style="color: #e32;">*</span></label>
                <div class="col-xs-8">
                <div class="input-group">
                <div class="input-icon">
                    <i class="fa fa-inr" style="width:15px;" ></i>

                    <input type="text" class="form-control hidden-sm xyz " placeholder="LTA Amount" name="amount" id="amt"  style="width:285px;" value= "<%=ltaAmount%>" disabled>
                <input  name = "amount1" id="amount1" type="hidden" value="<%=ltaAmount%>" />
                <input  name = "fixltaamount" id="fixltaamount" type="hidden" value="<%=ltaAmount%>" />
                <!-- <input type="text" class="form-control hidden-md hidden-lg" placeholder="LTA Amount" name="amount" id="amt"  style="width:332px;"> -->
                    </span>

                </div>
                </div>
                </div>
                </div>
            </div>	
        </div>


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
						<th class="text-center" width="18%;">							
								From <span style="color: #e32;">*</span>							
						</th>
						<th class="text-center" width="18%;">							
								To <span style="color: #e32;">*</span>
						</th>
						<th class="text-center" width="15%;">
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
				
					<tr id='addr0'>
						<td class="text-center">
							1
						</td>
						<td>
						<div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;">
							<input type="text" class="form-control input-xs datepicker xyz from" placeholder="From" name='from0' id="from0" disabled>
						</div>
						</td>
						<td>
							<div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;">
							<input type="text" class="form-control input-xs datepicker required-field-block xyz to " placeholder="To" name='to0' id="to0" disabled >	
							</div>
						</td>
						<td>
                           <div class="form-group " style="margin-left:5px;margin-right:5px;">
							<input type="text" class="form-control grp1 input-xs xyz" placeholder="Kms" name='km0' id="km0"  disabled>	
                            </div>
						</td>
						<td>
							<textarea name='add0' type="text" placeholder='Address' class='form-control abc noresize' rows='3' maxlength='1000' id='textarea' rel='tooltip' title='' disabled /></textarea>
						</td>
						<td>
							<div class="grp ">
							<select  class="form-control input-xs pqr  mode " name='mode0' id="mode1" disabled />	
								<option value="">select</option>			
								<option value="air">Air</option>
								<option value="road">Road</option>
								<option value="rail">Rail</option>
								<option value="searoute">Sea Route</option>
								
							</select>
							</div>
						</td>														
					</tr>					
                     <tr id='addr1'></tr> 
					
				</tbody>
					
			</table>
			<div class="row" >
			<a id='delete_row' class="btn btn-default pull-right btn-sm ad" style="margin-left:10px;margin-right:12px; " disabled ><i class="fa fa-times"></i> Delete Row</a><a id="add_row" class="btn btn-default pull-right btn-sm del" disabled ><i class="fa fa-plus"></i> Add Row</a>
<input type="hidden" name="count" value="0" />
<input type="hidden" name="count1" value="0" />
			</div>
			
			<hr>
			<h3 >Traveller Details : </h3> 
			<hr>
				<table class="table table-bordered table-hover table-responsive" id="tab_logic2" >	
				<div class="alert alert-warning pull-right ">
			<p> <span style="color: #e32;">*</span> Note : Name of person to include spouse and dependents.</p>	
		
			</div>
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
				<tbody>
				
					<tr id='addr20'>
						<td class="text-center" >
							1
						</td>
						<td style="width:10px;"><input type="hidden" id="refreshed" value="no"/>
						<div class="form-group grp has-feedback" style="margin-left:5px;margin-right:5px;">
								<div class="input-icon">
									<input type="text" class="form-control xyz person " placeholder="Name of person" name='person0' id='person0'  style="padding-left:10px;" autocomplete=off disabled >
									
								</div>
						</div>		
						</td>
						<td>
							<select type="text" class="form-control input-xs pqr" name='sel0'  id='sel0' disabled >							
								<option>Self</option>
								<option>Spouse</option>
								<option>Child</option>
								<option>Dependent Parent</option>
								
							</select>	
												
						</td>
						<td>
							<textarea name='head0' type="text" placeholder='Remarks' class='form-control abc noresize' rows='2' maxlength='1000' id='head0' rel='tooltip' title=''disabled /></textarea>
						</td>
																
					</tr>					
                    <tr id='addr21'></tr>									
				</tbody>				
			</table>
			<div class="row" >
				<a id='delete_row2' class="btn btn-default pull-right btn-sm ad1 " style="margin-left:10px;margin-right:12px;" disabled><i class="fa fa-times"></i> Delete Row</a><a id="add_row2" class="btn btn-default pull-right btn-sm del1" disabled ><i class="fa fa-plus"></i> Add Row</a>
			</div>
			<div class="form-actions" >
				<div class="row">
					<div class="col-xs-9">
						<div class="row">
							<div class="col-xs-offset-6 col-xs-5">
								<button type="submit" class="btn btn-info " style="width:70px;">Submit</button>		
								<button type="reset" class="btn btn-primary" style="width:70px;">Reset</button>										
							</div>
							
						</div>
					</div>					
				</div>
				<div class="alert alert-warning  ">
				<p> 
					Note : 1) Bills to be submitted by 12th of the month along with LTA tax rebate form.<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2) Employees claiming LTA in March should submit their bills before 10th March for tax rebate.
				</p>
			</div>
			</div>
<%
    } else if(monthlyLtaLst.size() > 0){
%>
<div class="col-md-1 "></div>
    <div class="col-md-8 col-md-ofset-2 bs-example" style="margin-top:100px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">

	<p style="text-align:center;margin-top:10px;">You have already applied for Monthly LTA. <br>Click <a href="../requestor/checkstatus.jsp"> here</a> for status</p>
</div>
</div>
<div class="col-md-1 "></div>
</div>
</body>
</html>  
<% 
	}else{ 
%>
<div class="col-md-1 "></div>
    <div class="col-md-8 col-md-ofset-2 bs-example" style="margin-top:100px;margin-left:100px;">
    <div class="note1 note-info" style="margin-left:120px;">

	<p style="text-align:center;margin-top:10px;">You have already applied for Annual LTA. <br>Click <a href="../requestor/annualcheckstatus.jsp"> here</a> for status</p>
</div>
</div>
<div class="col-md-1 "></div>
</div>
</body>
</html> 
<% 
	}
%>
		</form>
	</div>
</div>
	</div>
	<div class="col-xs-1"></div>
</div>
</div>

</body>
</html>

