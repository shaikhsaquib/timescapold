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
            String surveyorStr ="";

			String surveyorLocation = (String)request.getParameter("surveyorLocation");
			String surveyorName = (String)request.getParameter("surveyorName");
			String text = (String)request.getParameter("text");

			if(text.equals("1"))
			{

				    surveyorStr+="<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name=\"surveyorAddress\" rows = \"4\" class=\"style3\"";
					Object objArr[] = new Object[4];
					objArr[0] = "'DD-MON-YYYY'";
					objArr[1] = "'"+surveyorLocation+"'";
					objArr[2] = "'A'";
					objArr[3] = "'"+surveyorName+"'";

					Hashtable searchHash = new Hashtable();
					searchHash.put("queryId","1001");
					searchHash.put("arguments",objArr);

					ArrayList surveyorList = new ArrayList();
					surveyorList = insuranceClaimController.viewSurveyorDetails(searchHash);

					if(surveyorList.size() == 0)
					{
                          surveyorStr+="readonly=\"readonly\"></textarea>";
					}	
					else
					{
                    for (int ii=0; ii<surveyorList.size(); ii++){
                        String surveyorListArr[] = (String[])surveyorList.get(ii);
					//System.out.println("policyListArr[1]"+policyListArr[1]+"policyListArr[3]"+policyListArr[3]);
                          surveyorStr+= " readonly=\"readonly\">"+surveyorListArr[3]+"</textarea>";
					}
				}

				out.println(surveyorStr);
			}
			if(text.equals("2"))
			{

				    surveyorStr+="<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = \"text\" name = \"surveyorPhone\" class=\"style3\"";
					Object objArr[] = new Object[4];
					objArr[0] = "'DD-MON-YYYY'";
					objArr[1] = "'"+surveyorLocation+"'";
					objArr[2] = "'A'";
					objArr[3] = "'"+surveyorName+"'";

					Hashtable searchHash = new Hashtable();
					searchHash.put("queryId","1001");
					searchHash.put("arguments",objArr);

					ArrayList surveyorList = new ArrayList();
					surveyorList = insuranceClaimController.viewSurveyorDetails(searchHash);

					if(surveyorList.size() == 0)
					{
                          surveyorStr+="readonly>";
					}	
					else
					{
                    for (int ii=0; ii<surveyorList.size(); ii++){
                        String surveyorListArr[] = (String[])surveyorList.get(ii);
					//System.out.println("policyListArr[1]"+policyListArr[1]+"policyListArr[3]"+policyListArr[3]);
                          surveyorStr+="value= \"" +surveyorListArr[4]+"\" readonly>";
					}
				}

				out.println(surveyorStr);
			}
			if(text.equals("3"))
			{
				    surveyorStr+="<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = \"text\" name = \"surveyorMobile\" class=\"style3\"";
					Object objArr[] = new Object[4];
					objArr[0] = "'DD-MON-YYYY'";
					objArr[1] = "'"+surveyorLocation+"'";
					objArr[2] = "'A'";
					objArr[3] = "'"+surveyorName+"'";

					Hashtable searchHash = new Hashtable();
					searchHash.put("queryId","1001");
					searchHash.put("arguments",objArr);

					ArrayList surveyorList = new ArrayList();
					surveyorList = insuranceClaimController.viewSurveyorDetails(searchHash);

					if(surveyorList.size() == 0)
					{
                          surveyorStr+="readonly>";
					}	
					else
					{
                    for (int ii=0; ii<surveyorList.size(); ii++){
                        String surveyorListArr[] = (String[])surveyorList.get(ii);
					//System.out.println("policyListArr[1]"+policyListArr[1]+"policyListArr[3]"+policyListArr[3]);
                          surveyorStr+="value= \"" +surveyorListArr[5]+"\" readonly>";
					}
					out.println(surveyorStr);
			}
			}
			if(text.equals("4"))
			{

				    surveyorStr+="<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = \"text\" name = \"surveyorFax\" class=\"style3\"";
					Object objArr[] = new Object[4];
					objArr[0] = "'DD-MON-YYYY'";
					objArr[1] = "'"+surveyorLocation+"'";
					objArr[2] = "'A'";
					objArr[3] = "'"+surveyorName+"'";

					Hashtable searchHash = new Hashtable();
					searchHash.put("queryId","1001");
					searchHash.put("arguments",objArr);

					ArrayList surveyorList = new ArrayList();
					surveyorList = insuranceClaimController.viewSurveyorDetails(searchHash);

					if(surveyorList.size() == 0)
					{
                          surveyorStr+="readonly>";
					}	
					else
					{
                    for (int ii=0; ii<surveyorList.size(); ii++){
                        String surveyorListArr[] = (String[])surveyorList.get(ii);
					//System.out.println("policyListArr[1]"+policyListArr[1]+"policyListArr[3]"+policyListArr[3]);
                          surveyorStr+="value= \"" +surveyorListArr[6]+"\" readonly>";
					}
					out.println(surveyorStr);
			}
			}
			if(text.equals("5"))
			{

				    surveyorStr+="<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = \"text\" name = \"surveyorEmailid\" class=\"style3\"";
					Object objArr[] = new Object[4];
					objArr[0] = "'DD-MON-YYYY'";
					objArr[1] = "'"+surveyorLocation+"'";
					objArr[2] = "'A'";
					objArr[3] = "'"+surveyorName+"'";

					Hashtable searchHash = new Hashtable();
					searchHash.put("queryId","1001");
					searchHash.put("arguments",objArr);

					ArrayList surveyorList = new ArrayList();
					surveyorList = insuranceClaimController.viewSurveyorDetails(searchHash);

					if(surveyorList.size() == 0)
					{
                          surveyorStr+="readonly>";
					}	
					else
					{
                    for (int ii=0; ii<surveyorList.size(); ii++){
                        String surveyorListArr[] = (String[])surveyorList.get(ii);
					//System.out.println("policyListArr[1]"+policyListArr[1]+"policyListArr[3]"+policyListArr[3]);
                          surveyorStr+="value= \"" +surveyorListArr[7]+"\" readonly>";
					}
					out.println(surveyorStr);
			}
			}
%>
