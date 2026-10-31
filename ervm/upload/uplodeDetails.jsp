<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable,java.util.HashMap, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>

<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>

<!DOCTYPE html>
<head>
	<title>Audit Recommendations | Subordinate</title>
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<!-- <link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.css"> -->
	<link rel="stylesheet" href="../css/ervm.css"/>
	<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script Language="JavaScript" src="../js/ervm.js"></script> 
	<script Language="JavaScript" src="../js/util.js"></script> 
    <script Language="JavaScript" src="../js/common.js"></script> 
	<script src="../js/jquery1.min.js"></script>
	<link rel="stylesheet" href="../js/jquery-ui.css" type="text/css" />
	<script src="../js/jquery-ui.min.js"></script>

	<style>
		label, input{
		color: #2F6C87;
		font-size: 12px;
	}

	body{
		color: #000;
		font-size: 12px;
	}
	p{
		font-size: 12px;
	}

	.font12{
		font-size: 12px;
	}

	.pad0{
		padding: 0 !important;
	}
	.col-md-2{
		width: 16.66%;
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

	.well {
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #fff !important;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
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

.custom_formcontrol{
	width: 70%; display: block;width: 70%;height: 34px;pdding: 6px 12px;font-size: 14px;line-height: 1.42857143;
    color: #555; background-color: #fff;background-image: none;border: 1px solid #ccc;border-radius: 4px; -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}

.cursor{
	cursor: default !important;
}

readonly{
	background-color: #fff !important;
}
	</style>
	
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12" style="background: #3784a5; padding: 0%;">
		<div class="col-lg-10 col-md-10 col-sm-10" style="padding: 0;">
			<img src="../images/header.png" style="width: 100%;">
		</div>
		
		<div class="col-md-2 pad0">
			<%@ include file="../includes/relatedLinks.jsp" %>
		</div>
	</div> 
	 <div class="col-md-12 col-sm-12 col-xs-12" style="background: #E6E6E6;">
		<div class="col-md-4 pad0">
			<h5 style="color: #2F6C87; font-weight: bold; font-size: 18px; padding-top: 2%;">
			View History </h5><br>
		</div>
	</div> 
	
	<%

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
	
	String recommendation = "";//3
	String mangComments = "";//7
	String perResp = "";//6
	String targetDate = "";//8
	String userId = "";//8
	String superId = "";//8

	 subordinateHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
	 subordinateHash.put("DEPTNAME",deptName);
	 subordinateHash.put("EMAILID",emailId);
	 session.setAttribute("emailId",emailId);

	
		int counter = 1;
		//subordinateList =  ERVMController.displaySubordinateData(subordinateHash);
		// if(subordinateList.size() > 0){
%>
	<form name = "frmViewHistory" method = "post" >
	
	
		<table width="100%" border="1" style="font-size: 11px !important; padding: 0;">

			
			<tr style="text-align: center; font-weight: bold; background: rgba(0, 157, 194, 0.36);">
				<td width="1%">Sr. No</td>
				<td width="25%">Recommendation</td>
				<td width="5%">Severity</td>
				<td width="5%">Area</td>
				<td width="13%">Status</td>
				<td width="8%">Attachment</td>
				<td width="8.33333333%">Remarks</td>
				<td width="8.33333333%">Supervisor's Remarks</td>
				<td width="8.33333333%">Supervisor</td>
				<td width="8.33333333%">Management Comments (as per released report)</td>
				<td width="8.33333333%">Target Implementation Date (as per released report)</td>
				<td width="8.33333333%">Revised Target Implementation Date</td>
				
			</tr>
			

</body>
</html>