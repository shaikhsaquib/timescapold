<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<%@ page import = "com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id = "priceApprovalWebController" class = "com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language = "java" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file = "../includes/empHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv = "Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - SUPPORT/REJECT</title>
<link href = "../style/global.css" rel = "stylesheet" type = "text/css" />
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
</head>
<body>
<%
	String priceid		= (String)request.getParameter("priceid");
	String appType		= request.getParameter("appType");
	String status1		= "";
	String statusType	= request.getParameter("statusType");
	String tOId			= (String)request.getParameter("tOId");
	String sendMailto	= "";

	//out.println("priceid.."+priceid+"  "+"  appType.."+appType+"  statusType.."+statusType+"  tOId.."+tOId);
	
	ArrayList[] sendMailsto = new ArrayList[4];
	boolean	status2 = true;
	boolean	status =true;
	
	ArrayList vStatus	=  new ArrayList();
	ArrayList vStatus2	=  new ArrayList();
	
	vStatus  =	priceApprovalWebController.viewStatus(tOId,request.getParameter("priceid"));
	vStatus2 =	priceApprovalWebController.viewApproverDetails(request.getParameter("priceid"));

	String[] data3 = (String [])vStatus2.get(0);
	String[] data1 = (String [])vStatus.get(0);
	
	String SUPPORTEDBY_DIRECTOR1_STATUS = data3[0]; 
	String SUPPORTEDBY_DIRECTOR2_STATUS = data3[1]; 
	String APPROVER11_STATUS			= data3[2];            
	String APPROVER12_STATUS			= data3[3];           
	String APPROVER13_STATUS			= data3[4];            
	String APPROVER21_STATUS			= data3[5];            
	String APPROVER22_STATUS			= data3[6];            
	String APPROVER23_STATUS			= data3[7];             
	String APPROVER31_STATUS			= data3[8];            
	String APPROVER32_STATUS			= data3[9];            
	String APPROVER33_STATUS			= data3[10];            
	String APPROVER4_STATUS				= data3[11];            
	String APPROVER5_STATUS				= data3[12];            
	String APPROVER6_STATUS				= data3[13];           
	String SUPPORTEDBY_DIRECTOR1_DATE	= data3[14];   
	String SUPPORTEDBY_DIRECTOR2_DATE	= data3[15];   
	String APPROVER11_DATE				= data3[16];              
	String APPROVER12_DATE				= data3[17];              
	String APPROVER13_DATE				= data3[18];              
	String APPROVER21_DATE				= data3[19];              
	String APPROVER22_DATE				= data3[20];              
	String APPROVER23_DATE				= data3[21];              
	String APPROVER31_DATE				= data3[22];              
	String APPROVER32_DATE				= data3[23];              
	String APPROVER33_DATE				= data3[24];              
	String APPROVER4_DATE				= data3[25];              
	String APPROVER5_DATE				= data3[26];              
	String APPROVER6_DATE				= data3[27];
	String APPROVER34_STATUS			= data3[28];
	String APPROVER7_STATUS				= data3[29];
	String APPROVER34_DATE				= data3[30];
	String APPROVER7_DATE				= data3[31];
	String APPROVER8_STATUS				= data3[32];
	String APPROVER8_DATE				= data3[33];
	String APPROVER35_STATUS			= data3[34];
	String APPROVER35_DATE				= data3[35];
	String APPROVER36_STATUS			= data3[36];
	String APPROVER36_DATE				= data3[37];

	int NEGOTIATION_VALUE				= Integer.parseInt(data1[3]);
	String FINALIZED_VENDOR_NAME		= data1[4];
	String CREATEDBY					= data1[58];
	String SD1							= data1[44];
	String SD2							= data1[45];
	String AP11							= data1[46];
	String AP12							= data1[47];
	String AP13							= data1[48];
	String AP21							= data1[49];
	String AP22							= data1[50];
	String AP23							= data1[51];
	String AP31							= data1[52];
	String AP32							= data1[53];
	String AP33							= data1[54];
	String AP4							= data1[55];
	String AP5							= data1[56];
	String AP6							= data1[57];
	String AP34							= data1[74];
	String AP35							= data1[85];
	String AP36							= data1[87];
	String AP7							= data1[75];
	String STATUS						= data1[62];
	String AP8							= data1[81];
	
	ArrayList approvers = new ArrayList();
	ArrayList toCreatedBy = new ArrayList();
	String apprv1 [] = null;
	String apprv [] = null;
	String content = "";
	String content1 = "";
	String htmlStr = "";
	String contentForCreater = "";
	String htmlStrForCreater = "";
	boolean mailStatus = true;
	boolean mailStatus1 = false;
	
	Hashtable emailList = new Hashtable();
	ArrayList approversemailList = new ArrayList();
	emailList.put("PRICEID", priceid);
	approversemailList = priceApprovalWebController.getApproverEmail(emailList);

	String apprvEmail []  = (String [])approversemailList.get(0);

	String participants1 = "";
	String participants2=  "";
	String participants3 = "";
	String participants4 = "";
	String participants5 = "";
	String participants6 = "";
	String participants7 = "";
	String participants8 = "";
	String participants9 = "";
	String participants10 = "";
	String participants11 = "";
	String participants12 = "";
	String buyer = "";
	String user = "";
	String supportedBy = "";

    if(apprvEmail[0]!=null){
            participants1 = apprvEmail[0]+",  ";
    }
    if(apprvEmail[1]!=null){
            participants2 = apprvEmail[1]+",  ";
    }
    if(apprvEmail[2]!=null){
            participants3 = apprvEmail[2]+",  ";
    }
    if(apprvEmail[3]!=null){
            participants4 = apprvEmail[3]+",  ";
    }
    if(apprvEmail[4]!=null){
            participants5 = apprvEmail[4]+",  ";
    }
    if(apprvEmail[5]!=null){
            participants6 = apprvEmail[5]+"   ";
    }
    if(apprvEmail[6]!=null){
            participants7 = apprvEmail[6]+",  ";
    }
    if(apprvEmail[7]!=null){
            participants8 = apprvEmail[7]+",  ";
    }
    if(apprvEmail[8]!=null){
            participants9 = apprvEmail[8]+",  ";
    }
    if(apprvEmail[9]!=null){
            participants10 = apprvEmail[9]+",  ";
    } if(apprvEmail[10]!=null){
            participants11 = apprvEmail[10]+",  ";
    } if(apprvEmail[11]!=null){
            participants12 = apprvEmail[11]+"  ";
    }

    buyer = participants1 + participants2 + participants3;
    user  = participants4 + participants5 + participants6;
    supportedBy = participants7 + participants8 + participants9 + participants10 + participants11 + participants12;

	if(supportedBy.equals("")){
	supportedBy="NA";
	}
    if(appType.equals("AP13"))
	{
        APPROVER13_STATUS="A";
    }
    else if(appType.equals("AP23"))
	{
        APPROVER23_STATUS="A";
    }
    else if(appType.equals("AP33"))
	{
        APPROVER33_STATUS="A";
    }
    else if(appType.equals("AP34"))
	{
        APPROVER34_STATUS="A";
    }
	else if(appType.equals("AP35"))
	{
        APPROVER35_STATUS="A";
    }
	else if(appType.equals("AP36"))
	{
        APPROVER36_STATUS="A";
    }

	ArrayList createdByList = priceApprovalWebController.getApprovers(priceid,CREATEDBY);					
	String createdBy []  = (String [])createdByList.get(0);

	ArrayList approvedByList;
	String approvedBy [] = null;

	if(appType.equals("AP11")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP11);					
		approvedBy = (String [])approvedByList.get(0);
	}else if(appType.equals("AP21")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP21);					
		approvedBy = (String [])approvedByList.get(0);
	}else if(appType.equals("AP31")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP31);					
		approvedBy = (String [])approvedByList.get(0);
	}else if(appType.equals("AP12")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP12);					
		approvedBy = (String [])approvedByList.get(0);
	}else if(appType.equals("AP22")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP22);					
		approvedBy = (String [])approvedByList.get(0);
	}else if(appType.equals("AP32")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP32);					
		approvedBy = (String [])approvedByList.get(0);
	}else if(appType.equals("AP13")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP13);					
		approvedBy = (String [])approvedByList.get(0);
	}else if(appType.equals("AP23")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP23);					
		approvedBy = (String [])approvedByList.get(0);
	}else if(appType.equals("AP33")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP33);					
		approvedBy = (String [])approvedByList.get(0);
	}else if(appType.equals("AP34")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP34);					
		approvedBy = (String [])approvedByList.get(0);
	}else if(appType.equals("AP35")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP35);					
		approvedBy = (String [])approvedByList.get(0);
	}else if(appType.equals("AP36")){
		approvedByList = priceApprovalWebController.getApprovers(priceid,AP36);					
		approvedBy = (String [])approvedByList.get(0);
	}

	ArrayList approvers0, approvers2, approvers3, approvers4, approvers5, approvers6;
	String[] apprv0 = null;
	String[] apprv2 = null;
	String[] apprv3 = null;
	String[] apprv4 = null;
	String[] apprv5 = null;
	String[] apprv6 = null;

	if(!AP35.equals("0")){
		approvers5 = priceApprovalWebController.getApprovers(priceid,AP35);					
		apprv5   = (String [])approvers5.get(0);
	}else if(!AP36.equals("0")){
		approvers6 = priceApprovalWebController.getApprovers(priceid,AP36);					
		apprv6  = (String [])approvers6.get(0);
	}else if(!AP13.equals("0")){
		approvers0 = priceApprovalWebController.getApprovers(priceid,AP13);					
		apprv0   = (String [])approvers0.get(0);
	}else if(!AP23.equals("0")){
		approvers2 = priceApprovalWebController.getApprovers(priceid,AP23);					
		apprv2    = (String [])approvers2.get(0);
	}else if(!AP33.equals("0")){
		approvers3 = priceApprovalWebController.getApprovers(priceid,AP33);					
		apprv3   = (String [])approvers3.get(0);
	}else if(!AP34.equals("0")){
		approvers4 = priceApprovalWebController.getApprovers(priceid,AP34);					
		apprv4  = (String [])approvers4.get(0);
	} 

	//out.println("CREATEDBY..."+CREATEDBY);
		
