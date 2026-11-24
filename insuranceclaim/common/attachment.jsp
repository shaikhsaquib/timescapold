<%@ page language="java" %>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>
		<tr>
		 <td height="5">&nbsp;</td>
          <td height="50" align="left" class="style4" width="20%"><div align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File List: &nbsp;</div></td>
          <td height="50" align="left" class="style3">
<%
	String currLink = "../common/attachment.jsp";
	String breadcrumbs = "";
	String requestNo = (String) request.getParameter("requestNo");
	String formName = (String) request.getParameter("formName");

	//out.println("attachment == "+formName);
	//String role = (String) session.getAttribute("claimUserRole");
	//System.out.println("attachment"+role);
	//if(role.equals("1"))
	//{
%>
<%@ include file="../common/dirListing.jsp"%>
		 </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
		 <tr>          
          <td height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:attachmentFile(<%=requestNo%>,'<%=formName%>');" >Click on image to attach file <img src="../../images/attachment.png" border="0" /></a></div><br>
		 </td>
        </tr>

<%
	//}
%>