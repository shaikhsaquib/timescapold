var editionAdroute = ""; 

$(window).load(function(){
					
	
		if(innoText != ""){	
			getInnovationDetails();
		}	
		setTimeout(function () { 
		
			if(innoText == ""){		
			
				if(packageData != null)
					loadeditiondataPack();
				else
					loadeditiondata();	
			}else{
				if(packageData != null)
					loadeditiondataWithInnovationsPack();
				else
					loadeditiondataWithInnovations();			
			}
			
			
		        $("div.holder").jPages({containerID: "itemContainer", perPage: 1, keyBrowse: true, animation: "fadeInRight", callback: function (pages, items) {  }
				 });
				 
		        $("#mady").click(function () {
		        		var page = parseInt($("#pag_val").val());
				        $("div.holder").jPages(page);
				});
				
				$("select#Itemsperpage").change(function (){
				    
		           var newPerPage = parseInt($(this).val());
		    
		            $("div.holder").jPages("destroy").jPages({ containerID: "itemContainer", perPage: newPerPage, keyBrowse: true, scrollBrowse: true, 
		            	callback: function (pages, items) {  } });
				});
		       
				$("select#Animation").change(function () {
		            
		            var newAnimation = $(this).val();
		            
		            $("div.holder").jPages("destroy").jPages({ containerID: "itemContainer", animation: newAnimation, keyBrowse: true, scrollBrowse: true,
		                callback: function (pages, items) {   }  });
		        });		        
		        
				jQuery('#load_div').removeClass('saving');		
		}, 100);				
});
 
 function syncSelectedBU(editionFormData) {
		
		$.ajax({
			  type: 'POST',
			  url: "/pw2/GetSelectedBU",
			  data: "bu="+encodeURIComponent(query)+"&bcc="+encodeURIComponent($("#bccCategory").val())+"&tcc="+encodeURIComponent($("#tccSubCategory").val()),
			  dataType: 'json',
			  success : function(out) {
				  
				  if(out != null && out.BU != null) {					  
					  selectedEds = out.BU;					 					 
					 loadeditiondata(editionFormData);					 
					  if(query!= '') {
						  $("#editionFormData").val(query);						    						  	
						  	if(adcat == '13'){
						  		$('#editionForm').attr('action', "classifiedCalc.jsp");
						  	}else{						  		
						  		$('#editionForm').attr('action', "/pw2/stage3.jsp"); 
						  	}
					        $("#editionForm").submit();					       
			  			}
				  }
			  }
			});
	}	 
 
 
 function loadeditiondata() {
	 
		var count = 1;
		var editiondata = "";
		var userInsertionCount = userInscount;       // i loop
		var innovationInsertionCount = 1;  //k loop
		var tmpcnt = 0 ;							
	
				for(var edition in editionFormData){	
					
						if(edition.indexOf("^^^") != -1)
						{	
							var edarr = edition.split("\^^^");									
							ednid = edarr[0];							
						}
						else{
							ednid = edition;
							}
					
					var totalCount = 1;
					
					var editionName = editionFormData[edition]["EDITIONNAME"];
					var checkBox = editionFormData[edition]["CHECKBOX"];
					var mandClass = editionFormData[edition]["CLASS"];
					var mandEdtn = editionFormData[edition]["MANDATORY"];
					var brand = editionFormData[edition]["BRAND"];
					var order = editionFormData[edition]["ORDER"];								
					var editionName = editionFormData[edition]["EDITIONNAME"];
					var col = editionFormData[edition]["COLOR"];		
					var sapCode = editionFormData[edition]["sapCode"];
					var dataEdi = editionFormData[edition]["HEADERCLASS"];
					var manCount = 1;
					
					for(var k=0;k<userInsertionCount;k++){  //user insertion count = i
					
						editiondata += '<li style="display: inline;"><span class="unselectable" style="color:#FFFFFF;">'+count+'</span>';
						editiondata += '<div class="owl-carousel owl-theme">';	
					
						for(var i=0;i<innovationInsertionCount;i++){  //innovation insertion count = k
																				
								if(edition.indexOf("^^^")>-1){
									var arr = edition.split("^^^");
									edition = arr[0];
								}															
							
							 	editiondata += '<div class="item">';					 						 								 	
							 	editiondata += '<div class="slider_flip">';
							 	editiondata += '<form action="#" method="">';
							 	editiondata += '<div class="row">';
							 	editiondata += '<div class="col-sm-12">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Edition Selected</label>';
							 								 
							 	if(checkBox =='Y'){
							 		var arr = dataEdi.split("-");
									dataSplit = arr[0]; // Primary Editions
									dataSplit2 = arr[1];// Mandatory Edition
									var myEditions = dataSplit+order;
									if(manCount == 1){
									 	if(mySelectedEdition.indexOf(myEditions) !== -1){
											editiondata += '<div class="show_loc form-control">';
											editiondata += '<input type="checkbox" checked name= "'+dataSplit+'" id="'+dataSplit+order+'" value="'+order+'-'+dataSplit2+'"></input>'+editionName+'</div>';
									 	}else{
									 		editiondata += '<div class="show_loc form-control">';
											editiondata += '<input type="checkbox" name= "'+dataSplit+'" id="'+dataSplit+order+'" value="'+order+'-'+dataSplit2+'"></input>'+editionName+'</div>';
									 	}
									}else{
										
										editiondata += '<div class="show_loc form-control">';
										editiondata += '<div class="show_loc form-control">';	
										editiondata += +editionName+'</div>';
										
									}						
									
							 	}else{
							 	editiondata += '<div class="show_loc form-control">'+editionName+'</div>';
							 	}
							 	
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-12 col-xs-12">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="color:#DD375F;font-size:1.1em;">Innovation</label>';
							 	editiondata += '<input type="text" class="form-control" value="Not Applicable" readonly />';
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Start Date</label>';
							 
							 	editiondata += '<input name="datepickerfrm" data-date-end-date="'+todate+'" custom_id="'+tmpcnt+'" id="datepickerfrm'+tmpcnt+'" readonly class="form-control cal_icon datepickerfrom datepickerfrom1 form-field fromDate0'+ednid+totalCount+'"   required="" type="text" value="'+frmdate+'" onchange="checkall(this.value,\'datepickerfrm\')">';
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">End Date</label>';
							
							 	editiondata += '<input name="datepickerto" data-date-start-date="'+frmdate+'" custom_id="'+tmpcnt+'" id="datepickerto" readonly class="form-control cal_icon datepickto datepickto1 form-field toDate0'+ednid+totalCount+'"   required="" type="text" value="'+todate+'" onchange="checkall(this.value,\'datepickerto\')">';
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Page</label>';
							 	
							 	editiondata += '<select name="page" onchange="checkall(this.value,\'page\'),hidePagePos(this.value,\'page\');" class="pg form-control page0'+ednid+totalCount+'" required="" id="page">';
							 	editiondata += '<option value="1" >Left Hand Page</option>';
							 	editiondata += '<option value="2" selected="selected">Right Hand Page</option>';			
							 	editiondata += '</select>';
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Page Position</label>';
							
							 	
							 	if(checkBox =='Y'){
							 		editiondata += '<select name="selectPagePremium" class="form-control pgpos pagePos0'+ednid+totalCount+'" required ="" id="selectPagePremium">';
								}else{									
									editiondata += '<select name="selectPagePremium" class="form-control pgpos pagePos0'+ednid+totalCount+'" required ="" id="selectPagePremium" onchange="checkallForPagePos(this.value,\'selectPagePremium\','+tmpcnt+')">';
								}
							 	editiondata += '<option value="0">Specified Page</option>';
							 	editiondata += '<option value="1">Front Page</option>';
							 	editiondata += '<option value="2" selected>Regular Page</option>';
							 	editiondata += '<option value="3">Page 5</option>';
								if(brand == "Maharashtra Times" || brand == "Navbharat Times"){
									editiondata += '<option value="8">Front Page 2</option>';
								}
								else{
									editiondata += '<option value="4">Back Page</option>';
								}
								editiondata += '<option value="5">Page 3</option>';
								editiondata += '<option value="6">Business Front Page</option>';
								editiondata += '<option value="7">Sports Front Page</option>';
								editiondata += '</select>';
							 	
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Color</label>';
							 	editiondata += '<select id="SelectColor" name="SelectColor" class="form-control color0'+ednid+totalCount+'" onchange="checkall(this.value,"SelectColor");">';
							 	editiondata += '<option value="0">All Color</option>';
							 	editiondata += '<option value="1">Black & White</option>';
							 	editiondata += '</select>';
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Size</label>';
							 	editiondata += '<select name="size" id="size" class="form-control sz size0'+ednid+totalCount+'" onchange="checkall(this.value,\'size\');customOnChange(this.value,\'size\');">';							 	
							 	editiondata +='<option value="12x20">240</option>';
							 	editiondata +='<option value="16x25">Quarter Page</option>';
							 	editiondata +='<option value="32.9x25">Half Page</option>';
							 	editiondata +='<option value="32.9x52.5">Full Page</option>';
							 	editiondata +='<option value="Custom">Custom</option>';
							 	editiondata += '</select>';		
							 	editiondata += '</div>';							 						 								 	
							 	editiondata += '</div>';	
							 	
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group">';
							 	editiondata += '';
							 	editiondata += '</div>';							 						 								 	
							 	editiondata += '</div>';	
							 								 								 	
							 	editiondata += '<div class="col-sm-3 col-xs-3">';
							 	editiondata += '<div class="form-group inner_custom_text">';														
							 	editiondata += '<input type="text" placeholder="Width" class="form-control cws wsize0'+ednid+totalCount+'" onchange="customOnChange(this.value,\'insertions_width\')" name="insertions_width" placeholder="" id="insertions" onkeypress="validateWH(event);" maxlength="4">';
							 	editiondata += '</div>';							 	
							 	editiondata += '</div>';
							 								 	
							 	editiondata += '<div class="col-sm-3 col-xs-3">';
							 	editiondata += '<div class="form-group inner_custom_text">';							
							 	editiondata += '<input type="text" placeholder="Height" class="form-control chs hsize0'+ednid+totalCount+'" onchange="customOnChange(this.value,\'insertions_height\')" name="insertions_height" placeholder="" id="insertions" onkeypress="validateWH(event);" maxlength="4">';
							 	editiondata += '</div>';							 	
							 	editiondata += '</div>';
														 								 	
							 	editiondata += '</div>';
							 	editiondata += '</form>';
							 	editiondata += '</div>';							 						 								 	
							 	editiondata += '</div>';		
							 	
							 	totalCount++;	
							 	tmpcnt++;
							 	manCount++; //for restriction of checkbox
							 	
						}
					
					editiondata += '</div>';
					editiondata += '</li>'; 
					
					count++;
					
				}
						
		   }
				
		$('#itemContainer').html(editiondata);  
				
		$('.owl-carousel,.owl-slide1').owlCarousel({ loop:false, margin:10, nav:true, navText: [ "<img src='images/arrow_left.png' />", "<img src='images/arrow_right.png' />"
			 	      ], dots: true, responsive:{ 0:{items:1 }, 600:{ items:1 }, 1000:{ items:1 } }	});
			 	
			 	
		 $('.datepickerfrom').datepicker({ format: 'dd/mm/yyyy', startDate: '+1d' });
			 	   			 			 	   
		 $('.datepickto').datepicker({ format: 'dd/mm/yyyy', // startDate: '+1d'
			 });
			 	   
				
		  $('.pgpos option[value='+pageposval+']').attr('selected','selected');		
		  
		  $('.pg option[value='+pageval+']').attr('selected','selected');
		  
	//	  alert(isCustomVal+"=="+sizeval+"==");
	
		  if(isCustomVal == true){
			 
			  	var custarr = sizeval.split("x");
			  
		 		 $('.sz  option[value=Custom]').attr('selected','selected');
		 	
		 		 $('.inner_custom_text').show();
		 		 	 		 
		 		 $('.cws').val(custarr[0]);
		 		 
		 		 $('.chs').val(custarr[1]);
		 		 
		  }else{
	 		  	$('.sz option[value='+sizeval+']').attr('selected','selected');
	 	  }				  
		 				 
 	}			
				
  	function loadeditiondataWithInnovations() { 		
 		var pageArr = [];
		pageArr["Right Hand Page"] = 2;
		pageArr["Left Hand Page"] = 1; 
		var pagePosArray = [];
		pagePosArray["Specified Page"] = 0;
		pagePosArray["Front Page"] = 1;
		pagePosArray["Regular Page"] = 2;
		pagePosArray["Page 5"] = 3;
		pagePosArray["Back Page"] = 4;
		pagePosArray["Page 3"] = 5;
		pagePosArray["Business Front Page"] = 6;
		pagePosArray["Sports Front Page"] = 7;
		pagePosArray["Market Page 1"] = 10;
		pagePosArray["Market Page 2"] = 11;
		pagePosArray["Market Page 3"] = 12;
		pagePosArray["Market Page 4"] = 13;
		var adType = $("#selectAd").val();
		adType = 1;
 		
		var count = 1;
		var editiondata = "";
		var userInsertionCount = userInscount;       // i loop
		var innovationInsertionCount = innoNoOfItems;  //k loop
		var ednid = "";										
		
					for(var edition in editionFormData){			
					
						if(edition.indexOf("^^^") != -1)
							{	
								var edarr = edition.split("\^^^");									
								ednid = edarr[0];								
							}
						else{
							ednid = edition;
						}
						
 						
						var editionName = editionFormData[edition]["EDITIONNAME"];
						var checkBox = editionFormData[edition]["CHECKBOX"];
						var mandClass = editionFormData[edition]["CLASS"];
						var mandEdtn = editionFormData[edition]["MANDATORY"];
						var brand = editionFormData[edition]["BRAND"];
						var order = editionFormData[edition]["ORDER"];								
						var editionName = editionFormData[edition]["EDITIONNAME"];
						var col = editionFormData[edition]["COLOR"];		
						var sapCode = editionFormData[edition]["sapCode"];
						var tab = editionFormData[edition]["ISTABLOID"];
						var dataEdi = editionFormData[edition]["HEADERCLASS"];
						var manCount = 1;
						var totalCount = 1;
						
						for(var k=0;k<userInsertionCount;k++){  //user insertion count = i
						
						
							//editiondata += '<li class="" style="display: inline;">';
							editiondata += '<li style="display: inline;"><span class="unselectable" style="color:#FFFFFF;">'+count+'</span>';
							editiondata += '<div class="owl-carousel owl-theme">';	
						
							for(var i=0;i<innovationInsertionCount;i++){  //innovation insertion count = k
								
									var tmpcnt = 0 ;
								
								 	editiondata += '<div class="item">';					 						 									 	
								 	editiondata += '<div class="slider_flip">';
								 	editiondata += '<form action="#" method="">';
								 	editiondata += '<div class="row">';
								 	editiondata += '<div class="col-sm-12">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Edition Selected</label>';
								 	
								 	//editiondata += '<div class="show_loc form-control">'+editionName+'<a href="javascript:void(0);"><img src="images/trash.png" /></a></div>';
								 	if(checkBox =='Y'){
								 		var arr = dataEdi.split("-");
										dataSplit = arr[0]; // Primary Editions
										dataSplit2 = arr[1];// Mandatory Editions
										var myEditions = dataSplit+order;
										if(manCount == 1){
										 	if(mySelectedEdition.indexOf(myEditions) !== -1){
												editiondata += '<div class="show_loc form-control">';
												editiondata += '<input type="checkbox" checked name= "'+dataSplit+'" id="'+dataSplit+order+'" value="'+order+'-'+dataSplit2+'"></input>'+editionName+'</div>';
										 	}else{
										 		editiondata += '<div class="show_loc form-control">';
												editiondata += '<input type="checkbox" name= "'+dataSplit+'" id="'+dataSplit+order+'" value="'+order+'-'+dataSplit2+'"></input>'+editionName+'</div>';
										 	}
										}else{
											
											editiondata += '<div class="show_loc form-control">';
											editiondata += '<div class="show_loc form-control">';	
											editiondata += +editionName+'</div>';											
										}										
										
								 	}else{
								 	editiondata += '<div class="show_loc form-control">'+editionName+'</div>';
								 	}
								 	
								 	editiondata += '</div>';
								 	editiondata += '</div>';
								 	editiondata += '<div class="col-sm-12 col-xs-12">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Innovation</label>';
								 	editiondata += '<input type="text" class="form-control" value="'+innoText+'" readonly />';
								 	editiondata += '</div>';
								 	editiondata += '</div>';
								 	editiondata += '<div class="col-sm-6 col-xs-6">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Start Date</label>';
								 
								 	editiondata += '<input name="datepickerfrm" custom_id="'+tmpcnt+'" id="datepickerfrm'+tmpcnt+'" readonly class="form-control cal_icon datepickerfrom form-field fromDate0'+ednid+totalCount+'"   required="" type="text" value="'+frmdate+'" onchange="checkall(this.value,\'datepickerfrm\')">';
								 	editiondata += '</div>';
								 	editiondata += '</div>';
								 	editiondata += '<div class="col-sm-6 col-xs-6">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">End Date</label>';
								
								 	editiondata += '<input name="datepickerto" custom_id="0" id="datepickerto" readonly class="form-control cal_icon datepickto form-field toDate0'+ednid+totalCount+'"   required="" type="text" value="'+todate+'" onchange="checkall(this.value,\'datepickerto\')">';
								 	editiondata += '</div>';
								 	editiondata += '</div>';
								 	editiondata += '<div class="col-sm-6 col-xs-6">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Page</label>';
								 	
								 	editiondata += '<select name="page" onchange="checkall(this.value,\'page\'),hidePagePos(this.value,\'page\');" class="form-control page0'+ednid+totalCount+'" required="" id="page">';								 
								 	
								 	if(arrPage[i].includes("/")){
								 		
								 	//editiondata += '<option value="1" >Left Hand Page</option>';
								 	//editiondata += '<option value="2" selected="selected">Right Hand Page</option>';	
								 		var arr = arrPage[i].split("/");
								 		for(var j = 0 ; j < arr.length ; j++){									 											 			
											var temppage = arr[j];												
											editiondata += '<option value="'+pageArr[temppage]+'">'+temppage+'</option>';											
										}	
								 		
								 	}
								 	else{
								 		var arr = arrPage[i];										
								 		editiondata += '<option value="'+pageArr[arr]+'" selected>'+arr+'</option>';
								 	}
								 	
								 	
								 	
								 	editiondata += '</select>';
								 	editiondata += '</div>';
								 	editiondata += '</div>';
								 	editiondata += '<div class="col-sm-6 col-xs-6">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Page Position</label>';
								
								 	
								 	if(checkBox =='Y'){
								 		editiondata += '<select name="selectPagePremium" class="form-control pagePos0'+ednid+totalCount+'" required ="" id="selectPagePremium">';
									}else{									
										editiondata += '<select name="selectPagePremium" class="form-control pagePos0'+ednid+totalCount+'" required ="" id="selectPagePremium" onchange="checkallForPagePos(this.value,\'selectPagePremium\','+tmpcnt+')">';
									}
								 									 	
								 	
									if(arrPagePosition[i].includes("/")){				
										var arr = arrPagePosition[i].split("/");					
										for(var j = 0 ; j < arr.length ; j++){	
											
											var temppage = arr[j];		
											
											if((brand == "Maharashtra Times" || brand == "Navbharat Times") && temppage == "Back Page"){
												editiondata += '<option value="8">Front Page 2</option>';
											}
											else{
												editiondata += '<option value="'+pagePosArray[temppage]+'">'+temppage+'</option>';
											}
										}		
									}else{
											var arr = arrPagePosition[i];				
											editiondata += '<option value="'+pagePosArray[arr]+'">'+arr+'</option>';
									} 
									
									
									editiondata += '</select>';
								 	
								 	editiondata += '</div>';
								 	editiondata += '</div>';
								 	editiondata += '<div class="col-sm-6 col-xs-6">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Color</label>';
								 	editiondata += '<select id="SelectColor" name="SelectColor" class="form-control color0'+ednid+totalCount+'" onchange="checkall(this.value,"SelectColor");">';
								 	editiondata += '<option value="0">All Color</option>';
								 	editiondata += '<option value="1">Black & White</option>';
								 	editiondata += '</select>';
								 	editiondata += '</div>';
								 	editiondata += '</div>';
								 	editiondata += '<div class="col-sm-6 col-xs-6">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Size</label>';
								 	editiondata += '<select name="size" id="size" class="form-control size0'+ednid+totalCount+'" onchange="checkall(this.value,\'size\');customOnChange(this.value,\'size\');">';							 	
								 	
								 	if((brand == "The Times of India") && innoText == "Pointer"){
								 		
								 		editiondata += '<option value="4.89x3.0">4.89x3.0</option>';
										
									}else if((brand == "Maharashtra Times" || brand == "Navbharat Times" || brand == "Sandhya Times") && innoText == "Pointer"){
										
										editiondata += '<option value="3.85x3.0">3.85x3.0</option>';
										
									}else if((brand == "Navbharat Times") && innoText == "Skybus"){
										
										editiondata += '<option value="32.9x6.0">32.9x6.0</option>';
										
									}else{
										//check for tabloid size
										
											if(tab == 1){
												
													if(arrTabSize[i].includes("/")){
														
														var arr = arrTabSize[i].split("/");	
														
														for(var j = 0 ; j < arr.length ; j++){					
															var temppage = arr[j];						
															editiondata += '<option value="'+temppage+'">'+temppage+'</option>';
														}
													}else{						
														editiondata += '<option value="'+arrTabSize[i]+'">'+arrTabSize[i]+'</option>';
													}
											 }
											else{		
												
												if(arrSize[i].includes("/")){
												
													
													var arr = arrSize[i].split("/");	
													
													for(var j = 0 ; j < arr.length ; j++){					
															var temppage = arr[j];						
															editiondata += '<option value="'+temppage+'">'+temppage+'</option>';
													}										
												}else{								
															editiondata += '<option value="'+arrSize[i]+'">'+arrSize[i]+'</option>';
													}
										}	
									}
								 	
								 	
								 	
								 	
								 	editiondata += '</select>';		
								 	editiondata += '</div>';							 						 								 	
								 	editiondata += '</div>';	
								 	
								 	editiondata += '<div class="col-sm-6 col-xs-6">';
								 	editiondata += '<div class="form-group">';
								 	editiondata += '';
								 	editiondata += '</div>';							 						 								 	
								 	editiondata += '</div>';	
								 								 								 	
								 	editiondata += '<div class="col-sm-3 col-xs-3">';
								 	editiondata += '<div class="form-group inner_custom_text">';														
								 	editiondata += '<input type="text" placeholder="Width" class="form-control cws wsize0'+ednid+totalCount+'" onchange="customOnChange(this.value,\'insertions_width\')" name="insertions_width" placeholder="" id="insertions" onkeypress="validateWH(event);" maxlength="4">';
								 	editiondata += '</div>';							 	
								 	editiondata += '</div>';
								 								 	
								 	editiondata += '<div class="col-sm-3 col-xs-3">';
								 	editiondata += '<div class="form-group inner_custom_text">';							
								 	editiondata += '<input type="text" placeholder="Height" class="form-control chs hsize0'+ednid+totalCount+'" onchange="customOnChange(this.value,\'insertions_height\')" name="insertions_height" placeholder="" id="insertions" onkeypress="validateWH(event);" maxlength="4">';
								 	editiondata += '</div>';							 	
								 	editiondata += '</div>';
								 	
								
								 	editiondata += '</div>';
								 	editiondata += '</form>';
								 	editiondata += '</div>';							 						 								 	
								 	editiondata += '</div>';		
								 	
								 	totalCount++;	
								 	manCount++;
							}
						
						editiondata += '</div>';
						editiondata += '</li>'; 
						
						count++;						
					}									
				}

	$('#itemContainer').html(editiondata);
	 	
	$('.owl-carousel,.owl-slide1').owlCarousel({loop:false, margin:10, nav:true, 
		navText: [ "<img src='images/arrow_left.png' />", "<img src='images/arrow_right.png' />" ],
	    dots: true, responsive:{ 0:{items:1 }, 600:{items:1 },1000:{items:1 } }
	});
	
	   $(".datepickto").datepicker({
		   format: 'dd/mm/yyyy', 
	   }).on('changeDate', function (selected) 
			   {	           
	           var minDate = new Date(selected.date.valueOf());
	           $('input[name="datepickerfrm"]').datepicker('setStartDate', Date1);
	    });
	   
	   jQuery('.datepick, input[name="datepickerfrm"]').datepicker({dateFormat:'dd/mm/yy',numberOfMonths: 1,setDate: '+2d',minDate: 'dateToday+1',
		     onSelect: function (selected) {
		         var dt = new Date(selected);
			     dt.setDate(dt.getDate() + 1);
		         jQuery('input[name="datepickerto"]').datepicker('setStartDate', Date1);
		     }     
		});
	   
	   $('.pgpos option[value='+pageposval+']').attr('selected','selected');			 	  
	 
	    if(isCustomVal == true){
	 		 $('.sz  option[value=Custom]').attr('selected','selected');
	 		 $('.inner_custom_text').show();
	 		 var custarr = sizeval.split("x");
	 		 $('.cws').val(custarr[0]);
	 		 $('.chs').val(custarr[1]);
	    }else{
	 		  	 $('.sz option[value='+sizeval+']').attr('selected','selected');
	 		  }				  
		  $('.pg option[value='+pageval+']').attr('selected','selected');
	
 }
 	
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
		 
		var innValue = innoText ; //$("#selectInnovation option:selected").text();		
		if(innValue != 'Select Innovation / Ad position'){
	
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
		//alert("finished");		
		
	}	
 
 
 function calcYield() 
 { 	 		 
	 
	 if(validateMobileEdtCal() != true){
		 return false;
	 }
	 
	var vertical = verticalText;
	var verticalcode = verticalTextCode;
	var searchClient = clientText ;
	var selectedAdT = adTypeText;
		
 	var dayCheck = false;
 	var query = '';
 	var cont=0;
 	var qq = '';
 	var isMandChecked = '';
 	var mandHeader = '';
 	var order ='';
 	var queryInv=''; 	
 	var date = new Date();
     var curr_date = date.getDate();
     var curr_month = date.getMonth() + 1; //Months are zero based
     var curr_year = date.getFullYear();
     if(curr_month < 10){
     	var dt = curr_date + "/0" + curr_month + "/" + curr_year;
     }else{
 		var dt = curr_date + "/" + curr_month + "/" + curr_year;
 	}    
 	 	 
 	var innovationCount = innoNoOfItems;
 	var queryInv = $("#selectInnovation option:selected").text();
 	 	
 //	var branch = $('#selectBranch').val();
 //	branch = "Mumbai";
 	
 	var adType = 1;//$("#selectAd").val();
 	insertionCount= $("#inputIns").val();
 	//innovationCount = 1;
 	if (insertionCount == 0){
 		alert(errorLoadInsertionMessage);
 		return;
 	}else{
 		//selectedAdT = $("#selectAd").val();
 	} 	
 	var isCust = false;

 	var editionData = editionFormData;

 	if (editionData != null) {
 		
 		mandEdfreeText ="";
 		primEdfreeText=""; 		
 		query = 'e={ ';
 		for(var edtn in editionData){
 			
 			var edtnCode = edtn;
 			if(edtn.indexOf("^^^")>-1){
 				edtnCode = edtn.split("^^^")[0];
 			}
 			qq += edtnCode+":";				
 			var checkBox = editionData[edtn]["CHECKBOX"];	
 			var dataEdi =editionData[edtn]["HEADERCLASS"];
 			var mandatory = editionData[edtn]["MANDATORY"];
 			var tabCheck = editionData[edtn]["ISTABLOID"];
 			var brand = editionData[edtn]["BRAND"];
 			var brandEdition = editionData[edtn]["EDITIONNAME"]; 
 			var doCalc = false;
 				 		 		
 			if(checkBox=='Y'){
 					var arr = dataEdi.split("-");					
 					if(mandHeader=='' || mandHeader != arr[0]){
 						mandHeader = arr[0];
 						isMandChecked ='';
 					}
 					
 					if($("input[type='checkbox'][name='"+arr[0]+"']:checked").length == 0 
 							&& $("#selectEditionVertical option:selected").text() !="Government" 
 							&& $("#selectEditionVertical option:selected").text() !="PSU Display"){
 								alert('Please select atleast one flexible addon for '+arr[0]);
 								 $('#cont').hide(); 	
 								/* $(".edition-calculate").removeAttr("disabled"); 	
 				 				 $(".edition-calculate").show();*/
 				 			  				 				
 								return false;						
 					}else{
 							//alert(editionData[edtn]["EDITIONNAME"]);
 							
 								order = editionData[edtn]["ORDER"];
 								doCalc = $('#'+arr[0]+order).is(':checked');
 								//alert("doCalc "+doCalc+" arr[0]+order "+arr[0]+order); 								
 								var newEd = editionData[edtn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon");
 								if(doCalc){
 									isMandChecked = isMandChecked =='' ? "No" : "Yes";
 									if(isMandChecked == "No"){
 										primEdfreeText = arr[0];
 										mandEdfreeText += newEd+" is included as a flexible addon with "+primEdfreeText+",  ";
 									}
 								}
 					}
 			}else if(checkBox=='N' && mandatory == '1'){
 					order = editionData[edtn]["ORDER"];
 					isMandChecked ='No';
 			}else{
 					order = '';
 					isMandChecked ='';
 					checkBox ='';
 			}
 			
 			if(doCalc && tabCheck=="1" && (queryInv=="Glued Flaps" || queryInv=="Book Mark" || queryInv=="Vertical Perforation"
 				|| queryInv=="Glued Reverse Flap" || queryInv=="Glued Custom Size Flap"|| queryInv=="Glued Multiple Flap"
 				|| queryInv=="Masthead Flap"|| queryInv=="Pop Up"|| queryInv=="Cross Perforation"|| queryInv=="Interlocking Jacket"
 				|| queryInv=="Lenticular(large size folded ad)"|| queryInv=="Center Butterfly Flap" || queryInv=="Disruptive Ad-(edit wrap for more than one page)"
 				|| queryInv=="French Windows" || queryInv=="Seamless Jacket" || queryInv=="Skybus + FP Roadblock" || queryInv=="Co-ordinated Ear Panels" 
 				|| queryInv == "Plow Fold" || queryInv =="XXL Jacket (Option-1)" || queryInv=="XXL Jacket (Option-2)"
                 || queryInv == "GNP Gatefold" || queryInv == "SNP Gatefold")){ 
 					alert(queryInv+ ' not appicable for tabloid '+ editionData[edtn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon") );
 					 $('#cont').hide();
 					return;			
 			}
 			if(doCalc && queryInv=="Pointer" && (brand != "The Times of India" && brand != "The Times Of India" 
 				&& brand != "Maharashtra Times" && brand !="Navbharat Times" && brand != "Sandhya Times")){
 					
 					alert(queryInv+ ' not appicable for '+ editionData[edtn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon") );
 					 $('#cont').hide();
 					return;	
 			}
 		
 			if(doCalc && queryInv=="GNP Jacket" && (brandEdition != "The Times of India - Mumbai" && brandEdition != "Bombay Times"  
 				&& brandEdition != "Navbharat Times - Mumbai" && brandEdition != "Maharashtra Times - Mumbai"
 				&& brandEdition != "The Times of India - Hyderabad" && brandEdition != "Hyderabad Times" 
 				&& brandEdition != "The Times of India - Mumbai(Mandatory included in Bombay Times at BASE-ADDON only )" 
 				&& brandEdition != "Bombay Times(Mandatory included in Bombay Times at BASE-ADDON only )" 
 				&& brandEdition != "Maharashtra Times - Mumbai(Mandatory included in Bombay Times at BASE-ADDON only )" 
 				&& brandEdition != "The Times of India - Hyderabad(Mandatory included in Bombay Times at BASE-ADDON only )" 
 				&& brandEdition != "Hyderabad Times(Mandatory included in Bombay Times at BASE-ADDON only )"
 				&& brandEdition != "Navbharat Times - Mumbai(Mandatory included in Bombay Times at BASE-ADDON only )")){
 				alert(queryInv+ ' not appicable for '+ editionData[edtn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon") );
 				 $('#cont').hide();	
 				return;	
 			} 			 		
 			
 			if(doCalc || checkBox=='N' || mandatory != '1'){
 					
 					query += '"' + encodeURIComponent(edtn) + '"' + " : { ";
 					query += ' "EDITIONNAME" : "' + encodeURIComponent(editionData[edtn]["EDITIONNAME"]) + '" , ';
 					query += ' "BRAND" : "' + editionData[edtn]["BRAND"] + '" , ';
 					query += ' "EDITIONCOLOR" : "' + editionData[edtn]["COLOR"] + '" , ';
 					query += ' "EDITIONTABLOID" : "' + editionData[edtn]["ISTABLOID"] + '" , ';
 					query += ' "DOCALC" : "' + isMandChecked + '" , ';
 					query += ' "ORDER" : "' + order + '" , ';
 					query += ' "CHECKBOX" : "' + checkBox + '" , ';
 					//alert("inside checkbox N hiiiiiii");
 					var tab = editionData[edtn]["ISTABLOID"];
 					var e = edtnCode.replace(new RegExp(' ', 'g'), '-');
 					e = e.replace(new RegExp('@', 'g'), '-');
 					e = e.replace(new RegExp('&', 'g'), '-');
 					e = e.replace(new RegExp('/', 'g'), '-');
 					e = e.replace(/\(/g, '-');
 					e = e.replace(/\)/g, '-');
 					e = e.replace(/\+/g, '-');				 					
 					
 					insertionCount = userInscount;
 					
 					for(var i = 0; i < insertionCount; i++){
 							var pagePos = '';
 							var page = '';
 							var colorVal = '';
 							
 							if(checkBox=='Y' && isMandChecked=="No"){
 								page = $(".page0" + primEdfreeText + (i + 1)).val();
 								$(".page0" + e + (i + 1)).val(page);
 								pagePos = $(".pagePos0" + primEdfreeText + (i + 1)).val();
 								$(".pagePos0" + e + (i + 1)).val(pagePos);						
 								
 								if(pagePos==4 && adType==1){
 									$(".pagePos0 option.NBT").attr('selected', true);
 									$(".pagePos0 option.NBT").attr('selected', true);
 								}
 								colorVal = $(".color0" + primEdfreeText + (i + 1)).val();
 								$(".color0" + e + (i + 1)).val(colorVal);
 							}
 							page = $(".page0" + e + (i + 1)).val();
 							pagePos = $(".pagePos0" + e + (i + 1)).val();
 							var frd  = $(".fromDate0" + e + (i + 1)).val();
 							var tod  = $(".toDate0" + e + (i + 1)).val(); 					 							
 							var publishDate = $(".toDate0" + e + (i + 1)).val();
 							
 							if(tod == ''){
 								tod = frd;
 								publishDate = frd;
 							}
 					
 							var xfr = frd.split("/");
 							var frdateObj = new Date(xfr[2], xfr[1] - 1, xfr[0]);
 							var xto = tod.split("/");
 							var todateObj = new Date(xto[2], xto[1] - 1, xto[0]);
 			
 							if(todateObj < frdateObj){
 								dayCheck = true;
 							}
 							query += '"insertion' + (i + 1) + '"' + " : { ";
 							
 							for(var kk=0; kk < innovationCount; kk++){						 							
 							
 									query+='"row '+(kk+1)+'"'+" :{";
 									query += '"frdate"' + ':"' + frd+ '",';					
 									query += '"todate"' + ':"' + tod+ '",';
 									query += '"publishedDate"' + ':"' + publishDate+ '",';
 									query += '"isPublished"' + ':"0",';					
 									query += '"page"' + ':"' +page+ '",';
 									pagePos = $(".pagePos0" + e + (kk + 1)).val();
 									var sizeType =  $(".size0" + e + (kk + 1)).val();
 									colorVal = $(".color0" + e + (kk + 1)).val();
 									
 									if(sizeType == 'Custom'){
 										
 										if( $(".wsize0" +  e + (kk + 1)).val() != '' && $(".wsize0" +  e + (kk + 1)).val() != 0 &&
 												 $(".hsize0" +  e + (kk + 1)).val() != '' && $(".hsize0" +  e + (kk + 1)).val() != 0){
 												
 											var s = $(".wsize0" + e + (kk + 1)).val() * $(".hsize0" + e + (kk + 1)).val();
 											var sizeDim = $(".wsize0" + e + (kk + 1)).val()+'x'+$(".hsize0" + e + (kk + 1)).val();	
 											if(s < 12)
 											{										
	 											alert('Please enter size.Minimum allowed size is 4x3');
	 											$('#cont').hide();
	 												return false;
 											}
 											else if(s>1727)
 											{											
 												alert("Max size allow is 1727");	
 												$('#cont').hide();
 												return false;
 											}
 											query += '"size"' + ':"' + sizeDim+ '",';
 										}
 									 }else{
 										 
 										 if(tab == "1" && sizeType == "32.9x52.5"){											
 											 sizeType = "25.3x32.9";											
 										 }else if(tab == "1" && sizeType == "32.9x25"){											
 											 sizeType = "25.3x16";											
 										 }else if(tab == "1" && sizeType == "16x25"){											
 											 sizeType = "12.5x16";											
 										 }
 										 query += '"size"' + ':"' + sizeType+ '",';
 									 }
 											query += '"color"' + ':"' + colorVal + '",';
 											query += '"itemType"' + ':"standard",';
 											query += '"position"' + ':"' + pagePos + '" },';

 								} //end off for loop
 								query = query.substring(0, query.length - 1);
 								query += '},';
 								}
 							 } 			 							
 							if(checkBox == "" || (checkBox =="Y" && doCalc == true) || checkBox == "N"){
 								query = query.substring(0, query.length - 1);
 								query += '},';		}
 							}
 					
 						}
 						query = query.substring(0, query.length - 1);
 						query += '}';		
 						
 						var clientPremium = 0;				 						
 						 				
 						if(queryInv == 'Spine' && insertionCount < 3 ){ //12-08-2015
 							alert('Minimum 3 insertions are required for innovation Spine');
 							 $('#cont').hide();
 							return;
 						} 						
 						 						
 										
 						query += "&v=" + encodeURIComponent(vertical)
 								+ "&vertCode=" + + verticalcode
 								+ "&i=" + insertionCount + "&c=" + encodeURIComponent(searchClient)
 								+ "&cp=" + clientPremium + "&inv=" + innovationCode+"&INNVT=" + encodeURIComponent(innoText)
 								+ "&selectedAdT=" + selectedAdT +"&branch="+branch;

 						//alert("query***  "+query);
 						
 						$.ajax({
 							type : 'POST',
 							url : "/pw2/NewGetYield2",
 							data : query,
 							dataType : 'json',
 							success : OnValueCal,
 							error : OnFail
 						});
 						//$('#transaction').hide();

 	}
 	
	function OnFail(result){
		 
		//alert("Calculation fail"); 
	}
	
	function OnValueCal(result){			
				
		var err = result.ERROR;
		var errb2b = result.ERRORB2B;
		
		if(err != null){
			window.location = "/pw2/mobile/error.jsp";
		}else if(errb2b != null){
			alert(errb2b);
		}else{
			$.each(result, function(key, val) {			
				
				if (key == "NEWCOST"){	
					
					$("#QuoteValue").val(val); // Quote Value OR Deal value
					
				}else if (key == "YIELD"){
					
					$("#FloorRate").val(val); // floor rate 
				
				}else if (key == "CPT"){
				
					if (val != -1){
					
						$("#cptRate").val(val);
					
					}else{
					
						$("#cptRate").val("Not Applicable");
					
					}
				}else if (key == "NEWYIELD"){ 					
					
					$("#QuoteRate").val(val);// Quote Rate
					
				}else if (key == "CARDRATE"){
				
					$("#MaxRate").val(val); //Max Rate
				
				}else if (key == "EDITIONADROUTE"){
					
					editionAdroute = val;
				
				}else if (key == "FUNCTIONNAME"){
				
					$("#FunctionName").val(val);
				
				}else if (key == "CPRRATE"){
				
					$("#cpRate").val(val);
				
				}else if (key == "QUOTE"){
					
					$("#regRate").val(val);
				
				}else if (key == "CPRID"){
				
					$("#CPRIDView").val(val);
				
				}else if (key == "MAXRATE"){
					$("#maxValue").val(val);
				}

				
	/*			else if (key == "NEWYIELD") {
					$("#newcalcrate").val(val);
				}else if (key == "NEWCOST"){
					$("#newdealrate").val(val);
				}else if (key == "NEWQUOTE") {
					$("#newquoterate").val(val);
				}else if (key == "FUNCTIONNAME"){
					$("#functionname").val(val);
				}else if (key == "CPRID"){
					$("#cprid").val(val);
				}
				else if (key == "CPRRATE"){
					$("#cprrate").val(val);
				}			*/								
				
				});
				
		}					
		saveTransaction();
	}
	
	
	function saveTransaction(){		
		
		var query = '';
		var dataType = '';
		var brand = '';
		var market = '';
		var isMandChecked = '';
		var mandHeader = '';
		var order ='';
		var checkBox ='';
		var clientPremium = 0;
		var innovationCount = innoNoOfItems;
		var innovation = null;
		insertionCount = userInscount;					
		var queryInv = "";
		queryInv = innoText;			
		
		//only on pw2
		if(innovation == null)
			innovation = 0;
		var adT = adTypeText;
		
		var adTCS = useradtype;
		if(adT == 1){
			adTCS = 'Ad Campaign';
		}else if(adT == 2){
			adTCS = 'Spot Ad';
		}else{
			adTCS = 'Not Applicable';
		}	
		var editionData = editionFormData;
		
		if(editionData != null){
			
			dataType = 'EDITION';
			query = ' { ';
			
			for(var edtn in editionData){
				var edtnCode = edtn;
				if(edtn.indexOf("^^^")>-1){
					edtnCode = edtn.split("^^^")[0];
				}
			
				checkBox = editionData[edtn]["CHECKBOX"];				
				var dataEdi =editionData[edtn]["HEADERCLASS"];
				var mandatory = editionData[edtn]["MANDATORY"];
				var doCalc = false;
							
				if(checkBox == 'Y'){
			
						var arr = dataEdi.split("-");
						if(mandHeader=='' || mandHeader != arr[0]){
							mandHeader = arr[0];
							isMandChecked ='';
						}						
						{
							order = editionData[edtn]["ORDER"];
							doCalc = $('#'+arr[0]+order).is(':checked');			
							if(doCalc){
								isMandChecked = isMandChecked =='' ? "No" : "Yes";
							}
						}
				}else if(checkBox=='N' && mandatory == '1'){
							order = editionData[edtn]["ORDER"];
							isMandChecked ='No';
				}else{
					
				
							order = '';
							isMandChecked ='';
							checkBox ='';
				}
												
					if(doCalc || checkBox == 'N' || mandatory != '1'){
						
						if(edtn.replace(/^^^/g, "-") != null && edtn.replace(/^^^/g, "-") != ""){										
							//alert("inside"+edtn);
							var primEd = dataEdi.split("-");												
							query += '"' + encodeURIComponent(edtn) + '"' + " : { ";
							query += ' "BRAND" : "'+ encodeURIComponent(editionData[edtn]["BRAND"])+ '" , ';
							query += ' "PRIMEDITION" : "' + primEd[0] + '" , ';  
							query += ' "EDITIONCOLOR" : "' + editionData[edtn]["COLOR"] + '" , ';
							
							if(doCalc){
								query += ' "EDITIONNAME" : "' + encodeURIComponent(editionData[edtn]["EDITIONNAME"]).replace("(Mandatory", "( Flexible addon") + '" , ';
							}else{
								query += ' "EDITIONNAME" : "' + encodeURIComponent(editionData[edtn]["EDITIONNAME"]) + '" , ';
							}						
							query += ' "EDITIONTABLOID" : "' + editionData[edtn]["ISTABLOID"] + '" , ';																					
							query += ' "DOCALC" : "' + isMandChecked + '" , ';														
							query += ' "ORDER" : "' + order + '" , ';														
							query += ' "CHECKBOX" : "' + checkBox + '" , ';													
							var tablo=editionData[edtn]["ISTABLOID"];							
							var adroute = editionAdroute[edtnCode];													
							if(adroute == null || adroute == ""){
								adroute = "ADDON";	
							}
							query += ' "EDITIONADROUTE" : "' + adroute + '" , ';																
							var e = edtnCode.replace(new RegExp(' ', 'g'), '-');
							e = e.replace(new RegExp('@', 'g'), '-');
							e = e.replace(new RegExp('&', 'g'), '-');
							e = e.replace(new RegExp('/', 'g'), '-');
							e = e.replace(/\(/g, '-');
							e = e.replace(/\)/g, '-');
							e = e.replace(/\+/g, '-');													
							
							for(var i = 0; i < insertionCount; i++){
																
								var pagePos = $(".pagePos0" + e + (i + 1)).val();
								var colorVal = $(".color0" + e + (i + 1)).val(); 
								var frd  = $(".fromDate0" + e + (i + 1)).val();
								var tod  = $(".toDate0" + e + (i + 1)).val();
								var publishDate = $(".toDate0" + e + (i + 1)).val();  
								if(tod == ''){
									tod = frd;
									publishDate = frd;
								}
								query += '"insertion' + (i + 1) + '"' + " : { ";
								query += '"frdate"' + ':"' + frd+ '",';
								query += '"todate"' + ':"' + tod+ '",';
								query+='"publishedDate"' + ':"'+publishDate+'",';
								query+='"isPublished"' + ':"0",';
								
								
								for(var kk=0; kk < innovationCount;kk++ ){
												
									var tempcnt = "";
									if((kk+1) ==1){
										tempcnt = "";
									}else{										
										tempcnt = kk+1;
									}
									var page = $(".page0" + e + (kk+1)).val();
									var sizeType =  $(".size0" + e + (kk+1)).val();
									var pagePos = $(".pagePos0"+e+(kk+1)).val();
									
									query += '"page'+(tempcnt) + '":"' + page+ '",';
									query += '"position'+(tempcnt) + '":"' + pagePos+ '",';
																
									if(sizeType == 'Custom'){
										
										if( $(".wsize0" +  e + (kk + 1)).val() != '' && $(".wsize0" +  e + (kk + 1)).val() != 0 &&
												 $(".hsize0" +  e + (kk + 1)).val() != '' && $(".hsize0" +  e + (kk + 1)).val() != 0){
												
											var s = $(".wsize0" + e + (kk + 1)).val() * $(".hsize0" + e + (kk + 1)).val();
											var sizeDim = $(".wsize0" + e + (kk + 1)).val()+'x'+$(".hsize0" + e + (kk + 1)).val();	
											if(s < 12){										
												$('#fade').show();
												$('#dialog').show();
												$(".msg").show().text('Please enter size.Minimum allowed size is 4x3');
												alert('Please enter size.Minimum allowed size is 4x3');
												return;
											}
											if(innovationCount == 1)
												query += '"size'+ '":"' + sizeDim + '",';
											else
												query += '"size'+(kk+1) + '":"' + sizeDim + '",';	
										}
									 }else{
										 
										 if(tablo == "1" && sizeType == "32.9x52.5"){											
											 sizeType = "25.3x32.9";											
										 }else if(tablo == "1" && sizeType == "32.9x25"){											
											 sizeType = "25.3x16";											
										 }else if(tablo == "1" && sizeType == "16x25"){											
											 sizeType = "12.5x16";											
										 }
										 
										 	if(innovationCount == 1)
												query += '"size'+ '":"' + sizeType + '",';
											else
												query += '"size'+(kk+1) + '":"' + sizeType + '",';										 
									 }									
								}//end for loop
								
								query += '"color"' + ':"' + colorVal + '",';
								query += '"itemType"' + ':"standard" },';								
							}//end for loop
								query = query.substring(0, query.length - 1);
								query += '},';
							}//end if
										
					query = query.substring(0, query.length - 1);
						//query += '},';
					
					query += ',';
		
						}//end if	
									
					
					
					}// end for
			
			query = query.substring(0, query.length - 1);
			
		}//end if
			
		query += '}';
						
		var inv =  innoText ;													 	
	 	var vertical = verticalText;
	 	var verticalcode = verticalTextCode ;
	 	var adType = adTypeText ;
	
		if(verticalText == "Select Vertical"){
				verticalText = 0;
		}
		if(adType == 4){
			verticalTextCode = 121;
		}
		if(adType == 3){
			verticalTextCode = 103;
		}
		if(adType == 2){
			verticalTextCode = 120;
		}
		if(adType == 5){
			verticalTextCode = 104;
		}
		if(adType == 11){
			verticalTextCode = 123;
		}		
				
		var opportunityMandatory ="N";
		var searchClient = clientText ;		
						
		var data = '{"VERTICAL" : "' + encodeURIComponent(verticalText)	+ '", "VERTICALCODE" : "' + encodeURIComponent(verticalTextCode)
				+ '", "HORIZONTAL" : "'  + encodeURIComponent(horizontalText) + '", "CLIENTPREMIUM" : "' + clinetPremiumText
				+'", "INNV" : "' + encodeURIComponent(inv) +'", "ADTCS" : "' +adTCS	+ '", "BRANCH" : "' + branch
				+'", "DIVISION" : "' +"04"	+ '", "OPPORTUNITY" : "' + encodeURIComponent(opportunity)
				+ '", "OPPORTUNITYMANDATORY" : "' + opportunityMandatory + '", "INNOVATION" : "' + innovationCode + '", "INSERTION" : "'
				+ userInscount + '", "CLIENT" : "' + encodeURIComponent(searchClient)+'","ENTITY" : "'+encodeURIComponent(entity)
				+ '", "ENTITYCODE" : "'+encodeURIComponent(entityCode)
				+ '", "RATE" : "' + $('#FloorRate').val() + '", "DEAL" : "' + $('#QuoteValue').val() + '", "CPT" : "' + $('#cptRate').val()
				+ '", "QUOTE" : "' + $('#QuoteRate').val() + '", "CARDRATEVALUE" : "' + $('#MaxRate').val()
				+ '", "DATATYPE" : "' + dataType + '", "DATA" : ' + query + '}';
		
		//alert("data kkkk: "+ data);		
		
		$('#data').val(data);
		
			
		document.getElementById("form1").submit();
	}
	
	function onQuoteSave(result) {		
		var err = result.ERROR;
		if (err != null) {
			window.location = "/pw2/mobile/error.jsp";
		}else{
			$.each(result,function(key, val){
				//alert("key"+val);
				if (key == "TransactionID"){
					
						$("#transaction").html('<div class="send-box"><span class="id-no" style="display">Transaction ID <br>'+val+'</span></div>');
							//"<b>Transaction ID</b><br>" + val);
						$("#transaction").show();	
						$('#sendQuote').addClass("shiny-blue-dis");
						$('#sendQuote').removeClass("shiny-blue");
						$('#sendQuote').attr("disabled", true);
					} else if (key == "ErrorMessage"){
						$("#transaction").html('');
						$("#transaction").html("<span style='color: #FF0000; font-weight: bold;  padding-left: 20px;  text-align: center;'>"
											+ val + "<span>");
					}
				});
		}
	}
	
	function customOnChange(sel_val,type)
	{			
		
		var typec=document.getElementsByName(type);	
		for(i=0;i<typec.length;i++){
			typec[i].value=sel_val;
			if(i > 0 ){}			
				//typec[i].disabled = true;
			}
	}
	
	function checkall(sel_val,type)
	{
		
		if(sel_val=='Custom')	{
			jQuery('.inner_custom_text').css("display", "block");
		}else{
			jQuery('.inner_custom_text').css("display", "none");
		}
		
		var typec=document.getElementsByName(type);
		//alert(sel_val+"=="+type);
		for(i=0;i<typec.length;i++){
			typec[i].value=sel_val;		
				if(typec[i].value == "")					
						{
						if(sel_val == 8)
						typec[i].value = 4;
						else if(sel_val == 4)
						typec[i].value = 8;	
						}
				
			}
		
	}
	
	function checkallForPagePos(sel_val,type,val){
		
		//alert(sel_val+"=="+type+"=="+val);
		
		var typec=document.getElementsByName(type);
		
		if(val == 0){
		
			for(i=0;i<typec.length;i++){
				typec[i].value=sel_val;		
					if(typec[i].value == ""){
							if(sel_val == 8)
								typec[i].value = 4;
							else if(sel_val == 4)
								typec[i].value = 8;	
					}
			}
		}
		if(val >0){
			$("#page4Position").val("Assorted");
		}
		if(type == 'selectPagePremium'){
			
			if( sel_val == '14' || sel_val == '15' )	
				$('#selectInnovation').attr('disabled', true);
			else
				$('#selectInnovation').attr('disabled', false);
			
			if(sel_val == '15'){	
				$("select#size").append('<option value="31x52.5" selected>31x52.5</option>');
				$("#size").attr('disabled', true);						
			}else if(sel_val == '14'){				
				$("select#size").append('<option value="65.8x52.5" selected>65.8x52.5</option>');				
				$("#size").attr('disabled', true);	
			}else{		
				$("select#size").attr('disabled', false);									
				$('select#size').find('[value="31x52.5"]').remove();
				$('select#size').find('[value="65.8x52.5"]').remove();		
			}		
		}
	}
	
	
	function validateWH(evt) {
		var theEvent = evt || window.event;
		var key = theEvent.keyCode || theEvent.which;
		key = String.fromCharCode(key);
		var regex = /[0-9\b\.]/;
		if (!regex.test(key)) {
			theEvent.returnValue = false;
			if (theEvent.preventDefault)
				theEvent.preventDefault();
		}
	}
	
	function validateMobileEdtCal(){
	
		var counter = 0;
		var incertionCount =  1;//$("#inputIns").val();
		var adT = $("#selectAd").val();
		//alert("hello"+innoNoOfItems);
		var innoNoOfItems = 1 ;
		if(innoNoOfItems =="" || innoNoOfItems == null){
			innoNoOfItems = 1;
		}
		counter = incertionCount * innoNoOfItems;
		
		var editionData = editionFormData;
		
		if(editionData != null){
			for(var edition in editionData){				
				var edtnCode = edition;
				if(edition.indexOf("^^^")>-1){
					edtnCode = edition.split("^^^")[0];
				}
				var e = edtnCode.replace(new RegExp(' ', 'g'), '-');
							
				for (var ii=1; ii <= counter;ii++){
		
					var startdate = $('.fromDate0'+e+ii).val();	
					var enddate = $('.toDate0'+e+ii).val();	
					var page = $('.page0'+e+ii).val();
					var pagePos = $('.pagePos0'+e+ii).val();
					var size = $('.size0'+e+ii).val();				
				//	alert(startdate+"=="+page+"=="+pagePos+"=="+size);
		
					if(startdate == ""){	
						alert("Enter Start Date");
						return false;
					}
					if(enddate == ""){	
						alert("Enter End Date");
						return false;
					}
					if(adT == 1){
						var enddate = $('.toDate0'+e+ii).val();
						if(enddate == "" || enddate == null){				
							alert("Enter End Date");
							return false;
						} 
					}
					if(page == "" || page == null){				
						alert("Enter Page");
						return false;
					}
					if(pagePos == ""){			
						alert("Enter Page position");
						return false;
					}
					if(size == "" || size == "0" || size == 0){		
						alert("Enter Size");
						return false;
					}
					if(size == "Custom"){
						var wsize = $('.wsize0'+e+ii).val();
						var hsize = $('.hsize0'+e+ii).val();
						if(wsize == "" || wsize == null){
							alert("Enter Size Width");
							return false;
						}else{
							if(hsize == "" || hsize == null){
								alert("Enter Size Height");
								return false;	 
							}
						}
						var totalSize = wsize*hsize;
						if(totalSize<12){
							alert('Please enter size.Minimum allowed size is 4x3');
							return false;
						}
					}
				}				
				return true;
			}
		} 
	}
	


	
