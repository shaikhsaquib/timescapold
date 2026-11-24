<jsp:useBean id="coreWebController" class="com.bccl.core.web.controller.CoreWebController" />

<%@page import="java.util.ArrayList" %>
 <%
 String dropDownStyle ="small"; 
%>



<%
ArrayList designationArr = new ArrayList( );
String selectedOption = request.getParameter("selectedOption");
String ifSelected = "";

if (selectedOption == null) {

    selectedOption = "";
}


%>

<%

designationArr = coreWebController.getDesignation( );
		

%>
    <select name="promotedDesignation" class="<%=dropDownStyle%>">
        <option value="0" selected> Designation</option>

<%
for(int ii=0 ; ii< designationArr.size( ); ii++)
{
	String designation[ ] = (String[ ]) designationArr.get(ii);
    if ( (designation[0].equalsIgnoreCase(selectedOption)) || (designation[2].equalsIgnoreCase(selectedOption)) ) {

        ifSelected = "SELECTED";
    }else{
        ifSelected = "";
    }

%>
        <option value="<%=designation[2]%>" <%=ifSelected%>><%=designation[2]%></option>
<%
}
%>
	</select>