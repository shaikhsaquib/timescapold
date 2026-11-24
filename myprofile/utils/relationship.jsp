<%@page import="java.util.ArrayList" %>
 <%
 String dropDownStyle ="small"; 
%>



<%
ArrayList relationshipArr = new ArrayList( );

String selectedOption = request.getParameter("selectedOption");
String ifSelected = "";

if (selectedOption == null) {

    selectedOption = "";
}

%>

<%

relationshipArr = coreWebController.getRelationship( );
		

%>
    <select name="relationship" class="normal">
        <option value="0" selected> Relationship</option>

<%
for(int ii=0 ; ii< relationshipArr.size( ); ii++)
{
	String relationship[ ] = (String[ ]) relationshipArr.get(ii);
    if ( (relationship[0].equalsIgnoreCase(selectedOption)) || (relationship[2].equalsIgnoreCase(selectedOption)) ) {

        ifSelected = "SELECTED";
    }else{
        ifSelected = "";
    }

%>
        <option value="<%=relationship[0]%>" <%=ifSelected%>><%=relationship[2]%></option>
<%
}
%>
	</select>