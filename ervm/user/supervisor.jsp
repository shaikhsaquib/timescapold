<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set,java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar, java.io.File" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>

<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!-- <meta content="width=device-width, initial-scale=1" name="viewport"> -->
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;chrome=1"> 

	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />	

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
	
	<!-- The below three links are for Date Picker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
    width:40%;
    text-align:left;
}

[tooltip]:not([tooltip-persistent]):before {
    pointer-events: none;
} 



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

	</script>
</head>
<body style="overflow-x: scroll;">
	<!-- <div class="col-lg-12 col-md-12 col-sm-12" style="padding: 0;">
		<div class="col-lg-10 col-md-10 col-sm-10" style="padding: 0;">
			<img src="../images/header.png" style="width: 100%;">
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12" style="padding: 0;">

	</div> -->
	<div  style="background: #3784a5; padding: 0%;height:50px;width:110%">
		<div class="col-lg-10 col-md-10 col-sm-10" style="padding: 0;float:left;height:50px;width:78%">
			<img src="../images/header.png">
		</div> 
		
		<div  style="float:left; ">
			<%@ include file="../includes/relatedLinks.jsp" %>
		</div>
	</div> 
	 <div class="col-md-12 col-sm-12 col-xs-12" style="background: #E6E6E6;width:110%;">
		<div class="col-md-4 pad0">
			<h5 style="color: #2F6C87; font-weight: bold; font-size: 18px; padding-top: 2%;">
			Approver Feedback</h5><br>
		</div>
	</div> 
	
