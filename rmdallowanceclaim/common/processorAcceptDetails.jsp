<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../../../../../common/sapConnectionDetails.jsp" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date,java.util.GregorianCalendar,java.util.StringTokenizer" %>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />

<form name="frmProcessAcceptDetails" method="post">

<%
	//List of all tags need to write in the xml in the specific order
    GregorianCalendar today = new GregorianCalendar();

	String[] approvedDateDetails		= {"approvedDateDetails","dId", "DT", "DY", "AT", "AR", "AM", "ST"};

	ArrayList tagsLst			= new ArrayList();

	ArrayList dataLst			= new ArrayList();

	ArrayList claimLst			= new ArrayList();

    ArrayList lineItemList =  new ArrayList( );

    ArrayList lineItemList2 =  new ArrayList( );

    String todayDay		= Integer.toString(today.get(Calendar.DAY_OF_MONTH));

    String todayMonth	= Integer.toString(today.get(Calendar.MONTH)+1);

	

    String todayYear	= Integer.toString(today.get(Calendar.YEAR));

    if(todayDay.length()==1){

        todayDay = "0"+todayDay;
    }

    if(todayMonth.length()==1){

        todayMonth = "0"+todayMonth;
    }

	String processDtSapFormat = todayYear+todayMonth+todayDay;

    int payrollPeriod = today.get(Calendar.MONTH)+1;

 		if( payrollPeriod >=4 && payrollPeriod <=12){

			payrollPeriod = payrollPeriod - 3;

		}else{

			payrollPeriod = payrollPeriod + 9;

		}

	int todayMonth1 = today.get(Calendar.MONTH)+1;

	if( todayMonth1 >=4 && todayMonth1 <=12)
	{
		todayMonth = Integer.toString((today.get(Calendar.MONTH)+1) - 3);
		todayYear = Integer.toString(today.get(Calendar.YEAR));

	}else{

		todayMonth = Integer.toString((today.get(Calendar.MONTH)+1) + 9);
		todayYear = Integer.toString(today.get(Calendar.YEAR)-1);

	}

	 if(todayMonth.length()==1){

        todayMonth = "0"+todayMonth;
    }


	int  noOfrows = Integer.parseInt(request.getParameter("rows"));

	String timescapeId = (String) profile.get("portalId");

	String  approverAmount = (String)request.getParameter("approverAmount");

	String  fieldAllClaimedAmt = (String)request.getParameter("fieldAllAmt");

	String  nightAllClaimedAmt = (String)request.getParameter("nightAllAmt");

	String  appliedDate = (String)request.getParameter("appliedDate");

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

    String  claimAmount = (String)request.getParameter("claimAmount");

    String  processAmount = (String)request.getParameter("processAmount");

    String  compCode = (String)request.getParameter("companyCode");

    String  txnId1       = (String)request.getParameter("txnId");

    String  sapNumber   = (String)request.getParameter("sapNumber");

    

	String txnId = (String)request.getParameter("txnId");

	String redirectURL	= "../includes/unauthorized.html";

	String status  ="";
	
	String DT	="";
	String DY	="";				
	String AT	="";
	String AR	="-";
	String AM	="";
	String ST	="";
	int AM1	    = 0;
	int AM2	    = 0;
	int AM3	    = 0;

    Hashtable SAPConnectionDetails = new Hashtable();

	Hashtable SAPColumnHeads = new Hashtable();

	Hashtable SAPValues = new Hashtable();
	Hashtable SAPValues2 = new Hashtable();

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

	SAPConnectionDetails.put("RFCNAME","ZPY_TECH_ENTRIES");
	SAPConnectionDetails.put("TOTALTABLESTOUPDATE","1");
	SAPConnectionDetails.put("TABLENAME1","TECH_ENTRIES");
	
	String lineItem[] = {"MANDT", "BUKRS", "MTHLY_SRNO", "PERNR", "LGART", "ZCLAIM_DATE", "ZAPPROVE_DATE", "PABRP", "PABRJ", "BET01", "BET02", "VERIFIED_BY", "ZFLAG", "TRANS_MONTH", "TRANS_YEAR", "TRANS_BY"};
	
	SAPColumnHeads.put("LINEITEM1",lineItem);

		Hashtable ClaimHeader	= new Hashtable( );
		ClaimHeader.put("approverAmount", approverAmount);
		ClaimHeader.put("txnId", txnId);
		ClaimHeader.put("status", "A");
		//out.println(ClaimHeader);

		
		for(int ii=0; ii<noOfrows; ii++)
		{
			Hashtable dateHash	= new Hashtable();

			String particularCheck = (String) request.getParameter("particularsChk"+ii);
		   // AR				       = (String) request.getParameter("approverRemarks"+ii);
			  
			if(particularCheck!=null && !(particularCheck.trim().equals("") || particularCheck.equals("0")))
			{

			  
			  DT			= (String)request.getParameter("date"+ii);
			  DY			= (String)request.getParameter("day"+ii);
			  AT			= (String)request.getParameter("type"+ii);
			  AR			= (String)request.getParameter("approverRemarks"+ii);
			  AM			= (String)request.getParameter("amt"+ii);
			  AM2			= Integer.parseInt(AM);

			  if(AT.equals("Field Allowance"))
				{
					 //AM = (String)request.getParameter("fieldAllowance");
					 AT = "FA";
					 AM1 = AM1 + AM2;
					 

				}else if(AT.equals("Night Allowance"))
				{
					// AM = (String)request.getParameter("nightAllowance");
					 AT = "NA";
					 AM3 = AM3 + AM2;
					
				}

			  ST			= (String)request.getParameter("processorStatus"+ii);
				
				

			  dateHash.put("DT",DT);
			  dateHash.put("DY",DY);
			  dateHash.put("AT",AT);
			  dateHash.put("AR","-");
			  dateHash.put("AM",AM);
			  dateHash.put("ST", "RA");

			}
			else {
			  
				  DT			= (String)request.getParameter("date"+ii);
				  DY			= (String)request.getParameter("day"+ii);
				  AT			= (String)request.getParameter("type"+ii);
				  AR			= (String)request.getParameter("approverRemarks"+ii);
				  AM			= (String)request.getParameter("amt"+ii);
				  ST			= (String)request.getParameter("processorStatus"+ii);

				  if(AT.equals("Field Allowance"))
				{
					 AT = "FA";

				}else if(AT.equals("Night Allowance"))
				{
					 AT = "NA";
				}

				  dateHash.put("DT",DT);
				  dateHash.put("DY",DY);
				  dateHash.put("AT",AT);
				  dateHash.put("AR",AR);
				  dateHash.put("AM","0");
				  dateHash.put("ST", "RR");
				}
			
				dataLst.add(dateHash);		
		
		}
		
			String fieldAmount = Integer.toString(AM1);
			String nightAmount = Integer.toString(AM3);

			
			tagsLst.add(approvedDateDetails);

	        claimLst.add(dataLst);


            //String lineItems[] = {"700", compCode, txnId1, sapNumber, "9216", applDtSapFormat, processDtSapFormat, payrollPeriod+"", todayYear, claimAmount, approverAmount, timescapeId, "V", "-", "-", "-"};
            String lineItems[] = {"700", compCode, txnId1, sapNumber, "9702", applDtSapFormat, processDtSapFormat, payrollPeriod+"", todayYear, fieldAllClaimedAmt, fieldAmount, timescapeId, "V", "-", "-", "-"};
		
			lineItemList.add(lineItems);

			SAPValues.put("LINEITEMLIST1",lineItemList);			

			boolean flag = false;

			//flag = rmdAllowanceClaimDetails.updateDetails(ClaimHeader, tagsLst, claimLst);

			flag = rmdAllowanceClaimDetails.updateDetails(ClaimHeader, tagsLst, claimLst,SAPConnectionDetails, SAPColumnHeads, SAPValues);

			flag = false;

			String lineItems2[] = {"700", compCode, txnId1, sapNumber, "9216", applDtSapFormat, processDtSapFormat, payrollPeriod+"", todayYear, nightAllClaimedAmt, nightAmount, timescapeId, "V", "-", "-", "-"};
				
					lineItemList2.add(lineItems2);

					SAPValues2.put("LINEITEMLIST1",lineItemList2);

			
//flag = rmdAllowanceClaimDetails.updateDetails(ClaimHeader, tagsLst, claimLst);

			flag = rmdAllowanceClaimDetails.updateDetails(ClaimHeader, tagsLst, claimLst,SAPConnectionDetails, SAPColumnHeads, SAPValues2);

			if(flag)
				{
			%>
				 <script language="javascript"> 
					frmObj = document.frmProcessAcceptDetails;
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
