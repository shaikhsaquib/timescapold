<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar"%> 
<%@ page import="java.text.SimpleDateFormat, java.util.Calendar, java.text.SimpleDateFormat" %>

<% 
      String dt = "";
      String dt1 = "";
	  
	  SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MMM-yyyy");
      Calendar c1 = Calendar.getInstance();
	  Calendar c2 = Calendar.getInstance();
      //c1.setTime(sdf1.parse(toDate));
	  c1.add(Calendar.DATE,1);
	  dt = sdf1.format(c1.getTime());
	  c2.setTime(sdf1.parse(currDate));
//	  dt1 = sdf1.format(c2.getTime());
	  out.println(dt1);
	  if(c2.before(c1)) {
		 if(!status.equals("C")) {
%>

	</table>
	

<table width="100%" height="40" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td width="100%" height="17" colspan="4" align="center" valign="middle" bgcolor="#CBECEF" class="style4">
      <div align="center">
<input type="hidden" name="size" value="<%=approverResult.size()%>" >        
    
<input type="button" name="Save" value="Save & Submit Later" onclick="validateAppr(<%=approverResult.size()%>)"/> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name="SignOff" value="Save & Final Submission"  onclick="signoffAppr(<%=approverResult.size()%>)" <%if(a == 1){%>disabled="disabled"<%}%>/>
      &nbsp;</div></td>
  </tr>
</table>
</form>
<%	
		} else {
%>
        <!-- <td width="100%" height="17" colspan="4" align="center" valign="middle" bgcolor="#CBECEF" class="style4"> -->
        <table width="100%" height="40" border="0" cellpadding="2" cellspacing="2">
            <tr>
                <td width="100%" height="17" colspan="4" align="center" valign="middle" bgcolor="#CBECEF" class="style4">You have Submitted your code successfully!!!</td>
            </tr>
        </table>
<%        
        }
	  }
%>