<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties,com.bccl.util.AESencrp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>

<%
	String DPATH     = EnvironmentProperties.getValue("wastesalesapprovals", "uploadPath");
	
	//String fileName=(String)request.getParameter("fileName");
   // String emailid=(String)request.getParameter("emailid");

	String emailid = (String)session.getAttribute("userEmailId");
	AESencrp testEncrpt = new AESencrp();	
	//System.out.println("emailid---"+emailid);
    String str=(String)request.getParameter("str");
	//String fileName = (String)session.getAttribute("fileName");
	//String emailid = emailId;
	if (emailid.indexOf("@") > -1) 
	{
		emailid = emailid.substring(0, emailid.indexOf("@"));        
	}

	//System.out.println("fileName---"+fileName);
	//System.out.println("emailid---"+emailid);
	//out.println("str---"+str);

	String dPath ="";

	String decryptfileName = (String)request.getParameter("fileName");

	decryptfileName = decryptfileName.replaceAll("\\s", "+");

	String fileName = testEncrpt.decrypt(decryptfileName);

	String decryptAttachment = (String)request.getParameter("attachment");

	decryptAttachment = decryptAttachment.replaceAll("\\s", "+");

	String attachment = testEncrpt.decrypt(decryptAttachment);


	if(str.equals("1"))
	{
		//String requestNo=(String)request.getParameter("requestNo");
		//String attachment=(String)request.getParameter("attachment");
		String requestNo = (String)session.getAttribute("requestId");
	//	String attachment = (String)session.getAttribute("attachment");

		dPath =DPATH+emailid+"/"+requestNo+"/"+attachment+"/"+fileName;
		//out.println("requestNo---"+requestNo);
		//out.println("attachment---"+attachment);

	}else
	{
		//String attachment=(String)request.getParameter("attachment");
		dPath=DPATH+emailid+"/"+attachment+"/"+fileName;
	}
	
	//out.println("emailid---"+emailid);

	File f=new File(dPath);

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