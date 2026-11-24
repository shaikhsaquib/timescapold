	var selectedEditions = "";
	var selectedExtraEditions = "";
	var selectedPackages = "";
	var selectedCount = 0;
	var availableTags1 = "";
	var availableTags2 = "";
	var counter =0;
	
		
	$(document).ready(function(){
		
		$('.form-control').on('focus blur', function (e) {
		    $(this).parents('.form-group').toggleClass('focused', (e.type === 'focus' || this.value.length > 0));
		}).trigger('blur');	
		
		$(function (){
			
			$.getJSON("/pw2/GetComponents?page=p&jsoncallback=?",function(result){
				
				if (result != null){				
					for (var index in result){
						availableTags1 += "{Name:\""+index+" - "+result[index]+"\""+",id:\""+result[index]+"\"}"+",";
					}
				}
				availableTags1 = availableTags1.substr(0,availableTags1.length-1);				
				
				var json = (new Function("return ["+availableTags1.toString()+"];")());
				
				$("#packages").igCombo({
						width: 300,
						dataSource: json,
						textKey: "Name",
						valueKey: "id",
						placeHolder :"Select Packages",
						multiSelection: {
						    enabled: true,
						    showCheckboxes: true,
						},selectionChanged: function (evt, ui){
							$("#packages .ui-igcombo-hidden-field").each(function() {
								
					 				selectedPackages=$(this).val();
					   			
					 				if(selectedPackages!=null && selectedPackages!=""){ 
					   					$("#errorMessage").hide();
					   					var random = Math.random();	
					   					$.ajax({url: '/pw2/MoSaver',
												type: 'POST',
												data: jQuery.param({ packCode:selectedPackages,id:random,
																	 page:'viewCart',jsoncallback:'' }),
												success: function (response){
														var json = (new Function("return ["+response+"];")());
														for(var e in json){
														   var currentPackCount=json[e].TotalCount;
														   selectedCount = currentPackCount;
														   $("#totalSelected").show();
														   $("#totalSelected").html(selectedCount);
														}
												} // end of success
					   					});  // end of ajay call
					   				// start of extra edition code
					   					var availableTag3="";
					   					$.getJSON("/pw2/GetComponents?page=extraEdition&jsoncallback=?",function(result){
					   						
					   						if (result != null) {				
					   							for (var index in result) {
					   								availableTag3 += "{Name:\""+index+" - "+result[index]+"\""+",id:\""+result[index]+"\"}"+",";
					   							}					
					   						}
					   						availableTag3 = availableTag3.substr(0,availableTag3.length-1);
					   						
					   						var json2 = (new Function("return ["+availableTag3+"];")());
					   						
					   						$("#extraEditions").igCombo({
					   						        width: 300,
					   						        dataSource: json2,
					   						        textKey: "Name",
					   						        valueKey: "id",
					   						        placeHolder :"Select Extra Editions",
					   						        multiSelection: {
					   						            enabled: true,
					   						            showCheckboxes: true,
					   						        },
					   						        selectionChanged: function (evt, ui){
					   						    
					   						        	$("#extraEditions .ui-igcombo-hidden-field").each(function(){ 
					   						        			
					   						        			selectedExtraEditions = $(this).val();
					   							    		
					   							    		 	if(selectedExtraEditions!=null && selectedExtraEditions!=""){ 
					   							    			
					   							    		 		$("#errorMessage").hide();
					   							    		 		var random = Math.random();	
					   							    		 		$.ajax({
					   							    		 			url: '/pw2/MoSaver',
					   							    		 			type: 'POST',
					   									     	        data: jQuery.param({ 
					   									     	        		extraEdCode:selectedExtraEditions,id:random,
					   									     	        		page:'extraViewCart',jsoncallback:''}),
					   									     	        success: function (response){							     	        	
					   									     	        
					   									     	        	var json = (new Function("return [" + response+ "];")());
					   									     	        	for(var e in json){
					   									     	        		var extraEditionsSelected=json[e].TotalCount;
					   									     	        		selectedCount = extraEditionsSelected;
					   									     	        		$("#totalSelected").show();
					   			                                                $("#totalSelected").html(selectedCount);
					   									     	            }	// end of for							     	        							     	    
					   									     	       }  // end of success
					   									        	 });	// end of ajax
					   								    		  }else{  //end of if
					   								    			  var random = Math.random();	
					   								   					 $.ajax({url: '/pw2/MoSaver',
					   														type: 'POST',
					   														data: jQuery.param({ myChoice:'extraEdition',id:random,
					   																			 page:'flashOut',jsoncallback:'' }),
					   														success: function (response) {
					   																var json = (new Function("return [" + response+ "];")());
					   																for(var e in json){
					   																   var currentEdCount=json[e].TotalCount;
					   																   selectedCount = currentEdCount;
					   																   $("#totalSelected").show();
					   																   $("#totalSelected").html(selectedCount);
					   																}
					   														} // end of success
					   								   					});  // end of ajay call			
					   								   					
					   								   				}  // end of else    						        	
					   							    		 });	//end of each
					   						        	},		// end of selectionchanged    				       
					   						        dropDownOrientation: "bottom"
					   						    });		// end of igcombo
					   						});			// end of json	
					   					
					   					// end of extra edition code
					   					
					   				}else{  //end of if
					   					var random = Math.random();			   					
					   					 $.ajax({url: '/pw2/MoSaver',
											type: 'POST',
											data: jQuery.param({ myChoice:'package',id:random,
																 page:'flashOut',jsoncallback:'' }),
											success: function (response) {
													var json = (new Function("return ["+response+"];")());
													for(var e in json){
													   var currentPackCount=json[e].TotalCount;
													   selectedCount = currentPackCount;
													   $("#totalSelected").show();
													   $("#totalSelected").html(selectedCount);
													}
											} // end of success
					   					});  // end of ajay call					   					
					   				}  // end of else
							});  // end of each 
							$("#packages .ui-igcombo-clear").click(function(){
								var random = Math.random();	
								$.ajax({url: '/pw2/MoSaver',
									type: 'POST',
									data: jQuery.param({ myChoice:'package',id:random,
														 page:'flashOut',jsoncallback:'' }),
									success: function (response) {
											var json = (new Function("return ["+response+"];")());
											for(var e in json){
											   var currentPackCount1=json[e].TotalCount;
											   selectedCount = currentPackCount1;
											   $("#totalSelected").show();
											   $("#totalSelected").html(selectedCount);
											}
									} // end of success
			   					});  // end of ajay call
						  });	//end of click
						},		// end of selectionchanged
			   		    dropDownOrientation: "bottom"
				  });		// end of package igcombo				
			});		// end of json 
		});		// end of function

	$(function (){

		var availableTags2 = "";
		
		$.getJSON("/pw2/GetComponents?page=e&jsoncallback=?",function(result){
					
			if (result != null) {				
				for (var index in result) {
					availableTags2 += "{Name:\""+index+" - "+result[index]+"\""+",id:\""+result[index]+"\"}"+",";
				}					
			}
			availableTags2 = availableTags2.substr(0,availableTags2.length-1);
			
			var json2 = (new Function("return ["+availableTags2.toString()+"];")());

			$("#editions").igCombo({
			        width: 300,
			        dataSource: json2,
			        textKey: "Name",
			        valueKey: "id",
			        placeHolder :"Select Editions",
			        multiSelection: {
			            enabled: true,
			            showCheckboxes: true,
			        },
			        
				     selectionChanged: function (evt, ui){
				    	 //alert(evt+ "--"+ui);
					      $("#editions .ui-igcombo-hidden-field").each(function() { 
					     	    	    		 
					    	 selectedEditions = $(this).val();
					    		
						     if(selectedEditions!=null && selectedEditions!=""){
						    	 var random = Math.random();	
						    	 $("#errorMessage").hide();
						    	 $.ajax({
							             url: '/pw2/MoSaver',
							             type: 'POST',
							     	     data: jQuery.param({ edCode:selectedEditions,id:random,
							     	       					 page:'eViewCart',jsoncallback:''}),
								     	     success: function (response){							     	        	
										     	        	var json = (new Function("return ["+response+"];")());
										     	        	for(var e in json){
										     	              var myCurrentCount=json[e].TotalCount;
										     	              selectedCount = myCurrentCount;
										     	              $("#totalSelected").show();
			                                                  $("#totalSelected").html(selectedCount);
										     	            }							     	        							     	    
										     } // end of success
						    	  });   // end of ajax
							   }else{  //end of if					 
								   	 var random = Math.random();	
				   					 $.ajax({url: '/pw2/MoSaver',
										type: 'POST',
										data: jQuery.param({ myChoice:'edition',id:random,
															 page:'flashOut',jsoncallback:'' }),
										success: function (response){
												var json = (new Function("return [" + response+ "];")());
												for(var e in json){
												   var currentEdCount=json[e].TotalCount;
												   selectedCount = currentEdCount;
												   $("#totalSelected").show();
												   $("#totalSelected").html(selectedCount);
												}
										} // end of success
				   					});  // end of ajay call			
				   					
				   				}  // end of else								        	
							 }),  // end of each
							 $("#editions .ui-igcombo-clear").click(function(){
								 var random = Math.random();	
			   					 $.ajax({url: '/pw2/MoSaver',
									type: 'POST',
									data: jQuery.param({ myChoice:'edition',id:random,
														 page:'flashOut',jsoncallback:'' }),
									success: function (response){
											var json = (new Function("return [" + response+ "];")());
											for(var e in json){
											   var currentEdCount=json[e].TotalCount;
											   selectedCount = currentEdCount;
											   $("#totalSelected").show();
											   $("#totalSelected").html(selectedCount);
											}
									} // end of success
			   					});  // end of ajay call
							  });	//end of click
				     },		// end of selection changed				       
				     dropDownOrientation: "bottom"
				});	// end of edition igcombo
			});		// end of json
		});		// end of function
		
	extraEdition();	

});  // end of ready function

	$("#editions").blur(function(){ 
		  // alert("selectedEditionCode"+selectedEditionCode);
			if(selectedEditionCode != "" && selectedPackages != ""){
				$("#errorMessage").hide();
			}
			else{
				$("#errorMessage").show();
			}
	});
	
	$("#proceed").click(function(){
		
		var status = validateBeforeLoad();
		if (status){
			 jQuery('#load_div').addClass('saving');
			 $('#stage2aForm').attr('action', "/pw2/MoSaver?page=stage2a-selectPubs"); 
		  	 $("#stage2aForm").submit();
		 }
	 });
		
	
	function validateBeforeLoad(){		
		
		if(sessionSapCode == 'null' || sessionSapCode == ''){
			sessionSapCode ="";			
		}else{
			if(sessionSapCode !=""){
				selectedEditions = selectedEditions+","+ sessionSapCode;
			}
			
		}
		if(sessionPackCode == 'null' || sessionPackCode == ''){
			sessionPackCode ="";			
		}else{
			if(sessionPackCode !=""){
				selectedPackages = selectedPackages+","+ sessionPackCode;
			}
			 
		}	
		
		if(selectedEditions == "" && selectedPackages == ""
			&& (sessionPackCode.length == 0 || sessionPackCode =='null') 
			&& (sessionSapCode.length == 0 || sessionSapCode == "null") ){
				$("#errorMessage").show();
				$("#errorMessage").html("Please select Package(s) or Edition(s) to proceed.");
				return false;
			}if((selectedEditions != "" && selectedEditions != 'null') && (selectedPackages != "" && selectedPackages != 'null')){
				$("#errorMessage").show();
				$("#errorMessage").html("You have selected both Editions & Packages. Please select either Edition(s) or Package(s) to proceed.");
				selectedPackages="";
				selectedEditions="";
				
				var random = Math.random();	
				 $.ajax({url: '/pw2/MoSaver',type: 'POST',
				data: jQuery.param({ myChoice:'clearAll',id:random,
									 page:'flashOut',jsoncallback:'' }),
				success: function (response) {
						var json = (new Function("return [" + response+ "];")());
						for(var e in json){
							$("#editions").igCombo("deselectAll");
							$("#packages").igCombo("deselectAll");
							$("#extraEditions").igCombo("deselectAll");
							sessionPackCode="";
							sessionSapCode="";
							var currentEdCount=json[e].TotalCount;
						   selectedCount = currentEdCount;
						   $("#totalSelected").show();
						   $("#totalSelected").html(selectedCount);
						}
				} // end of success
				 
			});
				return false;
			}else{
				return true;
			}
	}

	$("#packages").blur(function(){ 	
		
		extraEdition();
		if(selectedEditionCode != "" && selectedPackages != ""){
			$("#errorMessage").hide();
		}
		else{
			$("#errorMessage").show();
		}
	});

	
	$("#packages").click(function(){ 	
		
		extraEdition();
	});
	
	$("#Reset").click(function(){ 	  
		selectedEditions = "";
		selectedPackages = "";
		$("#editions").igCombo("deselectAll");
		$("#packages").igCombo("deselectAll");
		$("#extraEditions").igCombo("deselectAll");
		 
		var random = Math.random();	
			 $.ajax({url: '/pw2/MoSaver',type: 'POST',
			data: jQuery.param({ myChoice:'clearAll',id:random,
								 page:'flashOut',jsoncallback:'' }),
			success: function (response) {
					var json = (new Function("return [" + response+ "];")());
					for(var e in json){
						
					   var currentEdCount=json[e].TotalCount;
					   selectedCount = currentEdCount;
					   $("#totalSelected").show();
					   $("#totalSelected").html(selectedCount);
					}
			} // end of success
		});
	});

	function nextFunction(){	
		var status = validateBeforeLoad();
		//alert(status);
		if (status){
			jQuery('#load_div').addClass('saving');
			 $('#stage2aForm').attr('action', "/pw2/MoSaver?page=stage2a-selectPubs"); 
		  	 $("#stage2aForm").submit();
		} 
	} 
	
	function extraEdition(){
	
		var availableTag3="";
		$.getJSON("/pw2/GetComponents?page=extraEdition&jsoncallback=?",function(result){
			
			if (result != null) {				
				for (var index in result) {
					availableTag3 += "{Name:\""+index+" - "+result[index]+"\""+",id:\""+result[index]+"\"}"+",";
				}					
			}
			availableTag3 = availableTag3.substr(0,availableTag3.length-1);
			
			var json2 = (new Function("return ["+availableTag3+"];")());
			
			$("#extraEditions").igCombo({
			        width: 300,
			        dataSource: json2,
			        textKey: "Name",
			        valueKey: "id",
			        placeHolder :"Select Extra Editions",
			        multiSelection: {
			            enabled: true,
			            showCheckboxes: true,
			        },
			        selectionChanged: function (evt, ui){
			    
			        	$("#extraEditions .ui-igcombo-hidden-field").each(function(){ 
			        			
			        			selectedExtraEditions = $(this).val();
				    		
				    		 	if(selectedExtraEditions!=null && selectedExtraEditions!=""){ 
				    			
				    		 		$("#errorMessage").hide();
				    		 		var random = Math.random();	
				    		 		$.ajax({
				    		 			url: '/pw2/MoSaver',
				    		 			type: 'POST',
						     	        data: jQuery.param({ 
						     	        		extraEdCode:selectedExtraEditions,id:random,
						     	        		page:'extraViewCart',jsoncallback:''}),
						     	        success: function (response){							     	        	
						     	        
						     	        	var json = (new Function("return [" + response+ "];")());
						     	        	for(var e in json){
						     	        		var extraEditionsSelected=json[e].TotalCount;
						     	        		selectedCount = extraEditionsSelected;
						     	        		$("#totalSelected").show();
                                                $("#totalSelected").html(selectedCount);
						     	            }	// end of for							     	        							     	    
						     	       }  // end of success
						        	 });	// end of ajax
					    		  }else{  //end of if
					    			  var random = Math.random();	
					   					 $.ajax({url: '/pw2/MoSaver',
											type: 'POST',
											data: jQuery.param({ myChoice:'extraEdition',id:random,
																 page:'flashOut',jsoncallback:'' }),
											success: function (response) {
													var json = (new Function("return [" + response+ "];")());
													for(var e in json){
													   var currentEdCount=json[e].TotalCount;
													   selectedCount = currentEdCount;
													   $("#totalSelected").show();
													   $("#totalSelected").html(selectedCount);
													}
											} // end of success
					   					});  // end of ajay call			
					   					
					   				}  // end of else    						        	
				    		 });	//end of each
			        	},		// end of selectionchanged    				       
			        dropDownOrientation: "bottom"
			    });		// end of igcombo
			});			// end of json			
	}
