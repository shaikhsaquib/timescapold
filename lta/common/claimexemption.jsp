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
<%@ page import="com.bccl.util.JcoGetDataFromSAP"%>
<%
	/*if (companyCode.equals("1000") && (!(deptGroup.equals("1296") || deptGroup.equals("1297") || deptGroup.equals("1298") || deptGroup.equals("1299") || deptGroup.equals("1300") || deptGroup.equals("1498") || deptGroup.equals("1499") || deptGroup.equals("1500") || deptGroup.equals("1501") || deptGroup.equals("1559") || deptGroup.equals("1560") || deptGroup.equals("1581") || deptGroup.equals("1582") || deptGroup.equals("1739") || deptGroup.equals("1740") || deptGroup.equals("1741") || deptGroup.equals("1742") || deptGroup.equals("1743") || deptGroup.equals("1744") || deptGroup.equals("1745") || deptGroup.equals("1746") || deptGroup.equals("1747") || deptGroup.equals("1748") || deptGroup.equals("1749") || deptGroup.equals("1750") || deptGroup.equals("1751") || deptGroup.equals("1752") || deptGroup.equals("1753") || deptGroup.equals("1754") || deptGroup.equals("1755") || deptGroup.equals("1756") || deptGroup.equals("1757") || deptGroup.equals("1758") || deptGroup.equals("1759") || deptGroup.equals("1760") || deptGroup.equals("1761") || deptGroup.equals("1762") || deptGroup.equals("1763") || deptGroup.equals("1764") || deptGroup.equals("1765") || deptGroup.equals("1766") || deptGroup.equals("1767") || deptGroup.equals("1784") || deptGroup.equals("1785") || deptGroup.equals("1786") || deptGroup.equals("1787") || deptGroup.equals("1859") ))){
		String redirectURL	= "../includes/claimMaintenance.html";
		response.sendRedirect(redirectURL);
	}else{*/
%>

   <!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	<script src="../jscripts/util.js"></script>

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
    $(".xyz").removeAttr("disabled").prop("readonly",true);

