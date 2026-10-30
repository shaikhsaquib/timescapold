<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%
	Hashtable reviewData  = new Hashtable();
	Hashtable vendorData = new Hashtable();
	Hashtable userTable	 = new Hashtable();

	boolean status			= false;
	boolean status1			= false;
	boolean status2			= false;
	boolean status3			= false;





	String requestedBy		= "NA";
	String reason4			= "NA";
	String requestedBy7		= "NA";
	String requestedBy8		= "NA";
	String reason			= "NA";
	String requestedBy9		= "NA";
	String requestedBy10	= "NA";
	String requestedBy2		= "NA";
	String requestedBy3		= "NA";
	String requestedBy4		= "NA";
	String requestedBy5		= "NA";
	String validity			= "NA";
	String fqtNumber		= "NA";
	String requestedBy6		= "NA";
	String req				= "NA";
    String reason1			= "NA";
	String reason2			= "NA";
	String reason3			= "NA";
	String reason44			= "NA";
	String reason5			= "NA";
	String reason6			= "NA";
	String reason7			= "NA";
	String reason8			= "NA";
	String reason9			= "NA";
	String reason10			= "NA";
	String attach1			= "NA";
	String attach2			= "NA";
	String attach3			= "NA";
	String attach4			= "NA";
	String attach5			= "NA";
	String attach6			= "NA";
	String attach7			= "NA";
	String attach8			= "NA";
	String attach9			= "NA";
	String attach10			= "NA";
	String reason14			= "NA";
	String reason15			= "NA";
	String reason16			= "NA";
	String fromDateAir1		= "NA";
	String fromDateAir2		= "NA";
	String fromDateAir3		= "NA";
	String fromDateAir4		= "NA";
	String fromDateAir8		= "NA";
	String fromDateAir9		= "NA";
	String recommendation	= "NA";
	String sbd1				= "0";
	String sbd2				= "0";
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
	String compName1		= "NA";
	String compName2		= "NA";
	String compName3		= "NA";
	String UOM1				= "NA";
	String UOM2				= "NA";
	String UOM3				= "NA";
	String rem1				= "NA";
	String rem2				= "NA";
	String rem3				= "NA";
	String counters			= (String)request.getParameter("count");
	String category			= "NA";
	int counter				= 0;
    String review                   ="";
    String priceid                  ="";  
    String createdFor               ="";
    String createdForEmail          ="";
    String createdForRemarks        ="";
    String createdbyremarks         ="";
    String approverType             ="";
    String createdForApproverType   ="";
    String flag1   ="";
  
    priceid                         = (String)request.getParameter("priceid");
    review                          = (String)request.getParameter("review");
    createdbyremarks                = (String)request.getParameter("remarksContainer");
    approverType                    = (String)request.getParameter("approverType");
    //flag                            = (String)request.getParameter("flag");
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
/*==========================================================================================================================*/
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
//out.println("flag= "+flag);

	status  = priceApprovalWebController.insertReviewData(reviewData);
//status=true;

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

