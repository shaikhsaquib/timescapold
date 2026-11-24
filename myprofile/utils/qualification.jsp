<%@page import="com.bccl.profile.web.util.Constants"%>
<jsp:useBean id="coreWebController" class="com.bccl.core.web.controller.CoreWebController" />

<%@page import="java.util.ArrayList" %>

<%
	String index = (String)request.getParameter("index");
%>

<script Language="JavaScript">
	function disable( ){
		expr = "document.frmQualification.existingQualification";
		eval(expr).blur( );
	}


	function validate(index){

		var frmObj = document.frmQualification;

		if(frmObj.qualification.selectedIndex == -1 || frmObj.qualification.selectedIndex == 0){
			alert("Please select a Qualification !");
			frmObj.qualification.selectedIndex = 0;
			frmObj.qualification.focus( );
			return;
		}

		var selectedItem = frmObj.qualification.options[frmObj.qualification.selectedIndex].value;
		if(selectedItem == "0" || selectedItem == ""){
			alert("Please select a Qualification !");
			frmObj.qualification.focus( );
			return;
		}

		self.opener.document.forms[0].qualification[index].value = "";
		self.opener.document.forms[0].qualification[index].value = frmObj.qualification.options[frmObj.qualification.selectedIndex].text;
		self.opener.document.forms[0].qualificationOID[index].value = selectedItem;
		self.close();
		self.opener.focus();
	}
</script>

<%
    String selectedOption = request.getParameter("selectedOption");

    if (selectedOption == null) {

        selectedOption = "";
    }


	// This variable decides which value is selected in the dropdown
	String isSelected = "";

	ArrayList qualificationArr = new ArrayList( );
	qualificationArr = coreWebController.getQualification( );
%>

<html>

	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload = "window.focus()">
		<form name  = "frmQualification" method = "post">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

					<tr>
						<td class="white" align="left" height = "30" bgcolor="#406890" colspan = "2">
							&nbsp;Qualification
						</td>

						<td class="white" align="right" height = "30" bgcolor="#406890">
							<a href="javascript:window.close( )"><img src="../images/close_sym.gif" border="0"></a>&nbsp;
						</td>
					</tr>

					<tr>
						<td colspan = "3" height = "10" class="bold" align="left">&nbsp;Note : <span class="rednormal">Select a Qualification level that matches the existing value</span>&nbsp;</td>
					</tr>

					<tr>
						<td colspan = "3" height = "10">&nbsp;</td>
					</tr>

					<tr>
						<td class = "small" align="right" width="25%" valign = "top">
							Select a Qualification
						</td>

						<td class = "bold" align = "center" width="5%" valign = "top">:</td>

						<td class="small" width="70%" align="left">
					        <select name="qualification" class="small" size = "7">
								<option value="0" "SELECTED">Select A Qualification</option>

								<%
								for(int ii=0 ; ii< qualificationArr.size( ); ii++)
								{
									String qualification[ ] = (String[ ]) qualificationArr.get(ii);

									isSelected = "";

									// Check if an existing Qualification from the Masters is selected
									if(selectedOption.equalsIgnoreCase(qualification[2])){
										isSelected = "SELECTED";
									}
								%>
										<option value="<%=qualification[1]%>"<%=isSelected%>><%=qualification[2]%></option>
								<%
									}
								%>

								</select>
						</td>
					</tr>

					<tr>
						<td class="normal" colspan="3" align="center" height="10">
							&nbsp;
						</td>
					</tr>

					<tr>
						<td class = "small" width="25%" align="right">&nbsp;Existing Value</td>

						<td class = "bold" align = "center" width="5%">:&nbsp;</td>

						<td class = "small" width="70%" align="left">
							<input type="text "class="small" size = "30" name = "existingQualification" value = "<%=selectedOption%>" onFocus="javascript:disable( )">
						</td>
					</tr>

					<tr>
						<td class="normal" colspan="3" align="center" height="30">
							&nbsp;
						</td>
					</tr>

					<tr>
						<td class="normal" colspan="3" align="center">
							<a href="javascript:validate(<%=index%>)"><img src="../images/but_submit.gif" border="0"></a>
							<a href="javascript:window.close( )"><img src="../images/but_close.gif" border="0"></a>
						</td>
					</tr>

				</table>
		</form>
	</body>
</html>