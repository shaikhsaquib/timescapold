<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, org.json.simple.JSONObject, java.io.*, org.json.simple.parser.JSONParser" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="wasteSalesDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

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


	@media print 
	{
		body {width:1200px;color:#000;}
		div[class|=col-]{float:left;}
		.col-sm-6{width:50%}
		
	@page {
		size: 330mm 427mm;
		margin: 14mm;
	  }
	  .container {
		width: 1170px;
	  }
		.table {
    border-collapse: collapse !important;
  }
	.table td,
	.table th {
	background-color: #fff !important;
	}
	.table-bordered th,
	.table-bordered td {
	border: 1px solid #000 !important;
	}
	.form-control{
		border: 1px solid #000 !important;
	}
	.input-group-addon {border: 1px solid #000 !important;}
	.portlet {
		background-color: #006699 !important;
	}
	  .prt
	  {
		  display:none;
	  }
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
		$('.multi1').multiselect( {
		buttonWidth: 'col-md-10',numberDisplayed:0,});
		
		
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
	var npSize = $("#npratesize").val();
	var  result= "";
	var periodTxt;
	var periodQuarterTxt;
	var periodQuarterTxt1;
	var periodQuarterTxt3=",";
	var periodTxt1;
	var  value1= 0;
	var val2;
	var monthdisp;
	if(val1 == null)
	{
		val1 = "-";
		val2 = "-";
	}else
	{
		if( val1.toString().indexOf(',') != -1 )
		{
			var strs = val1.toString().split(',');
			
			var quarterStr;
			var strs1;
			for(var i =0; i<strs.length; i++)
			{
				quarterStr = strs[i];
				
				strs1 = quarterStr.substr(0, 5);
				
				periodQuarterTxt3 = strs1+","+periodQuarterTxt3;

				if(i == 0)
				{
					var dispPeriod = strs[0];

					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt = dispPeriod.substr(0, 5);
						periodTxt  = dispPeriod.substr(6, 6);
					

					}else
					{
						periodQuarterTxt = dispPeriod;
						periodTxt  = dispPeriod;
						
					}
				}
				if(i == strs.length-1)
				{
					var dispPeriod1 = strs[strs.length-1];
					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt1 = dispPeriod1.substr(0, 5);					
						periodTxt1  = dispPeriod1.substr(15, dispPeriod1.length-1);
						
					}else
					{
						periodQuarterTxt1 = dispPeriod1;					
						//periodTxt1  = dispPeriod1.substr(dispPeriod1.length-3, dispPeriod1.length-1);
					}
					
				}
				
				for(var k =0; k<npSize; k++)
				//for(var k =0; k<1; k++)
				{
					var npTxt = $("#npratevalue"+k).val();
					//npQuarterHeader = npTxt.substr(0, 5);
					var npTxtArray = npTxt.toString().split('|');
					//if(strs1  == npQuarterHeader)
					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						if(strs1 == npTxtArray[0])
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue = npTxtArray[1];

							value1 = value1+parseInt(npQuarterValue);	
						}

					}else
					{
						//if(npTxtArray[2].toString().contains(quarterStr))
						if(npTxtArray[2].toString().indexOf(quarterStr) != -1)
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue = npTxtArray[1];
							value1 = value1+parseInt(npQuarterValue);	

						}
					}

				 }	
			}
			
			result = (value1/strs.length).toFixed(2);

			if( quarterStr.toString().indexOf('\'') != -1 )
			{

				val1 = periodQuarterTxt+", "+periodQuarterTxt1+" ("+periodTxt+"-"+periodTxt1;

				//monthdisp = " ("+periodTxt+"-"+periodTxt1;
				periodQuarterTxt3 = periodQuarterTxt3.slice(0, -2); 

				val2 = periodQuarterTxt3+" ("+periodTxt+"-"+periodTxt1;

			}else
			{
				val1 = periodQuarterTxt+", "+periodQuarterTxt1;

				//monthdisp = " ("+periodTxt+"-"+periodTxt1;
				//periodQuarterTxt3 = periodQuarterTxt3.slice(0, -2); 
				val2 = val1;
			}


		 }else
		 {
			val2 = val1;
		
			strs1 = val1.toString().substr(0, 5);

			//periodQuarterTxt3 = strs1+","+periodQuarterTxt3;
			//monthdisp  = strs1.toString().substr(6, strs1.length)

			for(var k =0; k<npSize; k++)
			{
				var npTxt = $("#npratevalue"+k).val();
				//npQuarterHeader = npTxt.substr(0, 5);
				var npTxtArray = npTxt.toString().split('|');
				 
				//if(strs1  == npQuarterHeader)
				
					if( val2.toString().indexOf('\'') != -1 )
					{
						if(strs1  == npTxtArray[0])
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue =  npTxtArray[1];
							value1 = value1+parseInt(npQuarterValue);						
						}
					}else
					{
						//if(npTxtArray[2].toString().contains(val2))
							if(npTxtArray[2].toString().indexOf(val2) != -1)
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue =  npTxtArray[1];
							
							value1 = value1+parseInt(npQuarterValue);	

						}
					}
			 }

			 result = value1.toFixed(2);
		 }

		// alert(periodTxt);
		//alert(periodTxt1);		
	}

	 $('#wsaPeriodTxt').val(val2);
	 $('#npRate5').val(result);
	 $('#realisationOnQnty').text(val1);
	 $('#msgId').text(val1);
	 $('#estimatedReal').text(val1);
	 $('#currPeriodRate').text(val1);
	 $('#currPeriodNPRate').text(val1);
	 $('#headerOnTopQurter').val(val1);
	 $('#npRate5').focus();

	});



	$('.realisationPeriod').on('change', function(){

	var  result= "";
	var  value1= 0;
	var periodTxt;
	var periodQuarterTxt;
	var periodQuarterTxt1;
	var periodTxt1;
	var val2;
	var val1 = $(this).val();
	if(val1 == null)
	{
		val1 = "-";

	}else{
		if( val1.toString().indexOf(',') != -1 )
		{
			var strs = val1.toString().split(',');
			var quarterStr;
			var strs1;
			for(var i =0; i<strs.length; i++)
			{
				quarterStr = strs[i];
				strs1 = quarterStr.substr(0, 5);

				if(i == 0)
				{
					var dispPeriod = strs[0];

					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt = dispPeriod.substr(0, 5);
						periodTxt  = dispPeriod.substr(6, 6);

					}else
					{
						periodQuarterTxt = dispPeriod;
						periodTxt  = dispPeriod;
						
					}
				}
				if(i == strs.length-1)
				{
					var dispPeriod1 = strs[strs.length-1];
					
					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt1 = dispPeriod1.substr(0, 5);

						periodTxt1  = dispPeriod1.substr(15, dispPeriod1.length-1);
						
					}else
					{
						periodQuarterTxt1 = dispPeriod1;					
						//periodTxt1  = dispPeriod1.substr(dispPeriod1.length-3, dispPeriod1.length-1);
					}

				}
				
			}
			//result = (value1/strs.length).toFixed(2);
			

			if( quarterStr.toString().indexOf('\'') != -1 )
			{

				val2  = periodQuarterTxt+", "+periodQuarterTxt1+" ("+periodTxt+"-"+periodTxt1;

			}else
			{
				val2 = periodQuarterTxt+", "+periodQuarterTxt1;
			}

		 }else
		 {
			val2 = val1;
		 }
	}

	 $('#realisationHeaderOnQurter').val(val2);
   
	});


	$('.selPeriod3').on('change', function(){

	var val1 = $(this).val();

	var npSize = $("#npratesize").val();

	var  result= "";
	var  value1= 0;
	var periodTxt;
	var periodQuarterTxt;
	var periodQuarterTxt1;
	var periodTxt1;
	//var res = [];
	if(val1 == null)
	{
		val1 = "-";

	}else
	{
		if( val1.toString().indexOf(',') != -1 )
		{
			var strs = val1.toString().split(',');
			var quarterStr;
			var strs1;
			for(var i =0; i<strs.length; i++)
			{
				quarterStr = strs[i];
				strs1 = quarterStr.substr(0, 5);

				if(i == 0)
				{
					var dispPeriod = strs[0];
					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt = dispPeriod.substr(0, 5);
						periodTxt  = dispPeriod.substr(6, 6);

					}else
					{
						periodQuarterTxt = dispPeriod;
						periodTxt  = dispPeriod;
						
					}

				}
				if(i == strs.length-1)
				{
					var dispPeriod1 = strs[strs.length-1];

					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt1 = dispPeriod1.substr(0, 5);					
						periodTxt1  = dispPeriod1.substr(15, dispPeriod1.length-1);
						
					}else
					{
						periodQuarterTxt1 = dispPeriod1;					
						//periodTxt1  = dispPeriod1.substr(dispPeriod1.length-3, dispPeriod1.length-1);
					}					
				}

				for(var k =0; k<npSize; k++)
				{
					var npTxt = $("#npratevalue"+k).val();
					//npQuarterHeader = npTxt.substr(0, 5);

					var npTxtArray = npTxt.toString().split('|');

					//if(strs1  == npQuarterHeader)

					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						if(strs1 == npTxtArray[0])
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue = npTxtArray[1];

							value1 = value1+parseInt(npQuarterValue);	
						}

					}else
					{
						//if(npTxtArray[2].toString().contains(quarterStr))
						if( npTxtArray[2].toString().indexOf(quarterStr) != -1 )
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue = npTxtArray[1];
							value1 = value1+parseInt(npQuarterValue);	

						}
					}

				 }
				
			}
			result = (value1/strs.length).toFixed(2);

			if( quarterStr.toString().indexOf('\'') != -1 )
			{

				val1 = periodQuarterTxt+", "+periodQuarterTxt1+" ("+periodTxt+"-"+periodTxt1;
				//monthdisp = " ("+periodTxt+"-"+periodTxt1;
			
			}else
			{
				val1 = periodQuarterTxt+", "+periodQuarterTxt1;
			}


		 }else
		 {
			/*if( val1.toString().indexOf('\'') != -1 )
			{				
				strs1 = val1.toString().substr(0, 5);
			}else
			 {
				strs1 = val1;
			 }*/
			strs1 = val1.toString().substr(0, 5);
			for(var k =0; k<npSize; k++)
			{
				var npTxt = $("#npratevalue"+k).val();
				//npQuarterHeader = npTxt.substr(0, 5);
				var npTxtArray = npTxt.toString().split('|');
				
				if(val1.toString().indexOf('\'') != -1 )
				{
					if(strs1  == npTxtArray[0])
					{
						//npQuarterValue = npTxt.substr(5, npTxt.length-1);
						npQuarterValue =  npTxtArray[1];
						value1 = value1+parseInt(npQuarterValue);							
					}
				}else
				{
					
					if( npTxtArray[2].toString().indexOf(val1) != -1 )
				//	if(strs1 == npTxtArray[2])
					{
						//npQuarterValue = npTxt.substr(5, npTxt.length-1);
						npQuarterValue =  npTxtArray[1];
						
						value1 = value1+parseInt(npQuarterValue);
					}
				}

			
			 }

			 result = value1.toFixed(2);
		 }
	}
 
	 $('#npRate1').val(result);
	 $('#PeriodRate1').val(val1);
	 $('#selDisp3').text(val1);
	 $('#headerNPRate3').text(val1);
	 $('#npRate1').focus();
	 
	});

