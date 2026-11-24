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
            String policySumAssuredStr ="";

            policySumAssuredStr+="<select class=\"style3\" name=\"policySumAssured\" id=\"policySumAssured\" >\n";

			String policyId = (String)request.getParameter("policyId");

            if(policyId.equals("0") || policyId== null){

                policySumAssuredStr+="<option value=0>Select Policy Sum Assured</option>";

            }else{
					//edition = "'"+edition+"'";
					Object objArr[] = new Object[3];
					objArr[0] = "'DD-MON-YYYY'";
					objArr[1] = policyId;
					objArr[2] = "'A'";

					Hashtable searchHash = new Hashtable();
					searchHash.put("queryId","1001");
					searchHash.put("arguments",objArr);

					ArrayList policyList = new ArrayList();
					policyList = insuranceClaimController.viewPolicyDetails(searchHash);
	
                    for (int ii=0; ii<policyList.size(); ii++){
                        String policyListArr[] = (String[])policyList.get(ii);
                          policySumAssuredStr+="<option value=\""+policyListArr[4]+"\">"+policyListArr[4]+"</option>";
					}
			}

            policySumAssuredStr+="</select> <img src=\"../images/tick.png\" border=\"0\" />";
            out.println(policySumAssuredStr);
			
%>