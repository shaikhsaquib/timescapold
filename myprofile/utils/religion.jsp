<jsp:useBean id="coreWebController" class="com.bccl.core.web.controller.CoreWebController" />
<%@page import="java.util.ArrayList" %>

<%
 String dropDownStyle ="small"; 
%>



<%
ArrayList religionArr = new ArrayList( );

String selectedOption = request.getParameter("selectedOption");
String ifSelected = "";

if (selectedOption == null) {

    selectedOption = "";
}

%>

<%

religionArr = coreWebController.getReligion( );
		

%>
    <select name="religion" class="<%=dropDownStyle%>">
        <option value="0" selected>Religion</option>

<%
for(int ii=0 ; ii< religionArr.size( ); ii++)
{
	String religion[ ] = (String[ ]) religionArr.get(ii);
    if ( (religion[0].equalsIgnoreCase(selectedOption)) || (religion[2].equalsIgnoreCase(selectedOption))  || (religion[1].equalsIgnoreCase(selectedOption))) {

        ifSelected = "SELECTED";
    }else{
        ifSelected = "";
    }


%>
        <option value="<%=religion[0]%>" <%=ifSelected%>><%=religion[2]%></option>
<%
}
%>
</select>