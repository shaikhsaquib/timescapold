function showHelp(helpMsg)
{
	var url = "/timescape/myprofile/common/help.jsp?helpMsg="+helpMsg;
	win = window.open(url,"ProfileHelp","width=400,height=200,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
}