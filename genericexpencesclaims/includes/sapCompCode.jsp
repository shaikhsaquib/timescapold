<jsp:useBean id="listDomainObjectsController" class="com.bccl.enterprise.web.controller.DomainObjectsWebController"/>
<%
Hashtable sapCompCode		 = new Hashtable();
ArrayList companiesList		 = new ArrayList();
Hashtable criteriaHash		 = new Hashtable();

companiesList = listDomainObjectsController.listCompanies(criteriaHash);

for(int jj=0; jj< companiesList.size(); jj++){

	String tmpArr[] = (String[])companiesList.get(jj);

	sapCompCode.put(tmpArr[0],tmpArr[9]);

}
%>