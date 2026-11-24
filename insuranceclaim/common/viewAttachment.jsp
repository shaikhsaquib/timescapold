<%@ page language="java" %>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>
	<tr>
		 <td height="5">&nbsp;</td>
          <td height="50" align="left" class="style4" width="20%"><div align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File List: &nbsp;</div></td>
          <td height="50" align="left" class="style3">
<%
	String currLink = "../common/viewAttachment.jsp";
	String breadcrumbs = "";
	String requestNo = (String) request.getParameter("requestNo");
	//System.out.println("attachment"+formName);
	//String role = (String) session.getAttribute("claimUserRole");
	//System.out.println("attachment"+role);
	//if(role.equals("1"))
	//{
%>
<%@ include file="../common/dirList.jsp"%>
</td></tr>