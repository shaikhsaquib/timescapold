<%--
 -- Interaction Center -- Common 
 -- @(#)subActivity.jsp	20-DEC-2011
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Ashutosh Shimpi
 -- @version 	1.6, 20-DEC-2011
 --%>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>

<%
		String Policy	= request.getParameter("subValue");

	
		ArrayList subPolicyData    = new ArrayList();
		
		subPolicyData	= insuranceClaimController.searchPolicyDetails(Policy);

		if(subPolicyData.size()!=0)
		{
%>
<span class="normalBig">
       <select name="subPolicySelectBox" class="style3"  id="subPolicySelectBox">
		 <option value="Select">Select Policy</option>
		 <%
			for(int i = 0; i<subPolicyData.size(); i++ )
			{
				String singleSubPolicyData[] = (String[]) subPolicyData.get(i);
		 %>
				<option value="<%=singleSubPolicyData[0]%>"><%=singleSubPolicyData[0]%></option>
		 <%	 
			}
		 %>	
        </select>
</span> 
	
<%
}
%>
