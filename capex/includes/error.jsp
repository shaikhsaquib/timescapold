<%@ page isErrorPage="true" %>  
<%@ page import="com.bccl.tsenvironment.Log"%>


<div align="center">
<%

	if (exception != null) {
		Log.printLog("capex", "JSP Error : "+exception+" : "+request.getRequestURI(), 2);
	}
%>

<center>There was an error accessing the information required by you.<br>
<BR>Sorry for the inconvenience.<br><br><br></center>
<td colspan = "100%" align= "center" >
		Click <a href = "javascript:history.back();" class="underline"><strong>here</strong></a><span class = "normal"> to return </span>
</td>
</div>  

