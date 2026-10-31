<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="docKeyWordController" class="com.bccl.workflows.web.controller.DocumentKeywordsController"/>
<%
/*String msg			= (String)request.getParameter("comment");
String requestoid			= (String)request.getParameter("requestoid");
	String id					= (String)request.getParameter("id");


out.println("msg--"+msg+"--requestoid--"+requestoid+"---id--"+id);*/


	String requestoid			= (String)request.getParameter("requestoid");
	String id					= (String)request.getParameter("id");
	String msg			= (String)request.getParameter("comment");

	
	String keyWord = "-";
	String actionText = "-";
	Hashtable  insertHash = new Hashtable();
	Hashtable  detailHash = new Hashtable();
	ArrayList detailsList		= new ArrayList();

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");

	if("1".equals(id))
	{
		System.out.println("hi");

		boolean insertFlag = false;

		//msg					= (String)request.getParameter("comment");
		insertHash.put("COMMENTS", msg);
		insertHash.put("DOCUMENTOID", "DOC1006");			
		insertHash.put("WORKITEMOID", requestoid);			
		insertHash.put("EMAILID", emailId);			
		insertHash.put("KEYWORDS", keyWord);			
		insertHash.put("ACTIONTEXT", actionText);			
		insertHash.put("STATUS", "A");			
		insertHash.put("APPLICATION_NAME", "legalContractManagement");	
		insertHash.put("APPLICATION", "legalContractManagement");	
		 
		insertFlag = docKeyWordController.create("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",insertHash);
		System.out.println("insertFlag----"+insertFlag);

	}

	
	detailHash.put("DOCUMENTOID", "DOC1006");
	detailHash.put("WORKITEMOID", requestoid); 
	detailHash.put("STATUS", "A");
	detailHash.put("APPLICATION", "legalContractManagement");		
	detailsList = docKeyWordController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailHash);
	String comments ="";
	String createdBy ="";
	String createdOn ="";

	for (int ii=0; ii<detailsList.size(); ii++) 
	{
		String strArr[] = (String[])detailsList.get(detailsList.size()-1);	
		
		comments = strArr[4];
		createdBy = strArr[5];
		createdBy				= createdBy.substring(0,createdBy.indexOf("@"));

		try 
		{
			Date date = (Date) format.parseObject(strArr[6]);

			createdOn = format2.format(date);	
										
		} catch (ParseException e) { 
		e.printStackTrace();
		}

	}

String s1 = comments+"@"+createdBy+"@"+createdOn;
out.println(s1);

%>