<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Hashtable, java.util.List, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>


<%! static List<String> result = new ArrayList<String>(); %>

<%!   public static List<String> getResult() {
		return result;
	}
%>
<%
	String DPATH     	= EnvironmentProperties.getValue("claim", "uploadPath");
	
	String fileName		=(String)request.getParameter("fileName");
    String emailid		=(String)request.getParameter("emailid");
    String str			=(String)request.getParameter("str");
    String attachment	=(String)request.getParameter("attachment");
    String dPath 		="";
    
    String fileNameToSearch;
    List<String> result = new ArrayList<String>();
    
    dPath = DPATH + emailid;
    //System.out.println(dPath);
	//try different directory and filename :)
	searchDirectory(new File(dPath), fileName);
	
	int count = getResult().size();
	if(count ==0){
	    //System.out.println("\nNo result found!");
	}else if(count == 1){
		String addr="";
		for (String matched : getResult()){
			addr = matched;
			addr = addr.substring(addr.indexOf(emailid),addr.indexOf(fileName));
			addr = addr.replace(emailid, "");
			addr = addr.substring(1,addr.length()-1);
	    }
		//System.out.println("Found : " + addr);
		attachment = addr;
		%>
		<input type="hidden" id="hidFileName" value=<%=fileName %> >
				<input type="hidden" id="hidemailid" value=<%=emailid %> >
				<input type="hidden" id="hidstr" value=<%=str %> >
				<input type="hidden" id="hidattachment" value=<%=attachment %> >
			<script type="text/javascript"> 
				window.onload=charger; 
				function charger(){ 
				    //alert("coucou");
				    var fileName = document.getElementById("hidFileName").value; 
				    var emailid = document.getElementById("hidemailid").value; 
				    var str = document.getElementById("hidstr").value;  
				    var attachment = document.getElementById("hidattachment").value; 
				    var url	= "../common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str="+str+"&attachment="+attachment;
			   		window.location.href = url;
				} 
			</script>
		<%
		/* for (String matched : getResult()){
			System.out.println("Found : " + matched); */
			%>
			<%-- <body>
				<input type="hidden" id="hidFileName" value=<%=fileName %> >
				<input type="hidden" id="hidemailid" value=<%=emailid %> >
				<input type="hidden" id="hidstr" value=<%=str %> >
				<input type="hidden" id="hidattachment" value=<%=attachment %> >
				<script>
					$( document ).ready(function() {
					    alert( "ready!" );
					    /* var fileName = document.getElementById("hidFileName").value; 
					    var emailid = document.getElementById("hidemailid").value; 
					    var str = document.getElementById("hidstr").value;  
					    var attachment = document.getElementById("hidattachment").value; 
					    var url	= "../common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str="+str+"&attachment="+attachment;
				   		window.location.href = url; */
					});
				</script>
			<body> --%>

			<%
			//downloadfile(matched, fileName);
	    /* } */
	}else{
	    //System.out.println("\nFound " + count + " result!\n");
	    for (String matched : getResult()){
			//System.out.println("Found : " + matched);
	    }
	}
%>

<%!
	/* public static void downloadfile(String matched, String fileName){
		System.out.println("matched " + matched + " ");
		
		File f=new File(matched);
	    response.setContentType("application/x-download");
	    response.setHeader("Content-Disposition", "attachment; filename="+fileName+";");
	    response.setHeader("Cache-Control", "no-cache");
	    byte[] buf = new byte[response.getBufferSize()];
	    response.setContentLength((int)f.length());
	    int length;
	    FileInputStream fis = null;
	    BufferedInputStream fileInBuf = null;

	    fileInBuf = new BufferedInputStream(new FileInputStream (f));

	    ByteArrayOutputStream baos = new ByteArrayOutputStream();

	    while((length = fileInBuf.read(buf)) > 0) {
	    baos.write(buf, 0, length);
	    }
	    response.getOutputStream().write(baos.toByteArray());
	    response.getOutputStream().flush();
	    response.getOutputStream().close(); 
	} */
%>

<%!
	public static void searchDirectory(File directory, String fileNameToSearch) {
		if (directory.isDirectory()) {
		    search(directory,fileNameToSearch);
		} else {
		    //System.out.println(directory.getAbsoluteFile() + " is not a directory!");
		}
  }
%>

<%!
	public static void search(File file, String fileNameToSearch) {
		if (file.isDirectory()) {
			//System.out.println("Searching directory ... " + file.getAbsoluteFile());
			//do you have permission to read this directory?	
			if (file.canRead()) {
				for (File temp : file.listFiles()) {
					if (temp.isDirectory()) {
						search(temp,fileNameToSearch);
					} else {
						if (fileNameToSearch.equals(temp.getName().toLowerCase())) {			
							result.add(temp.getAbsoluteFile().toString());
						}
					}
				}
			} else {
				//System.out.println(file.getAbsoluteFile() + "Permission Denied");
			}
		}
	}
%>

