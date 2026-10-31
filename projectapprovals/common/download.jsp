<%@ page import="java.util.*,java.io.*"%>
<%
String file=request.getParameter("f");
File f = new File (file);
String filename=f.getName();
response.setContentType ("application/text");
response.setHeader ("Content-Disposition", "attachment; filename=\""+filename+"\"");

String name = f.getName().substring(f.getName().lastIndexOf("/") + 1,f.getName().length());
out.println(name);
InputStream in = new FileInputStream(f);
ServletOutputStream outs = response.getOutputStream();

int bit = 256;
int i = 0;
try {
while ((bit) >= 0) {
bit = in.read();
outs.write(bit);
}
} catch (IOException ioe) {
ioe.printStackTrace(System.out);
}
outs.flush();
outs.close();
in.close(); 
%>
