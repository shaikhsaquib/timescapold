<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/sapCompCode.jsp" %>
<%@ include file="../../../../../common/sapConnectionDetails.jsp" %>
<%@ include file="../common/config.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList,java.util.Vector,java.util.GregorianCalendar, java.util.Calendar,java.util.StringTokenizer" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="vehicleClaimController" class="com.bccl.claim.web.controllerbeans.VehicleClaimController" /> 

<%
    GregorianCalendar today = new GregorianCalendar();
    ArrayList claimRequests = new ArrayList( );
    String txnStatus = "L";
    String compCode  = (String)request.getParameter("compCode");
	String portalId = (String) profile.get("portalId");

    //Get All the Requests Pending for processing by companyvise
    //claimRequests = medicalClaimController.viewRequest(timescapeUserOId,txnStatus,compCode);
    claimRequests = (ArrayList) session.getAttribute("claimRequests");


	String sqlStatement = "";
	boolean status = false;
	Vector processStat = new Vector();

	Hashtable SAPConnectionDetails = new Hashtable();
	Hashtable SAPColumnHeads = new Hashtable();
	Hashtable SAPValues = new Hashtable();

/* COMMENTED FOR HANA CHANGES

	SAPConnectionDetails.put("CLIENT","700");
	SAPConnectionDetails.put("USERID","tsrfc");
	SAPConnectionDetails.put("PASSWORD","welcome");
	SAPConnectionDetails.put("LANGUAGE","EN");
 // SAPConnectionDetails.put("HOSTNAME","10.100.229.39"); // fOR ppr
	//SAPConnectionDetails.put("HOSTNAME","10.100.223.250"); // for PROD
	SAPConnectionDetails.put("HOSTNAME",hostname); // for PROD new
	//SAPConnectionDetails.put("SYSTEMNO","00");
	SAPConnectionDetails.put("SYSTEMNO",systemno);*/

/* END OF COMMENTED FOR HANA CHANGES*/

	SAPConnectionDetails.put("RFCNAME","ZPY_REIMBURSEMENT_ENTRIES");
	SAPConnectionDetails.put("TOTALTABLESTOUPDATE","1");
	SAPConnectionDetails.put("TABLENAME1","PERKS_ENTRIES");
	
	String lineItem[] = {"MANDT", "MTHLY_COMPCODE", "MTHLY_SRNO", "MTHLY_EMPLNO", "MTHLY_TRANSCODE", "MTHLY_PAYMONTH", "MTHLY_EFFECTIVE", "ZEXM", "ZTAX", "MTHLY_SAP_PAYROL", "MTHLY_SAP_FISCAL", "MTHLY_ENTLCODE", "MTHLY_CLAIMD_AM", "MTHLY_ACCEPT_AM", "MTHLY_AMOUNT_PAY", "MTHLY_NOTCONSID", "WAERS", "MTHLY_RECORDTRAN", "MTHLY_SOURCELOC", "MTHLY_DOCTMPNUMB","VERIFIED_BY"};
	
	SAPColumnHeads.put("LINEITEM1",lineItem);

%>

<%
for(int ii=0; ii < claimRequests.size( ); ii++){
	String appl[ ] = (String[ ]) claimRequests.get(ii);

	// Get the status of the checkbox
	String nameStr = "process"+ii;
	String values = (String) request.getParameter(nameStr);

	if(values == null){
		continue;
	}else{
		//System.out.println("values "+values);
		ArrayList batch = new ArrayList( );
		ArrayList updateMedical = new ArrayList( );
       	Hashtable legacyHash	= new Hashtable( );
		ArrayList lineItemList =  new ArrayList( );

		if(values.equalsIgnoreCase("acc")){

            String txnId        = appl[12];
            String claimAmount	= appl[13];
			String userSapNo	= appl[3];
			String actualAmount	= claimAmount;

            // Update the status in medicalClaim transaction file
			updateMedical = vehicleClaimController.process(txnId,claimAmount,emailId);
			batch.addAll(updateMedical);

            // Data for SAP table entry
			String todayDay		= Integer.toString(today.get(Calendar.DAY_OF_MONTH));
			String todayMonth	= Integer.toString(today.get(Calendar.MONTH)+1);
			String todayYear	= Integer.toString(today.get(Calendar.YEAR));

			if(todayDay.length()==1){
				todayDay = "0"+todayDay;
			}

			if(todayMonth.length()==1){
				todayMonth = "0"+todayMonth;
			}

			String appliedDate		= appl[16];

			StringTokenizer st = new StringTokenizer(appliedDate, "-"); 
			String[] token = new String[st.countTokens()];
			int p=0;
			while(st.hasMoreElements())
			{
				token[p]=(String)st.nextElement();
				p++;					
			}

			String YYYY = token[2];
			String MM = token[1];
			String DD = token[0];						
			String applDtSapFormat = YYYY+MM+DD;
			String processDtSapFormat = todayYear+todayMonth+todayDay;

			int payrollPeriod = today.get(Calendar.MONTH)+1;

			if( payrollPeriod >=4 && payrollPeriod <=12){
				payrollPeriod = payrollPeriod - 3;
			}else{
				payrollPeriod = payrollPeriod + 9;
			}
			//out.println(payrollPeriod);

            String companyCodeUser		= appl[1];
			String sapCompCodeUser = (String)sapCompCode.get(companyCodeUser);


			String lineItems[] = {"700", sapCompCodeUser, txnId, userSapNo, "ZLVR", processDtSapFormat, applDtSapFormat, "-", "-", payrollPeriod+"", faStartYear, "ZLVR", claimAmount, claimAmount, "-", "-", "INR", "V", "-", txnId, portalId};
				
			lineItemList.add(lineItems);

			SAPValues.put("LINEITEMLIST1",lineItemList);

			// insert into the erp system
			status = vehicleClaimController.process(batch, SAPConnectionDetails, SAPColumnHeads, SAPValues);
			//out.println(status);

			if(!status){
				processStat.addElement("false");
			}

		}//end of if of acc

	}//end of else

} // end of for

	// Check the vector for error and use the redirect
	boolean stat = processStat.contains("false");

	if(stat){
		response.sendRedirect("../common/promptPage.jsp?msg=7&compCode="+compCode);
		return;
	}else{
		response.sendRedirect("../common/promptPage.jsp?msg=17&compCode="+compCode);
		return;
	}
%>