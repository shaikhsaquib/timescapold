<%@page import="java.util.ArrayList" %>
 <%
 String dropDownStyle ="small"; 
%>



<%
ArrayList industryArr = new ArrayList( );
String selectedOption = request.getParameter("selectedOption");
String ifSelected = "";

if (selectedOption == null) {

    selectedOption = "";
}


%>

<%

industryArr = coreWebController.getIndustryList( );
		

%>
    <select name="industry" class="<%=dropDownStyle%>">
        <option value="0" selected> Industry</option>

<%
for(int ii=0 ; ii< industryArr.size( ); ii++)
{
	String industry[ ] = (String[ ]) industryArr.get(ii);
    if ( (industry[0].equalsIgnoreCase(selectedOption)) || (industry[2].equalsIgnoreCase(selectedOption)) ) {

        ifSelected = "SELECTED";
    }else{
        ifSelected = "";
    }


%>
        <option value="<%=industry[0]%>" <%=ifSelected%>><%=industry[1]%></option>
<%
}
%>
	</select>