$('body').on('focus',".datepicker", function(){
		$(this).datepicker({  });		

	});	
      var i=0;
     $("#add_row").click(function(){

     i++;
  	$('#addr'+i).html("<td class='text-center'>"+ (i+1) +"</td> <td> <div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'> <input name='from"+i+"' id='from"+i+"' type='text' placeholder='' class='form-control input-xs xyz datepicker from' readonly /> </div></td><td> <div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'> <input name='to"+i+"' id='to"+i+"' type='text' placeholder='' class='form-control xyz input-xs datepicker to'  readonly /> </div></td> <td> <div class='form-group' style='margin-left:5px;margin-right:5px;'><input name='km"+i+"' id='km"+i+"' type='text' placeholder='' class='form-control grp1 input-xs km'  /> </div></td> <td><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><textarea name='add"+i+"'  placeholder='' class='form-control abc noresize add' rows='3' maxlength='1000' id='textarea' rel='tooltip' title=''/></textarea> </td> <td> <div class='grp '>  <select  name='mode"+i+"' id='mode"+i+"' class='form-control mode pqr'> '<option value=''>select</option>' '<option value='air'>Air</option>' '<option value='road'>Road</option>' '<option value='rail'>Rail</option>' '<option value='searoute'>Sea Route</option>' </select> </div></td>  ");	
        
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

        $('.add').each(function () {
			$(this).rules("add", {
			required: true,
		});
		});
$('.datepicker').datepicker({ dateFormat: 'dd-mm-yy',
      onClose: function() {$(this).valid(); }
	});
        $('.km').each(function () {
			$(this).rules("add", {
			required: false,
           pattern: /^(?=.*\d)\d*(?:\.\d\d)?$/,
        messages: {
            pattern:  "<font color='#a94442'>invalid format</font> "
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
		$('#addr2'+j).html("<td class='text-center'>"+ (j+1) +"</td> <td> <div  class='form-group grp has-feedback' style='margin-left:5px;margin-right:5px;'> <div  class='input-icon'><input name='person"+j+"' type='text' placeholder='' class='form-control abc person '  id='person"+j+"'  style='padding-left:10px;'  /> </div></div></td> <td><select  name='sel"+j+"' id='sel"+j+"'  class='form-control input-xs pqr'>'<option>Self</option>' '<option>Spouse</option>' '<option>Son</option>' '<option>Daughter</option>' '<option>Dependent Parent</option>' '<option>Other Dependents</option>'</td> <td><textarea name='head"+j+"' placeholder='' class='form-control abc noresize' rows='2' maxlength='25' id='head"+j+"' rel='tooltip' title=''/></textarea> </td>    ");	
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
$('.datepicker').datepicker({ dateFormat: 'dd-mm-yy',
      onClose: function() {$(this).valid(); }
	});
	$('.datepicker').datepicker({
      onClose: function() {$(this).valid(); }
	});
	
/*	$("input:checkbox").click(function() {
    $(".xyz").attr("disabled", !this.checked); 
	$(".abc").attr("disabled", !this.checked); 
	$(".pqr").attr("disabled", !this.checked); 
	$(".ad").attr("disabled", !this.checked); 
	$(".ad1").attr("disabled", !this.checked); 
	$(".del").attr("disabled", !this.checked);
	$(".del1").attr("disabled", !this.checked); 
	});
	*/
	$("input:checkbox").click(function() {
	if (this.checked)
	{
		//alert("JJJ");
		$("#tab_attach8").show(); 
	}else{
		$("#tab_attach8").hide(); 
	}
    
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
		add0: {
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
			
            pattern:  "<font color='#a94442'>invalid format</font> "
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
<script  type="text/javascript">
function dateFormat(incomingData)
{
	var monthName = new Array("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");
	incomingData = incomingData.split("-");
	var day = incomingData[0];
	var month= incomingData[1];
	var year  = incomingData[2];

	var monthValue = 0;

	for(var i=0; i < monthName.length ;i++)
	{
		if(monthName[i] == month)
		{
			var monthValue = i;
		}
	}
	var revisedFormat = new Date(year, monthValue ,day);
	return revisedFormat;
}	// end of function

function dateFormat1(incomingData)
{
	var monthName = new Array("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");
	incomingData = incomingData.split("-");
	var day = incomingData[0];
	var month= incomingData[1];
	var year  = incomingData[2];
	var monthValue = 0;

	for(var i=0; i < monthName.length ;i++)
	{
		if(monthName[i] == month)
		{
			alert(monthName[i]);
            alert(month);
            var monthValue = i;
		}
	}
	var revisedFormat = new Date(year, (month-1) ,day);
	return revisedFormat;
}	// end of function
</script>

<script  type="text/javascript">
function joinigVal()
{
var doj = document.annuallta.doj.value;
var from0 = document.annuallta.from0.value;
var count2 = document.annuallta.count.value;
var count3 = document.annuallta.count1.value;
var exemptionChk = document.annuallta.trav.checked;
var billTypeNew = document.annuallta.billType.value;
var uploadCount = $("#attachedFileSize").val();
//var uploadFile = document.annuallta.ltaAttach.length;
//var	requestStr	= document.getElementById('requestStr').value;
//alert(uploadCount);
var temp=true;

//alert(count3);



/*var stat = checkNull("File",uploadFile);
	if(!stat){
		frmObj.uploadFile.focus();
		return;
	}*/


/*if(isEmpty(document.annuallta.ltaAttach.value.length)){
		error += "Please select attachment file\n ";
				if(parseInt(flag)==0)
				{
					document.annuallta.ltaAttach.focus();
					flag = 1;
				}
	}*/

 if(exemptionChk && billTypeNew=="0"){
	alert("Please select Bill Type to proceed further!");
		//alert(document.annuallta.ltaAttach.value);
		document.annuallta.billType.focus();
				return false;
 }

 if (billTypeNew!="GoodBill")
{


}

if(exemptionChk && billTypeNew!="GoodBill"){
    var exemAmount = document.annuallta.amount.value;
    chkVal = checkNull("Bill Amount", exemAmount);
    if(!chkVal){
        document.annuallta.amount.focus();
        return false;
        
    }


	/*if (document.annuallta.amount.value<5000)
	{
		alert("Bill Amount value should be more than Rs. 5000");
		//alert(document.annuallta.ltaAttach.value);
		document.annuallta.amount.focus();
				return false;

	}

	if (count3==0 & document.annuallta.amount.value>36000)
	{
		alert("Bill Amount cannot be greater than Rs. 36,000 for a single dependent !");
		document.annuallta.amount.focus();
		return false;
	}else if (count3==1 & document.annuallta.amount.value>72000)
	{
		alert("Bill Amount cannot be greater than Rs. 72,000 for two dependents !");
		document.annuallta.amount.focus();
		return false;
	}else if (count3==2 & document.annuallta.amount.value>108000)
	{
		alert("Bill Amount cannot be greater than Rs. 1,08,000 for three dependents !");
		document.annuallta.amount.focus();
		return false;
	}else if (count3>=3 & document.annuallta.amount.value>144000)
	{
		alert("Bill Amount cannot be greater than Rs. 1,44,000 !");
		document.annuallta.amount.focus();
		return false;
	}*/

    doj =  dateFormat(doj);
    from0 =  dateFormat1(from0); 
    for(var qq = 0; qq <= count2; qq++) 
        {
            var fromDates   = eval("document.annuallta.from"+qq+".value");
            var toDates     = eval("document.annuallta.to"+qq+".value");
            
            //alert(fromDates);
            chkVal = checkNull("From Date", fromDates);
            if(!chkVal){
            eval("document.annuallta.from"+qq).focus();
                return false;
            }  

            //alert(toDates);
            chkVal = checkNull("To Date", toDates)
            if(!chkVal){
                eval("document.annuallta.to"+qq).focus();
                return false;
            }            

            fromDates       = dateFormat1(fromDates);
            toDates         = dateFormat1(toDates);
            
            if(toDates < fromDates ){
                    alert("To Date cannot be earlier than From Date! ");
                        temp=false;
                        eval("document.annuallta.to"+qq).focus();
                        return false;
            }
            if(doj > fromDates ){
                    alert("From Date cannot be earlier than Joining Date!! ");
                        temp=false;
                        eval("document.annuallta.from"+qq).focus();
                        return false;
            }
            if ( doj > toDates){
                    alert("To Date cannot be earlier than Joining Date!! ");
                        temp=false;
                        eval("document.annuallta.to"+qq).focus();
                        return false;
            } 

			 var kmsTravel   = eval("document.annuallta.km"+qq+".value");
            chkVal = checkNull("Kilometre of Travel", kmsTravel);
            if(!chkVal){
                eval("document.annuallta.km"+qq).focus();
                return false;
            }

            var placesVisited   = eval("document.annuallta.add"+qq+".value");
            chkVal = checkNull("Places Visited", placesVisited)
            
            /*if(!chkVal){
                eval("document.annuallta.add"+qq).focus();
                return false;
            } */

			

            var modeTravel   = eval("document.annuallta.mode"+qq+".value");
            chkVal = checkNull("Mode of Travel", modeTravel);
            if(!chkVal){
                eval("document.annuallta.mode"+qq).focus();
                return false;
            }
			/*var classTravel   = eval("document.annuallta.ct"+qq+".value");
            chkVal = checkNull("Class of Travel", classTravel);
            if(!chkVal){
                eval("document.annuallta.ct"+qq).focus();
                return false;
            }
			var ticketNumber   = eval("document.annuallta.tn"+qq+".value");
            chkVal = checkNull("Class of Travel", classTravel);
            if(!chkVal){
                eval("document.annuallta.tn"+qq).focus();
                return false;
            }*/
    }
    for(var pp = 0; pp <= count3; pp++)
    {
            var nameOfPerson   = eval("document.annuallta.person"+pp+".value");
            chkVal = checkNull("Name of Person", nameOfPerson);
            if(!chkVal){
                eval("document.annuallta.person"+pp).focus();
                return false;
            }
    }

	
}else if (exemptionChk && billTypeNew=="GoodBill")
{
	    var exemAmount = document.annuallta.amount.value;
    chkVal = checkNull("Bill Amount", exemAmount);
    if(!chkVal){
        document.annuallta.amount.focus();
        return false;
        
    }


	if (document.annuallta.amount.value<5000)
	{
		alert("Bill amount value should be more than Rs. 5000");
		//alert(document.annuallta.ltaAttach.value);
		document.annuallta.amount.focus();
				return false;

	}

	/*if (count3==0 & document.annuallta.amount.value>36000)
	{
		alert("Bill Amount cannot be greater than Rs. 36,000 for a single dependent !");
		document.annuallta.amount.focus();
		return false;
	}else if (count3==1 & document.annuallta.amount.value>72000)
	{
		alert("Bill Amount cannot be greater than Rs. 72,000 for two dependents !");
		document.annuallta.amount.focus();
		return false;
	}else if (count3==2 & document.annuallta.amount.value>108000)
	{
		alert("Bill Amount cannot be greater than Rs. 1,08,000 for three dependents !");
		document.annuallta.amount.focus();
		return false;
	}else if (count3>=3 & document.annuallta.amount.value>144000)
	{
		alert("Bill Amount cannot be greater than Rs. 1,44,000 !");
		document.annuallta.amount.focus();
		return false;
	}*/

	if (uploadCount==0)
	{
		alert("Please attach atleast one bill for exemption !");
		document.annuallta.ltaAttach.focus();
		return false;
	}
}
		if(temp==true){
		document.annuallta.submitForm.disabled = true;  
        document.annuallta.submitForm.value = 'Please Wait...';  

           	document.annuallta.action = "../common/submitclaimexemption.jsp";
			document.annuallta.submit();
        }
}


function validateChoice()
{
	var billType = document.annuallta.billType.value;	
	//alert(billType);
	if (billType=="GoodBill")
	{
		document.getElementById("from0").disabled=true;
		document.getElementById("to0").disabled=true;
		document.getElementById("km0").disabled=true;
		document.getElementById("textarea").disabled=true;
		document.getElementById("mode0").disabled=true;
		$("#goodsNote").show();
	}else{
		document.getElementById("from0").disabled=false;
		document.getElementById("to0").disabled=false;
		document.getElementById("km0").disabled=false;
		document.getElementById("textarea").disabled=false;
		document.getElementById("mode0").disabled=false;
		$("#goodsNote").hide();
	}

	//alert("billType"+billType);
}


function attachmentFile(attachDetails, str,formName){			
	var url	= "../upload/uploadFile.jsp?attachment="+attachDetails+"&str="+str+"&formName="+formName;
	window.open(url,"File","width=600,height=165,resizable=yes,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");	
}


function onLoadDetail(str,formName){
	//alert("ooo");
	//alert("str..."+str);
	//alert("formName..."+formName);
	if(str == '0'){
		//alert("hhhhhh..."+formName);
	//	loadFragment("../common/dirListing.jsp?attachment=compulsory&str="+str,"attachment","Attachment");
		loadFragment("../requestor/dirListing.jsp?attachment=additional&str="+str+"&formName="+formName,"attachment1","Attachment");
	}else 	{
		//alert("nnnnn..."+formName);
	//	loadFragment("../common/dirListing.jsp?attachment=compulsory&str=1","attachment","Attachment");
		loadFragment("../requestor/dirListing.jsp?attachment=additional&str=1&formName="+formName,"attachment1","Attachment");
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
	var processingRequest = '<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
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



</script>


    </head>


<%


String[] tags = {"journey", "travellers"};

	//String txnId = (String)request.getParameter("Id");
	String applicationId = (String)request.getParameter("applicationId");

//String applicationId="201509015455";

Hashtable detailsHash = new Hashtable();

detailsHash.put("APPLICATIONID",applicationId);



	ArrayList ltaRquestDetails = null;
	ltaRquestDetails = ltaController.requestDetails(detailsHash, tags);

    String[] annualHeader = (String[]) ((ArrayList)ltaRquestDetails.get(0)).get(0);

	Hashtable requestHash = (Hashtable) ltaRquestDetails.get(1);
    

    ArrayList travelDetails = (ArrayList)requestHash.get(tags[0]);

    ArrayList travellerDetails = (ArrayList)requestHash.get(tags[1]);

	String  selectedPl      =   "";
    String  exemption       =   "";
    String  ltaProposedAmt  =   "";
    String  ltaApprovedamt  =   "";
    String  ltaAmount       =   "";
    String empApplicationId ="";
        if(annualHeader.length>0)
        {
            selectedPl      =   annualHeader[18];
            exemption       =   annualHeader[1];
            ltaProposedAmt  =   annualHeader[2];
            ltaAmount       =   annualHeader[20];
            empApplicationId       =   annualHeader[0];

        }else
            {
                selectedPl          ="NA";
                exemption           ="NA";    
                ltaProposedAmt      ="NA";    
            }
		int amt = annualHeader[2].length();

		String tempvalue = "";
			
		int lengthCount = amt-1;

		int counterVal = 1;

		if(amt>3)
		{
			while(lengthCount>=0)
			{
				if((counterVal>3) && (counterVal%2==0))
					{
						tempvalue = tempvalue + ",";
					}
				
				tempvalue = tempvalue + annualHeader[2].charAt(lengthCount);
				
				lengthCount--;
				counterVal++;
			}
			tempvalue =  new StringBuffer(tempvalue).reverse().toString();
	   
			ltaProposedAmt = tempvalue;
		}

/*----------------------------------------------------------------------*/

    String flag = "";
	String faYear= "";
	String queryDate ="";
	
    //String roleId =  "";

	String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};

	GregorianCalendar thisDay = new GregorianCalendar( );

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
    
    ArrayList ltaBalResult	= new ArrayList();

 /*   ltaBalResult	= ltaController.getLtaBal(timescapeUserOId, ltaYear);

	String ltaBal[]     =   new String[1];
    //String ltaAmount    =  "";
    if ( ltaBalResult.size()> 0 ) {

     ltaBal		= (String []) ltaBalResult.get(0) ;
     //ltaAmount  =  ltaBal[0];
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
		}*/
/*----------------------------------------------------------------------*/

	Hashtable SAPConnectionDetails = new Hashtable();

	Hashtable SAPColumnHeads1 = new Hashtable();

	Hashtable SAPValues1 = new Hashtable();
	Hashtable SAPDataHash1		= new Hashtable();

	ArrayList importValues1 =  new ArrayList( );
	ArrayList SAPReturnValues3	= new ArrayList();



	SAPConnectionDetails.put("CLIENT","700");
	SAPConnectionDetails.put("USERID","tsrfc");
	SAPConnectionDetails.put("PASSWORD","welcome");
	SAPConnectionDetails.put("LANGUAGE","EN");
	//SAPConnectionDetails.put("HOSTNAME","10.200.65.51"); // for ppr new
	//SAPConnectionDetails.put("HOSTNAME","10.200.67.56"); // for PROD new
	SAPConnectionDetails.put("HOSTNAME","10.200.66.76"); // for QR3 new
	//SAPConnectionDetails.put("HOSTNAME",hostname); // for PROD new
	SAPConnectionDetails.put("SYSTEMNO","02");
	//SAPConnectionDetails.put("SYSTEMNO",systemno);
	SAPConnectionDetails.put("RFCNAME","ZPY_LTA_BLOCK_TRANSFER");
	//SAPConnectionDetails.put("TOTALTABLESTOUPDATE","0");
	//SAPConnectionDetails.put("TABLENAME1","PERKS_ENTRIES");
    //Only for Investment due exeBatch_inv in SQLUtility
	SAPConnectionDetails.put("applicationName","lta");

    String application11 = "lta";

	//String importKeys1[] = {};

	String exportKeys[] = {"S_DATE", "E_DATE"};

    //SAPColumnHeads1.put("IMPORTKEYS",importKeys1);

	//SAPValues1.put("IMPORTVALUES","");

	SAPColumnHeads1.put("EXPORTKEYS",exportKeys);


	JcoGetDataFromSAP jcoObj = new JcoGetDataFromSAP(application11);

	SAPDataHash1 = jcoObj.jcoGetData(SAPConnectionDetails,SAPColumnHeads1,SAPValues1);	

	/*if(SAPDataHash1.containsKey("RETURNDATA"))
	{
	
		SAPReturnValues3 = (ArrayList)SAPDataHash1.get("RETURNDATA");
	}*/
   String     sDate         = (String)SAPDataHash1.get("S_DATE");
   String     eDate         = (String)SAPDataHash1.get("E_DATE");
    String blockStartDate    = "";
    String blockEndDate      = "";
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    Date date1      =   new Date();
    Date date2      =   new Date();
         date1      =    (Date)formatter.parse(sDate);
         date2      =    (Date)formatter.parse(eDate);
    DateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy");

        blockStartDate      =    formatter1.format(date1);
        blockEndDate        =    formatter1.format(date2);

//out.println("startDate11= "+startDate11);
//out.println("endDate11= "+endDate11);



/*----------------------------------------------------------------------*/
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
if(employeeMobile==null){
employeeMobile="NA";
}
}}

%>
<%String ltaRoleId	= (String) session.getAttribute("ltaRoleId");%>
<%@ include file="../includes/relatedlinks.jsp" %>

<% String optionValue ="ARC";//A-annual,V-reviewer,C-checkstatus
session.setAttribute("optionValue",optionValue);
%>
<hr>
<%@ include file="../includes/annualmenutabs.jsp" %>
<!-- <hr>
<div class="row"> 
 <div class="col-xs-1 "  style="margin-left:10px;">
<a class="btn btn-default " href="../requestor/annualltaapply.jsp"><font color="#4586BD">Apply <i class="fa fa-check"></i></font></a></div>
 <div class="col-xs-1">
<a class="btn btn-default active" href="../requestor/annualcheckstatus.jsp"><font color="#4586BD">Mylist <i class="fa fa-list-ol"></i> </font></a></div>
</div> -->
</div>
<div class="container">
<div class="row">
    <div class="col-xs-1"></div>
	
	<div class="col-xs-10 bs-example">	
		<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i>    Application For Claiming Annual LTA - Application ID <%=empApplicationId%>
			</div>			
		</div>
	<div class="portlet-body">
	<div class="alert alert-warning ">
	<!-- <p> <span style="color: #e32;">*</span>  Mandatory, only in case of claiming tax Exemption.</p>	
	<p> <span style="color: #e32;">*</span><span style="color: #e32;">*</span> Mandatory, for all types of claim requests.</p>		
 -->	</div>
		<form name="annuallta"   method="post" class="form-horizontal" role="form" style="margin-top:15px;" id="ann_lta">
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
							<label class="control-label col-xs-4">Financial Year</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-calendar-o" style="width:12px;"></i>
									</span>
									<input type="text" class="form-control" placeholder="Financial Year" id="joc" name="joc" value=" <%= faYear %> - <%= nextYear %>" readonly>
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

					<div class="row">
					<div class="col-xs-6">
						<div class="form-group grp has-feedback">							
							<label class="control-label col-xs-4">Select Privilege Leave Period <span style="color: #e32;">*</span><span style="color: #e32;">*</span></label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-umbrella" style="width:12px;"></i>
									</span>
										
									<input type="text"  class="form-control" placeholder="Tel/Mob" id="tel" name="tel" value="<%=selectedPl%>"readonly>
									</div>
								</div>
							</div>
						</div>
					<div class="col-xs-6">
						<div class="form-group ">
							<label class="control-label col-xs-4">LTA Amount</label>
							<div class="col-xs-8">
								<div class="input-group">
								<div class="input-icon">
										<i class="fa fa-inr" style="width:15px;" ></i>
									<input type="text" class="form-control" placeholder="LTA Amount" name="claimbalance" id="claimbalance"  style="width:285px;"  value= "<%=ltaAmount%>"readonly>
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
			<input type="checkbox" class="myCheckbox" name="trav" id="trav" value="Y" style="margin-left:15px;margin-bottom:15px;" onclick="clearAmt()"/> <span style="font-weight:bold;">Tax Exemption </span>

<span style="color:red;font-weight:bold;"> -> Click only when you wish to submit supporting documents to claim tax exemption. </span><!-- <i class="fa fa-info-circle" data-toggle="tooltip" data-placement="right" data-html="true" data-original-title="if checked,then above fields will be mandatory.If unchecked, & submitted,then 'Claim Exemption' link  would be available against the same TXN  for submitting the Exemption at a later date!"></i> -->
		</div>
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-th"></i>   Application to Claim Exemption on LTA availed.
            </div> 
        <div class="actions pull-right"style="margin-top:8px;">Current LTA Exemption Block: <%=blockStartDate%> to <%=blockEndDate%>
</div>                                 
                                  
        </div>
    </div>


	 <div class="row">
            <div class="col-xs-6">
                <div class="form-group grp has-feedback">
                    <label class="control-label col-xs-4"> Bill Type <span style="color: #e32;">*</span></label>
                <div class="col-xs-8">
                <div class="input-group">
                <div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-calendar-o" style="width:12px;"></i>
									</span>
                    <select name="billType" id="billType" class="form-control hidden-sm pqr" onchange = "validateChoice()" >
					  <option value="0">Select Bill(s)</option>
					  <option value="TravelBill" selected>Travel Bill(s)</option>
					  <!-- <option value="GoodBill">Purchased Goods Bill(s)</option> -->

				</select>

                </div>
                </div>
                </div>
                </div>
            </div>	
        </div>
		<div class="alert alert-warning" id = "goodsNote" Style = "display : none;">
				<p style="font-weight:bold;"> 
					Note :  <br>a) For Exemption, Purchase of Goods/Services must be on or after 12<sup>th</sup> Oct, 2020. <br>
							b) Only those Goods/Services in the bill would be considered for exemption where GST rate is 12% or above. <br>
						    c) Employees who have opted for New Tax Regime are not eligible for claiming exemption.<br> 
						    d) Journey details are not to be filled. 
						   
				</p>
			</div>

<br>

        <div class="row">
            <div class="col-xs-6">
                <div class="form-group grp has-feedback">
                    <label class="control-label col-xs-4">Total Bill Amount <span style="color: #e32;">*</span></label>
                <div class="col-xs-8">
                <div class="input-group">
                <div class="input-icon">
                    <i class="fa fa-inr" style="width:15px;" ></i>

                    <input type="text" class="form-control hidden-sm pqr " placeholder="" name="amount" id="amt"  style="width:285px;" value= "" onfocus="onLoadDetail('1','annuallta');" >
                <input  name = "amount1" id="amount1" type="hidden" value="<%=ltaProposedAmt%>" />
                <input  name = "applicationId" id="applicationId" type="hidden" value="<%=applicationId%>" />
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
					<tr class="warning">

						<th colspan="6" class="text-center ">							
							Journey Details <span style="color: #e32;">*</span>							
						
						</th>

					</tr>
				</thead>
				<thead>
					<tr class="info">
						<th class="text-center" width="2%;">
							Sr.No.
						</th>
						<th class="text-center" width="15%;">							
								From Date <span style="color: #e32;">*</span>							
						</th>
						<th class="text-center" width="15%;">							
								To Date <span style="color: #e32;">*</span>
						</th>
						<th class="text-center" width="10%;">
							Kms
						</th>
						<th class="text-center" width="20%;">
							Places Visited <span style="color: #e32;">*</span>
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
							<input type="text" class="form-control input-xs datepicker xyz from" placeholder="" name='from0' id="from0" >
						</div>
						</td>
						<td>
							<div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;">
							<input type="text" class="form-control input-xs datepicker required-field-block xyz to " placeholder="" name='to0' id="to0"  >	
							</div>
						</td>
						<td>
                           <div class="form-group " style="margin-left:5px;margin-right:5px;">
							<input type="text" class="form-control grp1 input-xs abc" placeholder="" name='km0' id="km0">		
                            </div>
						</td>
						<td>
							<div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;">

							<textarea name='add0' type="text" placeholder='' class='form-control abc noresize' rows='3' maxlength='1000' id='textarea' rel='tooltip' title=''  /></textarea>
</div>
						</td>
						<td>
							<div class="grp has-feedback">
							<select type="text" class="form-control input-xs pqr  mode " name='mode0' id="mode0"  />	
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
			<a id='delete_row' class="btn btn-default pull-right btn-sm ad" style="margin-left:10px;margin-right:12px; "  ><i class="fa fa-times"></i> Delete Row</a><a id="add_row" class="btn btn-default pull-right btn-sm del"  ><i class="fa fa-plus"></i> Add Row</a>
<input type="hidden" name="count" value="0" />
<input type="hidden" name="count1" value="0" />
			</div>
			
			<hr>
			<h3 >Family / Traveller Details : </h3> 
			<hr>
				<table class="table table-bordered table-hover table-responsive" id="tab_logic2" >	
				<div class="alert alert-warning pull-right ">
			<p> <span style="color: #e32;">*</span> Note : Name of person to include spouse and dependents.</p>	
		
			</div>
				<thead>
					<tr class="info">
						<th class="text-center" style="width:2%;">
							Sr.No.
						</th>
						<th class="text-center" style="width:20%;">							
								Name of Person <span style="color: #e32;">*</span>							
						</th>
						<th class="text-center" style="width:15%">							
								Relationship with Employee
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
									<input type="text" class="form-control abc person " placeholder="" name='person0' id='person0'  style="padding-left:10px;" value="<%=displayName%>" readonly autocomplete=off  >
									
								</div>
						</div>		
						</td>
						<td>
							<select type="text" class="form-control input-xs pqr" name='sel0'  id='sel0' readonly >							
								<option>Self</option>
								<option>Spouse</option>
								<option>Son</option>
								<option>Daughter</option>
								<option>Dependent Parent</option>
                                <option>Other Dependents</option>
								
							</select>	
												
						</td>
						<td>
							<textarea name='head0' type="text" placeholder='' class='form-control abc noresize' rows='2' maxlength='1000' id='head0' onfocus="onLoadDetail('1','annuallta');" rel='tooltip' title='' /></textarea>
						</td>
																
					</tr>					
                    <tr id='addr21'></tr>									
				</tbody>				
			</table>
			<div class="row" >
				<a id='delete_row2' class="btn btn-default pull-right btn-sm ad1 " style="margin-left:10px;margin-right:12px;" ><i class="fa fa-times"></i> Delete Row</a><a id="add_row2" class="btn btn-default pull-right btn-sm del1"  ><i class="fa fa-plus"></i> Add Row</a>
			</div>

			<div class="row" id = "tab_attach8"  style = "display:none" >  
						<div class="col-xs-12">
								<table class="table table-bordered table-hover" >			
									<thead>
										<tr >
											<th colspan="2" class="text-left" >
												Attached Documents <span style="color: #e32;">*</span> (Allowed File Types : .jpg, .png, .bmp, .jpeg, .pdf)
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('additional','0','annuallta');" name = "ltaAttach" ><img src="../images/attachment.png" border="0" /></a> </td>	
										</tr>	
										<tr>
											<td colspan="2"  id="attachment1"></td>											
										</tr>
									</tbody>			
								</table>
							</div>
							</div>	

			<div class="form-actions" >
				<div class="row">
					<div class="col-xs-9">
						<div class="row">
							<div class="col-xs-offset-6 col-xs-5">
								<input type="button" value="Submit" id="submitForm" class="btn btn-info " style="width:90px;" onclick="joinigVal();"/>		
								<input type="reset" value="Reset" class="btn btn-primary" style="width:70px;" />										
							</div>
							
						</div>
					</div>					
				</div>
				<br>
				<div class="alert alert-warning  ">
				<p> 
					Note : 1) Bills for Exemption to be submitted by 12th of the month along with LTA Exemption Form. <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2) Employees claiming LTA in March, should submit their bills for exemption before 12th March along with LTA Exemption Form. 
				</p>
			</div>
			</div>
		</form>
	</div>
</div>
	</div>
	<div class="col-xs-1"></div>
</div>
</div>

</body>
<%//}%>
</html>
