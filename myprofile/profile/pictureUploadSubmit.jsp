<%@ page errorPage="../common/errorPage.jsp"%>
<%@page buffer="1024kb"%>
<%@page autoFlush="false"%>

<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@page import="com.bccl.contributions.web.util.Constants,com.bccl.util.Utility, com.bccl.util.Breadcrumbs,com.bccl.contributions.web.util.*"%>

<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>
<jsp:useBean id="prop" scope="page" class="java.util.Properties" />

<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="java.util.*, java.sql.*" %>



<html>
<head>
<title>B2E</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">

<script>

function closeWindow() {

	window.close( );
	window.opener.location = 'viewProfile.jsp';
}

</script>

</head>

<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#EFEFEF">

     
<form name="frmUploadPictureSubmit" method="post">

<%!

	public String getBoundary(HttpServletRequest request,Properties prop) throws ServletException,IOException{
		String boundary = null;
		Enumeration enum = request.getHeaderNames();
		while(enum.hasMoreElements()){
			String header = (String)enum.nextElement();
			String hvalue = request.getHeader(header);
			prop.setProperty((header).toLowerCase(),hvalue);
			if( "content-type".equalsIgnoreCase(header) ){
				int idx = hvalue.lastIndexOf("boundary=");
				if( idx != -1 ){
	        		boundary= hvalue.substring( idx+9 , hvalue.length());
				}
			}
		}
		return boundary;
	}

   public String getFileName(String secondline){
        int len = secondline.length();
        int idx = secondline.lastIndexOf("filename=");
        if( idx == -1 ) return null;
        String filename = secondline.substring( idx+10 , len-1);
        filename = filename.replace('\\','/');
        idx = filename.lastIndexOf("/");
        idx = idx + 1;
        filename = filename.substring( idx );
       	return filename;
   }

%>

<%

	String emailId = request.getParameter("emailId");
    String DPATH = UploadFilePath.get("pictureUploadPath")+"/"+emailId;
	File fileName = new File(DPATH);

    if (!fileName.isDirectory()) {

    	boolean flag = fileName.mkdir();
    }

	DPATH += "/";


	int  ROUGHSIZE=1024;
	int  MAXSIZE  =  10; // Mega Byte
	String boundary = getBoundary(request,prop);
	if( boundary == null ){
		boundary = prop.getProperty("boundary");// This statement line for HOTJAVABROWSER 3.0
	}else{
		boundary = "--"+boundary;
	}
	if( boundary == null ){

		throw new Exception("BNF");
	}
	// out.println("Content-length:\t"+prop.getProperty("content-length","0"));
	Long contentsize = new Long(prop.getProperty("content-length","0"));
	int c;
	StringWriter st = new StringWriter();

	if( contentsize.longValue() < 1L ){
		throw new Exception("ZERO");
	}
	long l = contentsize.longValue() - ROUGHSIZE;
	/*
		You can restrict upload file size in the following way
	    1. after uploaded u cannt find out file size then display error message
		2. from contentsize it will give approximate size of file in bytes.
		   based on this u can restrict uploading.
	*/
	int KB = 1024;
	int MB = 1024 * KB;
	int csize = (int)(l / MB);
	if( csize > MAXSIZE ){
		throw new Exception("EL");
	}


	ServletInputStream fin =  request.getInputStream();
	// Geting Start Boundary Line
	int cn;
	int count=0;
	while( (c=fin.read()) != -1 ){
                if( c == '\r') break;
                st.write(c);
				count++;
    }
	c=fin.read();//read new line

	String tboundary = st.getBuffer().toString();
	tboundary=tboundary.trim();
	if( ! tboundary.equalsIgnoreCase( boundary) ){
		throw new Exception("BBNF");
	}
    st.close();
    st = null;
	st = new StringWriter();
	//Getting File Information
	while( (c=fin.read()) != -1 ){
        if( c == '\r' ) break;
        st.write(c);
    }
	c=fin.read();//read new line
	String secondline = st.getBuffer().toString();
    String filename  =  getFileName(secondline);
	String uploadFileName = filename;
    st.close();
    st = null;
    st = new StringWriter();
	//Read Content Type of File
	while( (c=fin.read()) != -1 ){
		if( c == '\r' ) break;
		st.write( c );
	}
	c=fin.read();//read new line
	//out.println( st.getBuffer().toString() );
	//Read \r and \n character
	fin.read();
    fin.read();

    /*
	File newfile = null;
	FileOutputStream fout =null;
	try{
		if( filename == null ) throw new FileNotFoundException("File Name not found");
		newfile = new File(DPATH+filename);
		fout = new FileOutputStream( newfile );
	}catch(FileNotFoundException fnexp){
		fin.close();
		throw new Exception("FNF");
	} */
	//System.out.println("A");

    /*
	for( long i = 0L; i < l ; i++){
		c = fin.read();
		if( c == -1 ) break;
		fout.write(c);
	}*/

	ByteArrayOutputStream baos = new ByteArrayOutputStream();
    byte b[] = null;

	if( c != -1 ){
        while(  (c = fin.read()) != -1 ){
            baos.write(c);
		}
		b = baos.toByteArray();
	}

	fin.close();

    Hashtable profile = (Hashtable) session.getValue("profile");    

    boolean status = false;

    if (b != null) {

        status = profileController.setPhotograph(Long.parseLong(profile.get("timescapeUserOID")+""), b);
    }

   String message = "";
   String currUrl = "";

   currUrl = "javascript:uploadPicture();";
   message = "Your picture has been attached. <br>"+
	 "<br><a href=\"javascript:closeWindow()\" class=\"boldunderline\">Close</a>";


%>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
    <tr>
       <td colspan="100%" bgcolor="#75AEC9"class="whiteCopy" height="30">&nbsp;<strong>Upload File</strong></td>
    </tr>
        
	<tr>
		<td align="left" colspan="3"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="40"></td>
	</tr>
	
	<tr>
		<td colspan="3" align="middle" class="normal" valign = "top">&nbsp;<%=message%></td>
		<td>&nbsp;</td>
	</tr>

	<input type = "hidden" name ="uploadFileName" value = "<%//=uploadFileName%>">

	<tr>
		<td width="41%">&nbsp;</td>
		<td width="3%">&nbsp;</td>
		<td width="56%">&nbsp;</td>
	</tr>

	<tr>
		<td align="left" colspan="3"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="70"></td>
	</tr>
</table>
</form>
</body>
</html>