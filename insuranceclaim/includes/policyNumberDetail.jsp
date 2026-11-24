<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<link rel="stylesheet" href="../style/global.css">
<script Language="JavaScript" src="../jscripts/acceptInsuranceClaim.js"></script>

<%
            String policyNumberStr ="";

            policyNumberStr+="<input type= \"text\" class=\"style3\" name=\"policyNumber\" id=\"policyNumber\"";

			String policyName = (String)request.getParameter("policyName");
			String entity = (String)request.getParameter("entity");

					//edition = "'"+edition+"'";
					Object objArr[] = new Object[4];
					objArr[0] = "'DD-MON-YYYY'";
					objArr[1] = "'"+policyName+"'";
					objArr[2] = "'A'";
					objArr[3] = "'"+entity+"'";

					Hashtable searchHash = new Hashtable();
					searchHash.put("queryId","1001");
					searchHash.put("arguments",objArr);

					ArrayList policyList = new ArrayList();
					policyList = insuranceClaimController.viewPolicyDetails(searchHash);

					if(policyList.size() == 0)
					{
                          policyNumberStr+="readonly>";
					}	
					else
					{
                    for (int ii=0; ii<policyList.size(); ii++){
                        String policyListArr[] = (String[])policyList.get(ii);
					//System.out.println("policyListArr[1]"+policyListArr[1]+"policyListArr[3]"+policyListArr[3]);
                          policyNumberStr+="value= \"" +policyListArr[1]+"\" readonly>";
%>
						<input type="hidden" name="hiddPolicyName" value="<%=policyListArr[3]%>">
<%
					}
					}

            policyNumberStr+="<img src=\"../images/tick.png\" border=\"0\" />";
            out.println(policyNumberStr);
			
%>