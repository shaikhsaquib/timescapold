<%@ page language="java" %>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable" %>
<%
	Hashtable profile =  (Hashtable)session.getAttribute("profile");
	if(profile == null){
%>
    <script>
        var url = "/timescape/login/index.jsp";
		window.opener.location.href = url;
        window.close( );
    </script>
<%
	return;
	}

String pageContent = "../common/externalExperience.txt";
%>

<%@page import="com.bccl.profile.web.util.Constants"%>

<html>
	<head>
		<title>B2E</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
		<script language = "javascript">
		    function printWindow()
			{
			   bV = parseInt(navigator.appVersion)
			   if (bV >= 4) window.print()
			}
		</script>
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="javacript:window.focus()">
		<table width = "100%" align="center" cellspacing="0" cellpadding="0" border="1" bordercolor="#6699CC">
            <tr>
				<td bgcolor = "#6699CC" class="whitebig" align="left" height="30">
                    External Experience - Help
                </td>
				<td bgcolor="#6699CC" height = "30" class="whitebig" valign="middle" align = "right">
					<a href="javascript:window.close( )" class="normal"><img src = "../images/close_sym.gif" border="0"></a>&nbsp;
				</td>
            </tr>

            <tr>
				<td colspan="2" height="100">
					<table width = "100%" align="left" cellspacing="0" cellpadding="0" border="0">

					<tr>
						<td class="normal" align="right" colspan="2" bordercolor = "#FFFFFF" height = "20"><a href="javascript:printWindow()" class="rednormal">
						Print This Page</a>&nbsp; 
						<a href="javascript:printWindow()" class="normal"><img src="../images/print.gif" border="0"></a>&nbsp;&nbsp;
						</td>				
					</tr>

						<tr>

							<td class="normal" align="left" height="140" valign="top" colspan="2">
								<p align = "justify" style="line-height: 150%">
									<jsp:include page = "<%=pageContent%>" flush="true"/>
								</p>
							</td>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
        </table>
	</body>
</html>