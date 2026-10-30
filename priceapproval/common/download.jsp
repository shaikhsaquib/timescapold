<link href="../style/global.css" rel="stylesheet" type="text/css" />


<%@ page import="java.util.*,java.io.*"%>
<%
String file=request.getParameter("fileName");
File f = new File (file);

   // File f = new File(inputFile);

    if(!f.exists()){
%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center" height="200px" class="normal">File Not Found</td>
    </tr>
</table>
<%
    }
    else{

String filename=f.getName();

//File f=new File(filename);
//	System.out.println("f---"+f);

		//System.out.println(emailid);
//    String requestNo=(String)request.getParameter("requestNo");
    //String root = this.getServletContext().getRealPath("");
   // File f=new File(DPATH+emailid+"/"+requestNo +"/"+fileName);
   
    response.setContentType("application/x-download");
    response.setHeader("Content-Disposition", "attachment; filename="+filename+";");
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
	}
%>