$('.selPeriod2').on('change', function(){

	var val1 = $(this).val();
	var npSize = $("#npratesize").val();
	var  result= "";
	var  value1= 0;
	var periodTxt;
	var periodQuarterTxt;
	var periodQuarterTxt1;
	var periodTxt1;
	
	if(val1 == null)
	{
		val1 = "-";
	}else
	{
		if( val1.toString().indexOf(',') != -1 )
		{
			var strs = val1.toString().split(',');
			var quarterStr;
			var strs1;
			for(var i =0; i<strs.length; i++)
			{
				quarterStr = strs[i];
				strs1 = quarterStr.substr(0, 5);

				if(i == 0)
				{
					var dispPeriod = strs[0];
					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt = dispPeriod.substr(0, 5);
						periodTxt  = dispPeriod.substr(6, 6);

					}else
					{
						periodQuarterTxt = dispPeriod;
						periodTxt  = dispPeriod;
						
					}
				}
				if(i == strs.length-1)
				{
					var dispPeriod1 = strs[strs.length-1];
					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt1 = dispPeriod1.substr(0, 5);					
						periodTxt1  = dispPeriod1.substr(15, dispPeriod1.length-1);
						
					}else
					{
						periodQuarterTxt1 = dispPeriod1;					
					}	
				}

				for(var k =0; k<npSize; k++)
				{
					var npTxt = $("#npratevalue"+k).val();
					//npQuarterHeader = npTxt.substr(0, 5);

					var npTxtArray = npTxt.toString().split('|');

					//if(strs1  == npQuarterHeader)

					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						if(strs1 == npTxtArray[0])
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue = npTxtArray[1];

							value1 = value1+parseInt(npQuarterValue);	
						}

					}else
					{
						if( npTxtArray[2].toString().indexOf(quarterStr) != -1 )
						//if(npTxtArray[2].toString().contains(quarterStr))
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue = npTxtArray[1];
							value1 = value1+parseInt(npQuarterValue);	

						}
					}

				 }				
			}
			result = (value1/strs.length).toFixed(2);
			if( quarterStr.toString().indexOf('\'') != -1 )
			{

				val1 = periodQuarterTxt+", "+periodQuarterTxt1+" ("+periodTxt+"-"+periodTxt1;
			
			}else
			{
				val1 = periodQuarterTxt+", "+periodQuarterTxt1;

			}

			//val1 = periodQuarterTxt+", "+periodQuarterTxt1+" ("+periodTxt+"-"+periodTxt1;


		}else
		 {
			strs1 = val1.toString().substr(0, 5);
			for(var k =0; k<npSize; k++)
			{
				var npTxt = $("#npratevalue"+k).val();
				//npQuarterHeader = npTxt.substr(0, 5);
				var npTxtArray = npTxt.toString().split('|');
				if( val1.toString().indexOf('\'') != -1 )
				{
					if(strs1  == npTxtArray[0])
					{
						//npQuarterValue = npTxt.substr(5, npTxt.length-1);
						npQuarterValue =  npTxtArray[1];
						value1 = value1+parseInt(npQuarterValue);							
					}
				}else
				{					
					if( npTxtArray[2].toString().indexOf(val1) != -1 )
				//	if(strs1 == npTxtArray[2])
					{
						//npQuarterValue = npTxt.substr(5, npTxt.length-1);
						npQuarterValue =  npTxtArray[1];
						
						value1 = value1+parseInt(npQuarterValue);

					}
				}
			
			 }

			 result = value1.toFixed(2);
		 }
	}
	$('#npRate2').val(result);
	 $('#PeriodRate2').val(val1);
	 $('#selDisp2').text(val1);
	 $('#headerNPRate2').text(val1);
	 $('#npRate2').focus();

	 
	});

	$('.selPeriod1').on('change', function(){

	var val1 = $(this).val();
	var npSize = $("#npratesize").val();
	var  result= "";
	var  value1= 0;
	var periodTxt;
	var periodQuarterTxt;
	var periodQuarterTxt1;
	var periodTxt1;
	
	if(val1 == null)
	{
		val1 = "-";
	}else
	{
		if( val1.toString().indexOf(',') != -1 )
		{
			var strs = val1.toString().split(',');
			var quarterStr;
			var strs1;
			for(var i =0; i<strs.length; i++)
			{
				quarterStr = strs[i];
				strs1 = quarterStr.substr(0, 5);

				if(i == 0)
				{
					var dispPeriod = strs[0];
					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt = dispPeriod.substr(0, 5);
						periodTxt  = dispPeriod.substr(6, 6);

					}else
					{
						periodQuarterTxt = dispPeriod;
						periodTxt  = dispPeriod;
						
					}
				}
				if(i == strs.length-1)
				{
					var dispPeriod1 = strs[strs.length-1];
					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt1 = dispPeriod1.substr(0, 5);					
						periodTxt1  = dispPeriod1.substr(15, dispPeriod1.length-1);
						
					}else
					{
						periodQuarterTxt1 = dispPeriod1;					
					}	
				}

				for(var k =0; k<npSize; k++)
				{
					var npTxt = $("#npratevalue"+k).val();
					//npQuarterHeader = npTxt.substr(0, 5);

					var npTxtArray = npTxt.toString().split('|');

					//if(strs1  == npQuarterHeader)

					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						if(strs1 == npTxtArray[0])
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue = npTxtArray[1];

							value1 = value1+parseInt(npQuarterValue);	
						}

					}else
					{
						//if(npTxtArray[2].toString().contains(quarterStr))
						if(npTxtArray[2].toString().indexOf(quarterStr) != -1 )
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue = npTxtArray[1];
							value1 = value1+parseInt(npQuarterValue);	

						}
					}

				 }				
			}
			result = (value1/strs.length).toFixed(2);
			if( quarterStr.toString().indexOf('\'') != -1 )
			{

				val1 = periodQuarterTxt+", "+periodQuarterTxt1+" ("+periodTxt+"-"+periodTxt1;
			
			}else
			{
				val1 = periodQuarterTxt+", "+periodQuarterTxt1;

			}

			//val1 = periodQuarterTxt+", "+periodQuarterTxt1+" ("+periodTxt+"-"+periodTxt1;


		}else
		 {
			strs1 = val1.toString().substr(0, 5);
			for(var k =0; k<npSize; k++)
			{
				var npTxt = $("#npratevalue"+k).val();
				//npQuarterHeader = npTxt.substr(0, 5);
				var npTxtArray = npTxt.toString().split('|');
				if(val1.toString().indexOf('\'') != -1)
				{
					if(strs1  == npTxtArray[0])
					{
						//npQuarterValue = npTxt.substr(5, npTxt.length-1);
						npQuarterValue =  npTxtArray[1];
						value1 = value1+parseInt(npQuarterValue);							
					}
				}else
				{					
					if( npTxtArray[2].toString().indexOf(val1) != -1 )
				//	if(strs1 == npTxtArray[2])
					{
						//npQuarterValue = npTxt.substr(5, npTxt.length-1);
						npQuarterValue =  npTxtArray[1];
						
						value1 = value1+parseInt(npQuarterValue);

					}
				}
			
			 }

			 result = value1.toFixed(2);
		 }
	}	
	 $('#npRate3').val(result);
	 $('#PeriodRate3').val(val1);
	 $('#selDisp1').text(val1);
	 $('#headerNPRate1').text(val1);
	 $('#npRate3').focus();

	 
	});


	$('.selPeriod0').on('change', function(){

	var val1 = $(this).val();
	var npSize = $("#npratesize").val();
	var  result= "";
	var  value1= 0;
	var periodTxt;
	var periodQuarterTxt;
	var periodQuarterTxt1;
	var periodTxt1;
	
	if(val1 == null)
	{
		val1 = "-";
	}else
	{
		if( val1.toString().indexOf(',') != -1 )
		{
			var strs = val1.toString().split(',');
			var quarterStr;
			var strs1;
			for(var i =0; i<strs.length; i++)
			{
				quarterStr = strs[i];
				strs1 = quarterStr.substr(0, 5);

				if(i == 0)
				{
					var dispPeriod = strs[0];
					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt = dispPeriod.substr(0, 5);
						periodTxt  = dispPeriod.substr(6, 6);

					}else
					{
						periodQuarterTxt = dispPeriod;
						periodTxt  = dispPeriod;
						
					}
				}
				if(i == strs.length-1)
				{
					var dispPeriod1 = strs[strs.length-1];
					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						periodQuarterTxt1 = dispPeriod1.substr(0, 5);					
						periodTxt1  = dispPeriod1.substr(15, dispPeriod1.length-1);
						
					}else
					{
						periodQuarterTxt1 = dispPeriod1;					
					}	
				}

				for(var k =0; k<npSize; k++)
				{
					var npTxt = $("#npratevalue"+k).val();
					//npQuarterHeader = npTxt.substr(0, 5);

					var npTxtArray = npTxt.toString().split('|');

					//if(strs1  == npQuarterHeader)

					if( quarterStr.toString().indexOf('\'') != -1 )
					{
						if(strs1 == npTxtArray[0])
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue = npTxtArray[1];

							value1 = value1+parseInt(npQuarterValue);	
						}

					}else
					{
						//if(npTxtArray[2].toString().contains(quarterStr))
						if(npTxtArray[2].toString().indexOf(quarterStr) != -1 )
						{
							//npQuarterValue = npTxt.substr(5, npTxt.length-1);
							npQuarterValue = npTxtArray[1];
							value1 = value1+parseInt(npQuarterValue);	

						}
					}

				 }				
			}
			result = (value1/strs.length).toFixed(2);
			if( quarterStr.toString().indexOf('\'') != -1 )
			{

				val1 = periodQuarterTxt+", "+periodQuarterTxt1+" ("+periodTxt+"-"+periodTxt1;
			
			}else
			{
				val1 = periodQuarterTxt+", "+periodQuarterTxt1;

			}

			//val1 = periodQuarterTxt+", "+periodQuarterTxt1+" ("+periodTxt+"-"+periodTxt1;


		}else
		 {
			strs1 = val1.toString().substr(0, 5);
			for(var k =0; k<npSize; k++)
			{
				var npTxt = $("#npratevalue"+k).val();
				//npQuarterHeader = npTxt.substr(0, 5);
				var npTxtArray = npTxt.toString().split('|');
				if(val1.toString().indexOf('\'') != -1)
				{
					if(strs1  == npTxtArray[0])
					{
						//npQuarterValue = npTxt.substr(5, npTxt.length-1);
						npQuarterValue =  npTxtArray[1];
						value1 = value1+parseInt(npQuarterValue);							
					}
				}else
				{					
					if( npTxtArray[2].toString().indexOf(val1) != -1 )
				//	if(strs1 == npTxtArray[2])
					{
						//npQuarterValue = npTxt.substr(5, npTxt.length-1);
						npQuarterValue =  npTxtArray[1];
						
						value1 = value1+parseInt(npQuarterValue);

					}
				}
			
			 }

			 result = value1.toFixed(2);
		 }
	}
	$('#npRate4').val(result);
	$('#PeriodRate4').val(val1);
	$('#selDisp0').text(val1);
	$('#headerNPRate0').text(val1);
	$('#npRate4').focus();

	 
	});


	// $(document).ready(function(){:
	$('.RelatedLinks ul li.RelLinks').hover(function() {
	$(this).find('.dropdownmenu').show();
	}, function(){
	$(this).find('.dropdownmenu').hide();
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
<%@ include file="../common/processHeaderDetailsConfig.jsp" %>
<%@ include file="../common/date.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>
<% 
		String DPATH     = EnvironmentProperties.getValue("wastesalesapprovals", "uploadPath");		

		String requestId = (String)request.getParameter("requestId");
    //    out.println( " requestId " +requestId);
		ArrayList headerList = new ArrayList();
		ArrayList headerList1 = new ArrayList();
    	ArrayList detailsList = new ArrayList();
    	ArrayList approverList = new ArrayList();
    	ArrayList logList = new ArrayList();
		Hashtable detailsHash = new Hashtable();
		Hashtable headerHash = new Hashtable();
		Hashtable approverHash = new Hashtable();
		Hashtable headerHash1 = new Hashtable();
		Hashtable attributeHash = new Hashtable();
		Hashtable logHash = new Hashtable();
       // headerHash.put("CREATEDBY", emailId);
		headerHash.put("REQUESTOID", requestId);
		headerHash.put("DOCUMENTOID", "DOC1001");
		headerHash.put("HEADERSECTION1", headerSection1);
		detailsHash.put("REQUESTOID", requestId);
		detailsHash.put("DETAILSECTION1", detailSection2);

		String city = null;
        String zoneType = null;
		attributeHash.put("docId", "DOC1001");
        attributeHash.put("emailId",emailId);
        attributeHash.put("profileText", "ZONEMASTER");

		headerHash1.put("DOCUMENTOID", "DOC1001");
		headerHash1.put("SEARCHONREQUEST", requestId);

        ArrayList listAttribute = wasteSalesHeaderController.listOfAtrributes(attributeHash);

		headerList = wasteSalesHeaderController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",headerHash);
		detailsList = wasteSalesDetailsController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailsHash);
		ArrayList npRateList = wasteSalesDetailsController.getNPRates();

		headerList1 = wasteSalesHeaderController.viewAll("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",headerHash1);

		String workitemOid			= "";

		for (int ii=0; ii<headerList1.size(); ii++){
			String strDocArr[] = (String[])headerList1.get(ii);
			workitemOid = strDocArr[0];			
		}
		approverHash.put("DOCUMENTOID", "DOC1001");
		approverHash.put("WORKITEMOID", workitemOid);
		approverHash.put("STATUS", "L");

		approverList = docChangeLogController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",approverHash);

	//	out.println("d---"+detailsList.size()); 
	
		String reference			= "";
		String requestNo			= "";
		String action				= "";
		String createdBy				= "";

		String disabled_Str			= "";

		String wsaPeriod			= "";
		String dateStr				= "";
		String branch				= "";
		String oldRealisationHeader = "";
		String oldRealisation		= "";
		String preEstRealisation	= "";
		String currentRealisation	= "";
		String IncRealisation = "";
		String headerNPRate1 = "";
		String headerNPRate2 = "";
		String headerNPRate3 = "";
		String headerNPRate4 = "";
		String headerNPRate5 = "";
		String highlightsForTender = "";
		String approvalsId = "";
		String npRateQ1 = "";
		String npRateQ2 = "";
		String npRateQ3 = "";
		String npRateQ4 = "";
		String npRateQ5 = "";
		String estimatedRealHeader = "";
		String compulsaryAttachment = "";
		String additionalAttachment = "";
		String status = "";
		String strZoneType = "";

		for (int ii=0; ii<headerList.size(); ii++){
			String strArr[] = (String[])headerList.get(ii);
			requestNo = strArr[0];
			action = strArr[4];
			createdBy = strArr[5];
			strZoneType = strArr[7];
			reference = strArr[8];
			wsaPeriod = strArr[9];
			dateStr = strArr[10];
			branch = strArr[11];
			oldRealisationHeader = strArr[12];
			oldRealisation = strArr[13];
			estimatedRealHeader = strArr[14];
			preEstRealisation = strArr[15];
			currentRealisation = strArr[16];
			IncRealisation = strArr[17];
			headerNPRate1 = strArr[18];
			headerNPRate2 = strArr[19];
			headerNPRate3 = strArr[20];
			headerNPRate4 = strArr[21];
			headerNPRate5 = strArr[22];
			highlightsForTender = strArr[23];
			approvalsId = strArr[24];
			compulsaryAttachment = strArr[25];
			additionalAttachment = strArr[26];
			npRateQ1 = strArr[27];
			npRateQ2 = strArr[28];
			npRateQ3 = strArr[29];
			npRateQ4 = strArr[30];
			npRateQ5 = strArr[31];
			status = strArr[32];

		}
 
		String pwmQ1FinalRate = "";
		String pwmQ2FinalRate = "";
		String pwmQ3FinalRate = "";
		String pwmQ4FinalRate = "";
		String pwmQ5FinalRate = "";
		String pwmPercentFinalRate = "";

		String towQ1FinalRate = "";
		String towQ2FinalRate = "";
		String towQ3FinalRate = "";
		String towQ4FinalRate = "";
		String towQ5FinalRate = "";
		String towPercentFinalRate = "";

		String rspQ1FinalRate = "";
		String rspQ2FinalRate = "";
		String rspQ3FinalRate = "";
		String rspQ4FinalRate = "";
		String rspQ5FinalRate = "";
		String rspPercentFinalRate = "";

		String psQ1FinalRate = "";
		String psQ2FinalRate = "";
		String psQ3FinalRate = "";
		String psQ4FinalRate = "";
		String psQ5FinalRate = "";
		String psPercentFinalRate = "";

		String apQ1FinalRate = "";
		String apQ2FinalRate = "";
		String apQ3FinalRate = "";
		String apQ4FinalRate = "";
		String apQ5FinalRate = "";
		String apPercentFinalRate = "";

		String pwmQ1Index = "";
		String pwmQ2Index = "";
		String pwmQ3Index = "";
		String pwmQ4Index = "";
		String pwmQ5Index = "";

		String towQ1Index = "";
		String towQ2Index = "";
		String towQ3Index = "";
		String towQ4Index = "";
		String towQ5Index = "";

		String rspQ1Index = "";
		String rspQ2Index = "";
		String rspQ3Index = "";
		String rspQ4Index = "";
		String rspQ5Index = "";

		String psQ1Index = "";
		String psQ2Index = "";
		String psQ3Index = "";
		String psQ4Index = "";
		String psQ5Index = "";

		String apQ1Index = "";
		String apQ2Index = "";
		String apQ3Index = "";
		String apQ4Index = "";
		String apQ5Index = "";

		/* chnges by karan*/
		String quarter11 = "";
		String quarter22 = "";
		String quarter33 = "";
		String quarter00 = "";
		
		/* chnges by karan*/
		String preQuarter11 ="";
		String preQuarter22 ="";
		String preQuarter33 ="";
		String preQuarter44 ="";
		String preQuarter55 ="";
		String preQuarter66 ="";
		String preQuarter77 ="";
		String preQuarter88 ="";
		String preQuarter99 ="";

		/*String emailId1  = createdBy;

		if (emailId1.indexOf("@") > -1){
			emailId1 = emailId1.substring(0, emailId1.indexOf("@"));        
		}

		String uploadFilePath  = DPATH+emailId1+"/"+requestNo;*/		

		for (int ii=0; ii<detailsList.size(); ii++)	{
			String detailsstrArr[] = (String[])detailsList.get(ii);

			pwmQ1FinalRate		= detailsstrArr[7];
			pwmQ2FinalRate		= detailsstrArr[8];
			pwmQ3FinalRate		= detailsstrArr[9];
			pwmQ4FinalRate		= detailsstrArr[10];
			pwmQ5FinalRate		= detailsstrArr[11];
			pwmPercentFinalRate =detailsstrArr[12];

			towQ1FinalRate = detailsstrArr[13];
			towQ2FinalRate = detailsstrArr[14];
			towQ3FinalRate = detailsstrArr[15];
			towQ4FinalRate =detailsstrArr[16];
			towQ5FinalRate = detailsstrArr[17];
			towPercentFinalRate = detailsstrArr[18];

			rspQ1FinalRate = detailsstrArr[19];
			rspQ2FinalRate = detailsstrArr[20];
			rspQ3FinalRate = detailsstrArr[21];
			rspQ4FinalRate = detailsstrArr[22];
			rspQ5FinalRate = detailsstrArr[23];
			rspPercentFinalRate = detailsstrArr[24];

			psQ1FinalRate = detailsstrArr[25];
			psQ2FinalRate = detailsstrArr[26];
			psQ3FinalRate = detailsstrArr[27];
			psQ4FinalRate = detailsstrArr[28];
			psQ5FinalRate = detailsstrArr[29];
			psPercentFinalRate = detailsstrArr[30];

			apQ1FinalRate = detailsstrArr[31];
			apQ2FinalRate = detailsstrArr[32];
			apQ3FinalRate = detailsstrArr[33];
			apQ4FinalRate = detailsstrArr[34];
			apQ5FinalRate = detailsstrArr[35];
			apPercentFinalRate = detailsstrArr[36];


			pwmQ1Index = detailsstrArr[37];
			pwmQ2Index = detailsstrArr[38];
			pwmQ3Index = detailsstrArr[39];
			pwmQ4Index = detailsstrArr[40];
			pwmQ5Index = detailsstrArr[41];

			towQ1Index = detailsstrArr[42];
			towQ2Index = detailsstrArr[43];
			towQ3Index = detailsstrArr[44];
			towQ4Index = detailsstrArr[45];
			towQ5Index = detailsstrArr[46];

			rspQ1Index = detailsstrArr[47];
			rspQ2Index = detailsstrArr[48];
			rspQ3Index = detailsstrArr[49];
			rspQ4Index = detailsstrArr[50];
			rspQ5Index = detailsstrArr[51];

			psQ1Index = detailsstrArr[52];
			psQ2Index = detailsstrArr[53];
			psQ3Index = detailsstrArr[54];
			psQ4Index = detailsstrArr[55];
			psQ5Index = detailsstrArr[56];

			apQ1Index = detailsstrArr[57];
			apQ2Index = detailsstrArr[58];
			apQ3Index = detailsstrArr[59];
			apQ4Index = detailsstrArr[60];
			apQ5Index = detailsstrArr[61];

			

		}

		if("".equals(pwmQ1Index))
		{
		//	out.println(" pwmQ1Index "+ status);
		}

//out.println(" status "+ status);
//out.println(" createdBy "+ createdBy);
//out.println(" emailId "+ emailId);


		if(("I").equals(status) || ("A").equals(status))
		{
			disabled_Str = "readonly";
			
			pwmQ1FinalRate = ("0.00").equals(pwmQ1FinalRate)?"-":pwmQ1FinalRate;
			pwmQ2FinalRate = ("0.00").equals(pwmQ2FinalRate)?"-":pwmQ2FinalRate;
			pwmQ3FinalRate = ("0.00").equals(pwmQ3FinalRate)?"-":pwmQ3FinalRate;
			pwmQ4FinalRate = ("0.00").equals(pwmQ4FinalRate)?"-":pwmQ4FinalRate;
			pwmQ5FinalRate = ("0.00").equals(pwmQ5FinalRate)?"-":pwmQ5FinalRate;
			
			towQ1FinalRate = ("0.00").equals(towQ1FinalRate)?"-":towQ1FinalRate;
			towQ2FinalRate = ("0.00").equals(towQ2FinalRate)?"-":towQ2FinalRate;
			towQ3FinalRate = ("0.00").equals(towQ3FinalRate)?"-":towQ3FinalRate;
			towQ4FinalRate = ("0.00").equals(towQ4FinalRate)?"-":towQ4FinalRate;
			towQ5FinalRate = ("0.00").equals(towQ5FinalRate)?"-":towQ5FinalRate;
			
			rspQ1FinalRate = ("0.00").equals(rspQ1FinalRate)?"-":rspQ1FinalRate;
			rspQ2FinalRate = ("0.00").equals(rspQ2FinalRate)?"-":rspQ2FinalRate;
			rspQ3FinalRate = ("0.00").equals(rspQ3FinalRate)?"-":rspQ3FinalRate;
			rspQ4FinalRate = ("0.00").equals(rspQ4FinalRate)?"-":rspQ4FinalRate;
			rspQ5FinalRate = ("0.00").equals(rspQ5FinalRate)?"-":rspQ5FinalRate;
			
			psQ1FinalRate = ("0.00").equals(psQ1FinalRate)?"-":psQ1FinalRate;
			psQ2FinalRate = ("0.00").equals(psQ2FinalRate)?"-":psQ2FinalRate;
			psQ3FinalRate = ("0.00").equals(psQ3FinalRate)?"-":psQ3FinalRate;
			psQ4FinalRate = ("0.00").equals(psQ4FinalRate)?"-":psQ4FinalRate;
			psQ5FinalRate = ("0.00").equals(psQ5FinalRate)?"-":psQ5FinalRate;
						
			apQ1FinalRate = ("0.00").equals(apQ1FinalRate)?"-":apQ1FinalRate;
			apQ2FinalRate = ("0.00").equals(apQ2FinalRate)?"-":apQ2FinalRate;
			apQ3FinalRate = ("0.00").equals(apQ3FinalRate)?"-":apQ3FinalRate;
			apQ4FinalRate = ("0.00").equals(apQ4FinalRate)?"-":apQ4FinalRate;
			apQ5FinalRate = ("0.00").equals(apQ5FinalRate)?"-":apQ5FinalRate;

			pwmQ1Index = ("0.00").equals(pwmQ1Index)?"-":pwmQ1Index;
			pwmQ2Index = ("0.00").equals(pwmQ2Index)?"-":pwmQ2Index;
			pwmQ3Index = ("0.00").equals(pwmQ3Index)?"-":pwmQ3Index;
			pwmQ4Index = ("0.00").equals(pwmQ4Index)?"-":pwmQ4Index;
			pwmQ5Index = ("0.00").equals(pwmQ5Index)?"-":pwmQ5Index;

			towQ1Index = ("0.00").equals(towQ1Index)?"-":towQ1Index;
			towQ2Index = ("0.00").equals(towQ2Index)?"-":towQ2Index;
			towQ3Index = ("0.00").equals(towQ3Index)?"-":towQ3Index;
			towQ4Index = ("0.00").equals(towQ4Index)?"-":towQ4Index;
			towQ5Index = ("0.00").equals(towQ5Index)?"-":towQ5Index;


			rspQ1Index = ("0.00").equals(rspQ1Index)?"-":rspQ1Index;
			rspQ2Index = ("0.00").equals(rspQ2Index)?"-":rspQ2Index;
			rspQ3Index = ("0.00").equals(rspQ3Index)?"-":rspQ3Index;
			rspQ4Index = ("0.00").equals(rspQ4Index)?"-":rspQ4Index;
			rspQ5Index = ("0.00").equals(rspQ5Index)?"-":rspQ5Index;

			psQ1Index = ("0.00").equals(psQ1Index)?"-":psQ1Index;
			psQ2Index = ("0.00").equals(psQ2Index)?"-":psQ2Index;
			psQ3Index = ("0.00").equals(psQ3Index)?"-":psQ3Index;
			psQ4Index = ("0.00").equals(psQ4Index)?"-":psQ4Index;
			psQ5Index = ("0.00").equals(psQ5Index)?"-":psQ5Index;

		}

        if((("D").equals(status) || ("R").equals(status) || ("RH").equals(status)) && emailId.equals(createdBy))
		{
			disabled_Str = "";
		}else
		{
			disabled_Str = "readonly";

		}

		pwmPercentFinalRate = ("").equals(pwmPercentFinalRate)?"0.00":pwmPercentFinalRate;
		towPercentFinalRate = ("").equals(towPercentFinalRate)?"0.00":towPercentFinalRate;
		rspPercentFinalRate = ("").equals(rspPercentFinalRate)?"0.00":rspPercentFinalRate;
		psPercentFinalRate = ("").equals(psPercentFinalRate)?"0.00":psPercentFinalRate;
		apPercentFinalRate = ("").equals(apPercentFinalRate)?"0.00":apPercentFinalRate;


		ArrayList emailidList = new ArrayList();

		Hashtable emailHash = new Hashtable();

		//emailHash.put("COMPANYCODE", "1000");
		//emailHash.put("DEPTCODE", "1002");

		//emailidList = wasteSalesHeaderController.getEmailId(emailHash);

		for (int kk = 0; kk<listAttribute.size(); kk++){
                String strArray[] = (String[]) listAttribute.get(kk);                   
                zoneType = strArray[0];
              //  city+="<option value=\""+strArray[1]+"\">"+strArray[1]+"</option>";		
	       }

		if(zoneType != null)
		{
			emailHash.put("ZONETYPE", zoneType);

		}

		emailHash.put("DOCID", "DOC1001");
		emailHash.put("EMAILID", emailId);
		emailHash.put("PROFILETEXT", "ZONE HEAD");

		emailidList = wasteSalesHeaderController.getZonalEmailId(emailHash);

		
		Hashtable locHash1 = new Hashtable();
		locHash1.put("DOCUMENTOID", "DOC1001");
        locHash1.put("EMAILID",createdBy);
        locHash1.put("PROFILETEXT","ZONEMASTER");
        locHash1.put("ATTRIBUTETEXT",strZoneType);
		ArrayList locationAttributelist1 = wasteSalesDetailsController.listLocation(locHash1);

		///out.println("---"+locationAttributelist1.size());
		//out.println("---"+strZoneType);

		String  strLoc1="";
		
		for (int kk = 0; kk<locationAttributelist1.size(); kk++)
		{
			String strLocArray[] = (String[]) locationAttributelist1.get(kk);     
			
			if(branch.contains(strLocArray[10])) 
			{
				 strLoc1+="<option value=\""+strLocArray[10]+"\" selected>"+strLocArray[10]+"</option>";	
			}else
			{
				 strLoc1+="<option value=\""+strLocArray[10]+"\">"+strLocArray[10]+"</option>";	
			}

				
		}


		String quarter0 ="";
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

			quarter0 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"MAR'"+todayYearStr+")";
			quarter1 ="Q2-"+todayYearStr+"(APR'"+todayYearStr+" - "+"JUN'"+todayYearStr+")";
			quarter2 ="Q3-"+todayYearStr+"(JUL'"+todayYearStr+" - "+"SEP'"+todayYearStr+")";
			quarter3 ="Q4-"+todayYearStr+"(OCT'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			quarter4 ="Q1-"+nextYearStr+"(JAN'"+nextYearStr+" - "+"MAR'"+nextYearStr+")";


			preQuarter1 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"MAR'"+todayYearStr+")";
			preQuarter2 ="Q4-"+previousYearStr+"(OCT'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			preQuarter3 ="Q3-"+previousYearStr+"(JUL'"+previousYearStr+" - "+"SEP'"+previousYearStr+")";
			preQuarter4 ="Q2-"+previousYearStr+"(APR'"+previousYearStr+" - "+"JUN'"+previousYearStr+")";

			preQuarter5 ="Q1-"+previousYearStr+"(JAN'"+previousYearStr+" - "+"MAR'"+previousYearStr+")";
			preQuarter6 ="Q4-"+prevPreviousYearStr+"(OCT'"+prevPreviousYearStr+" - "+"DEC'"+prevPreviousYearStr+")";
			preQuarter7 ="Q3-"+prevPreviousYearStr+"(JUL'"+prevPreviousYearStr+" - "+"SEP'"+prevPreviousYearStr+")";
			preQuarter8 ="Q2-"+prevPreviousYearStr+"(APR'"+prevPreviousYearStr+" - "+"JUN'"+prevPreviousYearStr+")";

		}else if(todayMonInt >= 4 && todayMonInt <=6)
		{
			quarter0 ="Q2-"+todayYearStr+"(APR'"+todayYearStr+" - "+"JUN'"+todayYearStr+")";
			quarter1 ="Q3-"+todayYearStr+"(JUL'"+todayYearStr+" - "+"SEP'"+todayYearStr+")";
			quarter2 ="Q4-"+todayYearStr+"(OCT'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			quarter3 ="Q1-"+nextYearStr+"(JAN'"+nextYearStr+" - "+"MAR'"+nextYearStr+")";
			quarter4 ="Q2-"+nextYearStr+"(APR'"+nextYearStr+" - "+"JUN'"+nextYearStr+")";

			preQuarter1 ="Q2-"+todayYearStr+"(APR'"+todayYearStr+" - "+"JUN'"+todayYearStr+")";
			preQuarter2 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"MAR'"+todayYearStr+")";
			preQuarter3 ="Q4-"+previousYearStr+"(OCT'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			preQuarter4 ="Q3-"+previousYearStr+"(JUL'"+previousYearStr+" - "+"SEP'"+previousYearStr+")";
			preQuarter5 ="Q2-"+previousYearStr+"(APR'"+previousYearStr+" - "+"JUN'"+previousYearStr+")";

			preQuarter6 ="Q1-"+previousYearStr+"(JAN'"+previousYearStr+" - "+"MAR'"+previousYearStr+")";
			preQuarter7 ="Q4-"+prevPreviousYearStr+"(OCT'"+prevPreviousYearStr+" - "+"DEC'"+prevPreviousYearStr+")";
			preQuarter8 ="Q3-"+prevPreviousYearStr+"(JUL'"+prevPreviousYearStr+" - "+"SEP'"+prevPreviousYearStr+")";

		}else if(todayMonInt >= 7 && todayMonInt <=9)
		{
			quarter0 ="Q3-"+todayYearStr+"(JUL'"+todayYearStr+" - "+"SEP'"+todayYearStr+")";
			quarter1 ="Q4-"+todayYearStr+"(OCT'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			quarter2 ="Q1-"+nextYearStr+"(JAN'"+todayYearStr+" - "+"MAR'"+nextYearStr+")";
			quarter3 ="Q2-"+nextYearStr+"(APR'"+nextYearStr+" - "+"JUN'"+nextYearStr+")";
			quarter4 ="Q3-"+nextYearStr+"(JUL'"+nextYearStr+" - "+"SEP'"+nextYearStr+")";

			preQuarter1 ="Q3-"+todayYearStr+"(JUL'"+todayYearStr+" - "+"SEP'"+todayYearStr+")";
			preQuarter2 ="Q2-"+todayYearStr+"(APR'"+todayYearStr+" - "+"JUN'"+todayYearStr+")";
			preQuarter3 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"MAR'"+todayYearStr+")";
			preQuarter4 ="Q4-"+previousYearStr+"(OCT'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			preQuarter5 ="Q3-"+previousYearStr+"(JUL'"+previousYearStr+" - "+"SEP'"+previousYearStr+")";
			preQuarter6 ="Q2-"+previousYearStr+"(APR'"+previousYearStr+" - "+"JUN'"+previousYearStr+")";

			preQuarter7 ="Q1-"+previousYearStr+"(JAN'"+previousYearStr+" - "+"MAR'"+previousYearStr+")";
			preQuarter8 ="Q4-"+prevPreviousYearStr+"(OCT'"+prevPreviousYearStr+" - "+"DEC'"+prevPreviousYearStr+")";


		}else if(todayMonInt >= 10 && todayMonInt <=12)
		{
			quarter0 ="Q4-"+todayYearStr+"(OCT'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			quarter1 ="Q1-"+nextYearStr+"(JAN'"+nextYearStr+" - "+"MAR'"+nextYearStr+")";
			quarter2 ="Q2-"+nextYearStr+"(APR'"+nextYearStr+" - "+"JUN'"+nextYearStr+")";
			quarter3 ="Q3-"+nextYearStr+"(JUL'"+nextYearStr+" - "+"SEP'"+nextYearStr+")";
			quarter4 ="Q4-"+nextYearStr+"(OCT'"+nextYearStr+" - "+"DEC'"+nextYearStr+")";
	

			preQuarter1 ="Q4-"+todayYearStr+"(OCT'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			preQuarter2 ="Q3-"+todayYearStr+"(JUL'"+todayYearStr+" - "+"SEP'"+todayYearStr+")";
			preQuarter3 ="Q2-"+todayYearStr+"(APR'"+todayYearStr+" - "+"JUN'"+todayYearStr+")";
			preQuarter4 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"MAR'"+todayYearStr+")";

			preQuarter5 ="Q4-"+previousYearStr+"(OCT'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			preQuarter6 ="Q3-"+previousYearStr+"(JUL'"+previousYearStr+" - "+"SEP'"+previousYearStr+")";
			preQuarter7 ="Q2-"+previousYearStr+"(APR'"+previousYearStr+" - "+"JUN'"+previousYearStr+")";
			preQuarter8 ="Q1-"+previousYearStr+"(JAN'"+previousYearStr+" - "+"MAR'"+previousYearStr+")";

		} 


		/*  chenges by karan*/
		if(todayMonInt >= 9 && todayMonInt <=12)
		{

		    quarter00 ="Q3-"+todayYearStr+"(SEP'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			quarter11 ="Q1-"+nextYearStr+"(JAN'"+nextYearStr+" - "+"APR'"+nextYearStr+")";
			quarter22 ="Q2-"+nextYearStr+"(MAY'"+nextYearStr+" - "+"AUG'"+nextYearStr+")";
			quarter33 ="Q3-"+nextYearStr+"(SEP'"+nextYearStr+" - "+"DEC'"+nextYearStr+")";
			
			preQuarter11 ="Q3-"+todayYearStr+"(SEP'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			preQuarter22 ="Q2-"+todayYearStr+"(MAY'"+todayYearStr+" - "+"AUG'"+todayYearStr+")";
			preQuarter33 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"APR'"+todayYearStr+")";
			
			preQuarter44 ="Q3-"+previousYearStr+"(SEP'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			preQuarter55 ="Q2-"+previousYearStr+"(MAY'"+previousYearStr+" - "+"AUG'"+previousYearStr+")";
			preQuarter66 ="Q1-"+previousYearStr+"(JAN'"+previousYearStr+" - "+"APR'"+previousYearStr+")";

			preQuarter77 ="Q1-"+previousYearStr+"(JAN'"+previousYearStr+" - "+"APR'"+previousYearStr+")";
			preQuarter88 ="Q2-"+previousYearStr+"(MAY'"+previousYearStr+" - "+"AUG'"+previousYearStr+")";
			preQuarter99 ="Q3-"+previousYearStr+"(SEP'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			
			
			
		}
		else if(todayMonInt >= 5 && todayMonInt <=8)
		{
			//out.println("nnn..."+todayMonInt);
			/*quarter0 ="Q2-"+todayYearStr+"(APR'"+todayYearStr+" - "+"JUN'"+todayYearStr+")";
			quarter1 ="Q3-"+todayYearStr+"(JUL'"+todayYearStr+" - "+"SEP'"+todayYearStr+")";
			quarter2 ="Q4-"+todayYearStr+"(OCT'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			quarter3 ="Q1-"+nextYearStr+"(JAN'"+nextYearStr+" - "+"MAR'"+nextYearStr+")";
			quarter4 ="Q2-"+nextYearStr+"(APR'"+nextYearStr+" - "+"JUN'"+nextYearStr+")";

			preQuarter1 ="Q2-"+todayYearStr+"(APR'"+todayYearStr+" - "+"JUN'"+todayYearStr+")";
			preQuarter2 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"MAR'"+todayYearStr+")";
			preQuarter3 ="Q4-"+previousYearStr+"(OCT'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			preQuarter4 ="Q3-"+previousYearStr+"(JUL'"+previousYearStr+" - "+"SEP'"+previousYearStr+")";
			preQuarter5 ="Q2-"+previousYearStr+"(APR'"+previousYearStr+" - "+"JUN'"+previousYearStr+")";

			preQuarter6 ="Q1-"+previousYearStr+"(JAN'"+previousYearStr+" - "+"MAR'"+previousYearStr+")";
			preQuarter7 ="Q4-"+prevPreviousYearStr+"(OCT'"+prevPreviousYearStr+" - "+"DEC'"+prevPreviousYearStr+")";
			preQuarter8 ="Q3-"+prevPreviousYearStr+"(JUL'"+prevPreviousYearStr+" - "+"SEP'"+prevPreviousYearStr+")";*/
			
			

		    quarter00 ="Q2-"+todayYearStr+"(MAY'"+todayYearStr+" - "+"AUG'"+todayYearStr+")";
			quarter22 ="Q1-"+nextYearStr+"(JAN'"+nextYearStr+" - "+"APR'"+nextYearStr+")";
			quarter33 ="Q2-"+nextYearStr+"(MAY'"+nextYearStr+" - "+"AUG'"+nextYearStr+")";
			quarter11 ="Q3-"+todayYearStr+"(SEP'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			
			/*preQuarter1 ="Q2-"+todayYearStr+"(APR'"+todayYearStr+" - "+"JUN'"+todayYearStr+")";
			preQuarter2 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"MAR'"+todayYearStr+")";
			preQuarter3 ="Q4-"+previousYearStr+"(OCT'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			preQuarter4 ="Q3-"+previousYearStr+"(JUL'"+previousYearStr+" - "+"SEP'"+previousYearStr+")";
			preQuarter5 ="Q2-"+previousYearStr+"(APR'"+previousYearStr+" - "+"JUN'"+previousYearStr+")";*/
			
			preQuarter11 ="Q2-"+todayYearStr+"(MAY'"+todayYearStr+" - "+"AUG'"+todayYearStr+")";
			preQuarter22 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"APR'"+todayYearStr+")";
			preQuarter33 ="Q4-"+previousYearStr+"(OCT'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			preQuarter44 ="Q3-"+previousYearStr+"(JUL'"+previousYearStr+" - "+"SEP'"+previousYearStr+")";
			preQuarter55 ="Q2-"+previousYearStr+"(APR'"+previousYearStr+" - "+"JUN'"+previousYearStr+")";
			preQuarter66 ="Q3-"+previousYearStr+"(JUL'"+previousYearStr+" - "+"SEP'"+previousYearStr+")";


			preQuarter77 ="Q1-"+previousYearStr+"(JAN'"+previousYearStr+" - "+"APR'"+previousYearStr+")";
			preQuarter88 ="Q2-"+previousYearStr+"(MAY'"+previousYearStr+" - "+"AUG'"+previousYearStr+")";
			preQuarter99 ="Q3-"+previousYearStr+"(SEP'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			
			
			
			
			
		}
		else if(todayMonInt >= 1 && todayMonInt <=4)
		{
			
			
			/*quarter0 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"MAR'"+todayYearStr+")";
			quarter1 ="Q2-"+todayYearStr+"(APR'"+todayYearStr+" - "+"JUN'"+todayYearStr+")";
			quarter2 ="Q3-"+todayYearStr+"(JUL'"+todayYearStr+" - "+"SEP'"+todayYearStr+")";
			quarter3 ="Q4-"+todayYearStr+"(OCT'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			quarter4 ="Q1-"+nextYearStr+"(JAN'"+nextYearStr+" - "+"MAR'"+nextYearStr+")";


			preQuarter1 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"MAR'"+todayYearStr+")";
			preQuarter2 ="Q4-"+previousYearStr+"(OCT'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			preQuarter3 ="Q3-"+previousYearStr+"(JUL'"+previousYearStr+" - "+"SEP'"+previousYearStr+")";
			preQuarter4 ="Q2-"+previousYearStr+"(APR'"+previousYearStr+" - "+"JUN'"+previousYearStr+")";

			preQuarter5 ="Q1-"+previousYearStr+"(JAN'"+previousYearStr+" - "+"MAR'"+previousYearStr+")";
			preQuarter6 ="Q4-"+prevPreviousYearStr+"(OCT'"+prevPreviousYearStr+" - "+"DEC'"+prevPreviousYearStr+")";
			preQuarter7 ="Q3-"+prevPreviousYearStr+"(JUL'"+prevPreviousYearStr+" - "+"SEP'"+prevPreviousYearStr+")";
			preQuarter8 ="Q2-"+prevPreviousYearStr+"(APR'"+prevPreviousYearStr+" - "+"JUN'"+prevPreviousYearStr+")";*/

		
			
			quarter00 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"APR'"+todayYearStr+")";
			quarter33 ="Q1-"+nextYearStr+"(JAN'"+nextYearStr+" - "+"APR'"+nextYearStr+")";
			quarter11 ="Q2-"+todayYearStr+"(MAY'"+todayYearStr+" - "+"AUG'"+todayYearStr+")";
			quarter22 ="Q3-"+todayYearStr+"(SEP'"+todayYearStr+" - "+"DEC'"+todayYearStr+")";
			
			preQuarter11 ="Q1-"+todayYearStr+"(JAN'"+todayYearStr+" - "+"APR'"+todayYearStr+")";
			//preQuarter22 ="Q3-"+previousYearStr+"(MAY'"+previousYearStr+" - "+"AUG'"+previousYearStr+")";
			preQuarter22 ="Q2-"+previousYearStr+"(MAY'"+previousYearStr+" - "+"AUG'"+previousYearStr+")";
			//preQuarter33 ="Q2-"+previousYearStr+"(SEP'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			preQuarter33 ="Q3-"+previousYearStr+"(SEP'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
			
			preQuarter44 ="Q1-"+previousYearStr+"(JAN'"+previousYearStr+" - "+"APR'"+previousYearStr+")";
			//preQuarter55 ="Q4-"+prevPreviousYearStr+"(MAY'"+prevPreviousYearStr+" - "+"AUG'"+prevPreviousYearStr+")";
			preQuarter55 ="Q2-"+prevPreviousYearStr+"(MAY'"+prevPreviousYearStr+" - "+"AUG'"+prevPreviousYearStr+")";
			preQuarter66 ="Q3-"+prevPreviousYearStr+"(SEP'"+prevPreviousYearStr+" - "+"DEC'"+prevPreviousYearStr+")";


			preQuarter77 ="Q1-"+previousYearStr+"(JAN'"+previousYearStr+" - "+"APR'"+previousYearStr+")";
			preQuarter88 ="Q2-"+previousYearStr+"(MAY'"+previousYearStr+" - "+"AUG'"+previousYearStr+")";
			preQuarter99 ="Q3-"+previousYearStr+"(SEP'"+previousYearStr+" - "+"DEC'"+previousYearStr+")";
		
			
			
		}
		
		/* changes by karan*/
		String quarter[]	={quarCurrMonth1,quarMonth0,quarter0,quarter1,quarter2,quarter3,quarter4,quarter11,quarter22,quarter33,quarter00};
		//String quarter[]	={quarCurrMonth1,quarMonth0,quarter0,quarter1,quarter2,quarter3,quarter4,quarter11,quarter22,quarter33,quarter00};

		String preQuarter[] ={quarCurrMonth1,quarPrevMonth0,preQuarter1,preQuarter2,preQuarter3,preQuarter4,preQuarter5,preQuarter6,preQuarter7,preQuarter8,preQuarter11,preQuarter22,preQuarter33,preQuarter44,preQuarter55,preQuarter66,preQuarter77,preQuarter88,preQuarter99};
		String realPreQuarter[] ={quarPrevMonth0,quarCurrMonth1,preQuarter1,preQuarter2,preQuarter11,preQuarter22};

		
		
		
