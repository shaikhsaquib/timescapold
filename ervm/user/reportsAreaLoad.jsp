<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set,java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>

<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>

<!DOCTYPE html>
<html>
<head>
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.css" rel="stylesheet">
	<link href="../css/ervm.css" rel="stylesheet">
	<script src="../js/jquery.min.js">
	</script>
	<script src="../js/bootstrap.min.js">
	</script>
	<script language="JavaScript" src="../js/ervm.js">
	</script>
	<script language="JavaScript" src="../js/util.js">
	</script>
	<script language="JavaScript" src="../js/common.js">
	</script>
	<title>Audit Recommendations | Approver</title>
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

		.customborder{
			border: 1px solid #c6c6c6;
			font-size: 1.1	em;
			font-weight: bold;
			padding: 0.5%;
			text-align: center;
			background-color: rgba(0, 135, 167, 0.11);
		}

		.customborder1{
			border: 1px solid #c6c6c6;
			font-size: 1em;
			padding: 0.5%;
			text-align: center;
		}

	</style>
	<script>
	/*$( document ).ready(function() {
    console.log( "ready!" );

     $('#myLink').on('click', function(){
	   var target = $(this).attr('#qustionsShow');
	   $("#"+target).show().siblings("#showData").hide();
	});

});*/
    </script> 
</head>
<div style="position: relative;height:280px;overflow: scroll;display:block;">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="col-md-2 col-sm-3 col-xs-12 customborder">User Name</div>
			<div class="col-md-2 col-sm-3 col-xs-12 customborder" >Number of Recommendation</div>
			<div class="col-md-1 col-sm-3 col-xs-12 customborder">Status</div>
			<div class="col-md-1 col-sm-3 col-xs-12 customborder">Implemented </div>
			<div class="col-md-2 col-sm-3 col-xs-12 customborder">Not Implemented </div>
			<div class="col-md-1 col-sm-3 col-xs-12 customborder">In Progress </div>
			<div class="col-md-2 col-sm-3 col-xs-12 customborder">No More Applicable</div>
			<div class="col-md-1 col-sm-3 col-xs-12 customborder">% Implemented</div>
		</div>
