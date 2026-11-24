 
 function loadeditiondataPack()
 {	
		var count = 1;
		var editiondata = "";
		var userInsertionCount = userInscount;       // i loop
		var innovationInsertionCount = 1;  //k loop
		var packcount = 1;							
				
		for (var pckg in packageData) {
			
		
				for(var edition in packageData[pckg]){		
					
					if(edition != "PCKGCODE" && edition != "MARKET")
					{
						
						var editionName = packageData[pckg][edition]["EDITIONNAME"];
						var checkBox = packageData[pckg][edition]["CHECKBOX"];
						var mandClass = packageData[pckg][edition]["CLASS"];
						var mandEdtn = packageData[pckg][edition]["MANDATORY"];
						var brand = packageData[pckg][edition]["BRAND"];
						var order = packageData[pckg][edition]["ORDER"];								
						var editionName = packageData[pckg][edition]["EDITIONNAME"];
						var col = packageData[pckg][edition]["COLOR"];		
						var sapCode = packageData[pckg][edition]["sapCode"];
						var dataEdi = packageData[pckg][edition]["HEADERCLASS"];
						var totalCount = 1;
						var manCount = 1;
						
						for(var k=0;k<userInsertionCount;k++){  //user insertion count = i
					
					
						editiondata += 	'<li style="display: inline;"><span style="color:#FFFFFF;">'+count+'</span>';
					//	editiondata += '<li style="display: inline;">';
						editiondata += '<div class="owl-carousel owl-theme">';	
					
						for(var i=0;i<innovationInsertionCount;i++){  //innovation insertion count = k
											 						
								
								if(edition.indexOf("^^^")>-1){
									var arr = edition.split("^^^");
									edition = arr[0];
								}	
								
								var tmpcnt = 0 ;
								
								//alert("editionName "+editionName);
							
							 	editiondata += '<div class="item">';					 						 	
							 	editiondata += '<div class="slider_flip">';
							 	editiondata += '<form action="#" method="">';
							 	editiondata += '<div class="row">';
							 	
								editiondata += '<div class="col-sm-12">';
								editiondata += '<div class="form-group focused">';
								editiondata += '<label class="control-label" style="font-size:1.1em;">Package Selected</label>';
								editiondata += '<div class="show_loc form-control"><strong>'+pckg+'</strong></div>';
								editiondata += ' </div>';
								editiondata += '</div>';
							 	
							 	editiondata += '<div class="col-sm-12 col-xs-12">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Edition</label>';
								
								if(checkBox =='Y'){
							 		var arr = dataEdi.split("-");
									dataSplit = arr[0]; // Primary Editions
									dataSplit2 = arr[1];// Mandatory Editions
									var myEditions = dataSplit+order;	
									
										if(manCount == 1){
											//editiondata += '<div class="show_loc form-control">';
											//editiondata += '<input type="checkbox" name= "'+dataSplit+'" id="'+dataSplit+order+'" value="'+order+'-'+dataSplit2+'"></input>'+editionName+'</div>';								 																			
											if(mySelectedEdition.indexOf(myEditions) !== -1){
												editiondata += '<div class="show_loc form-control">';
												editiondata += '<input type="checkbox" checked name= "'+dataSplit+'" id="'+dataSplit+order+'" value="'+order+'-'+dataSplit2+'"></input>'+editionName+'</div>';
										 	}else{
										 		editiondata += '<div class="show_loc form-control">';
												editiondata += '<input type="checkbox" name= "'+dataSplit+'" id="'+dataSplit+order+'" value="'+order+'-'+dataSplit2+'"></input>'+editionName+'</div>';
										 	}
										}
										else{
							 	editiondata += '<div class="show_loc form-control">'+editionName+'</div>';
										}
									}									
									else{								 	
										editiondata += '<div class="show_loc form-control">'+editionName+'</div>';								 	
									}
								
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-12 col-xs-12">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Innovation</label>';
							 	editiondata += '<input type="text" class="form-control" value="Not Applicable" readonly />';
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Start Date</label>';
							 
							 	editiondata += '<input name="datepickerfrm" custom_id="'+tmpcnt+'" id="datepickerfrm'+tmpcnt+'" readonly class="form-control cal_icon datepickerfrom form-field fromDate'+packcount+edition+totalCount+'"   required="" type="text" value="'+frmdate+'" onchange="checkall(this.value,\'datepickerfrm\')">';
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">End Date</label>';
							
							 	editiondata += '<input name="datepickerto" custom_id="0" id="datepickerto" readonly class="form-control cal_icon datepickto form-field toDate'+packcount+edition+totalCount+'"   required="" type="text" value="'+todate+'" onchange="checkall(this.value,\'datepickerto\')">';
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Page</label>';
							 	
							 	editiondata += '<select name="page" onchange="checkall(this.value,\'page\'),hidePagePos(this.value,\'page\');" class="form-control pg page'+packcount+edition+totalCount+'" required="" id="page">';
							 	editiondata += '<option value="1" >Left Hand Page</option>';
							 	editiondata += '<option value="2" selected="selected">Right Hand Page</option>';			
							 	editiondata += '</select>';
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Page Position</label>';
							
							 	
							 	if(checkBox =='Y'){
							 		editiondata += '<select name="selectPagePremium" class="form-control pgpos pagePos'+packcount+edition+totalCount+'" required ="" id="selectPagePremium">';
								}else{									
									editiondata += '<select name="selectPagePremium" class="form-control pgpos pagePos'+packcount+edition+totalCount+'" required ="" id="selectPagePremium" onchange="checkallForPagePos(this.value,\'selectPagePremium\','+tmpcnt+')">';
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
							 	editiondata += '<select id="SelectColor" name="SelectColor" class="form-control color'+packcount+edition+totalCount+'" onchange="checkall(this.value,"SelectColor");">';
							 	editiondata += '<option value="0">All Color</option>';
							 	editiondata += '<option value="1">Black & White</option>';
							 	editiondata += '</select>';
							 	editiondata += '</div>';
							 	editiondata += '</div>';
							 	editiondata += '<div class="col-sm-6 col-xs-6">';
							 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Size</label>';
							 	editiondata += '<select name="size" id="size" class="form-control sz size'+packcount+edition+totalCount+'" onchange="checkall(this.value,\'size\');customOnChange(this.value,\'size\');">';							 	
							 	/*editiondata += '<option value="12x20">12x20</option>';
							 	editiondata += '<option value="20x12">20x12</option>';
							 	editiondata += '<option value="16x25">16x25</option>';
							 	editiondata += '<option value="25x16">25x16</option>';								
							 	editiondata += '<option value="32.9x52.5">Full Page</option>';
							 	editiondata += '<option value="Custom">Custom</option>';*/
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
							 	editiondata += '<div class="form-group inner-block inner_custom_text">';													 	
							 	editiondata += '<input type="text" placeholder="Width" class="form-control cws wsize'+packcount+edition+totalCount+'" onchange="customOnChange(this.value,\'insertions_width\')" name="insertions_width" placeholder="" id="insertions" onkeypress="validateWH(event);" maxlength="4">';
							 	editiondata += '</div>';							 	
							 	editiondata += '</div>';
						
							 	editiondata += '<div class="col-sm-3 col-xs-3">';
							 	editiondata += '<div class="form-group inner-block inner_custom_text">';
							 	editiondata += '<input type="text" placeholder="Height" class="form-control chs hsize'+packcount+edition+totalCount+'" onchange="customOnChange(this.value,\'insertions_height\')" name="insertions_height" placeholder="" id="insertions" onkeypress="validateWH(event);" maxlength="4">';
							 	editiondata += '</div>';							 	
							 	editiondata += '</div>';
													 	
							 	editiondata += '</div>';
							 	editiondata += '</form>';
							 	editiondata += '</div>';							 						 								 	
							 	editiondata += '</div>';		
							 	
							 	totalCount++;	
							 	manCount++; //for restriction of checkbox
						}
					
					editiondata += '</div>';
					editiondata += '</li>'; 
					
					count++;
					
				}
						
		    }
	   }
				
				packcount++;
   }
			
				$('#itemContainer').html(editiondata);
		 	 	
			 	$('.owl-carousel,.owl-slide1').owlCarousel({
			 	    loop:false,
			 	    margin:10,
			 	    nav:true,
			 	    navText: [
			 	        "<img src='images/arrow_left.png' />",
			 	        "<img src='images/arrow_right.png' />"
			 	      ],
			 	    dots: true,
			 	    
			 	    responsive:{
			 	        0:{
			 	            items:1
			 	        },
			 	        600:{
			 	            items:1
			 	        },
			 	        1000:{
			 	            items:1
			 	        }
			 	    }
			 	});
			 	
			 	 $(".datepickerfrom").datepicker({
					   format: 'dd/mm/yyyy',          
				       startDate: '+1d',
				   }).on('changeDate', function (selected) {				      
				       var Date1 = new Date(selected.date.valueOf());				    
				       
				      // user= jQuery('input[name="datepickerto"]').val();
					   jQuery('input[name="datepickerto"]').datepicker('setStartDate', Date1);
				       					 
				     //  $('.datepickto').datepicker('setStartDate', Date1);
				       
				       
				       $('.datepicker').blur();
				       $('.datepicker').hide();
				   });
			 	 
			 	 $(".datepickto").datepicker({
			 		format: 'dd/mm/yyyy',          
				       startDate: '+1d',
				   }).on('changeDate', function (selected) {				           
					   
				           var minDate = new Date(selected.date.valueOf());
				           				         
				           jQuery('input[name="datepickerfrm"]').datepicker('setEndDate', minDate);
				         
				           $('.datepickto').blur();	
				       	  $('.datepicker').hide();
				    });
			 	 
		        	 $('.datepicker').hide();
				          

				   $('.pgpos option[value='+pageposval+']').attr('selected','selected');			 	  
				 	  if(isCustomVal == true)
				 	  {
					 		 $('.sz  option[value=Custom]').attr('selected','selected');
					 		 $('.inner_custom_text').show();
					 		 var custarr = sizeval.split("x");
					 		 $('.cws').val(custarr[0]);
					 		 $('.chs').val(custarr[1]);
					  }
				 	  else{
				 		  	 $('.sz  option[value='+sizeval+']').attr('selected','selected');
				 		  }				  
					  $('.pg  option[value='+pageval+']').attr('selected','selected');
			 				 	
 		}			
				
 	function loadeditiondataWithInnovationsPack()			 
 	{
 		//alert("here");
 		var packcount = 1;
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
												
			
		for (var pckg in packageData) {
			
			
			for(var edition in packageData[pckg]){	
				
																							
				 if(edition != "PCKGCODE" && edition != "MARKET")
					{
						var totalCount = 1;
						var editionName = packageData[pckg][edition]["EDITIONNAME"];									
						var checkBox = packageData[pckg][edition]["CHECKBOX"];
						var mandClass = packageData[pckg][edition]["CLASS"];
						var mandEdtn = packageData[pckg][edition]["MANDATORY"];
						var brand = packageData[pckg][edition]["BRAND"];
						var order = packageData[pckg][edition]["ORDER"];																	
						var col = packageData[pckg][edition]["COLOR"];		
						var sapCode = packageData[pckg][edition]["sapCode"];
						var tab = packageData[pckg][edition]["ISTABLOID"];
						var dataEdi = packageData[pckg][edition]["HEADERCLASS"];
						var manCount = 1;
						
						if(edition.indexOf("^^^")>-1){
							edition = edition.split("^^^")[0];
			 			}
						
						for(var k=0;k<userInsertionCount;k++){  //user insertion count = i
												
						//	editiondata += '<li style="display: inline;">';
							editiondata += 	'<li style="display: inline;"><span style="color:#FFFFFF;">'+count+'</span>';
							editiondata += '<div class="owl-carousel owl-theme">';	
						
							for(var i=0;i<innovationInsertionCount;i++){  //innovation insertion count = k
												 																								
									var tmpcnt = 0 ;
																	
								 	editiondata += '<div class="item">';					 						 									 	
								 	editiondata += '<div class="slider_flip">';
								 	editiondata += '<form action="#" method="">';
								 	editiondata += '<div class="row">';
								 	
								 	editiondata += '<div class="col-sm-12">';
									editiondata += '<div class="form-group focused">';
									editiondata += '<label class="control-label" style="font-size:1.1em;">Package Selected</label>';
									editiondata += '<div class="show_loc form-control"><strong>'+pckg+'</strong></div>';
									editiondata += ' </div>';
									editiondata += '</div>';
									
									editiondata += '<div class="col-sm-12 col-xs-12">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Edition</label>';
									
									if(checkBox =='Y'){
								 		var arr = dataEdi.split("-");
										dataSplit = arr[0]; // Primary Editions
										dataSplit2 = arr[1];// Mandatory Editions
																	
											if(manCount == 1){
												//editiondata += '<div class="show_loc form-control">';
													//editiondata += '<input type="checkbox" name= "'+dataSplit+'" id="'+dataSplit+order+'" value="'+order+'-'+dataSplit2+'"></input>'+editionName+'</div>';								 																			
													if(mySelectedEdition.indexOf(myEditions) !== -1){
													editiondata += '<div class="show_loc form-control">';
													editiondata += '<input type="checkbox" checked name= "'+dataSplit+'" id="'+dataSplit+order+'" value="'+order+'-'+dataSplit2+'"></input>'+editionName+'</div>';
												}else{
													editiondata += '<div class="show_loc form-control">';
													editiondata += '<input type="checkbox" name= "'+dataSplit+'" id="'+dataSplit+order+'" value="'+order+'-'+dataSplit2+'"></input>'+editionName+'</div>';
												}
											}
											else{
								 	editiondata += '<div class="show_loc form-control">'+editionName+'</div>';
											}
										}									
										else{								 	
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
								 
								 	editiondata += '<input name="datepickerfrm" custom_id="'+tmpcnt+'" id="datepickerfrm'+tmpcnt+'" readonly class="form-control cal_icon datepickerfrom form-field fromDate'+packcount+edition+totalCount+'"   required="" type="text" value="'+frmdate+'" onchange="checkall(this.value,\'datepickerfrm\')">';
								 	editiondata += '</div>';
								 	editiondata += '</div>';
								 	editiondata += '<div class="col-sm-6 col-xs-6">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">End Date</label>';
								
								 	editiondata += '<input name="datepickerto" custom_id="0" id="datepickerto" readonly class="form-control cal_icon datepickto form-field toDate'+packcount+edition+totalCount+'"   required="" type="text" value="'+todate+'" onchange="checkall(this.value,\'datepickerto\')">';
								 	editiondata += '</div>';
								 	editiondata += '</div>';
								 	editiondata += '<div class="col-sm-6 col-xs-6">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Page</label>';
								 	
								 	editiondata += '<select name="page" onchange="checkall(this.value,\'page\'),hidePagePos(this.value,\'page\');" class="form-control page'+packcount+edition+totalCount+'" required="" id="page">';								 
								 	
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
								 		editiondata += '<select name="selectPagePremium" class="form-control pagePos'+packcount+edition+totalCount+'" required ="" id="selectPagePremium">';
									}else{									
										editiondata += '<select name="selectPagePremium" class="form-control pagePos'+packcount+edition+totalCount+'" required ="" id="selectPagePremium" onchange="checkallForPagePos(this.value,\'selectPagePremium\','+tmpcnt+')">';
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
								 	editiondata += '<select id="SelectColor" name="SelectColor" class="form-control color'+packcount+edition+totalCount+'" onchange="checkallForPagePos(this.value,\'SelectColor\','+tmpcnt+')">';
								 	editiondata += '<option value="0">All Color</option>';
								 	editiondata += '<option value="1">Black & White</option>';
								 	editiondata += '</select>';
								 	editiondata += '</div>';
								 	editiondata += '</div>';
								 	editiondata += '<div class="col-sm-6 col-xs-6">';
								 	editiondata += '<div class="form-group focused"><label class="control-label" style="font-size:1.1em;">Size</label>';
								 	editiondata += '<select name="size" id="size" class="form-control size'+packcount+edition+totalCount+'" onchange="checkall(this.value,\'size\');customOnChange(this.value,\'size\');">';							 	
								 
							
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
								 	editiondata += '<div class="form-group inner-block inner_custom_text">';													 	
								 	editiondata += '<input type="text" placeholder="Width" class="form-control cws wsize'+packcount+edition+totalCount+'" onchange="customOnChange(this.value,\'insertions_width\')" name="insertions_width" placeholder="" id="insertions" onkeypress="validateWH(event);" maxlength="4">';
								 	editiondata += '</div>';							 	
								 	editiondata += '</div>';
							
								 	editiondata += '<div class="col-sm-3 col-xs-3">';
								 	editiondata += '<div class="form-group inner-block inner_custom_text">';
								 	editiondata += '<input type="text" placeholder="Height" class="form-control chs hsize'+packcount+edition+totalCount+'" onchange="customOnChange(this.value,\'insertions_height\')" name="insertions_height" placeholder="" id="insertions" onkeypress="validateWH(event);" maxlength="4">';
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
			}
			
			packcount++;
		}
		
	$('#itemContainer').html(editiondata);
	 	
	$('.owl-carousel,.owl-slide1').owlCarousel({
	    loop:false,
	    margin:10,
	    nav:true,
	    navText: [
	        "<img src='images/arrow_left.png' />",
	        "<img src='images/arrow_right.png' />"
	      ],
	    dots: true,
	    
	    responsive:{
	        0:{
	            items:1
	        },
	        600:{
	            items:1
	        },
	        1000:{
	            items:1
	        }
	    }
	});

	 $(".datepickerfrom").datepicker({
		   format: 'dd/mm/yyyy',          
	       startDate: '+1d',
	   }).on('changeDate', function (selected) {
	       //var Date1 = new Date(selected.date.valueOf()+(1000 * 60 * 60 * 24 * 1));
	       var Date1 = new Date(selected.date.valueOf());
	       $('.datepickto').datepicker('setStartDate', Date1);
	       $('.datepicker').blur();
	       $('.datepicker').hide();
	   });
	   
	   $(".datepickto").datepicker({
		   format: 'dd/mm/yyyy', 
		   startDate: '+1d',
	   }).on('changeDate', function (selected) {
	           //var minDate = new Date(selected.date.valueOf() - 1);
	           var minDate = new Date(selected.date.valueOf());
	           $('.datepickerfrom').datepicker('setEndDate', minDate);
	           $('.datepickto').blur();	
	       	  $('.datepicker').hide();
	    });
	   
	   $('.pgpos option[value='+pageposval+']').attr('selected','selected');			 	  
	 	  if(isCustomVal == true)
	 	  {
		 		 $('.sz  option[value=Custom]').attr('selected','selected');
		 		 $('.inner_custom_text').show();
		 		 var custarr = sizeval.split("x");
		 		 $('.cws').val(custarr[0]);
		 		 $('.chs').val(custarr[1]);
		  }
	 	  else{
	 		  	 $('.sz  option[value='+sizeval+']').attr('selected','selected');
	 		  }				  
		  $('.pg  option[value='+pageval+']').attr('selected','selected');


 }
 	
 	function calcYieldPackage() 
 	{ 		
 		//var innValue = $("#selectInnovation option:selected").text();
 		var date = new Date();
 	    var curr_date = date.getDate();
 	    var curr_month = date.getMonth() + 1; //Months are zero based
 	    var curr_year = date.getFullYear();
 	    if(curr_month < 10)
 	    {
 	    	var dt = curr_date + "/0" + curr_month + "/" + curr_year;
 	    }
 	    else
 		{
 			var dt = curr_date + "/" + curr_month + "/" + curr_year;
 		}

 	    		 
 		var isCust = false;

 		
 		//var innovationCount = innovationData["1"]["NoOfItems"];
 		var dayCheck = false;
 		var query = '';
 		var cont=0;
 		var qq = '';
 		var isMandChecked = '';
 		var mandHeader = '';
 		var order ='';
 		//var checkBox ='';	
 		var innValue = "";
 		var editionData = null;			
 		
 		var innovation  = innovationCode;
 		
 		var innovationCount =1;
 		
 		var queryInv = innoText;
 		
 		if (packageData != null) {
 			var adType = 1 ;		
 
 			query = 'p={ ';
 			var packIndex = 1;
 			for (var pckg in packageData) {
 				mandEdfreeText ="";
 				primEdfreeText="";
 				query += '"' + encodeURIComponent(pckg) + '"' + " : { ";
 				query += ' "PACKAGECODE" : "' + encodeURIComponent(packageData[pckg]["PCKGCODE"])+ '" , ';
 				query += ' "MARKET" : "' + encodeURIComponent(packageData[pckg]["MARKET"]) + '" , ';
 				
 			//	alert("PCKGCODE : "+packageData[pckg]["PCKGCODE"]);
 				
 				for ( var edn in packageData[pckg]) {
 					
 					var ednname = packageData[pckg][edn]["EDITIONNAME"];
 					
 					//alert("pckg "+pckg+" ednname "+ednname); 					
 					
 					if (edn != "MARKET" && edn != "PCKGCODE") {
 						var edtnCode = edn;
 						if(edn.indexOf("^^^")>-1)
 						{
 							edtnCode = edn.split("^^^")[0];
 						}
 						// added 22-12-2014
 						checkBox = packageData[pckg][edn]["CHECKBOX"];	
 						var dataPackage =packageData[pckg][edn]["HEADERCLASS"];
 						//alert("dataPackage --"+dataPackage);
 						var mandatory = packageData[pckg][edn]["MANDATORY"];
 						var tabCheck = packageData[pckg][edn]["ISTABLOID"];
 						//alert("tabCheck --"+tabCheck);
 						var doCalc = false;	
 						 						
 						
 						if(checkBox=='Y')  //if loop checked edition
 						{
 																			
 							var arr = dataPackage.split("-");
 							if(mandHeader=='' || mandHeader != arr[0]){
 								mandHeader = arr[0];
 								isMandChecked ='';
 							}
 							
 							if($("input[type='checkbox'][name='"+arr[0]+"']:checked").length == 0 
 		 							&& $("#selectEditionVertical option:selected").text() !="Government" 
 		 							&& $("#selectEditionVertical option:selected").text() !="PSU Display"){
 		 								alert('please select the checkbox to proceed & select atleast one flexible addon for '+arr[0]);
 		 								 $('#cont').hide(); 	
 		 								/* $(".edition-calculate").removeAttr("disabled"); 	
 		 				 				 $(".edition-calculate").show();*/
 		 										 				
 		 								return false;						
 		 					}
 							else 							
 							{
 								order = packageData[pckg][edn]["ORDER"];
 								doCalc = $('#'+arr[0]+order).is(':checked');	
 								//alert("doCalc"+doCalc);
 								var newEd = packageData[pckg][edn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon");
 								if(doCalc){
 									isMandChecked = isMandChecked =='' ? "No" : "Yes";
 									if(isMandChecked == "No"){
 										primEdfreeText = arr[0];
 										//commented on 10-03-2015
 										//mandEdfreeText += packageData[pckg][edn]["EDITIONNAME"]+" is included as a Flexible addon with "+primEdfreeText;
 										//commented on 10-03-2015
 										mandEdfreeText += newEd+" is included as a flexible addon with "+primEdfreeText+",";
 									}
 								}
 							}
 						}else if(checkBox=='N' && mandatory == '1'){
 							order = packageData[pckg][edn]["ORDER"];
 							isMandChecked ='No';
 						}else{
 							
 							
 							order = '';
 							isMandChecked ='';
 							checkBox ='';
 						}
 						if(doCalc && tabCheck=="1" && (queryInv=="Glued Flaps" || queryInv=="Book Mark" || queryInv=="Vertical Perforation"
 						|| queryInv=="Glued Reverse Flap"|| queryInv=="Glued Custom Size Flap"|| queryInv=="Glued Multiple Flap"
 						|| queryInv=="Masthead Flap"|| queryInv=="Pop Up"|| queryInv=="Cross Perforation"|| queryInv=="Interlocking Jacket"
 						|| queryInv=="Lenticular(large size folded ad)"|| queryInv=="Center Butterfly Flap" || queryInv=="Disruptive Ad-(edit wrap for more than one page)"
 						|| queryInv=="French Windows" || queryInv=="Seamless Jacket" || queryInv=="Skybus + FP Roadblock" || queryInv=="Co-ordinated Ear Panels"
 						|| queryInv=="Plow Fold" || queryInv=="XXL Jacket (Option-1)" || queryInv=="XXL Jacket (Option-2)"
 	                    || queryInv == "GNP Gatefold" || queryInv == "SNP Gatefold")){ // added innovation on 22072016
 							$('#fade').show();
 							$('#dialog').show();
 							$(".msg").show().text(queryInv+ ' not appicable for tabloid '+ packageData[pckg][edn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon"));
 							return;			
 						}
 						var pckgEds = packageData[pckg][edn]["EDITIONNAME"];
 						if(doCalc && queryInv=="Pointer" && (pckgEds.substring(0,3)=="TOI" || pckgEds.substring(0,12)=="The Times of"
 							|| pckgEds.substring(0,12)=="The Times Of"||pckgEds.substring(0,2)=="MT" || pckgEds.substring(0,3)=="NBT"
 							|| pckgEds.substring(0,3)=="SNT" ||pckgEds.substring(0,11)=="Maharashtra" || pckgEds.substring(0,9)=="Navbharat"
 							|| pckgEds.substring(0,7)=="Sandhya"))
 				         {
 							$('#fade').show();
 				        	$('#dialog').show();
 							$(".msg").show().text(queryInv+ ' not appicable for '+ packageData[pckg][edn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon"));
 							return;	
 						 }//added on 23-07-2015		
 						if(doCalc && queryInv=="GNP Jacket" && (pckgEds.substring(0,7)=="TOI Mum" || pckgEds.substring(0,12)=="Bombay Times"
 								|| pckgEds.substring(0,6)=="MT Mum"||pckgEds.substring(0,7)=="TOI Hyd"||pckgEds.substring(0,15)=="Hyderabad Times" 
 								|| pckgEds.substring(0,24)=="Navbharat Times - Mumbai" ||pckgEds.substring(0,9)=="Mumbai MT" 
 								||pckgEds.substring(0,7)=="NBT Mum"))
 				         {
 							$('#fade').show();
 				        	$('#dialog').show();
 							$(".msg").show().text(queryInv+ ' not appicable for '+ packageData[pckg][edn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon"));
 							return;	
 						 }
 						//added on 23-07-2015
 						if(doCalc || checkBox=='N' || mandatory != '1'){
 						// added 22-12-2014
 						var e = edtnCode.replace(new RegExp(' ', 'g'), '-');
 						e = e.replace(new RegExp('@', 'g'), '-');
 						e = e.replace(new RegExp('&', 'g'), '-');
 						e = e.replace(new RegExp('/', 'g'), '-');
 						e = e.replace(/\(/g, '-');
 						e = e.replace(/\)/g, '-');
 						e = e.replace(/\+/g, '-');
 						//if (edn != "TOI Gurgaon"
 						//		&& edn != "TOI Mumbai 20 Minutes") 
 						{
 							query += '"' + encodeURIComponent(edn) + '"' + " : { ";
 							query += ' "EDITIONNAME" : "' + encodeURIComponent(packageData[pckg][edn]["EDITIONNAME"]) + '" , ';
 							query += ' "EDITIONCOLOR" : "' + packageData[pckg][edn]["COLOR"] + '" , ';
 							query += ' "EDITIONTABLOID" : "' + packageData[pckg][edn]["ISTABLOID"] + '" , ';
 							query += ' "DOCALC" : "' + isMandChecked + '" , ';
 							query += ' "ORDER" : "' + order + '" , ';
 							query += ' "CHECKBOX" : "' + checkBox + '" , ';
 							//Tabloid value taken  dated 23-01-2013//
 							var tab = packageData[pckg][edn]["ISTABLOID"];
 							//Tabloid value taken  dated 23-01-2013//
 							
 							
 							var insertionCount = userInscount;
 							
 							for ( var i = 0; i < insertionCount; i++) 
 							{
 								// added 24-12-2014
 																						
 								var pagePos = '';
 								var page = '';
 								var colorVal = '';
 								
 								if(checkBox=='Y' && isMandChecked=="No"){
 									page = $(".page" + packIndex + primEdfreeText + (i + 1)).val();
 									$(".page" + packIndex + e + (i + 1)).val(page);
 									
 									//setPage($(".page" + packIndex + e + (i + 1)), 0, e, (i + 1), packIndex, '', checkBox);								
 									//obj, set, edn, insIndex, packIndex, mandClass, checkBox
 									pagePos = $(".pagePos" + packIndex + primEdfreeText + (i + 1)).val();
 									$(".pagePos" + packIndex + e + (i + 1)).val(pagePos);						
 									colorVal = $(".color" + packIndex + primEdfreeText + (i + 1)).val();
 									$(".color" + packIndex + e + (i + 1)).val(colorVal);
 								}// added 24-12-2014
 								page = $(".page" + packIndex + e + (i + 1)).val();
 								
 								colorVal = $(".color" + packIndex + e + (i + 1)).val();																																
 								
 								if (pagePos == 1 || pagePos == 4) {
 					               if(adType == 4)  //for ad type appointment show color values as selected
 						           {
 		                                      colorVal = $(".color" + packIndex + e + (i + 1)).val();
 						           }else{ 						            	
 		                                       colorVal = 0;
 					               }
 								} else{
 									colorVal = $(".color" + packIndex + e + (i + 1)).val();
 								}
 															
 								
 								var frd  = $(".fromDate" + packIndex + e + (i + 1)).val();
 								
 								//alert("frd "+frd+" ed "+e +" == "+packIndex + e + (i + 1));
 							
 								var tod  =$(".toDate" + packIndex + e + (i + 1)).val();
 								var publishDate = $(".pubDate0"+ e + (i + 1)).val();
 								publishDate = tod;														
 								
 								if(tod == ''){
 									tod = frd;
 								}
 								
 								var xfr = frd.split("/");
 								var frdateObj = new Date(xfr[2], xfr[1] - 1, xfr[0]);
 								
 								var xto = tod.split("/"); 
 								
 								
 								var todateObj = new Date(xto[2], xto[1] - 1, xto[0]);
 								if(todateObj < frdateObj){
 									dayCheck = true;
 								}
 								
 								//alert("b4 loop");
 								query += '"insertion' + (i + 1) + '"' + " : { ";	
 								
 								innovationCount = innoNoOfItems;
 								
 								for(var kk=0; kk < innovationCount; kk++){									
 																				
 								query+='"row '+(kk+1)+''+'"'+" :{";
 								query += '"frdate"' + ':"' + frd+ '",';
 								query += '"todate"' + ':"' + tod+ '",';
 								query += '"publishedDate"' + ':"' + publishDate+ '",';
 								query += '"isPublished"' + ':"0",';
 								query += '"page"'+ ':"'+ page + '",';
 								pagePos = $(".pagePos" + packIndex + e + (kk + 1)).val();							
 								
 								var sizeType =  $(".size" + packIndex + e + (kk + 1)).val();
 								if(sizeType == 'Custom'){
 									if(  $(".wsize" + packIndex + e + (kk + 1)).val() != '' &&
 										 $(".wsize" + packIndex + e + (kk + 1)).val() != 0 &&
 										 $(".hsize" + packIndex + e + (kk + 1)).val() != '' &&
 										 $(".hsize" + packIndex + e + (kk + 1)).val() != 0 )
 									{
 										var s = $(".wsize" + packIndex + e + (kk + 1)).val() * $(".hsize" + packIndex + e + (kk + 1)).val();
 											if(s<12){
 												alert("Min size allow is 4x3");
 												$('#cont').hide();
 												return false;
 											}else if(s>1727){											
 												alert("Max size allow is 1727");	
 												$('#cont').hide();
 												return false;
 											}
 										var sizeDim = $(".wsize" + packIndex + e + (i + 1)).val()+'x'+$(".hsize" + packIndex + e + (i + 1)).val();
 										query += '"size"' + ':"' + sizeDim+ '",';	
 									}
 									
 								}else{
 									
 									
 									var sizeSelected =$(".size" + packIndex + e + (kk + 1)).val();
 									//Added for full page///
 									if (sizeSelected=="16x25"){
 										if (tab==1){
 											sizeSelected="12.5x16";
 										}else{
 											sizeSelected="16x25";
 										}
 									}else if (sizeSelected=="32.9x25"){
 										if (tab==1){
 											sizeSelected="25.3x16";
 										}else{
 											sizeSelected="32.9x25";
 										}
 									}else if (sizeSelected=="32.9x52.5"){
 										if (tab==1){
 											sizeSelected="25.3x32.9";
 										}else{
 											
 											if ( /* edtnCode == "NGSA" || edtnCode == "ATMM" || */ edtnCode == "NGAHM"){
 												sizeSelected="32.9x52.5";
 											}else 
 												if(edtnCode == "NBSGRPR" ||edtnCode == "NBSNDPR" ||edtnCode == "NBSFRPR" ||edtnCode == "NBSGZPR"){
 												sizeSelected="29.9x52.5";
 											}
 											else{
 												sizeSelected="32.9x52.5";
 											}//added on 28-05-2015
 										}
 									}
 									
 									
 								//Added for full page///
 									query += '"size"'+ ':"'+ sizeSelected + '",';
 								}
 								colorVal = 0;
 								query += '"color"' + ':"' + colorVal + '",';
 								query += '"itemType"' + ':"standard",';
 								query += '"position"' + ':"' + pagePos + '" },';
 								
 								
 							// end of row 1																				
 							
 							} //end of insertion loop
 								
 								
 								query = query.substring(0, query.length - 1);
 								query += '},';		
 							
 							}// end of insertion for
 							query = query.substring(0, query.length - 1);
 							query += '},';
 							//alert("query after substring="+query);							
 						}
 						}// docalc
 					}
 				}
 				query = query.substring(0, query.length - 1);
 				query += '},';
 				packIndex++;
 			}
 			query = query.substring(0, query.length - 1);
 			query += '}';
 			
 			//alert("query"+query);
 			
 		}
 		
 				
 		 query += "&v=" + encodeURIComponent((verticalText))
 		 		+ "&vertCode=" + + encodeURIComponent(verticalTextCode)
 				+ "&i=" + userInscount + "&c=" + clientText
 				+ "&cp=" + clinetPremiumText + "&inv=" + innovationCode+"&INNVT=" + encodeURIComponent(innoText)
 				//added by sachin kale - 02/01/2013 for ad type selection - spot ad, ad campaign
 				+ "&selectedAdT=" + adTypeText+"&branch="+branch;
 		 
 		//alert("query = "+query);
 		  	
 		$.ajax({
 			type : 'POST',
 			url : "/pw2/NewGetYield2",
 			data : query,
 			dataType : 'json',
 			success : testResult,
 			error : OnFail
 		});
 		//$('#transaction').hide();
 		
 		
 	}	
 	
 	function testResult(result)
 	{
 		
 		var err = result.ERROR;
		var errb2b = result.ERRORB2B;
		
		if(err != null){
			window.location = "/pw2/mobile/error.jsp";
		}else if(errb2b != null){
			alert(errb2b);
		}else{
			$.each(result, function(key, val) {			
				if (key == "NEWCOST") {					
					$("#QuoteValue").val(val); // Quote Value OR Deal value
				} else if (key == "YIELD") {
					$("#FloorRate").val(val); // floor rate 
				} else if (key == "CPT") {
					if (val != -1) {
						//$("#cptrate").removeAttr("disabled");
						$("#cptRate").val(val);
					} else {
						//$("#cptrate").attr("disabled", "disabled");
						$("#cptRate").val("Not Applicable");
					}
				} else if (key == "NEWYIELD") { // Quote Rate					
					$("#QuoteRate").val(val);
					
				}else if (key == "CARDRATE"){
					$("#MaxRate").val(val); //Max Rate
				}
				else if (key == "EDITIONADROUTE"){
					editionAdroute = val;
				}					
				else if (key == "FUNCTIONNAME"){
					$("#FunctionName").val(val);
				}
				else if (key == "CPRRATE"){
					$("#cpRate").val(val);
				}
				else if (key == "QUOTE"){
					$("#regRate").val(val);
				}
				else if (key == "CPRID"){
					$("#CPRIDView").val(val);
				}else if (key == "MAXRATE"){
					
					$("#maxValue").val(val);
				}

			});
		}
		
		sendQuote();
		
	}
 	
 	function OnFail()
 	{
 		//alert("calculation fail");
 	}
 	
 	function sendQuote()
 	{ 		
 				var insertionCount = userInscount ;
 				var query = '';
 				var dataType = '';
 				var brand = '';
 				var market = '';
 				var isMandChecked = '';
 				var mandHeader = '';
 				var order ='';
 				var checkBox ='';
 				var clientPremium = $('#cPremium').val();
 				if (clientPremium == "")
 					clientPremium = "0";
 				clientPremium = "0";
 				if ($("radioDiscount").checked)
 					clientPremium += "-";
 				var innovation = innovationCode;
 				var inv = "";
 				var innovationCount = innoNoOfItems; 				
 				var queryInv = innoText; 				 			 			
 				var opportunity = ""; 				
 					//var opportunityDesc = $('#opportunityDesc').val(); // commented by TIL
 				var opportunityMandatory = $("input[name=OpportunitySelection]:checked").val();
 				if(opportunityMandatory == "Y" && (opportunity == "" || opportunity == null))
 				{
 					$('#fade').show();
 					$('#dialog').show();
 					$(".msg").show().text("Select an opportunity first");
 					calcValueReSet();
 					return;
 				}
 				
 				//only on pw2
 				
 				var adT = 1;
 				
 				//alert("adType--"+adType);
 				var adTCS = '';
 				
 				if(adT == 1)
 				{
 					adTCS = 'Ad Campaign';
 				}
 				else 
 				if(adT == 2)
 				{
 					adTCS = 'Spot Ad';
 				}
 				else
 				{
 					adTCS = 'Not Applicable';
 				}
 				var adType = 1 ;
 				 
 			if(packageData != null) {
 		 				
 				dataType = 'PACKAGE';
 				query = ' { ';
 				var packIndex = 1;
 				for ( var pckg in packageData) {
 					query += '"' + encodeURIComponent(pckg) + '"' + " : { ";
 					query += ' "MARKET" : "'+ encodeURIComponent(packageData[pckg]["MARKET"])+ '" , ';
 					for ( var edn in packageData[pckg]) 
 					{
 						if (edn != "MARKET" && edn != "PCKGCODE") {
 							var edtnCode = edn;
 							if(edn.indexOf("^^^")>-1)
 							{
 								edtnCode = edn.split("^^^")[0];
 							}
 							// added 22-12-2014
 							checkBox = packageData[pckg][edn]["CHECKBOX"];				
 							var dataPackage =packageData[pckg][edn]["HEADERCLASS"];
 							var mandatory = packageData[pckg][edn]["MANDATORY"];
 							var doCalc = false;
 							if(checkBox=='Y')  //if loop checked edition
 							{
 								var arr = dataPackage.split("-");
 								if(mandHeader=='' || mandHeader != arr[0]){
 									mandHeader = arr[0];
 									isMandChecked ='';
 								}
 								
 								
 								{
 									order = packageData[pckg][edn]["ORDER"];
 									doCalc = $('#'+arr[0]+order).is(':checked');			
 									if(doCalc){
 										isMandChecked = isMandChecked =='' ? "No" : "Yes";
 									}
 								}
 							}else if(checkBox=='N' && mandatory == '1'){
 								order = packageData[pckg][edn]["ORDER"];
 								isMandChecked ='No';
 							}else{
 								order = '';
 								isMandChecked ='';
 								checkBox ='';
 							}
 							if(doCalc || checkBox=='N' || mandatory != '1'){
 							// added 22-12-2014
 								 								 								
 							if( edn.replace(/^^^/g, "-") != null 
 									&& (edn.replace(/^^^/g, "-"))!= ""  )
 							{
 								
 								
 								var primEd = dataPackage.split("-"); //12-03-2015
 								//alert("primEd----"+primEd);
 								var e = edtnCode.replace(new RegExp(' ', 'g'), '-');
 								e = e.replace(new RegExp('@', 'g'), '-');
 								e = e.replace(new RegExp('&', 'g'), '-');
 								e = e.replace(new RegExp('/', 'g'), '-');
 								e = e.replace(/\(/g, '-');
 								e = e.replace(/\)/g, '-');
 								e = e.replace(/\+/g, '-');
 								query += '"' + encodeURIComponent(edn) + '"' + " : { ";
 								query += ' "PRIMEDITION" : "' + primEd[0]+ '" , ';  //12-03-2015
 								if(doCalc){
 									query += ' "EDITIONNAME" : "' + encodeURIComponent(packageData[pckg][edn]["EDITIONNAME"]).replace("(Mandatory", "( Flexible addon") + '" , ';
 								}else{
 									query += ' "EDITIONNAME" : "' + encodeURIComponent(packageData[pckg][edn]["EDITIONNAME"]) + '" , ';
 								}
 								//query += ' "EDITIONNAME" : "' + encodeURIComponent(packageData[pckg][edn]["EDITIONNAME"]) + '" , ';//commented on 10-03-2015
 								query += ' "EDITIONCOLOR" : "' + packageData[pckg][edn]["COLOR"] + '" , ';
 								query += ' "EDITIONTABLOID" : "' + packageData[pckg][edn]["ISTABLOID"] + '" , ';
 								query += ' "DOCALC" : "' + isMandChecked + '" , ';
 								query += ' "ORDER" : "' + order + '" , ';
 								query += ' "CHECKBOX" : "' + checkBox + '" , ';
 								 								 								
 								var pckgTablo=packageData[pckg][edn]["ISTABLOID"]; 												
 								
 								if(pckg == "none")
 								{
 									var adroute = editionAdroute[edtnCode];
 									
 									
 									if(adroute == null || adroute == "")
 									{
 										adroute = "ADDON";	
 									}
 									query += ' "EDITIONADROUTE" : "' + adroute + '" , ';
 								}
 								else
 								{
 									query += ' "EDITIONADROUTE" : "" , ';
 								}
 								for ( var i = 0; i < insertionCount; i++) 
 								{
 									
 										var colorVal = $(".color" + packIndex + e + (i + 1)).val();
 										if (pagePos == 1 || pagePos == 4) 
 										{
 										   if(adType == 4)  //for ad type appointment show color values as selected
 										   {
 												colorVal = $(".color" + packIndex + e + (i + 1)).val();
 										   }
 											else
 										   {
 												colorVal = 0;
 										   }
 										}
 										else 
 										{
 											colorVal = $(".color" + packIndex + e + (i + 1)).val();
 										}
 										colorVal = 0;
 										var frd  = $(".fromDate" + packIndex + e + (i + 1)).val();
 										var tod  = $(".toDate" + packIndex + e + (i + 1)).val();
 										var publishDate = $(".pubDate0"+ e + (i + 1) ).val();
 										publishDate  = tod;
 										if(tod == '')
 										{
 											tod = frd;
 										}
 										
 										query += '"insertion' + (i + 1) + '"' + " : { ";
 										query += '"frdate"' + ':"' + frd+ '",';
 										query += '"todate"' + ':"' + tod+ '",';
 										query+='"publishedDate"' + ':"'+publishDate+'",';
 										query+='"isPublished"' + ':"0",';
 										query += '"color"' + ':"' + colorVal + '",';
 										query += '"itemType"' + ':"standard",';
 										for(var kk=0; kk < innovationCount;kk++ ){
 											
 											var tempcnt = "";
 											
 											if((kk+1) ==1){
 												tempcnt = "";
 											}else{											
 												tempcnt = kk+1;
 												}
 											var page = $(".page"+ packIndex + e + (kk+1)).val();										
 											var sizeType =  $(".size"+ packIndex + e + (kk+1)).val();
 											var pagePos = $(".pagePos"+packIndex +e + (kk+1)).val();
 											
 											if(sizeType == 'Custom'){
 												
 												
 												var s = $(".wsize" + packIndex + e + (kk + 1)).val() * $(".hsize" + packIndex + e + (kk + 1)).val();
 								
 												if(s<12)
 												{
 													alert("Min size allow is 4x3");
 													return false;
 												}
 												else if(s>1727)
 												{											
 													alert("Max size allow is 1727");	
 													return false;
 												}
 												
 												 sizeType = $(".wsize" + packIndex + e + (kk + 1)).val() +"x"+ $(".hsize" + packIndex + e + (kk + 1)).val();
 											}else{
												var sizeDim ="";
												
												if (sizeType == "16x25"){   // added for 240,qp,hp,fp
													if (pckgTablo == 1){
														sizeDim="12.5x16";
													}else{
														sizeDim="16x25";
													}
													sizeType = sizeDim;
												}else if (sizeType == "32.9x25"){
													if (pckgTablo == 1){
														sizeDim="25.3x16";
													}else{
														sizeDim="32.9x25";
													}
													sizeType = sizeDim;
												}else if (sizeType=="32.9x52.5"){
													if (pckgTablo==1){
														sizeDim="25.3x32.9";
													}else{														
														sizeDim="32.9x52.5";
													}
													sizeType = sizeDim;
												}			
												
											}
 																			
 											query += '"page'+(tempcnt) + '":"' + page+ '",';
 											if(innovationCount == 1)
 											query += '"size'+ '":"' + sizeType + '",';	
 											else
 											query += '"size'+(kk+1) + '":"' + sizeType + '",';
 											query += '"position'+(tempcnt) + '":"' + pagePos+ '",';
 										}		
 										
 										query += '},';
 								}
 							
 							//	query = query.substring(0, query.length - 1);
 								
 								//query += '},';
 							}
 					
 							query = query.substring(0, query.length - 1);
 							query += '},';
 							
 							
 						}
 							
 							
 							
 					}// docalc if ends here
 					}
 					query = query.substring(0, query.length - 1);
 					query += '},';
 					packIndex++;
 			
 				}
 				query = query.substring(0, query.length - 1);
 				query += '}';
 			
 			}
 			
 			
 		
 			if(verticalText == "Select Vertical")
 				{
 					verticalText = 0;
 				}
 				if(adType == 4)
 				{
 					verticalTextCode = 121;
 				}
 				if(adType == 3)
 				{
 					verticalTextCode = 103;
 				}
 				if(adType == 2)
 				{
 					verticalTextCode = 120;
 				}
 				if(adType == 5)
 				{
 					verticalTextCode = 104;
 				}
 				if(adType == 11)
 				{
 					verticalTextCode = 123;
 				}
 			
 				var searchclient = clientText;
 				opportunityMandatory = 'N';
 				
 				var data = '{"VERTICAL" : "'
 					+ encodeURIComponent(verticalText)
 					+ '", "VERTICALCODE" : "'
 					+ encodeURIComponent(verticalTextCode)
 					//+ encodeURIComponent($('#selectPckgVertical').val())
 					+ '", "HORIZONTAL" : "'
 					+ encodeURIComponent(horizontalText)
 					+ '", "CLIENTPREMIUM" : "' + clinetPremiumText
 					+'", "INNV" : "' + encodeURIComponent(innoText)
 					+'", "ADTCS" : "' +adTCS
 					+ '", "BRANCH" : "' + branch
 					+'", "DIVISION" : "' +"04"
 					//only on pw2
 					+ '", "OPPORTUNITY" : "' + encodeURIComponent(opportunity)
 						//+ '", "OPPORTUNITYDESC" : "' + opportunityDesc	// commented by TIL
 					+ '", "OPPORTUNITYMANDATORY" : "' + opportunityMandatory
 					//only on pw2
 					+ '", "INNOVATION" : "' + innovation + '", "INSERTION" : "'
 					+ insertionCount + '", "CLIENT" : "'
 					+ encodeURIComponent(searchclient)
 					+ '","ENTITY" : "'+encodeURIComponent(entity)
 					+ '", "ENTITYCODE" : "'+encodeURIComponent(entityCode)
 					+ '", "RATE" : "' + $('#FloorRate').val() + '", "DEAL" : "'
 					+ $('#QuoteValue').val() + '", "CPT" : "' + $('#cptRate').val()
 					+ '", "QUOTE" : "' + $('#QuoteRate').val()
 					+ '", "CARDRATEVALUE" : "' + $('#MaxRate').val()
 					+ '", "DATATYPE" : "' + dataType + '", "DATA" : ' + query
 					+ ' }' ;
 			
 					//alert("query : "+data);
 					
 					$('#data').val(data);
 		
 		document.getElementById("form1").submit();
 			
 	}
 	
 