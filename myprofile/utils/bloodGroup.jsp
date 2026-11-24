<jsp:useBean id="coreWebController" class="com.bccl.core.web.controller.CoreWebController" />

<%@page import="java.util.ArrayList" %>
 <%
 String dropDownStyle ="small"; 
%>



<%
ArrayList bloodGroupArr = new ArrayList( );
String selectedOption = request.getParameter("selectedOption").trim();
String ifSelected = "";

if (selectedOption == null) {

    selectedOption = "";
}


%>

<%

bloodGroupArr = coreWebController.getBloodGroup( );
		

%>
    <select name="bloodGroup" class="<%=dropDownStyle%>">
        <option value="0" selected>Blood Group</option>

<%
for(int ii=0 ; ii< bloodGroupArr.size( ); ii++)
{
	String bloodGroup[ ] = (String[ ]) bloodGroupArr.get(ii);
    if ( (bloodGroup[0].equalsIgnoreCase(selectedOption)) || (bloodGroup[2].equalsIgnoreCase(selectedOption)) || (bloodGroup[1].equalsIgnoreCase(selectedOption))) {

        ifSelected = "SELECTED";
    }else{
        ifSelected = "";
    }

%>
        <option value="<%=bloodGroup[0]%>" <%=ifSelected%>><%=bloodGroup[2]%></option>
<%
}
%>
	</select>