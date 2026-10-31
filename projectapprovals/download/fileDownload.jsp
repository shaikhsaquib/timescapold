<%@ page import="java.io.*, java.util.*, java.text.*, java.sql.*, java.lang.*" %>

<%
try
{
	String downloadFile = (String) request.getParameter("listArray");
	
	String sirfFileName = downloadFile.substring(downloadFile.lastIndexOf("/")+1);
	File dnFile = new File(downloadFile);
	String download_date = "sysdate";
	response.setHeader("Content-Disposition","multi-part attachment; filename=\"" + sirfFileName + "\";");
	PrintWriter stream = response.getWriter();
	BufferedInputStream fif = new BufferedInputStream(new FileInputStream(downloadFile));
	int data;
	while((data = fif.read()) != -1)
	{
		stream.write(data);
	}

	fif.close();
	stream.close();
}
catch (Exception e)
{
	out.println("The Exception is :: "+ e);
}
%>