/*		String quarter[]	={quarCurrMonth1,quarMonth0,quarter0,quarter1,quarter2,quarter3,quarter4};

		//String quarter[]	={quarter0,quarter1,quarter2,quarter3,quarter4};

		String preQuarter[] ={quarCurrMonth1,quarPrevMonth0,preQuarter1,preQuarter2,preQuarter3,preQuarter4,preQuarter5,preQuarter6,preQuarter7,preQuarter8};
		String realPreQuarter[] ={quarPrevMonth0,quarCurrMonth1,preQuarter1,preQuarter2,preQuarter11,preQuarter22};
*/
	/*	for(int i=0; i<4;i++)
		{
			String quarterval11 ="";
			
			if(realPreQuarter[i].indexOf('Q') != -1 )
			{
				
				quarterval11 = realPreQuarter[i].substring(0,5);
				 
			}
			else
			{				
				quarterval11  = realPreQuarter[i];
			}
			

			if(oldRealisationHeader.contains(quarterval11)) 
			{
				out.println("hi");

			} else {
				out.println("bye");

			}
		}*/



		String formName = "frmViewRequest";

        if(listAttribute.size() > 0)
        {
          for (int kk = 0; kk<listAttribute.size(); kk++){
                String strArray[] = (String[]) listAttribute.get(kk);                   
                zoneType = strArray[0];
                if(branch.contains(strArray[1])) 
				{
                     city+="<option value=\""+strArray[1]+"\" selected>"+strArray[1]+"</option>";	
                }else
                {
                     city+="<option value=\""+strArray[1]+"\">"+strArray[1]+"</option>";	
                }
	       }
        }else
        {
            city+="<option value=\""+branch+"\" selected>"+branch+"</option>";
        }



		String emailStr= "";
		String emailStr1= "";
		for (int ii=0; ii<emailidList.size(); ii++)
		{
			String emailidArr[] = (String[])emailidList.get(ii);
			 
			if ((emailidArr[4]).equals(approvalsId) ) 
			{
				emailStr1 = emailidArr[6];
				emailStr+="<option value=\""+emailidArr[4]+"|"+emailidArr[5]+"|"+emailidArr[6]+"\" selected>"+emailidArr[6]+"</option>";	
			
			} else {
				emailStr+="<option value=\""+emailidArr[4]+"|"+emailidArr[5]+"|"+emailidArr[6]+"\">"+emailidArr[6]+"</option>";	

			}

		}

		String periodStr = "";	

		for( int j=0; j<quarter.length;j++)
		{
			//out.println("------"+quarter[j]);
			String quarterval = quarter[j].substring(0,5);
															
			//if(wsaPeriod.contains(quarterval)) 
			if(wsaPeriod.equals(quarter[j])) 
			{
				periodStr = quarter[j]+periodStr;
			}else
			{
				periodStr	= wsaPeriod;
			}
		}

		String[] tokens = periodStr.split("-");
		
		for(int i =0; i < tokens.length ; i++)
		{
			//out.println(tokens[i]);
		}

		logHash.put("REQUESTNO", requestId);
		logHash.put("DOCUMENTOID", "DOC1001");
				
		logList = wasteSalesHeaderController.searchLog("ttw","fasdfar",logHash);


