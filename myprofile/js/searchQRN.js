var myQrnValue ="";
var mm = "";
var yy = "";
var entityName ="";
var entityCode ="";
$(document).ready(function(){		
	$("#noAutoComp").show();
	$("#autoComp").hide();
	mySearch();	
	$("#errorMessage").hide();
});

var findQuery = "";
function mySearch() {
	
	var myQrnValue ="";
	mm = $('#month').val();
	yy = $("#year").val();
	entityName = $('#entity').val();
	entityCode =  $('#entity_id').val();
	//$('#finalise').hide();
	if(entityName =="" || entityName == null  || entityName == 'null'){
		entityName ="";
	}else{
		entityName = entityCode+" - "+entityName;	
	}
	
	
	
	if((mm == "0" || mm == "") && (yy == "0" || yy == "") && (entityName == "" || entityName == null || entityName == 'null')){		
		
		//alert("else if part mm=yy=0,entity=''");
		$('#qrnValue').show();
		$('#qrnValueIG').hide();
		
		var availableTags2 = "";
		var random = +Math.random();	
		$.getJSON("/pw2/GenerateDetailedReport?random="+random+"&jsoncallback=?",
				function(result){			
					 var err = result.ERROR;
					if (err != null) {
						window.location = "login.jsp";
					}/* else if (errmsg != null) {
						alert("NO Data Found");
						$('#finalise').hide();
					} */else if (result != null) {			
						for (var index in result) {
				  			for (qrn in result[index]) {
				  				
				  				var myClientName = result[index][qrn].clientName;
				  				if(myClientName.indexOf("-") > -1){
									var arr = myClientName.split("-");
									myClientName = arr[1];
								}
				  				
							  	availableTags2 += "{key:\""+result[index][qrn].referenceID+"_"+result[index][qrn].finalised+"\""+",value:\""+result[index][qrn].referenceID+"-"+myClientName+"\"}"+",";
							  	
						    }
						}
					}					
					availableTags2 = availableTags2.substr(0,availableTags2.length-1);					
					var json = (new Function("return [" + availableTags2+ "];")());					
					
				$( "#qrnValueNoAutoComp" ).autocomplete({
					minLength: 1,
					source: json,
					focus: function( event, ui ) {
						$( "#qrnValueNoAutoComp" ).val( ui.item.value );
						$( "#qrnValueNoAutoComp_id" ).val( ui.item.key );
						return false;
					}, 
					select: function( event, ui ) {
						$( "#qrnValueNoAutoComp" ).val( ui.item.value );
						$( "#qrnValueNoAutoComp_id" ).val( ui.item.key);
						var asd = (ui.item.key ).split('_');
						var isFinalise = asd[1];
						//alert("isFinalise.."+isFinalise);						
						if(isFinalise=='false'){
							//alert("Show");
							$('#finalise').show();
							finalise();
						}else{
							//alert("Hide");
							$('#finalise').hide();								
						}
						return false;
					} 
				});
				
			});	
		
	}else if((mm == "0" || mm == "") && (yy == "0" || yy == "") && (entityName != "" || entityName != null || entityName != 'null')){
		
		//alert("else if part mm=yy=0,entit!=''");
		$('#qrnValue').hide();
		$("#errorMessage").hide();
		$('#qrnValueIG').show();
		
	var availableTags1 = "";
	var random = +Math.random();		
	
	$.getJSON("/pw2/GenerateDetailedReport?entity="+entityName+"&random="+random+"&jsoncallback=?",
		function(result){
			var err = result.ERROR;
			var errmsg = result.ERRORMESSAGE;
			if (err != null) {
				window.location = "login.jsp";
			}else if (entityName == "-" && errmsg != null) {
				//alert("Data is not found for this month");
				$("#errorMessage").show();
				$("#errorMessage").html("Data not found for current selection");
				$('#finalise').hide();
			}else if (result != null) {	 			
				for (var index in result) {
		  			for (qrn in result[index]) {						  
		  				
		  				var myClientName = result[index][qrn].clientName;
		  				if(myClientName.indexOf("-")>-1){
							var arr = myClientName.split("-");
							myClientName = arr[1];
						}	
					  	availableTags1 += "{key:\""+result[index][qrn].referenceID+"_"+result[index][qrn].finalised+"\""+",value:\""+result[index][qrn].referenceID+"-"+myClientName+"\"}"+",";
					  	
				    }
				}
			}
			availableTags1 = availableTags1.substr(0,availableTags1.length-1);
			var json = (new Function("return [" + availableTags1+ "];")());
				
				$("#qrnValueAutoComp").igCombo({						
			        width: 300,
			        dataSource: json,
			        textKey: "value",
			        valueKey: "key",				        
			        placeHolder :"Select QRN",
			        multiSelection: {
			            enabled: false,
			            showCheckboxes: true,
			        },selectionChanged: function (evt, ui) {				        	
			        	 $(".ui-igcombo-hidden-field").each(function() {
			        		 var qrnval =$(this).val();				        		
			        		 var qrnFlag = qrnval.split('_');
			        		 var isFinalise = qrnFlag[1];
			        		 findQuery = qrnFlag[0];
			        		 //alert("hello"+isFinalise);
			        		 
			        		 if(isFinalise=='false'){
									//alert("Show");
									$('#finalise').show();
									finalise();
								}else{
									//alert("Hide");
									$('#finalise').hide();								
								}
								return false;
				    		  
			    		 });
			    	 },			        
			       
			        dropDownOrientation: "bottom"
			    });
				
			//}
		}); 
		
	}else{
			//alert("else part");
			$('#qrnValue').hide();
			$("#errorMessage").hide();
			$('#qrnValueIG').show();
			
		
		var availableTags1 = "";
		var random = +Math.random();		
		
		$.getJSON("/pw2/GenerateDetailedReport?mm="+mm+"&yy="+yy+"&entity="+entityName+"&random="+random+"&jsoncallback=?",
			function(result){
				var err = result.ERROR;
				var errmsg = result.ERRORMESSAGE;
				if (err != null) {
					window.location = "login.jsp";
				}else if (mm>0 && yy>0 && errmsg != null) {
					//alert("Data is not found for this month");
					$("#errorMessage").show();
					$("#errorMessage").html("Data not found for current selection");
					$('#finalise').hide();
				}else if (result != null) {	 			
					for (var index in result) {
			  			for (qrn in result[index]) {						  
			  				
			  				var myClientName = result[index][qrn].clientName;
			  				if(myClientName !=null && myClientName !="" && myClientName!="undefined" && myClientName != undefined){
				  				if(myClientName.indexOf("-")>-1){
									var arr = myClientName.split("-");
									myClientName = arr[1];
								}	
						  	availableTags1 += "{key:\""+result[index][qrn].referenceID+"_"+result[index][qrn].finalised+"\""+",value:\""+result[index][qrn].referenceID+"-"+myClientName+"\"}"+",";
			  				}
					    }
					}
				}
				availableTags1 = availableTags1.substr(0,availableTags1.length-1);
				var json = (new Function("return [" + availableTags1+ "];")());
					
					$("#qrnValueAutoComp").igCombo({						
				        width: 300,
				        dataSource: json,
				        textKey: "value",
				        valueKey: "key",				        
				        placeHolder :"Select QRN",
				        multiSelection: {
				            enabled: false,
				            showCheckboxes: true,
				        },selectionChanged: function (evt, ui) {				        	
				        	 $(".ui-igcombo-hidden-field").each(function() {
				        		 var qrnval =$(this).val();				        		
				        		 var qrnFlag = qrnval.split('_');
				        		 var isFinalise = qrnFlag[1];
				        		 findQuery = qrnFlag[0];
				        		 //alert("hello"+isFinalise);
				        		 
				        		 if(isFinalise=='false'){
										//alert("Show");
										$('#finalise').show();
										finalise();
									}else{
										//alert("Hide");
										$('#finalise').hide();								
									}
									return false;
					    		  
				    		 });
				    	 },			        
				       
				        dropDownOrientation: "bottom"
				    });
					
					
					
				//}
			}); 
		}		
	}
	
	var query = "";	
	var arg ="";
	var fields = "";	
	function finalise()
	{ 		
		var query = "";
		if((mm == "0" || mm == "") && (yy == "0" || yy == "")){
			
			query = $('#qrnValueNoAutoComp').val();
			if(query.indexOf("-")>-1){
				var arr = query.split("-");
				query = arr[0];
			}
		}else{
			/*query = $('#qrnValueAutoComp').val();*/
			
			query = findQuery;
			if(query.indexOf("-")>-1){
				var arr = query.split("-");
				query = arr[0];
			}
			
			//alert(query);
		}
		
		//alert("query"+query);		
		allRatesData = new Array();
		
		$.ajax({
			type : 'POST',
			url : "/pw2/GenerateQRNReport",
			data : "q=" + query,
			dataType : 'json',
			success : onQuoteRetrive
		});
		
	}
	
	function onQuoteRetrive(result)
	{		
		var err = result.ERROR;			
		var errmsg = result.ERRORMESSAGE;
		
		$.each(result,function(key, val) 
				{
					if (key == "QUOTE") 
					{
						$('#QuoteRate').val(val.quoteValue);
						$('#QuoteValue').val(val.dealvalue);
						$('#QrnData').val(val.referenceID);
						$('#MaxRate').val(val.cardRateValue);
						$('#cptRate').val(val.quoteValue);
						$('#FloorRate').val(val.rateValue);						
						
					}	
					
				});
			//}
		//}
	}
	
	$("#newQRN").click(function(){
		var status = validateBeforeLoad();
		if (status){		
		$('#searchQrnForm').attr('action', "/pw2/MoSaver?page=searchQRN"); 
	 	$("#searchQrnForm").submit();
		} 
	}); 
	
	$("#finalise").click(function(){
		
		var status = validateBeforeLoad();		
		if(status){
			//$('#searchQrnForm').attr('action', "stage5-finalizeQRNNew.jsp");
			$('#searchQrnForm').attr('action', "/pw2/MoSaver?page=searchQRNFinalization");			
		 	$("#searchQrnForm").submit();
		}; 
	});
	
	var qrnValueAutoComp = "";
	var qrnValueNoAutoComp = "";
	
	function validateBeforeLoad(){
		/*qrnValueAutoComp = $('#qrnValueAutoComp').val();*/
		qrnValueNoAutoComp = $('#qrnValueNoAutoComp').val();
		qrnValueAutoComp = findQuery;
		//alert(qrnValueNoAutoComp+"==="+qrnValueAutoComp);
		if((qrnValueAutoComp == null ||qrnValueAutoComp == 'null' || qrnValueAutoComp == "" 
			|| qrnValueAutoComp == "0") && (qrnValueNoAutoComp == null || qrnValueNoAutoComp == 'null' 
			|| qrnValueNoAutoComp == "" || qrnValueNoAutoComp == "0")){
			//alert("Please Select qrn.");
			$("#errorMessage").show();
			$("#errorMessage").html("Please Select QRN.");
			$("#qrnValueAutoComp").focus();		
			return false;
		}else{
			if(qrnValueAutoComp != null && qrnValueAutoComp != 'null' && qrnValueAutoComp != "" && qrnValueAutoComp != "0"){
				if(qrnValueAutoComp.indexOf("-")>-1){
					var arr = qrnValueAutoComp.split("-");
					qrnValueAutoComp = arr[0];
				}	
				$('#QrnData').val(qrnValueAutoComp);
			}else{
				if(qrnValueNoAutoComp.indexOf("-")>-1){
					var arr = qrnValueNoAutoComp.split("-");
					qrnValueNoAutoComp = arr[0];
				}
				$('#QrnData').val(qrnValueNoAutoComp);		
			}
		}	
		return true; 
	}
	
	function CheckAutocomp(){
		if(mm == "0" || mm == ""){
			//alert("Please Select Month.");
			$("#errorMonth").show();
			$("#errorMonth").html("Please Select Month.");
			$("#month").focus();
			return false;
		}else if(yy == "0" || yy == ""){
			//alert("please Select Year.");
			$("#errorYear").show();
			$("#errorYear").html("Please Select Year.");
			$("#year").focus();
			return false;
		}
		return true;
	}
	
	 $("#month").blur(function(){ 
		if(mm != "0" || mm != ""){
			$("#errorMonth").hide();
		}
		else{
			$("#errorMonth").show();
		}
	});	
	 
	 $("#year").blur(function(){ 
			if(mm != "0" || mm != ""){
				$("#errorYear").hide();
			}
			else{
				$("#errorYear").show();
			}
		});	
	
	 
	$("#qrnValueAutoComp").blur(function(){	
		var qrnAutoComp = $('#qrnValueAutoComp').val();		
			if(qrnAutoComp != "" || qrnAutoComp != 'null' || qrnAutoComp != "0"){
				$("#errorMessage").hide();				
			}
			else{
				$("#errorMessage").show();
			}
		});
	 
	 $("#qrnValueNoAutoComp").blur(function(){ 
		 var qrnNoAutoComp = $('#qrnValueNoAutoComp').val();		 
			if(qrnNoAutoComp != "" || qrnNoAutoComp != 'null' || qrnNoAutoComp != "0"){
				$("#errorMessage").hide();
			}
			else{
				$("#errorMessage").show();
			}
		});  
	 
	 function entitySearch(){

			var availableTags5 = "";
			var json = "";
			$( "#entity" ).autocomplete({
						minLength: 3,			
						source: function( request, response ) {
							$.ajax( {
								url: "/pw2/GetComponents?page=loadEntity&jsoncallback=?",
								dataType: "jsonp",
								virtualization: true,
								data:
								{
									term : request.term
								},
								success: function( data ) {
									//response( data );
									var err = data.ERROR;
									var errorMessage = data.ERRORMESSAGE;
									if(errorMessage != null){
										availableTags5 += "{key:\""+ 0+"\""+",value:\""+errorMessage+"\"}"+",";
									}else if (err != null) {
										window.location = "login.jsp";
										//alert(err);
										
									}else if (data != null) {				
										for (var index in data) {
											//availableTags5 += "{key:\""+ parseInt(index)+"\""+",value:\""+parseInt(index)+" - "+data[index]+"\"}"+",";
											availableTags5 += "{key:\""+ parseInt(index)+"\""+",value:\""+data[index]+"\"}"+",";
										}
									}
									availableTags5 = availableTags5.substr(0,availableTags5.length-1);
									
									json = new Function("return [" + availableTags5+ "];")();
									response( json );
								},
								error: OnFail
							});
						},
						focus: function( event, ui ) {
							$( "#entity" ).val( ui.item.value );
							$( "#entity_id" ).val( ui.item.key );
							return false;
						},
					    select: function (event, ui){
					    	$( "#entity" ).val( ui.item.value );
							$( "#entity_id" ).val( ui.item.key );
							$( "input" ).removeClass( "ui-autocomplete-loading" );
							return false;
						}		
			});
		}//end of function entitySearch

	 function OnFail()
	 {
		 window.location = "login.jsp";
	 }
	 
	 function testMyQRN(){    	
		 
		 var status = validateBeforeLoad();
		 if (status){
			var qrnlist ="";
		  	var str = "ss";
			var random = Math.random();
			var searchText = $('#QrnData').val();
			
			loadFragment("documentDetails.jsp?searchText="+searchText+"&random="+random+"&selectedStr="+str+"&qrnlist="+qrnlist, "myModal2","");
		}
	} 
	 
	 function viewQRN(){    	
		  var status = validateBeforeLoad();
		 if (status){
			var qrnlist ="";
		  	var str = "ss";
			var random = Math.random();
			var searchText = $('#QrnData').val();
			
			loadFragment("documentDetails.jsp?searchText="+searchText+"&random="+random+"&selectedStr="+str+"&qrnlist="+qrnlist, "myModal3","");
			 $('#myModal3').modal('show');
		}
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
		 	var processingRequest = '<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
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
	 
	 
	 
	 
	 
	 