<%
	Hashtable reportUserNameHashArea = new Hashtable();
	ArrayList reportNameListArea = new ArrayList();
	ArrayList Plist = new ArrayList();
	ArrayList fullNameList = new ArrayList();
	
	String userId ="";
	String userName = "";
	String userArray="";
	String subordinateId="";
	String areaCode="";

	String department = "";
	String userStatus = "";
	String questions = "";
	String timescapeuseroid = "";
	String [] fullArr = null;
	String userFullName = "";
	int count = 0;
	int countI = 0;
	int countIP =0;
	int countNI = 0;
	int countNMA = 0;
	double  noPercentI = 0.0;
	double  noPercent = 0.0;
	int tervmlCount = 0;
	int tervmlCountI = 0;
	int tervmlNMA = 0;

	areaCode = (String)request.getParameter("area");
	/* out.println("areaCode"+areaCode);
	out.println("areaCode"+timescapeUserOId);
	out.println("areaCode"+emailId); */
	session.setAttribute("myDeptCode",areaCode);
	reportUserNameHashArea.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
	reportUserNameHashArea.put("AREACODE",areaCode);
	reportUserNameHashArea.put("EMAILID",emailId);

	reportNameListArea =  ERVMController.reportAreaUserName(reportUserNameHashArea);

	if(reportNameListArea.size()>0){
	Hashtable fullNameHash = new Hashtable();
	for(int ii =0 ;ii< reportNameListArea.size();ii++){
		String [] tmpArr = (String[])reportNameListArea.get(ii);
		userId = tmpArr[0]+",";
		userArray +=userId+",";
	} 
		
		userArray = userArray.substring(0,userArray.length()-1);
		String arrUserList [] = userArray.split(",");
	
		Hashtable reportHash = new Hashtable();
		ArrayList rList = new ArrayList();
		reportHash.put("AREACODE",areaCode);
		reportHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
		reportHash.put("EMAILID",emailId);

		rList = ERVMController.reportAreaDataDisplay(reportHash);

		for(int kk =0; kk< arrUserList.length;kk++){
			userName = arrUserList[kk];
			count = 0;
			countI = 0;
			countIP =0;
			countNI = 0;
			countNMA = 0;
			  noPercentI = 0.0;
			  noPercent = 0.0;

			String bgColor        = "";
			int colorCnt = 0;
			fullNameHash.put("USERID",userName);
			fullNameList =  ERVMController.fullNameDisplay(fullNameHash);

			userFullName = "";
			for(int nn =0; nn< fullNameList.size();nn++){
				String userFull[] = (String[]) fullNameList.get(0);
				userFullName = userFull[0];
			}

			for(int mm =0; mm< rList.size();mm++){

				String tmpArr[] = (String [])rList.get(mm);
				
				timescapeuseroid= "";
				questions= "";
				userStatus="";
				questions =	 tmpArr[1];
				userStatus = tmpArr[2];
				timescapeuseroid = tmpArr[0];
				if(userName.contains(timescapeuseroid)){
				
					if(questions != "" ){
							 count++;
							 tervmlCount++;
					}
					if("I".equals(userStatus)){
							 countI++;
							 tervmlCountI++;
							
					}else if("IP".equals(userStatus) ){
							 countIP++;
					}else if("NI".equals(userStatus) ){
							 countNI++;
					}else if("NMA".equals(userStatus) ){
							 countNMA++;
							 tervmlNMA++;
					}
					//out.println(mm+"**"+count+ "=="+countI+ "=="+countIP+ "=="+countNMA+ "||");

					double countduble = count;
					double countIduble = countI;
					double countNMAduble = countNMA;
					noPercentI=((countIduble/(countduble-countNMAduble)))*100;
					
				}
			}
			if((!"".equals(userFullName) && userFullName != null)){
%>
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="col-md-2 col-sm-3 col-xs-12 customborder1"><%=userFullName%></div>
				<input type="hidden" name="userId<%=kk%>" id="userId<%=kk%>" value="<%=userName%>"  />
				<div class="col-md-2 col-sm-3 col-xs-12 customborder1" id = "recommendation" ><a  href="#" id="myLink" onclick="questionAdminHistoryArea(<%=kk%>)";><%=count%></a></div>
<%
					%>
<%            
            if ( noPercentI >= 60 || noPercentI == 0 ) {
%>  
				<div class="col-md-1 col-sm-3 col-xs-12 customborder1"><img src="../images/red.png" width="30" height="10"  /></div>
<%
               } else if (noPercentI < 20) {
%>
				<div class="col-md-1 col-sm-3 col-xs-12 customborder1"><img src="../images/green.png" width="30" height="10"  /></div>
<%                
                } else{
%>
				<div class="col-md-1 col-sm-3 col-xs-12 customborder1"><img src="../images/yellow.png" width="30" height="10"  /></div>
<%
                } 
 %>
				<input type="hidden" name="countI<%=kk%>" id="countI<%=kk%>" value="I"  />
				<input type="hidden" name="countNI<%=kk%>" id="countNI<%=kk%>" value="NI"  />
				<input type="hidden" name="countIP<%=kk%>" id="countIP<%=kk%>" value="IP"  />
				<input type="hidden" name="countNMA<%=kk%>" id="countNMA<%=kk%>" value="NMA"  />

				<div class="col-md-1 col-sm-3 col-xs-12 customborder1"><a href="#" id="" onclick="statusAdminHistoryI(<%=kk%>)"><%=countI%></a></div>
				<div class="col-md-2 col-sm-3 col-xs-12 customborder1"><a href="#" id="" onclick="statusAdminHistoryNI(<%=kk%>)"><%=countNI%></a></div>
				<div class="col-md-1 col-sm-3 col-xs-12 customborder1"><a href="#" id="" onclick="statusAdminHistoryIP(<%=kk%>)"><%=countIP%></a></div>
				<div class="col-md-2 col-sm-3 col-xs-12 customborder1"><a href="#" id="" onclick="statusAdminHistoryNMA(<%=kk%>)"><%=countNMA%></a></div>
				<div class="col-md-1 col-sm-3 col-xs-12 customborder1"><%=Math.round(noPercentI)%></div>
			</div>
<%			}
				
		}
		double tervmlcountduble = tervmlCount;
		double tervmlcountIduble = tervmlCountI;
		double tervmlcountNMAduble = tervmlNMA;
		double  tervmlnoPercentI = 0.0;
		tervmlnoPercentI = ((tervmlcountIduble/(tervmlcountduble-tervmlcountNMAduble)))*100;
		//out.println(tervmlnoPercentI);
%>
				<div id = "qustionsAreaShow"></div>
</div>		
<div >		
<%            
            if ( tervmlnoPercentI > 80 ) {
%>  
				<div class="col-md-12 col-sm-12 col-xs-12"><br>Area:  <img src="../images/green.png" width="30" height="10"  /></div>
<%
               } else if (tervmlnoPercentI < 40) {
%>
				<div class="col-md-12 col-sm-12 col-xs-12"><br>Area:  <img src="../images/red.png" width="30" height="10"  /></div>
<%                
                } else{
%>
				<div class="col-md-12 col-sm-12 col-xs-12"><br>Area:  <img src="../images/yellow.png" width="30" height="10"  /></div>
<% } %>
</div>
<% } else { %>
		<div class="col-md-12 col-sm-12 col-xs-12 pad0">
			<center><h5>No Recommendation Available For this Area<h5><center>
		</div>
<% } %>
<input type= "hidden" id= "sizeReport" value="<%=reportNameListArea.size()%>"></input>
					