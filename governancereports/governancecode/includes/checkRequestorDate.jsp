<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar"%> 
<%@ page import="java.text.SimpleDateFormat, java.util.Calendar, java.text.SimpleDateFormat" %>

<% 
      String dt = "";
	  SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy");
      Calendar c1 = Calendar.getInstance();
	  Calendar c2 = Calendar.getInstance();
      c1.setTime(sdf1.parse(toDate));
	 
	  c2.setTime(sdf1.parse(currDate));
//out.println(currDate);
//out.println(toDate);


	  if(c2.before(c1)) { 
		 if(!status.equals("C")) {
%>

	


 <tr>
    <td width="100%" height="17" colspan="4" align="center" valign="middle" bgcolor="#CBECEF" class="style4">
      <div align="center">
        <input type="button" name="Save" value="Save" onclick="validate(<%=governanceResult.size()%>)"/> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="SignOff" value="SignOff"  onclick="signoff(<%=governanceResult.size()%>)"/>
      &nbsp;</div></td>
  </tr>
</table>

<%	
		} 

	  }
%>