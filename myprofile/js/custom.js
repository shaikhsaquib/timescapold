$(document).ready(function(){
	//Form Group
	$('.form-control').on('focus blur', function (e) {
	    $(this).parents('.form-group').toggleClass('focused', (e.type === 'focus' || this.value.length > 0));
	}).trigger('blur');	
	//Count height of screen
	$("#proceed").click(function(){
		var status = validateBeforeLoad();
		if (status){
			jQuery('#load_div').addClass('saving');
			$('#stage1Form').attr('action', "/pw2/MoSaver?page=stage1-selectData"); 
		 	$("#stage1Form").submit();
		} 
	});
	
});

function validateBeforeLoad(){	
	//alert("userType"+userType);
	var branch = $.trim($("#userBranch").val());
	var client = $.trim($("#client").val());
	var entity = $.trim($("#entity").val());
	var vertical = $.trim($("#vertical").val());
	if(branch == "0" || branch == null || branch == ""){
		//alert("Please Select Vertical!");
		$("#errorBranch").show();
		$("#errorBranch").html("Please select Branch");
		$("#userBranch").focus();
		return false;
	}
	if(vertical == "0" || vertical == null || vertical == ""){
		//alert("Please Select Vertical!");
		$("#errorVertical").show();
		$("#errorVertical").html("Please select Vertical");
		$("#vertical").focus();
		return false;
	} else if(entity == "0" || entity == null || entity == ""){
		//alert("Please Enter Entity!");
		$("#errorEntity").show();
		$("#errorEntity").html("Please Select Entity");
		$("#entity").focus();
		return false;
	}else if(client == "0" || client == "" || client == null || client == "Client Not Found"){
		//alert("Please Select Client!");
		$("#errorClient").show();
		$("#errorClient").html("Please select Client");
		$("#client").focus();
		return false;
	}else{
		
		return true;
	}		
}


	$(function() {
	var availableTags1 = "";
	$.getJSON("/pw2/GetComponents?page=branchs&jsoncallback=?",
			function(result) {
				if (result != null) {
					for ( var index in result) {					
						availableTags1 += "{key:\""+ index+"\""+",value:\""+result[index]+"\"}"+",";						
					}								
				}
				//alert(availableTags1);
				availableTags1 = availableTags1.substr(0,availableTags1.length-1);
				var json = (new Function("return [" + availableTags1+ "];")());
				
				$( "#userBranch" ).autocomplete({
					minLength: 0,
					source: json,
					virtualization: true,
					focus: function( event, ui ) {
						$( "#userBranch" ).val( ui.item.value );
						//$( "#vertical_id" ).val( ui.item.key );
						return false;
					},
					select: function( event, ui ) {
						$( "#userBranch" ).val( ui.item.value );
						//$( "#vertical_id" ).val( ui.item.key );
						return false;
					} 
				});
			});
	});

var vertVal = "";
$(function() {
	var availableTags1 = "";
	var json = "";
	$.getJSON("/pw2/GetComponents?page=vrt&jsoncallback=?",
	function(result){
		var err = result.ERROR;
		if (err != null) {
			window.location = "login.jsp";
		}else if (result != null) {				
			for (var index in result) {
				//availableTags1 += "\""+ parseInt(index)+":"+result[index]+"\",";
				availableTags1 += "{key:\""+ parseInt(index)+"\""+",value:\""+result[index]+"\"}"+",";
			}
		}
		availableTags1 = availableTags1.substr(0,availableTags1.length-1);
		var json = (new Function("return [" + availableTags1+ "];")());
		//alert(json);
	
		$( "#vertical" ).autocomplete({
			minLength: 0,
			source: json,
			virtualization: true,
			focus: function( event, ui ) {
				$( "#vertical" ).val( ui.item.value );
				$( "#vertical_id" ).val( ui.item.key );
				return false;
			},
			select: function( event, ui ) {
				$( "#vertical" ).val( ui.item.value );
				$( "#vertical_id" ).val( ui.item.key );
				return false;
			} 
		});
	});
});

