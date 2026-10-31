
 <%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File, java.io.*, java.util.*,java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<%
	
	System.out.println("hello");
	PrintWriter writer = null;
	response.setContentType("text/plain");
	response.setCharacterEncoding("UTF-8");
	writer = response.getWriter();
	String message;
	String filePathStr = (String)request.getParameter("filePath");
	System.out.println("filePathStr -> "+filePathStr);
	System.out.println("emsid "+emailId);
	
	if(new File(filePathStr).isDirectory()){
		String[] entries = new File(filePathStr).list();
		System.out.println("deleteAttach ---> filePathStr : "+filePathStr);
		System.out.println("deleteAttach ---> entries length : "+entries.length);
		for(String s: entries){
		    File currentFile = new File(new File(filePathStr).getPath(),s);
		    currentFile.delete();
		}
	}
	
	
	File fileToBeDeleted = new File(filePathStr);
	message = fileToBeDeleted.delete()?"successful":"failed";
	System.out.println("message -> "+message);
	updateDatabase(filePathStr,emailId,ERVMController);
	writer.print(message);
	writer.flush();
	writer.close();
	
%>

<%! 
	public void updateDatabase(String filePathStr,String emailId,com.bccl.ervm.web.controllerbeans.ERVMWebController ERVMController) throws Exception{
		int indexOfERVMSubUpload = filePathStr.indexOf("ervmSubUpload");
		//String reqdPart = filePathStr.substring(filePathStr.indexOf('/',4)+1);
		String reqdPart = filePathStr.substring(filePathStr.indexOf('/',indexOfERVMSubUpload)+1);
		int firstForwardSlash = reqdPart.indexOf('/');
		String deptYear = reqdPart.substring(0,firstForwardSlash);
		int firstHyphen = deptYear.indexOf('-');
		String dept = deptYear.substring(0,firstHyphen);
		String year = deptYear.substring(firstHyphen+1);
		String fileType = reqdPart.substring(firstForwardSlash+1,reqdPart.length()-1);
		//System.out.println("dept : "+dept+" year : "+year+" fileType : "+fileType);
		fileType = fileType.trim().replaceAll(" ","_").toUpperCase();
		ERVMController.removeFileBA10730005(dept,year,emailId,fileType);
    }
%>