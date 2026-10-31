<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

<%
	ArrayList userList = new ArrayList();

    Hashtable detailsHash = new Hashtable( );
    Hashtable detailsHash1 = new Hashtable( );

	String criteria = (String)request.getParameter("rolesCriteria");

	String searchText = Utility.replaceQuoteOracle((String)request.getParameter("rolesText"));

	searchText = searchText.trim().toUpperCase();

	if(searchText.indexOf("@")> -1){

		criteria = "emailId";
	}
	//out.println("searchText ="+searchText);
	//out.println("criteria ="+criteria);

	if("all".equals(criteria)){
		
		detailsHash.put("ALL", searchText);

	}else if("name".equals(criteria)){
      
		detailsHash.put("USERNAME", searchText);

	}else if("emailId".equals(criteria)){

		detailsHash.put("QUERYSTRING", searchText);
	}
	
	detailsHash.put("STATUS", "A");
	detailsHash.put("APPLICATION", "legalContractManagement");
	userList		= docHeaderController.getEmailId(detailsHash);



%>
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#cccccc">
		
		 <tr bgcolor="#04A2C4">
			<td align="center" class="white" width="25%" height="30px">EmailId</td>
			<td align="center" class="white" width="25%" height="30px">Branches</td>
		    <td align="center" class="white" width="20%" height="30px">Locations</td>
			<td align="center" class="white" width="15%" height="30px">Roles</td>
			<td align="center" class="white" width="15%" height="30px">Action</td>
			<!--<td width="22%" align="center" valign="middle">ACT</td>
			 -->
		</tr>
<%
		for(int ii=0; ii < userList.size(); ii++){
		String tmpArr[] = (String [])userList.get(ii);
%>
		 <tr >
			<td align="center" class="white" width="25%" height="30px"><%=tmpArr[6]%></td>
			<td align="center" class="white" width="25%" height="30px"><%=tmpArr[9]%></td>
		    <td align="center" class="white" width="20%" height="30px"><%=tmpArr[11]%></td>
			<td align="center" class="white" width="15%" height="30px"><%=tmpArr[13]%></td>
			<td align="center" class="white" width="15%" height="30px"><a type="button" id="sub" onclick="submitUser('<%=tmpArr[6]%>')" class="greyBGmenu">Add</a></td>
			<!--<td width="22%" align="center" valign="middle">ACT</td>
			 -->
		</tr>
<%
		}			
%>
</table>