<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<%
	Hashtable reviewData  = new Hashtable();
	Hashtable vendorData = new Hashtable();
	Hashtable userTable	 = new Hashtable();

	boolean status			= false;
	boolean status1			= false;
	boolean status2			= false;
	boolean status3			= false;
    String review                   ="";
    String priceid                  ="";  
    String createdFor               ="";
    String createdForEmail          ="";
    String createdForRemarks        ="";
    String createdbyremarks         ="";
    String approverType             ="";
    String createdForApproverType   ="";
    String flag1   ="";



	String app1				= "0";
	String app2				= "0";
	String app3				= "0";
	String app4				= "0";
	String app5				= "0";
	String app6				= "0";
	String app7				= "0";
	String app8				= "0";
	String app9				= "0";
	String app10			= "0";
	String app11			= "0";
	String app12			= "0";
	String select12			= "0";
	String select13			= "0";
	String select14			= "0";
	String select15			= "0";
	String select16			= "0";

	String createdby		= "NA";
	String createdon		= "NA";
	String modifiedby		= "NA";
	String modifiedon		= "NA";
	String userstatus		= "NA";


    priceid		            = (String)request.getParameter("priceid");
    review                          = (String)request.getParameter("review");
    createdbyremarks                = (String)request.getParameter("remarksContainer");

    String tOId			= (String)request.getParameter("tOId");

    createdbyremarks = createdbyremarks.replaceAll("[^\\p{ASCII}]", "");


        approverType                    = (String)request.getParameter("approverType");

        ArrayList vStatus	=  new ArrayList();

        vStatus 			=	priceApprovalWebController.viewStatusOsp(tOId,priceid);

        String[] data1		= (String [])vStatus.get(0);

		String SANCTIONEDREFTYPE			= data1[1];
		String REFNUMBER					= data1[2];
		String DATEOFAPPROVAL				= data1[3];
		String PROJECTNAME      			= data1[4];
		String FROMCONTRACTVALIDITY         = data1[5];
		String TOCONTRACTVALIDITY         	= data1[59];
		String DESCRIPTION			        = data1[6];
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
		String userEmailid				    = data1[57];

        String INITIATORNAME				= data1[39];
        String INITIATEDON					= data1[34];
        String COMPANYNAME 					= data1[58];

    //out.println("priceid=: "+priceid);
    //out.println("review=: "+review);
    //out.println("remarks=: "+createdbyremarks);
    //out.println("approverType=: "+approverType);

    if(review.equals("app1"))
      {
      createdFor =  (String)request.getParameter("app1H");
        
      }else if(review.equals("app2"))
      {
      createdFor =  (String)request.getParameter("app2H");
        
      }else if(review.equals("app3"))
      {
      createdFor =  (String)request.getParameter("app3H");
        
      }else if(review.equals("app4"))
      {
      createdFor =  (String)request.getParameter("app4H");
        
      }else if(review.equals("app5"))
      {
      createdFor =  (String)request.getParameter("app5H");
        
      }else if(review.equals("app6"))
      {
      createdFor =  (String)request.getParameter("app6H");
       
      }else if(review.equals("app7"))
      {
      createdFor =  (String)request.getParameter("app7H");
        
      }else if(review.equals("app8"))
      {
      createdFor =  (String)request.getParameter("app8H");
        
      }else if(review.equals("app9"))
      {
      createdFor =  (String)request.getParameter("app9H");
        
      }else if(review.equals("app10"))
      {
      createdFor =  (String)request.getParameter("app10H");
        
      }else if(review.equals("app11"))
      {
      createdFor =  (String)request.getParameter("app11H");
        
      }else if(review.equals("app12"))
      {
      createdFor =  (String)request.getParameter("app12H");
        
      }else if(review.equals("select12"))
      {
      createdFor =  (String)request.getParameter("select12H");
        
      }else if(review.equals("select13"))
      {
      createdFor =  (String)request.getParameter("select13H");
        
      }else if(review.equals("select13"))
      {
      createdFor =  (String)request.getParameter("select14H");
        
      }else if(review.equals("select15"))
      {
      createdFor =  (String)request.getParameter("select15H");
        
      }else if(review.equals("select15"))
      {
      createdFor =  (String)request.getParameter("select16H");
        
      }
