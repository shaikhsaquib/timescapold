
<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import="com.bccl.util.DirReader" %>
<%@ page import="java.util.zip.ZipEntry,java.util.zip.ZipOutputStream"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%!
private byte[] zipFiles(String[] zipNames, String[] files) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ZipOutputStream zos = new ZipOutputStream(baos);
        byte bytes[] = new byte[2048];

        //for (String fileName : files) {
		for(int h=0; h<files.length; h++){
            FileInputStream fis = new FileInputStream(files[h]);
            BufferedInputStream bis = new BufferedInputStream(fis);

            zos.putNextEntry(new ZipEntry(zipNames[h]));

            int bytesRead;
            while ((bytesRead = bis.read(bytes)) != -1) {
                zos.write(bytes, 0, bytesRead);
            }
            zos.closeEntry();
            bis.close();
            fis.close();
        }
        zos.flush();
        baos.flush();
        zos.close();
        baos.close();

        return baos.toByteArray();
    }
%>

<%
	String comp = (String) request.getParameter("comp");
	String year = (String) request.getParameter("year");

	Hashtable hashTable = new Hashtable();
	hashTable.put("comp",comp);
	hashTable.put("year",year);
	
	ArrayList<String[]> dataList = ERVMController.getUploadedData(hashTable);
	String uploadPath = EnvironmentProperties.getValue("ervm", "uploadPathSub");
	int size = dataList.size();
	//String files[] = new String[size];
	//String zipNames[] = new String[size];
	ArrayList<String> filesList = new ArrayList<String>();
	ArrayList<String> zipList = new ArrayList<String>();
	String[] itemArray = {"ERVM Matrix","Risk Response sheets","Positive Assurance Letter","Other documents","Misc Documents"};
	DirReader reader = new DirReader();
	
			for(int k=0; k<dataList.size(); k++){ 
				String[] dataArray = (String[]) dataList.get(k);
				String finalPath = uploadPath + dataArray[1] + "-"+ dataArray[2]+"/";
				if(dataArray[3].equals("Y")){
					String  lastPath = finalPath +itemArray[0];
					ArrayList presentFileList = (ArrayList) reader.getAllFiles(lastPath);
					
					if(presentFileList.size()>0){
						for(int l=0; l<presentFileList.size(); l++){
							filesList.add(((File)presentFileList.get(l)).getAbsolutePath());
							zipList.add(dataArray[0] + "/" + dataArray[1] + "/" + itemArray[0] +  "/" +  ((File)presentFileList.get(l)).getName());
						}
					}
				}
				
				if(dataArray[4].equals("Y")){
					String  lastPath = finalPath +itemArray[1];
					ArrayList presentFileList = (ArrayList) reader.getAllFiles(lastPath);
					
					if(presentFileList.size()>0){
						for(int l=0; l<presentFileList.size(); l++){
							filesList.add(((File)presentFileList.get(l)).getAbsolutePath());
							zipList.add(dataArray[0] + "/" + dataArray[1] + "/" + itemArray[1] + "/" + ((File)presentFileList.get(l)).getName());
						}
					}
				}
				
				if(dataArray[5].equals("Y")){
					String  lastPath = finalPath +itemArray[2];
					ArrayList presentFileList = (ArrayList) reader.getAllFiles(lastPath);
					
					if(presentFileList.size()>0){
						for(int l=0; l<presentFileList.size(); l++){
							filesList.add(((File)presentFileList.get(l)).getAbsolutePath());
							zipList.add(dataArray[0] + "/" + dataArray[1] + "/" + itemArray[2] + "/" + ((File)presentFileList.get(l)).getName());
						}
					}
				}
				
				if(dataArray[6].equals("Y")){
					String  lastPath = finalPath +itemArray[3];
					ArrayList presentFileList = (ArrayList) reader.getAllFiles(lastPath);
					
					if(presentFileList.size()>0){
						for(int l=0; l<presentFileList.size(); l++){
							filesList.add(((File)presentFileList.get(l)).getAbsolutePath());
							zipList.add(dataArray[0] + "/" + dataArray[1] + "/" + itemArray[3] + "/" + ((File)presentFileList.get(l)).getName());
						}
					}
				}
				
				if(dataArray[7].equals("Y")){
					String  lastPath = finalPath +itemArray[4];
					ArrayList presentFileList = (ArrayList) reader.getAllFiles(lastPath);
					
					if(presentFileList.size()>0){
						for(int l=0; l<presentFileList.size(); l++){
							//filesList.add(lastPath+"/"+presentFileList.get(l));
							filesList.add(((File)presentFileList.get(l)).getAbsolutePath());
							zipList.add(dataArray[0] + "/" + dataArray[1] + "/" + itemArray[4] + "/" + ((File)presentFileList.get(l)).getName());
						}
					}
				}
				
				
				//files[k] = dataArray[4];
				//zipNames[k] = dataArray[1] + "/" + dataArray[2] + "/" + dataArray[4].substring(dataArray[4].lastIndexOf("/")+1,dataArray[4].length());
			}
			
			String files[] = (String[])filesList.toArray(new String[filesList.size()]);
			/*for(int m=0; m<filesList.size(); m++){
				out.println(filesList.get(m));
			}*/
			String zipNames[] = (String[])zipList.toArray(new String[zipList.size()]);
			
		try {
            // The path below is the root directory of data to be
            // compressed.
            //String path = getServletContext().getRealPath("data");

            //File directory = new File(path);
            //String[] files = directory.list();

            // Checks to see if the directory contains some files.
            if (files != null && files.length > 0) {

                // Call the zipFiles method for creating a zip stream.
                byte[] zip = zipFiles(zipNames, files);

                // Sends the response back to the user / browser. The
                // content for zip file type is "application/zip". We
                // also set the content disposition as attachment for
                // the browser to show a dialog that will let user 
                // choose what action will he do to the sent content.
                //ServletOutputStream sos = response.getOutputStream();
                response.setContentType("application/zip");
                response.setHeader("Content-Disposition", "attachment; filename=\"DATA.ZIP\"");

                //sos.write(zip);
                //sos.flush();
				
				response.getOutputStream().write(zip);
				response.getOutputStream().flush();
				response.getOutputStream().close(); 
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
%>
