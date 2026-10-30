<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar,com.bccl.util.Utility" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.workflows.commonUtility.AppSignature"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<%@ page errorPage="../includes/error.jsp" %>  
<% 
    response.setHeader("Cache-Control","no-cache"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", 0); 
%>
<!DOCTYPE >
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Edit Proposal Form</title>	
        <link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
        <link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
  	    <link href="../css/capex.css" rel="stylesheet"/>	
        <link href="../css/select2.min.css" rel="stylesheet">
        <link href="../css/bootstrap-multiselect.css" rel="stylesheet">
        <link href="../css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />

        <style>
        .select2-container .select2-selection--single {
            box-sizing: border-box;
            cursor: pointer;
            display: block;
            height: 34px;		
        }
        .fa.fa-sig:after {
            position: absolute;
            content: "/";
            color: GREY;
            font-weight: 700;
            font-size: 1.2em;
            left: 7px;
            top: -1px;
            padding:0;
            margin:0;
        }
        </style>	
     <script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../jscript/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../jscript/select2.min.js"></script>	
	<script src="../jscript/bootstrap-maxlength.min.js"></script>
	<script src="../jscript/capex.js"></script>	
    </head>
<%
        Hashtable ht = new Hashtable();           
        String proposalNo =  request.getParameter("proposalNo");
        String remark =  request.getParameter("remark");
        String remarkStatus =  request.getParameter("remarkStatus");     

        ht.put("APPLICATION_NAME", "capex");
        ht.put("DOCUMENTOID", "DOC1005");
        ht.put("EMAILID", emailId);
        ht.put("REQUESTOID",proposalNo);
        ht.put("REMARK",remark);
        ht.put("REMARKSTATUS",remarkStatus);
     //   out.println ( proposalNo + " : " + remark + " :  " +remarkStatus + " : "+ emailId);
        Boolean result  = capexHeaderController.updateRequest(ht);

   //    out.println(" result " + result);
        String message ="";
	
if (result != true){
         message = "<h5>Some error occured while processing your request."
					+"<br> Click <a href=\"javascript:history.back();\">here</a> to update the Request.</h5>";	

    }else{
         message = "<h5>The proposal has been updated successfully."
					+"<br> Click <a href=\"../view/listOfPendingProposalRequest.jsp\">here</a> to view the proposals.</h5>";
	}
 
%>

<body>

<div class="container ">
	<div class="row ">
	<div class="col-xs-2"></div>
		<div class="col-xs-8 bs-example  ">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
                    
					<i class="fa fa-th"></i>  <strong>View Proposal Form</strong>
					</div>			
					</div>
               
					<div class="portlet-body">
						<form class="form-horizontal" role="form" id="demo_form" name ="create" method="post">
						<div class="form-body">
							<div class="row " style="margin-top:0px;margin-bottom:0;">
								<table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F2F2"> 
									<tr>
										<td align="left" ><img src="../images/spacer.gif" width="1" height="40"></td>
									</tr>
									<tr>
										<td align="center" class="normal" valign = "top" ><%=message%></td>
									</tr>
								</table>
							</div>
						</div>
                        </form>
					</div>
              
				</div>
			</div>
		</div>
	<div class="col-xs-2"></div>
	</div>
</div>
<footer class="footer ">
	<div class="container text-center">
		<p style="margin-bottom:2px; margin-left:80px;" class="ex ">Copyright @ 2016 Bennett, Coleman & Co. Ltd. All rights reserved. </p>
	</div>
</footer>				

</body>
</html>
