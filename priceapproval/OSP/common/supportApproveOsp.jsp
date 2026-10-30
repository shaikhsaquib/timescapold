<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<%@ page import = "com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id = "priceApprovalWebController" class = "com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language = "java" %>
<%@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../../common/errorPage.jsp"%>
<%@ include file = "../../includes/empHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv = "Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - SUPPORT/REJECT</title>
<link href = "../style/global.css" rel = "stylesheet" type = "text/css" />
<script Language="JavaScript" src="/timescape/sapep/employeeselfservice/priceapproval/jscripts/osp.js"></script>
</head>
<body>
<%
		

		//long priceid		= Long.parseLong(request.getParameter("priceid"));
		String priceid		= (String)request.getParameter("priceid");

		String	appType = request.getParameter("appType");
		String	status1 = "";
		String  statusType = request.getParameter("statusType");
		String tOId			= (String)request.getParameter("tOId");
		String sendMailto ="";
		
		ArrayList[] sendMailsto = new ArrayList[4];
		boolean	status2 = true;
		boolean	status =true;
		//boolean	status	= priceApprovalWebController.changeAllTableStatus(priceid, appType, statusType);
		
		//boolean status2 = priceapprovalWebController.changeVendorTableStatus(tOId, priceid);
		ArrayList vStatus	=  new ArrayList();
		ArrayList vStatus2	=  new ArrayList();
		
		//boolean	status3	= priceapprovalWebController.changeUserTableStatus(tOId, priceid); 	

	
		vStatus 			=	priceApprovalWebController.viewStatusOsp(tOId,request.getParameter("priceid"));

		ArrayList vStatus5	=  new ArrayList();
	
		vStatus5 			=	priceApprovalWebController.viewApproverDetailsOsp(tOId,request.getParameter("priceid"));

		String[] data1		= (String [])vStatus.get(0);

		String[] data3      = (String [])vStatus5.get(0);

		
		  String APPROVER11_STATUS = data3[0];            
		  String APPROVER12_STATUS = data3[1];           
		  String APPROVER13_STATUS = data3[2];            
		  String APPROVER21_STATUS = data3[3];            
		  String APPROVER22_STATUS = data3[4];            
		  String APPROVER23_STATUS = data3[5];             
		  String APPROVER31_STATUS = data3[6];            
		  String APPROVER32_STATUS = data3[7];            
		  String APPROVER33_STATUS = data3[8];            
		  String APPROVER4_STATUS  = data3[9];            
		  String APPROVER5_STATUS  = data3[10];            
		  String APPROVER6_STATUS  = data3[11];           
		  String APPROVER11_DATE = data3[12];              
		  String APPROVER12_DATE = data3[13];              
		  String APPROVER13_DATE = data3[14];              
		  String APPROVER21_DATE = data3[15];              
		  String APPROVER22_DATE = data3[16];              
		  String APPROVER23_DATE = data3[17];              
		  String APPROVER31_DATE = data3[18];              
		  String APPROVER32_DATE = data3[19];              
		  String APPROVER33_DATE = data3[20];              
		  String APPROVER4_DATE  = data3[21];              
		  String APPROVER5_DATE  = data3[22];              
		  String APPROVER6_DATE  = data3[26];
		  String APPROVER34_STATUS = data3[24];
		  String APPROVER35_STATUS = data3[30];
		  String APPROVER36_STATUS = data3[32];
		  String APPROVER7_STATUS  = data3[25];
		  String APPROVER34_DATE   = data3[26];
		  String APPROVER35_DATE   = data3[31];
		  String APPROVER36_DATE   = data3[33];
		  String APPROVER7_DATE    = data3[27];
		  String APPROVER8_STATUS  = data3[28];
		  String APPROVER8_DATE	   = data3[29];


		String SANCTIONEDREFTYPE			= data1[1];
		String REFNUMBER					= data1[2];
		String DATEOFAPPROVAL				= data1[3];
		String PROJECTNAME      			= data1[4];
		String FROMCONTRACTVALIDITY        	= data1[5];
		String TOCONTRACTVALIDITY        	= data1[59];
		String DESCRIPTION			        = data1[6];
		//int negVal							= Integer.parseInt(NEGOTIATION_VALUE);
		String CONTRACTVALUE        		= data1[7];
		String USERGROUP				    = data1[8];
		String VENDORNAME					= data1[9];
		String TOTALBUDGET	                = data1[10];
		String PAYMENTTERMS				    = data1[11];
		String SANCTIONNOTE		            = data1[12];
		String SAVINGS  					= data1[13];
		String BACKGROUND		            = data1[14];
		String RECOMMENDATION				= data1[15];
		String AP11     					= data1[16];
		String AP12					        = data1[17];
		String AP13					        = data1[18];
		String AP21					        = data1[19];
		String AP22					        = data1[20];
		String AP23					        = data1[21];
		String AP31					        = data1[22];
		String AP32					        = data1[23];
		String AP33					        = data1[24];
		String AP34					        = data1[25];
		String AP35					        = data1[26];
		String AP36					        = data1[27];
		String AP4					        = data1[28];
		String AP5					        = data1[29];
		String AP6					        = data1[30];
		String AP7					        = data1[31];
		String AP8					        = data1[32];

		String APPROVER11					= data1[40];
		String APPROVER12					= data1[41];
		String APPROVER13					= data1[42];
		String APPROVER21					= data1[43];
		String APPROVER22					= data1[44];
		String APPROVER23					= data1[45];
		String APPROVER31					= data1[46];
		String APPROVER32					= data1[47];
		String APPROVER33					= data1[48];
		String APPROVER34					= data1[49];
		String APPROVER35					= data1[50];
		String APPROVER36					= data1[51];

		String APPROVER4					= data1[52];
		String APPROVER5					= data1[53];
		String APPROVER6					= data1[54];
		String APPROVER7					= data1[55];
		String APPROVER8					= data1[56];

       	String CREATEDBY					= data1[33];
		String CREATEDON					= data1[34];
		String MODIFIEDBY					= data1[35];	
		String MODIFIEDON					= data1[36];
        String COMPANY  					= data1[37];
		String STATUS						= data1[38];
		String userEmailid				    = data1[58];

        String INITIATOR_NAME				= data1[40];
        String INITIATEDON					= data1[34];
        String COMPANYNAME 					= data1[58];
  
		ArrayList approvers = new ArrayList();
	
		String apprv1 [] = null ;
		String apprv [] = null ;
		String content="" ;
		String content1="";

		boolean mailStatus = true;
		
        Hashtable emailList = new Hashtable();
        ArrayList approversemailList = new ArrayList();
        emailList.put("PRICEID", priceid);
        approversemailList = priceApprovalWebController.getApproverEmailOsp(emailList);

        String apprvEmail []  = (String [])approversemailList.get(0);

        String participants1 = "";//apprvEmail[0] + ",   ";
        String participants2=  "";//apprvEmail[1] + ",   ";
        String participants3 = "";//apprvEmail[2] + "    ";
        String participants4 = "";//apprvEmail[3];
        String participants5 = "";//apprvEmail[4];
        String participants6 = "";//apprvEmail[5];
        String participants7 = "";//apprvEmail[6];
        String participants8 = "";//apprvEmail[7];
        String participants9 = "";//apprvEmail[8];
        String participants10 = "";//apprvEmail[9];
        String participants11 = "";//apprvEmail[10];
        String participants12 = "";//apprvEmail[11];
   
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
    buyer       = participants1 + participants2 + participants3;
    user        = participants4 + participants5 + participants6;
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

    //System.out.println("---------------------------------------------------AP12"+AP12);
    //System.out.println("---------------------------------------------------AP22"+AP12);
    //System.out.println("---------------------------------------------------AP32"+AP12);
	if(appType.equals("AP11"))
	{   
		if(statusType.equals("A")){
		sendMailto= AP21;
		status2	= priceApprovalWebController.updateStatusOsp("L",priceid);
		approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		}else if(statusType.equals("H")||statusType.equals("R")){
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);
		}
		
	}
	else if(appType.equals("AP21"))
	{
		if(statusType.equals("A")){
		sendMailto= AP31;
        status2	= priceApprovalWebController.updateStatusOsp("L",priceid);
		approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		}else if(statusType.equals("H")||statusType.equals("R")){
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);
		}
	}
	else if(appType.equals("AP31"))
	{  
		if(statusType.equals("A")){
        status2	= priceApprovalWebController.updateStatusOsp("L",priceid);
		 if(AP12.equals("0")&&AP22.equals("0")&&AP32.equals("0")){
			//System.out.println("1");
            //if(NEGOTIATION_VALUE>=13-Jul-15){
				//System.out.println("AP13="+AP13);
				if(!AP35.equals("0")){
					ArrayList approvers5 = priceApprovalWebController.getApproversOsp(priceid,AP35);
					String apprv5 [] = (String [])approvers5.get(0);
					System.out.println("5");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv5[0] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			        content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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


					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv5[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					
				}
				else if(!AP36.equals("0")){
					ArrayList approvers6 = priceApprovalWebController.getApproversOsp(priceid,AP36);
					String apprv6 [] = (String [])approvers6.get(0);
					System.out.println("6");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv6[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			        content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv6[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					
				}else if(!AP13.equals("0")){
					ArrayList approvers0 = priceApprovalWebController.getApproversOsp(priceid,AP13);
					System.out.println("1");
					String apprv0 []  = (String [])approvers0.get(0);
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv0[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n<br><br>";
			content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv0[0],htmlStr,	priceid);
					//mailStatus =        priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
				//System.out.println("1=here");
					//sendMailsto[i]= approvers;
					//i++;
					}		
                    //System.out.println("AP23="+AP23);
					else if(!AP23.equals("0")){
					ArrayList approvers2 = priceApprovalWebController.getApproversOsp(priceid,AP23);
					String apprv2 [] = (String [])approvers2.get(0);
					System.out.println("2");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv2[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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


					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv2[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
                    //System.out.println("2=here");
					
					//sendMailsto[i]= approvers;
					//i++;
					}
                    //System.out.println("AP33="+AP33);
					else if(!AP33.equals("0")){
					ArrayList approvers3 = priceApprovalWebController.getApproversOsp(priceid,AP33);
					String apprv3 [] = (String [])approvers3.get(0);
					System.out.println("3");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv3[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
					content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv3[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
                    //System.out.println("3=here");
					//sendMailsto[i]= approvers;
					//i++;
					}
                    //System.out.println("AP34="+AP34);
					else if(!AP34.equals("0")){
					ArrayList approvers4 = priceApprovalWebController.getApproversOsp(priceid,AP34);
					String apprv4 [] = (String [])approvers4.get(0);
					System.out.println("4");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv4[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
					content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv4[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					}else{
                    System.out.println("5=here");
					sendMailto= AP4;
					approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
					}
			//}
		 }else if(!AP12.equals("0")){
			//System.out.println("2");
            sendMailto= AP12;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		 }else if(AP12.equals("0") && !AP22.equals("0")){
            //System.out.println("3");
	     	sendMailto= AP22;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);			
		 }else if(AP12.equals("0") && AP22.equals("0") && !AP32.equals("0")){
			//System.out.println("4");
            sendMailto= AP32;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);		 
         }
         else{
            //System.out.println("7");
			sendMailto= AP4;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		 }
		}else if(statusType.equals("H")||statusType.equals("R")){
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);
		}
	}else if(appType.equals("AP12"))
	{	
		if(statusType.equals("A")){
		  if(!AP22.equals("0")){
			sendMailto= AP22;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		  }else if(AP22.equals("0")&& !AP32.equals("0")){
			sendMailto= AP32;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);	  
		  }else if(AP22.equals("0")&& AP32.equals("0")){
				//if(NEGOTIATION_VALUE>=2000000){
				//System.out.println("AP13="+AP13);
				if(!AP35.equals("0")){
					ArrayList approvers5 = priceApprovalWebController.getApproversOsp(priceid,AP35);
					String apprv5 [] = (String [])approvers5.get(0);
					System.out.println("5");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv5[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			        content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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


					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv5[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					
				}
				else if(!AP36.equals("0")){
					ArrayList approvers6 = priceApprovalWebController.getApproversOsp(priceid,AP36);
					String apprv6 [] = (String [])approvers6.get(0);
					System.out.println("6");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv6[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			        content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv6[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					
				}else if(!AP13.equals("0")){
					ArrayList approvers0 = priceApprovalWebController.getApproversOsp(priceid,AP13);
					System.out.println("1");
					String apprv0 []  = (String [])approvers0.get(0);
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv0[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n<br><br>";
			content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv0[0],htmlStr,	priceid);
					//mailStatus =        priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
				//System.out.println("1=here");
					//sendMailsto[i]= approvers;
					//i++;
					}		
                    //System.out.println("AP23="+AP23);
					else if(!AP23.equals("0")){
					ArrayList approvers2 = priceApprovalWebController.getApproversOsp(priceid,AP23);
					String apprv2 [] = (String [])approvers2.get(0);
					System.out.println("2");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv2[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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


					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv2[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
                    //System.out.println("2=here");
					
					//sendMailsto[i]= approvers;
					//i++;
					}
                    //System.out.println("AP33="+AP33);
					else if(!AP33.equals("0")){
					ArrayList approvers3 = priceApprovalWebController.getApproversOsp(priceid,AP33);
					String apprv3 [] = (String [])approvers3.get(0);
					System.out.println("3");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv3[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
					content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv3[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
                    //System.out.println("3=here");
					//sendMailsto[i]= approvers;
					//i++;
					}
                    //System.out.println("AP34="+AP34);
					else if(!AP34.equals("0")){
					ArrayList approvers4 = priceApprovalWebController.getApproversOsp(priceid,AP34);
					String apprv4 [] = (String [])approvers4.get(0);
					System.out.println("4");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv4[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
					content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv4[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					}else{
                    //System.out.println("5=here");
					sendMailto= AP4;
					approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
					}
			//}
		  }
		
		}else if(statusType.equals("H")||statusType.equals("R")){
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);
		}
	}else if(appType.equals("AP22"))
	{
		if(statusType.equals("A")){
		  
		  if(!AP32.equals("0")){
			sendMailto= AP32;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		  }else{
			
			//if(NEGOTIATION_VALUE>=2000000){
				//System.out.println("AP13="+AP13);
				if(!AP35.equals("0")){
					ArrayList approvers5 = priceApprovalWebController.getApproversOsp(priceid,AP35);
					String apprv5 [] = (String [])approvers5.get(0);
					System.out.println("5");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv5[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			        content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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


					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv5[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					
				}
				else if(!AP36.equals("0")){
					ArrayList approvers6 = priceApprovalWebController.getApproversOsp(priceid,AP36);
					String apprv6 [] = (String [])approvers6.get(0);
					System.out.println("6");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv6[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			        content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv6[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					
				}else if(!AP13.equals("0")){
					ArrayList approvers0 = priceApprovalWebController.getApproversOsp(priceid,AP13);
					System.out.println("1");
					String apprv0 []  = (String [])approvers0.get(0);
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv0[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n<br><br>";
			content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv0[0],htmlStr,	priceid);
					//mailStatus =        priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
				//System.out.println("1=here");
					//sendMailsto[i]= approvers;
					//i++;
					}		
                    //System.out.println("AP23="+AP23);
					else if(!AP23.equals("0")){
					ArrayList approvers2 = priceApprovalWebController.getApproversOsp(priceid,AP23);
					String apprv2 [] = (String [])approvers2.get(0);
					System.out.println("2");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv2[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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


					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv2[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
                    //System.out.println("2=here");
					
					//sendMailsto[i]= approvers;
					//i++;
					}
                    //System.out.println("AP33="+AP33);
					else if(!AP33.equals("0")){
					ArrayList approvers3 = priceApprovalWebController.getApproversOsp(priceid,AP33);
					String apprv3 [] = (String [])approvers3.get(0);
					System.out.println("3");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv3[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
					content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv3[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
                    //System.out.println("3=here");
					//sendMailsto[i]= approvers;
					//i++;
					}
                    //System.out.println("AP34="+AP34);
					else if(!AP34.equals("0")){
					ArrayList approvers4 = priceApprovalWebController.getApproversOsp(priceid,AP34);
					String apprv4 [] = (String [])approvers4.get(0);
					System.out.println("4");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv4[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
					content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv4[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					}
                else{
					sendMailto= AP4;
					approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
			    }
			//}
		  }
		}else if(statusType.equals("H")||statusType.equals("R")){
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);
		}
	}else if(appType.equals("AP32"))
	{	
		if(statusType.equals("A")){
		int i=0;
		//if(NEGOTIATION_VALUE>=2000000){
				System.out.println("AP35="+AP35);
				if(!AP35.equals("0")){
					ArrayList approvers5 = priceApprovalWebController.getApproversOsp(priceid,AP35);
					String apprv5 [] = (String [])approvers5.get(0);
					System.out.println("5");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv5[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			        content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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


					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv5[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					
				}
				else if(!AP36.equals("0")){
					ArrayList approvers6 = priceApprovalWebController.getApproversOsp(priceid,AP36);
					String apprv6 [] = (String [])approvers6.get(0);
					System.out.println("6");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv6[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			        content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv6[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					
				}else if(!AP13.equals("0")){
					ArrayList approvers0 = priceApprovalWebController.getApproversOsp(priceid,AP13);
					System.out.println("1");
					String apprv0 []  = (String [])approvers0.get(0);
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv0[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n<br><br>";
			content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv0[0],htmlStr,	priceid);
					//mailStatus =        priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
				//System.out.println("1=here");
					//sendMailsto[i]= approvers;
					//i++;
					}		
                    //System.out.println("AP23="+AP23);
					else if(!AP23.equals("0")){
					ArrayList approvers2 = priceApprovalWebController.getApproversOsp(priceid,AP23);
					String apprv2 [] = (String [])approvers2.get(0);
					System.out.println("2");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv2[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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


					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv2[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
                    //System.out.println("2=here");
					
					//sendMailsto[i]= approvers;
					//i++;
					}
                    //System.out.println("AP33="+AP33);
					else if(!AP33.equals("0")){
					ArrayList approvers3 = priceApprovalWebController.getApproversOsp(priceid,AP33);
					String apprv3 [] = (String [])approvers3.get(0);
					System.out.println("3");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv3[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
					content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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

					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv3[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
                    //System.out.println("3=here");
					//sendMailsto[i]= approvers;
					//i++;
					}
                    //System.out.println("AP34="+AP34);
					else if(!AP34.equals("0")){
					ArrayList approvers4 = priceApprovalWebController.getApproversOsp(priceid,AP34);
					String apprv4 [] = (String [])approvers4.get(0);
					System.out.println("4");
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv4[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+" \n\n <br>";
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
					content += "This mail is regarding Purchase Approval Request put on Timescape <br><br>\n\n\n\n Regards, <br>\n\n TIMESCAPE Admin";

String	htmlStr = "<html>" + "\n" 
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
					mailStatus =  priceApprovalWebController.sendIndividualMail(apprv4[0],htmlStr,priceid);
					//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
					//System.out.println("4=here");
					}
				
			if(AP35.equals("0") && AP36.equals("0") && AP13.equals("0") && AP23.equals("0") && AP33.equals("0") && AP34.equals("0")){
				sendMailto= AP4;
				approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
			}else{
                //sendMailto= AP4;
                //approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		    }
		//}
		
		}
		else if (statusType.equals("H")||statusType.equals("R")){
		
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);		
		}

	}else if(appType.equals("AP35"))
	{
	  if(statusType.equals("A")){
		
		 if(!AP36.equals("0")){
			System.out.println("6");
            sendMailto= AP36;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);		 
         }else if(AP36.equals("0") && !AP13.equals("0")){
			System.out.println("2");
            sendMailto= AP13;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		 }else if(AP36.equals("0") && AP13.equals("0") && !AP23.equals("0")){
			System.out.println("2");
            sendMailto= AP23;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		 }else if(AP36.equals("0") && AP13.equals("0") && AP23.equals("0") && !AP33.equals("0")){
            System.out.println("3");
	     	sendMailto= AP33;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);			
		 }else if(AP36.equals("0") && AP13.equals("0") && AP23.equals("0") && AP33.equals("0") && !AP34.equals("0")){
			System.out.println("4");
            sendMailto= AP34;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);		 
         }else{
            System.out.println("7");
			sendMailto= AP4;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		 }
	  }else if (statusType.equals("H")||statusType.equals("R")){
		
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);		
		}
	}else if(appType.equals("AP36"))
	{
	  if(statusType.equals("A")){
            System.out.println("7");
		if(!AP13.equals("0")){
			System.out.println("2");
            sendMailto= AP13;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		 }else if(AP13.equals("0") && !AP23.equals("0")){
			System.out.println("2");
            sendMailto= AP23;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		 }else if(AP13.equals("0") && AP23.equals("0") && !AP33.equals("0")){
            System.out.println("3");
	     	sendMailto= AP33;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);			
		 }else if(AP13.equals("0") && AP23.equals("0") && AP33.equals("0") && !AP34.equals("0")){
			System.out.println("4");
            sendMailto= AP34;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);		 
         }else{
            System.out.println("7");
			sendMailto= AP4;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		 }
	  }else if (statusType.equals("H")||statusType.equals("R")){
		
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);		
	  }
	}else if(appType.equals("AP13"))
	{
	  if(statusType.equals("A")){
		
		if(!AP23.equals("0")){
			System.out.println("2");
            sendMailto= AP23;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		 }else if(AP23.equals("0") && !AP33.equals("0")){
            System.out.println("3");
	     	sendMailto= AP33;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);			
		 }else if(AP23.equals("0") && AP33.equals("0") && !AP34.equals("0")){
			System.out.println("4");
            sendMailto= AP34;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);		 
         }else{
            //System.out.println("7");
			sendMailto= AP4;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		 }
	  }else if (statusType.equals("H")||statusType.equals("R")){
		
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);		
		}
	}else if(appType.equals("AP23"))
	{
	  if(statusType.equals("A")){
		
		 if(!AP33.equals("0")){
            System.out.println("3");
	     	sendMailto= AP33;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);			
		 }else if(AP33.equals("0") && !AP34.equals("0")){
			System.out.println("4");
            sendMailto= AP34;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);		 
         }else{
            //System.out.println("7");
			sendMailto= AP4;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		 }
	  }else if (statusType.equals("H")||statusType.equals("R")){
		
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);		
		}
	}else if(appType.equals("AP33"))
	{
	  if(statusType.equals("A")){
		
		 if(!AP34.equals("0")){
			System.out.println("4");
            sendMailto= AP34;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);		 
         }else{
            if(AP4.equals("0")){
                status2	= priceApprovalWebController.updateStatusOsp("CL",priceid);
            }else{
                sendMailto= AP4;
                approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
            }
		 }
	  }else if (statusType.equals("H")||statusType.equals("R")){
		
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);		
		}
	}else if(appType.equals("AP34"))
	{
	    if(statusType.equals("A")){
            System.out.println("7");
			
            if(AP4.equals("0")){
                status2	= priceApprovalWebController.updateStatusOsp("CL",priceid);
            }else{
                sendMailto= AP4;
                approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
            }
            
	    }else if (statusType.equals("H")||statusType.equals("R")){
		
		    approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);		
	    }
	}else if(appType.equals("AP4"))
	{   
		if(statusType.equals("A")){
			if(AP5.equals("0") && AP6.equals("0") && AP7.equals("0") && AP8.equals("0")){
				status2	= priceApprovalWebController.updateStatusOsp("CL",priceid);
                }else if(!AP5.equals("0")) {
				sendMailto= AP5;
				approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
			}
		}else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);
		}		
	}
	else if(appType.equals("AP5"))
	{
		if(statusType.equals("A")){
		if(AP6.equals("0") && AP7.equals("0") && AP8.equals("0")){
			status2	= priceApprovalWebController.updateStatusOsp("CL",priceid);}
		else if(!AP6.equals("0")){
			sendMailto = AP6;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
			}
		else if(AP6.equals("0") && !AP7.equals("0")){
			sendMailto = AP7;
			approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
			}
		}
		else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);
		}
	}
	else if(appType.equals("AP6"))
	{  //out.println("yo dude");
		if(statusType.equals("A")){
			if(AP7.equals("0") && AP8.equals("0")){
				status2	= priceApprovalWebController.updateStatusOsp("CL",priceid);}
			else if(!AP7.equals("0")){
				sendMailto = AP7;
				approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
			}
		}else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);
		}
	}
	else if(appType.equals("AP7")){
		//sendMailto = AP7;		
		if(statusType.equals("A")){
			if(AP8.equals("0")){
				status2	= priceApprovalWebController.updateStatusOsp("CL",priceid);
			}else{
				sendMailto = AP8;
				approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
			}
		}else if(statusType.equals("H")||statusType.equals("R")){
			approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);
		}
	}
	else if(appType.equals("AP8"))
	{  
		if(statusType.equals("A")){
			status2	= priceApprovalWebController.updateStatusOsp("CL",priceid);			
			//approvers = priceApprovalWebController.getApproversOsp(priceid,sendMailto);
		}else if(statusType.equals("H")||statusType.equals("R"))
		{
			approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);
		}
	}

	
//out.println("appType: "+appType);
	if(statusType.equals("H")){

		//Approver = "AP11";
		//appStatus = APPROVER11_STATUS;
		status2	= priceApprovalWebController.updateStatusOsp("URE",priceid);
		approvers = priceApprovalWebController.getApproversOsp(priceid,CREATEDBY);
	}

	
	status	= priceApprovalWebController.changeAllTableStatusOsp(priceid, appType, statusType);

	System.out.println("status "+status);
	System.out.println("appType "+appType);
	System.out.println("approvers "+approvers);

	if(!appType.equals("AP7"))
	{
     if (!(approvers.isEmpty())){

		apprv  = (String [])approvers.get(0);
	    System.out.println("========="+apprv[0]);
		 if(statusType.equals("A"))
		 {	            
			        content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			        content += "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content += "User : "+ apprv[2] + "\n\n <br>";
                    content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content += "Participants : \n\n <br><br>";
			        content += "Buyer : "+buyer+"\n\n <br>";
			        content += "User :  "+user+"\n\n <br>";
                if(appType.equals("AP4")){
                    content += "PAR Note Approved by : Director B&C \n\n";    
                }
                else if(appType.equals("AP5")){
                    content += "PAR Note Approved by : Director B&C, Executive Director \n\n";    
                }
                else if(appType.equals("AP6")){
                    content += "PAR Note Approved by : Director B&C, Executive Director, COO \n\n";    
                }
				/*else if(appType.equals("AP7")){
                    content += "PAR Note Approved by : Director B&C, EP Supply Chain, COO, CEO \n\n";    
                }*/
					content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			        content += "This mail is regarding Purchase Approval Request put on Timescape <br> \n\n\n\n Regards,<br> \n\n TIMESCAPE Admin";

	  String	htmlStr = "<html>" + "\n" 
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
			
			//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
		  }		
		else if(statusType.equals("H") && !appType.equals("AP13") && !appType.equals("AP23") && !appType.equals("AP33") && !appType.equals("AP33") && !appType.equals("AP34"))
		{

                    content1  = "Purchase Approval Id : "+ priceid +"\n\n <br>";
					content1 += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content1 += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content1 += "User : "+ apprv[2] + "\n\n <br>";
                    content1 += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content1 += "Participants :\n\n <br><br>";
			        content1 += "Buyer : "+buyer+"\n\n <br>";
			        content1 += "User :  "+user+"\n\n <br>";
					
                    content1 += "This request needs to be reviewed \n\n <br><br>";
                    content1 += "Sent By User: "+displayName+"\n\n <br>"	;
                    content1 += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			   content1 += "This mail is regarding Purchase Approval Request put on Timescape \n <br><br>Regards,<br> Timescape admin ";
		
				

String	htmlStr = "<html>" + "\n" 
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
				
				//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
		}
		else if(statusType.equals("R"))
		{
			        content1  = "Purchase Approval Id : "+ priceid + "\n\n <br>";
					content1 += "Description : "+ DESCRIPTION + "\n\n <br>";
                    content1 += "Buyer : "+apprvEmail[2]+ "\n\n <br>";
                    content1 += "User : "+ apprv[2] + "\n\n <br>";
                    content1 += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br><br>";
					content1 += "Participants : \n\n <br><br>";
			        content1 += "Buyer : "+buyer+"\n\n <br>";
			        content1 += "User :  "+user+" \n\n <br>";
			   content1 += "This Request Rejected\n\n <br>";
			   content1 += "Sent By User: "+displayName+"\n\n <br>";
			 content1 += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			   content1 += "This mail is regarding Purchase Approval Request put on Timescape \n Regards";
		
String	htmlStr = "<html>" + "\n" 
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
				//mailStatus =  priceApprovalWebController.sendIndividualMail("ravikumar.raman@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid);
		}
		}
	}
			
%>
<% if(status == true)
		{
%>
			<table cellpadding="0" cellspacing="0" width="40%" >
			<tr>
			<td width="77%"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<!-- <tr>
				<td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
				<td width="23%" rowspan="2">&nbsp;</td>
			</tr> -->
			<tr><td colspan="2" align="center"><span class="normal"><%
			if(statusType.equals("A"))
			{%>You have successfully approved!!!<%}else if(statusType.equals("H")){%> This Request is put on Hold for Review.<%}else{%>You have successfully Rejected!!!<%}%></td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<!-- <tr><td colspan="2" align="center" class="normal">Click <a href="showDetails.jsp?tOId=<%//=timescapeUserOId%>&priceid=<%//=priceid%>" class="normal"><b>here</b></a> to check the status</td></tr> -->
			 <tr><td colspan="2" align="center" class="normal">Click <a href="javascript:navigateCallRemarksOsp('<%=timescapeUserOId%>','<%=priceid%>');" class="normal"><b>here</b></a> to check the status</td></tr> 
			</table>
<%
	    }
%>
</body>
</html>