<%--
 -- @(#)errorPage.jsp	15/3/2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Manisha Wadhawane
 -- @version 	1.00, 15/3/2008
 --%>

<%@ page isErrorPage="true"%>

<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.workflow.web.util.Constants,com.bccl.workflow.web.util.HtmlUtil,com.bccl.util.Log"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>



<%

    /*
    The curlink and sublink needs to be set according to the roles to display the dynamic menu .
    */
//    session.setAttribute("currLink","checkLeaveStatus.jsp");
//    session.setAttribute("subLink","checkLeaveStatus.jsp");
//    String breadcrumbs = Breadcrumbs.get("leaveBreadcrumbs","errorPage.breadcrumb");

%>


<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
        <form name="frm_errorPage" method="post">
        <%//@ include file="../includes/utilMenu.jsp" %>
        <%//@ include file="../includes/breadcrumbs.jsp" %>
        <%//@ include file="../includes/empHeader.jsp" %>
        <%//@ include file="../includes/timescapeHeader.jsp" %>

       
		<!-- Outer most table -->
			<table width = "99%" border = "0"  align="center" cellspacing="0" cellpadding="0">
			
				<tr>
					<td>
															
									<table width="75%" border="0" align="center">

											<tr>
												<td>
													<img src="../images/spacer.gif" width="1" height="40">
												</td>
											</tr>

										   <tr>
                                             <td colspan = "100%" align= "center" >
									 			<!-- <img height= "15" src="../images/error.gif"> -->
											 </td>
										   </tr>

                                            <tr>
                                             <td width="12%">&nbsp;</td>
                                             <td width="77%" class="normal"><p align="center">
											 
												<div align="center">
                                                            <%

                                                                if (exception != null) {
                                                                    Log.printLog(exception, "JSP Error"+request.getRequestURI(), 2);
                                                                }
                                                            %>


                                                          <center>Claim Balances for the current financial year have not been updated yet.<br>
                                                            <BR>Please try after some time.<br><br><br></center>
                                                      </div>

												</td>
                                             <td width="11%">&nbsp;</td>
                                            </tr>

											<tr>
											 <td colspan = "100%" align= "center" >
												<a href = "javascript:history.back();" class="underline"><strong>Click here</strong></a><span class = "normal"> to return </span>
											 </td>
										   </tr>

    						
						</table>
					</td>
				</tr>
			
			</table>
		<!-- Outer most table ends here -->
		</form>
	</body>
</html>