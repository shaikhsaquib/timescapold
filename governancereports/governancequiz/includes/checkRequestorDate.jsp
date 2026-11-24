<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar"%> 
<%@ page import="java.text.SimpleDateFormat, java.util.Calendar, java.text.SimpleDateFormat" %>

<% 
      String dt = "";
	  SimpleDateFormat sdf1 = new SimpleDateFormat("DD-MON-YYYY");
      Calendar c1 = Calendar.getInstance();
	  Calendar c2 = Calendar.getInstance();
      c1.setTime(sdf1.parse(toDate));
	 
	  //c2.setTime(sdf1.parse(currDate));
out.println(Calendar c1);
//out.println(toDate);


	  if(c2.before(c1)) { 
		 if(!status.equals("A")) {
%>

	


  <tr>
    <td colspan="6">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6" align="center" bgcolor="#CBECEF">
	<a href="javascript:submit(<%=queNo.size()%>,<%=optNo.size()%>,<%=OptionsField1%>)"><img src="../images/but_submit.gif" alt="submit" valign = "absmiddle" border="0"></a>&nbsp;&nbsp;
	<a href="javascript:clear()"><img src="../images/but_reset.gif" alt="reset" valign = "absmiddle" border="0"></a>
	 </td>
  </tr>
</table>
<%
		}
		else
		{
%>
	<br><br><br><br><br><br>
<table align="center" valign="middle">
	<tr>
	<td height="17" colspan="6" align="center" valign="middle" class="style3">
	<h3>
	
<%
			out.println("you have already given the quiz...");
		}
%>
</h3>
</td>
</tr>


<%	
		} 

	 
%>