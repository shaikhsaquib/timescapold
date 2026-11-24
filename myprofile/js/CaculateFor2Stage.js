 function calcYield() 
 { 	 	
	
	var pageSelected = $("#pageId").val(); 
	var pagePosSelected =  $("#pagePosition").val();
	var sizeSelected = $("#size").val();
	
	var invText = $("#innovation option:selected").text();	
	var innValue = $('#innovation').val();
	
	if(innValue == 0){
		invText = "";
		innValue = "";
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
 	 	 
 	var innovationCount = 1;
 	
 	if(innValue != 0){
 		innovationCount = innoNoOfItems;
	}
 	
 	var queryInv = ""; 	  	
 	//var branch = "Mumbai"; 	 
 	var adType = 1;
 	insertionCount= $("#insertion").val(); 	
 	if (insertionCount == 0){
 		alert(errorLoadInsertionMessage);
 		return;
 	}else{ 		
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
 					
 								order = editionData[edtn]["ORDER"];
					var checkadon = arr[0]+order;
					//alert("checkadon "+checkadon+" mySelectedEdition "+mySelectedEdition);
					//doCalc = $('#'+arr[0]+order).is(':checked');
 								var newEd = editionData[edtn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon");
					//if(doCalc){
					if(mySelectedEdition.indexOf(checkadon) != -1){
						doCalc = true;
						//alert("checkadon "+checkadon+" mySelectedEdition "+mySelectedEdition);
 									isMandChecked = isMandChecked =='' ? "No" : "Yes";
 									if(isMandChecked == "No"){
 										primEdfreeText = arr[0];
 										mandEdfreeText += newEd+" is included as a flexible addon with "+primEdfreeText+",  ";
 									}
 								}
					else{
						doCalc = false;
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
 					return;			
 			}
 			if(doCalc && queryInv=="Pointer" && (brand != "The Times of India" && brand != "The Times Of India" 
 				&& brand != "Maharashtra Times" && brand !="Navbharat Times" && brand != "Sandhya Times")){
 					
 					alert(queryInv+ ' not appicable for '+ editionData[edtn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon") );
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
 							var sizeType = '';
 							
 							if(checkBox=='Y' && isMandChecked=="No"){
 								/*page = $(".page0" + primEdfreeText + (i + 1)).val();
 								$(".page0" + e + (i + 1)).val(page);
 								pagePos = $(".pagePos0" + primEdfreeText + (i + 1)).val();
 								$(".pagePos0" + e + (i + 1)).val(pagePos);						
 								
 								if(pagePos==4 && adType==1){
 									$(".pagePos0 option.NBT").attr('selected', true);
 									$(".pagePos0 option.NBT").attr('selected', true);
 								}
 								colorVal = $(".color0" + primEdfreeText + (i + 1)).val();
 								$(".color0" + e + (i + 1)).val(colorVal);*/
 							}
 							 							
 							var frd  = $("#fromdate").val();
 							var tod  = $("#todate").val();
 					
 							//var publishDate = $(".pubDate0"+ e + (i+1)).val();
 							var publishDate = $("#todate").val();
 							
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
 								
 								page = pageSelected;
 								pagePos = pagePosSelected;
								sizeType =  sizeSelected; 
 								
 								if(innValue != 0){
 							 		
 									page = pageArr[arrPage[kk]];
 	 								pagePos = pagePosArray[arrPagePosition[kk]];
 									sizeType = arrSize[kk]; 
 									
 									if(tabCheck == 1 && arrTabSize[1] != "NA")
									{
										sizeType = arrTabSize[kk];										
									}
 									
 								}
 							
 									query+='"row '+(kk+1)+'"'+" :{";
 									query += '"frdate"' + ':"' + frd+ '",';					
 									query += '"todate"' + ':"' + tod+ '",';
 									query += '"publishedDate"' + ':"' + publishDate+ '",';
 									query += '"isPublished"' + ':"0",';					
 									query += '"page"' + ':"' +page+ '",';
 									
 									
 									colorVal = "0";
 									
 									if(sizeType == 'Custom'){
 										
 										if( $("#customWidth").val() != '' && $(".customWidth").val() != 0 &&
 												 $("#customHeight").val() != '' && $("#customHeight").val() != 0){
 												
 											var s = $("#customWidth").val() *  $("#customHeight").val() ;
 											var sizeDim =  $("#customWidth").val()+'x'+$("#customHeight").val() ;
 											if(s < 12){										
 											alert('Please enter size.Minimum allowed size is 4x3');
 												return false;
 											}
 											query += '"size"' + ':"' + sizeDim+ '",';
 										}
 									 }else{
 										 
 										 if(tab == "1" && sizeType == "32.9x52.5"){											
 											 sizeType = "25.3x32.9";											
 										 }else if(tab == "1" && sizeType == "32.9x25"){   // added for 240,QP,HP,FP 06122017											
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
 							return;
 						} 						
 						 						
 										
 						query += "&v=" + encodeURIComponent(vertical)
 								+ "&vertCode=" + + verticalcode
 								+ "&i=" + insertionCount + "&c=" + encodeURIComponent(searchClient)
 								+ "&cp=" + clientPremium + "&inv=" + innValue+"&INNVT=" + encodeURIComponent(invText)
 								+ "&selectedAdT=" + selectedAdT +"&branch="+branch;

 						//alert("query*** edition "+query);
 					
 						
 						$.ajax({
 							type : 'POST',
 							url : "/pw2/NewGetYield2",
 							data : query,
 							dataType : 'json',
 							success : OnValueCal,
 							error : OnFail
 						});
 						$('#transaction').hide();

 	}
 
	 function OnFail()
	 {
		 //alert("Error in calculation");
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
				} else if (key == "NEWQUOTE") { // Quote Rate					
					$("#QuoteRate").val(val);
					
				}else if (key == "CARDRATE"){
					$("#MaxRate").val(val); //Max Rate
				}
				else if (key == "EDITIONADROUTE"){
					editionAdroute = val;
				}		
				else if (key == "CPRRATE"){
					$("#cpRate").val(val);
				}
				else if (key == "QUOTE"){
					$("#regRate").val(val);
				}
				else if (key == "CPRID"){
					$("#CPRIDView").val(val);
				}
				else if (key == "FUNCTIONNAME"){
					
					$("#FunctionName").val(val);
					
				}else if (key == "MAXRATE"){
					
					$("#maxValue").val(val);
				
				}
												
				});
				
		}					
		saveTransaction();
	}
	
function saveTransaction(){
	
		var pageSelected = $("#pageId").val(); 
		var pagePosSelected =  $("#pagePosition").val();
		var sizeSelected = $("#size").val();
		
		var invText = $("#innovation option:selected").text();	
		var innValue = $('#innovation').val();
		
		if(innValue == 0){
			invText = "";
			innValue = "";
		}
		
		var query = '';
		var dataType = '';
		var brand = '';
		var market = '';
		var isMandChecked = '';
		var mandHeader = '';
		var order ='';
		var checkBox ='';
		var clientPremium = 0;
		var innovationCount = 1;
		
		if(innValue != 0){
	 		innovationCount = innoNoOfItems;
		}
		
		var innovation = null;
		var insertionCount = userInscount;				
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
							
				if(checkBox == 'Y')
					{
			
						var arr = dataEdi.split("-");
						if(mandHeader=='' || mandHeader != arr[0]){
							mandHeader = arr[0];
							isMandChecked ='';
						}						
						
							order = editionData[edtn]["ORDER"];
								var checkadon = arr[0]+order;
								//alert("checkadon "+checkadon+" mySelectedEdition "+mySelectedEdition);
								//doCalc = $('#'+arr[0]+order).is(':checked');
								var newEd = editionData[edtn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon");
								//if(doCalc){
								if(mySelectedEdition.indexOf(checkadon) != -1){
									doCalc = true;
									//alert("checkadon "+checkadon+" mySelectedEdition "+mySelectedEdition);
								isMandChecked = isMandChecked =='' ? "No" : "Yes";
									if(isMandChecked == "No"){
										primEdfreeText = arr[0];
										mandEdfreeText += newEd+" is included as a flexible addon with "+primEdfreeText+",  ";
							}
						}
								else{
									doCalc = false;
								}
				}
				else if(checkBox=='N' && mandatory == '1'){
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
																
								var pagePos = pagePosSelected;
								var colorVal = "0";
								var frd  = $("#fromdate").val();
								var tod  = $("#todate").val();
								var publishDate = $("#todate").val();
								
								
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
									var page = pageSelected;
									var sizeType =  $("#size").val();
									var pagePos = pagePosSelected;
									
									if(innValue != 0){
	 							 		
	 									page = pageArr[arrPage[kk]];
	 	 								pagePos = pagePosArray[arrPagePosition[kk]];
	 									sizeType = arrSize[kk]; 
	 									
	 									if(tablo == 1 && arrTabSize[1] != "NA")
										{
											sizeType = arrTabSize[kk];										
										}
	 									
	 								}
									
									query += '"page'+(tempcnt) + '":"' + page+ '",';
									query += '"position'+(tempcnt) + '":"' + pagePos+ '",';
																
									if(sizeType == 'Custom'){
 										
 										if( $("#customWidth").val() != '' && $(".customWidth").val() != 0 &&
 												 $("#customHeight").val() != '' && $("#customHeight").val() != 0){
 												
 											var s = $("#customWidth").val() *  $("#customHeight").val() ;
 											var sizeDim =  $("#customWidth").val()+'x'+$("#customHeight").val() ;
 											if(s < 12){										
 											alert('Please enter size.Minimum allowed size is 4x3');
 												return false;
 											}
 											query += '"size"' + ':"' + sizeDim+ '",';
 										}
									}
 									 else{
										 
										 if(tablo == "1" && sizeType == "32.9x52.5"){											
 											 sizeType = "25.3x32.9";											
 										 }else if(tablo == "1" && sizeType == "32.9x25"){   // added for 240,QP,HP,FP 06122017											
 											 sizeType = "25.3x16";											
 										 }else if(tablo == "1" && sizeType == "16x25"){											
 											 sizeType = "12.5x16";											
 										 }
										 
										 	if(innovationCount == 1)
												query += '"size'+ '":"' + sizeType + '",';
											else
												query += '"size'+(kk+1) + '":"' + sizeType + '",';										 
									 }
								}//end for loop innovationCount
								
								query += '"color"' + ':"' + colorVal + '",';
								query += '"itemType"' + ':"standard" },';								
							}//end for loop userCount
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
				+'", "INNV" : "' + encodeURIComponent(invText) +'", "ADTCS" : "' +adTCS	+ '", "BRANCH" : "' + branch
				+'", "DIVISION" : "' +"04"	+ '", "OPPORTUNITY" : "' + encodeURIComponent(opportunity)
				+ '", "OPPORTUNITYMANDATORY" : "' + opportunityMandatory + '", "INNOVATION" : "' + innValue + '", "INSERTION" : "'
				+ userInscount + '", "CLIENT" : "' + encodeURIComponent(searchClient)+'","ENTITY" : "'+encodeURIComponent(entity)
				+ '", "ENTITYCODE" : "'+encodeURIComponent(entityCode)
				+ '", "RATE" : "' + $('#FloorRate').val() + '", "DEAL" : "' + $('#QuoteValue').val() + '", "CPT" : "' + $('#cptRate').val()
				+ '", "QUOTE" : "' + $('#QuoteRate').val() + '", "CARDRATEVALUE" : "' + $('#MaxRate').val()
				+ '", "DATATYPE" : "' + dataType + '", "DATA" : ' + query + '}';
		
		//alert("data : "+ data);		
		
		$('#data').val(data);
		
		
		 $('#stage2Form').attr('action', "stage4-sendQuote.jsp"); 
		 $("#stage2Form").submit();
	}



function calcYieldPackage() 
	{		
		var pageSelected = $("#pageId").val(); 
		var pagePosSelected =  $("#pagePosition").val();
		var sizeSelected1 = $("#size").val();	
		var invText = $("#innovation option:selected").text();	
		var innValue = $('#innovation').val();
		
		var innovationCount =1;
		
		if(innValue != 0){
	 		innovationCount = innoNoOfItems;
		}
		
		
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
		
		if(innValue == 0){
			invText = "";
			innValue = "";
		}
				
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
				
				//alert("MARKET : "+packageData[pckg]["MARKET"]);
				
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
								order = packageData[pckg][edn]["ORDER"];
								doCalc = $('#'+arr[0]+order).is(':checked');	
								var checkadon = arr[0]+order;
								var newEd = packageData[pckg][edn]["EDITIONNAME"].replace("(Mandatory", "(Flexible addon");
								if(mySelectedEdition.indexOf(checkadon) != -1)
								{
									doCalc = true;
									isMandChecked = isMandChecked =='' ? "No" : "Yes";
									if(isMandChecked == "No"){
										primEdfreeText = arr[0];
										mandEdfreeText += newEd+" is included as a flexible addon with "+primEdfreeText+",";
									}
								}else
								{
									doCalc = false;
								}
							}
						else if(checkBox=='N' && mandatory == '1'){
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
								var sizeType =  sizeSelected1;
								page = pageSelected;
								pagePos = pagePosSelected;
								colorVal = "0";	
								sizeSelected = sizeSelected1;
								
								if(checkBox=='Y' && isMandChecked=="No"){
						
								}// added 24-12-2014																																				
																							
								var frd  = $("#fromdate").val();							
								var tod  = $("#todate").val();
								var publishDate = $("#todate").val();																
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
																								
								for(var kk=0; kk < innovationCount; kk++){	
								
									if(innValue != 0){

										page = pageArr[arrPage[kk]];
										pagePos = pagePosArray[arrPagePosition[kk]];
										sizeType = arrSize[kk]; 
										sizeSelected = arrSize[kk];										
										
										if(tabCheck == 1 && arrTabSize[1] != "NA")
										{
											sizeType = arrTabSize[kk];
											sizeSelected = arrTabSize[kk];
										}
										
									}	
																				
								query+='"row '+(kk+1)+''+'"'+" :{";
								query += '"frdate"' + ':"' + frd+ '",';
								query += '"todate"' + ':"' + tod+ '",';
								query += '"publishedDate"' + ':"' + publishDate+ '",';
								query += '"isPublished"' + ':"0",';
								query += '"page"'+ ':"'+ page + '",';
															
								
								
								if(sizeType == 'Custom'){

									if( $("#customWidth").val() != '' && $(".customWidth").val() != 0 &&
											 $("#customHeight").val() != '' && $("#customHeight").val() != 0){
											
										var s = $("#customWidth").val() *  $("#customHeight").val() ;
										var sizeDim =  $("#customWidth").val()+'x'+$("#customHeight").val() ;
										if(s < 12){										
										alert('Please enter size.Minimum allowed size is 4x3');
											return false;
										}
										query += '"size"' + ':"' + sizeDim+ '",';
									}
								}else{									
									//var sizeSelected = $("#size").val();								
									//Added for full page///
									//alert(sizeType+":::"+sizeSelected+":::"+tab);
																	
									if (sizeSelected=="16x25"){   // added for 240,qp,hp,fp
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
					
		}
						
		 query += "&v=" + encodeURIComponent((verticalText))
		 		+ "&vertCode=" + + encodeURIComponent(verticalTextCode)
				+ "&i=" + userInscount + "&c=" + clientText
				+ "&cp=" + clinetPremiumText + "&inv=" + innValue+"&INNVT=" + encodeURIComponent(invText)
				//added by sachin kale - 02/01/2013 for ad type selection - spot ad, ad campaign
				+ "&selectedAdT=" + adTypeText+"&branch="+branch;
		
		// alert("query package "+query);
		
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
		window.location = "";
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
			} else if (key == "NEWQUOTE") { // Quote Rate					
				$("#QuoteRate").val(val);
				
			}else if (key == "CARDRATE"){
				$("#MaxRate").val(val); //Max Rate
			}
			else if (key == "EDITIONADROUTE"){
				editionAdroute = val;
			}		
			else if (key == "CPRRATE"){
				$("#cpRate").val(val);
			}
			else if (key == "QUOTE"){
				$("#regRate").val(val);
			}
			else if (key == "CPRID"){
				$("#CPRIDView").val(val);
			}
			else if (key == "FUNCTIONNAME"){
				
				$("#FunctionName").val(val);
				
			}else if (key == "MAXRATE"){
				
				$("#maxValue").val(val);
			
			}

		});
	}
	
	sendQuote();	
}

function sendQuote()
	{ 				 		
	
				var pageSelected = $("#pageId").val(); 
				var pagePosSelected =  $("#pagePosition").val();
				var sizeSelected = $("#size").val();
				
				var invText = $("#innovation option:selected").text();	
				var innValue = $('#innovation').val();
				
				if(innValue == 0){
					invText = "";
					innValue = "";
				}
	
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
				var innovation = innValue;
				var inv = "";
				
				var innovationCount = 1;		
				
				if(innValue != 0){
			 		innovationCount = innoNoOfItems;
				}
																
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
					
					query += ' "PACKAGECODE" : "' + encodeURIComponent(packageData[pckg]["PCKGCODE"])+ '" , ';
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
								
								var page = pageSelected;								
								var sizeType =  sizeSelected;
								var pagePos = pagePosSelected;
								
								for ( var i = 0; i < insertionCount; i++) 
								{
									
										var colorVal = "0";
										if (pagePos == 1 || pagePos == 4) 
										{
										   if(adType == 4)  //for ad type appointment show color values as selected
										   {
											   colorVal = 0;
										   }
											else
										   {
												colorVal = 0;
										   }
										}
										else 
										{
											colorVal = colorVal = 0;
										}
										colorVal = 0;
										var frd  = $("#fromdate").val();
										var tod  = $("#todate").val();
										var publishDate = $("#todate").val();
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
											
											if(innValue != 0){
												
												page = pageArr[arrPage[kk]];
												pagePos = pagePosArray[arrPagePosition[kk]];
												sizeType = arrSize[kk]; 
												
												if(pckgTablo == 1 && arrTabSize[1] != "NA")
												{
													sizeType = arrTabSize[kk];										
												}

											}
											
											var tempcnt = "";
											
											if((kk+1) ==1){
												tempcnt = "";
											}else{											
												tempcnt = kk+1;
												}
											
											
											if(sizeType == 'Custom'){

												if( $("#customWidth").val() != '' && $(".customWidth").val() != 0 &&
														 $("#customHeight").val() != '' && $("#customHeight").val() != 0){
														
													var s = $("#customWidth").val() *  $("#customHeight").val() ;
													var sizeDim =  $("#customWidth").val()+'x'+$("#customHeight").val() ;
													if(s < 12){										
													alert('Please enter size.Minimum allowed size is 4x3');
														return false;
													}
													query += '"size"' + ':"' + sizeDim+ '",';
												}
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
												query += '"size"' + ':"' + sizeType+ '",';
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
					+'", "INNV" : "' + encodeURIComponent(invText)
					+'", "ADTCS" : "' +adTCS
					+ '", "BRANCH" : "' + branch+'","ENTITY" : "'+encodeURIComponent(entity)
					+ '", "ENTITYCODE" : "'+encodeURIComponent(entityCode)
					+'", "DIVISION" : "' +"04"
					//only on pw2
					+ '", "OPPORTUNITY" : "' + encodeURIComponent(opportunity)
						//+ '", "OPPORTUNITYDESC" : "' + opportunityDesc	// commented by TIL
					+ '", "OPPORTUNITYMANDATORY" : "' + opportunityMandatory
					//only on pw2
					+ '", "INNOVATION" : "' + innValue + '", "INSERTION" : "'
					+ insertionCount + '", "CLIENT" : "'
					+ encodeURIComponent(searchclient)
					+ '", "RATE" : "' + $('#FloorRate').val() + '", "DEAL" : "'
					+ $('#QuoteValue').val() + '", "CPT" : "' + $('#cptRate').val()
					+ '", "QUOTE" : "' + $('#QuoteRate').val()
					+ '", "CARDRATEVALUE" : "' + $('#MaxRate').val()
					+ '", "DATATYPE" : "' + dataType + '", "DATA" : ' + query
					+ ' }' ;
			
					//alert("query :package "+data);
					
					$('#data').val(data);
					
	 $('#stage2Form').attr('action', "stage4-sendQuote.jsp"); 
	 $("#stage2Form").submit();
			
	}


	