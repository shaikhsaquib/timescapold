<%--
 -- @(#)errorPage.jsp	9/3/2004
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author  Rathina
 -- @version 	1.00, 9/3/2004
 --%>

<%@ page isErrorPage="true"%>

<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,com.bccl.util.Log"%>
<%@ include file="../includes/sessionCheck.jsp" %>



<%

    /*
    The curlink and sublink needs to be set according to the roles to display the dynamic menu .
    */
    session.setAttribute("currLink","checkLeaveStatus.jsp");
    session.setAttribute("subLink","checkLeaveStatus.jsp");
    String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","promptPage.breadcrumb");

%>


<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
        <form name="frm_errorPage" method="post">
        <%@ include file="../includes/utilMenu.jsp" %>
        <%@ include file="../includes/breadcrumbs.jsp" %>
        <%@ include file="../includes/empHeader.jsp" %>
        <%@ include file="../includes/timescapeHeader.jsp" %>


		<!-- Outer most table -->
			<table width = "99%" border = "0"  align="center" cellspacing="0" cellpadding="0">
				<tr>
					<td>

						<!-- Table to draw the black line starts -->
						<table width="100%%" border="0" cellspacing="0" cellpadding="0" align="center">
							<tr>
								<td background="../images/rt_midimg.gif" valign="bottom" width="1%"><img src="../images/spacer.gif" width="1" height="2"></td>
								<td width="20%" bgcolor="#000000"><img src="../images/spacer.gif" width="1" height="2"></td>
								<td width="78%" bgcolor="#000000"><img src="../images/spacer.gif" width="1" height="1"></td>
								<td background="../images/lt_midimg.gif" valign="bottom" width="1%" bgcolor="#000000"><img src="../images/spacer.gif" width="1" height="1"></td>
							</tr>
						</table>

						<!-- Table to draw the black line ends -->
					</td>
				</tr>

				<tr>
					<td>
						<!--
							table to draw the middle portion
							middle portion includes left,middle,and right content
						-->
						<table border = "0" cellspacing="0" cellpadding="0" width = "100%">



							<tr>
								<!-- the left black border of the page -->
								<td rowspan = "3" valign="bottom" width="1%" background="../images/rt_midimg.gif"><img src="../images/left_bott_curve.gif" width="14" height="14"></td>
								<!-- left border ends -->


								<td valign = "top" class = "normal">


									<table width="75%" border="0" align="center">

											<tr>
												<td>
													<img src="../images/spacer.gif" width="1" height="40">
												</td>
											</tr>

										   <tr>
                                             <td colspan = "100%" align= "center" >
									 			<img height= "15" src="../images/error.gif">
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


                                                          <center>There was an error accessing the information required by you.<br>
                                                            <BR>Sorry for the inconvenience.<br><br><br></center>
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


								<!-- right black border begins -->
								<td align="right" rowspan="3" valign="bottom" width="1%" background="../images/lt_midimg.gif"><img src="../images/rt_bot_curve.gif" width="14" height="14"></td>
								<!-- right black border ends -->
							</tr>

							<tr>
								<td>
									<img src="../images/spacer.gif" width="1" height="10">
								</td>
							</tr>

							<tr>
								<td colspan = "1" bgcolor="#000000" width="98%"><img src="../images/spacer.gif" width="1" height="3"></td>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<%@ include file="../includes/footer.jsp" %>
					</td>
				</tr>
			</table>
		<!-- Outer most table ends here -->
		</form>
	</body>
</html>