//out.println("emailId--"+emailId);
//out.println("status--"+status);
//out.println("wsaPeriod--"+wsaPeriod);
		session.setAttribute("userEmailId",createdBy);
		session.setAttribute("status",status);
		session.setAttribute("requestId",requestId);
%>

<body onload = "showAttachmentFile('1','<%=requestId%>','<%=createdBy%>','<%=status%>')" >
<%@ include file="../common/relatedLinks.jsp" %>

	<div class="container well">
	<div class="row ">
		<div class="col-xs-1"></div>
		<div class="col-xs-10 bs-example  ">

<%		
		if(("UI").equals(status) || ("A").equals(status) || ("I").equals(status) || ("CL").equals(status))
		{
%>
		<div class="row" style="margin-bottom:2px;"><button type="button"  value="Print" name="printButton" id="printButton" class="btn btn-danger  pull-right prt" onclick = "javascript:window.print();"><i class="fa fa-print"></i> Print</button></div>
<%
		}			
%>
			<div class="portlet box blue">
			<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i>  <strong>View Process Waste Sales </strong>
			</div>			
			</div>
				<div class="portlet-body">
					<form class="form-horizontal" role="form" id="demo_form" name ="frmViewRequest" method="post">
					<%@ include file="../includes/legand.jsp" %>
					<div class="form-body">
						<div class="row " style="margin-top:0px;margin-bottom:0;">
						
							<div class="col-xs-6 col-md-6 col-lg-6">
							<div class="form-group">
								<label class="control-label col-xs-3">Request Id : </label>
								<div class="col-xs-9 ">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-th"></i>   
										</span>
										<input type="text" class="form-control " id="requestId" name="requestId" value="<%=requestNo%>" placeholder="Reference"  readonly>
                                       
									</div>
								</div>
							</div>
							</div>
							<div class="col-xs-6 col-md-6  col-lg-6" >
							<div class="form-group">
							<label class="control-label  col-xs-3">Reference : </label>
								<div class="col-xs-9 ">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-th"></i>   
										</span>
										<input type="text" class="form-control " id="reference" name="reference" value="<%=reference%>" placeholder="Reference" <%=disabled_Str%>>
									</div>
								</div>
							</div>
							</div>
							</div>
							<div class="row ">
							<div class="col-xs-6 col-md-6  col-lg-6 " >
							<div class="form-group">
							<label class="control-label col-xs-3">Date : </label>
								<div class="col-xs-9">
									<div class="input-group">
										<span class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</span>
