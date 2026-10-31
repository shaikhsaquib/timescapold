<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set,java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>

<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<%
	Hashtable reportUserNameHash = new Hashtable();
	ArrayList rollList = new ArrayList();
	reportUserNameHash.put("EMAILID",emailId);
	String rollUserId ="";
	String rollUser ="";
	String redirectURL ="";
	

	rollList =  ERVMController.listRoles(reportUserNameHash);
	
	for(int xx =0 ;xx< rollList.size();xx++){
		String [] tmpArr = (String[])rollList.get(xx);
		rollUserId = tmpArr[0];
		rollUser = tmpArr[1];
		} 
//out.println("rollUser"+rollUser);
		
		session.setAttribute("rollUser",rollUser);
		if("user".equals(rollUser)){
			redirectURL = "/timescape/sapep/employeeselfservice/ervm/user/subordinate.jsp";
		}else if("supervisor".equals(rollUser)) {
			redirectURL = "/timescape/sapep/employeeselfservice/ervm/user/supervisor.jsp";
		}else if ("admin".equals(rollUser)){
			redirectURL = "/timescape/sapep/employeeselfservice/ervm/user/EditOrDeleteReportsAdmin.jsp";
		}else if ("functional admin".equals(rollUser)){
			redirectURL = "/timescape/sapep/employeeselfservice/ervm/user/supervisor.jsp";
		}else{
			redirectURL = "/timescape/sapep/employeeselfservice/ervm/user/UnauthorizedUser.jsp";
		}
		
response.sendRedirect(redirectURL);

%>
