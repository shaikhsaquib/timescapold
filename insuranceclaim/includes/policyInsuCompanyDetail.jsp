<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<%
            String policyInsuComapnyStr ="";

			policyInsuComapnyStr+="<input type= \"text\" class=\"style3\" name=\"policyInsuComapny\" id=\"policyInsuComapny\"";

			String entity = (String)request.getParameter("entity");
			String policyId = (String)request.getParameter("policyId");
			String policyNo = (String)request.getParameter("policyNo");
			String policyName = (String)request.getParameter("policyName");
			
			
			//edition = "'"+edition+"'";
			Object objArr[] = new Object[5];
			objArr[0] = "'DD-MON-YYYY'";
			objArr[1] = entity;
			//objArr[2] = policyId;
			objArr[2] = "'"+policyNo+"'";
			objArr[3] = "'A'";
			objArr[4] ="'"+policyName+"'";

			Hashtable searchHash = new Hashtable();
			searchHash.put("queryId","1002");
			searchHash.put("arguments",objArr);

			ArrayList policyList = new ArrayList();
			policyList = insuranceClaimController.viewPolicyDetails(searchHash);

			if(policyList.size() == 0)
			{
				  policyInsuComapnyStr+="readonly>";
			}	
			else
			{
			for (int ii=0; ii<policyList.size(); ii++){
				String policyListArr[] = (String[])policyList.get(ii);
                        policyInsuComapnyStr+="value= \"" +policyListArr[7]+"\" readonly>";
				}
			}
            policyInsuComapnyStr+="<img src=\"../images/tick.png\" border=\"0\" />";
            out.println(policyInsuComapnyStr);
			
%>