<%
										if(("D").equals(status) || ("R").equals(status) || ("RH").equals(status))
										{
										
%>
										<input type="text" class="form-control datepicker"  name="createdDate" id="createdDate" readonly placeholder="Date" value=<%=dateStr%>  >
<%
										}	else
										{
%>
										<input type="text" class="form-control datepicker"  name="createdDate" id="createdDate"  value=<%=dateStr%> disabled>
<%
										}
%>
									</div>
								</div>
							</div>
							</div>
							<div class="col-xs-6 col-md-6  col-lg-6" >
							<div class="form-group">
							<label class="control-label col-xs-3">Period : </label>
								<div class=" col-xs-9">
									<div class="input-group">
<%
										if(("D").equals(status) || ("R").equals(status)|| ("RH").equals(status))
										{
										
%>
										<select multiple class="form-control multi period"  name="wsaPeriod" id="wsaPeriod" readonly >
<%
										for( int j=0; j<quarter.length;j++)
										{
											String quarterval = quarter[j].substring(0,5);
											//if(wsaPeriod.contains(quarterval)) 
											if(wsaPeriod.contains(quarter[j])) 
											{ out.println("inside if");
%>
												<option value="<%=quarter[j]%>" selected><%=quarter[j]%></option>
<%
														
											} else {
%>
												<option value="<%=quarter[j]%>" ><%=quarter[j]%></option>	
<%
											}
													
												//}
												
										}
%>
										</select>
<%
										}else{
%>
											<input type="text" class="form-control " id="wsaPeriod" name="wsaPeriod" size="35" value="<%=headerNPRate5%>" <%=disabled_Str%>>
<%										}
						
