<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<%
			
			String code = (String)request.getParameter("code");
			String compName = (String)request.getParameter("compName");
			String companyCode = (String)request.getParameter("companyCode");
			compName = compName.replace("amp;","&");
			String branchCode = code.substring(0,code.indexOf("|"));
			String locationCode = code.substring(code.indexOf("|")+1);
			ArrayList addressDetails = new ArrayList();
			
			addressDetails = businessCardUserWebController.view(branchCode,compName,locationCode,companyCode);
%>
            <select name  = "address" class="small">
<%
			for (int ii=0; ii<addressDetails.size(); ii++){
				
				String address[] = (String[])addressDetails.get(ii);
				if(address[5].equals(locationCode)){
%>
				<option value = "<%=address[4]%>|<%=address[0]%>|<%=address[1]%>|<%=address[5]%>" SELECTED><%=address[0]%></option>
<%
			}else{
%>
				<option value = "<%=address[4]%>|<%=address[0]%>|<%=address[1]%>|<%=address[5]%>"><%=address[0]%></option>
<%
			}
		}
%>
				</select><img src="../images/tickmark.gif" width="13" height="13"/>
