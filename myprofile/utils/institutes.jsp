<%@page import="com.bccl.profile.web.util.Constants"%>
<jsp:useBean id="coreWebController" class="com.bccl.core.web.controller.CoreWebController" />

<%@page import="java.util.ArrayList" %>

<%
	String index = (String)request.getParameter("index");
%>

<script Language="JavaScript" src="<%=Constants.JSCRIPTS_PATH%>util.js"></script>
<script Language="JavaScript">
	function validate(index){

		var junk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";

		var frmObj = document.frmInstitutes;

		if(frmObj.institute.selectedIndex == -1 || frmObj.institute.selectedIndex == 0){
			alert("Please enter / select an Institute !");
			frmObj.institute.selectedIndex = 0;
			frmObj.institute.focus( );
			return;
		}


		var selectedItem = frmObj.institute.options[frmObj.institute.selectedIndex].value;

		var instituteValue = "";

		if(selectedItem == "0"){
			alert("Please enter / select an Institute !");
			frmObj.institute.focus( );
			return;
		}

		if(selectedItem == "OTHERS"){

			otherInstitute = Trim(frmObj.otherInstitute.value);

			// Check the Institute textbox for null

			stat = checkNull("Institute ", otherInstitute);
			if(!stat){
				frmObj.otherInstitute.focus( );
				return;
			}
			// Check the Institute for junk
			stat = checkJunk("Institute ", otherInstitute, junk);

			if(!stat){
				frmObj.otherInstitute.focus( );
				return;
			}

			// If data passed validations then send it back to the main form
			instituteValue = otherInstitute;

		}else{
			instituteValue = selectedItem
		}
		self.opener.document.forms[0].institute[index].value = "";
		self.opener.document.forms[0].institute[index].value = instituteValue;
		self.close();
		self.opener.focus();

	}
</script>

<%
    /**
    	Step 1. get the selected option from the drop-wdown
    */
    String selectedOption = request.getParameter("selectedOption");
    if (selectedOption == null) {

        selectedOption = "";
    }


    // This variable decides the value of the "others" textbox
    String othersValue = "";

	// This variable decides which value is selected in the dropdown
	String isSelected = "";

	// This variable provides the count of items selected from the dropdown
	int selectedCount = 0;

 	ArrayList instituteArr = new ArrayList( );
	instituteArr = coreWebController.getInstitute( );
%>

<html>

	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload = "window.focus()">
		<form name  = "frmInstitutes" method = "post">

				<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td class="white" align="left" height = "30" bgcolor="#406890" colspan = "2">
							&nbsp;Institutes
						</td>
						<td class="white" align="right" height = "30" bgcolor="#406890">
							<a href="javascript:window.close( )"><img src="../images/close_sym.gif" border="0"></a>&nbsp;
						</td>
					</tr>

					<tr>
						<td colspan = "3" height = "10">&nbsp;</td>
					</tr>

					<tr>
						<td class = "small" valign = "top" width="20%" align="right">&nbsp;Select an Institute</td>

						<td class = "bold" align = "center" valign = "top" width="5%">:&nbsp;</td>

						<td class="normal" align="left" width="75%">
					        <select name="institute" class="small" size="7">
						        <option value="0" "SELECTED">Select An Institute</option>

								<%
									for(int ii=0 ; ii< instituteArr.size( ); ii++)
									{
										String institute[ ] = (String[ ]) instituteArr.get(ii);

										isSelected = "";

										// Check if an existing Institue from the Masters is selected
										if(selectedOption.equalsIgnoreCase(institute[2])){
											isSelected = "SELECTED";
											selectedCount ++;
										}
								%>
										<option value="<%=institute[2]%>"  <%=isSelected%>><%=institute[2]%></option>
								<%
									}

									// If  none of the Institutes matches the master then display the value of the Institute in Others
									if(selectedCount == 0) {
										isSelected = "SELECTED";
										othersValue = selectedOption;
									}else{
										isSelected = "";
									}
								%>
									<option value="OTHERS" <%=isSelected%>>Others: Please Specify</option>
								</select>
						</td>
					</tr>

					<tr>
						<td colspan = "3" height = "10">&nbsp;</td>
					</tr>

					<tr>
						<td class = "small" width="20%" align="right">&nbsp;Others</td>

						<td class = "bold" align = "center" width="5%">:&nbsp;</td>

						<td class = "small" width="75%" align="left">
							<input type="text "class="small" size = "30" name = "otherInstitute" value = "<%=othersValue%>" maxlength = "95">
						</td>
					</tr>

					<tr>
						<td class="normal" colspan="3" align="center">&nbsp;</td>
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