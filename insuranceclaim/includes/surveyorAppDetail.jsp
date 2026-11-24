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
            String surveyorAppStr ="";
            String surveyorStr ="";

			ArrayList location = insuranceClaimController.searchLocationDetails();

            surveyorAppStr+="<br><tr><td height=\"30\" align=\"left\"  class=\"style5\" color=\"#ffffff\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Details of Surveyor : </td></tr><br><br> <tr><td height=\"30\" align=\"left\"  class=\"style5\" color=\"#ffffff\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Location Name :</td>	<br><br><td height=\"20\" align=\"left\" class=\"style3\" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name = \"surveyorLocation\" class=\"style3\" onchange=\"showSurveyorName()\" ><option class=\"style3\" value = \"0\">Select the Location</option>";

			for(int i = 0; i < location.size() ; i++)
			{
				String locationDetails[] = (String[]) location.get(i);

				surveyorAppStr+="<option class=\"style3\" value = \""+locationDetails[0]+"\">"+locationDetails[0]+"</option>";
			}
			surveyorAppStr+="</select><img src=\"../images/tick.png\" border=\"0\" /></td></tr><br><br>";
			surveyorStr = "<tr><td height=\"1\" colspan=\"2\" align=\"right\" bgcolor=\"#E2DDDA\" class=\"style5\"><img src=\"../images/spacer.gif\" width=\"1\" height=\"1\" /></td></tr><tr><td height=\"30\" align=\"left\"  class=\"style5\" color=\"#ffffff\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name : </td><td height=\"20\" align=\"left\" class=\"style3\"><div id=\"surveyorName\"></div></td></tr><br><br>";

			out.println(surveyorAppStr);
			out.println(surveyorStr);
			
%>