<%@page import="com.bccl.util.EnvProperties"%>
<%!
	String IMAGE_PATH = EnvProperties.getValue("IMAGE_PATH");
%>

<script>
	function showBirthday(){
		url = "/timescape/collaboration/birthday/showBirthday.jsp";
		win = window.open(url,"Weather","top=0,left=0,width=800,height=300,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	}

	function showCalendar(){
		url = "/timescape/common/calendar.jsp";
		window.open(url,"Calendar","toolbars=no,scrollbars=0,width=350,height=217, top=100,left=100");
	}
</script>


<%
int startCounter= 0;
int endCounter= 3;
long timeLine = System.currentTimeMillis();

// Population of String Array of Links to Quick Access Applications
String linksArr[ ] = {	"<a href = \"/timescape/common/leave.jsp\" class = \"timescapeHeaderLink\">leave</a>",
						"<a href = \"/timescape/common/attendance.jsp\" class = \"timescapeHeaderLink\">attendance</a>",
						"<a href = \"/timescape/common/requisition.jsp\" class = \"timescapeHeaderLink\">requisition</a>",
						"<a href = \"/timescape/common/timesDirectory.jsp\" class = \"timescapeHeaderLink\">telephone directory</a>",
						"<a href = \"javascript:showBirthday()\" class = \"timescapeHeaderLink\">birthday</a>",
						"<a href = \"javascript:showCalendar()\" class = \"timescapeHeaderLink\">calendar</a>",
						"<a href = \"/timescape/resourcecentre/infoline/hdfcatm/atm.jsp?link=mumbai\" class = \"timescapeHeaderLink\">infoline</a>",
						"<a href = \"/timescape/collaboration/timesmail/timesmail.jsp?"+ timeLine +"\" class = \"timescapeHeaderLink\" target = \"_blank\">timesmail</a>"
					};
// Population of String Array of Icons to Quick Access Applications
String iconArr[ ] = {	"leave_icon.gif",
						"attendance_icon.gif",
						"req_icon.gif",
						"teldir_icon.gif",
						"birthday_icon.gif",
						"leavebook.gif",
						"infoline.gif",
						"timesmail_icon.gif"
					};

%>

<table width="99%" border="0" align="center" cellspacing="0" cellpadding="0">
<tr>
	<td align="left" valign="bottom" width="20%"><img src="<%=IMAGE_PATH%>tshome_logo.gif"></td>

	<td align="left" valign="bottom" width="2%"><img src="<%=IMAGE_PATH%>spacer.gif"></td>

	<td align="center" width="74%">
		<table width="100%" border="0" align="center" cellspacing="0" cellpadding="0">
<%
for(int ii=0; ii <= 3; ii++){
	if( (startCounter >= linksArr.length)){
		break;
	}
%>
			<tr>
<%
		for(int jj=startCounter; jj <= endCounter; jj++){
%>
				<td align="center" class="normal"><img src="<%=IMAGE_PATH%>vline.gif" align="absmiddle" height = "15" width = "2"></td>

				<td align="left" class="normal" bgcolor="#FFFFFF">
					<img src="<%=IMAGE_PATH%><%=iconArr[jj]%>" border="0" align="absmiddle">
				</td>

			 	<td align="left" class="normal">
					<%=linksArr[jj]%>
				</td>

<%
    }
%>
			</tr>
<%
		    	startCounter = endCounter + 1;
		    	endCounter = startCounter + 3;
}
%>
		</table>
	</td>

	<td align="right" valign="bottom" width = "1%" background="<%=IMAGE_PATH%>lt_midimg.gif"><img src="<%=IMAGE_PATH%>spacer.gif" width="14" height="14"></td>
</tr>
</table>