/*================================createdForApproverType=========================================================================================*/
    if(review.equals("app1"))
      {
      createdForApproverType =  "AP11";
       
      }else if(review.equals("app2"))
      {
       createdForApproverType =  "AP12";
        
      }else if(review.equals("app3"))
      {
       createdForApproverType =  "AP13";
       
      }else if(review.equals("app4"))
      {
       createdForApproverType =  "AP21";
        
      }else if(review.equals("app5"))
      {
       createdForApproverType =  "AP22";
       
      }else if(review.equals("app6"))
      {
       createdForApproverType =  "AP23";
       
      }else if(review.equals("app7"))
      {
       createdForApproverType =  "AP31";
       
      }else if(review.equals("app8"))
      {
       createdForApproverType =  "AP32";
       
      }else if(review.equals("app9"))
      {
       createdForApproverType =  "AP33";
        
      }else if(review.equals("app10"))
      {
       createdForApproverType =  "AP34";
       
      }else if(review.equals("app11"))
      {
       createdForApproverType =  "AP35";
       
      }else if(review.equals("app12"))
      {
       createdForApproverType =  "AP36";
       
      }

	 createdby			= Long.toString(timescapeUserOId);
	 createdon			= "NA";
	 modifiedby			= Long.toString(timescapeUserOId);
	 modifiedon			= "NA";
	 userstatus			= "SPLR";


	reviewData.put("PRICEID",priceid);
	reviewData.put("CREATEDBY",createdby);
	reviewData.put("CREATEDON","SYSDATE");
    reviewData.put("CREATEDFOR",createdFor);
    reviewData.put("CREATEDBYREMARKS",createdbyremarks);
    reviewData.put("CREATEDFORREMARKS","-");
	reviewData.put("MODIFIEDBY",modifiedby);
	reviewData.put("MODIFIEDON","SYSDATE");
	reviewData.put("CREATEDBYAPPROVERTYPE",approverType);
	reviewData.put("CREATEDFORAPPROVERTYPE",createdForApproverType);
	reviewData.put("STATUS","SPLR");
	reviewData.put("FLAG","Y");
 
	status  = priceApprovalWebController.insertReviewData(reviewData);
 
    app1 = (String)request.getParameter("app1H");
    app2 = (String)request.getParameter("app2H");
    app3 = (String)request.getParameter("app3H");
    app4 = (String)request.getParameter("app4H");
    app5 = (String)request.getParameter("app5H");
    app6 = (String)request.getParameter("app6H");
    app7 = (String)request.getParameter("app7H");
    app8 = (String)request.getParameter("app8H");
    app9 = (String)request.getParameter("app9H");
    app10 = (String)request.getParameter("app10H");
    app11 = (String)request.getParameter("app11H");
    app12 = (String)request.getParameter("app12H");


	if(status){
	ArrayList approver = new ArrayList();
	
		
		String apprv [] = null ;
		String content="" ;
		String reviewContent="" ;
		boolean mailStatus = false;
        String buyer = (String)request.getParameter("app7");
        String participants1 = "";
        String participants2= "";
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
        String participants13 = "";
        String participants14 = "";
        String participants15 = "";


    
    Hashtable reciverEmail = new Hashtable();
    ArrayList listOfreciverEmailId = new ArrayList();
    String[] emailList =null;
       reciverEmail.put("CREATEDBY", app1);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants1= emailList[0] + ", ";
      }else{
            participants1="NA"+" , ";
          }


        reciverEmail.put("CREATEDBY", app2);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants4= emailList[0] + ", ";
      }else{
            participants4="NA"+" , ";
          }
    reciverEmail.put("CREATEDBY", app3);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants7= emailList[0] + ", ";
      }else{
            participants7="NA"+" , ";
          }

   reciverEmail.put("CREATEDBY", app4);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants2= emailList[0] + ", ";
      }else{
            participants2="NA"+" , ";
          }
        reciverEmail.put("CREATEDBY", app5);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants5= emailList[0] + ", ";
      }else{
            participants5="NA"+" , ";
          }

      reciverEmail.put("CREATEDBY", app6);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants8= emailList[0]+ ", ";
      }else{
            participants8="NA"+" , ";
          }
      reciverEmail.put("CREATEDBY", app7);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants3= emailList[0]+ ", ";
      }else{
            participants3="NA"+" , ";
          }

       reciverEmail.put("CREATEDBY", app8);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants6= emailList[0] + ", ";
      }else{
            participants6="NA"+" , ";
          }
    //participants7 = (String)request.getParameter("app3");
 
  reciverEmail.put("CREATEDBY", app9);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants9= emailList[0]+ ", ";
      }else{
            participants9="NA"+" , ";
          }

 reciverEmail.put("CREATEDBY",app10);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants10= emailList[0]+ " , ";
      }else{
            participants10="NA"+" , ";
          }
 reciverEmail.put("CREATEDBY", app11);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants11= emailList[0]+ " , ";
      }else{
            participants11="NA"+" , ";
          }
