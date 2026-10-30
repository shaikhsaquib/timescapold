<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>


<%! 

	public String getFilePath(String transactionId, String userId){
		String folderName = userId.split("@")[0];
		File file = null;
		
		String absolutePath = EnvironmentProperties.getValue("ota", "uploadPathSub");

	    String filePath = absolutePath+folderName+"/"+transactionId+"/";

	    return filePath;
	    			
	}

%>