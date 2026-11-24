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
            String surveyorNameStr ="";
			String surveyorLocation = (String)request.getParameter("surveyorLocation");

			surveyorNameStr = surveyorNameStr + "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select class=\"style3\" name=\"surveyorName\" onchange = \"showSurveyorDetails(this.value,'"+surveyorLocation+"')\">" ;           

			

            if(surveyorLocation.equals("0") || surveyorLocation== null){

                surveyorNameStr+="<option value=0>Select a Name</option>";

            }else{
                surveyorNameStr+="<option value=0>Select a Name</option>";

					//edition = "'"+edition+"'";
					Object objArr[] = new Object[3];
					objArr[0] = "'DD-MON-YYYY'";
					objArr[1] = "'A'";
					objArr[2] = "'"+surveyorLocation+"'";

					Hashtable searchHash = new Hashtable();
					searchHash.put("queryId","1000");
					searchHash.put("arguments",objArr);

					ArrayList surveyorList = new ArrayList();
					surveyorList = insuranceClaimController.viewSurveyorDetails(searchHash);
	
                    for (int ii=0; ii<surveyorList.size(); ii++){
                        String surveyorListArr[] = (String[])surveyorList.get(ii);
                          surveyorNameStr+="<option value=\""+surveyorListArr[2]+"\">"+surveyorListArr[2]+"</option>";
					}
			}

            surveyorNameStr+="</select> <img src=\"../images/tick.png\" border=\"0\" /> </td></tr><br><br>";

			out.print(surveyorNameStr);

			String surveyorStr = ""; 

			surveyorStr += "<tr><td height=\"30\" align=\"left\"  class=\"style5\" color=\"#ffffff\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address :</td><td height=\"20\" align=\"left\" class=\"style3\"><div id=\"surveyorAddress\"></div></td></tr><br><br>";

			surveyorStr += "<tr><td height=\"30\" align=\"left\"  class=\"style5\" color=\"#ffffff\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone Number :</td><td height=\"20\" align=\"left\" class=\"style3\"><div id=\"surveyorPhone\"></div></td></tr><br><br>";

			surveyorStr += "<tr><td height=\"30\" align=\"left\"  class=\"style5\" color=\"#ffffff\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mobile Number</td><td height=\"20\" align=\"left\" class=\"style3\"><div id=\"surveyorMobile\"></div></td></tr><br><br>";

			surveyorStr += "<tr><td height=\"30\" align=\"left\"  class=\"style5\" color=\"#ffffff\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fax Number :</td><td height=\"20\" align=\"left\" class=\"style3\"><div id=\"surveyorFax\"></div></td></tr><br><br>";

			surveyorStr += "<tr><td height=\"30\" align=\"left\"  class=\"style5\" color=\"#ffffff\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email Id :</td><td height=\"20\" align=\"left\" class=\"style3\"><div id=\"surveyorEmailid\"></div></td></tr><br><br>";

			out.println(surveyorStr);
			
%>