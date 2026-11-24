<%@page import="java.util.Iterator, java.util.ArrayList" %>

<jsp:useBean id="listDomainObjectsController" class="com.bccl.domain.web.controllerbeans.ListDomainObjectsController" />

<%
String selectedOption = (String) request.getParameter("selectedOption");
ArrayList departments = new ArrayList( );
String dropDownStyle = "small";
String isSelected = "";
boolean optionSelected = false;
%>

<%
	departments = listDomainObjectsController.getDepartments( );
    if (selectedOption == null) {

        selectedOption = "";
    }

%>


	<select name="departments" class="<%=dropDownStyle%>">
		<option value="0" selected>Select a Department</option>

		<%
			for(int ii=0 ; ii< departments.size( ); ii++)
			{
				String department[ ] = (String[ ]) departments.get(ii);

				if ( (department[0].equalsIgnoreCase(selectedOption)) || (department[1].equalsIgnoreCase(selectedOption))) {

					isSelected = "SELECTED";
					optionSelected = true;
				}else{
					isSelected = "";
				}
		%>
							<option value="<%=department[0]%>" <%=isSelected%>><%=department[1]%></option>
		<%
			}
		%>
	</select>