%>
									</div>
								</div>
							</div>
							</div>
						
						
						</div>				
					
						
						<div class="row " style="margin-top:0;margin-bottom:0;">
						<div class="col-xs-12 " >
						<div>
							<h5 class="pull-right" style="font-weight:bold;">Value in Rs. Lacs</h5>
								<table class="table table-bordered">
									<thead>
										<tr class="info">
											<th class="text-center" width="20%">Branch</th>
											<th class="text-center" width="25%">Realisation in <!-- Q4-14 & Q1-15  <br>-->
<%
												if(("D").equals(status) || ("R").equals(status)|| ("RH").equals(status))
												{
%>
                                                <select multiple  class="form-control multi1 realisationPeriod " id="headerRealisation" name="headerRealisation" <%=disabled_Str%>>
<%										
													for(int i=0; i<6;i++)
														
													{
														//String quarterval1 = preQuarter[i].substring(0,5);
														String quarterval1 = realPreQuarter[i].substring(0,5);
														//if ( (preQuarter[i]).equals(oldRealisationHeader) ) 
														if(oldRealisationHeader.contains(quarterval1)) 
														{
%>
															<option value="<%=realPreQuarter[i]%>" selected><%=realPreQuarter[i]%></option>
<%
														} else {
%>
															<option value="<%=realPreQuarter[i]%>" ><%=realPreQuarter[i]%></option>	
<%
														}

													}
%>

												</select>
<%												}else
												{
%>
												<label id="headerRealisation" name="headerRealisation" style="font-weight:bold;"><%=oldRealisationHeader%></label>
<%
												}
%><br>(Qty based on <!--  Q2-15 & Q3-15) --><label id="realisationOnQnty" name="realisationOnQnty" style="font-weight:bold;"><%=oldRealisation%></label>)
                                            </th>
											<th class="text-center" width="25%">Estimated Realisation in <label id="estimatedReal" name="estimatedReal" style="font-weight:bold;"><%=estimatedRealHeader%></label></th>
											<th class="text-center" width="25%">Increase In Realisation</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											
<%
										if(("D").equals(status) || ("R").equals(status)|| ("RH").equals(status))
										{

										
%>												<td class="text-center">
													<select  class="form-control" id="branch" name="branch" <%=disabled_Str%>>																							<!-- <option value="<%//=branch%>" selected><%//=branch%></option> -->
                                                    <%=strLoc1%>
												</select>
												</td>
												<td class="text-center"><input type="text" class="form-control text-right"  name="previousRealisation" id="previousRealisation" value="<%=preEstRealisation%>" maxlength="10" onblur="javascript:calRealisation('previousRealisation','currentRealisation','IncreaseRealisation',1);" <%=disabled_Str%>></td>
												<td class="text-center"><input type="text" class="form-control text-right" name="currentRealisation"  id="currentRealisation" value="<%=currentRealisation%>" maxlength="10" onblur="javascript:calRealisation('previousRealisation','currentRealisation','IncreaseRealisation',1);" <%=disabled_Str%>></td>
												<td class="text-right"><input type="text" class="form-control text-right"name="IncreaseRealisation" id="IncreaseRealisation" value="<%=IncRealisation%>" readonly="true" ></td>
	<%
										}else
										{
%>
											<td class="text-center">
												<%=branch%>
											</td>
												<td class="text-center"><%=preEstRealisation%></td>
												<td class="text-center"><%=currentRealisation%></td>
												<td class="text-right"><%=IncRealisation%></td>
<%
										}
%>											
											
											
										</tr>
									</tbody>
								</table>
						</div>
						</div>
						</div>
						<div class="row " style="margin-top:0;margin-bottom:0;">
						<div class="col-xs-12" >
						<div class="table-responsive ">
						<h5 style="font-weight:bold;margin-top:0px;"><!-- Q2-15 & Q3-15 Final Rates --><label id="msgId" name="msgId" style="font-weight:bold;" ><%=headerNPRate5%></label> Final Rates</h5>
							<table class="table table-bordered">
								<thead>
									<tr class="info">
										<th class="text-center" width="15%">Waste Categories</th>
										<th class="text-center" width="14%">
<%
										if(("D").equals(status) || ("R").equals(status)|| ("RH").equals(status))
										{
										
%>										<select multiple class="form-control multi1 selPeriod3" id="selPeriodRate3" name="selPeriodRate3" >								
<% 
												    for(int i=preQuarter.length-1; i>=0;i--){	
													String quarterval3 = preQuarter[i].substring(0,5);
														
														if(headerNPRate1.contains(quarterval3)) 
														{
%>
															<option value="<%=preQuarter[i]%>" selected><%=preQuarter[i]%></option>
<%
														} else {
%>
															<option value="<%=preQuarter[i]%>" ><%=preQuarter[i]%></option>	
<%
														}
												    }
%>   
                                                </select>
<%
										}
%>
	
										<label id="selDisp3" name="selDisp3" style="font-weight:bold;"><%=headerNPRate1%></label><!-- <label id="PeriodRate3" name="PeriodRate3" style="font-weight:bold;" ><%=preQuarter[3]%></label> --></th>
										<th class="text-center" width="14%">
<%
										if(("D").equals(status) || ("R").equals(status)|| ("RH").equals(status))
										{
										
%>											<select multiple class="form-control multi1 selPeriod2" id="selPeriodRate2" name="selPeriodRate2" >								
<% 
												    for(int i=preQuarter.length-1; i>=0;i--){
													String quarterval2 = preQuarter[i].substring(0,5);

														
														//if(headerNPRate2.contains(quarterval2)) 
															if(headerNPRate2.contains(preQuarter[i]))
														{
%>
															<option value="<%=preQuarter[i]%>" selected><%=preQuarter[i]%></option>
<%
														} else {
%>
															<option value="<%=preQuarter[i]%>" ><%=preQuarter[i]%></option>	
<%
														}
												    }
%>   
                                                </select>
<%
										}
%>										<label id="selDisp2" name="selDisp2" style="font-weight:bold;"><%=headerNPRate2%></label><!-- <label id="PeriodRate2" name="PeriodRate2" style="font-weight:bold;" ><%=preQuarter[2]%></label> --></th>
										<th class="text-center" width="14%">
<%
										if(("D").equals(status) || ("R").equals(status) || ("RH").equals(status))
										{
										
%>										<select multiple class="form-control multi1 selPeriod1" id="selPeriodRate1" name="selPeriodRate1" >								
<% 
												   for(int i=preQuarter.length-1; i>=0;i--){
													String quarterval1 = preQuarter[i].substring(0,5);
														
														//if(headerNPRate3.contains(quarterval1)) 
															if(headerNPRate3.contains(preQuarter[i])) 
														{
%>
															<option value="<%=preQuarter[i]%>" selected><%=preQuarter[i]%></option>
<%
														} else {
%>
															<option value="<%=preQuarter[i]%>" ><%=preQuarter[i]%></option>	
<%
														}											    }
%>   
                                                </select>
<%
										}
%>										<label id="selDisp1" name="selDisp1" style="font-weight:bold;"><%=headerNPRate3%></label><!-- <label id="PeriodRate1" name="PeriodRate1" style="font-weight:bold;" ><%=preQuarter[1]%></label> --></th>
										<th class="text-center" width="14%">
<%
										if(("D").equals(status) || ("R").equals(status) || ("RH").equals(status))
										{
										
%>										<select multiple class="form-control multi1 selPeriod0" id="selPeriodRate0" name="selPeriodRate0" >								
<% 
												   for(int i=preQuarter.length-1; i>=0;i--){
													String quarterval0 = preQuarter[i].substring(0,5);

														
														//if(headerNPRate4.contains(quarterval0))
															if(headerNPRate4.contains(preQuarter[i]))
														{
%>
															<option value="<%=preQuarter[i]%>" selected><%=preQuarter[i]%></option>
<%
														} else {
%>
															<option value="<%=preQuarter[i]%>" ><%=preQuarter[i]%></option>	
<%
														}
												    }
%>   
                                                </select>
<%
										}