<%
	response.addHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.addHeader("Cache-Control", "pre-check=0, post-check=0");
	response.setDateHeader("Expires", 0);
	
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

	Hashtable superviserHash = new Hashtable();
	ArrayList superviserList = new ArrayList();
	ArrayList Plist = new ArrayList();
	ArrayList fullNameList = new ArrayList();	

	
	
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
	String supStatus ="";
	String userId ="";
	String subordinateId ="";
	String userArray="";
	String superId="";
	

	superviserHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
	superviserHash.put("EMAILID",emailId);
	superviserList =  ERVMController.displaySupervisorData(superviserHash);


	Hashtable fullNameHash = new Hashtable();
	HashMap userName  = new HashMap();
		
	for(int ii =0 ;ii< superviserList.size();ii++){

		 String [] tmpArr = (String[])superviserList.get(ii);
		 userId = tmpArr[5];
		 //myFile = tmpArr[7];
		//out.println("myFile---------"+myFile);
			if(!userName.containsKey(userId)){
				ArrayList myList = new ArrayList();				
				myList.add(tmpArr);
				userName.put(userId,myList);
				userArray +=userId+",";
				//out.println(userArray);
			}else{
			
				ArrayList l1 = new ArrayList();
				ArrayList l2 = new ArrayList();
				
				l1.add(tmpArr);
				l2 = (ArrayList) userName.get(userId);
				

				if(l2.isEmpty()){
					userName.put(userId,l1);
					
				}else{
					l2.add(tmpArr);
					userName.put(userId,l2);
					
				}
			}
		}

	if(userArray.length() > 0){
		userArray = userArray.substring(0,userArray.length()-1);	
	}
	String arrUserList [] = userArray.split(",");

	int count = 0;
	ArrayList pList = new ArrayList();
	int userSize = userName.size();
	//out.println(userSize);
	
	if(superviserList.size() > 0){
	%>
	<!-- <body onLoad="document.frmSuperviser.Status<%=count%>.focus()" > -->
		<form  name = "frmSuperviser" method = "post"  style="">	
				<table border="1" style="font-size: 11px;width:110%;overflow-x: scroll;">
					<tr style="text-align: center; font-weight: bold; background: #e3f1f5;">
						<td width="2%">Sr. No.</td>
						<td width="10%">Area</td>
						<td width="6%">Year</td>
						<td width="10%">Risk</td>
						<td width="4%">Risk Classification</td>
						<td width="15.33333333%">Actions required</td>
						<td width="15.33333333%">Mitigation Plan</td>
						<td width="8.33333333%">Target Date</td>			
						<td width="12%">Risk Champion Status</td>
						<td width="8.33333333%">Attachment</td>
						<td width="13.33333333%">Risk Champion Remarks</td>
						<td width="8.33333333%">Supervisor_Status</td>
						<td width="13.33333333%">Supervisor_Remarks</td>
						<td width="8.33333333%">Revised_Target Date</td>
					</tr>
<%
	for(int kk =0; kk< userSize;kk++){
		
		if(userName.containsKey(arrUserList[kk])){
			pList = (ArrayList)userName.get(arrUserList[kk]);

			fullNameHash.put("USERID",arrUserList[kk]);
			fullNameList =  ERVMController.fullNameDisplay(fullNameHash);
%>
		
<%
					
					for(int j=0 ; j<fullNameList.size();j++){
						
						String [] fullArr = (String[])fullNameList.get(j);
%>				
						<input type="hidden" id="fullName<%=count%>" value="<%=fullArr[0]%>"  />
						<tr style="font-weight: bold; font-size: 12px; background: #F2F5F6;">
							<td colspan="14" style="padding: 0.3% 0.5%;">
								<%=fullArr[0]%>
								<%//out.println(fullArr[0]);%>
							</td>
						</tr>
<%			
						for(int i=0 ; i<pList.size();i++){
							String [] arr = (String[])pList.get(i);
							//out.println("arr[13] "+arr[13]);
							txnId = arr[0];
							srNo = arr[1];
							recommendation = arr[2];
							mangComments = arr[3];
							mitigationPlan = arr[17];
							severety = arr[4];
							userId = arr[5];
							//out.println(userId);
							superId = arr[6];
							myFile = arr[7];
							userRemarks = arr[8];
							supRemarks = arr[9];
							userStatus = arr[11];
							supStatus =arr[12];
							reviseTargetDate = arr[13];
							targetDate = arr[14];
							area = arr[15];
							year = arr[16];
							String mailIdForUser[] = userId.split("@");
							//out.println(mailIdForUser[0]);

							Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(targetDate);  
							SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
							format = new SimpleDateFormat("MM/dd/yyyy");
							//format = new SimpleDateFormat("dd/MM/yyyy");
							String DateToStr = format.format(date1); 
	%>	
						<input type="hidden" name="txnId<%=count%>" id="txnId<%=count%>" value="<%=txnId%>" />
						<tr style="text-align: left;">
							<!-- <td style="padding: 0.3% 0.5%;"><span id= "srNo<%=i%>"><%=i+1%></span></td> -->
							<td style="padding: 0.3% 0.5%;"><span id= "srNo<%=i%>"><%=count+1%></span></td>
							<td class="read" align="center"><%=(area ==null) ? "" : area%></td>
							<td  class="read" style="padding: 0.3% 0.5%;"><%=year%>	</td>
							<td  >
								<textarea class="form-control read" maxlength="1000" rows="6"  style="resize: none;" readonly ><%=(recommendation ==null) ? "" : recommendation%></textarea>
							<%-- <%=recommendation%> --%>	
							</td>
							<td class="read" align="center"><%=(severety ==null) ? "" : severety%></td>
							
							<td align="center">
								<textarea class="form-control read" maxlength="1000" rows="6"  style="resize: none;" readonly ><%=(mangComments ==null) ? "" : mangComments%></textarea>
							</td>
							
							<td align="center">
								<textarea class="form-control read" maxlength="1000" rows="6"  style="resize: none;" readonly ><%=(mitigationPlan ==null) ? "" : mitigationPlan%></textarea>
							</td>
							
							<td class="read" align="center">
							<%=DateToStr%>
							<input type="hidden" id="hiddenTargetImpDate<%=count%>" name="hiddenTargetImpDate<%=count%>" value="<%=DateToStr%>">
							</td>
							
							
							<td class="read" style="text-align:center">

								<%-- <select  class="form-control read" name="userStatus<%=i%>" id="userStatus<%=i%>"> --%>
									<%if("I".equals(userStatus)){%>
										Implemented
									<%}else if("IP".equals(userStatus)){%>
										In Progress
									<%}else if("NI".equals(userStatus)){%>
										Not Implemented
									<%}else if("NMA".equals(userStatus)){%>
										No More Applicable
									<%}%>

							</td>
							
							<!-- <td class="read" id="attachment<%=count%>"><!-- <a target="_blank" href=""><%= myFile%></a> </td> -->
							 <td align="center" name ="myFile<%=i%>" id="myFile<%=i%>" class="demo read" style="cursor: pointer;"><a  href="javascript:void(0);" onclick ="javascript:showCurrentFile1('<%=myFile%>','<%=mailIdForUser[0]%>','<%=i%>','<%=txnId%>');""><%=(myFile ==null) ? "" : myFile%></a></td> 
							 
							 <td class="read">
								<textarea class="form-control read" name= "Remarks<%=count%>" id="Remarks<%=count%>" maxlength="1000" rows="6"  style="resize: none; " readonly><%=(userRemarks ==null) ? "" : userRemarks%></textarea>
							</td>
							 
							<td>
								<select  class="form-control" name="Status<%=count%>" id="Status<%=count%>" autofocus onfocus="test('<%=count%>','<%=txnId%>','<%=mailIdForUser[0]%>');">
									<%
									
									if("I".equals(supStatus)){%>
										<option value = "I" Selected><span class="font12">Implemented</span></option>
										<option  value = "NI" >Not Implemented</option> 
										<option  value = "IP" >In Progress</option> 
										<option  value = "NMA" >No More Applicable</option>
										<option  value = "AP" >Alternate Plans</option>
									<%}else if("IP".equals(supStatus)){%>
										<option  value = "IP" Selected>In Progress</option> 
										<option value = "I" >Implemented</option>
										<option  value = "NI" >Not Implemented</option> 
										<option  value = "NMA" >No More Applicable</option>
										<option  value = "AP" >Alternate Plans</option>
									<%}else if("NI".equals(supStatus)){%>
										<option  value = "NI" Selected>Not Implemented</option> 
										<option value = "I" >Implemented</option>
										<option  value = "IP" >In Progress</option> 
										<option  value = "NMA" >No More Applicable</option>
										<option  value = "AP" >Alternate Plans</option>
									<%}else if("NMA".equals(supStatus)){%>
										<option  value = "NMA" Selected>No More Applicable</option> 
										<option value = "I" >Implemented</option>
										<option  value = "NI" >Not Implemented</option> 
										<option  value = "IP" >In Progress</option>
										<option  value = "AP" >Alternate Plans</option>
									<%}else if("AP".equals(supStatus)){%>
										<option  value = "NMA" >No More Applicable</option> 
										<option value = "I" >Implemented</option>
										<option  value = "NI" >Not Implemented</option> 
										<option  value = "IP" >In Progress</option>
										<option  value = "AP" Selected>Alternate Plans</option>
									<%}else{%>
										<option value = "I" >Implemented</option>
										<option  value = "NI" Selected>Not Implemented</option> 
										<option  value = "IP" >In Progress</option> 
										<option  value = "NMA" >No More Applicable</option>
										<option  value = "AP" >Alternate Plans</option>
									<%}%>
								</select>
							</td>
							<!-- <td class="read" align="center"><%=(userRemarks ==null) ? "" : userRemarks%></td> -->

							
							<td>
								<textarea class="form-control" id="supRemarks<%=count%>"  name="supRemarks<%=count%>"  maxlength="1000" rows="6"  style="resize: none; border: 0;"><%=(supRemarks == null) ? "" : supRemarks%></textarea>
							</td>
							
							<td align="center">
								<input type="text" class="test custom_formcontrol" name="reviseTargetDate<%=count%>" id="reviseTargetDate<%=count%>" value="<%=(reviseTargetDate == null) ? "" : reviseTargetDate%>"  style="resize: none; width: 100%; padding: 6% 0%; background: #fff !important;">
							</td>
					  </tr>
	
<input type = "hidden" name = "size" id = "size" value = "<%=superviserList.size()%>">
<input type = "hidden" name = "size1" id = "size1" value = "<%=pList.size()%>">
<input type = "hidden" name = "size2" id = "size2" value = "<%=userSize%>">

<%	count++;}
%>
	
	<%
				}

			}
}
					%>
<input type = "hidden" name = "size3" id = "size3" value = "<%=count%>">
	</table>
			<div class="col-md-12 col-sm-12 col-xs-12 pad0">
				<center>
					
					<input class="btn-danger" required="" style="font-size: 14px;  margin-top: 2%; padding: 0.5% 1.5%; border-radius: 6px;" type="button" value="SUBMIT" onclick="superviserDetails()";>
				<center>
			</div>
		</div>
	</div>

	</form>
	
	<%} else { %>
	
		<div class="col-md-12 col-sm-12 col-xs-12 pad0" style="text-align:center">
						<h5>No Recommendation Available For this Department  </h5>
		</div>
	
	<%} %>
	
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
	jQuery(function() {
		jQuery('.test').datepicker();
	});



	</script>
</body>
</html>