////////////////////////////////////Tamplets for the Creater.
	//contentForCreater  = "The following Price Approval(PAR Note) request has been approved by :"+approvedBy[0]+". \n\n <br><br>";
	//contentForCreater  = "The following Price Approval(PAR Note) request has been approved>>>>>>. \n\n <br><br>";
	contentForCreater  = "The following Purchase Approval(PAR Note) request has been approved by "+ parDisplayName +". \n\n <br><br>";
	contentForCreater += "Purchase Approval Id : "+ priceid + "\n\n <br>";
	if(!AP35.equals("0")){
		contentForCreater += "Description : "+ apprv5[1] + "\n\n <br>";
	}else if(!AP36.equals("0")){
		contentForCreater += "Description : "+ apprv6[1] + "\n\n <br>";
	}else if(!AP13.equals("0")){		
		contentForCreater += "Description : "+ apprv0[1] + "\n\n <br>";
	}else if(!AP23.equals("0")){		
		contentForCreater += "Description : "+ apprv2[1] + "\n\n <br>";
	}else if(!AP33.equals("0")){
		contentForCreater += "Description : "+ apprv3[1] + "\n\n <br>";
	}else if(!AP34.equals("0")){
		contentForCreater += "Description : "+ apprv4[1] + "\n\n <br>";
	} 
	content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";

	if(!AP35.equals("0")){
		contentForCreater += "User : "+ apprv5[2] + "\n\n <br>";
	}else if(!AP36.equals("0")){
		contentForCreater += "User : "+ apprv6[2] + "\n\n <br>";
	}else if(!AP13.equals("0")){
		contentForCreater += "User : "+ apprv0[2] + "\n\n <br>";
	}else if(!AP23.equals("0")){
		contentForCreater += "User : "+ apprv2[2] + "\n\n <br>";
	}else if(!AP33.equals("0")){
		contentForCreater += "User : "+ apprv3[2] + "\n\n <br>";
	}else if(!AP34.equals("0")){
		contentForCreater += "User : "+ apprv4[2] + "\n\n <br>";
	} 
	contentForCreater += "PC meeting date : "+data1[1]+"\n\n <br>";
	contentForCreater += "Participants : \n\n <br><br>";
	contentForCreater += "Buyer : "+buyer+"\n\n <br>";
	contentForCreater += "User :  "+user+" \n\n <br>";
	contentForCreater += "Supporting Functions : "+supportedBy+" \n\n <br><br>";
	
	if(!AP35.equals("0")){
		contentForCreater += "Sanctioned Value (Rs) : "+apprv5[6]+"\n\n <br>";
	}else if(!AP36.equals("0")){
		contentForCreater += "Sanctioned Value (Rs) : "+apprv6[6]+"\n\n <br>";
	}else if(!AP13.equals("0")){
		contentForCreater += "Sanctioned Value (Rs) : "+apprv0[6]+"\n\n <br>";
	}else if(!AP23.equals("0")){
		contentForCreater += "Sanctioned Value (Rs) : "+apprv2[6]+"\n\n <br>";
	}else if(!AP33.equals("0")){
		contentForCreater += "Sanctioned Value (Rs) : "+apprv3[6]+"\n\n <br>";
	}else if(!AP34.equals("0")){
		contentForCreater += "Sanctioned Value (Rs) : "+apprv4[6]+"\n\n <br>";
	} 

	if(!AP35.equals("0")){
		contentForCreater += "Negotiated Value (Rs) : "+ apprv5[3] + "\n\n <br>";
	}else if(!AP36.equals("0")){
		contentForCreater += "Negotiated Value (Rs) : "+ apprv6[3] + "\n\n <br>";
	}else if(!AP13.equals("0")){
		contentForCreater += "Negotiated Value (Rs) : "+ apprv0[3] + "\n\n <br>";
	}else if(!AP23.equals("0")){
		contentForCreater += "Negotiated Value (Rs) : "+ apprv2[3] + "\n\n <br>";
	}else if(!AP33.equals("0")){
		contentForCreater += "Negotiated Value (Rs) : "+ apprv3[3] + "\n\n <br>";
	}else if(!AP34.equals("0")){
		contentForCreater += "Negotiated Value (Rs) : "+ apprv4[3] + "\n\n <br>";
	} 

	if(!AP35.equals("0")){
		contentForCreater += "Scope : "+apprv5[4]+"\n\n <br>";
	}else if(!AP36.equals("0")){
		contentForCreater += "Scope : "+apprv6[4]+"\n\n <br>";
	}else if(!AP13.equals("0")){
		contentForCreater += "Scope : "+apprv0[4]+"\n\n <br>";
	}else if(!AP23.equals("0")){
		contentForCreater += "Scope : "+apprv2[4]+"\n\n <br>";
	}else if(!AP33.equals("0")){
		contentForCreater += "Scope : "+apprv3[4]+"\n\n <br>";
	}else if(!AP34.equals("0")){
		contentForCreater += "Scope : "+apprv4[4]+"\n\n <br>";
	} 

	if(!AP35.equals("0")){
		contentForCreater += "Recommended Vendor : "+apprv5[5]+"\n\n <br>";
	}else if(!AP36.equals("0")){
		contentForCreater += "Recommended Vendor : "+apprv6[5]+"\n\n <br>";
	}else if(!AP13.equals("0")){
		contentForCreater += "Recommended Vendor : "+apprv0[5]+"\n\n <br>";
	}else if(!AP23.equals("0")){
		contentForCreater += "Recommended Vendor : "+apprv2[5]+"\n\n <br>";
	}else if(!AP33.equals("0")){
		contentForCreater += "Recommended Vendor : "+apprv3[5]+"\n\n <br>";
	}else if(!AP34.equals("0")){
		contentForCreater += "Recommended Vendor : "+apprv4[5]+"\n\n <br>";
	} 		
	contentForCreater += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

	htmlStrForCreater = "<html>" + "\n" 
			+ "<head>" + "\n" 
			+ "	<title>TAM Leads</title>" + "\n" 
			+ "	<style>" + "\n" 
			+ "		.bold {FONT-WEIGHT: bold; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
			+ "		.normal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
			+ "		.bluenormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #6097cf; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
			+ "		.rednormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #ff0000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
			+ "	</style>"
			+ "</head>" 
			+ "<body>" 
			+ "	<form name = \"frmMessage\" method = \"post\">" 
			+ "     <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
			+ "			<tr>" 
			+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price1.jpg\" border = \"0\"></td>" 
			+ "		    </tr>" 
			+ "			<tr>" 
			+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price2.jpg\" border = \"0\"></td>" 
			+ "		    </tr>" 
			+ "		</table> "
			+ "		<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
			+ "			<tr>" 
			+ "				<td width = \"100%\" class = \"normal\" align = \"left\">" 
			+ "					<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
			+ "						<tr>" 
			+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"20\">&nbsp;</td>" 
			+ "						</tr>" 
			+ "						<tr>" 
			+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\">&nbsp;</td>" 
			+ "							<td colspan = \"3\" align = \"left\" class = \"normal\">" 
			+ "								<div align = \"left\">" + contentForCreater + "</div>" 
			+ "							</td>" 
			+ "						</tr>" 
			+ "						<tr>" 
			+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\"></td>" 
			+ "						</tr>" 
			+ "					</table> "					
			+ "				</td>" 
			+ "			</tr><br>" 
			+ "		</table>"
			+ "</form></body>"
			+ "</html>";	


