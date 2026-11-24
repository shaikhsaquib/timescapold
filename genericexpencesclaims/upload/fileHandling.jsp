<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Communication Claim - Upload</title>
	</head>
	<body>
		<%!
			/* public static void main(String[] args) {
		        String fileName = "Java8.txt";
		        String source = "C:\\Users\\niraj\\Desktop\\" + fileName;
		        String destination = "C:\\Users\\niraj\\Desktop\\destin";
	
		        renameAndDelete(source, destination, fileName);
		    } */
		%>
		<%!	
			public static void renameAndDelete(String source, String destination, String fileName){
		        File file = new File(source);
		        File dir = new File(destination);
		        boolean bool = false;
		        String dest = destination + "\\" + stripExtension(fileName) + "_" + (new SimpleDateFormat("yyyyMMddHHmmss'.txt'").format(new Date()));
		        
		        // tests if file exists
		        bool = file.exists();
	
		        // tests if dir exists
		        if(!dir.exists()){
		            if (dir.mkdirs()) {
		                //System.out.println("Directory is created!");
		            } else {
		                //System.out.println("Failed to create directory!");
		            }
		        }
	
		        if(!bool) {
		            //System.out.println("Source file does not exists.");
		        } else {
		            try {
		                // renaming the file and moving it to a new location
		                if (file.renameTo(new File(dest))) {
		                    // if file copied successfully then delete the original file
		                    file.delete();
		                    //System.out.println("File moved successfully " + dest);
		                } else {
		                    //System.out.println("Failed to move the file");
		                }
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }
		    }
		%>
		<%!	
		    private static String getFileExtension(File file) {
		        String fileName = file.getName();
		        if(fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
		        return fileName.substring(fileName.lastIndexOf(".")+1);
		        else return "";
		    }
		%>
		<%!	
		    private static String stripExtension (String str) {
		        // Handle null case specially.
		        if (str == null) return null;
	
		        // Get position of last '.'.
		        int pos = str.lastIndexOf(".");
	
		        // If there wasn't any '.' just return the string as is.
		        if (pos == -1) return str;
	
		        // Otherwise return the string, up to the dot.
		        return str.substring(0, pos);
		    }
		%>
	</body>
</html>