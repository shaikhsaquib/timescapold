<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar,java.util.Date, java.text.*,java.util.StringTokenizer" %>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />

<%@ include file="../../../../../common/FSAsapConDetails.jsp" %>
<%@ page import="com.bccl.util.JcoGetDataFromSAP"%>

<%
		// Get the Role Details of an employee
		String redirectURL	= "/timescape/includes/unauthorized.html";
		Hashtable userDetails =  (Hashtable)session.getAttribute("userHash");
		Hashtable rolesHash = (Hashtable)session.getAttribute("rolesHash");
		//out.println(userDetails);

		if (userDetails == null){
			response.sendRedirect(redirectURL);
			return;
		}

		String workflowType = "12";
		
		String timescapeUserOId = (String) userDetails.get("timescapeUserOID");

		String deptGroup = (String) userDetails.get("deptGroup");

		if(rolesHash==null)
		{
			rolesHash = rmdAllowanceClaimDetails.listRoles(Long.parseLong(timescapeUserOId));

			session.setAttribute("rolesHash", rolesHash);
		}

		String roleCode = (String) rolesHash.get(workflowType);
		//if(roleCode != null && !roleCode.trim().equals("")) {
		roleCode = roleCode.substring(0, roleCode.indexOf("|"));

		//Obtaining menus for technical reimbursement
		ArrayList menus = rmdAllowanceClaimDetails.listMenu(Integer.parseInt(workflowType), Long.parseLong(timescapeUserOId));

		session.setAttribute("rmdClaimRole", roleCode);  
		
		session.setAttribute("rmdClaimMenu", menus);

		session.setAttribute("workflowType",workflowType);

		GregorianCalendar today = new GregorianCalendar();

        int todayDay = today.get(Calendar.DAY_OF_MONTH);

		String months[ ] ={"0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};

		String todayMon = months[today.get(Calendar.MONTH)+1];

		int todayMonInt =  Integer.parseInt(todayMon);

		int  todayYear = today.get(Calendar.YEAR);

		String dayMonYear			= todayDay +"-"+todayMon+"-"+todayYear;
	
		if(menus.size() < 1)
		{
			redirectURL	= "/timescape/includes/unauthorized.html";
			response.sendRedirect(redirectURL);
		}		
		else if(deptGroup.equals("1025"))
		{
			String flag = "";

			String portalId			= (String) userDetails.get("portalId");

			String joiningdate      = (String) userDetails.get("joiningdate");

			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

			Date varDate = dateFormat.parse(joiningdate);

			dateFormat =new SimpleDateFormat("dd-MM-yyyy");

			String JD = dateFormat.format(varDate);

			StringTokenizer st = new StringTokenizer(JD, "-"); 

			String[] token = new String[st.countTokens()];
			int p=0;
			while(st.hasMoreElements())
			{
				token[p]=(String)st.nextElement();
				p++;					
			}

			int YYYY	= Integer.parseInt(token[2]);
			int MM		= Integer.parseInt(token[1]);
			int DD		= Integer.parseInt(token[0]);
			
			//String portalId = "ARUNM2606";

			Hashtable SAPConnectionDetails = new Hashtable();

			Hashtable SAPDataHash		= new Hashtable();

			Hashtable SAPColumnHeads = new Hashtable();
			
			Hashtable SAPValues = new Hashtable();
			
			ArrayList SAPReturnValues	= new ArrayList();

			ArrayList importValues =  new ArrayList( );

			SAPConnectionDetails.put("CLIENT","700");
			
			//SAPConnectionDetails.put("USERID","pcomm");
			SAPConnectionDetails.put("USERID","tsrfc");
			
			//SAPConnectionDetails.put("PASSWORD","Welcome");
			SAPConnectionDetails.put("PASSWORD","welcome");
			
			SAPConnectionDetails.put("LANGUAGE","EN");
			//SAPConnectionDetails.put("HOSTNAME","10.100.229.39"); // fOR ppr
			//SAPConnectionDetails.put("HOSTNAME","10.100.223.250"); // for PROD old
			//SAPConnectionDetails.put("HOSTNAME","10.200.67.52"); // for PROD new
			
			SAPConnectionDetails.put("HOSTNAME",hostname); // for ppr new
			//SAPConnectionDetails.put("SYSTEMNO","00");
			
			SAPConnectionDetails.put("SYSTEMNO",systemno);
			
			SAPConnectionDetails.put("RFCNAME","ZRSVP_USER_CHECK_FOR_FSA");

			SAPConnectionDetails.put("TOTALTABLESTOUPDATE", "0");
			
			SAPConnectionDetails.put("RETURNTABLE", "IT_DATA");

			String importKeys[] = {"USERID","BEGDA"};

			String returnKeys[] = {"PERNR"};

			SAPColumnHeads.put("IMPORTKEYS",importKeys);

			SAPColumnHeads.put("RETURNKEYS",returnKeys);

			String importVals[] = {portalId};

			importValues.add(importVals);

			SAPValues.put("IMPORTVALUES",importValues);

			JcoGetDataFromSAP jcoObj = new JcoGetDataFromSAP("rmdallowanceclaim");

			SAPDataHash = jcoObj.jcoGetData(SAPConnectionDetails,SAPColumnHeads,SAPValues);	

			if(SAPDataHash.containsKey("RETURNDATA"))
			{

				SAPReturnValues = (ArrayList)SAPDataHash.get("RETURNDATA");
			}

			if(SAPReturnValues.size() > 0)
			{
				String tmpArr[] = (String[])SAPReturnValues.get(0);

				String SapStatus =tmpArr[0];

				if(SapStatus.equals("Y"))
				{
					if(todayMonInt == 1)
					{
						if((YYYY == todayYear) || ((YYYY < (todayYear-1) && (MM == 12))))
						{
							flag = "allowed";
						}
						else
						{
							flag = "unauthorized";
						}

					}else if(todayMonInt > 1)
					{
						if((YYYY == todayYear) && ((MM == todayMonInt) || (MM == (todayMonInt-2))))
						{
							flag = "allowed";

						}else
						{
							flag = "unauthorized";
						}
					}

				}else if(SapStatus.equals("N"))
				{
					flag = "allowed";					
				} 

				if(flag.equals("allowed"))
				{
					if(roleCode != null && !roleCode.trim().equals("")) 
					{
						if(roleCode.equals("1")) {
							redirectURL = "/timescape/sapep/employeeselfservice/rmdallowanceclaim/requestor/createClaimrequest.jsp";
						} else 
							if(roleCode.equals("2")) {
							redirectURL = "/timescape/sapep/employeeselfservice/rmdallowanceclaim/processor/processRequest.jsp";
							//redirectURL = "/timescape/common/maintenance.html";
						}						
					}
				}else
				{
					redirectURL	= "/timescape/includes/RSVPunauthorized.html";
				}
			}
			
		}else
		{	
			if(roleCode != null && !roleCode.trim().equals("")) 
			{
				if(roleCode.equals("1")) {
					redirectURL = "/timescape/sapep/employeeselfservice/rmdallowanceclaim/requestor/createClaimrequest.jsp";
				} else 
					if(roleCode.equals("2")) {
					redirectURL = "/timescape/sapep/employeeselfservice/rmdallowanceclaim/processor/processRequest.jsp";
					//redirectURL = "/timescape/common/maintenance.html";
				}
			
			//out.println("roleCode="+roleCode);
			//out.println(redirectURL);
			//response.sendRedirect(redirectURL);
			}
		}

		response.sendRedirect(redirectURL);

		//out.println("redirectURL---"+redirectURL);

%>