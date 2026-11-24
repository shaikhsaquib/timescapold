<%--
 -- @(#) registrationCompanies.jsp - Saturday, October 04, 2008
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  Companies Drop-Down for New User Register Form 
 -- @author  -  Amit Umbarkar
 -- @version -  1.0
 -- 
 --%>
 <%
	//String exceptionList = "'JKL','VPL','PPL','EPHL','TPH','SJSL'";
	String exceptionList = "'*********'";
    String pipelineVertical ="";
    //String selected="";
    
    String selectedCompCode  = (String) session.getAttribute("selectedCompany");
	String sel1= selectedCompCode;
	ArrayList companyList;
	ArrayList accessList = domainObjectsWebController.checkAccess(timescapeUserOId);
	//sSystem.out.println(((String[])access.get(0))[0]);
	String access = ((String[])accessList.get(0))[0] ;


	if(access.equals("TRUE")){
	companyList = domainObjectsWebController.listCompanies1(exceptionList);	
	}else{
	companyList = domainObjectsWebController.getCompanies(timescapeUserOId);
	}
    System.out.println("selectedCompCode=="+selectedCompCode);
    //System.out.println("toid=="+timescapeUserOId);
	
%>
	
    <select name="company2" class="normal">
        <option value="0">Select a Company</option>

<%
    for(int ii=0 ; ii < companyList.size( ); ii++) {

		String company[ ] = (String[ ]) companyList.get(ii); 
		selectedCompCode = company[1]; 
		
		
%>
		 <option value="<%=company[1]%>" <%=(sel1.equals(selectedCompCode)?"selected":"")%>><%=company[0]%></option>
<%
	}
%>
	</select>