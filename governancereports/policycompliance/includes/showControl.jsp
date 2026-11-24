<%@ page language="java" %>
    <%@ include file="../includes/sessionCheck.jsp" %>
    <%//@ page errorPage="../common/errorPage.jsp"%>
    <%@ include file="../includes/empHeader.jsp" %>
    <%@ page import="java.util.Hashtable, java.util.ArrayList" %>
    <%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
    <%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
    


<%
      String function = request.getParameter("function");
      String subProcess = request.getParameter("subProcess");
      String roleId = (String)session.getAttribute("roleId");


      String control = "";

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
 
   <table width="100%" align="left" cellpadding="1" cellspacing="1">
      <tr >
        <td height="27" colspan="8" bgcolor="#E0E78F" class="nameHEAD" > <%=subProcess%> - <%=function%> </td>
      </tr>

       
      <tr>
        <td height="27" width = "45%" bgcolor="#4498C6" class="style1"><font color ="#FFFFFF">Control</font></td>
        <td height="27" width = "10%" bgcolor="#4498C6" class="style1"><font color ="#FFFFFF">Status</font></td>
        <td height="27" width = "10%" bgcolor="#4498C6"  class="style1"><font color ="#FFFFFF">Yes</font></td>
        <td height="27" width = "10%" bgcolor="#4498C6"  class="style1"><font color ="#FFFFFF">No</font></td>
        <td height="27" width = "5%" bgcolor="#4498C6" class="style1"><font color ="#FFFFFF">Not Acted</font></td>
        <td height="27" width = "20%" bgcolor="#4498C6" class="style1"><font color ="#FFFFFF">Not Applicable</font></td>
      <!--   <td height="27" width = "10%" bgcolor="#4498C6" class="name"><font color ="#FFFFFF">Total</font></td>
        <td height="27" width = "10%" bgcolor="#4498C6" class="name"><font color ="#FFFFFF">Percentage</font></td> -->

      </tr>

<%   int count = 0;
        String bgcolor = "";

        for (int i = 0; i < reportArray.size(); i++) {

            String tmpArr [] = (String [])reportArray.get(i);
            
            bgcolor="#F7F7F7";

            if(i%2==0)
			bgcolor="";

            if (function.equals(tmpArr[0].trim()) && subProcess.equals(tmpArr[2].trim()) ) {

                if (!control.equals(tmpArr[5])){
                    control = tmpArr[5];

%>
           <tr>
               <td class="style3Underline" height="2" >&nbsp;</td>
               <td>&nbsp;</td>
            </tr>

           <tr bgcolor= "<%=bgcolor%>">
           
           <td height="27" width = "45%"  class="name"> <a href="javascript:detailControl('<%=tmpArr[4]%>')" class="style3Underline"><%=control%></a></td>


     <%      if (tmpArr[6].equals("yellow")) {

%>
                  <td height="27" width = "10%"  class="name"><img src="../images/yellow.png" width="50" height="25" /></td>
<%     
                } else if (tmpArr[6].equals("green")) {

%>       
                <td height="27" width = "10%"  class="name"><img src="../images/green.png" width="50" height="25" /></td>

<%           } else {
%>
                <td height="27" width = "10%"  class="name"><img src="../images/red.png" width="50" height="25" /></td>    
<%       
    }
%>
            <td height="27" width = "10%"  class="name"><%=tmpArr[7]%></td>
            <td height="27" width = "10%"  class="name"><%=tmpArr[8]%></td>
            <td height="27" width = "5%"  class="name"><%=tmpArr[10]%></td>
            <td height="27" width = "20%"  class="name"><%=tmpArr[9]%></td>
     <!--        <td height="27" width = "10%"  class="name"><%=tmpArr[11]%></td>
            <td height="27" width = "10%"  class="name"><%=tmpArr[12]%></td> -->
            </tr>


<% 
                }
             }
        }
%>

<tr>
  <td colspan="100%" class="normal" height="30px">&nbsp;</td>
 </tr>
  
  <tr >
       <td colspan="100%" align="center" class="normal">&nbsp;
            <input type="button" name="Back" value="Back" onclick="javascript:history.back()">
       </td>
   </tr>

</table>



  </form>
  </body>