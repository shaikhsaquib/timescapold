<%@ page language="java" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%
	String DPATH     = EnvironmentProperties.getValue("legalContractManagement", "uploadPath");
	
    String str=(String)request.getParameter("str");
    String fileName=(String)request.getParameter("fileName");
    String attachment=(String)request.getParameter("attachment");

	String emailid = (String)session.getAttribute("emailid");
	String requestNo = (String)session.getAttribute("requestId");

	String dPath ="";

	if(str.equals("1"))
	{
		//String requestNo=(String)request.getParameter("requestNo");
		//String attachment=(String)request.getParameter("attachment");

		dPath =DPATH+emailid+"/"+requestNo+"/"+attachment+"/"+fileName;

	}else
	{
		//String attachment=(String)request.getParameter("attachment");
		dPath=DPATH+emailid+"/"+attachment+"/"+fileName;
	}
	
	File f=new File(dPath);

    response.setContentType("application/x-download");
    response.setHeader("Content-Disposition", "attachment; filename="+fileName+";");
    response.setHeader("Cache-Control", "no-cache");
    byte[] buf = new byte[response.getBufferSize()];
    response.setContentLength((int)f.length());
    int length;
    FileInputStream fis = null;
    BufferedInputStream fileInBuf = null;

    fileInBuf = new BufferedInputStream(new FileInputStream (f));

    ByteArrayOutputStream baos = new ByteArrayOutputStream();

    while((length = fileInBuf.read(buf)) > 0) {
    baos.write(buf, 0, length);
    }
    response.getOutputStream().write(baos.toByteArray());
    response.getOutputStream().flush();
    response.getOutputStream().close(); 
	%>