<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%
	//System.out.println("*********************************************popup.jsp*************************************************");

	String DPATH     	= EnvironmentProperties.getValue("claim", "uploadPath");
	String fileName		= (String)request.getParameter("fileName");
    String emailid		= (String)request.getParameter("emailid");
    String str			= (String)request.getParameter("str");
	String dPath 		= "";
	String requestNo	= (String)request.getParameter("requestNo");
	String attachment	= (String)request.getParameter("attachment");
	
	dPath = DPATH+emailid+"/"+attachment+"/"+fileName;

	//System.out.println("dPath:" + dPath);
		
	try {
		File f=new File(dPath);
	   
	    response.setContentType("application/x-download");
	    response.setHeader("Content-Disposition", "attachment; filename="+fileName+";");
	    response.setHeader("Cache-Control", "no-cache");
	    
	    byte[] buf = new byte[response.getBufferSize()];
	    response.setContentLength((int)f.length());
	    
	    int length;
	    FileInputStream fis 			= null;
	    BufferedInputStream fileInBuf 	= null;
	
	    fileInBuf = new BufferedInputStream(new FileInputStream (f));
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
	    while((length = fileInBuf.read(buf)) > 0) {
	    	baos.write(buf, 0, length);
	    }
		
		response.getOutputStream().write(baos.toByteArray());
		response.getOutputStream().flush();
	    response.getOutputStream().close();

		//System.out.println("*********************************************popup.jsp*************************************************");
		
	} catch (FileNotFoundException e) {
		//System.out.println("Error in Show" + e.getMessage());
	} finally {
	    //System.out.println("Finally in popup.jsp called.");
	}
%>