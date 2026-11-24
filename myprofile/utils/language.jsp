<jsp:useBean id="coreWebController" class="com.bccl.core.web.controller.CoreWebController" />
<%@page import="java.util.ArrayList" %>

<%
	String dropDownStyle ="small"; 
%>



<%
ArrayList languageArr = new ArrayList( );
String selectedOption = request.getParameter("selectedOption");
String ifSelected = "";

if (selectedOption == null) {

    selectedOption = "";
}


%>

<%

languageArr = coreWebController.getLanguage( );
		

%>
    <select name="language" class="<%=dropDownStyle%>">
        <option value="0" selected> Language</option>

<%
for(int ii=0 ; ii< languageArr.size( ); ii++)
{
	String language[ ] = (String[ ]) languageArr.get(ii);
    if ( (language[0].equalsIgnoreCase(selectedOption)) || (language[2].equalsIgnoreCase(selectedOption)) || (language[1].equalsIgnoreCase(selectedOption)) ) {
        ifSelected = "SELECTED";
    }else{
        ifSelected = "";
    }

%>
        <option value="<%=language[0]%>" <%=ifSelected%>><%=language[2]%></option>
<%
}
%>
	</select>