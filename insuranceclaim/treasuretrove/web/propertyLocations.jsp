<%--
 -- @(#) propertyNavigator.jsp - 26-OCT-2009 
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments -  Links for All Property Assets
 -- @author  -  Vikrant Desai
 -- @version -  1.0
 -- 
 --%>
<%@ page language="java" %>
<html>
<head>
<title>Treasure Trove</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../style/global.css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF">
<form method="post">
	<table width="45%" align="left" border="0" cellspacing="0" cellpadding="0">	

		<%@ include file="../includes/propertyNavigator.jsp" %>
		<tr>
			<td colspan="100%" class="grey" height="30"><img src="../images/plus.gif" border="0">&nbsp;&nbsp;&nbsp;&nbsp;Location-wise Property</td>
		</tr>

<%
	int pos = 0;
	String imageDisplay ="";
	for(int ii=0; ii<= 5; ii++){
						
%>

		<tr>
<%
			for(int jj=0; jj < 4; jj++){

				System.out.println(locationsArr[pos]);
				if(locationsArr[pos].trim().equals("")){
					imageDisplay ="";
				}else{
					imageDisplay = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"../images/minus.gif\" border=\"0\">&nbsp;&nbsp;&nbsp;&nbsp;";
				}

%>			
			<td class="greynormal" height="30"><%=imageDisplay%><a href="<%=propertiesLocationsLinks[pos]%>" class="underline"><%=locationsArr[pos]%></a></td>
<%	
				pos = pos + 1;
			}

%>

		</tr>
<%
	}
%>

		<tr>
			<td colspan="100%" class="normal" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal" align="right" height="30"> Powered by <img src="../images/mini_ts.gif" border="0"></td>
		</tr>


		<tr>
			<td colspan="100%" class="normal" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td colspan="100%" class="normal" align = "center">
				Copyright &copy; 2009 BCCL. All Rights Reserved
			</td>
		</tr>

		<tr>
			<td colspan="100%" class="normal" align = "center">
				Best Viewed in Internet Explorer 6.0 and above. Resolution "1024 x 768."
			</td>
		</tr>
	
	</table>
</form>
</body>
</html>
