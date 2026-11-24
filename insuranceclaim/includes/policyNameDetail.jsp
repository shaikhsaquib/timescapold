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
            String policyNameStr ="";

            policyNameStr+="<select class=\"style3\" name=\"policyName\" id=\"policyName\" onchange = \"showPolicyNumber()\">\n";

			String entity = (String)request.getParameter("entity");

            if(entity.equals("0") || entity== null){

                policyNameStr+="<option value=0>Select a Policy</option>";

            }else{
                policyNameStr+="<option value=0>Select a Policy</option>";

					//edition = "'"+edition+"'";
					Object objArr[] = new Object[2];
					objArr[0] = entity;
					objArr[1] = "'A'";

					Hashtable searchHash = new Hashtable();
					searchHash.put("queryId","1000");
					searchHash.put("arguments",objArr);

					ArrayList policyList = new ArrayList();
					policyList = insuranceClaimController.viewPolicyDetails(searchHash);
	
                    for (int ii=0; ii<policyList.size(); ii++){
                        String policyListArr[] = (String[])policyList.get(ii);
                          policyNameStr+="<option value=\""+policyListArr[0]+"|"+policyListArr[1]+"\">"+policyListArr[1]+"</option>";
					}
			}

            policyNameStr+="</select> <img src=\"../images/tick.png\" border=\"0\" />";
            out.println(policyNameStr);
			
%>