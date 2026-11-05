<select name="companyCode" class="normal">
    <option value="0" selected>Select A Company</option>
<%
    for(int ii=0 ; ii< companyList .size( ); ii++){
        String company[ ] = (String[ ]) companyList .get(ii);
        String selected="";
        if(company[0].equalsIgnoreCase(compCode)){
            selected= "selected";
        }

%>
    <option value="<%=company[0]%>" <%=selected%>><%=company[0]%> - <%=company[1]%></option>
<%
    }
%>
</select>