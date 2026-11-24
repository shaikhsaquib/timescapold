$(document).ready(function(){
   $('.panel-title .remove').click(function(){
      var t = $(this).parent().parent().parent();
      $(t).remove();
   });
   
   //alert("dataType"+dataType);
 //Form Group
   $('.form-control').on('focus blur', function (e) {
       $(this).parents('.form-group').toggleClass('focused', (e.type === 'focus' || this.value.length > 0));
   }).trigger('blur');	
   //Count height of screen
   
   /* $(".submit_view").click(function(){
		 var status = validateBeforeLoad();
	 }); */
   
   /*$("#yes").click(function(){
		 var status = validateBeforeLoad();
		 $("#userChoice").val("yes");		
		 if (status){
			 $("#pagePosition").attr("disabled", false);
				$("#pageId").attr("disabled", false);
				$("#size").attr("disabled", false);
			 
			 jQuery('#load_div').addClass('saving');
			 $('#stage2Form').attr('action', "/pw2/MoSaver?page=stage2b-insDetails"); 
		  	 $("#stage2Form").submit();
		 } 
	 });*/
   
   $("#proceed").click(function(){
	var status = validateBeforeLoad();		
	var bool = $("#yesId").is(":checked");
		
		if(bool){
			 $("#userChoice").val("yes");		
			 if (status){
				$("#pagePosition").attr("disabled", false);
					$("#pageId").attr("disabled", false);
				$("#size").attr("disabled", false);
				 
				 jQuery('#load_div').addClass('saving');
				 $('#stage2Form').attr('action', "/pw2/MoSaver?page=stage2b-insDetails"); 
			  	 $("#stage2Form").submit();
			 } 
		}else{
				var isCustomInnovation = jQuery("#innovation :selected").attr("name");
				//alert("isCustomInnovation"+isCustomInnovation);	
				 if($('#innovation').val() != "0" && isCustomInnovation == "1"){
					 	//alert("For Innovation select respective page , page-position & size by pressing Yes option");
					 	//alert("For Innovations, please proceed by clicking 'Yes' option to customize the innovation parameters.");
					 	alert("For the selected Innovation, please select the checkbox to proceed & customize the innovation parameters.");
					 	return false;
				 }else{					
							getInnovationDetails();
				 }
				 
				 setTimeout(function (){ 
									
					 if(status == true){
						
						jQuery('#load_div').addClass('saving');
					 	userInscount = $('#insertion').val();	 
					   	if(packageData != null && packageData != "" ){
					   		calcYieldPackage();	   		
					   	}else{
					   		calcYield(); 		
					   	}			   	
					 }
					 
				 }, 200);
			}
	 });  
 
   
   $("#fromdate").datepicker({
	   format: 'dd/mm/yyyy',          
       startDate: '+1d',        
   }).on('changeDate', function (selected) {
       //var Date1 = new Date(selected.date.valueOf()+(1000 * 60 * 60 * 24 * 1));
       var Date1 = new Date(selected.date.valueOf());
       $('#todate').datepicker('setStartDate', Date1);
       $('#fromdate').blur();
       $('.datepicker').hide();
   });
   
   
   $("#todate").datepicker({
	   format: 'dd/mm/yyyy',
	   startDate: '+1d',
   }).on('changeDate', function (selected) {
           //var minDate = new Date(selected.date.valueOf() - 1);
           var minDate = new Date(selected.date.valueOf());
           $('#fromdate').datepicker('setEndDate', minDate);
           $('#todate').blur();	
       	   $('.datepicker').hide();
       });
   
   $("#size").change(function(){
	 //  alert("heloooooooo");
	   var mySize = $(this).val();
	   
	    if( $(this).val() == 'Custom'){
	        $("#customw").show();
	        $("#customh").show();
	        $("#page4Size").val('Custom');
	    }else{
	        $("#customw").hide();
	        $("#customh").hide();
	        
	        $("#page4Size").val(mySize);
	    }
	    //alert( $("#page4Size").val());
	});
   
   $("#customWidth").blur(function(){
	    if( $(this).val() > 32.9){
	    	$("#errorCustomWidth").show();
			$("#errorCustomWidth").html("The width can't be more than 32.9");
			$("#customWidth").focus();
	        return false; 
	    }
	});
  
  
  $("#customHeight").blur(function(){
	    if( $(this).val() > 52.5){
	    	$("#errorCustomHeight").show();
			$("#errorCustomHeight").html("The height can't be more than 52.5");
			$("#customHeight").focus();
	        return false; 
	    }
	});
   
   
});
function toggleIcon(e) {
    $(e.target)
        .prev('.panel-heading')
        .find(".more-less")
        .toggleClass('glyphicon-plus glyphicon-minus');
}
$('.panel-group').on('hidden.bs.collapse', toggleIcon);
$('.panel-group').on('shown.bs.collapse', toggleIcon); 	  

