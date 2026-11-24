<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date" %>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<html>
	<head>
		<title>B2E</title>
<%
	/*
	if(companyCode.equals("BCCL")){
		companyCode = "1000";
	} else if(companyCode.equals("TCLL")){
		companyCode = "1028";
	}else if(companyCode.equals("TCL")){
		companyCode = "1029";
	}
	else if(companyCode.equals("WWM")){
		companyCode = "1007";
	}
	
	
	if( companyCode.equals("1003") || companyCode.equals("1024") ||companyCode.equals("1025") ||companyCode.equals("1031") ||companyCode.equals("1032") ||companyCode.equals("1026") ||companyCode.equals("1027")   ||companyCode.equals("1030") || companyCode.equals("1036")|| companyCode.equals("1040") || companyCode.equals("1041")  || companyCode.equals("1043") || companyCode.equals("1039")  )
	{	
	*/
%>
		<!-- <link rel="stylesheet" href="../style/TIL.css"> -->
<%
	//}else if(companyCode.equals("1029") || companyCode.equals("1000") || companyCode.equals("1007")){	
%>
		<!-- <link rel="stylesheet" href="../style/tcl.css"> -->
<%
	//}else{
%>
		<!-- <link rel="stylesheet" href="../style/global.css"> -->
<%	
	//	}
%>

<%
	companyCode = companyCode.equals("BCCL") ? "1000" : companyCode.equals("TCLL") ? "1028" : companyCode.equals("TCL") ? "1029" : companyCode.equals("WWM") ? "1007" : companyCode;

	//out.println(companyCode);

	String cssFile = ( companyCode.equals("1003") || companyCode.equals("1024") ||companyCode.equals("1025") ||companyCode.equals("1031") ||companyCode.equals("1032") ||companyCode.equals("1026") ||companyCode.equals("1027")   ||companyCode.equals("1030") || companyCode.equals("1036")|| companyCode.equals("1040") || companyCode.equals("1041")  || companyCode.equals("1043") || companyCode.equals("1039")  ) ? "TIL.css" :
	(companyCode.equals("1029") || companyCode.equals("1000") || companyCode.equals("1007")) ? "tcl.css" : "global.css";
%>
		<link rel="stylesheet" href="../style/<%=cssFile%>">
	</head>
	<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
	<form name="frmcardTemp" method="post">

<%
	long requestId = Long.parseLong(request.getParameter("id"));
	//companyCode = "1003";
	ArrayList requestDetails = new ArrayList( );

	requestDetails = businessCardUserWebController.view(requestId, companyCode, companyCode);

	String tempArr[ ] = (String[ ]) requestDetails.get(0);

	String cardTemplate			= tempArr[10];
	String oldReq				= cardTemplate;
	out.println("cardTemplatee --->"+cardTemplate);
	String backDesignVal		= "";
	out.println(companyCode);
	if((companyCode.equals("1003") || companyCode.equals("1024") ||companyCode.equals("1025") ||companyCode.equals("1026") ||companyCode.equals("1031") ||companyCode.equals("1032") ||companyCode.equals("1027") ||companyCode.equals("1030") || companyCode.equals("1029") ||  companyCode.equals("1028") || companyCode.equals("1000") || companyCode.equals("1036") || companyCode.equals("1040") || companyCode.equals("1041") || companyCode.equals("1043") || companyCode.equals("1039") || companyCode.equals("1007") || companyCode.equals("1049")) && ( cardTemplate.indexOf('-') > 0 ) )
	{	
		if( !(cardTemplate.equals("IDIVA") || cardTemplate.equals("IND")))
				{
					boolean retval = true;
					retval = cardTemplate.contains("-");
					if(retval)
					{
					String  card = cardTemplate.substring(0, cardTemplate.indexOf('-'));
					backDesignVal = cardTemplate.substring( cardTemplate.indexOf('-') +1);
					//out.println("cardTemplate:"+cardTemplate);
					//out.println("backDesignVal:"+backDesignVal);
					cardTemplate=card;
					
					}
				}
				
				out.println("cardTemplate -> "+cardTemplate);
	}
	
	String name					= tempArr[1];
	String firstName1			= name.substring(0,name.indexOf(" "));
	String lastName				= name.substring(name.indexOf(" ")+1);
	String designation1			= tempArr[2];
	String workArea				= tempArr[3];
	String addressLine1			= tempArr[30];
	String addressLine2			= tempArr[31];
	String directPhoneNo		= tempArr[5];
	String mobileNumber			= tempArr[7];
	String fax					= tempArr[6];
	String userBoardNumber		= tempArr[4];
	String extensionNumber		= tempArr[8];
	String userEmail			= tempArr[33];
	String userLocationCode		= tempArr[32];
	String website				= tempArr[9];
	String compName				= tempArr[36];
	String userSapNumber		= tempArr[40];
	String department			= deptName;
  %>

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td  colspan="100%" class="bold" height="30" align="center">
					CARD TEMPLATE
				</td>
			</tr>
		</table>