%>										<label id="selDisp0" name="selDisp0" style="font-weight:bold;"><%=headerNPRate4%></label><!-- <label id="PeriodRate0" name="PeriodRate0" style="font-weight:bold;" ><%=preQuarter[0]%></label> --></th>
										<!-- <th class="text-center" width="15%"><label id="PeriodRate3" name="PeriodRate3" style="font-weight:bold;" ><%//=headerNPRate1%></label></th>
										<th class="text-center" width="15%"><label id="PeriodRate2" name="PeriodRate2" style="font-weight:bold;" ><%//=headerNPRate2%></label></th>
										<th class="text-center" width="15%"><label id="PeriodRate1" name="PeriodRate1" style="font-weight:bold;" ><%//=headerNPRate3%></label></th>
										<th class="text-center" width="15%"><label id="PeriodRate0" name="PeriodRate0" style="font-weight:bold;" ><%//=headerNPRate4%></label></th>
 -->


										<th class="text-center" width="14%"><label id="currPeriodRate" name="currPeriodRate" style="font-weight:bold;"><%=headerNPRate5%></label> </th>
										<th class="text-center" width="15%">% Change</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-center">Printed Waste</td>
<%
										if(("D").equals(status) || ("R").equals(status) || ("RH").equals(status))
										{
%>
										<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field1"  id="field1" maxlength="10" onblur="javascript: indexCal2('field1','npRate1','pwm1');" value="<%=pwmQ1FinalRate%>"  <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field2"  id="field2" maxlength="10" onblur="javascript: indexCal2('field2','npRate2','pwm2');" value="<%=pwmQ2FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field3"  id="field3"  maxlength="10" onblur="javascript: indexCal2('field3','npRate3','pwm3');"  value="<%=pwmQ3FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field4"  id="field4" maxlength="10" onblur="javascript:calRealisation('field4','field5','finalPWM',2),indexCal2('field4','npRate4','pwm4');" value="<%=pwmQ4FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field5"   id="field5" maxlength="10" onblur="javascript:calRealisation('field4','field5','finalPWM',2), indexCal2('field5','npRate5','pwm5');"  value="<%=pwmQ5FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right "  name="finalPWM" id="finalPWM"  value="<%=pwmPercentFinalRate%>"  readonly></div></td>

<%
										}else
										{
%>
										<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=pwmQ1FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=pwmQ2FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=pwmQ3FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=pwmQ4FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=pwmQ5FinalRate%></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><%=pwmPercentFinalRate%></div></td>

<%
										}	
%>
									</tr>

									<tr>
										<td class="text-center">Tear Off</td>
<%
										if(("D").equals(status) || ("R").equals(status) || ("RH").equals(status))
										{
%>
										<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field6" id="field6" maxlength="10" onblur="javascript: indexCal2('field6','npRate1','tow1');" value="<%=towQ1FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field7" id="field7" maxlength="10" onblur="javascript: indexCal2('field7','npRate2','tow2');" value="<%=towQ2FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field8" id="field8"  maxlength="10" onblur="javascript: indexCal2('field8','npRate3','tow3');" value="<%=towQ3FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field9" id="field9" maxlength="10" onblur="javascript:calRealisation('field9','field10','finalTOW',2),indexCal2('field9','npRate4','tow4');" value="<%=towQ4FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field10" id="field10" maxlength="10" onblur="javascript:calRealisation('field9','field10','finalTOW',2),indexCal2('field10','npRate5','tow5');" value="<%=towQ5FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="finalTOW" id= "finalTOW" value="<%=towPercentFinalRate%>" readonly></div></td>
<%
										}else
										{
%>
										<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=towQ1FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=towQ2FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=towQ3FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=towQ4FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=towQ5FinalRate%></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><%=towPercentFinalRate%></div></td>

<%
										}	
%>
									</tr>
									
									<tr>
										<td class="text-center">Reel Ends</td>
<%
										if(("D").equals(status) || ("R").equals(status) || ("RH").equals(status))
										{
%>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field11" id="field11" maxlength="10" onblur="javascript: indexCal2('field11','npRate1','resp1');" value="<%=rspQ1FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field12"  id="field12" maxlength="10" onblur="javascript: indexCal2('field12','npRate2','resp2');" value="<%=rspQ2FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field13"  id="field13" maxlength="10" onblur="javascript: indexCal2('field13','npRate3','resp3');" value="<%=rspQ3FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field14"  id="field14" maxlength="10" onblur="javascript:calRealisation('field14','field15','finalRSP',2),indexCal2('field14','npRate4','resp4');" value="<%=rspQ4FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field15"  id="field15" maxlength="10" onblur="javascript:calRealisation('field14','field15','finalRSP',2),indexCal2('field15','npRate5','resp5');" value="<%=rspQ5FinalRate%>" <%=disabled_Str%> ></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="finalRSP" id="finalRSP" value="<%=rspPercentFinalRate%>" readonly></div></td>

<%
										}else
										{
%>
										<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=rspQ1FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=rspQ2FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=rspQ3FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=rspQ4FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=rspQ5FinalRate%></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><%=rspPercentFinalRate%></div></td>

<%
										}	
%>
									</tr>
									
									<tr>
										<td class="text-center">Press Sweepings</td>
<%
										if(("D").equals(status) || ("R").equals(status) || ("RH").equals(status))
										{
%>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field16"  id="field16" maxlength="10" onblur="javascript: indexCal2('field16','npRate1','ps1');" value="<%=psQ1FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field17"  id="field17" maxlength="10" onblur="javascript: indexCal2('field17','npRate2','ps2');" value="<%=psQ2FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field18"  id="field18" maxlength="10"  onblur="javascript: indexCal2('field18','npRate3','ps3');" value="<%=psQ3FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field19"  id="field19" maxlength="10" onblur="javascript:calRealisation('field19','field20','finalPS',2),indexCal2('field19','npRate4','ps4');" value="<%=psQ4FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field20"  id="field20" maxlength="10" onblur="javascript:calRealisation('field19','field20','finalPS',2),indexCal2('field20','npRate5','ps5');" value="<%=psQ5FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="finalPS" id="finalPS" value="<%=psPercentFinalRate%>" readonly></div></td>
<%
										}else
										{
%>
										<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=psQ1FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=psQ2FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=psQ3FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=psQ4FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=psQ5FinalRate%></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><%=psPercentFinalRate%></div></td>

<%
										}	
%>
									</tr>
	
									<tr>
										<td class="text-center">Aluminum Plates</td>
<%
										if(("D").equals(status) || ("R").equals(status) || ("RH").equals(status))
										{
%>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field21" id="field21" value="<%=apQ1FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field22" id="field22"  value="<%=apQ2FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field23" id="field23"   value="<%=apQ3FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field24" id="field24" onblur="javascript:calRealisation('field24','field25','finalAP',2)" value="<%=apQ4FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="field25" id="field25" onblur="javascript:calRealisation('field24','field25','finalAP',2)" value="<%=apQ5FinalRate%>" <%=disabled_Str%>></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="finalAP" id="finalAP" value="<%=apPercentFinalRate%>" readonly></div></td>

<%
										}else
										{
%>
										<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=apQ1FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=apQ2FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=apQ3FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=apQ4FinalRate%></div></td>
										<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><%=apQ5FinalRate%></div></td>
										<td class="text-center"><div class="form-group " style="margin-left:5px;margin-right:5px;"><%=apPercentFinalRate%></div></td>

<%
										}	
%>
									</tr>
									
								</tbody>
							</table>
						</div>
						</div>
						</div>
						<div class="row " style="margin-top:0;margin-bottom:0;">
						<div class="col-xs-12 " >
							<h5 style="font-weight:bold;margin-top:0px;"><span style="text-decoration:underline;">P.S.- All rates in Rs./Kg</span><br><BR>
							Index = (Final waste price / $NP rate) X 1000</h5>
			<table class="table table-bordered">

				<thead>
				<tr class="warning" >
						<th class="text-center" width="15%">$ NP Rate</th>
						<th class="text-center" width="15%"><input type="text" class="form-control text-right " name="npRate1" id="npRate1" onblur="javascript: indexCal('field1','field6','field11','field16','field21','npRate1','pwm1','tow1','resp1','ps1');" value="<%=npRateQ1%>" readonly /></th>
						<th class="text-center" width="15%"><input type="text" class="form-control text-right " name="npRate2" id="npRate2" onblur="javascript: indexCal('field2','field7','field12','field17','field22','npRate2','pwm2','tow2','resp2','ps2');" value="<%=npRateQ2%>" readonly /></th>
						<th class="text-center" width="15%"><input type="text" class="form-control text-right " name="npRate3" id="npRate3" onblur="javascript: indexCal('field3','field8','field13','field18','field23','npRate3','pwm3','tow3','resp3','ps3');" value="<%=npRateQ3%>" readonly /></th>
						<th class="text-center" width="15%"><input type="text" class="form-control text-right " name="npRate4" id="npRate4" onblur="javascript: indexCal('field4','field9','field14','field19','field24','npRate4','pwm4','tow4','resp4','ps4');" value="<%=npRateQ4%>" readonly /></th>
						<th class="text-center" width="15%"><input type="text" class="form-control text-right " name="npRate5" id="npRate5" onblur="javascript: indexCal('field5','field10','field15','field20','field25','npRate5','pwm5','tow5','resp5','ps5');" value="<%=npRateQ5%>" readonly /></th>
						
					</tr>
				</thead>
				<thead>
					<tr class="info">
						<th class="text-center" width="18%">Waste Categories</th>
						<th class="text-center" width="9%"><label id="headerNPRate3" name="headerNPRate3" style="font-weight:bold;"><%=headerNPRate1%></label></th>
						<th class="text-center" width="16%"><label id="headerNPRate2" name="headerNPRate2" style="font-weight:bold;"><%=headerNPRate2%></label></th>
						<th class="text-center" width="16%"><label id="headerNPRate1" name="headerNPRate1" style="font-weight:bold;"><%=headerNPRate3%></label></th>
						<th class="text-center" width="16%"><label id="headerNPRate0" name="headerNPRate0" style="font-weight:bold;"><%=headerNPRate4%></label></th>
						<th class="text-center" width="16%"><label id="currPeriodNPRate" name="currPeriodNPRate" style="font-weight:bold;"><%=headerNPRate5%></label> </th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-center">Printed Waste</td>
						<td class="text-center"><input type="text" class="form-control text-right " name="pwm1" id="pwm1" value="<%="".equals(pwmQ1Index)? "NA" : pwmQ1Index%>" readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="pwm2" id="pwm2" value="<%="".equals(pwmQ2Index)? "NA" : pwmQ2Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="pwm3" id="pwm3" value="<%="".equals(pwmQ3Index)? "NA" : pwmQ3Index%>" readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right "name="pwm4" id="pwm4"  value="<%="".equals(pwmQ4Index)? "NA" : pwmQ4Index%>" readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="pwm5" id="pwm5" value="<%="".equals(pwmQ5Index)? "NA" : pwmQ5Index%>"  readonly></td>
						
						
					</tr>
					<tr>
						<td class="text-center">Tear Off</td>
						<td class="text-center"><input type="text" class="form-control text-right " name="tow1" id="tow1"  value="<%="".equals(towQ1Index)? "NA" : towQ1Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="tow2" id="tow2" value="<%="".equals(towQ2Index)? "NA" : towQ2Index%>" readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="tow3" id="tow3" value="<%="".equals(towQ3Index)? "NA" : towQ3Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="tow4" id="tow4" value="<%="".equals(towQ4Index)? "NA" : towQ4Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="tow5" id="tow5" value="<%="".equals(towQ5Index)? "NA" : towQ5Index%>" readonly></td>
						
						
						
					</tr>
					<tr>
						<td class="text-center">Reel Ends</td>
						<td class="text-center"><input type="text" class="form-control text-right " name="resp1" id="resp1" value="<%="".equals(rspQ1Index)? "NA" : rspQ1Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="resp2" id="resp2" value="<%="".equals(rspQ2Index)? "NA" : rspQ2Index%>" readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="resp3" id="resp3" value="<%="".equals(rspQ3Index)? "NA" : rspQ3Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="resp4" id="resp4" value="<%="".equals(rspQ4Index)? "NA" : rspQ4Index%>" readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="resp5" id="resp5" value="<%="".equals(rspQ5Index)? "NA" : rspQ5Index%>" readonly></td>
						
						
					</tr>
					<tr>
						<td class="text-center">Press Sweepings</td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ps1" id="ps1" value="<%="".equals(psQ1Index)? "NA" : psQ1Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ps2" id="ps2" value="<%="".equals(psQ2Index)? "NA" : psQ2Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ps3" id="ps3" value="<%="".equals(psQ3Index)? "NA" : psQ3Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ps4" id="ps4" value="<%="".equals(psQ4Index)? "NA" : psQ4Index%>" readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ps5" id="ps5" value="<%="".equals(psQ5Index)? "NA" : psQ5Index%>"  readonly></td>
						
						
					</tr>
					<tr>
						<td class="text-center">Aluminum Plates</td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ap1" id="ap1" value="<%="".equals(apQ1Index)? "NA" : apQ1Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ap2" id="ap2" value="<%="".equals(apQ2Index)? "NA" : apQ2Index%>" readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ap3" id="ap3" value="<%="".equals(apQ3Index)? "NA" : apQ3Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ap4" id="ap4" value="<%="".equals(apQ4Index)? "NA" : apQ4Index%>"  readonly></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="ap5" id="ap5" value="<%="".equals(apQ5Index)? "NA" : apQ5Index%>"  readonly></td>
				
					</tr>
				</tbody>
			</table>
						</div>
						</div>
						<div class="row " style="margin-top:0;margin-bottom:0;">
						<div class="col-xs-12 col-md-12 col-lg-12 col-sm-12">
							<h5 style="font-weight:bold;margin-top:0px;margin-bottom:15px;">Highlights For Tender</h5>