function entitySearch(){
	var vrtOfEntity = $("#vertical").val();
	var availableTags5 = "";
	var json = "";
	$("#errorEntity").hide();
	$( "#entity" ).autocomplete({
				minLength: 3,			
				source: function( request, response ) {
					$.ajax( {
					//	url: "/pw2/GetComponents?page=vrtOfEntity&vertical="+encodeURIComponent(vrtOfEntity)+"&jsoncallback=?",
						url: "/pw2/GetComponents?page=vrtOfEntity&jsoncallback=?",
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
					return false;
				}		
	});
}//end of function entitySearch


function clSearch(){
	var entityOfClient = $("#entity").val();
		
	var entityName = entityOfClient.split('-');
	if(entityName.length >1){
		entityOfClient = $.trim(entityName[1]);
	}
	
	var availableTags1 = "";
	var json = "";
	$( "#client").autocomplete({
				minLength: 3,			
				source: function( request, response ) {
					$.ajax( {
						
						//url: "/pw2/GetComponents?page=entityOfClient&jsoncallback=?",
						url: "/pw2/GetComponents?page=entityOfClient&enName="+encodeURIComponent(entityOfClient)+"&jsoncallback=?",
						dataType: "jsonp",
						virtualization: true,
						data:
						{
							term : request.term
						},
						success: function( data ) {
							var err = data.ERROR;
							var errorMessage = data.ERRORMESSAGE;
							if(errorMessage != null){
								availableTags1 += "{key:\""+ 0+"\""+",value:\""+errorMessage+"\"}"+",";
							}else if (err != null) {
								window.location = "login.jsp";
								//alert(err);								
							}else if (data != null) {				
								for (var index in data){
										availableTags1 += "{key:\""+ parseInt(index)+"\""+",value:\""+parseInt(index)+" - "+data[index]+"\"}"+",";
								}
							}
							availableTags1 = availableTags1.substr(0,availableTags1.length-1);
							
							json = new Function("return [" + availableTags1+ "];")();
							response( json );
						},
						error: OnFail
					});
				},
				focus: function( event, ui ) {
					$( "#client" ).val( ui.item.value );
					$( "#client_id" ).val( ui.item.key );
					return false;
				},
			    select: function (event, ui){
			    	//alert("key "+ui.item.key +" - Val -"+ui.item.value);
					$( "#client" ).val( ui.item.value );
					$( "#client_id" ).val( ui.item.key );
					return false;
				}		
	});
}//end of function clSearch

function OnFail() {
	window.location = "login.jsp";
}

$("#vertical").blur(function(){
	
	if($("#vertical_id").val()=="")
	{ 
		$("#vertical").val('');
	}
	if($("#vertical_id").val()!= vertVal){
	
		$("#entity").val('');
		$("#entity_id").val('');
		$("#client").val('');
		$("#client_id").val('');
	}
	$("#errorVertical").hide();
});	
	 
$("#entity").blur(function(){ 
	/*if($("#entity_id").val()=="")
	{ 
		$("#entity").val('');
	}
	$("#errorEntity").hide();
	*/
});	

$("#client").blur(function(){
	/*if($("#client_id").val()=="")
	{ 
		$("#client").val('');
	}
	$("#errorClient").hide();
	*/
});
	



//$("#userBranch").blur(function(){
function brachBlur(){
//	alert("="+$("#userBranch").val()+"=");
	if($("#userBranch").val()=="")	{ 
		$("#errorBranch").show();
	}else{
		$("#errorBranch").hide();
	}
}	
//});
	
	
$("#userBranch").focus(function(){
//	alert("=="+$("#userBranch").val()+"==");
	if($("#userBranch").val()==''){
		$("#userBranch").val('');
	}
});		
	


$("#entity").focus(function(){
	if($("#entity_id").val()==''){
		$("#entity_id").val('');
	}
});				 

$("#vertical").focus(function(){
	vertVal = $( "#vertical_id" ).val();
	if($("#vertical_id").val()==''){
		$("#vertical_id").val('');
	}
});	

$("#client").focus(function(){
	if($("#client_id").val()==''){
		$("#client_id").val('');
	}
});	



