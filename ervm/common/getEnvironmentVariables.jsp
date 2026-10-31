<%@ page import = "java.util.Properties" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.FileInputStream" %>

<%! 

	public String getVariable(String variableName){
		
		Properties properties = new Properties();
		File file = null;
		
		String absolutePath = "E:/Tomcat 6.0/webapps/timescape/WEB-INF/classes/config/ervmEnvironment.properties";
		try{
			file = new File(absolutePath);
		    properties.load(new FileInputStream(file));
		}catch(Exception e){
			return "Exception ocurred "+e;
		}

	    return properties.getProperty(variableName);
	    			
	}

%>