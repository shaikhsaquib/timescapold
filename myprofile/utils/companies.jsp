<%@page import="java.util.Iterator, java.util.ArrayList" %>


<%
ArrayList companies = new ArrayList( );
String dropDownStyle = "small";
%>

<%
companies = listDomainObjectsController.getCompanyList( );

%>
				<select name="companies" class="<%=dropDownStyle%>">
					<option value="0" selected>Select A Company</option>
<%
for(int ii=0 ; ii< companies.size( ); ii++)
{
	String company[ ] = (String[ ]) companies.get(ii);
%>
					<option value="<%=company[0]%>"><%=company[2]%></option>
<%
}
%>
				</select>