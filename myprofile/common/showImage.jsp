<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.io.*, java.util.*" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs"%>

<jsp:useBean id="imageReader" class="com.bccl.profile.web.controllerbeans.ProfileController" />

<%
    String timescapeUserOID = request.getParameter("timescapeUserOID");
    String alternateImagePath = request.getParameter("alternateImagePath");

    byte [] buffer=  imageReader.getPhotograph(Long.parseLong(timescapeUserOID),alternateImagePath);
    //  System.out.println("buffer is"+buffer.length);
    ServletOutputStream opStream = response.getOutputStream();
    ByteArrayInputStream ipStream = new ByteArrayInputStream(buffer);
    if(buffer != null)
    {
    byte[] tempBuff = new byte[10 * 1024];

    while((ipStream.read(tempBuff)) != -1)
    {
        opStream.write(tempBuff);
        opStream.flush( );
        tempBuff = new byte[10 * 1024];
    }
    //opStream.flush();
    opStream.close( );
    ipStream.close( );
}
%>