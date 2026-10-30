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

	String createdBy		    = "NA";
	String createdon		    = "NA";
	String modifiedby		    = "NA";
	String modifiedon		    = "NA";
	String userstatus		    = "NA";
    String review               ="";
    String priceid              ="";  
    String createdFor           ="";
    String createdForRemarks    ="";
    String createdbyremarks     ="";
    String approverType         ="";
    String updateFromId         ="";
    String updateFromEmail      ="";

    String tOId			    = (String)request.getParameter("tOId");
    priceid		            = (String)request.getParameter("priceid");
    String splId		    = (String)request.getParameter("splId");
   
    createdForRemarks           = (String)request.getParameter("remarksContainer1");
    approverType                = (String)request.getParameter("approverType");
    String createdBy1 = (String)request.getParameter("createdBy");
    createdBy                   = Long.toString(timescapeUserOId);
    

        ArrayList vStatus	=  new ArrayList();

        vStatus 			=	priceApprovalWebController.viewStatusOsp(tOId,priceid);

        ArrayList vStatus5	=  new ArrayList();

        vStatus5 			=	priceApprovalWebController.viewApproverDetailsOsp(tOId,priceid);

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
		String FROMCONTRACTVALIDITY         	= data1[5];
		String TOCONTRACTVALIDITY         	= data1[59];
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
		String userEmailid				    = data1[57];

        String INITIATORNAME				= data1[39];
        String INITIATEDON					= data1[34];
        String COMPANYNAME 					= data1[58];

//System.out.println(approverType);
    //out.println("priceid=: "+priceid);
    //out.println("review=: "+review);
    //out.println("remarks=: "+createdbyremarks);
   // out.println("approverType=: "+approverType);
	 //modifiedby			= Long.toString(timescapeUserOId);
	 modifiedon			= "NA";
	 userstatus			= "L";
//out.println("createdby= "+createdby);

	reviewData.put("PRICEID",priceid);
    reviewData.put("SPLID",splId);
    reviewData.put("CREATEDBY",createdBy);
    //reviewData.put("CREATEDBYREMARKS",createdForRemarks);
    reviewData.put("CREATEDFORREMARKS",createdForRemarks);
	reviewData.put("MODIFIEDBY",createdBy1);
	//reviewData.put("MODIFIEDON","SYSDATE");
	reviewData.put("CREATEDFORAPPROVERTYPE",approverType);
	reviewData.put("STATUS",userstatus);
	reviewData.put("FLAG","Y");


	status  = priceApprovalWebController.updateRemarksData(reviewData);
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
reciverEmail.put("CREATEDBY", createdBy1);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        updateFromEmail= emailList[0]+ "  ";
      }else{
            updateFromEmail="NA"+"  ";
          }System.out.println(updateFromEmail);

        String participants = participants1 + participants2 + participants3 + participants4 + participants5 + participants6 + participants7 + participants8 + participants9 + participants10; //+ participants11 + participants12 + participants13 + participants14 + participants15;
	
        String supportingFuctions = "";
               supportingFuctions = participants7 + participants8 + participants9 + participants10 + participants11 + participants12;
             /*if(supportingFuctions.equals("")){
                    supportingFuctions="NA";
             }*/
        String flag ="U";

			approver = priceApprovalWebController.getApprover(app1);
			apprv  = (String [])approver.get(0);	

			reviewContent  = "Specific Review Remarks : "+createdForRemarks+"\n\n<br>";

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
						+ "	<title>OSP approval</title>" + "\n" 
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

	   		mailStatus =  priceApprovalWebController.sendIndividualMailSpl(emailId,updateFromEmail,htmlStr,priceid,flag);
			//mailStatus =  priceApprovalWebController.sendIndividualMailSpl(emailId,"krishna.vishwakarma@timesgroup.com",htmlStr,priceid,flag);
	}
//out.println("===s "+updateFromEmail);
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
			<td width="77%"><img src="../../images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="../../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Your request has been created successfully...</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="../../indexOsp.jsp" class="normal"><b>here</b></a> to check the status</td></tr>
			</table>
<%
		}else{
%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="../../images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="../../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">Sorry there was an Error while creating your request.</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="../../indexOsp.jsp" class="normal"><b>here</b></a> to check the status</td></tr>
			</table>
<%}%>
</body>
</html>