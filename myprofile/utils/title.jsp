<%@page import="java.util.ArrayList" %>
<jsp:useBean id="coreWebController" class="com.bccl.core.web.controller.CoreWebController" />
 <%
 String dropDownStyle ="small"; 
%>



<%
ArrayList titleArr = new ArrayList( );

String selectedOption = request.getParameter("selectedOption");
String isSelected = "";

if (selectedOption == null) {

    selectedOption = "";
}

titleArr = coreWebController.getTitle( );
		

%>
    <select name="title" class="<%=dropDownStyle%>">
        <option value="0" selected> Title</option>

<%

for(int ii=0 ; ii< titleArr.size( ); ii++)
{
	String strTitle[ ] = (String[ ]) titleArr.get(ii);
    if ( (strTitle[0].equalsIgnoreCase(selectedOption)) || (strTitle[2].equalsIgnoreCase(selectedOption)) ) {

        isSelected = "SELECTED";
    }else{
        isSelected = "";
    }
%>
        <option value="<%=strTitle[0]%>" <%=isSelected%> ><%=strTitle[2]%></option>
<%
}
%>
	</select>