////////////////////////////////////Tamplets for the Approver.

	content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
	content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
	if(!AP35.equals("0")){
		content += "Description : "+ apprv5[1] + "\n\n <br>";
	}else if(!AP36.equals("0")){
		content += "Description : "+ apprv6[1] + "\n\n <br>";
	}else if(!AP13.equals("0")){		
		content += "Description : "+ apprv0[1] + "\n\n <br>";
	}else if(!AP23.equals("0")){		
		content += "Description : "+ apprv2[1] + "\n\n <br>";
	}else if(!AP33.equals("0")){
		content += "Description : "+ apprv3[1] + "\n\n <br>";
	}else if(!AP34.equals("0")){
		content += "Description : "+ apprv4[1] + "\n\n <br>";
	} 

	content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";

	if(!AP35.equals("0")){
		content += "User : "+ apprv5[2] + "\n\n <br>";
	}else if(!AP36.equals("0")){
		content += "User : "+ apprv6[2] + "\n\n <br>";
	}else if(!AP13.equals("0")){
		content += "User : "+ apprv0[2] + "\n\n <br>";
	}else if(!AP23.equals("0")){
		content += "User : "+ apprv2[2] + "\n\n <br>";
	}else if(!AP33.equals("0")){
		content += "User : "+ apprv3[2] + "\n\n <br>";
	}else if(!AP34.equals("0")){
		content += "User : "+ apprv4[2] + "\n\n <br>";
	} 	

	content += "PC meeting date : "+data1[1]+"\n\n <br>";
	content += "Participants : \n\n <br><br>";
	content += "Buyer : "+buyer+"\n\n <br>";
	content += "User :  "+user+" \n\n <br>";
	content += "Supporting Functions : "+supportedBy+" \n\n <br><br>";
	
	if(!AP35.equals("0")){
		content += "Sanctioned Value (Rs) : "+apprv5[6]+"\n\n <br>";
	}else if(!AP36.equals("0")){
		content += "Sanctioned Value (Rs) : "+apprv6[6]+"\n\n <br>";
	}else if(!AP13.equals("0")){
		content += "Sanctioned Value (Rs) : "+apprv0[6]+"\n\n <br>";
	}else if(!AP23.equals("0")){
		content += "Sanctioned Value (Rs) : "+apprv2[6]+"\n\n <br>";
	}else if(!AP33.equals("0")){
		content += "Sanctioned Value (Rs) : "+apprv3[6]+"\n\n <br>";
	}else if(!AP34.equals("0")){
		content += "Sanctioned Value (Rs) : "+apprv4[6]+"\n\n <br>";
	} 

	if(!AP35.equals("0")){
		content += "Negotiated Value (Rs) : "+ apprv5[3] + "\n\n <br>";
	}else if(!AP36.equals("0")){
		content += "Negotiated Value (Rs) : "+ apprv6[3] + "\n\n <br>";
	}else if(!AP13.equals("0")){
		content += "Negotiated Value (Rs) : "+ apprv0[3] + "\n\n <br>";
	}else if(!AP23.equals("0")){
		content += "Negotiated Value (Rs) : "+ apprv2[3] + "\n\n <br>";
	}else if(!AP33.equals("0")){
		content += "Negotiated Value (Rs) : "+ apprv3[3] + "\n\n <br>";
	}else if(!AP34.equals("0")){
		content += "Negotiated Value (Rs) : "+ apprv4[3] + "\n\n <br>";
	} 

	if(!AP35.equals("0")){
		content += "Scope : "+apprv5[4]+"\n\n <br>";
	}else if(!AP36.equals("0")){
		content += "Scope : "+apprv6[4]+"\n\n <br>";
	}else if(!AP13.equals("0")){
		content += "Scope : "+apprv0[4]+"\n\n <br>";
	}else if(!AP23.equals("0")){
		content += "Scope : "+apprv2[4]+"\n\n <br>";
	}else if(!AP33.equals("0")){
		content += "Scope : "+apprv3[4]+"\n\n <br>";
	}else if(!AP34.equals("0")){
		content += "Scope : "+apprv4[4]+"\n\n <br>";
	} 

	if(!AP35.equals("0")){
		content += "Recommended Vendor : "+apprv5[5]+"\n\n <br>";
	}else if(!AP36.equals("0")){
		content += "Recommended Vendor : "+apprv6[5]+"\n\n <br>";
	}else if(!AP13.equals("0")){
		content += "Recommended Vendor : "+apprv0[5]+"\n\n <br>";
	}else if(!AP23.equals("0")){
		content += "Recommended Vendor : "+apprv2[5]+"\n\n <br>";
	}else if(!AP33.equals("0")){
		content += "Recommended Vendor : "+apprv3[5]+"\n\n <br>";
	}else if(!AP34.equals("0")){
		content += "Recommended Vendor : "+apprv4[5]+"\n\n <br>";
	} 
	//content += "Purchase Approval Link on Timescape : 10.100.36.198:8080/timescape/login/index.jsp \n\n <br><br>";
	content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
	content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

	htmlStr = "<html>" + "\n" 
			+ "<head>" + "\n" 
			+ "	<title>TAM Leads</title>" + "\n" 
			+ "	<style>" + "\n" 
			+ "		.bold {FONT-WEIGHT: bold; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
			+ "		.normal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
			+ "		.bluenormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #6097cf; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
			+ "		.rednormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #ff0000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
			+ "	</style>"
			+ "</head>" 
			+ "<body>" 
			+ "	<form name = \"frmMessage\" method = \"post\">" 
			+ "     <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
			+ "			<tr>" 
			+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price1.jpg\" border = \"0\"></td>" 
			+ "		    </tr>" 
			+ "			<tr>" 
			+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price2.jpg\" border = \"0\"></td>" 
			+ "		    </tr>" 
			+ "		</table> "
			+ "		<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
			+ "			<tr>" 
			+ "				<td width = \"100%\" class = \"normal\" align = \"left\">" 
			+ "					<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
			+ "						<tr>" 
			+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"20\">&nbsp;</td>" 
			+ "						</tr>" 
			+ "						<tr>" 
			+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\">&nbsp;</td>" 
			+ "							<td colspan = \"3\" align = \"left\" class = \"normal\">" 
			+ "								<div align = \"left\">" + content + "</div>" 
			+ "							</td>" 
			+ "						</tr>" 
			+ "						<tr>" 
			+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\"></td>" 
			+ "						</tr>" 
			+ "					</table> "					
			+ "				</td>" 
			+ "			</tr><br>" 
			+ "		</table>"
			+ "</form></body>"
			+ "</html>";	
	
