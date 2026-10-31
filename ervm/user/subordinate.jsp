<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable,java.util.HashMap, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar, java.io.File" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>
<%@include file="../upload/filePath.jsp" %>

<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>

<!DOCTYPE html>
<html lang="en">
<head>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!-- <meta content="width=device-width, initial-scale=1" name="viewport"> -->
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;chrome=1">   

	<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.css">
	<link rel="stylesheet" href="../css/ervm.css"/>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script Language="JavaScript" src="../js/ervm.js"></script> 
	<script Language="JavaScript" src="../js/util.js"></script> 
    <script Language="JavaScript" src="../js/common.js"></script> 
    <script src="../js/jquery1.min.js"></script>
	<link rel="stylesheet" href="../js/jquery-ui.css" type="text/css" />
	<script src="../js/jquery-ui.min.js"></script>

	<title>Audit Recommendations | Approver</title>

	<style>
	
	[tooltip]:before {
    /* needed - do not touch */
    content: attr(tooltip);
    position: absolute;
    opacity: 0;
    
    /* customizable */
    transition: all 0.15s ease;
    padding: 10px;
    color: #333;
    border-radius: 10px;
    box-shadow: 2px 2px 1px silver;    
}

[tooltip]:hover:before {
    /* needed - do not touch */
    opacity: 1;
    
    /* customizable */
    background: #e3f1f5;
     margin-top: -40px;
    margin-left: -300px;  
    margin-right: 50px;  
    margin-bottom: 10px; 
    width:35%;
    text-align:left;   
}

[tooltip]:not([tooltip-persistent]):before {
    pointer-events: none;
}
	
	/* td[title]:hover:after {
  		content: attr(title);
  		width:600px;
	} */	
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
	
	
	td{
		vertical-align: top;
	}
	
	textarea {
    border: none;
    width: 100%;
    height: 100%;
    -webkit-box-sizing: border-box; /* <=iOS4, <= Android  2.3 */
       -moz-box-sizing: border-box; /* FF1+ */
            box-sizing: border-box; /* Chrome, IE8, Opera, Safari 5.1*/
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

 .col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
  position: relative;
  min-height: 1px;
  padding-right: 15px;
  padding-left: 15px;
}
.col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12 {
  float: left;
}
.col-xs-12 {
  width: 100%;
}
.col-xs-11 {
  width: 91.66666667%;
}
.col-xs-10 {
  width: 83.33333333%;
}
.col-xs-9 {
  width: 75%;
}
.col-xs-8 {
  width: 66.66666667%;
}
.col-xs-7 {
  width: 58.33333333%;
}
.col-xs-6 {
  width: 50%;
}
.col-xs-5 {
  width: 41.66666667%;
}
.col-xs-4 {
  width: 33.33333333%;
}
.col-xs-3 {
  width: 25%;
}
.col-xs-2 {
  width: 16.66666667%;
}
.col-xs-1 {
  width: 8.33333333%;
}

