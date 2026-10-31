<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>

 <!DOCTYPE >
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> Waste Aprroval Process </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="../css/style_1.css" rel="stylesheet"/>
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-multiselect.css" rel="stylesheet">
	<link href="../css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />

	

	<!--Custom alert box-->
	<!-- <link href="../css/customalertbox/css/CustomAlert.css" rel="stylesheet" type="text/css" /> -->

	<!--[if lte IE 9]>
	<link href="../css/IE9.css" rel="stylesheet" type="text/css" type="text/css"/>
	<![endif]-->

	<!-- <script type='text/javascript'>//<![CDATA[ 

		//Custom Alert Script
		window.alert = function(message){
	    	$(document.createElement('div'))
	        .attr({'class': 'alert'})
	        .html(message)
	        .dialog({
	            buttons: {OK: function(){$(this).dialog('close');
	            //$(".v4master").css("overflow-y","auto");           
	            }},
	            close: function(){$(this).remove();
	 			 //$(".v4master").css("overflow-y","auto");           
	            },
	            draggable: false,
	            modal: true,
	            resizable: false,
	            width: 'auto',	            
	        });
	        $(".alert").parent().addClass("dummyclass");
	        $(".dummyclass").addClass("popupfixing");
		};//]]>  

	</script>
 -->

	<style>
		.select2-container .select2-selection--single 
		{
			box-sizing: border-box;
			cursor: pointer;
			display: block;
			height: 34px;		
		}
		.fa.fa-sig:after {
  position: absolute;
  content: "/";
  color: GREY;
  font-weight: 700;
  font-size: 1.2em;
  left: 7px;
  top: -1px;
  padding:0;
  margin:0;
}
	</style>	
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/bootstrap-multiselect.js"></script>	
	 <script src="../js/wysihtml5-0.3.0.min.js"></script>
	<script src="../js/bootstrap3-wysihtml5.js"></script>	
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/additional-methods.min.js"></script>	
	<script src="../js/util.js" type="text/javascript"></script>
	<script src="../js/common.js" type="text/javascript"></script>
	<script src="../js/wasteSales.js"></script>	

	
	<script>
	$(document).ready(function(){
		$('body').on('focus',".datepicker", function(){
			$(this).datepicker({ dateFormat: 'dd-mm-yy',minDate:0   });	
		});	
		$('body').on('focus',"#textarea", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		$(".js-example-basic-single").select2({ width: '100%'  });
		$('body').tooltip({
			selector: '[rel=tooltip]'
		});
		$('.textarea').wysihtml5({
			"image": false,
			"link": false
		});
		$('.multi').multiselect( {
    buttonWidth: 'col-md-10'});
		
		
		$("#demo_form").validate({
		onkeyup: function (element, event) {
            if (event.which === 9 && this.elementValue(element) === "") {
                return;
            } else {
                this.element(element);
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
		errorElement: 'span',
			errorClass: 'help-block',
			errorPlacement: function(error, element) {
				if(element.length) {
					error.insertAfter(element);
				} else {
				error.insertAfter(element);
				}
			}//, 
				//submitHandler: function () { 				
				//$('#demo_form').action("view.html");
				//$('#demo_form').attr('action', "view.html");
				//$('#demo_form').submit();				
							
			//}
		});
	$("[name^=field]").each(function () {
       $(this).rules("add", {
            required: true,
			pattern: /^(?=.*\d)\d*(?:\.\d\d)?$/,
			messages: {
            pattern:  "Valid Format is : 0.00"
        }
            
        });
    });

	$('.period').on('change', function(){

	var val1 = $(this).val();
	if(val1 == null)
	{
		val1 = "-";
	}
	//$("#abc").val(aa);
	 $('#realisationOnQnty').text(val1);
	 $('#msgId').text(val1);
	 $('#estimatedReal').text(val1);
	 $('#currPeriodRate').text(val1);
	 $('#currPeriodNPRate').text(val1);
	 $('#headerOnTopQurter').val($(this).val());

	//$('#realisationOnQnty').val($(this).val());
   
	});

	//Custom Pop up Start here
	/* $('.CustomPopup').fancybox({  
			maxWidth    : 800,
			maxHeight   : 325,
			width		: 800,
			height	    : 450,
			autoSize    : false,
			fitToView   : false,
			'type' : 'iframe'
	});
 
 */
	});
  </script>



</head>

<% 
		ArrayList emailidList = new ArrayList();

		Hashtable emailHash = new Hashtable();

		emailHash.put("COMPANYCODE", "1000");
		emailHash.put("DEPTCODE", "1002");

		emailidList = wasteSalesHeaderController.getEmailId(emailHash);

		GregorianCalendar today		= new GregorianCalendar();
        int todayDay				= today.get(Calendar.DAY_OF_MONTH);

		String months[ ]			={"0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};
		String monthsStr[ ]			= {"0","JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};


		String todayMon				= months[today.get(Calendar.MONTH)+1];
		String todayMonStr			= monthsStr[today.get(Calendar.MONTH) + 1] ;

		int  todayMonInt = Integer.parseInt(todayMon);

		int  todayYear				= today.get(Calendar.YEAR);

		String  todayYearStr		= todayYear+"";

		todayYearStr				= todayYearStr.substring(2);

		int  nextYear				= todayYear+1;
		int  previousYear			= todayYear-1;

		String  nextYearStr			= nextYear+"";
		String  previousYearStr		= previousYear+"";

		nextYearStr					= nextYearStr.substring(2);
		previousYearStr				= previousYearStr.substring(2);
		
		String dayMonYear			= todayDay + "-" + todayMon + "-" + todayYear;
   
    //    out.println("dayMonYear=="+dayMonYear);
    //    out.println("today.get(Calendar.MONTH)=="+todayMonStr);
		//String quarter[] =null;
		String quarter1 ="";
		String quarter2 ="";
		String quarter3 ="";
		String quarter4 ="";

		String preQuarter1 ="";
		String preQuarter2 ="";
		String preQuarter3 ="";
		String preQuarter4 ="";
		String preQuarter5 ="";
		String preQuarter6 ="";
		String preQuarter7 ="";
		String preQuarter8 ="";

		String no="";
		

		if(todayMonInt >= 1 && todayMonInt <=3)
		{

			quarter1 ="Q2-"+todayYearStr+" (APR'"+todayYearStr+" - "+"JUN'"+todayYearStr+")";
			quarter2 ="Q3-"+todayYearStr+" (JUL'"+todayYearStr+" - "+"SEP'"+todayYearStr+")";
			quarter3 ="Q4-"+todayYearStr+" (OCT'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			quarter4 ="Q1-"+nextYearStr+" (JAN'"+nextYearStr+" - "+"MAR'"+nextYearStr+")";

		}else if(todayMonInt >= 4 && todayMonInt <=6)
		{

			quarter1 ="Q3-"+todayYearStr+" (JUL'"+todayYearStr+" - "+"SEP'"+todayYearStr+")";
			quarter2 ="Q4-"+todayYearStr+" (OCT'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			quarter3 ="Q1-"+nextYearStr+" (JAN'"+nextYearStr+" - "+"MAR'"+nextYearStr+")";
			quarter4 ="Q2-"+nextYearStr+" (APR'"+nextYearStr+" - "+"JUN'"+nextYearStr+")";

		}else if(todayMonInt >= 7 && todayMonInt <=9)
		{
			quarter1 ="Q4-"+todayYearStr+" (JUL'"+todayYearStr+" - "+"SEP'"+todayYearStr+")";
			quarter2 ="Q1-"+nextYearStr+" (OCT'"+todayYearStr+" - "+"DEC'"+nextYearStr+")";
			quarter3 ="Q2-"+nextYearStr+" (JAN'"+nextYearStr+" - "+"MAR'"+nextYearStr+")";
			quarter4 ="Q3-"+nextYearStr+" (APR'"+nextYearStr+" - "+"JUN'"+nextYearStr+")";


		}else if(todayMonInt >= 10 && todayMonInt <=12)
		{

			quarter1 ="Q1-"+nextYearStr+" (JAN'"+nextYearStr+" - "+"MAR'"+nextYearStr+")";
			quarter2 ="Q2-"+nextYearStr+" (APR'"+nextYearStr+" - "+"JUN'"+nextYearStr+")";
			quarter3 ="Q3-"+nextYearStr+" (JUL'"+nextYearStr+" - "+"SEP'"+nextYearStr+")";
			quarter4 ="Q4-"+nextYearStr+" (OCT'"+nextYearStr+" - "+"DEC'"+nextYearStr+")";
	

			preQuarter1 ="Q4-"+todayYearStr+" (OCT'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			preQuarter2 ="Q3-"+todayYearStr+" (JUL'"+todayYearStr+" - "+"SEP'"+todayYearStr+")";
			preQuarter3 ="Q2-"+todayYearStr+" (APR'"+todayYearStr+" - "+"JUN'"+todayYearStr+")";
			preQuarter4 ="Q1-"+todayYearStr+" (JAN'"+todayYearStr+" - "+"MAR'"+todayYearStr+")";

			preQuarter5 ="Q4-"+previousYearStr+" (OCT'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			preQuarter6 ="Q3-"+previousYearStr+" (JUL'"+previousYearStr+" - "+"SEP'"+previousYearStr+")";
			preQuarter7 ="Q2-"+previousYearStr+" (APR'"+previousYearStr+" - "+"JUN'"+previousYearStr+")";
			preQuarter8 ="Q1-"+previousYearStr+" (JAN'"+previousYearStr+" - "+"MAR'"+previousYearStr+")";

		} 

		String quarter[]	={quarter1,quarter2,quarter3,quarter4};

		String preQuarter[] ={preQuarter1,preQuarter2,preQuarter3,preQuarter4,preQuarter5,preQuarter6,preQuarter7,preQuarter8};

		String formName = "frmCreateWasteSalesProcess";
		 
	%>

<body onload = "onLoadDetail('0');">
	<div class="container well">
	<div class="row ">
		<div class="col-xs-1"></div>
		<div class="col-xs-10 bs-example  ">
			<div class="portlet box blue">
			<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i>  <strong>Process Waste Sales </strong>
			</div>			
			</div>
				<div class="portlet-body">
					<form class="form-horizontal" role="form" id="demo_form" name ="frmCreateWasteSalesProcess" method="post">
					<div class="form-body">
						<div class="row " style="margin-top:0px;margin-bottom:0;">
						
							<div class=" col-sm-6 col-lg-5">
							<div class="form-group">
								<label class="control-label col-sm-4 col-lg-3">REFERENCE:</label>
								<div class="col-sm-8 col-lg-9 ">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-th"></i>   
										</span>
										<input type="text" class="form-control " id="reference" name="reference" placeholder="Reference" >
									</div>
								</div>
							</div>
							</div>
							<div class="col-sm-6 col-lg-5" >
							<div class="form-group">
							<label class="control-label col-sm-3 col-lg-3">Period</label>
								<div class="col-sm-8 col-lg-9">
									<div class="input-group">
										<select multiple class="form-control multi period"  name="wsaPeriod" id="wsaPeriod" >
<% 
											for( int j=0; j<quarter.length;j++)
											{
												
												String quarterval = quarter[j].substring(0,6);
%>											
												<option value="<%=quarterval%>"><%=quarter[j]%></option>
<%									
											}
%>			
										</select>
									</div>
								</div>
							</div>
							</div>
							</div>
							<div class="row ">
							<div class="col-sm-6 col-lg-5 " >
							<div class="form-group">
							<label class="control-label col-sm-4 col-lg-3">Date:</label>
								<div class="col-sm-8 col-lg-9">
									<div class="input-group">
										<span class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</span>
									<input type="text" class="form-control datepicker"  name="createdDate" id="createdDate" placeholder="Date">
									</div>
								</div>
							</div>
							</div>
						
						
						</div>
						
						
						<!--<div class="row " style="margin-top:0px;margin-bottom:0;">
						<div class="col-xs-8">
							<div class="col-xs-2">
							<div class="form-group">
								<input type="text" class="form-control " id="pwd" placeholder="Reference">
							</div>
							</div>
							<div class="col-xs-1"><i class="fa fa-sig fa-2x" style="margin-top:0px;margin-bottom:0;"></i></div>
							<div class="col-xs-2" style="margin-left:0px;margin-bottom:0;">
							<div class="form-group">
								
										<input type="text" class="form-control " id="pwd" placeholder="Reference">
										
									</div>
								</div><div class="col-xs-1"><i class="fa fa-sig fa-2x"></i></div>
							<div class="col-xs-2">
							<div class="form-group">
								
										<input type="text" class="form-control " id="pwd" placeholder="Reference">
										
									</div>
								</div>
								
						</div>
						</div>-->
						
						<div class="row " style="margin-top:0;margin-bottom:0;">
						<div class="col-sm-12  col-lg-12 col-lg-offset-0" >
							<h5 class="pull-right" style="font-weight:bold;">Value in Rs. Lacs</h5>
								<table class="table table-bordered">
									<thead>
										<tr class="info">
											<th class="text-center" width="20%">Branch</th>
											<th class="text-center" width="25%">Realisation in <!-- Q4-14 & Q1-15  <br>-->
                                                <select  class="form-control  " id="headerRealisation" name="headerRealisation" >
												 <option value="0">Select Previous Quarter</option>
<% 
												    for(int i=0; i<preQuarter.length;i++)
												    {												 
%>											
													   
													    <option value="<%=preQuarter[i]%>"><%=preQuarter[i]%></option>
<%
												    }
%>   
                                                </select>(Qty based on <!--  Q2-15 & Q3-15) --><label id="realisationOnQnty" name="realisationOnQnty" style="font-weight:bold;" ></label>)
                                            </th>
											<th class="text-center" width="25%">Estimated Realisation in <label id="estimatedReal" name="estimatedReal" style="font-weight:bold;"></th>
											<th class="text-center" width="25%">Increase In Realisation</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-center">										
												<select  class="form-control" id="branch" name="branch" >
													<option value="0">Select Branch</option>
													<option value="Pune">Pune</option>
													<option value="Mumbai">Mumbai</option>
													<option value="Ahemdabad">Ahemdabad</option>
													<option value="Kolhapur">Kolhapur</option>
												</select>
											
											</td>
											<td class="text-center"><input type="text" class="form-control text-right"  name="previousRealisation" id="previousRealisation" value="" onblur="javascript:calRealisation('previousRealisation','currentRealisation','IncreaseRealisation',1);"></td>
											<td class="text-center"><input type="text" class="form-control text-right" name="currentRealisation"  id="currentRealisation" value="" onblur="javascript:calRealisation('previousRealisation','currentRealisation','IncreaseRealisation',1);"></td>
											<td class="text-right"><input type="text" class="form-control text-right"name="IncreaseRealisation" id="IncreaseRealisation" readonly="true" ></td>
										</tr>
									</tbody>
								</table>
						</div>
						</div>
						<div class="row " style="margin-top:0;margin-bottom:0;">
						<div class="col-sm-12  col-lg-12 col-lg-offset-0" >
						<h5 style="font-weight:bold;margin-top:0px;"><!-- Q2-15 & Q3-15 Final Rates --><label id="msgId" name="msgId" style="font-weight:bold;" ></label> Final Rates</h5>
							<table class="table table-bordered">
								<thead>
									<tr class="info">
										<th class="text-center" width="15%">Waste Categories</th>
										<th class="text-center" width="15%"><label id="PeriodRate3" name="PeriodRate3" style="font-weight:bold;" ><%=preQuarter[3]%></label></th>
										<th class="text-center" width="15%"><label id="PeriodRate2" name="PeriodRate2" style="font-weight:bold;" ><%=preQuarter[2]%></label></th>
										<th class="text-center" width="15%"><label id="PeriodRate1" name="PeriodRate1" style="font-weight:bold;" ><%=preQuarter[1]%></label></th>
										<th class="text-center" width="15%"><label id="PeriodRate0" name="PeriodRate0" style="font-weight:bold;" ><%=preQuarter[0]%></label></th>
										<th class="text-center" width="15%"><label id="currPeriodRate" name="currPeriodRate" style="font-weight:bold;"></label> </th>
										<th class="text-center" width="10%">% Change</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-center">Printed Waste Mix</td>
										<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field1"  id="field1" onblur="javascript: indexCal2('field1','npRate1','pwm1');" ></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field2"  id="field2" onblur="javascript: indexCal2('field2','npRate2','pwm2');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field3"  id="field3"   onblur="javascript: indexCal2('field3','npRate3','pwm3');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field4"  id="field4"  onblur="javascript:calRealisation('field4','field5','finalPWM',2),indexCal2('field4','npRate4','pwm4');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field5"   id="field5" onblur="javascript:calRealisation('field4','field5','finalPWM',2), indexCal2('field5','npRate5','pwm5');"></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " value="" name="finalPWM" id="finalPWM" disabled></div></td>
									</tr>
									<tr>
										<td class="text-center">Tear Off White</td>
										<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field6" id="field6" onblur="javascript: indexCal2('field6','npRate1','tow1');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field7" id="field7" onblur="javascript: indexCal2('field7','npRate2','tow2');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field8" id="field8"  onblur="javascript: indexCal2('field8','npRate3','tow3');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field9" id="field9" onblur="javascript:calRealisation('field9','field10','finalTOW',2),indexCal2('field9','npRate4','tow4');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field10" id="field10" onblur="javascript:calRealisation('field9','field10','finalTOW',2),indexCal2('field10','npRate5','tow5');;"></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="finalTOW" id= "finalTOW" disabled></div></td>
									</tr>
									<tr>
										<td class="text-center">Reelends SNP Paper</td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field11" id="field11" onblur="javascript: indexCal2('field11','npRate1','resp1');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field12"  id="field12" onblur="javascript: indexCal2('field12','npRate2','resp2');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field13"  id="field13"  onblur="javascript: indexCal2('field13','npRate3','resp3');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field14"  id="field14" onblur="javascript:calRealisation('field14','field15','finalRSP',2),indexCal2('field14','npRate4','resp4');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field15"  id="field15" onblur="javascript:calRealisation('field14','field15','finalRSP',2),indexCal2('field15','npRate5','resp5');"></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="finalRSP" id="finalRSP" disabled></div></td>
									</tr>
									<tr>
										<td class="text-center">Press Sweepings</td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field16"  id="field16" onblur="javascript: indexCal2('field16','npRate1','ps1');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field17"  id="field17" onblur="javascript: indexCal2('field17','npRate2','ps2');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field18"  id="field18"  onblur="javascript: indexCal2('field18','npRate3','ps3');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field19"  id="field19" onblur="javascript:calRealisation('field19','field20','finalPS',2),indexCal2('field19','npRate4','ps4');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field20"  id="field20" onblur="javascript:calRealisation('field19','field20','finalPS',2),indexCal2('field20','npRate5','ps5');"></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="finalPS" id="finalPS" disabled></div></td>
									</tr>
									<tr>
										<td class="text-center">Aluminium Plates</td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field21" id="field21" onblur="javascript: indexCal2('field21','npRate1','ap1');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field22" id="field22" onblur="javascript: indexCal2('field22','npRate2','ap2');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field23" id="field23"  onblur="javascript: indexCal2('field23','npRate3','ap3');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field24" id="field24" onblur="javascript:calRealisation('field24','field25','finalAP',2),indexCal2('field24','npRate4','ap4');"></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field25" id="field25" onblur="javascript:calRealisation('field24','field25','finalAP',2),indexCal2('field25','npRate5','ap5');"></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="finalAP" id="finalAP"disabled></div></td>
									</tr>
								</tbody>
							</table>
						</div>
						</div>
						<div class="row " style="margin-top:0;margin-bottom:0;">
						<div class="col-sm-12  col-lg-12 col-lg-offset-0" >
							<h5 style="font-weight:bold;margin-top:0px;"><span style="text-decoration:underline;">P.S.- All rates in Rs./Kg</span><br>
							Index = (Final waste price / $NP rate) X 1000</h5>
			<table class="table table-bordered">
				<thead>
					<tr class="warning" >
						<th class="text-center" width="15%">$ NP Rate</th>
						<th class="text-center" width="15%"><input type="text" class="form-control text-right " name="npRate1" id="npRate1" onblur="javascript: indexCal('field1','field6','field11','field16','field21','npRate1','pwm1','tow1','resp1','ps1','ap1');"></th>
						<th class="text-center" width="15%"><input type="text" class="form-control text-right " name="npRate2" id="npRate2" onblur="javascript: indexCal('field2','field7','field12','field17','field22','npRate2','pwm2','tow2','resp2','ps2','ap2');"></th>
						<th class="text-center" width="15%"><input type="text" class="form-control text-right " name="npRate3" id="npRate3" onblur="javascript: indexCal('field3','field8','field13','field18','field23','npRate3','pwm3','tow3','resp3','ps3','ap3');"></th>
						<th class="text-center" width="15%"><input type="text" class="form-control text-right " name="npRate4" id="npRate4" onblur="javascript: indexCal('field4','field9','field14','field19','field24','npRate4','pwm4','tow4','resp4','ps4','ap4');"></th>
						<th class="text-center" width="15%"><input type="text" class="form-control text-right " name="npRate5" id="npRate5" onblur="javascript: indexCal('field5','field10','field15','field20','field25','npRate5','pwm5','tow5','resp5','ps5','ap5');"></th>
						
					</tr>
				</thead>
				<thead>
					<tr class="info">
						<th class="text-center" width="18%">Waste Categories</th>
						<th class="text-center" width="9%"><%=preQuarter[3]%></th>
						<th class="text-center" width="16%"><%=preQuarter[2]%></th>
						<th class="text-center" width="16%"><%=preQuarter[1]%></th>
						<th class="text-center" width="16%"><%=preQuarter[0]%></th>
						<th class="text-center" width="16%"><label id="currPeriodNPRate" name="currPeriodNPRate" style="font-weight:bold;"></label>  </th>
						
					</tr>
				</thead> 
				<tbody>
					<tr>
						<td class="text-center">Printed Waste Mix</td>
						<td class="text-center"><input type="text" class="form-control text-right " name="pwm1" id="pwm1" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="pwm2" id="pwm2" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="pwm3" id="pwm3" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right "name="pwm4" id="pwm4" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="pwm5" id="pwm5" disabled></td>
						
						
					</tr>
					<tr>
						<td class="text-center">Tear Off White</td>
						<td class="text-center"><input type="text" class="form-control text-right " name="tow1" id="tow1" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="tow2" id="tow2" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="tow3" id="tow3" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="tow4" id="tow4" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="tow5" id="tow5" disabled></td>
						
						
						
					</tr>
					<tr>
						<td class="text-center">Reel Ends SNP Paper</td>
						<td class="text-center"><input type="text" class="form-control text-right " name="resp1" id="resp1" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="resp2" id="resp2" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="resp3" id="resp3" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="resp4" id="resp4" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="resp5" id="resp5" disabled></td>
						
						
					</tr>
					<tr>
						<td class="text-center">Press Sweepings</td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ps1" id="ps1" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ps2" id="ps2" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ps3" id="ps3" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ps4" id="ps4" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ps5" id="ps5" disabled></td>
						
						
					</tr>
					<tr>
						<td class="text-center">Aluminium Plates</td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ap1" id="ap1" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ap2" id="ap2" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ap3" id="ap3" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ap4" id="ap4" disabled></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ap5" id="ap5" disabled></td>
						
						
					</tr>
				</tbody>
			</table>
						</div>
						</div>
						<div class="row " style="margin-top:0;margin-bottom:0;">
						<div class="col-sm-12 col-lg-12">
							<h5 style="font-weight:bold;margin-top:0px;margin-bottom:15px;">Highlights For Tender</h5>
								<textarea class="textarea form-control" placeholder="Enter text ..." style=" height: 200px" name="editor" id="editor"></textarea>
						</div>
						</div>
						<h5 style="font-weight:bold;margin-top:15px;margin-bottom:0;">Approvals</h5>
						<hr style="margin-top:10px;margin-bottom:10px;"/>
						<div class="row " style="margin-top:10px;">
							<div class="col-sm-8 col-lg-5">
							<div class="form-group">
								<label class="control-label col-sm-5 col-lg-4">Regional Head:</label>
								<div class="col-sm-7 col-lg-8">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-user"></i>
										</span>
										<select class="form-control js-example-basic-single" name="zonalHeadEmailid" id="zonalHeadEmailid" onfocus="onLoadDetail();" >
											<option value = "0" >Select Emailid</option>
<%
												for (int ii=0; ii<emailidList.size(); ii++)
												{
													 String emailidArr[] = (String[])emailidList.get(ii);
%>
													<option value="<%=emailidArr[0]%>|<%=emailidArr[4]%>|<%=emailidArr[6]%>"><%=emailidArr[6]%></option>
					
<%
												}

%>

										</select>
									</div>
								</div>
							</div>
							</div>
						</div>
						</div>

						<h5 style="font-weight:bold;margin-top:0px;margin-bottom:0;">Attachments</h5>
						<hr style="margin-top:10px;margin-bottom:10px;"/>
						<div class="row " >
							<div class="col-sm-12 col-lg-6 " >
								<table class="table table-bordered table-hover" id="tab_logic7" >			
									<thead>
										<tr >
											<th colspan="2" class="text-center" >
												Compulsary Attachments
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('compulsary','0');" > <img src="../images/attachment.png" border="0" /></a> </td>	
										</tr>	
										<tr>
											<td colspan="2"  id="attachment"></td>	<!-- <input type="text" name="hiddDirectorySizecompulsary" id="hiddDirectorySizecompulsary" value="0"> -->
											
										</tr>
									</tbody>				
								</table>
							</div>	
							<div class="col-sm-12 col-lg-6  ">
								<table class="table table-bordered table-hover" id="tab_logic7">			
									<thead>
										<tr >
											<th colspan="2" class="text-center" >
												Additional Attachments
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('additional','0');" ><img src="../images/attachment.png" border="0" /></a> </td>	
										</tr>	
										<tr>
											<td colspan="2"  id="attachment1"></td><!-- <input type="text" name="hiddDirectorySizeadditional" id="hiddDirectorySizeadditional" value="0">	 -->
											
										</tr>
									</tbody>			
								</table>
							</div>

						</div>


						<div class="row ">
							<div class="col-xs-10">
								<div class="form-actions" style="margin-top:10px;">
								<div class="col-xs-offset-5 col-xs-5">
								<input type="button" class="btn btn-info" value="Submit" name="submitButton" height="20" onclick = "javascript:validate('inProcess','<%=formName%>');"/>
								<button type="reset" class="btn btn-primary" style="width:70px;">Reset</button>
								<input type="button"  class="btn btn-warning"  value="Save As Draft" name="submitButton" id="submitButton" height="20" onclick = "javascript:validate('draft','<%=formName%>');"/>
								<!-- 	<button type="button" class="btn btn-info " style="width:70px;"  onclick="javascript:saveFormDetails();">Submit</button> 
									
									<button type="reset" class="btn btn-warning" style="width:120px;">Save As Draft</button>-->
								</div>
								</div>
							</div>
						</div>

						<input type="hidden" name="headerOnTopQurter" id="headerOnTopQurter" value="">
						<input type="hidden" name="PeriodRate1" id="PeriodRate1" value="<%=preQuarter[3]%>">
						<input type="hidden" name="PeriodRate2" id="PeriodRate2" value="<%=preQuarter[2]%>">
						<input type="hidden" name="PeriodRate3" id="PeriodRate3" value="<%=preQuarter[1]%>">
						<input type="hidden" name="PeriodRate4" id="PeriodRate4" value="<%=preQuarter[0]%>">
						<input type="hidden" name="action" id="action" value="">

					</div>
					</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-1"></div>
	</div>
	
</body>
</html>
