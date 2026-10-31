<%@ page import = "java.io.FileInputStream" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%

	String filePath = EnvironmentProperties.getValue("ervm", "trainingPDF");
	File folder = new File(filePath);
	File[] listOfFiles = folder.listFiles();
	
	String fileName = listOfFiles[0].getName();

	FileInputStream fileInputStream = new FileInputStream(filePath+fileName);  
	
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