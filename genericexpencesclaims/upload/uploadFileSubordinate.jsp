<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page errorPage="../common/errorPage.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=10"/>
		<title>Communication Claim - Upload</title>
		<!-- <link rel="stylesheet" href="../style/bootstrap-3.3.2-dist/css/bootstrap.min.css"> -->
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		<script Language="JavaScript" src="../jscripts/createRequest.js"></script>  
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<form method="post" action="#" name="frmUploadFileSubordinate" enctype="multipart/form-data">
		<table width = "100%" border = "0"  align="center" cellspacing="0" cellpadding="0">
			<tr><td></td></tr>
			<tr><td>
				<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
					<!-- <tr><td><img src="../images/communicationClaimHeader.gif" style="width: 100%;"></td></tr> -->
					<tr><td valign = "top">
					<table width="100%" cellPadding=0 cellSpacing=0 border="0">
						<tr>    
					      <td height="20" bgcolor="#E7EAEF" class="budgetMenuBG">UPLOAD FILE<img src="../images/spacer.gif" width="2" height="1" /></td>
					    </tr>
					    <tr>
					      <td colSpan=3><img height=2 src="../images/spacer.gif" width=1></td>
					    </tr>
					    <tr>
					      <td class="bold" colSpan=3>
					        <table width="100%" border="0" cellpadding=0 cellspacing=0 >
					        	<%
									String attachment	= (String)request.getParameter("attachment");
									String str			= (String)request.getParameter("str");
								%>
					            <tr>
					               <td colspan = "3" height = "20"> &nbsp;</td>
					            </tr>             
								<tr>
									<td class = "bold" width="30%">&nbsp;Select the file</td>
									<td class = "bold" width="5%">:</td>  
									<td class = "bold" width="65%" valign = "top"> 
										<input type="file" id="uploadFile" class = "bold" name="uploadFile" value="">
									</td>
					            </tr>
					            <tr>
					            	<td height = "20"> &nbsp;</td>
									<td height = "20"> &nbsp;</td>
									<td height = "20">Allowed file types: .jpg, .png, .jpeg, .pdf
												<br>File size not more than 10 MB.
												<br>Do not upload encrypted / password protected files
									</td>
					            </tr>
								<tr>
									<td colspan="100%">					
										<table width="300" border="0" align="left" cellpadding="0" cellspacing="5">							
											<td width='17%' align='center' class = "bold"><label id='uploadlabel'></label></td>
										</table>
									</td>
								</tr> 
					            <tr>
					                 <td colspan = "100%" height = "20" align = "center" class = "bold">
					                    <!-- <input type ="submit" value="Upload" onclick="validateFieldsSubordinate('<%//=attachment%>','<%//=str%>');" class="btn-danger" style="font-size: 16px; margin: 6% 0%; padding: 0.5% 1.5%; border-radius: 6px;" /> -->
										<input type="button" class="button white" name="Upload" value="Upload" style="height:25px;" onclick="validateFieldsSubordinate('<%=attachment%>','<%=str%>');">		
					                </td>
					            </tr>
					        </table>
							<input type = "hidden" name = "attachmentName" id = "attachmentName" value = "<%=attachment%>" />
							<input type = "hidden" name = "requestStr" id = "requestStr" value = "<%=str%>" />
							<% session.setAttribute("attachmentName", attachment);%>
							<% session.setAttribute("requestStr", str);%>
					      </td>
					    </tr>
					</table>
					</td></tr>
					<tr>
			            <td>
			                <img src="../images/spacer.gif" width="1" height="10">
			            </td>
			        </tr>
		        </table>
		    </td></tr>
		    <tr><td></td></tr>
	    </table>
    </form>
	</body>
</html>