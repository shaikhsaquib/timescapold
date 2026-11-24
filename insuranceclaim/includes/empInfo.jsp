<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="groupwareWebController" class="com.bccl.groupware.web.controller.GroupwareWebController" /> 
<%
    String emailId = (String)request.getParameter("emailId");
    Hashtable infoHash = new Hashtable();
    infoHash.put("emailId", emailId);


    ArrayList infoList = new ArrayList();
    infoList = groupwareWebController.peopleLocator(infoHash);

    if(infoList.size()>0){
        for(int jj=0;jj<infoList.size();jj++){
            String infoArr[] = (String[])infoList.get(jj);

%>
<table border = "0" cellspacing="1" cellpadding="2" width ="100%">
    <tr>
        <td class="bold" align="right" width="50%">Name of Company</td>
        <td class="bold" align="center" width="2%">:</td>
        <td class="redfont" align="left" width="48%"><%=infoArr[3]%></td>
    </tr>
    <tr>
        <td class="bold" align="right" width="50%">Branch</td>
        <td class="bold" align="center" width="2%">:</td>
        <td class="redfont" align="left" width="48%"><%=infoArr[4]%></td>
    </tr>
    <tr>
        <td class="bold" align="right" width="50%">Location</td>
        <td class="bold" align="center" width="2%">:</td>
        <td class="redfont" align="left" width="48%"><%=infoArr[5]%></td>
    </tr>
    <tr>
        <td class="bold" align="right" width="50%">Department</td>
        <td class="bold" align="center" width="2%">:</td>
        <td class="redfont" align="left" width="48%"><%=infoArr[6]%></td>
    </tr>
    <tr>
        <td class="bold" align="right" width="50%">Designation</td>
        <td class="bold" align="center" width="2%">:</td>
        <td class="redfont" align="left" width="48%"><%=infoArr[7]%></td>
    </tr>
</table>
<%
        }
    }
%>