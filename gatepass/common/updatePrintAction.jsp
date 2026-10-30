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
	int row = 0;
	int totalPendingQuan1 = 0;
	String gatepassId	  = (String) request.getParameter("gatepassId");
	String pageName		  = (String) request.getParameter("pageName");
	String status		  = (String) request.getParameter("flag");
	String type			  = (String) request.getParameter("type");
	String spId			  = (String) request.getParameter("spId");
	String rows			  = (String) request.getParameter("rows");
	row					  = Integer.parseInt(rows);

	String totalPendingQuan = (String) request.getParameter("totalPendingQuan");
	String securityRemarks = (String) request.getParameter("securityRemarks");
	String serialno		= (String) request.getParameter("serialno");
	String pendingQuan		= (String) request.getParameter("pendingQuantity");

	
	String status1		  = (String) request.getParameter("status");

	String size          = (String) request.getParameter("size");
	int size1			 = Integer.parseInt(size);


	Hashtable remarkdata = new Hashtable();
	
	boolean secuRemark			= false;

	
	

	remarkdata.put("GatepassID",gatepassId);
	

	
		for(int k=0;k < size1 ; k++)
		{
			remarkdata.put("SerialNo"+k,(String)request.getParameter("serialno"+k));
			securityRemarks=(String)request.getParameter("securityRemarks"+k);
			pendingQuan=(String)request.getParameter("pendingQuantity"+k);
			
			if(("".equals(securityRemarks) || "null".equals(securityRemarks)) && pendingQuan.equals("0"))
			{
				
					remarkdata.put("securityRemarks"+k,"NA");
					remarkdata.put("status",status);
					remarkdata.put("size",size);
					remarkdata.put("timescapeUserOId",timescapeUserOId+"");

			} else
			{
					remarkdata.put("securityRemarks"+k,securityRemarks);
					remarkdata.put("status",status);
					remarkdata.put("size",size);
					remarkdata.put("timescapeUserOId",timescapeUserOId+"");
			}
		}
	
	

	secuRemark  = GatepassController.insertData(remarkdata);
		
	Hashtable detailsHash = new Hashtable();
	Hashtable quantityHash = new Hashtable();
	ArrayList detailsList = new ArrayList();
	ArrayList detailsListLog = new ArrayList();


	detailsHash.put("PRINTEDBY", timescapeUserOId+""); 

	detailsHash.put("GATEPASSID", gatepassId);
	
	detailsHash.put("MODIFIEDBY",timescapeUserOId+""); 

	if(totalPendingQuan.equals("0"))
		{
			detailsHash.put("STATUS", "CL"); 
		}
	else 
		{
			detailsHash.put("STATUS", status);
		}

	int counter = 0;

	for(int ii=0; ii < row ; ii++)
		{

			String	quantity        = (String) request.getParameter("quantity"+ii);
			String	quantityReturn  = (String) request.getParameter("quantityReturn1"+ii);
			String	pendingQuantity = (String) request.getParameter("pendingQuantity"+ii);
			String	srno = (String) request.getParameter("srno"+ii);
	
			//row++;
			String[] valArr = new String [8];
			
			valArr[0] = quantityReturn;
			valArr[1] = pendingQuantity;
			valArr[2] = gatepassId;
			valArr[3] = srno;
			valArr[4] = counter+"";
			valArr[5] = type;
			valArr[6] = quantity;
			valArr[7] = timescapeUserOId+"";
		
			detailsList.add(valArr);	
		}

	//boolean flag = false;
	Hashtable resultHash = new Hashtable();

	resultHash = GatepassController.modifyRequest(detailsHash, detailsList);

	Boolean flag = (Boolean)resultHash.get("FLAG");

  if(flag)
		{

	//response.sendRedirect("../common/promptPage.jsp?msg=SUC_REQ_PROCESSOR");
%>
	 <script language="javascript">
		//frmObj = document.frmProcessAcceptDetails;
		self.close();
		self.opener.location.reload();
		frmObj.action="../processor/processRequests.jsp";
		frmObj.submit();
	</script>  
<%
	}
	else
	{
		response.sendRedirect("../common/promptPage.jsp?msg=ERR_REQ_PROCESSOR");
	}

%>
	
	