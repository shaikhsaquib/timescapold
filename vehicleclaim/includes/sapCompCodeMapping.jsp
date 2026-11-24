
<%
	Hashtable sapCompCode		 = new Hashtable();
	Hashtable criteriaHash		 = new Hashtable();
	ArrayList companiesList		 = new ArrayList();

	companiesList = listDomainObjectsController.listCompanies(criteriaHash);

	for(int jj=0; jj< companiesList.size(); jj++){

		String tmpArr[] = (String[])companiesList.get(jj);

		sapCompCode.put(tmpArr[0],tmpArr[9]);

		}
	
%>