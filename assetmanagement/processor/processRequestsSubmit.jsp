<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.Calendar, java.util.Date" %>

<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController" />

<%
	String count				= (String)request.getParameter("counter");
	String requestId			= (String)request.getParameter("requestId"+count);
	//String timescapeUserOId		= (String)request.getParameter("timescapeUserOId");
	String updateStatus			= (String)request.getParameter("updateStatus"+count);
	//String noteType				= (String)request.getParameter("noteType"+count);
	String userRole				= (String)request.getParameter("userRole"+count);
	//out.println("userRole--"+userRole);
	String userRemarks			= (String)request.getParameter("userRemarks"+count);
	String redirectURL			= "";
	String remarks				= (String)request.getParameter("remarks"+count);
	String action				= (String)request.getParameter("action"+count);
	// start 2/24/2014
	String acceptStr			= (String)request.getParameter("acceptArr");
	String aStatusStr			= (String)request.getParameter("aStArr");
	String rejectStr			= (String)request.getParameter("rejectArr");
	String rStatusStr			= (String)request.getParameter("rStArr");
	String remarkStr			= (String)request.getParameter("remArr");
	Hashtable detailsHash = new Hashtable();
	String [] acceptArr			= acceptStr.split(",");
	String [] aStatusArr			= aStatusStr.split(",");
	String [] rejectArr			= rejectStr.split(",");
	String [] rStatusArr			= rStatusStr.split(",");
	String [] remarkArr			= remarkStr.split(",");
	boolean updateFlag = false;
	String noteType				= "";
	int count1 = Integer.parseInt(count);
	
	int kcount = 0; 
	int ncount = 0; 
	// end 2/24/2014

	for(int k = 1; k<= count1; k++)
	{
		String accept = (String) request.getParameter("accept"+k);

		if((accept!=null && !(accept.trim().equals("") || accept.equals("0"))))
		{		
			noteType = (String)request.getParameter("noteType"+k);
			kcount = kcount+1; 
			//out.println("kcount---"+kcount);

			if(acceptStr!="")
			{	
			//out.println("You Have Accepted Values .....");
				String[] str = null;
		   
			//	for(int i=0; i<acceptArr.length; i++)
			//	{	

					if(noteType.equals("ATN")|| noteType.equals("Asset Transfer Note"))
					{

						noteType = "ATN";

					}else if(noteType.equals("ADN")|| noteType.equals("Asset Disposal Note"))
					{

						noteType = "ADN";

					}
				
					detailsHash.put("REQUESTID", acceptArr[kcount-1]);
					detailsHash.put("NOTETYPE", noteType);
					detailsHash.put("STATUS", aStatusArr[kcount-1]);
					detailsHash.put(userRole, timescapeUserOId+"");
					detailsHash.put("MODIFIEDBY", timescapeUserOId+"");
					detailsHash.put(userRemarks, "-");

					//out.println("----"+detailsHash);
				
					updateFlag = assetMgmt.modifyNote(detailsHash);
					
					if(updateFlag){	
						
						String subject = "Approval pending for "+noteType;
						String mailToWhom ="";
						Hashtable requestHash = new Hashtable();

						requestHash.put("REQUESTID", acceptArr[kcount-1]);

						if(action.equals("Accept")){
							
							if(noteType.equals("ATN")){

								noteType = "Asset Transfer Note";

							}else if(noteType.equals("ADN")){

								noteType = "Asset Disposal Note";

							}	
							mailToWhom	= (String)request.getParameter("mailToWhom"+count);
							out.println(mailToWhom);
							//mailToWhom	= "vikrantsonawane2@gmail.com";
							
							if(!"".equals(mailToWhom.trim()))
							{
						
								%>	
									<%//@ include file="../includes/mailContent.jsp"%>
								<%
						
							}
				
							}
						}			
					else
					{
						break;
					}	 
			} 
		}
	}

	for(int n = 1; n<= count1; n++)
	{
		String rejectReq = (String) request.getParameter("rejectReq"+n);

		if((rejectReq!=null && !(rejectReq.trim().equals("") || rejectReq.equals("0"))))
		{
			noteType = (String)request.getParameter("noteType"+n);

			ncount = ncount+1; 

			if(rejectStr!="")
			{	
				//out.println("You Have Reject Values .....");
				String[] str = null;
			   
				//for(int i=0; i<rejectArr.length; i++)
				//{	
					
					detailsHash.put("REQUESTID", rejectArr[ncount-1]);
					detailsHash.put("NOTETYPE", noteType);
					detailsHash.put("STATUS", rStatusArr[ncount-1]);
					detailsHash.put(userRole, timescapeUserOId+"");
					detailsHash.put("MODIFIEDBY", timescapeUserOId+"");
					detailsHash.put(userRemarks, remarkArr[ncount-1]);

					//out.println("detailsHash---"+detailsHash);
				
					updateFlag = assetMgmt.modifyNote(detailsHash);

					
				// }	 
			}
		}
	}
	
		

	//out.println(action);
	//out.println(userRole);
	
	
	//updateFlag = assetMgmt.modifyNote(detailsHash);

	//out.println(updateFlag);
	//String subject = "Approval pending for "+noteType;
	//String mailToWhom ="";
	//Hashtable requestHash = new Hashtable();

	//requestHash.put("REQUESTID", requestId);



	if(updateFlag){

		redirectURL="../common/promptPage.jsp?msg=success_pro";
	}else{

		redirectURL="../common/promptPage.jsp?msg=error_pro";
	}
	//out.println(redirectURL);
	response.sendRedirect(redirectURL);


%>