////////////////////////////////////End of Tamplets for the Approver.
//////////////////////////////////// Sending mail for B&C.
	if(appType.equals("AP11"))
	{   
		if(statusType.equals("A")){
			if(!AP21.equals("0")){
				sendMailto= AP21;
			}else{
				sendMailto= AP31;
			}
		
			status2	= priceApprovalWebController.updateStatus("L",priceid);
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);			
		}else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);
		}
		
	}
	else if(appType.equals("AP21"))
	{		
		if(statusType.equals("A")){
			sendMailto= AP31;
			status2	= priceApprovalWebController.updateStatus("L",priceid);
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);			
		}else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);
		}
	}
	else if(appType.equals("AP31"))
	{ 		
		if(statusType.equals("A")){
			status2	= priceApprovalWebController.updateStatus("L",priceid);
			if(AP12.equals("0")&&AP22.equals("0")&&AP32.equals("0")){
				if(!AP35.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv5[0],htmlStr,priceid);
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP36.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv6[0],htmlStr,priceid);	
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP13.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv0[0],htmlStr,	priceid);
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP23.equals("0")){ 					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv2[0],htmlStr,priceid);
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP33.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv3[0],htmlStr,priceid);	
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP34.equals("0")){										
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv4[0],htmlStr,priceid);
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else {
					sendMailto= AP4;
					approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
					mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}
			
			 }else if(!AP12.equals("0")){
				sendMailto= AP12;
				approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			 }else if(AP12.equals("0") && !AP22.equals("0")){
				sendMailto= AP22;
				approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			 }else if(AP12.equals("0") && AP22.equals("0") && !AP32.equals("0")){
				sendMailto= AP32;
				approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);	
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			 }else{
				sendMailto= AP4;
				approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			 }
		}else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);
		}
