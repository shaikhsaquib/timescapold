<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ include file="../includes/empHeader.jsp" %>
<%!
									public static String getCurrentFinancialYearUp() {
										int getCurrentYear		= getCurrentYearUp();
										String financialYear 	= Integer.toString(getCurrentYear) + "-" + Integer.toString(++getCurrentYear);
										return financialYear;
									}
%>
<%!
									public static int getCurrentYearUp() {
										Calendar cal 		= Calendar.getInstance();
										int currentYear 	= cal.get(Calendar.YEAR);
										int currentMonth 	= cal.get(Calendar.MONTH);
										int currentDate 	= cal.get(Calendar.DAY_OF_MONTH);

										//out.println(currentYear);
									
										//if((currentMonth < 3) && (currentDate < 16)) {
										//if((currentMonth < 3) && (currentDate < 31)) {
										if((currentMonth < 3)) {
											currentYear 	= currentYear - 1;
										}
										return currentYear;
									}
								%>
<%
	String DPATH = EnvironmentProperties.getValue("lta", "uploadPath");
	
	String fileName=(String)request.getParameter("fileName");
    String emailid=(String)request.getParameter("emailid");
    String str=(String)request.getParameter("str");
	

//	System.out.println("fileName---"+fileName);
//	System.out.println("emailid---"+emailid);
//	System.out.println("str---"+str);

	String dPath ="";

	if(str.equals("1")){
		String requestNo=(String)request.getParameter("requestNo");
		String attachment=(String)request.getParameter("attachment");

		dPath =DPATH +  getCurrentFinancialYearUp() + "/" + companyCode + "/"+emailid+"/"+attachment+"/"+fileName;
	}else{
		dPath=DPATH +  getCurrentFinancialYearUp() + "/" + companyCode + "/"+emailid+"/"+"additional"+"/"+fileName;
		//System.out.println("dPath>>>>>>---"+dPath);
	}
	//System.out.println("dPath>>>>>>---"+dPath);

	File f=new File(dPath);
	System.out.println("f---"+f);

		//System.out.println(emailid);
//    String requestNo=(String)request.getParameter("requestNo");
    //String root = this.getServletContext().getRealPath("");
   // File f=new File(DPATH+emailid+"/"+requestNo +"/"+fileName);
   
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
%>