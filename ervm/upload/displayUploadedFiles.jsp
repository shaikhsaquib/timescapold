<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="com.bccl.util.DirReader" %>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<%@ page import="java.util.HashMap,java.util.Hashtable,java.util.Calendar" %>
<%@ page import="java.util.ArrayList" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;chrome=1">   

	<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.css">
	<link rel="stylesheet" href="../css/ervm.css"/>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/ervm.js"></script> 
	<script src="../js/util.js"></script> 
    <script src="../js/common.js"></script> 
    <script src="../js/jquery1.min.js"></script>
	<link rel="stylesheet" href="../js/jquery-ui.css" type="text/css" />

	<title>Deck Year</title>
	<style>
	   label{
	       color: #2F6C87;
	       font-size: 12px;
	   }
	   
	   body{
	       font-size: 12px !important;
	   }

	   a{
	       text-decoration: none;
	       color: #2F6C87;
	       cursor: pointer;
	   }
	   
	   @media only screen and (max-width: 600px){
	       .mob_pad{
	           padding: 0 !important;
	       }
	   }   
	   @media only screen and (min-width: 601px){
	       .mob_pad{
	           padding-left: 0 !important;
	       }
	   }   

		.cust{
			
			
			font-size: initial;
			padding: 0.5%;
			
		}

		.customborder1{
			border: 1px solid #c6c6c6;
			font-size: 1em;
			padding: 0.5%;
			text-align: center;
		}
		
		.sticky {
		  position: fixed;
		  top: 0;
		  width: 60%;
		}

		.headerTD {
			border: 1px solid black;
			text-align: center;
			font-size: 15px;
			font-weight: bold;
			padding: 10px;
			color: #3d3d3d;
		}
		.dataTD {
			border: 1px solid black;
			text-align: center;
			font-size: 15px;
			font-weight: bold;
			padding: 10px;
			color: #3d3d3d;
		}
		.zipbtn {
			margin: 20px;
		}
	</style>
	<script src="../js/CheckForIncompatibleBrowserVersion.js"></script>
	<script>
		$(document).ready(function() {
			$('.RelatedLinks ul li.RelLinks').hover(function() {
					$(this).find('.dropdownmenu').show();
				}, function(){
					$(this).find('.dropdownmenu').hide();
			});
		
			loadFragment2("../common/getAreaDropdown.jsp?random="+Math.random()+"&deptCode="+<%=deptGroup%>,"area", "");
			//loadFragment2("../common/getYearDropdown.jsp?random="+Math.random(),"year", "");
	
			$("#download").hide();
			$(".imgHide").hide();
			$(".areaImgHide").hide();
			$("#downloadAreaReport").hide();
		});
	</script>
</head>

<% 

	String comp = (String) request.getParameter("comp");
	String year = (String) request.getParameter("year");

	Hashtable hashTable = new Hashtable();
	hashTable.put("comp",comp);
	hashTable.put("year",year);
	
	ArrayList<String[]> dataList = ERVMController.getUploadedData(hashTable);
%>

<body>
	<div id="zipresult">
	</div>
	<div style="width:100%;align-items:left;">
	<% if(dataList.size()>0) {%>
	<input class="btn btn-info zipbtn" id="submitForm"  type="button" value="Get Zip" onclick="getZipFile();">
	<table style="width:50%;"> 
			<tr>
			<td class="headerTD">COMPANY</td>
			<td class="headerTD">DEPARTMENT</td>
			<td class="headerTD">FINANCIAL YEAR</td>
			<td class="headerTD">ERVM_MATRIX</td>
			<td class="headerTD">RISK_RESPONSE_SHEETS</td>
			<td class="headerTD">POSITIVE_ASSURANCE_LETTER</td>
			<td class="headerTD">OTHER_DOCUMENTS</td>
			<td class="headerTD">MISC_DOCUMENTS</td>
			</tr>
			<tbody>
			<% for(int k=0; k<dataList.size(); k++){ 
				String[] dataArray = (String[]) dataList.get(k);
			
			%>
				<!--<tr>
				<% for(int l=0; l<dataArray.length; l++){ %>
				<td class="dataTD">
				<% if(l==4){%>
				<%=dataArray[l].substring(dataArray[l].lastIndexOf("/")+1,dataArray[l].length())%>
				<%}else{%>
				<%=dataArray[l]%>
				</td>
				<% }
				} %>
				</tr>-->
				<tr>
				<% for(int l=0; l<dataArray.length; l++){ %>
				<td class="dataTD">
				<% if(dataArray[l].equals("Y")){%>
				<img src="../images/approve-icon.png"/>
				<%} else if(dataArray[l].equals("N")){%>
				<img src="../images/cancel-icon.png"/>
				<%}else{%>
				<%=dataArray[l]%>
				</td>
				<% }
				} %>
				</tr>
			<% } %>
		    </tbody>
		</table>.
	<% }else { %>
		<h4>No record Found.</h4>
	<% } %>
	</div>
	

</body>

<script>
window.onscroll = function() {myFunction()};
var sticky     = null;

jQuery(document).ready(initializeSticky);

function initializeSticky () {
  if($('#myHeader').is(':visible')){ //if the table header is visible on the page
	  sticky = $('#myHeader').offset().top;
  } else {
    setTimeout(initializeSticky, 50); //wait 50 ms, then try again
  }
}

function myFunction() {
	var header = document.getElementById("myHeader");
	if (window.pageYOffset > sticky) {
    	header.classList.add("sticky");
    } else {
    	header.classList.remove("sticky");
    }
}
</script>

</html>