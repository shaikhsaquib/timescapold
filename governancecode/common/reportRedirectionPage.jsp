<%--
 -- Governance Code
 -- @(#)countReport.jsp	11/05/2011
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Sachin Kale
 -- @version 	1.00, 04-DEC-2011
 --%>

<%@ page language="java" %>

<%@ page import="java.util.Hashtable, java.util.ArrayList" %>

<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>


<%		

   String redirectionCode = request.getParameter("redirectionCode");
   String roleCode = request.getParameter("roleCode");
    //out.println("redirectionCode******"+redirectionCode);
    //out.println("roleCode******"+roleCode);
   //String redirectionCode = (String) session.getAttribute("redirectionCode");
   //out.println(redirectionCode);

   String redirectUrl = "";

   if (redirectionCode.equals("1") && roleCode.equals("1")) {

   //out.println("aaa");

       session.setAttribute("roleId","1");
       redirectUrl = "../requestor/governanceCode.jsp";

   } else if (redirectionCode.equals("1") && roleCode.equals("5")) {

   //out.println("ccc");

       session.setAttribute("roleId","5");
       redirectUrl = "../requestor/governanceCode.jsp";
   
   }else if (redirectionCode.equals("1") && roleCode.equals("2")) {

   //out.println("ccc");

       session.setAttribute("roleId","2");
       redirectUrl = "../approver/governanceAppr.jsp";
   
   }else if (redirectionCode.equals("2") && roleCode.equals("2")) {

   //out.println("bbb");

       session.setAttribute("roleId","2");
       redirectUrl = "../approver/governanceAppr.jsp";

   } else if (redirectionCode.equals("2") && roleCode.equals("4")) {

   //out.println("bbb");

       session.setAttribute("roleId","4");
       redirectUrl = "../approver/governanceAppr.jsp";

   }else if (redirectionCode.equals("3") && roleCode.equals("3")) {

   out.println("ccc");

       session.setAttribute("roleId","3");
       redirectUrl = "../reviewer/countReport.jsp";
   
   } else if (redirectionCode.equals("3") && roleCode.equals("4")) {

   //out.println("ccc");

       session.setAttribute("roleId","4");
       redirectUrl = "../reviewer/countReport.jsp";
   
   }else if (redirectionCode.equals("4")) {

   out.println("ddd");

       session.setAttribute("roleId","4");
       redirectUrl = "../reviewer/countReportSubordinate.jsp";
   
   }else if (redirectionCode.equals("5") && roleCode.equals("4")) {

   //out.println("eee");

       session.setAttribute("roleId","4");
       redirectUrl = "../reviewer/countReport.jsp";

   }else if (redirectionCode.equals("5") && roleCode.equals("5")) {

   //out.println("eee");

       session.setAttribute("roleId","5");
       redirectUrl = "../reviewer/countReport.jsp";

   }else if (redirectionCode.equals("6")) {

   //out.println("fff");

       session.setAttribute("roleId","2");
       redirectUrl = "../reviewer/countReportSubordinate.jsp";
   }

    session.setAttribute("redirectionCode",redirectionCode);

    //out.println("redirectUrl*****"+redirectUrl);
    response.sendRedirect(redirectUrl);
%>

