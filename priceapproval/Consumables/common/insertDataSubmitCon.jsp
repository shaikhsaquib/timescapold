<%@ page import="java.util.Hashtable, java.util.ArrayList,java.util.Calendar,java.util.GregorianCalendar" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<%
	Hashtable priceData  = new Hashtable();
	Hashtable attachmentData = new Hashtable();
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
	String createdby		= "NA";
	String createdon		= "NA";
	String modifiedby		= "NA";
	String modifiedon		= "NA";
	String userstatus		= "NA";
	String rem3				= "NA";
	String counters			= (String)request.getParameter("count");
	String category			= "NA";
	String parvalue			= "NA";
	String summarySheetChk			= "NA";
	String docType			= "";
	String category1			= "";
	String newPriceIdCode			= "";
	String newCategoryCode			= "";
	String priceCounter			= "";
	int counter				= 0;

String app1Tid ="";
String app2Tid ="";
String app4Tid ="";
String app5Tid ="";
String app7Tid ="";
String app8Tid ="";

	
	counter = Integer.parseInt(counters);

	 category			= (String)request.getParameter("category");
	 parvalue			= (String)request.getParameter("parvalue");
	 docType			= (String)request.getParameter("docType");
	 //System.out.println("docType"+docType);
	 category1 = (String)request.getParameter("category");
	summarySheetChk	= (String)request.getParameter("summarySheetChk");

	GregorianCalendar thisDay = new GregorianCalendar( );
	int currMonth=0;
	int currYear=0;
	currMonth = thisDay.get(Calendar.MONTH);
	currYear =  thisDay.get(Calendar.YEAR);
	
	String faStartYear = "";
	String faEndYear   = "";
	String faYear	   = "";

	if(currMonth >= 3 && currMonth <= 11){
		faStartYear = Integer.toString(currYear);
		faEndYear   = Integer.toString(currYear+1);
	}
	else if(currMonth >= 0 && currMonth <= 2){
		faStartYear = Integer.toString(currYear-1);
		faEndYear   = Integer.toString(currYear);
	}

	faYear	    = faStartYear.substring( 2,faStartYear.length() ) + faEndYear.substring( 2,faEndYear.length() ) ;
	System.out.println("faYear=="+faYear);

	

	if(summarySheetChk == null)
	{
		summarySheetChk="NO";
	}
	else{
		summarySheetChk="YES";
	}

	 app1				= (String)request.getParameter("app1H");

	 if(app1.equals("0") || app1 == null || app1.equals("")){app1="0";}
        else{
        app1Tid = app1.substring(0,app1.indexOf("|"));
        app1=app1Tid;
        //out.println("app2="+app2);
        }

	 app2				= (String)request.getParameter("app2H");
	 if(app2.equals("0")|| app2 == null || app2.equals("")){app2="0";}
        else{
        app2Tid = app2.substring(0,app2.indexOf("|"));
        app2=app2Tid;
        //out.println("app2="+app2);
        }
	 app4				= (String)request.getParameter("app4H");

	 if(app4.equals("0") || app4 == null || app4.equals("")){app4="0";}
        else{
        app4Tid = app4.substring(0,app4.indexOf("|"));
        app4=app4Tid;
        //out.println("app4="+app4);
        }



	 app5				= (String)request.getParameter("app5H");
	 if(app5.equals("0") || app5 == null || app5.equals("")){app5="0";}
        else{
        app5Tid = app5.substring(0,app5.indexOf("|"));
        app5=app5Tid;
        //out.println("app5="+app5);
        }

	 app7				= (String)request.getParameter("app7H");

	 if(app7.equals("0") || app7 == null || app7.equals("")){app7="0";}
        else{
        app7Tid = app7.substring(0,app7.indexOf("|"));
        app7=app7Tid;
        //out.println("app7="+app7);
        }


	 app8				= (String)request.getParameter("app8H");

	 if(app8.equals("0") || app8 == null || app8.equals("")){app8="0";}
        else{
        app8Tid = app8.substring(0,app8.indexOf("|"));
        app8=app8Tid;
        //out.println("app8="+app8);
        }



 	 select12			= (String)request.getParameter("select12");
	 select13			= (String)request.getParameter("select13");
	 app3				= (String)request.getParameter("app3");
	 app6				= (String)request.getParameter("app6");
	 app9				= (String)request.getParameter("app9");
	 app10				= (String)request.getParameter("app10");
	 select14			= (String)request.getParameter("select14");
	 select15			= (String)request.getParameter("select15");
	 select16			= (String)request.getParameter("select16");
	 app11				= (String)request.getParameter("app11H");
	 app12				= (String)request.getParameter("app12H");	 
	 createdby			= Long.toString(timescapeUserOId);
	 createdon			= "NA";
	 modifiedby			= Long.toString(timescapeUserOId);
	 modifiedon			= "NA";


	if(summarySheetChk.equals("YES"))
	{
		 userstatus			= "UCS";
	}else{
		 userstatus			= "UC";
	}

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


	priceData.put("CATEGORY",(String)Utility.replaceQuoteOracle(category));
	priceData.put("PARVALUE",(String)Utility.replaceQuoteOracle(parvalue));
	priceData.put("SUMMARYSHEETCHK",(String)Utility.replaceQuoteOracle(summarySheetChk));
	priceData.put("APPROVER11",app1);
	priceData.put("APPROVER12",app2);
	priceData.put("APPROVER13",app3);
	priceData.put("APPROVER21",app4);
	priceData.put("APPROVER22",app5);
	priceData.put("APPROVER23",app6);
	priceData.put("APPROVER31",app7);
	priceData.put("APPROVER32",app8);
	priceData.put("APPROVER33",app9);
	priceData.put("APPROVER34",app10);
	priceData.put("APPROVER35",app11);
	priceData.put("APPROVER36",app12);
	priceData.put("APPROVER4",select12);
	priceData.put("APPROVER5",select13);
	priceData.put("APPROVER6",select14);
	priceData.put("APPROVER7",select15);
	priceData.put("APPROVER8",select16);
	priceData.put("CREATEDBY",createdby);
	priceData.put("CREATEDON","SYSDATE");
	priceData.put("MODIFIEDBY",modifiedby);
	priceData.put("MODIFIEDON","SYSDATE");
	priceData.put("STATUS",userstatus);

	ArrayList priceCounterTable = priceApprovalWebController.getPriceCounter("Consumables");

    String[] data1      = (String [])priceCounterTable.get(0);

    String categoryCode=data1[0];

	String  priceIdCode=data1[1];

   int priceIdNew= Integer.parseInt(priceIdCode);
  
   //String priceCounter = categoryCode + priceIdNew ;
   if("Ink".equals(category1)){
	   newCategoryCode = "INK";
		
   }
   if("Others".equals(category1)){
	   newCategoryCode = "OTH";
		
   }
   if("Production".equals(category1)){
	   newCategoryCode = "PRD";
		
   }
   if("Plates".equals(category1)){
	   newCategoryCode = "PLT";
		
   }
   if("Packaging".equals(category1)){
	   newCategoryCode = "PKG";
		
   }
   if("Chemicals".equals(category1)){
	   newCategoryCode = "CHM";
		
   }
   if("Blankets".equals(category1)){
	   newCategoryCode = "BLK";
		
   }

    if("PAR".equals(docType) ){
		if(summarySheetChk.equals("NO")){
		 priceCounter = "CONP" + newCategoryCode+ faYear + priceIdNew;
		// System.out.println("priceCounter=="+priceCounter);
		//}else if(summarySheetChk.equals("YES")){
		}else if("YES".equals(summarySheetChk)){
		 priceCounter = "CONS" + newCategoryCode + faYear + priceIdNew;
		// System.out.println("priceCounter=="+priceCounter);
		}
	}
	
	if("Summary".equals(docType) ){
		 priceCounter = "CONS" + faYear +priceIdNew;
		 System.out.println("priceCounter=="+priceCounter);
	}

	status  = priceApprovalWebController.insertDataCon(priceData, priceCounter,categoryCode);

	if(status){
	status1  = priceApprovalWebController.insertDataConAttach(attachmentData, counter,priceCounter);

	}

