<%--
 -- @(#)nominationReports.jsp	12/3/2008
 --
 -- Copyleft 2004 BCCL. All lefts Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Manisha Wadhawane
 -- @version 	1.00, 12/3/2008
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.profile.web.util.Constants,com.bccl.profile.web.util.HtmlUtil"%>
 
<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" scope="session"/>

<html>
	<head>
		<title>
		</title>
		<link rel="stylesheet" href="../style/global.css">
		<script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript" src="../jscripts/nominationReports.js"></script>
	 </head>

<%	
	GregorianCalendar today = new GregorianCalendar();
//	String option = "";
	int currMonth = 0;
	int lastYear = 0;
	int currYear = 0;
	int selYear = 0;
	String monthStr = "";

	// Fetching the tour requests for the current month
	currYear = today.get(Calendar.YEAR)+1;
	selYear = currYear-1;
	lastYear = currYear - 2;
	currMonth = today.get(Calendar.MONTH)+1 ;
	monthStr = currMonth + "";

	//Set link in the session
	session.setAttribute("currLink","medical Insurance reports");
	session.setAttribute("leftLink","2");

	ArrayList resultList  = new ArrayList();

	resultList = mediclaimController.getCompanyCode(sapId);
	//out.println("resultList--"+resultList.size());
	String compCode = "";

	if(resultList.size() > 0){
		for(int i=0;i < resultList.size();i++){

			 String [] tmpArr1 = (String[])resultList.get(i);
			// compCode += tmpArr1[0]+",";
			 compCode = tmpArr1[0];
			
		}
 session.setAttribute("compCode",compCode);
//out.println("compCode--***"+compCode);
	}

	
	////out.println("sapId--"+sapId);
%>
 
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
		<td valign = "top"  width = "80%">
			<%@ include file="../includes/profileTabs.jsp" %>
		</td>
	</tr>
</table>
<form name="frmReports" method="post">
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <th colspan="2" bordercolor="#FFFFFF" scope="row">&nbsp;</th>
  </tr>
  <tr>
    <th width="79%" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal" scope="row">&nbsp;</th>
    <td width="8%" align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <th bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal" scope="row">
	  <div align="right" class="bold">
	    <span class="bold"><strong class="normal">Download complete Employees and Nominees list</strong></span><strong class="normal">&nbsp;&nbsp;</strong>
	  </div>
	</th>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal"><div align="center"><strong class="normal"><a href="javascript:viewNominations()"><img src="../images/downloadexcel.gif" width="16" height="16" border="0"/></a></strong></div></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" class="normal"><div align="right"></div></td>
  </tr>
  <tr>
    <td align="center" valign="middle" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="middle" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">
      <div align="right">
        <p>
            <span class="normal">Download Nominees added in</span>
            <select name="month" class="normal">
				<%= HtmlUtil.getMonthList(monthStr) %>
			</select>
			<select name="year" class="normal">
				<%= HtmlUtil.getYearList(lastYear,currYear, selYear,"desc") %>
			</select>
        </p>
        </div>
    </td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal"><div align="center"><strong class="normal"><a href="javascript:addedNominees()"><img src="../images/downloadexcel.gif" width="16" height="16" border="0"/></a></strong></div></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" class="normal"><div align="right"></div></td>
  </tr>
  <tr>
    <td align="center" valign="middle" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="middle" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">
      <div align="right">
        <p>
            <span class="normal">Download new Nominees added in</span>
            <select name="month" class="normal">
				<%= HtmlUtil.getMonthList(monthStr) %>
			</select>
			<select name="year" class="normal">
				<%= HtmlUtil.getYearList(lastYear,currYear, selYear,"desc") %>
			</select>
        </p>
        </div>
    </td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal"><div align="center"><strong class="normal"><a href="javascript:addedMoreNominees()"><img src="../images/downloadexcel.gif" width="16" height="16" border="0"/></a></strong></div></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" class="normal"><div align="right"></div></td>
    <td align="left" valign="top" bordercolor="#FFFFFF" class="normal"><div align="right"></div></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">
      <div align="right">
        <p>
		    <span class="normal">Download Nominees removed in</span>
            <select name="month" class="normal">
				<%= HtmlUtil.getMonthList(monthStr) %>
			</select>
            <select name="year" class="normal">
				<%= HtmlUtil.getYearList(lastYear,currYear, selYear,"desc") %>
			</select>
          </p>
        </div>
    </td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal"><div align="center" class="normal"><a href="javascript:deletedNominees()"><img src="../images/downloadexcel.gif" width="16" height="16" border="0"/></a></div></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" class="normal"><div align="right"></div></td>
    <td align="left" valign="top" bordercolor="#FFFFFF" class="normal"><div align="right"></div></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">
      <div align="right">
        <p>
		    <span class="normal">Download Employees dis-engaged with their Nominees list in</span>
            <select name="month" class="normal">
				<%= HtmlUtil.getMonthList(monthStr) %>
			</select>
            <select name="year" class="normal">
				<%= HtmlUtil.getYearList(lastYear,currYear, selYear,"desc") %>
			</select>
          </p>
        </div>
    </td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal"><div align="center" class="normal"><a href="javascript:deletedEmpNominees()"><img src="../images/downloadexcel.gif" width="16" height="16" border="0"/></a></div></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal"><div align="left"></div></td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF">&nbsp;</td>
  </tr>
  <%	
		if (!compCode.equals("1001")){
%>
  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
  </tr>



  <tr>
    <th bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal" scope="row">
	  <div align="right" class="bold">
	    <span class="bold"><strong class="normal">Download Employees who have not given the nominations</strong></span><strong class="normal">&nbsp;&nbsp;</strong>
	  </div>
	</th>
     <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal"><div align="center"><strong class="normal"><a href="javascript:noNominations()"><img src="../images/downloadexcel.gif" width="16" height="16" border="0"/></a></strong></div></td> 
  </tr>
    <tr>
    <td bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
  </tr>
  <tr>
    <td bordercolor="#FFFFFF" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" class="normal"><div align="right"></div></td>
  </tr>

  <tr>
    <td bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal">&nbsp;</td>
  </tr>
   <tr>
    <th bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal" scope="row">
	  <div align="right" class="bold">
	    <span class="bold"><strong class="normal">Employee Report – Top Up Option Scheme</strong></span><strong class="normal">&nbsp;&nbsp;</strong>
	  </div>
	</th>
     <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#e8e8e8" class="normal"><div align="center"><strong class="normal"><a href="javascript:topUpAmtReports()"><img src="../images/downloadexcel.gif" width="16" height="16" border="0"/></a></strong></div></td> 
  </tr>
    <tr>
    <td bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" bgcolor="#E8E8E8" class="normal">&nbsp;</td>
  </tr>
   
  <tr>
    <td bordercolor="#FFFFFF" class="normal">&nbsp;</td>
    <td align="left" valign="top" bordercolor="#FFFFFF" class="normal"><div align="right"></div></td>
  </tr>

</table>
 <%	
}
%>
</form>
</body>
</html>