<%
	String roleCode = (String)session.getAttribute("businessCardRole");
	if(!roleCode.equals("5")){
%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">

			<tr>
				<td class="bold" align="center" height="30" colspan="2">&nbsp;User's original information :</td>
				<td class="bold" align="center" height="30" colspan="2">&nbsp;User's information changed to :</td>
			</tr>

<%
		if (!tempArr[26].equalsIgnoreCase(firstName1))
		{
%>
			<tr>
				<td width="15%" class="bold" align="right" height="30">&nbsp;First Name :</td>
				<td width="35%" class="normal" align="left" height="30">&nbsp;<%=tempArr[26]%></td>
				<td width="15%" class="bold" align="right" height="30">&nbsp;First Name :</td>
				<td width="35%" class="normal" align="left" height="30">&nbsp;<%=firstName1%></td>
			</tr>
<%
		}
		if (!tempArr[27].equalsIgnoreCase(lastName))
		{
%>
			<tr>
				<td width="15%" class="bold" align="right" height="30">&nbsp;Last Name :</td>
				<td width="35%" class="normal" align="left" height="30">&nbsp;<%=tempArr[27]%> </td>
				<td width="15%" class="bold" align="right" height="30">&nbsp;Last Name :</td>
				<td width="35%" class="normal" align="left" height="30">&nbsp;<%=lastName%></td>
			</tr>
<%
		}
		if (!tempArr[29].equalsIgnoreCase(designation1))
		{
%>
			<tr>
				<td width="15%" class="bold" align="right" height="30">&nbsp;Designation :</td>
				<td width="35%" class="normal" align="left" height="30">&nbsp;<%=tempArr[29]%></td>
				<td width="15%" class="bold" align="right" height="30">&nbsp;Designation :</td>
				<td width="35%" class="normal" align="left" height="30">&nbsp;<%=designation1%></td>
			</tr>
<%
		}
		if (!tempArr[34].equalsIgnoreCase(userLocationCode))
		{
%>
			<tr>
				<td width="15%" class="bold" align="right" height="30">Location :&nbsp;&nbsp;</td>
				<td width="35%" class="normal" align="left" height="30"><%=tempArr[35]%></td>
				<td width="15%" class="bold" align="right" height="30">Location :&nbsp;&nbsp;</td>
				<td width="35%" class="normal" align="left" height="30"><%=userLocationCode%></td>
			</tr>
<%
		}if (!tempArr[26].equalsIgnoreCase(firstName1)||!tempArr[27].equalsIgnoreCase(lastName)||!tempArr[29].equalsIgnoreCase(designation1)||!tempArr[34].equalsIgnoreCase(userLocationCode))
		{
%>
			<tr>
				<td width="15%" class="bold" align="right" height="30">&nbsp;SAP Id :</td>
				<td width="35%" class="normal" align="left" height="30">&nbsp;<%=userSapNumber%></td>
			</tr>
<%
		}	if((tempArr[26].equalsIgnoreCase(firstName1))&&(tempArr[27].equalsIgnoreCase(lastName))&&(tempArr[29].equalsIgnoreCase(designation1))&&(tempArr[34].equalsIgnoreCase(userLocationCode)))
		{
%>
			<tr>
				<td class="normal" align="center" height="30" colspan="4">No mismatch!!!</td>
			</tr>
<%
		}
%>
		</table>
<%
	}
%>      
        <br>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" bordercolor="#cccccc">
		<tr>
			<td height = "10"><img src ="../images/spacer.gif"></td>
		</tr>
		<tr>
			<td align="center">
				<%@ include file = "../includes/listCardTemplate.jsp" %>			
			</td>
		</tr>
<%
		if( ( companyCode.equals("1003") || companyCode.equals("1024") ||companyCode.equals("1026") ||companyCode.equals("1032") ||companyCode.equals("1027")  ||companyCode.equals("1025")||companyCode.equals("1031") ||companyCode.equals("1030") || companyCode.equals("1036")|| companyCode.equals("1040") || companyCode.equals("1041") || companyCode.equals("1043") || companyCode.equals("1039") || companyCode.equals("1049")) && (  oldReq.indexOf('-') > 0  ))
		{
			//out.println("companyCode="+companyCode);
%>
            <tr width="100%" height ="100%">
                <td width ="100%" height ="30">
                </td>

            </tr>
           
			<tr>
				<td align="center" >
				<%@ include file = "../includes/showBackDesign.jsp" %>			
				</td>
			</tr>
<%
			
		}else if((companyCode.equals("1028") ||companyCode.equals("1029") || companyCode.equals("1000")  || companyCode.equals("1007")) && ( oldReq.indexOf('-') > 0 )){
			//out.println("test");
%>

			 <tr width="100%" height ="100%">
                <td width ="100%" height ="30">
                </td>

            </tr>
           
			<tr>
				<td align="center" >
				<%@ include file = "../includes/viewDefault.jsp" %>			
				</td>
			</tr>
<%}%>


		<tr>
			<td height = "30"><img src ="../images/spacer.gif"></td>
		</tr>

		<tr>
			<td align="center">
				<a href = "javascript:close()" class = "normal"><img src = "../images/but_close.gif" border = "0" align="center"></a>
			</td>
		</tr>

		</table>
		</form>
	</body>
</html>