<%						
							if(("I").equals(status) || ("A").equals(status))
							{
%>		
								<p style="border: 1px solid #000; padding:10px;"><%=highlightsForTender%></p>
<%
							}else {
%>
								<textarea class="textarea form-control" placeholder="Enter text ..." style=" height:auto;" name="editor" id="editor" <%=disabled_Str%> ><%=highlightsForTender%></textarea>
<%							}
%>
						</div>
						</div>
						<h5 style="font-weight:bold;margin-top:15px;margin-bottom:0;">Approvals</h5>
						<hr style="margin-top:10px;margin-bottom:10px;"/>
						<div class="row " style="margin-top:10px;">
							<div class="col-xs-5">
							<div class="form-group">
								<label class="control-label col-sm-5 col-lg-4">Regional Head:</label>
								<div class="col-sm-7 col-lg-8">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-user"></i>
										</span>
<%
										if(("D").equals(status) || ("R").equals(status) || ("RH").equals(status))
										{
										
%>
										<select class="form-control js-example-basic-single" name="zonalHeadEmailid" id="zonalHeadEmailid" onfocus="showAttachmentFile('compulsory','<%=requestId%>','<%=createdBy%>','<%=status%>');" <%=disabled_Str%> >
										
											<option value="0">Select Emailid</option>
												<%=emailStr%>
										</select>
<%
										}else
										{
%>										<input type="text" class="form-control " name="zonalHeadEmailid" id="zonalHeadEmailid" value="<%=emailStr1%>" onfocus="showAttachmentFile('compulsory','<%=requestId%>','<%=createdBy%>','<%=status%>');" <%=disabled_Str%> >
<%
										}
										
%>
									</div>
								</div>
							</div>
							</div>
						</div>
						
						<h5 style="font-weight:bold;margin-top:0px;margin-bottom:0;">Attachments</h5>
						<hr style="margin-top:10px;margin-bottom:10px;"/>
						<div class="row " >
							<div class=" col-xs-6 " >
								<table class="table table-bordered table-hover" id="tab_logic7" >			
									<thead>
										<tr >
											<th colspan="2" class="text-center" >
												Compulsory Attachments
											</th>
										</tr>
									</thead>
<%
								if(status.equals("D") || ((status.equals("R") || ("RH").equals(status)) && createdBy.equals(emailId))){
%>
									<tbody>
										<tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('compulsory','<%=requestId%>');" > <img src="../images/attachment.png" border="0" /></a> </td>	
										</tr>	
										<tr>
											<td colspan="2"  id="attachment"></td>	
											

										</tr>
									</tbody>				
<%
						}else{
%>
									<tbody>
										<tr>
											<td colspan="2"  id="attachment"></td>	
										</tr>
										<!-- <tr>
											<td colspan="2" class="text-left"  ><%//=compulsaryAttachment%></td>	
										</tr>	 -->

								</tbody>
<%
						}
%>
								</table>
							</div>	
							<div class="col-xs-6  ">
								<table class="table table-bordered table-hover" id="tab_logic7">			
									<thead>
										<tr >
											<th colspan="2" class="text-center" >
												Additional Attachments
											</th>
										</tr>
									</thead>
<%
						if(status.equals("D") || ((status.equals("R")|| ("RH").equals(status)) && createdBy.equals(emailId))){
%>
									<tbody>
										<tr>
											<td colspan="2"  >Click on image to attach file<a href="javascript:attachmentFile('additional','<%=requestId%>');" ><img src="../images/attachment.png" border="0" /></a> </td>	
										</tr>	
										<tr>
											<td colspan="2"  id="attachment1"></td>	
											
										</tr>
									</tbody>			
<%
						}else{
%>
									<tbody>
<%
									if(additionalAttachment == null || "".equals(additionalAttachment) )
									{
%>
										<tr>
											<td colspan="2" class="text-left" >No file attached</td>	
										</tr>	
<%
									}else
									{
%>										<tr>
											<td colspan="2"  id="attachment1"></td>	
											
										</tr>
									
										<!-- <tr>
											<td colspan="2" class="text-left" ><%=additionalAttachment%></td>	
										</tr> -->
<%
									}
%>										
									</tbody>
<%
						}
%>
								</table>
							</div>

						</div>

			

				<h5 style="font-weight:bold;margin-top:0px;margin-bottom:0;">Approval History</h5>
				<hr style="margin-top:10px;margin-bottom:10px;"/>				
				<div class="row" id="details"> 
				<div class="col-xs-12 col-md-12 col-sm-12 col-lg-12" >
					<table class="table table-bordered table-hover" id="">			
						<thead>
							<tr class="info"> 
								<th class="text-left" >
									Sr.No.
								</th>
								<th class="text-left" >
									Reference
								</th>
								<th class="text-left" >
									Action By
								</th>
								<th class="text-left" >
									Action On
								</th>
								<th class="text-left" >
									Remarks
								</th>
								<th class="text-left" >
									Status
								</th>
							</tr>
						</thead>
						<tbody>
<%
	int ss= 0;


		if(logList.size() == 0)	
		{
%>							
				<tr>
					<td class="text-center" colspan="6" >No action details to be display.</td>																	
				</tr>																					
<%
}else{


				for (int aa=0; aa<approverList.size(); aa++)	{
				String apprDetArr[] = (String[])approverList.get(aa);
%>
				<tr>
					<td class="text-center"><%=(aa+1)%></td>																	
					<td class="text-left"><%=reference%></td>																	
					<td class="text-left"><%=apprDetArr[3]%></td>																	
					<td class="text-left">-</td>																	
					<td class="text-left">-</td>																	
					<!-- <td class="text-center"><%//="-".equals(logArr[4])?"No comments": logArr[4]%></td>	 -->																
					<td class="text-left"><img src="<%=statusImg.get(apprDetArr[10])%>" border="0"></td>																	
				</tr>	

<%
				}
				if(approverList.size() == 0)
				{
					ss = 0;
				}else
				{
					ss = approverList.size();
				}

				for (int ll=0; ll<logList.size(); ll++)	{
				
				String logArr[] = (String[])logList.get(ll);

%>
				<tr>
					<td class="text-center"><%=(ss+(ll+1))%></td>																	
					<td class="text-left"><%=logArr[2]%></td>																	
					<td class="text-left"><%=logArr[5]%></td>																	
					<td class="text-left"><%=logArr[6]%></td>																	
					<td class="text-left"><%=logArr[4]%></td>																	
					<!-- <td class="text-center"><%//="-".equals(logArr[4])?"No comments": logArr[4]%></td>	 -->																
					<td class="text-left"><img src="<%=statusImg.get(logArr[7])%>" border="0"></td>																	
				</tr>	
<%
						
				}


		}
%>	
							</tbody>				
						</table>						
					</div>					
					</div>


						<div class="row ">
							<div class="col-xs-10">
								<div class="form-actions" style="margin-top:10px;">
								

<%
								if("D".equals(status)){
%>
								<div class="col-xs-offset-5 col-xs-7">
									<input type="button" class="btn btn-info " value="Submit" name="submitButton" id="submitButton" height="20" onclick = "javascript:validate('inProcess','<%=formName%>',this.id);"/>
									<button type="reset" class="btn btn-primary" style="width:70px;">Reset</button>
									<input type="button"  class="btn btn-warning"  value="Save As Draft" name="submitButton" id="submitButton" height="20" onclick = "javascript:validate('draft','<%=formName%>',this.id);"/>
									

								</div>
<%
								}else if(("R".equals(status) || "RH".equals(status)) && emailId.equals(createdBy) )	{

								String strReviewedFrm = "R".equals(status) ? "inReview" : "inProcess";
								
%>
								<div class="col-xs-offset-6 col-xs-5">
									<input type="button" class="btn btn-info" value="Submit" name="submitButton" id="submitButton" height="20" onclick = "javascript:validate('<%=strReviewedFrm%>','<%=formName%>',this.id);"/>
									<button type="reset" class="btn btn-primary" style="width:70px;">Reset</button>	
									<!-- <input type="button" class="btn btn-primary" value="Print" name="printButton" id="printButton" height="20" onclick = "javascript:window.print();"/> -->

								</div>
<%
								}else
								{

%>
								<div class="col-xs-offset-7 col-xs-4">
									<button type="button" class="btn btn-primary prt" style="width:70px;"  align="center" onclick="javascript:history.back();">Close</button>
								</div>
<%								}
%>
								<!-- <input type="button"  class="btn btn-warning"  value="Save As Draft" name="submitButton" id="submitButton" height="20" onclick = "javascript:validate('draft');"/> -->
								<!-- 	<button type="button" class="btn btn-info " style="width:70px;"  onclick="javascript:saveFormDetails();">Submit</button> 
									
									<button type="reset" class="btn btn-warning" style="width:120px;">Save As Draft</button>-->
								
								</div>
							</div>
						</div>

						<input type="hidden" name="headerOnTopQurter" id="headerOnTopQurter" value="<%=headerNPRate5%>">
						<input type="hidden" name="wsaPeriodTxt" id="wsaPeriodTxt" value="<%=wsaPeriod%>" />
						<input type="hidden" name="PeriodRate1" id="PeriodRate1" value="<%=headerNPRate1%>">
						<input type="hidden" name="PeriodRate2" id="PeriodRate2" value="<%=headerNPRate2%>">
						<input type="hidden" name="PeriodRate3" id="PeriodRate3" value="<%=headerNPRate3%>">
						<input type="hidden" name="PeriodRate4" id="PeriodRate4" value="<%=headerNPRate4%>">
                        <input type="hidden" name="zoneType" id="zoneType" value="<%=strZoneType%>">
						<input type="hidden" name="frmAction" id="frmAction" value="<%=status%>">
						<input type="hidden" name="realisationHeaderOnQurter" id="realisationHeaderOnQurter" value="<%=oldRealisationHeader%>">
						<input type="hidden" name="npratesize" id="npratesize" value="<%=npRateList.size()%>">
<%
						for( int nn=0; nn<npRateList.size();nn++)
						{
							String strNPArray[] = (String[]) npRateList.get(nn); 
							
							String quarStr = strNPArray[1].substring(0,2);
							String yearStr1 = strNPArray[1].substring(strNPArray[1].length() - 2);
							String disMon ="";

							if("Q1".equals(quarStr))
							{
								disMon = "JAN-"+yearStr1+",FEB-"+yearStr1+",MAR-"+yearStr1;

							}else if("Q2".equals(quarStr))
							{
								disMon = "APR-"+yearStr1+",MAY-"+yearStr1+",JUN-"+yearStr1;

							}else if("Q3".equals(quarStr))
							{
								disMon = "JUL-"+yearStr1+",AUG-"+yearStr1+",SEP-"+yearStr1;

							}else if("Q4".equals(quarStr))
							{
								disMon = "OCT-"+yearStr1+",NOV-"+yearStr1+",DEC-"+yearStr1;

							}
							String  abc =strNPArray[1]+"|"+strNPArray[2]+"|"+disMon;
%>
								
							<input type="hidden" name="npratevalue" id="npratevalue<%=nn%>" value="<%=abc%>">
					<%	}
%>					

					</div>
						</form>
					</div>

				
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-1"></div>
	
<!-- 	<td style="width:10px;"><input type="hidden" id="refreshed" value="no"/>
 --></body>
</html>
