<%@ page import = "java.util.Properties" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.FileInputStream" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>

<%! 

	public String getFilePath(String subFolderName, String parentFolderName){
		String folderName = parentFolderName.contains("@")?parentFolderName.split("@")[0]:parentFolderName;
		Properties properties = new Properties();
		File file = null;
		
		String absolutePath = EnvironmentProperties.getValue("ervm", "pathToEnvironmentPropertiesFile");
		
		try{
			file = new File(absolutePath);
		    properties.load(new FileInputStream(file));
		}catch(Exception e){
			return "Exception ocurred "+e;
		}

	    String filePath = properties.getProperty("uploadPathSub")+folderName+"/"+subFolderName+"/";

	    return filePath;
	    			
	}

%>