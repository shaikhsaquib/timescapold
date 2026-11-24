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

		var frmObj = document.frmUniversity;

		if(frmObj.university.selectedIndex == -1 || frmObj.university.selectedIndex == 0){
			alert("Please enter / select an University !");
			frmObj.university.selectedIndex = 0;
			frmObj.university.focus( );
			return;
		}


		var selectedItem = frmObj.university.options[frmObj.university.selectedIndex].value;

		var universityValue = "";


		if(selectedItem == "0" || selectedItem == ""){
			alert("Please enter / select an University !");
			frmObj.university.focus( );
			return;
		}

		if(selectedItem == "OTHERS"){
			otherUniversity = Trim(frmObj.otherUniversity.value);

			// Check the textbox for null
			stat = checkNull("University Name ", otherUniversity);
			if(!stat){
				frmObj.otherUniversity.focus( );
				return;
			}
			// Check the University Name for junk
			stat = checkJunk("University Name ", otherUniversity, junk);

			if(!stat){
				frmObj.otherUniversity.focus( );
				return;
			}

			// If data passed validations then send it back to the main form
			universityValue = otherUniversity;

		}else{
			universityValue = selectedItem
		}

		self.opener.document.forms[0].university[index].value = "";
		self.opener.document.forms[0].university[index].value = universityValue;
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

	ArrayList universityArr = new ArrayList( );
	universityArr = coreWebController.getUniversity( );
%>

<html>

	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload = "window.focus()">
		<form name  = "frmUniversity" method = "post">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td class="white" align="left" height = "30" bgcolor="#406890" colspan = "2">
							&nbsp;Universities
						</td>
						<td class="white" align="right" height = "30" bgcolor="#406890">
							<a href="javascript:window.close( )"><img src="../images/close_sym.gif" border="0"></a>&nbsp;
						</td>
					</tr>

					<tr>
						<td colspan = "3" height = "10">&nbsp;</td>
					</tr>

					<tr>
						<td class = "small" valign = "top" width="25%" align="right">&nbsp;Select a University</td>
						<td class = "bold" align = "center" valign = "top" width="5%">:&nbsp;</td>
						<td class="normal" align="left" width="70%">
							<select name="university" class="small" size="7" >
								<option value="0" "SELECTED">Select An University</option>
								<%
								for(int ii=0 ; ii< universityArr.size( ); ii++)
								{
									String university[ ] = (String[ ]) universityArr.get(ii);

										isSelected = "";

										// Check if an existing University from the Masters is selected
										if(selectedOption.equalsIgnoreCase(university[2])){
											selectedCount ++;
											isSelected = "SELECTED";
										}
								%>
										<option value="<%=university[2]%>"  <%=isSelected%>><%=university[2]%></option>
								<%
								}

								// If  none of the University matches the master then display the value of the University in Others
								if(selectedCount == 0){
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
						<td class = "small" width="25%" align="right">&nbsp;Others</td>
						<td class = "bold" align = "center" width="5%">:&nbsp;</td>
						<td class = "small" width="70%" align="left">
							<input type="text "class="small" size = "30" name = "otherUniversity" value = "<%=othersValue%>" maxlength = "95">
						</td>
					</tr>

					<tr>
						<td class="normal" colspan="3" align="center">
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