<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%
	String DPATH     = EnvironmentProperties.getValue("ota", "uploadPathSub");
	
	String fileName=(String)request.getParameter("fileName");
    String emailid=(String)request.getParameter("emailid");
    String str=(String)request.getParameter("str");

	//System.out.println("fileName---"+fileName);
	//System.out.println("emailid---"+emailid);
	//System.out.println("str---"+str);

	String dPath ="";

	//if(str.equals("1"))
	//{
		String requestNo=(String)request.getParameter("requestNo");
		//String attachment=(String)request.getParameter("attachment");

		//dPath =DPATH+emailid+"/"+requestNo+"/"+attachment+"/"+fileName;

	//}else
	//{*/
		String attachment=(String)request.getParameter("attachment");
		dPath=DPATH+emailid+"/"+attachment+"/"+fileName;
	//}
	
	File f=new File(dPath);
	//System.out.println("f---"+f);

		//System.out.println(emailid);
//    String requestNo=(String)request.getParameter("requestNo");
    //String root = this.getServletContext().getRealPath("");
   // File f=new File(DPATH+emailid+"/"+requestNo +"/"+fileName);
   
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