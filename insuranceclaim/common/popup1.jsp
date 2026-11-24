<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>

<%
    String fileName=(String)request.getParameter("fileName");
	fileName = fileName + ".doc";
    //String emailid=(String)request.getParameter("emailid");
	System.out.println(fileName);
    //String requestNo=(String)request.getParameter("requestNo");
    //String root = this.getServletContext().getRealPath("");
    File f=new File("/programs/WebSphere5/AppServer/installedApps/PWSEPAPPB408/timescape_war.ear/timescape.war/sapep/insuranceclaim/claimForms/"+fileName);
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