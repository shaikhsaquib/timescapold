

<select name="companyCode" class="normal">
<%
    for(int ii=0 ; ii< companyList.size( ); ii++){
        String selected="";
        String company[] = (String[]) companyList.get(ii);	
        if(company[0].equalsIgnoreCase(compCode)){
            selected= "selected";
        }
%>
    <option value="<%=company[0]%>" <%=selected%>><%=company[0]%> - <%=company[1]%></option>
<%
    }			
%>
</select>