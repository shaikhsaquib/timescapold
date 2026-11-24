<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%-- @ page errorPage="../common/errorPage.jsp" --%>
<%@ include file="../includes/empHeader.jsp" %>

<%@ page import="java.util.*, java.text.*, com.bccl.util.HtmlUtil, com.bccl.util.SQLUtility, com.bccl.governancequiz.domain.GovernancequizUser" %>
<jsp:useBean id="governancequizWebController" class="com.bccl.governancequiz.web.controllerbeans.GovernancequizWebController" /> 

 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
                      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Governance Code Quiz</title>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../jscripts/governanceQuiz.js"></script>

<style type="text/css">
body {
	margin: 0;
	background-image: url(../images/BGimage.jpg);
	background-repeat: no-repeat;
}
.style11 {
	font-size: 80%;
}
</style>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#74cad3">
      <img src="../images/governanceCodeQuiz.jpg" width="615" height="64" alt="Governance Quiz" />
    </td>
  </tr>
  <tr>
    <td align="center" style="font-size: 25px; font-weight: bold;" width="25%">
      <a href="/player/quizvideo.html">WATCH THIS VIDEO ON<br />GOVERNANCE CODE - QUIZ</a>
    </td>
  </tr>
</table>

<%
    if (companyCode.equals("1001")) {
%>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="4" class="style3">
  <tr><td colspan="3">&nbsp;</td></tr>
  <tr>
    <td colspan="3" align="center">
      Following are the links to the documents which need to be read before attempting this Governance Code
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center" valign="middle" class="style3Underline">
      <strong><a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://3b18e35e59699ef892b7753c33ec8245" target="_blank">Gift Policy</a></strong>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center" valign="middle" class="small">
      <strong><a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://6a57cd0794ff050f8d4c5eb1b4d7f932" target="_blank">Whistle Blower Policy</a></strong>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center" valign="middle" class="style3Underline">
      <strong><a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://98b721fff20a4ccc07d2cb1f2425003e" target="_blank">Prevention of Insider Trading</a></strong>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center" valign="middle" class="style3Underline">
      <strong><a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://b6ecf0edcafefb2a9c2bad5ad840ec12" target="_blank">Code of Ethics &amp; Business Principles</a></strong>
    </td>
  </tr>
</table>

<%
    } else {
%>

<table width="600" border="0" align="center" cellpadding="0" cellspacing="4" class="style3">
  <tr><td colspan="3">&nbsp;</td></tr>
  <tr>
    <td colspan="3" align="center">
      Following are the links to the documents which need to be read before attempting this Governance Code
    </td>
  </tr>

<%
    if (companyCode.equals("1005")) {
%>
  <tr>
    <td colspan="3" align="center" class="small">
      <strong><a class="style3Underline" href="https://tlweb.timesgroup.com/timescape/pdf/COC.pdf" target="_blank">Code of Conduct &amp; Ethics</a></strong>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center" class="small">
      <strong><a class="style3Underline" href="https://timeslink.timesgroup.com/irj/portal?NavigationTarget=navurl://87674c7342a7e5deeca381d534f1d7a8" target="_blank">Buying Code of Ethics</a></strong>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center" class="style3Underline">
      <strong><a class="style3Underline" href="https://tlweb.timesgroup.com/timescape/pdf/GIFTS POLICY.pdf" target="_blank">Gift Policy</a></strong>
    </td>
  </tr>

<%
    } else {
%>

  <tr>
    <td colspan="3" align="center" class="small">
      <strong><a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://4ad4d41d73b8ca64bbe31f7792e9d4f1" target="_blank">Code of Conduct &amp; Ethics</a></strong>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center" class="small">
      <strong><a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://87674c7342a7e5deeca381d534f1d7a8" target="_blank">Buying Code of Ethics</a></strong>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center" class="style3Underline">
      <strong><a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://3b18e35e59699ef892b7753c33ec8245" target="_blank">Gift Policy</a></strong>
    </td>
  </tr>

<%
    if (companyCode.equals("1000")) {
%>
  <tr>
    <td colspan="3" align="center" class="style3Underline">
      <strong>
        <a class="style3Underline" href="https://performancemanager5.successfactors.eu/sf/learning?destUrl=https%3a%2f%2fbennett%2eplateau%2ecom%2flearning%2fuser%2fdeeplink%5fredirect%2ejsp%3flinkId%3dITEM%5fDETAILS%26componentID%3d593%26componentTypeID%3dONLINE%26revisionDate%3d1597331760000%26fromSF%3dY&company=bennett" target="_blank">POSH Policy</a>
      </strong>
    </td>
  </tr>
<%
    }
  }
%>

<%
    ArrayList statusList = governancequizWebController.checkStatus(timescapeUserOId);
    ArrayList dateList = governancequizWebController.checkDate(timescapeUserOId);
    ArrayList dateListScore = new ArrayList();

    String date = "";
    String dateScore = "";
    String score = "";
    String createdDate = "";

    for (int ii = 0; ii < dateList.size(); ii++) {
        String[] tmpArr = (String[]) dateList.get(ii);
        date = tmpArr[0];
        createdDate = tmpArr[2];
        score = tmpArr[3];
    }

    String[] statusArr = (String[]) statusList.get(0);

    if (!statusArr[2].equals("N")) {
        dateListScore = governancequizWebController.checkDate(timescapeUserOId, Integer.parseInt(score));

        for (int jj = 0; jj < dateListScore.size(); jj++) {
            String[] tmpArr1 = (String[]) dateListScore.get(jj);
            date = tmpArr1[0];
            createdDate = tmpArr1[2];
            dateScore = tmpArr1[3];
        }
%>

  <tr><td colspan="3" bgcolor="#587DAB"><img src="../images/spacer.gif" width="1" height="1" alt="spacer" /></td></tr>
  <tr>
    <td colspan="3" align="center" bgcolor="#CBECEF">
      <strong class="style3Underline">
      You have already answered the Governance Code - Quiz!<br />
      Your score is : <%=dateScore%> / 100
      <%
        if (dateScore.equals("100")) {
            out.println("<br>You can re-appear for the Quiz from 1st of April in the next financial year <br>");
        } else {
            out.println("<br>You can re-appear for the Quiz on or after <br>" + date);
        }
      %>
      </strong>
    </td>
  </tr>

<%
if (dateScore.equals("100")) {
%>
<table align="center" width="100%">
  <tr align="center">
    <td>
      <a href="javascript:void window.open('../requestor/certificatePage.jsp?toDate=<%=statusArr[1]%>&startDate=<%=statusArr[0]%>&date=<%=date%>&createdDate=<%=createdDate%>&score=<%=dateScore%>')" title="Print Certificate Page">Print Certificate Page</a>
    </td>
  </tr>
</table>
<%
}
    session.setAttribute("quiz", "2");
  } else {
    session.setAttribute("quiz", "1");
%>

  <tr>
    <td colspan="3" align="center" valign="middle">
      <p>I would like to continue with the Governance Code Quiz.</p>
    </td>
  </tr>
  <tr><td colspan="3" bgcolor="#587DAB"><img src="../images/spacer.gif" width="1" height="1" alt="spacer" /></td></tr>
  <tr>
    <td colspan="3" align="center" bgcolor="#CBECEF">
      <input name="Submit3" type="button" class="name" value="Continue" onclick="callValidate()" />
    </td>
  </tr>

<%
  }
%>

</table>
<p>&nbsp;</p>
<%
  } // end outer else
%>

</body>
</html>