String negotiation_pc_date			        = (String)request.getParameter("negotiation_pc_date");
String negotiation_pc_meeting_venue		    = (String)request.getParameter("negotiation_pc_meeting_venue");
String negotiation_value			        = (String)request.getParameter("negotiation_value");
String finalized_vendor_name			    = (String)request.getParameter("finalized_vendor_name");
String payment_terms				        = (String)request.getParameter("payment_terms");
String savings					            = (String)request.getParameter("savings");
String product_service__name			    = (String)request.getParameter("product_service__name");
String indented_user				        = (String)request.getParameter("indented_user");
String package_name_sanction			    = (String)request.getParameter("package_name_sanction");
String total_budget				            = (String)request.getParameter("total_budget");
String po_committed_till_date			    = (String)request.getParameter("po_committed_till_date");
String balance_budget				        = (String)request.getParameter("balance_budget");
String requirement				            = (String)request.getParameter("requirement");
String description1				            = (String)request.getParameter("description1");
String description2				            = (String)request.getParameter("description2");
String description3				            = (String)request.getParameter("description3");
String attachment1				            = (String)request.getParameter("attachment1");
String attachment2				            = (String)request.getParameter("attachment2");
String attachment3				            = (String)request.getParameter("attachment3");
String product1				                = (String)request.getParameter("product1");
String product2				                = (String)request.getParameter("product2");
String product3				                = (String)request.getParameter("product3");
String rate1					            = (String)request.getParameter("rate1");
String rate2					            = (String)request.getParameter("rate2");
String rate3					            = (String)request.getParameter("rate3");
String benchmark1				            = (String)request.getParameter("benchmark1");
String benchmark2				            = (String)request.getParameter("benchmark2");
String benchmark3				            = (String)request.getParameter("benchmark3");
String recommenedation				        = (String)request.getParameter("recommenedation");


	if(status == true){
	ArrayList approver = new ArrayList();
	
		
		String apprv [] = null ;
		String content="" ;
		String reviewContent="" ;
		boolean mailStatus = true;
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

  /*      if(request.getParameter("app1")!=null){
            participants1 = ((String)request.getParameter("app1")).equals("") ? "NA" : ((String)request.getParameter("app1") + ", ");
        }
        if(request.getParameter("app4")!=null){
            participants2 = ((String)request.getParameter("app4")).equals("") ? "NA" : ((String)request.getParameter("app4") + ", ");
        }
        if(request.getParameter("app7")!=null){
            participants3 = ((String)request.getParameter("app7")).equals("") ? "NA" : ((String)request.getParameter("app7") + "  ");
        }
        if(app2!=null){
            participants4 = app2.equals("") ? "NA" : app2 + "," ;
        }
        if(app5!=null){
            participants5 = app5.equals("") ? "NA" : app5 + "," ;
        }
        if(app8!=null){
            participants6 = app8.equals("") ? "NA" : app8 + "," ;
        }




        if(request.getParameter("app3")!=null){
            participants7 = ((String)request.getParameter("app3")).equals("") ? "" : ((String)request.getParameter("app3") + ", ");
        }

        if(request.getParameter("app6")!=null){
            participants8 = ((String)request.getParameter("app6")).equals("") ? "" : ((String)request.getParameter("app6") + ", ");
        }
        if(request.getParameter("app9")!=null){
            participants9 = ((String)request.getParameter("app9")).equals("") ? "" : ((String)request.getParameter("app9") + ", ");
        }
        if(request.getParameter("app10")!=null){
            participants10 = ((String)request.getParameter("app10")).equals("") ? "" : ((String)request.getParameter("app10") + ", ");
        }
         if(request.getParameter("app11")!=null){
                    participants11 = ((String)request.getParameter("app11")).equals("") ? "NA" : ((String)request.getParameter("app11") + ", ");
         }
         if(request.getParameter("app12")!=null){
                    participants12 = ((String)request.getParameter("app12")).equals("") ? "NA" : ((String)request.getParameter("app12") + "  ");
         }   */

    
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

			content += "Purchase Approval Id : "+priceid+"\n\n <br>";
            content += "Item Description : "+product_service__name+ "\n\n <br>";
            content += "Buyer : "+participants3+ "\n\n <br>";
            content += "User : "+indented_user+ "\n\n <br>";
            content += "PC meeting date : "+negotiation_pc_date+"\n\n <br><br>";
            content += "Participants : \n\n <br><br>";
			content += "Buyer : "+participants1+"   "+participants2+"   "+participants3+"\n\n <br>";
			content += "User :  "+participants4+"   "+participants5+"   "+participants6+" \n\n <br>";
			//content += "Supporting Functions :  "+participants7+"   "+participants8+"   "+participants9+"   "+participants10+"\n\n";
			content += "Supporting Functions :  "+supportingFuctions+"\n\n <br><br>";
			content += "Sanctioned Value (Rs) : "+total_budget+"\n\n <br>";			
			content += "Negotiated Value (Rs) : "+negotiation_value+ "\n\n <br>";
			content += "Scope : "+requirement+"\n\n <br>";
			content += "Recommended Vendor : "+finalized_vendor_name+"\n\n <br>";
			content += "Purchase Approval Link on Timescape : http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
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
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
</head>
<body>
<% if(status == true )
		{

%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Your request has been created successfully...</td><tr>
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
			<tr><td colspan="2" align="center"><span class="normal">Sorry there was an Error while creating your request.</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="javascript:navigateCall();" class="normal"><b>here</b></a> to check the status</td></tr>
			</table>
<%}%>
</body>
</html>