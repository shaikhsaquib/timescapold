<%@ page language="java" %>
    <%@ include file="../includes/sessionCheck.jsp" %>
    <%//@ page errorPage="../common/errorPage.jsp"%>
    <%@ include file="../includes/empHeader.jsp" %>
    <%@ page import="java.util.Hashtable, java.util.ArrayList" %>
    <%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
    <%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
    <jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 


<%
      String function = request.getParameter("function");
      String policySubHead = request.getParameter("function");
      String compCode = request.getParameter("compCode");
      String frequency1 = request.getParameter("frequency");
      int frequency = Integer.parseInt(frequency1);
      String createdDate = request.getParameter("createdDate");

      String roleId = (String)session.getAttribute("roleId");
      String reportOrderBy = "report";
     
      String process = "";
      String policyHead = "";
      //String subProcess = "";
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
        int count = 0;
        
        String fr[] = new String[50]; 
        String cr[] = new String[50]; 
        String bk[] = new String[50];
        String pr[] = new String[50];

        int yesCount  = 0;
        int noCount   = 0;
        int naCount   = 0;
        int ntaCount  = 0; 
        String colour = "";
        double  noPercent = 0.0;

        ArrayList reportProcess = new ArrayList();

        reportProcess = policyController.NewDashBoardReportProcess(compCode, frequency, createdDate, reportOrderBy, function);

        //out.println(reportProcess.size());

        for (int i = 0; i < reportProcess.size(); i++) {

            String tmpArr [] = (String []) reportProcess.get(i);
            
            //out.println("<br>process11--"+process);
            //out.println("<br>tmpArr[3]--"+tmpArr[3]);
           
            if (function.equals(tmpArr[0]) && !process.equals(tmpArr[1])) {

                noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
                    System.out.println("*******"+noPercent);  
                    fr[count]=function;
                    pr[count]=process;
                    cr[count]=Double.toString(noPercent);
                    yesCount  = 0;
                    noCount   = 0;
                    naCount   = 0;
                    ntaCount  = 0; 
                    colour = "";
                    noPercent = 0.0;
                    if (colorCnt%2==0)
			        bgColor="#F5F8E0";
                    else
					bgColor = "#FBFCEF";
					 
					colorCnt++;
                    count = count+1;
                    bk[count]=bgColor; 
                    function = tmpArr[0];
                    process = tmpArr[1];

                    if (tmpArr[5].equals("Yes")) {
                
                yesCount = yesCount + 1;
            
                } else if (tmpArr[5].equals("No")) {

                    noCount = noCount + 1;
                                
                } else if (tmpArr[5].equals("Not Acted")) {
                    
                    ntaCount = ntaCount +1;
                    
                } else {

                    naCount = naCount + 1;
                    
                }
 
               //subProcess = tmpArr[2];
               //System.out.println("---"+count);
           }
           else{
                if (tmpArr[5].equals("Yes")) {
                
                yesCount = yesCount + 1;
            
                } else if (tmpArr[5].equals("No")) {

                    noCount = noCount + 1;
                                
                } else if (tmpArr[5].equals("Not Acted")) {
                    
                    ntaCount = ntaCount +1;
                    
                } else {

                    naCount = naCount + 1;
                    
                }
               }
        }
        
        noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
        System.out.println("*******"+noPercent); 
        fr[count]=function;
        pr[count]=process;
        cr[count]=Double.toString(noPercent);
        bk[count]=bgColor;  
        //System.out.println("*******"+count); 
        //System.out.println("*******cr[1]"+cr[1]); 
        //System.out.println("*******cr[2]"+cr[2]); 
        
        for ( int i =1; i<count+1; i++) {
            
            //System.out.println("*******fr[1]"+i+"---"+fr[i]);
            if (Double.parseDouble(cr[i]) > 60) {

                colour = "red";

            } else if (Double.parseDouble(cr[i]) < 40) {
            
                colour = "green";

            } else {

                colour = "yellow";
            
            }
               
%>
  
          <tr bgcolor= "<%=bgColor%>">
          <!-- <td width="9%" class="style3Underline"><a href="#" onClick="control('<%=function%>','<%=process%>')"  class="style3Underline"><%=process%></a></td> -->
          <td width="9%" class="style3Underline"><a href="javascript:subProcess('<%=fr[i]%>','<%=pr[i]%>')" class="style3Underline"><%=pr[i]%></a></td>
                  
            

<%
                if (colour.equals("green")) {

%>                    
             <td width="20%"><img src="../images/green.png" width="50" height="25"  /></td>
            </tr>
<%
                } else if (colour.equals("yellow")) {

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
        

%>

<input type = "hidden" value = "<%=compCode%>" name = "compCode">
<input type = "hidden" value = "<%=frequency%>" name = "frequency">
<input type = "hidden" value = "<%=createdDate%>" name = "createdDate">

<tr >
  <td colspan="100%" class="normal" height="30px">&nbsp;</td>
 </tr>
  
  <tr bgcolor="#FFFFFF">
       <td colspan="100%" align="center" class="normal">&nbsp;
            <input type="button" name="Back" value="Back" onclick="javascript:history.back()">
       </td>
   </tr>

 </table>