if(summarySheetChk.equals("NO")){
	if(status1){
	ArrayList approver = new ArrayList();
	
		
		String apprv [] = null ;
		String content="" ;
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
        if(request.getParameter("app1")!=null){
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
         }   

    
    Hashtable reciverEmail = new Hashtable();
    ArrayList listOfreciverEmailId = new ArrayList();
    String[] emailList =null;
        reciverEmail.put("CREATEDBY", app2);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants4= emailList[0] + ", ";
      }else{
            participants4="NA"+" , ";
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
    reciverEmail.put("CREATEDBY", app3);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants7= emailList[0] + ", ";
      }else{
            participants7="NA"+" , ";
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

        String participants = participants1 + participants2 + participants3 + participants4 + participants5 + participants6 + participants7 + participants8 + participants9 + participants10; //+ participants11 + participants12 + participants13 + participants14 + participants15;
	
        String supportingFuctions = "";
               supportingFuctions = participants7 + participants8 + participants9 + participants10 + participants11 + participants12;



String mailToApprover="";
        if(!app1.equals("0")){
            mailToApprover = app1;
        }else if(!app4.equals("0")){
            mailToApprover = app4;
        }else if(!app7.equals("0")){
            mailToApprover = app7;
        }else{
            mailToApprover ="0";
        }

			approver = priceApprovalWebController.getApprover(mailToApprover);
			apprv  = (String [])approver.get(0);	

			content  = "The following Purchase Approval(PAR Note) request is pending for your approval. Please approve or review this request on Timescape.\n\n <br><br>";
			content += "Purchase Approval Id : "+priceCounter+"\n\n <br><br>";
            content += "Buyer : "+buyer+ "\n\n <br><br>";
            content += "PAR Value (Rs) : "+parvalue+"\n\n <br><br>";
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

	   		mailStatus =  priceApprovalWebController.sendIndividualMail(apprv[0],htmlStr,priceCounter);
			//mailStatus =  priceApprovalWebController.sendIndividualMail("laveena.gupta@timesgroup.com",htmlStr,priceCounter);
	}
}
	//out.println(createdby+":"+priceCounter+":"+modifiedby+":"+userstatus);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - SUBMIT DATA</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% if(status1)
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
