<%@ page import = "java.io.FileInputStream" %>
<%@ page import = "java.io.PrintWriter" %>
<%

	String filePath = (String)request.getParameter("filePath");
	String fileName = (String)request.getParameter("fileName");
	
	System.out.println("filePath ----> "+filePath);

	FileInputStream fileInputStream = new FileInputStream(filePath);  
	
	PrintWriter writer = response.getWriter();
	response.setContentType("APPLICATION/OCTET-STREAM");
	response.setHeader("Content-disposition","attachment;filename="+fileName);
	
	int i; int count = 0;  
	while ((i=fileInputStream.read()) != -1) {  
		count++;
		writer.write(i);   
	}
	
	fileInputStream.close();   
	writer.flush();
	writer.close();

%>
