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
	String exceptionList = "'-'";
    ArrayList companyList = domainObjectsWebController.listCompanies(exceptionList);
	
%>
	
    <select name="company2" class="normal" onChange="showDepartments();">
        <option value="0" selected>Select a Company</option>

<%
    for(int ii=0 ; ii < companyList.size( ); ii++) {

        String company[ ] = (String[ ]) companyList.get(ii);
		//out.println(company[1]);

		if(!(company[3].equals("1013|TPHL")||company[3].equals("1014|EPHL")||company[3].equals("1015|PPL"))){
%>
        <option value="<%=company[3]%>"><%=company[1]%></option>
<%
		}
	}
%>
	</select>
