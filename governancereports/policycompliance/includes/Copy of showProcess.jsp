<%@ page language="java" %>
    <%@ include file="../includes/sessionCheck.jsp" %>
    <%//@ page errorPage="../common/errorPage.jsp"%>
    <%@ include file="../includes/empHeader.jsp" %>
    <%@ page import="java.util.Hashtable, java.util.ArrayList" %>
    <%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
    <%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>

<%
      String function = request.getParameter("function");
      //String subProcess = request.getParameter("subProcess");
      //out.println("<br>subProcess---"+subProcess);
      String roleId = (String)session.getAttribute("roleId");
     
      String process = "";
      String policyHead = "";
      //String subProcess = "";

       ArrayList  reportArray = (ArrayList) session.getAttribute("reportArray");
%>

    <html>
    <head>
    <title>OCA Report</title>

    <link href="../style/compliance.css" rel="stylesheet" type="text/css" />
 
     <script Language="JavaScript" src="../jscripts/report.js"></script>

    </title>
    </head>

    <body>
    <form name="frmMainControl" method = "post" action = "">

   <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
        <td bgcolor="#98BF00"><img src="../images/header.jpg" width="519px" height="39" /></td>
      </tr>
  

      <%
        //includes the control tabs for reviewer
        session.setAttribute("currLink","CONTROLS");
        session.setAttribute("leftLink","0");
    %>
        <%//@ include file="../includes/dashBoardTabs.jsp" %>

    </table>

    <%
        //includes the frequency tabs for reviewer
        session.setAttribute("currLink","WEEKLY");
        session.setAttribute("leftLink","1");
    %>
    <%//@ include file="../includes/dashBoardFrequencyTabs.jsp" %>

    <br />

      <table width="100%" align="left" cellpadding="1" cellspacing="1">

       <tr>
      <td height="27"  class="style3">
      
      <table width="100%" align="center" cellpadding="1" cellspacing="1">
        <tr colspan = "10">
          
              <td align="left" valign="bottom" class="name" ><img src="../images/legend.jpg"   /> 
              <td>&nbsp;</td>

            </tr> 
  
    </table>

    <table width="100%" align="center" cellpadding="0" cellspacing="0">
      <col width="151" />
      <col width="196" />
      <tr>
        <td height="27" colspan="2" bgcolor="#E0E78F"  class="nameHEAD"> <%=function%> Operations Control</td>
      </tr>
    
  </table>

<table width="100%" align="left" cellpadding="2" cellspacing="1">
<%   
        String bgColor = "";
        int colorCnt = 0;


        for (int i = 0; i < reportArray.size(); i++) {

            String tmpArr [] = (String [])reportArray.get(i);

            //out.println("<br>process11--"+process);
            //out.println("<br>tmpArr[3]--"+tmpArr[3]);
           
            if (function.equals(tmpArr[0]) && !process.equals(tmpArr[13])) {

                    //if (!subProcess.equals(tmpArr[2]) && tmpArr[2] != "") {

                    //policyHead = tmpArr[14];
                    process = tmpArr[13];
                    //}
                    

                     if (colorCnt%2==0)
			        bgColor="#F5F8E0";
                    else
					bgColor = "#FBFCEF";
					  
					colorCnt++;

%>
  
          <tr bgcolor= "<%=bgColor%>">
          <!-- <td width="9%" class="style3Underline"><a href="#" onClick="control('<%=function%>','<%=process%>')"  class="style3Underline"><%=process%></a></td> -->
          <td width="9%" class="style3Underline"><a href="javascript:subProcess('<%=function%>','<%=process%>')" class="style3Underline"><%=process%></a></td>
                  
            

<%
                if (tmpArr[3].equals("green")) {

%>                    
             <td width="20%"><img src="../images/green.png" width="50" height="25"  /></td>
            </tr>
<%
                } else if (tmpArr[3].equals("yellow")) {

%>

            <td width="20%"><img src="../images/yellow.png" width="50" height="25" /></td>
           </tr>

<%                
                } else {

%>
                   <td width="20%"><img src="../images/red.png" width="50" height="25"  /></td>
           </tr>

<%  
               }
            
             //}
           }
        }

%>

<tr >
  <td colspan="100%" class="normal" height="30px">&nbsp;</td>
 </tr>
  
  <tr bgcolor="#FFFFFF">
       <td colspan="100%" align="center" class="normal">&nbsp;
            <input type="button" name="Back" value="Back" onclick="javascript:history.back()">
       </td>
   </tr>

 </table>



