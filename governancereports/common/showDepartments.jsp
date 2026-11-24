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
	 String selectedCompCode1  = (String) session.getAttribute("selectedCompany");
	 
	ArrayList deptList = new ArrayList();
	ArrayList accessList1 = domainObjectsWebController.checkAccess(timescapeUserOId);
	//System.out.println(((String[])access.get(0))[0]);
	String access1 = ((String[])accessList1.get(0))[0] ;


	if(access1.equals("TRUE")){

		deptList = domainObjectsWebController.getDeptList("1000");

	}else{

		deptList = domainObjectsWebController.getDeptList("1000",timescapeUserOId);

	}
	 String dept1  = (String) session.getAttribute("department");
	 

    //System.out.println("dept1=="+dept1);
	
%>
	
    <select name="selectedDept" id="selectedDept" class="normal" onchange="showAllFunctions();">
        <option value="0">Select a BCCL Department</option>

<%
    for(int ii=0 ; ii < deptList.size( ); ii++) {

        String dept[ ] = (String[ ]) deptList.get(ii);
		if(dept1.equals("all")){
		//session.setAttribute("department",dept[0]);
		dept1= dept[0];
		}	    
        //System.out.println("dept[1]--"+dept[1]);
%>
	
        
        <option value="<%=dept[0]%>" <%=(dept[0].equals(dept1)?"selected":"")%>><%=dept[1]%></option>
<%   
    }
%>       
	</select>