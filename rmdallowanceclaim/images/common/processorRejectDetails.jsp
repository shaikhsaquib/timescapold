<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date" %>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />

<form name="frmProcessRejectDetails" method="post">

<%
	//List of all tags need to write in the xml in the specific order
	String[] approvedDateDetails		= {"approvedDateDetails","dId", "DT", "DY", "AR", "AM", "ST"};

	ArrayList tagsLst			= new ArrayList();
	ArrayList dataLst			= new ArrayList();
	ArrayList claimLst			= new ArrayList();

	int  noOfrows = Integer.parseInt(request.getParameter("rows"));
	String  approverAmount = (String)request.getParameter("approverAmount");
	String txnId = (String)request.getParameter("txnId");
	String redirectURL	= "../includes/unauthorized.html";

	String status  ="";
	
	String DT	="";
	String DY	="";				
	//String UR	="";
	String AR	="-";
	String AM	="";
	String ST	="";

		Hashtable ClaimHeader	= new Hashtable( );
		ClaimHeader.put("approverAmount", "0");
		ClaimHeader.put("txnId", txnId);
		ClaimHeader.put("status", "R");
		
		
		for(int ii=0; ii<noOfrows; ii++)
		{
			Hashtable dateHash	= new Hashtable();

			//String particularCheck = (String) request.getParameter("particularsChk"+ii);
		   // approverRemarks		   = (String) request.getParameter("approverRemarks"+ii);
			
			  
			  DT			= (String)request.getParameter("date"+ii);
			  DY			= (String)request.getParameter("day"+ii);
			  //UR			= (String)request.getParameter("remarks"+ii);
			  AR			= (String)request.getParameter("approverRemarks"+ii);
			  AM			= (String)request.getParameter("amount1"+ii);
			  ST			= (String)request.getParameter("processorStatus"+ii);

			  dateHash.put("DT",DT);
			  dateHash.put("DY",DY);
			  //dateHash.put("UR",UR);
			  dateHash.put("AR","-");
			  dateHash.put("AM","0");
			  dateHash.put("ST", "RR");
			
		
		//out.println(dateHash);
		dataLst.add(dateHash);
		
		}

		//out.println(ClaimHeader);
	tagsLst.add(approvedDateDetails);
	claimLst.add(dataLst);

	boolean flag = false;

	flag = rmdAllowanceClaimDetails.updateRejectDetails(ClaimHeader, tagsLst, claimLst);

	if(flag)
	{
%>
	<script language="javascript">
		frmObj = document.frmProcessRejectDetails;
		self.close();
		self.opener.location.reload();
		frmObj.action="../processor/processRequest.jsp";
		frmObj.submit();
	</script>
<%

	}
	else
	{
		response.sendRedirect("../common/promptPage.jsp?msg=ERR_REQ_PROCESSOR");
	}

%>