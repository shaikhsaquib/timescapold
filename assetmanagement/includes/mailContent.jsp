<%@ page import="com.bccl.util.SendImapMessage"%>
<%
	Hashtable mailImg = new Hashtable();
	Hashtable details = new Hashtable();

	mailImg.put("UC","http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/inProcess.png");
	mailImg.put("UD","http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/widraw.jpg");
	mailImg.put("UR","http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/retain.png");
	mailImg.put("CL","http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/closed.png");
	mailImg.put("RA","http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/available.png");
	mailImg.put("RR","http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");

	mailImg.put("TS", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ATN_Process.png");
	mailImg.put("TSR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");
	mailImg.put("TV",  "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ATN_Process.png");
	mailImg.put("TVR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");
	mailImg.put("TP",  "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ATN_Process.png");
	mailImg.put("TPR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");
	mailImg.put("TA",  "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ATN_Process.png");
	mailImg.put("TAR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");
	mailImg.put("TCL", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ATN_com.png");
	mailImg.put("TAHR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");

	mailImg.put("DS", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ADN_Process.png");
	mailImg.put("DSR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");
	mailImg.put("DV",  "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ADN_Process.png");
	mailImg.put("DVR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");
	mailImg.put("DP",  "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ADN_Process.png");
	mailImg.put("DPR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");
	mailImg.put("DA",  "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ADN_Process.png");
	mailImg.put("DAR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");
	mailImg.put("DAH",  "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ADN_Process.png");
	mailImg.put("DAHR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");
	mailImg.put("DBH",  "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ADN_Process.png");
	mailImg.put("DBHR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");
	mailImg.put("DCL",  "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/ADN_com.png");
	mailImg.put("DIAR", "http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rejected.jpg");



	String from = "timescape.admin@timesgroup.com";
	String host = "smtp.timesgroup.com";

	ArrayList requestList = new ArrayList();

	requestList = assetMgmt.getMyRequests(requestHash);

	String msgText = "<html>"
	+"<head>"
	+"<title>SURPLUS ASSET MANAGEMENT</title>"
	+"<style type=\"text/css\">"
	+"<!--.normal {FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 8pt; FONT-WEIGHT: normal;TEXT-DECORATION: none;}"
	+"	.nav { "
	+"		TEXT-TRANSFORM: none; FONT-VARIANT: normal; FONT-STYLE: normal; "
	+"		FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 10px; "
	+"		FONT-WEIGHT: bold; TEXT-DECORATION: none; }"
	+" .greyBG {"
	+"		FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #333333; FONT-SIZE: 7pt;"
	+"		FONT-WEIGHT: bolder; TEXT-DECORATION: none; "
	+"		background-image: url "
	+"		('http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/greybg.jpg');"
	+"		background-repeat: repeat-x;"
	+"		background-position: left top; }"
	+"  .budgetMenuBG {"
	+"		FONT-FAMILY: Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 8pt;"
	+"		FONT-WEIGHT: bolder; TEXT-DECORATION: none;"
	+"		background-image: url "
+"('http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/budget_menubg.jpg');"
	+"	background-repeat: repeat-x; background-position: left top; letter-spacing: 0.8em;} "
	+"body {"
	+"	margin-left: 0px;"
	+"	margin-top: 0px;"
	+"	margin-right: 0px;"
	+"	margin-bottom: 0px;"
	+"}"
	+".whitenormal {"
	+"	FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #ffffff; FONT-SIZE: 8pt; FONT-WEIGHT: normal; TEXT-DECORATION: none;"
	+"}"
	+".underline {"
	+"	FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 8pt; FONT-WEIGHT: normal; TEXT-DECORATION: underline"
	+"}"
	+"--></style> "
	+"	</head> "
	+"<body> "
	+" <table width=\"100%\" border=\"0\" cellpadding=\"2\" cellspacing=\"2\">"
	+"    <tr>"
	+"      <td colspan=\"100%\" height=\"20\" bgcolor=\"#E7EAEF\" class=\"budgetMenuBG\">SURPLUS ASSET DETAILS</td>"
	+"	</tr>"
	+"</table>"
	+" <table width=\"100%\" border =\"0\" cellspacing=\"0\" cellpadding=\"1\">";

	if(requestList.size()==0){

	msgText +=" <tr>"
	+"    <td height=\"20\" colspan=\"100%\"><hr></td>"
	+"  </tr>"
	+"  <tr>"
	+"    <td height=\"30\" align=\"center\" valign=\"middle\" class=\"bold\" colspan=\"100%\">There are no details to show!!</td>"
	+"  </tr>"
	+"   <tr>"
	+"    <td height=\"20\" colspan=\"100%\"><hr></td>"
	+"  </tr>";

	}else {

	for(int ii=0; ii< requestList.size(); ii++){

		String tmpArr[] = (String [])requestList.get(ii);

		String loationVal = tmpArr[9].indexOf("-")>-1?tmpArr[9].substring(tmpArr[9].indexOf("-")+1).trim():tmpArr[9];

msgText +="<tr>"
+"	 <td width=\"2%\" align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td width=\"30%\" height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >NAME OF ASSET :</td>"
+"    <td width=\"20%\" height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[3]+"</td>"
+"    <td width=\"3%\" height=\"25\" align=\"right\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td width=\"22%\" height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >AVAILABLE FROM :</td>"
+"    <td width=\"25%\" height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[15]+"</td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>"
+"   <tr>"
+"	 <td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >ASSET NO. :</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[1]+"</td>"
+"    <td height=\"25\" align=\"right\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >DATE OF INSTALLATION :</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[6]+"</td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>"

+"   <tr>"
+"	 <td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >TYPE :</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[5]+"</td>"
+"    <td height=\"25\" align=\"right\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >CATEGORY</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[4]+"</td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>"

+"  <tr>"
+"	 <td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >ORIGINAL COST :</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\"><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rupee.png\" width=\"8\" height=\"10\">&nbsp;"+tmpArr[7]+"</td>"
+"    <td height=\"25\" align=\"right\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >CURRENT VALUE/COST :</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\"><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/rupee.png\" width=\"8\" height=\"10\">&nbsp;"+tmpArr[8]+"</td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>"
+"    <tr>"
+"	 <td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >LOCATION :</td>"
+"    <td height=\"25\" colspan=\"4\" align=\"left\" valign=\"middle\" class=\"normal\"> "+loationVal+"</td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>"

+"   <tr>"
+"	 <td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >MODEL :</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[11]+"</td>"
+"    <td height=\"25\" align=\"right\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >SERIAL NUMBER :</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[2]+"</td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>"

+"   <tr>"
+"	 <td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >DESCRIPTION <br> (make/capacity/specifications) : </td>"
+"    <td height=\"25\" colspan=\"4\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[13]+"</td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>"
+"   <tr>"
+"	 <td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >PRESENT CONDITION : </td>"
+"    <td height=\"25\" colspan=\"4\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[14]+"</td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>"

+"   <tr>"
+"	 <td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\">OWNERSHIP : </td>"
+"    <td height=\"25\" colspan=\"4\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[19]+"</td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>"
+"   "
+"   <tr>"
+"	 <td align=\"left\" valign=\"middle\" class=\"nav\">&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\">POSTING DATE :</td>"
+"    <td height=\"25\" colspan=\"4\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[20]+"</td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\"><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>"
+"   <tr>"
+"	<td align=\"left\" valign=\"middle\" class=\"nav\">&nbsp;</td>"
+"	<td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\">CREATED BY :</td>"
+"	<td height=\"25\" colspan=\"4\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[17]+"</td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>"
+"   <tr>"
+"	 <td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"    <td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >EMAILID :</td>"
+"    <td height=\"25\" colspan=\"4\" align=\"left\" valign=\"middle\" class=\"normal\"><a href=\"mailto:"+tmpArr[18]+"\" class=\"underline\">"+tmpArr[18]+"</a></td>"
+"  </tr>"
+"  <tr>"
+"    <td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"  </tr>";
	if(!("UC".equals(tmpArr[30])||"UR".equals(tmpArr[30]))){

msgText +="	<tr>"
+"		<td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"		<td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >REVIEWED BY :</td>"
+"		<td height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[23]+"</td>"
+"		<td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"		<td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\">REVIEWED ON :</td>"
+"		<td height=\"25\" align=\"left\" valign=\"middle\" class=\"normal\">"+tmpArr[25]+"</td>"
+"	</tr>"
+"	<tr>"
+"		<td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"	</tr>";

	}

msgText +="	<tr>"
+"		<td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"		<td height=\"25\" align=\"left\" valign=\"middle\" class=\"nav\" >STATUS :</td>"
+"		<td height=\"25\" colspan=\"4\" align=\"left\" valign=\"middle\" class=\"normal\">"
+"	<img src=\""+mailImg.get(tmpArr[30].equals("CL")? tmpArr[69] : tmpArr[30])+"\" border=\"0\"></td>"
+"	</tr>"
+"	<tr>"
+"		<td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"	</tr>";

	}
 }

msgText +="	<tr>"
+"		<td align=\"left\" valign=\"middle\" class=\"nav\" >&nbsp;</td>"
+"		<td height=\"25\" colspan=\"5\" align=\"center\" valign=\"middle\" class=\"nav\" >Click <a href=\"http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://392352f0c441b08532aa10b553accc04\">Here</a> to Accept.</td>"
+"	</tr>"
+"	<tr>"
+"		<td height=\"1\" colspan=\"6\" align=\"right\" valign=\"middle\" bgcolor=\"#F5F5F5\" class=\"nav\" ><img src=\"http://tsweb.timesgroup.com/timescape/sapep/collaboration/assetmanagement/images/spacer.gif\" width=\"1\" height=\"1\"/></td>"
+"	</tr>"
+"</table>"
	+"</body>"
	+"</html>";

	details.put("fromAddr",from);
	details.put("toAddr",mailToWhom);
	details.put("subject",subject);
	details.put("content",msgText);
	details.put("mailPath",host);

	boolean mailFlag = false;

	SendImapMessage sendImapMessage = new SendImapMessage();
	//mailFlag = sendImapMessage.sendMail(details);
	//mailFlag = sendImapMessage.sendHtmlMail(details);

	//out.println("mailFlag = "+mailFlag);
%>