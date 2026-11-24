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
      String subFunction = request.getParameter("process");
      String policySubHead = request.getParameter("subProcess");
      String compCode = request.getParameter("compCode");
      String frequency1 = request.getParameter("frequency");
      int frequency = Integer.parseInt(frequency1);
      String createdDate = request.getParameter("createdDate");


      String control = "";
      String process = "";
      String subProcess = "";
      String bgColor = "";

       ArrayList reportProcess = new ArrayList();

       reportProcess = policyController.NewDashBoardReportSubHead(compCode, frequency, createdDate, function, subFunction,policySubHead);
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
        <td height="27" colspan="8" bgcolor="#E0E78F" class="nameHEAD" > <%=policySubHead%> - <%=function%> </td>
      </tr>

       
      <tr>
        <td height="27" width = "45%" bgcolor="#4498C6" class="style1"><font color ="#FFFFFF">Control</font></td>
        <td height="27" width = "10%" bgcolor="#4498C6" class="style1"><font color ="#FFFFFF">Status</font></td>
        <td height="27" width = "10%" bgcolor="#4498C6"  class="style1"><font color ="#FFFFFF">Yes</font></td>
        <td height="27" width = "10%" bgcolor="#4498C6"  class="style1"><font color ="#FFFFFF">No</font></td>
        <td height="27" width = "5%" bgcolor="#4498C6" class="style1"><font color ="#FFFFFF">Not Acted</font></td>
        <td height="27" width = "20%" bgcolor="#4498C6" class="style1"><font color ="#FFFFFF">Not Applicable</font></td>
      </tr>

<%   
        
        int colorCnt = 0;
        int count = 0;
        
        String fr[] = new String[200]; 
        String cr[] = new String[200]; 
        String bk[] = new String[200];
        String pr[] = new String[200];
        String sp[] = new String[200];
        String pid[] = new String[200];
        String ct[] = new String[200];
        String yes[] = new String[200];
        String no[] = new String[200];
        String na[] = new String[200];
        String nta[] = new String[200];

        int yesCount  = 0;
        int noCount   = 0;
        int naCount   = 0;
        int ntaCount  = 0; 
        String colour = "";
        String policyId = "";
        double  noPercent = 0.0;


        for (int i = 0; i < reportProcess.size(); i++) {

            String tmpArr [] = (String [])reportProcess.get(i);
            
            //bgcolor="#F7F7F7";

            //if(i%2==0)
			//bgcolor="";

            //out.println("tmpArr[4]--"+tmpArr[4]);

            //if (function.equals(tmpArr[0].trim()) && process.equals(tmpArr[13].trim()) && subProcess.equals(tmpArr[2].trim())) {

                if ((!control.equals(tmpArr[6]) && tmpArr[6] != "")) {
                    noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
                    System.out.println("^^^^^^"+noPercent);  
                    fr[count]=function;
                    pr[count]=process;
                    sp[count]=subProcess;
                    ct[count]=control;
                    pid[count]=policyId;
                    yes[count]=Integer.toString(yesCount);
                    no[count]=Integer.toString(noCount);
                    na[count]=Integer.toString(naCount);
                    nta[count]=Integer.toString(ntaCount);
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
                    subProcess = tmpArr[3];
                    control = tmpArr[6];
                    policyId = tmpArr[8];

                    if (tmpArr[5].equals("Yes")) {
                
                        yesCount = yesCount + 1;
                        yes[count] = Integer.toString(yesCount);
                    
                        } else if (tmpArr[5].equals("No")) {

                            noCount = noCount + 1;
                            no[count] = Integer.toString(noCount);
                                        
                        } else if (tmpArr[5].equals("Not Acted")) {
                            
                            ntaCount = ntaCount +1;
                            nta[count] = Integer.toString(ntaCount);
                            
                        } else {

                            naCount = naCount + 1;
                            na[count] = Integer.toString(naCount);
                            
                        }

           }
           else{
                if (tmpArr[5].equals("Yes")) {
                
                        yesCount = yesCount + 1;
                        yes[count] = Integer.toString(yesCount);
                    
                        } else if (tmpArr[5].equals("No")) {

                            noCount = noCount + 1;
                            no[count] = Integer.toString(noCount);
                                        
                        } else if (tmpArr[5].equals("Not Acted")) {
                            
                            ntaCount = ntaCount +1;
                            nta[count] = Integer.toString(ntaCount);
                            
                        } else {

                            naCount = naCount + 1;
                            na[count] = Integer.toString(naCount);
                            
                        }
               }
        }
        
        noPercent = ((double)(noCount + ntaCount)/ (yesCount + noCount + naCount + ntaCount)) * 100;
        //System.out.println("*******"+noPercent); 
        fr[count]=function;
        pr[count]=process;
        sp[count]=subProcess;
        ct[count]=control;
        pid[count]=policyId;
        yes[count]=Integer.toString(yesCount);
        no[count]=Integer.toString(noCount);
        na[count]=Integer.toString(naCount);
        nta[count]=Integer.toString(ntaCount);
        cr[count]=Double.toString(noPercent);
        bk[count]=bgColor;  
        
        for ( int i =1; i<count+1; i++) {
            
            if (Double.parseDouble(cr[i]) > 60) {

                colour = "red";

            } else if (Double.parseDouble(cr[i]) < 40) {
            
                colour = "green";

            } else {

                colour = "yellow";
            
            }
%>

           <tr>
               <td class="style3Underline" height="2" >&nbsp;</td>
               <td>&nbsp;</td>
            </tr>

           <tr bgcolor= "<%//=bgcolor%>">
           
           <td height="27" width = "45%"  class="name"> <a href="javascript:detailControlVertical('<%=fr[i]%>','<%=pr[i]%>','<%=sp[i]%>','<%=pid[i]%>')" class="style3Underline"><%=ct[i]%></a></td>


     <%      if (colour.equals("yellow")) {

%>
                  <td height="27" width = "10%"  class="name"><img src="../images/yellow.png" width="50" height="25" /></td>
<%     
                } else if (colour.equals("green")) {

%>       
                <td height="27" width = "10%"  class="name"><img src="../images/green.png" width="50" height="25" /></td>

<%           } else {
%>
                <td height="27" width = "10%"  class="name"><img src="../images/red.png" width="50" height="25" /></td>    
<%       
    }
%>
            <td height="27" width = "10%"  class="name"><%=yes[i]%></td>
            <td height="27" width = "10%"  class="name"><%=no[i]%></td>
            <td height="27" width = "5%"  class="name"><%=nta[i]%></td>
            <td height="27" width = "20%"  class="name"><%=na[i]%></td> 
     <!--        <td height="27" width = "10%"  class="name"><%//=tmpArr[11]%></td>
            <td height="27" width = "10%"  class="name"><%//=tmpArr[12]%></td> -->
            </tr>


<% 
                }
             //}
        //}
%>
<input type = "hidden" value = "<%=compCode%>" name = "compCode">
<input type = "hidden" value = "<%=frequency%>" name = "frequency">
<input type = "hidden" value = "<%=createdDate%>" name = "createdDate">
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