function validateBeforeLoad(){
	var page = $.trim($("#pageId").val());
	var pagePosition = $.trim($("#pagePosition").val());
	var innovation = $.trim($("#innovation").val());
	var size = $.trim($("#size").val());
	var fromdate = $.trim($("#fromdate").val());
	var todate = $.trim($("#todate").val());
	var insertion = $.trim($("#insertion").val());
	var customWidth = $.trim($("#customWidth").val());
	var customHeight = $.trim($("#customHeight").val());
	
	//alert("size"+size);
	//alert("pagePosition"+pagePosition);
	//alert("page"+page);
	
	if(insertion == "0" || insertion == null || insertion == ""){
		//alert("Please Enter Insertion..");
		$("#errorInsertion").show();
		$("#errorInsertion").html("Please enter Insertion");
		$("#insertion").focus();		
		return false;
	}else if(fromdate == "0" || fromdate == null || fromdate == ""){
		//alert("Please Select Start Date.");
		$("#errorStartdate").show();
		$("#errorStartdate").html("Please select Start Date");
		$("#fromdate").focus();
		return false;
	}else if(todate == "0" || todate == null || todate == ""){
		//alert("Please Select End Date.");
		$("#errorEnddate").show();
		$("#errorEnddate").html("Please select End Date");
		$("#todate").focus();
		return false;
	}else if((page == "0" || page == null || page == "") && (innovation == "0")){
		//alert("Please Select Page.");
		$("#errorPage").show();
		$("#errorPage").html("Please select Page");
		$("#page").focus();
		return false;
	}else if((pagePosition == null || pagePosition == "" ||pagePosition == "selectpagepos") && (innovation == "0")){
		//alert("Please Select PagePosition.");
		$("#errorPgPosition").show();
		$("#errorPgPosition").html("Please select PagePosition");
		$("#pagePosition").focus();
		return false;
	}else if(((page == "0" || page == null || page == "") && ( pagePosition == null || pagePosition == "")) && (innovation == "0" || innovation == "" || innovation == null)){
		//alert("Please Select Innovation.");
		$("#errorInnovation").show();
		$("#errorInnovation").html("Please select Innovation");
		$("#innovation").focus();
		return false;
	}else if((innovation == "0" || innovation == "" || innovation == null) && (size == "0" || size == "" || size == null)){
		//alert("Please Select Size.");
		$("#errorSize").show();
		$("#errorSize").html("Please select Size");
		$("#size").focus();
		return false;
	}else if((size =="Custom" && (customWidth == "0" || customWidth == "" || customWidth == null) ) && (innovation == "0")){
		//alert("Please Select Width.");
		$("#errorCustomWidth").show();
		$("#errorCustomWidth").html("Please select Width");
		$("#customWidth").focus();
		return false;
	}else if(size =="Custom" && (customHeight == "0" || customHeight == "" || customHeight == null)){
		//alert("Please Select Height.");
		$("#errorCustomHeight").show();
		$("#errorCustomHeight").html("Please select Height");
		$("#customHeight").focus();
		return false;
	}else if(size =="Custom" && ($("#customWidth").val() > 32.9 )){
		//alert("The width can't be more than 32.9!");
		$("#errorCustomWidth").show();
		$("#errorCustomWidth").html("The width can't be more than 32.9");
		$("#customWidth").focus();
		return false;
	}else if(size =="Custom" && ($("#customHeight").val()> 52.5 )){
		//alert("The height can't be more than 52.5!");
		$("#errorCustomHeight").show();
		$("#errorCustomHeight").html("The height can't be more than 52.5");
		$("#customHeight").focus();
		return false;
	}else{
		var invText = $("#innovation option:selected").text();
		//alert("invText--"+invText);
		$("#innovationText").val(invText);
		if(size =="Custom"){
			 $("#page4Size").val(customWidth+"x"+customHeight);
			// alert( $("#page4Size").val());
		}
		$("#page4Position").val(pagePosition);
		return true;
	}		
}


