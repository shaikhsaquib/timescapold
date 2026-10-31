<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Audit Recommendations</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script Language="JavaScript" src="../js/ervm.js"></script> 

  <style>
	body{
		font-family: Calibri;
		font-size: 16px;
		color: #000;
	}
	
	table th, td{
		text-align: center;
	}

	.col-md-12, .col-sm-12, .col-xs-12{
		
		padding: 0;
		
	}

	.col-md-6, .col-sm-6, .col-xs-6{
		margin: 1% 0%;
		background: #FBFBFB;
	}

	.form-control{
		color: #000;
	}

	
  </style>
</head>
<body>
 <%
 String attachment	= (String)request.getParameter("attachment");
 //out.println("attachment"+attachment);
	String str			= (String)request.getParameter("str");
	String compVal			= (String)request.getParameter("compVal");
 %>
	<div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0;">
		<img src="../images/header.png" style="width: 100%;">
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="col-md-3 col-sm-3"></div>
		<div class="col-md-6 col-sm-6 col-xs-12" style="margin: 2% 0%;">
		<form method="post" action= "#" >
			
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="col-md-6 col-sm-6 col-xs-6"  style="font-weight: bold; text-align: right;">
					Attachment
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<input type="file" id="uploadFile" name ="uploadFile" >
				</div>
			</div>
			<div class="col-md-12 col-sm-12 col-xs-12">
				<center><input class="btn-danger" type="submit" style="font-size: 16px; margin: 6% 0%; padding: 0.5% 1.5%; border-radius: 6px;"  onclick = "validateAttachment('<%=attachment%>','<%=str%>')"></center>
			</div>
		</div>
		</form>
		</div>
		<!-- Hidden Fields -->
		<input type = "hidden" name = "attachmentName" id = "attachmentName" value = "<%=attachment%>" >
		<input type = "hidden" name = "requestStr" id = "requestStr" value = "<%=str%>" >
		<input type="hidden" id="compVal" value="<%=compVal%>"/>
		<% session.setAttribute("attachmentName",attachment);%>
		<% session.setAttribute("requestStr",str);%>
		<% session.setAttribute("comp",compVal);%>

		<!-- <input type="submit"> -->
	</body>
</html>
