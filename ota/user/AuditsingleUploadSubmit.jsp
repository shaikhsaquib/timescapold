
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%@ page import="java.util.Hashtable,java.util.ArrayList" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>

<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="OtaController" class="com.bccl.ota.web.controllerbeans.OtaWebController"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>OTA</title>
    <link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
    <link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
    <link href="../css/ota.css" rel="stylesheet"/>  
    <script src="../bootstrap-3.3.2-dist/js/jquery-ui.js"></script>
    <script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    <script Language="JavaScript" src="../js/ota.js"></script> 
</head>
<body>
<%
    String message = "";
    Hashtable singleHash = new Hashtable();
    ArrayList aList = new ArrayList();
    boolean singleStatus = false;

    // Collect arrays of parameters
    String[] areas = request.getParameterValues("area[]");
    String[] recommendations = request.getParameterValues("recommendation[]");
    String[] severities = request.getParameterValues("severety[]");
    String[] mangCommentsArr = request.getParameterValues("mangComments[]");
    String[] userResps = request.getParameterValues("userResp[]");
    String[] superResps = request.getParameterValues("superResp[]");
    String[] targetDates = request.getParameterValues("targetDate[]");
    String[] years = request.getParameterValues("year[]");
    String[] depts = request.getParameterValues("dept[]");
    String[] entities = request.getParameterValues("entity[]");
    String[] observationtitles = request.getParameterValues("observationtitle[]");
    String[] observations = request.getParameterValues("observation[]");
	
	/*System.out.println("area=" + area);
System.out.println("recommendation=" + recommendation);
System.out.println("severety=" + severety);
System.out.println("mangComments=" + mangComments);
System.out.println("userResp=" + userResp);
System.out.println("superResp=" + superResp);
System.out.println("targetDate=" + targetDate);
System.out.println("year=" + year);
System.out.println("dept=" + dept);
System.out.println("entity=" + entity);
System.out.println("observationtitle=" + observationtitle);
System.out.println("observation=" + observation);*/

 
System.out.println("===== JSP DEBUG START =====");

if (areas != null) {
    for (int i = 0; i < areas.length; i++) {
        System.out.println("Row " + i +
            " | area=" + areas[i] +
            " | recommendation=" + (recommendations != null && i < recommendations.length ? recommendations[i] : "") +
            " | severity=" + (severities != null && i < severities.length ? severities[i] : "") +
            " | user=" + (userResps != null && i < userResps.length ? userResps[i] : "") +
			" | targetDate=" + (targetDates != null && i < targetDates.length ? targetDates[i] : "")
			
        );
    }
}
System.out.println("===== JSP DEBUG END =====");
    if (areas != null) {
        for (int i = 0; i < areas.length; i++) {
            String[] qList = {
                areas[i],
                recommendations != null && i < recommendations.length ? recommendations[i] : "",
                mangCommentsArr != null && i < mangCommentsArr.length ? mangCommentsArr[i] : "",
                severities != null && i < severities.length ? severities[i] : "",
                userResps != null && i < userResps.length ? userResps[i] : "",
                superResps != null && i < superResps.length ? superResps[i] : "",
                targetDates != null && i < targetDates.length ? targetDates[i] : "",
                years != null && i < years.length ? years[i] : "",
                depts != null && i < depts.length ? depts[i] : "",
                entities != null && i < entities.length ? entities[i] : "",
                observations != null && i < observations.length ? observations[i] : "",
                observationtitles != null && i < observationtitles.length ? observationtitles[i] : ""
            };
            aList.add(qList);
        }
    }

    // Put into hash and call controller
    singleHash.put("createdByEmailId", emailId);
    singleHash.put("Single", aList);
    singleHash.put("TIMESCAPEUSEROID", timescapeUserOId + "");

    singleStatus = OtaController.singleUpload(singleHash);

    if(singleStatus){                           
        message = "<h5>Recommendation Uploaded Successfully"
        +"<br> Click <a href=\"../user/audit_upload.jsp\">here</a> to create the Request.</h5>";
    } else {
        message = "<h5>Some error occurred while processing request."
        +"<br> Click <a href=\"javascript:history.back();\">here</a> to create the Request.</h5>";
    }
%>

<div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0;">
    <img src="../images/header.png" style="width: 100%;">
</div>
<div class="container">
    <div class="col-md-12" style="margin-top: 4%;">
        <div class="col-md-8 col-md-offset-2 well">
            <div class="col-md-12" style="background: #44bfe5; padding: 1% 2%; font-size: 1.2em; color: #fff;">
                <i class="fa fa-th"></i><strong>&nbsp;&nbsp;Submit Request</strong>
            </div>
            <div class="col-md-12" style="background: #fff;">
                <form role="form" id="demo_form" name="frmRequestSubmit" method="post">
                    <div class="text-center" style="margin: 2% 0%;">
                        <p><%=message%></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>              
</body> 
</html>