$("#insertion").blur(function(){ 
	   //alert($("#insertion").val());
		if($("#insertion").val()!="" && $("#insertion").val()!=0)
		{ 
			$("#errorInsertion").hide();
		}
		else{
			$("#errorInsertion").show();
		}
});	

$("#fromdate").blur(function(){ 
	   //alert($("#fromdate").val());
		if($("#fromdate").val()!="" && $("#fromdate").val()!=0)
		{ 
			$("#errorStartdate").hide();
		}
		else{
			$("#errorStartdate").show();
		}
});

$("#todate").blur(function(){ 
	   //alert($("#insertion").val());
		if($("#insertion").val()!="" && $("#insertion").val()!=0)
		{ 
			$("#errorEnddate").hide();
		}
		else{
			$("#errorEnddate").show();
		}
});

$("#pageId").blur(function(){ 
	   //alert($("#insertion").val());
		if($("#page").val()!="" && $("#page").val()!=0)
		{ 
			$("#errorPage").hide();
		}
		else{
			$("#errorPage").show();
		}
});

$("#pagePosition").blur(function(){ 
	  //alert($("#insertion").val());
		if($("#pagePosition").val()!="" && $("#pagePosition").val() != "selectpagepos")
		{ 
			$("#errorPgPosition").hide();
		}
		else{
			$("#errorPgPosition").show();
		}
});

$("#size").blur(function(){ 
	   //alert($("#size").val());
		if($("#insertion").val()!="" && $("#size").val()!=0)
		{ 
			$("#errorSize").hide();
		}
		else{
			$("#errorSize").show();
		}
});

$("#customWidth").blur(function(){ 
	   //alert($("#customWidth").val());
		if($("#customWidth").val()!="" && $("#customWidth").val()!=0)
		{ 
			$("#errorCustomWidth").hide();
		}
		else{
			$("#errorCustomWidth").show();
		}
});

$("#customHeight").blur(function(){ 
	   //alert($("#customHeight").val());
		if($("#customHeight").val()!="" && $("#customHeight").val()!=0)
		{ 
			$("#errorCustomHeight").hide();
		}
		else{
			$("#errorCustomHeight").show();
		}
});


function getInnovationDetails(){
	//loadIns();
	  arrPage = "";
	  arrPagePosition = "";
	  arrSize = "";
	 optionPage = "";	
	  innovationData ="";
	 arrTabSize = "";
	  innoTabSize = "";
	// innoText = "";
	 innoPage = "";
	 innoPagePosition = "";
	 innoSize = "";
	 innoNoOfItems = "";
	 
	var innValue = $("#innovation option:selected").text();		
	if(innValue != 'Select Innovation / Ad position' && innValue != 'Select Innovation'){
	
	$.getJSON("/pw2/GetComponents?page=innova&inn="+encodeURIComponent(innValue)+"&jsoncallback=?"
			,function(result){				
			
		if (result != null){
				
			innoNoOfItems = result["1"]["NoOfItems"];
			  innCount = parseInt(innoNoOfItems);
			  				
				for(var ii = 1; ii <= innCount; ii++){
					var page = result["1"]["Page"+ii];
					var pagePosition = result["1"]["PagePosition"+ii];
					var size = result["1"]["Size"+ii];
					var tabsize = result["1"]["TabSize"+ii];
					innoPage += page+":#:";
					innoPagePosition += pagePosition+":#:";
					innoSize += size +":#:";
					innoTabSize += tabsize +":#:";
					}
				innoPage = innoPage.substring(0,innoPage.length-3);
				arrPage = innoPage.split(":#:");
				innoPagePosition = innoPagePosition.substring(0,innoPagePosition.length-3);
				arrPagePosition = innoPagePosition.split(":#:"); 
				innoSize = innoSize.substring(0,innoSize.length-3);
				arrSize = innoSize.split(":#:");
				innoTabSize = innoTabSize.substring(0,innoTabSize.length-3);
				arrTabSize = innoTabSize.split(":#:");
	
		}
		innovationData = result;
		insertionCount = innCount;							
		
	});		
	}	
		
	
}

