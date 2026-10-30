<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<%
	Hashtable priceData			= new Hashtable();
	Hashtable attachmentData	= new Hashtable();
	Hashtable userTable			= new Hashtable();

	ArrayList parIdLst			=  new ArrayList();

	boolean status				= false;
	boolean status1				= false;
	boolean status2				= false;

	String userstatus			= "NA";
	String parStatus			= "NA";
	String createdby			= "NA";
	String createdon			= "NA";
	String modifiedby			= "NA";
	String modifiedon			= "NA";
	String counters				= (String)request.getParameter("count");
	userstatus					= (String)request.getParameter("userstatus");
	int counter					= 0;

	String[] parList = request.getParameterValues("parList");


	counter = Integer.parseInt(counters);
	createdby			= Long.toString(timescapeUserOId);
	createdon			= "NA";
	modifiedby			= Long.toString(timescapeUserOId);
	modifiedon			= "NA";
	//userstatus			= "UC";
	parStatus			= "UC";

	priceData.put("PARLIST",parList);
	priceData.put("CREATEDBY",createdby);
	priceData.put("USERSTATUS",userstatus);
	priceData.put("PARSTATUS",parStatus);

	for(int i = 1; i <= counter; i++)
	{
		attachmentData.put("attach"+i+"New",(String)Utility.replaceQuoteOracle(request.getParameter("attach"+i+"New")));
		attachmentData.put("fileDesc"+i,(String)Utility.replaceQuoteOracle(request.getParameter("fileDesc"+i)));
		attachmentData.put("attachType"+i,(String)Utility.replaceQuoteOracle(request.getParameter("attachType"+i)));

	}

	attachmentData.put("CREATEDBY",createdby);
	attachmentData.put("CREATEDON","SYSDATE");
	attachmentData.put("MODIFIEDBY",modifiedby);
	attachmentData.put("MODIFIEDON","SYSDATE");
	attachmentData.put("STATUS",userstatus);


ArrayList priceCounterTable = priceApprovalWebController.getPriceCounter("Summarry");

    String[] data1      = (String [])priceCounterTable.get(0);

    String categoryCode=data1[0];

	String  priceIdCode=data1[1];

   int priceIdNew= Integer.parseInt(priceIdCode);
  
   String summarryCounter = categoryCode + priceIdNew ;

	status  = priceApprovalWebController.insertSummarryDataCon(priceData, summarryCounter,categoryCode);


	if(status){
	status1  = priceApprovalWebController.insertSummaryAttach(attachmentData, counter,summarryCounter);

	}

	if(status1){

	status2  = priceApprovalWebController.updateSummaryStatus(priceData);

	}

	ArrayList approver = new ArrayList();

	String content="" ;
	String apprv [] = null ;
	boolean mailStatus = false;

	if(status1 == true && userstatus.equals("UC")){

		for(int i = 0; i < parList.length; i++ )
		{

        Hashtable emailList = new Hashtable();
        ArrayList approversemailList = new ArrayList();
        emailList.put("PRICEID", parList[i]);
        approversemailList = priceApprovalWebController.getApproverEmailCon(emailList);

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

			approver = priceApprovalWebController.getApproverCon(parList[i]);
			apprv  = (String [])approver.get(0);	

			content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			content += "Purchase Approval Id : "+parList[i]+"\n\n <br><br>";
            content += "Buyer : "+buyer+ "\n\n <br><br>";
            content += "PAR Value (Rs) : "+apprv[2]+"\n\n <br><br>";
            content += "Participants : \n\n <br><br>";
			content += "Buyer : "+participants1+"   "+participants2+"   "+participants3+"\n\n <br>";
			content += "User :  "+participants4+"   "+participants5+"   "+participants6+" \n\n <br>";
			//content += "Supporting Functions :  "+participants7+"   "+participants8+"   "+participants9+"   "+participants10+"\n\n";
			content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://5edd6ca24d3dfdde9b2706f598aa68a9 \n\n <br><br>";
			content += "Regards,<br> Timescape admin";
			


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
                        + "				<td colspan = \"3\" align = \"left\"><img src = \"https://tsweb.timesgroup.com/timescape/images/header_price1.jpg\" border = \"0\"></td>" 
                        + "		    </tr>" 
                        + "			<tr>" 
                        + "				<td colspan = \"3\" align = \"left\"><img src = \"https://tsweb.timesgroup.com/timescape/images/header_price2.jpg\" border = \"0\"></td>" 
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

	   		mailStatus =  priceApprovalWebController.sendIndividualMail(apprv[0],htmlStr,parList[i]);
			//mailStatus =  priceApprovalWebController.sendIndividualMail("sushant.shetty@timesgroup.com",htmlStr,parList[i]);
			//mailStatus =  priceApprovalWebController.sendIndividualMail("laveena.gupta@timesgroup.com",htmlStr,parList[i]);
		}


	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - SUBMIT DATA</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% if(status2)
    {

%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Your request has been created successfully...</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="../indexCon.jsp" class="normal"><b>here</b></a> to go back</td></tr>
			</table>
<%
	}else{
%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="/timescape/sapep/employeeselfservice/priceapproval/images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Sorry there was an Error while creating your request.</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="../indexCon.jsp" class="normal"><b>here</b></a> to go back.</td></tr>
			</table>
<%}%>
</body>
</html>
