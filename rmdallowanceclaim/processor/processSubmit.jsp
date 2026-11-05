<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>

<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/sapCompCodeMapping.jsp" %>
<%@ include file="../common/config.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList,java.util.Vector,java.util.GregorianCalendar, java.util.Calendar,java.util.StringTokenizer" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="techAllowanceClaimDetails" class="com.bccl.techAllowanceClaim.web.controllerbeans.TechAllowanceClaimWebController" />

<%
	

	String txnId		= (String)request.getParameter("txnId");
    String compCode		= (String)request.getParameter("compCode");
	
	Hashtable ch1 = new Hashtable();
	int  listSize = Integer.parseInt(request.getParameter("listSize"));
	
    ArrayList claimRequests		= new ArrayList( );
	ArrayList processLst			= new ArrayList( );

    String status			= "L";
	String claimAmount		= "";
	String approvedAmount	= "";
	
	//List of all tags need to write in the xml in the specific order
	String[] approvedDateDetails		= {"approvedDateDetails","detailsId", "date", "day", "userRemarks", "approverRemarks", "amount", "processorStatus"};

	ArrayList tagsLst			= new ArrayList();
	ArrayList claimLst			= new ArrayList();
		
	String date				="";
	String day				="";				
	String userRemarks		="";
	String approverRemarks	="";
	String amount			="";
	String processorStatus	="";

	String approverAmount	="";
    approverAmount = (String)request.getParameter("amount");


	claimRequests = (ArrayList) session.getAttribute("claimRequests");
	boolean flag = false;
	
	String changeStatus		= "";
	
	for(int ii=0; ii < listSize; ii++)
	{
		String appl[ ] = (String[ ]) claimRequests.get(ii);

		Hashtable dateHash	= new Hashtable();	
		Hashtable ClaimHeader = new Hashtable();

		ArrayList dataLst			= new ArrayList();

		// Get the status of the checkbox
		String nameStr = "process"+ii;
		String values = (String) request.getParameter(nameStr);
		//out.println("aaaa" +nameStr);


		if(values == null) {

				continue;
			
		} else {

			txnId			= appl[12];

			int noOfrows = Integer.parseInt(request.getParameter("rows"+ii));

			txnId = ( String ) request.getParameter("txnId"+ ii);
			approverAmount = ( String ) request.getParameter("amount"+ ii);

			ClaimHeader.put("approverAmount", approverAmount);
			ClaimHeader.put("txnId", txnId);
			ClaimHeader.put("changeStatus", changeStatus);
			ClaimHeader.put("approvedBy", emailId);
			
			processLst.add(ClaimHeader);

			for(int kk = 0; kk < noOfrows; kk++)
			{								
				
				//System.out.println("date" + ii + kk);
				
				date				= (String)request.getParameter("date" + ii + kk);
				day					= (String)request.getParameter("day" + ii + kk);
				userRemarks			= (String)request.getParameter("remarks" +ii+ kk);
				approverRemarks		= (String)request.getParameter("approverRemarks" + ii + kk);
				amount				= (String)request.getParameter("approverAmount" +ii+ kk);
				processorStatus		= (String)request.getParameter("processorStatus" +ii+ kk);

			

			if(values.equalsIgnoreCase("acc"))
			{					
				changeStatus = "A";
				
				dateHash.put("date",date);
				dateHash.put("day",day);
				dateHash.put("userRemarks",userRemarks);
				dateHash.put("approverRemarks",approverRemarks);
				dateHash.put("amount",amount);
				dateHash.put("processorStatus", "RA");


			}else 
			{	
				changeStatus = "R";	
				
				dateHash.put("date",date);
				dateHash.put("day",day);
				dateHash.put("userRemarks",userRemarks);
				dateHash.put("approverRemarks",approverRemarks);
				dateHash.put("amount","0");
				dateHash.put("processorStatus", "RR");
						
			} // end of else

			dataLst.add(dateHash);
			
		} // end of inner for loop

	} // end of else 

	claimLst.add(dataLst);
	out.println("---"+changeStatus);
	//out.println("---"+dataLst.size());
	//out.println("---"+claimLst.size());
}//end of for
	
	tagsLst.add(approvedDateDetails);
	
	
	flag = techAllowanceClaimDetails.updateDetails(ch1, tagsLst, claimLst, processLst);
		
	if(flag)
	{
		response.sendRedirect("../common/promptPage.jsp?msg=17&compCode="+compCode);
		
	}else
	{
		response.sendRedirect("../common/promptPage.jsp?msg=7&compCode="+compCode);
		
	}

%>