@media (min-width: 992px) {
  .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
    float: left;
  }
  .col-md-12 {
    width: 100%;
  }
  .col-md-11 {
    width: 91.66666667%;
  }
  .col-md-10 {
    width: 83.33333333%;
  }
  .col-md-9 {
    width: 75%;
  }
  .col-md-8 {
    width: 66.66666667%;
  }
  .col-md-7 {
    width: 58.33333333%;
  }
  .col-md-6 {
    width: 50%;
  }
  .col-md-5 {
    width: 41.66666667%;
  }
  .col-md-4 {
    width: 33.33333333%;
  }
  .col-md-3 {
    width: 25%;
  }
  .col-md-2 {
    width: 16.66666667%;
  }
  .col-md-1 {
    width: 8.33333333%;
  }} 

	/* td{
		padding: 0% 0.5%;
	} */
	.cursor{
	cursor: default !important;
}
.read{
	background-color: #DCDCDC !important;
}
	</style>
	<script>
	$(document).ready(function() {
	$('.RelatedLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});

	
	
	});
	
	function incrSize(x){
		x.style.height = "164px";
	    x.style.width = "164px";
	}
	
	function decrSize(x){
		x.style.height = "32px";
	    x.style.width = "32px";
	}

	</script>
</head>
<body style="overflow-x: scroll;">
<!-- class="col-md-12 col-sm-12 col-xs-12" -->
<!-- class="col-lg-10 col-md-10 col-sm-10" -->
<!-- class="col-md-2 pad0"  -->
	<div  style="background: #3784a5; padding: 0%;height:50px;width:115%">
		<div class="col-lg-10 col-md-10 col-sm-10" style="padding: 0;float:left;height:50px;width:75%">
			<img src="../images/header.png">
		</div> 
		
		<div  style="float:left; ">
			<%@ include file="../includes/relatedLinks.jsp" %>
		</div>
	</div> 	
	 <div class="col-md-12 col-sm-12 col-xs-12" style="background: #E6E6E6;width:115%">
		<div class="col-md-4 pad0">
			<h5 style="color: #2F6C87; font-weight: bold; font-size: 18px; padding-top: 2%;">
			Risk Champion Feedback</h5><br>
		</div>
	</div> 
	
	<%
	 String DPATH     = EnvironmentProperties.getValue("ervm", "uploadPathSub");

	final class  DirListing{
		private String[] dirlist(String fname){
			File dir = new File(fname);
			String[] chld = dir.list();
		return chld;
		}
	}
	
	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	int fileSize=0;

	


	String emailid = emailId;
	if (emailid.indexOf("@") > -1) {
		emailid = emailid.substring(0, emailid.indexOf("@"));        
	}  

	String userFolderPath = DPATH + emailid;
	
	String dirPath ="";
	String dirPath1 ="";
	String dirPath2 ="";
//	System.out.println("email"+emailid);
	DirListing dirListing = new DirListing();

	////////////////dir start/////////////////

	String dirAdditional = userFolderPath;
	File dirAdditionalfileName = new File(dirAdditional);
	if (!dirAdditionalfileName.isDirectory()) 
	{
		boolean dirAdditionalFlag = dirAdditionalfileName.mkdir();

		//System.out.println("dirAdditionalFlag---"+dirAdditionalFlag);

	}
	
	////////////////dir end/////////////////


	Hashtable subordinateHash = new Hashtable();
	ArrayList subordinateList = new ArrayList();
	
	String txnId = "";//0
	String srNo = "";//2
	String severety = "";//5


	String userStatus = "";//11
	String myFile = "";//10
	String userRemarks = "";//12
	String supRemarks = "";//13
	String reviseTargetDate = "";//9

	String area = "";//4
	String year = "";
	
	String recommendation = "";//3
	String mangComments = "";//7
	String mitigationPlan = "";//17
	String perResp = "";//6
	String targetDate = "";//8
	String userId = "";//8
	String superId = "";//8

	 subordinateHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
	 subordinateHash.put("DEPTNAME",deptName);
	 subordinateHash.put("EMAILID",emailId);
	 session.setAttribute("emailId",emailId);

	
		int counter = 1;
		subordinateList =  ERVMController.displaySubordinateData(subordinateHash);
		 if(subordinateList.size() > 0){
%>
	<form id="frmSubordinate" name = "frmSubordinate" method = "post" >
	
	
		<table  border="1" style="font-size: 11px !important;width:115%;">

			
			<tr style="text-align: center; font-weight: bold; background: #e3f1f5;">
				<td width="2%">Sr. No.</td>
				<td width="10%">Area</td>
				<td width="6%">Year</td>
				<td width="10%">Risk</td>
				<td width="4%">Risk Classification</td>
				<td width="15.33333333%">Actions required</td>
				<td width="15.33333333%">Mitigation Plan</td>
				<td width="8.33333333%">Target Date</td>			
				<td width="8.33333333%">Attachment</td>
				<td width="13.33333333%">Risk Champion Remarks</td>
				<td width="8.33333333%">Supervisor Status</td>
				<td width="13.33333333%">Supervisor_Remarks</td>
				<td width="8.33333333%">Revised_Target Date</td>		
			</tr>
			
<%
			for(int i = 0; i< subordinateList.size(); i++){
				String [] tmpArr = (String[])subordinateList.get(i);
			
				txnId = tmpArr[0];
				srNo = tmpArr[1];
				recommendation = tmpArr[2];
				mangComments = tmpArr[3];
				mitigationPlan = tmpArr[17];
				severety = tmpArr[4];
				userId = tmpArr[5];
				superId = tmpArr[6];
				myFile = tmpArr[7];
				userRemarks = tmpArr[8];
				supRemarks = tmpArr[9];
				userStatus = tmpArr[11];
				reviseTargetDate = tmpArr[13];
				targetDate = tmpArr[14];
				area = tmpArr[15];
				year = tmpArr[16];
				

				Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(targetDate);  
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				format = new SimpleDateFormat("MM/dd/yyyy");
				String DateToStr = format.format(date1);

	%>		<input type="hidden" name="txnId<%=i%>" id="txnId<%=i%>" value="<%=txnId%>"  />
			<tr style="text-align: left;">
				<td  style="padding: 0.2% 0.3%;"><span id= "srNo<%=i%>"><%=i+1%></span></td>
				<td class="read" align="center">
				
				<%=(area ==null) ? "" : area%>
				</td>
				<td class="read" valign="top" style="padding: 0.3% 0.5%;"><%=year%></td>
				<td>
				<%-- <%=recommendation%> --%>
				<textarea class="form-control read" maxlength="1000" rows="6"  style="resize: none;" readonly ><%=(recommendation ==null) ? "" : recommendation%></textarea>
				<%-- <textarea style="resize: none;" readonly ><%=(recommendation ==null) ? "" : recommendation%></textarea> --%>
				</td>
				
				<td class="read" align="center" >
					<%=severety%>
				</td>
				
				<td align="center">
					<%-- <%=mangComments%> --%> 
					<textarea class="form-control read" maxlength="1000" rows="6"  style="resize: none;" readonly ><%=(mangComments ==null) ? "" : mangComments%></textarea>
				<%-- <textarea class="form-control"  style="resize: none;" readonly ><%=(mangComments ==null) ? "" : mangComments%></textarea> --%>
				</td>
				
				<td align="center">
					<textarea class="form-control read" maxlength="1000" rows="6"  style="resize: none;" readonly ><%=(mitigationPlan ==null) ? "" : mitigationPlan%></textarea>
				</td>
				
				<td  class="read" align="center">
					<%=DateToStr%>
					<input type="hidden" id="hiddenTargetImpDate<%=i%>" name="hiddenTargetImpDate<%=i%>" value="<%=DateToStr%>">
				</td>
				
				<% 

String filePath         = "";
String attachment       = "";
String[] allFilesInDir    = null;

filePath = getFilePath(txnId, userId);
allFilesInDir = new File(filePath).list();
attachment = (allFilesInDir != null && allFilesInDir.length != 0)? "<a href=\"#\" onclick=\"openWindow('../common/getAttachments.jsp?filePath="+filePath+"', 'Download Files', 'width=500,height=500, left=200,right=200,top=100,resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes',  'Download Files'); return false;\" src=\"../images/attachment.png\" style=\"width:50%;height:100%;text-align:center;cursor:pointer;\"> Download Attachments </a>" : "Attachments Not Available";

%>

				<td align="center" name ="myFile<%=i%>" id="myFile<%=i%>" class="demo">
				<a href="javascript:attachmentFileSubord('<%=txnId%>','<%=i%>');">
						<!-- <img src="../images/attachment.png" style="width: 20%;"> -->
						Attach Files
					</a><br><br><br>
				<%=attachment %>
				</td>
				
				<td>
					<textarea class="form-control" name= "Remarks<%=i%>" id="Remarks<%=i%>" maxlength="1000" rows="6"  style="resize: none;" onfocus="onLoadFixedDetail('<%=i%>','<%=txnId%>');" ><%=(userRemarks ==null) ? "" : userRemarks%></textarea>
					<%-- <textarea class="form-control" name= "Remarks<%=i%>" id="Remarks<%=i%>"   style="resize: none;" onfocus="onLoadFixedDetail('<%=i%>','<%=txnId%>');"  ><%=(userRemarks ==null) ? "" : userRemarks%></textarea> --%>
				</td>
				
				<td>
					<select class="form-control" name="Status<%=i%>" id="Status<%=i%>" style="cursor: pointer;" >
						<!-- <option value = "NI" >Not Implemented</option> -->
						<%if("I".equals(userStatus)){%>
						<option value = "I" Selected><span class="font12">Implemented</span></option>
						<option  value = "NI" >Not Implemented</option>
						<option  value = "IP" >In Progress</option>
						<option  value = "NMA" >No More Applicable</option>
						<option  value = "AP" >Alternate Plans</option>
						<%}else if("IP".equals(userStatus)){%>
						<option  value = "IP" Selected>In Progress</option> 
						<option value = "I" ><span class="font12">Implemented</span></option>
						<option  value = "NI" >Not Implemented</option>
						<option  value = "NMA" >No More Applicable</option>
						<option  value = "AP" >Alternate Plans</option>
						<%}else if("NMA".equals(userStatus)){%>
						<option  value = "NMA" Selected>No More Applicable</option> 
						<option value = "I" ><span class="font12">Implemented</span></option>
						<option  value = "NI" >Not Implemented</option>
						<option  value = "IP" >In Progress</option>
						<option  value = "AP" >Alternate Plans</option>
						<%}else if("NI".equals(userStatus)){%>
						<option  value = "NI" Selected>Not Implemented</option> 
						<option value = "I" ><span class="font12">Implemented</span></option>
						<option  value = "IP" >In Progress</option>
						<option  value = "NMA">No More Applicable</option> 
						<option  value = "AP" >Alternate Plans</option>
						<%}else if("AP".equals(userStatus)){%>
						<option  value = "NI">Not Implemented</option> 
						<option value = "I" ><span class="font12">Implemented</span></option>
						<option  value = "IP" >In Progress</option>
						<option  value = "NMA">No More Applicable</option> 
						<option  value = "AP" Selected>Alternate Plans</option>
						<%}else{%>
						<option value = "I" ><span class="font12">Implemented</span></option>
						<option  value = "NI" Selected>Not Implemented</option>
						<option  value = "IP" >In Progress</option>
						<option  value = "NMA" >No More Applicable</option>
						<option  value = "AP" >Alternate Plans</option>
						<%}%>
					</select>
				</td>
				
				<td class="read">
					<textarea class="form-control read" maxlength="1000" rows="6"  style="resize: none;" readonly ><%=(supRemarks ==null) ? "" : supRemarks%></textarea>
					<%-- <textarea class="form-control"   style="resize: none;" readonly ><%=(supRemarks ==null) ? "" : supRemarks%></textarea> --%>
				</td>
				
				
				<td align="center">
					<input type="text" class="test custom_formcontrol" name="reviseTargetDate<%=i%>" id="reviseTargetDate<%=i%>" value="<%=(reviseTargetDate == null) ? "" : reviseTargetDate%>"  style="resize: none; width: 100%; padding: 6% 0%; background: #fff !important;">
				</td>
				
			</tr>
	
	


	<input type = "hidden" name = "size" id = "size" value = "<%=subordinateList.size()%>">
	<%	}%>	
	</table>
	
	<div class="col-md-12 col-sm-12 col-xs-12 pad0">
					<center>
						<input class="btn-danger"  style="font-size: 14px;  margin-top: 2%; padding: 0.5% 1.5%; border-radius: 6px;" type="button" value="SUBMIT" onclick="subordinateDetails(<%=subordinateList.size()%>)" />
					<center>
				</div>
		
	
	</form>
	
	<%
				}else{
	%>
				<div class="col-md-12 col-sm-12 col-xs-12 pad0">
					<center>
						<h5>No Recommendation Available For this Department  </h5>
					<center>
				</div>
			
	<%				}

					%>
 				

	<script>
	$(document).ready(function() {
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
	});

	
	</script>

	<script>
	/*jQuery(function() {
    jQuery('.test').datepicker();
 });*/

 //$( ".test" ).datepicker({ minDate: 0});

 $(document).ready(function() {
    var dates = $('.test').datepicker({
        changeMonth: true,
        changeYear: true,
        onSelect: function(selectedDate) {
            var option = this.id == "start" ? 'minDate' : 'maxDate',
                instance = $(this).data('datepicker');
            var date = $.datepicker.parseDate(
            instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
            dates.not(this).datepicker("    ", option, date);
			
        }
    });
});


	</script>
</body>
</html>