/////////////////////// Completion For B&C.
////////////////////// sending mail to User.

	}else if(appType.equals("AP12")){		
		if(statusType.equals("A")){
		  if(!AP22.equals("0")){
			sendMailto= AP22;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		  }else if(AP22.equals("0")&& !AP32.equals("0")){
			sendMailto= AP32;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		  }else if(AP22.equals("0")&& AP32.equals("0")){
				if(!AP35.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv5[0],htmlStr,priceid);	
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP36.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv6[0],htmlStr,priceid);	
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP13.equals("0")){				
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv0[0],htmlStr,	priceid);
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP23.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv2[0],htmlStr,priceid);	
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP33.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv3[0],htmlStr,priceid);	
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP34.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv4[0],htmlStr,priceid);
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else {
					sendMailto= AP4;
					approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
					mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}
			}
		
		}else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);
		}

	}else if(appType.equals("AP22")){		
		if(statusType.equals("A")){
		  if(!AP32.equals("0")){
			sendMailto= AP32;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		  }else{
				if(!AP35.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv5[0],htmlStr,priceid);	
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP36.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv6[0],htmlStr,priceid);	
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP13.equals("0")){			
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv0[0],htmlStr,	priceid);
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP23.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv2[0],htmlStr,priceid);	
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP33.equals("0")){					
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv3[0],htmlStr,priceid);	
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else if(!AP34.equals("0")){									
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv4[0],htmlStr,priceid);	
					mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}else {
					sendMailto= AP4;
					approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
					mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				 }
		}
	 }else if(statusType.equals("H")||statusType.equals("R")){
		approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);
	 }

	}else if(appType.equals("AP32")){	
		
		if(statusType.equals("A")){
			int i=0;
			if(!AP35.equals("0")){					
				mailStatus =  priceApprovalWebController.sendIndividualMail(apprv5[0],htmlStr,priceid);	
				mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			}else if(!AP36.equals("0")){					
				mailStatus =  priceApprovalWebController.sendIndividualMail(apprv6[0],htmlStr,priceid);	
				mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			}else if(!AP13.equals("0")){					
				mailStatus =  priceApprovalWebController.sendIndividualMail(apprv0[0],htmlStr,	priceid);	
				mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			}else if(!AP23.equals("0")){					
				mailStatus =  priceApprovalWebController.sendIndividualMail(apprv2[0],htmlStr,priceid);	
				mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			}else if(!AP33.equals("0")){					
				mailStatus =  priceApprovalWebController.sendIndividualMail(apprv3[0],htmlStr,priceid);	
				mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			}else if(!AP34.equals("0")){									
				mailStatus =  priceApprovalWebController.sendIndividualMail(apprv4[0],htmlStr,priceid);	
				mailStatus1 = priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			} 
		if(AP35.equals("0") && AP36.equals("0") && AP13.equals("0") && AP23.equals("0") && AP33.equals("0") && AP34.equals("0")){
			sendMailto= AP4;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid); 
		}
		
	}else if (statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);		
		}
