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

//filename = "../attachments/"+filename;

//response.setHeader("Content-Length", String.valueOf(f.length()));
response.setContentType ("application/text");
response.setHeader ("Content-Disposition", "attachment; filename=\""+filename+"\"");

String name = f.getName().substring(f.getName().lastIndexOf("/") + 1,f.getName().length());
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
}
%>
