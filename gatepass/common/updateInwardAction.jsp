<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>

<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>
<%@ page import="java.util.Hashtable,java.util.ArrayList" %>
<link href="../style/global.css" rel="stylesheet" type="text/css" />

<%	
 
	String gatepassId		= (String) request.getParameter("gatepassId");
	String pageName			= (String) request.getParameter("pageName");
	String status			= (String) request.getParameter("status");
	
	String spId				= (String) request.getParameter("spId");
	String type				= (String) request.getParameter("type");
		
	String row			  =  request.getParameter("rows");
	int rows				  = Integer.parseInt(row);

	String authorisedBy = (String)request.getParameter("authorisedBy");

	String	totalPendingQuan = (String) request.getParameter("totalPendingQuan");
	String	remarks = (String) request.getParameter("remarks");
	
	
	Hashtable detailsHash = new Hashtable();
	ArrayList detailsList = new ArrayList();

	detailsHash.put("INWARDGATEPASSID", gatepassId);
	detailsHash.put("REMARKS", remarks);

	if(type.equals("N") && status.equals("RA"))
		{
			detailsHash.put("RECEIVEDBY", timescapeUserOId+""); 
			detailsHash.put("STATUS", "CL"); 
		}
	else 
		{
				
			if(status.equals("RA") || status.equals("RR")){
			
				detailsHash.put("RECEIVEDBY", timescapeUserOId+"");  
				detailsHash.put("STATUS", status);

				
			} else if (status.equals("MA") || status.equals("MR"))
			
			{	
				String[] userName = authorisedBy.split(",");

				detailsHash.put("MODIFIEDBY", timescapeUserOId+"");

				detailsHash.put("ACCEPTEDBY", userName[0]);

				detailsHash.put("TOTALPENDINGQUANTITY", totalPendingQuan);

				detailsHash.put("STATUS", status);

				for(int ii=0; ii < rows ; ii++)
				{
					String	 srno = (String) request.getParameter("srno"+ii);
					String	 recQuantity = (String) request.getParameter("recQuantity"+ii);
					String	 sendQuan = (String) request.getParameter("sendQuan"+ii);
					String	 PendingQuan = (String) request.getParameter("PendingQuan"+ii);
					
					//out.println(recQuantity+"-"+sendQuan+"-"+PendingQuan);

					String[] valArr = new String [7];

					valArr[0] = sendQuan;
					valArr[1] = PendingQuan;
					valArr[2] = gatepassId;
					valArr[3] = srno;
					valArr[4] = recQuantity;
					valArr[5] = timescapeUserOId+"";
					valArr[6] = type;
					
					detailsList.add(valArr);

					//row++;	
			
				}

			} else if(status.equals("AA") || status.equals("AR"))

			{
			   detailsHash.put("ACCEPTEDBY", timescapeUserOId+""); 
			   detailsHash.put("STATUS", status);

			}else if(status.equals("PA"))

			{
				detailsHash.put("APPROVEDBY", timescapeUserOId+""); 

				if(totalPendingQuan.equals("0")) 
					{
						
						detailsHash.put("TOTALPENDINGQUANTITY", totalPendingQuan);
						
						detailsHash.put("STATUS", "CL"); 
						//out.println("detailsHash1"+detailsHash);

					} else {

						detailsHash.put("STATUS", status);
					}

			} else 
			{
				detailsHash.put("STATUS", status);
			}


	}

	Hashtable resultHash = new Hashtable();
	
	resultHash = GatepassController.modifyInwardRequest(detailsHash, detailsList);

	Boolean flag = (Boolean)resultHash.get("FLAG");
	//Boolean flag = true;

	if(flag == true && status.equals("MA"))
	{	
		String[] userName = authorisedBy.split(",");
	
		String userName1 = userName[1].substring(0,userName[1].indexOf("."));
		//out.println(userName1);

		String content="" ;
		String emailid2=emailId;
		boolean mailStatus = true;
		String subject = "Inward Gatepass Request";
		
		content  = "Dear "+userName1+", \n\n";
		content += "You have "+gatepassId+" Inward GatePassID is still pending for accepting.\n\n";
		content += "To browse these applications please click the Application Services ---> GatePass ---> Related links ---> Approve IW Requests link on the home page of TIMESCAPE.\n\n";
		content += "Thank you,\n\n";
		content += "Regards,\n\n";
		content += ""+firstName+" "+surName+" ";

		//mailStatus =  
		//GatepassController.sendIndividualMail("vishal.kshirsagar@timesgroup.com",content,emailid2);
		mailStatus =  GatepassController.sendIndividualMail(userName[1],content,emailid2,subject);

	}

	if(flag){
		
%>

	<script language="javascript"> 
		frmObj = document.frmViewRequests;
		self.close();
		self.opener.location.reload();
		frmObj.action="../user/viewInwardRequests.jsp";
		frmObj.submit();
	 </script>   

<%
	}else{

		response.sendRedirect("../common/promptPage.jsp?msg=ERR_REVIEWREQ");

	}	
	

%>