/////////////////////// Completion For User.
	}else if(appType.equals("AP35")){
	  if(statusType.equals("A")){
		 if(!AP36.equals("0")){			
            sendMailto= AP36;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
         }else if(AP36.equals("0") && !AP13.equals("0")){
            sendMailto= AP13;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }else if(AP36.equals("0") && AP13.equals("0") && !AP23.equals("0")){
            sendMailto= AP23;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }else if(AP36.equals("0") && AP13.equals("0") && AP23.equals("0") && !AP33.equals("0")){
	     	sendMailto= AP33;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);	
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }else if(AP36.equals("0") && AP13.equals("0") && AP23.equals("0") && AP33.equals("0") && !AP34.equals("0")){
            sendMailto= AP34;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
         }else{           
			sendMailto= AP4;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }
	  }else if (statusType.equals("H")||statusType.equals("R")){		
		approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);		
	  }

	}else if(appType.equals("AP36")){
	  if(statusType.equals("A")){
		if(!AP13.equals("0")){
            sendMailto= AP13;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }else if(AP13.equals("0") && !AP23.equals("0")){
            sendMailto= AP23;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }else if(AP13.equals("0") && AP23.equals("0") && !AP33.equals("0")){
	     	sendMailto= AP33;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }else if(AP13.equals("0") && AP23.equals("0") && AP33.equals("0") && !AP34.equals("0")){
            sendMailto= AP34;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
         }else{
			sendMailto= AP4;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }
	  }else if (statusType.equals("H")||statusType.equals("R")){
		approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);		
	  }

	}else if(appType.equals("AP13")){
	  if(statusType.equals("A")){
		if(!AP23.equals("0")){
            sendMailto= AP23;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }else if(AP23.equals("0") && !AP33.equals("0")){
	     	sendMailto= AP33;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);	
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }else if(AP23.equals("0") && AP33.equals("0") && !AP34.equals("0")){
            sendMailto= AP34;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
         }else{
			sendMailto= AP4;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }
	  }else if (statusType.equals("H")||statusType.equals("R")){
		approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);		
	  }

	}else if(appType.equals("AP23")){
	  if(statusType.equals("A")){
		 if(!AP33.equals("0")){           
	     	sendMailto= AP33;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }else if(AP33.equals("0") && !AP34.equals("0")){			
            sendMailto= AP34;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
         }else{
			sendMailto= AP4;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		 }
	  }else if (statusType.equals("H")||statusType.equals("R")){
		approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);		
	  }

	}else if(appType.equals("AP33")){
	  if(statusType.equals("A")){		
		 if(!AP34.equals("0")){
            sendMailto= AP34;
			approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
         }else{
            if(AP4.equals("0")){
                status2	= priceApprovalWebController.updateStatus("CL",priceid);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid); // added by Shreedhar on 28-JAN-2020.
            }else{
                sendMailto= AP4;
                approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
            }
		 }
	  }else if (statusType.equals("H")||statusType.equals("R")){
		approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);		
	  }

	}else if(appType.equals("AP34")){
	    if(statusType.equals("A")){			
            if(AP4.equals("0")){
                status2	= priceApprovalWebController.updateStatus("CL",priceid);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid); // added by Shreedhar on 28-JAN-2020.
            }else{
                sendMailto= AP4;
                approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
            }
            
	    }else if (statusType.equals("H")||statusType.equals("R")){		
		    approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);		
	    }

	}else if(appType.equals("AP4")){ 
		if(statusType.equals("A")){
			if(AP5.equals("0") && AP6.equals("0") && AP7.equals("0") && AP8.equals("0")){
				status2	= priceApprovalWebController.updateStatus("CL",priceid);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid); // added by Shreedhar on 28-JAN-2020.
            }else if(!AP5.equals("0")) {
				sendMailto= AP5;
				approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			}
		}else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);
		}
		
	}else if(appType.equals("AP5")){
		if(statusType.equals("A")){
			if(AP6.equals("0") && AP7.equals("0") && AP8.equals("0")){
				status2	= priceApprovalWebController.updateStatus("CL",priceid);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid); // added by Shreedhar on 28-JAN-2020.
				}
			else if(!AP6.equals("0")){
				sendMailto = AP6;
				approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
				}
			}
		else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);
		}

	}else if(appType.equals("AP6")){
		if(statusType.equals("A")){
			if(AP7.equals("0") && AP8.equals("0")){
				status2	= priceApprovalWebController.updateStatus("CL",priceid);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid); // added by Shreedhar on 28-JAN-2020.
				}
			else if(!AP7.equals("0")){
				sendMailto = AP7;
				approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			}
		}else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);
		}

	}else if(appType.equals("AP7")){		
		if(statusType.equals("A")){
			if(AP8.equals("0")){
				status2	= priceApprovalWebController.updateStatus("CL",priceid);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid); // added by Shreedhar on 28-JAN-2020.
			}else{
				sendMailto = AP8;
				approvers = priceApprovalWebController.getApprovers(priceid,sendMailto);
				mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
			}
		}else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);
		}

	}else if(appType.equals("AP8")){  
		if(statusType.equals("A")){
			status2	= priceApprovalWebController.updateStatus("CL",priceid);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid); // added by Shreedhar on 28-JAN-2020.
		}else if(statusType.equals("H")||statusType.equals("R"))
		{
			approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);
			mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
		}
	}
	
	if(statusType.equals("H")){
		status2	= priceApprovalWebController.updateStatus("URE",priceid);
		approvers = priceApprovalWebController.getApprovers(priceid,CREATEDBY);
		mailStatus1 =  priceApprovalWebController.sendIndividualMail(createdBy[0],htmlStrForCreater,priceid);
	}
	if(statusType.equals("R")){
		status2	= priceApprovalWebController.updateStatus("CR",priceid);
	}

	status	= priceApprovalWebController.changeAllTableStatus(priceid, appType, statusType);

	if(!appType.equals("AP7")){
		if (!(approvers.isEmpty())){
			apprv  = (String [])approvers.get(0);
			 if(statusType.equals("A"))
			 {	            
				content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
				content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
				content += "Description : "+ apprv[1] + "\n\n <br>";
				content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
				content += "User : "+ apprv[2] + "\n\n <br>";
				content += "PC meeting date : "+data1[1]+"\n\n <br><br>";
				content += "Participants : \n\n <br><br>";
				content += "Buyer : "+buyer+"\n\n <br>";
				content += "User :  "+user+"\n\n <br>";
				content += "Supporting Functions : "+supportedBy+" \n\n <br><br>";
				content += "Sanctioned Value (Rs) : "+apprv[6]+"\n\n <br>";			
				content += "Negotiated Value (Rs) : "+ apprv[3] + "\n\n <br>";
				content += "Scope : "+apprv[4]+"\n\n <br>";
				content += "Recommended Vendor : "+apprv[5]+"\n\n <br>";
                if(appType.equals("AP4")){
                    content += "PAR Note Approved by : Director B&C \n\n";    
                }
                else if(appType.equals("AP5")){
                    content += "PAR Note Approved by : Director B&C, Executive Director \n\n"; 
                }
                else if(appType.equals("AP6")){
                    content += "PAR Note Approved by : Director B&C, Executive Director, COO \n\n";    
                }				
				content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
				content += "This mail is regarding Purchase Approval Request put on Timescape <br> \n\n\n\n Regards,<br> \n\n TIMESCAPE Admin";

				htmlStr = "<html>" + "\n" 
								+ "<head>" + "\n" 
								+ "	<title>TAM Leads</title>" + "\n" 
								+ "	<style>" + "\n" 
								+ "		.bold {FONT-WEIGHT: bold; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "		.normal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "		.bluenormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #6097cf; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "		.rednormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #ff0000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "	</style>"
								+ "</head>" 
								+ "<body>" 
								+ "	<form name = \"frmMessage\" method = \"post\">" 
								+ "     <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
								+ "			<tr>" 
								+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price1.jpg\" border = \"0\"></td>" 
								+ "		    </tr>" 
								+ "			<tr>" 
								+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price2.jpg\" border = \"0\"></td>" 
								+ "		    </tr>" 
								+ "		</table> "
								+ "		<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
								+ "			<tr>" 
								+ "				<td width = \"100%\" class = \"normal\" align = \"left\">" 
								+ "					<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
								+ "						<tr>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"20\">&nbsp;</td>" 
								+ "						</tr>" 
								+ "						<tr>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\">&nbsp;</td>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\">" 
								+ "								<div align = \"left\">" + content + "</div>" 
								+ "							</td>" 
								+ "						</tr>" 
								+ "						<tr>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\"></td>" 
								+ "						</tr>" 
								+ "					</table> "					
								+ "				</td>" 
								+ "			</tr><br>" 
								+ "		</table>"
								+ "</form></body>" 
								+ "</html>";
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv[0],htmlStr,priceid);

				}else if(statusType.equals("H") && !appType.equals("AP13") && !appType.equals("AP23") && !appType.equals("AP33") && !appType.equals("AP33")		&& !appType.equals("AP34")){

                    content1  = "Purchase Approval Id : "+ priceid +"\n\n <br>";
					content1 += "Description : "+ apprv[1] + "\n\n <br>";
                    content1 += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content1 += "User : "+ apprv[2] + "\n\n <br>";
                    content1 += "PC meeting date : "+data1[1]+"\n\n <br><br>";
					content1 += "Participants :\n\n <br><br>";
			        content1 += "Buyer : "+buyer+"\n\n <br>";
			        content1 += "User :  "+user+"\n\n <br>";
			        content1 += "Supporting Functions : "+supportedBy+" \n\n <br><br>";
					content1 += "Negotiated Value (Rs) : "+ apprv[3] + "\n\n <br>";
                    content1 += "Scope : "+apprv[4]+"\n\n <br>";
                    content1 += "Recommended Vendor : "+apprv[5]+"\n\n <br><br>";					
                    content1 += "This request needs to be reviewed \n\n <br><br>";
                    content1 += "Sent By User: "+displayName+"\n\n <br>"	;
                    content1 += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
					content1 += "This mail is regarding Purchase Approval Request put on Timescape \n <br><br>Regards,<br> Timescape admin ";				

					htmlStr = "<html>" + "\n" 
									+ "<head>" + "\n" 
									+ "	<title>TAM Leads</title>" + "\n" 
									+ "	<style>" + "\n" 
									+ "		.bold {FONT-WEIGHT: bold; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
									+ "		.normal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
									+ "		.bluenormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #6097cf; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
									+ "		.rednormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #ff0000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
									+ "	</style>"
									+ "</head>" 
									+ "<body>" 
									+ "	<form name = \"frmMessage\" method = \"post\">" 
									+ "     <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
									+ "			<tr>" 
									+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price1.jpg\" border = \"0\"></td>" 
									+ "		    </tr>" 
									+ "			<tr>" 
									+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price2.jpg\" border = \"0\"></td>" 
									+ "		    </tr>" 
									+ "		</table> "
									+ "		<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
									+ "			<tr>" 
									+ "				<td width = \"100%\" class = \"normal\" align = \"left\">" 
									+ "					<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
									+ "						<tr>" 
									+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"20\">&nbsp;</td>" 
									+ "						</tr>" 
									+ "						<tr>" 
									+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\">&nbsp;</td>" 
									+ "							<td colspan = \"3\" align = \"left\" class = \"normal\">" 
									+ "								<div align = \"left\">" + content1 + "</div>" 
									+ "							</td>" 
									+ "						</tr>" 
									+ "						<tr>" 
									+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\"></td>" 
									+ "						</tr>" 
									+ "					</table> "					
									+ "				</td>" 
									+ "			</tr><br>" 
									+ "		</table>"
									+ "</form></body>" 
									+ "</html>";

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv[0],htmlStr,priceid);

			}else if(statusType.equals("R")){
				content1  = "Purchase Approval Id : "+ priceid + "\n\n <br>";
				content1 += "Description : "+ apprv[1] + "\n\n <br>";
				content1 += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
				content1 += "User : "+ apprv[2] + "\n\n <br>";
				content1 += "PC meeting date : "+data1[1]+"\n\n <br>";
				content1 += "Participants : \n\n <br><br>";
				content1 += "Buyer : "+buyer+"\n\n <br>";
				content1 += "User :  "+user+" \n\n <br>";
				content1 += "Supporting Functions : "+supportedBy+" \n\n <br><br>";
				content1 += "Negotiated Value (Rs) : "+ apprv[3] + "\n\n <br>";
				content1 += "Scope : "+apprv[4]+"\n\n <br>";
				content1 += "Recommended Vendor : "+apprv[5]+"\n\n <br>";
				content1 += "This Request Rejected\n\n <br>";
				content1 += "Sent By User: "+displayName+"\n\n <br>";
				content1 += "Purchase Approval Link on Timescape :									   https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
				content1 += "This mail is regarding Purchase Approval Request put on Timescape \n Regards";
			
				htmlStr = "<html>" + "\n" 
								+ "<head>" + "\n" 
								+ "	<title>TAM Leads</title>" + "\n" 
								+ "	<style>" + "\n" 
								+ "		.bold {FONT-WEIGHT: bold; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "		.normal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "		.bluenormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #6097cf; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "		.rednormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #ff0000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "	</style>"
								+ "</head>" 
								+ "<body>" 
								+ "	<form name = \"frmMessage\" method = \"post\">" 
								+ "     <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
								+ "			<tr>" 
								+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price1.jpg\" border = \"0\"></td>" 
								+ "		    </tr>" 
								+ "			<tr>" 
								+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price2.jpg\" border = \"0\"></td>" 
								+ "		    </tr>" 
								+ "		</table> "
								+ "		<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
								+ "			<tr>" 
								+ "				<td width = \"100%\" class = \"normal\" align = \"left\">" 
								+ "					<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
								+ "						<tr>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"20\">&nbsp;</td>" 
								+ "						</tr>" 
								+ "						<tr>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\">&nbsp;</td>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\">" 
								+ "								<div align = \"left\">" + content + "</div>" 
								+ "							</td>" 
								+ "						</tr>" 
								+ "						<tr>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\"></td>" 
								+ "						</tr>" 
								+ "					</table> "					
								+ "				</td>" 
								+ "			</tr><br>" 
								+ "		</table>"
								+ "</form></body>" 
								+ "</html>";

				mailStatus =  priceApprovalWebController.sendIndividualMail(apprv[0],htmlStr,priceid);
			}
		}
	}
			
%>
<% if(status == true){%>
		<table cellpadding="0" cellspacing="0" width="40%" >
		<tr>
		<td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
		<td width="23%" rowspan="2">&nbsp;</td>
		</tr>
		<tr>
		<td height="38"><img src="../images/header_price2.jpg" width="706" height="34" /><span class="boldsmall">
		</span>&nbsp;&nbsp;&nbsp;&nbsp;  <span class="boldsmall"></span> </td>
		</tr>
		<tr><td colspan="2" align="center"><span class="normal"><%
		if(statusType.equals("A"))
		{%>You have successfully approved!!!<%}else if(statusType.equals("H")){%> This Request is put on Hold for Review.<%}else{%>You have successfully Rejected!!!<%}%></td><tr>
		<tr><td colspan="2" height="7"></td></tr>
		<tr><td colspan="2" align="center" class="normal">Click <a href="javascript:navigateCallRemarks('<%=timescapeUserOId%>','<%=priceid%>');" class="normal"><b>here</b></a> to check the status</td></tr> 
		</table>
<%
	    }
%>
</body>
</html>