reciverEmail.put("CREATEDBY", app12);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants12= emailList[0]+ "  ";
      }else{
            participants12="NA"+"  ";
          }
reciverEmail.put("CREATEDBY", createdFor);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        createdForEmail= emailList[0]+ "  ";
      }else{
            createdForEmail="NA"+"  ";
          }

        String participants = participants1 + participants2 + participants3 + participants4 + participants5 + participants6 + participants7 + participants8 + participants9 + participants10; //+ participants11 + participants12 + participants13 + participants14 + participants15;
	
        String supportingFuctions = "";
               supportingFuctions = participants7 + participants8 + participants9 + participants10 + participants11 + participants12;
             /*if(supportingFuctions.equals("")){
                    supportingFuctions="NA";
             }*/
        String flag ="R";

			approver = priceApprovalWebController.getApprover(app1);
			apprv  = (String [])approver.get(0);	

			reviewContent  = "Specific Review Remarks : "+createdbyremarks+"\n\n<br>";

            content += "Purchase Approval Id : "+priceid+ "\n\n <br>";
            content += "Description : "+DESCRIPTION+ "\n\n <br>";
            content += "Contract Validity : "+FROMCONTRACTVALIDITY+ " to "+TOCONTRACTVALIDITY+"\n\n <br>";
            content += "Contract Value (Rs) : "+CONTRACTVALUE+"\n\n <br><br>";
            content += "Buyer : "+APPROVER31+ "\n\n <br>";

            content += "Participants : \n\n <br><br>";
			content += "Buyer : "+participants1+"   "+participants2+"   "+participants3+"\n\n <br>";
			content += "User :  "+participants4+"   "+participants5+"   "+participants6+" \n\n <br>";
			content += "Purchase Approval Link on Timescape : http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
			content += "Regards,<br> Timescape admin";
			


String	htmlStr = "<html>" + "\n" 
						+ "<head>" + "\n" 
						+ "	<title>Osp Specific Review</title>" + "\n" 
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
						+ "							<td colspan = \"3\" align = \"left\" class = \"rednormal\">" 
						+ "								<div align = \"left\">" + reviewContent + "</div>" 
						+ "							</td>" 
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

	   		mailStatus =  priceApprovalWebController.sendIndividualMailSpl(emailId, createdForEmail,htmlStr,priceid,flag);
			//mailStatus =  priceApprovalWebController.sendIndividualMailSpl(emailId, "krishna.vishwakarma@timesgroup.com",htmlStr,priceid,flag);
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - SUBMIT DATA</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../../jscripts/osp.js"></script>
</head>
<body>
<% if(status)
		{

%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="../../images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="../../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Specific review sent successfully...</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="javascript:navigateCall();" class="normal"><b>here</b></a> to check the status</td></tr>
			</table>
<%
		}else{
%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Sorry there was an Error while sending your specific review request.</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="javascript:navigateCall();" class="normal"><b>here</b></a> to check the status</td></tr>
			</table>
<%}%>
</body>
</html>