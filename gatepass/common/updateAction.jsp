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
	String status			= (String) request.getParameter("flag");
	
	String spId				= (String) request.getParameter("spId");
	String type				= (String) request.getParameter("type");
	String remarks		    = (String) request.getParameter("remarks");
	String authrisedemailid = (String) request.getParameter("authrisedemailid");
	String securityRemarks = (String) request.getParameter("securityRemarks");

	//String authName = "";

	//out.println(tmpDetArr[12]);

	/*
	Hashtable remarkdata = new Hashtable();
	
	boolean secuRemark			= false;

	remarkdata.put("GatepassID",tmpArr[0]);
	remarkdata.put("SerialNo",tmpDetArr[12]);
	remarkdata.put("status",tmpArr[25]);
	remarkdata.put("securityRemarks",securityRemarks);
	remarkdata.put("timescapeUserOId",timescapeUserOId+"");

	secuRemark  = GatepassController.insertData(remarkdata);*/

	Hashtable detailsHash = new Hashtable();
	ArrayList detailsList = new ArrayList();

	//out.println(pageName);

	if(pageName.equals("user")){
	
		detailsHash.put("CREATEDBY", timescapeUserOId+"");    

	}else if(pageName.equals("reviewer")){

		detailsHash.put("REVIEWEDBY", timescapeUserOId+"");    

	}else if(pageName.equals("approver")){

		detailsHash.put("AUTHORISEDBY", timescapeUserOId+"");    

	}else if(pageName.equals("processor")){

		detailsHash.put("PRINTEDBY", timescapeUserOId+"");   
		
	} 

	detailsHash.put("GATEPASSID", gatepassId);     
	detailsHash.put("MODIFIEDBY",timescapeUserOId+"");    
	detailsHash.put("REJECTEDREMARKS",remarks);    
	
	if(type.equals("N") && pageName.equals("processor"))
	{
		detailsHash.put("STATUS", "CL"); 
	}
	else 
	{
		detailsHash.put("STATUS", status);
	}

	String showResponse = "request updated sucessfully!!";

	Hashtable resultHash = new Hashtable();

	resultHash = GatepassController.modifyRequest(detailsHash, detailsList);

	Boolean flag = (Boolean)resultHash.get("FLAG");

	if(pageName.equals("reviewer"))
	{
		if(flag == true)
		{
			String content="" ;
			String emailid2=emailId;
			String subject = "Outward Gatepass Request";
			boolean mailStatus = true;
			String authName = authrisedemailid.substring(0,authrisedemailid.indexOf("."));
			
			content  = "Dear "+authName+", \n\n";
			content += "You have "+gatepassId+" Outward GatePassID is still pending for accepting.\n\n";
			content += "To browse these applications please click the Application Services ---> GatePass ---> Related links ---> Approve Requests link on the home page of TIMESCAPE.\n\n";
			content += "Thank you,\n\n";
			content += "Regards,\n\n";
			content += ""+firstName+" "+surName+" ";

			mailStatus =  
			GatepassController.sendIndividualMail(authrisedemailid,content,emailid2,subject);
		//	GatepassController.sendIndividualMail("kavita.yadav@timesgroup.com",content,emailid2,subject);
			//mailStatus =  GatepassController.sendIndividualMail(authrisedemailid,content,emailid2,subject);
		}

	}

	if(flag){

%>
<!-- 		<td id="updateinfo" height="20px" colspan="8" class="navred" align="center"><%=showResponse%></td>  -->
			<span id="updateinfo" height="20px" class="navred" align="center"><%=showResponse%></span>
<%
	}else{
%>
		<span id="updateinfo" height="20px" class="navred" align="center">"Failed to update!!!!"</span>
<%
	}


%>
		
