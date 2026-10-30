<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<%@ page import = "com.bccl.util.HtmlUtil,com.bccl.util.Utility, java.text.SimpleDateFormat,java.util.Date, java.text.DateFormat"%>
<jsp:useBean id = "priceApprovalWebController" class = "com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language = "java" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file = "../includes/empHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv = "Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - SUPPORT/REJECT</title>
<script Language="JavaScript" src="../jscripts/newsprint.js"></script>
<link href = "../style/global.css" rel = "stylesheet" type = "text/css" />
</head>
<body>
<%
		

		//long priceid		                = Long.parseLong(request.getParameter("priceid"));
		String priceid		                = (String)request.getParameter("priceid");
		String appType                      = request.getParameter("appType");
		String status1                      = "";
		String statusType                   = request.getParameter("statusType");
		String tOId			                = (String)request.getParameter("tOId");
		String buyerEmailaddress2 = request.getParameter("buyerEmailaddress1");
		String sendMailto                   ="";

		String reviewersComments = (String)session.getAttribute("reviewersComments");

		ArrayList[] sendMailsto = new ArrayList[4];
		boolean	status2 = true;
		boolean	status =true;

        ArrayList vStatus	=  new ArrayList();
		vStatus 			=	priceApprovalWebController.viewStatusnp(tOId,priceid);
		ArrayList vStatus2	=  new ArrayList();
		vStatus2 			=	priceApprovalWebController.viewApproverNp(priceid);
	
		//String pageType		= request.getParameter("viewSAB"); 


		String[] data3      = (String [])vStatus2.get(0);
		String[] data1      = (String [])vStatus.get(0);


        String priceId			        =  data1[0];
        String vendorName		        =  data1[1];
        String category			        =  data1[2];
        String mill			            =  data1[3];
        String paymentTerms		        =  data1[4];
        String sourcing			        =  data1[5];
        String quantity			        =  data1[6];
        String deliveryIn		        =  data1[7];
        String quality			        =  data1[8];
        String gsm			            =  data1[9];
        String thisLotcfr		        =  data1[10];
        String invoicePrice		        =  data1[11];
        String risi		                =  data1[12];
        String aopReceiptPrice		    =  data1[13];
        String aopReceiptForEx  	    =  data1[14];
        String aopDealValue       	    =  data1[15];
        String annualBudget		        =  data1[16];
        String contractedTonsytd	    =  data1[17];
        String currentQuarter   	    =  data1[18];
        String balanceToBought		    =  data1[19];
        String otherRemaks		        =  data1[20];
        String marketEvent		        =  data1[21];
        String ap1			            =  data1[22];
        String ap2			            =  data1[23];
        String ap3			            =  data1[24];
        String ap4			            =  data1[25];
        String ap5			            =  data1[26];
        String ap6			            =  data1[27];
        String STATUS			        =  data1[28];
        String totalPrice_unitRate	    =  data1[29];
        String totalPrice_rsperTon	    =  data1[30];
        String totalPrice_spend		    =  data1[31];
        String customsDuty_unitRate	    =  data1[32];
        String customsDuty_rsperTon	    =  data1[33];
        String customsDuty_spend	    =  data1[34];
        String freight_unitRate		    =  data1[35];
        String freight_rsperTon		    =  data1[36];
        String freight_spend		    =  data1[37];
        String insurance_unitRate	    =  data1[38];
        String insurance_rsperTon	    =  data1[39];
        String insurance_spend		    =  data1[40];
        String totalActualCost_unitRate =  data1[41];
        String totalActualCost_rsperTon =  data1[42];
        String totalActualCost_spend	=  data1[43];
        String budgetvsActual_unitRate  =  data1[44];
        String quarterOpeningQuantity	=  data1[45];
        String quarterOpeningDays	    =  data1[46];
        String expectedReceiptsQuantity     =  data1[47];
        String expectedReceiptsDays	        =  data1[48];
        String estimatedCons1   	        =  data1[49];
        String estimatedCons2   	        =  data1[50];
        String quarterEnd1         	        =  data1[51];
        String quarterEnd2         	        =  data1[52];

        String AP1Name                      =  data1[53];
        String AP2Name                      =  data1[54];
        String AP3Name                      =  data1[55];
        String AP4Name                      =  data1[56];
        String AP5Name                      =  data1[57];
        String AP6Name                      =  data1[58];
        String CREATEDBY                    =  data1[62];
        String creatorEmailid               =  data1[63];
        String createdOn               =  data1[64];
        String origin                       =  data1[66];

        String AP1_STATUS					=   data3[0]; 
        String AP1_DATE						=   data3[1]; 
        String AP2_STATUS					=   data3[2]; 
        String AP2_DATE						=   data3[3]; 
        String AP3_STATUS					=   data3[4]; 
        String AP3_DATE						=   data3[5]; 
        String AP4_STATUS					=   data3[6]; 
        String AP4_DATE						=   data3[7]; 
        String AP5_STATUS					=   data3[8]; 
        String AP5_DATE						=   data3[9]; 
        String AP6_STATUS					=   data3[10]; 
        String AP6_DATE						=   data3[11]; 



  
		ArrayList approvers = new ArrayList();
	
		String apprv1 [] = null ;
		String apprv [] = null ;
		String content="" ;
		String content1="";

		boolean mailStatus = false;
        String participants1 = "";
        String participants2= "";
        String participants3 = "";
        String participants4 = "";
        String participants5 = "";
        String participants6 = "";


    Hashtable reciverEmail = new Hashtable();
    ArrayList listOfreciverEmailId = new ArrayList();
    String[] emailList =null;
        reciverEmail.put("CREATEDBY", ap1);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants1= emailList[0] + " ";
      }else{
            participants1="NA"+"  ";
          }

        reciverEmail.put("CREATEDBY", ap2);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants2= emailList[0] + " ";
      }else{
            participants2="NA"+"  ";
          }

        reciverEmail.put("CREATEDBY", ap3);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants3= emailList[0] + " ";
      }else{
            participants3="NA"+"  ";
          }

        reciverEmail.put("CREATEDBY", ap4);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants4= emailList[0] + " ";
      }else{
            participants4="NA"+"  ";
          }

        reciverEmail.put("CREATEDBY", ap5);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants5= emailList[0] + " ";
      }else{
            participants5="NA"+"  ";
          }

        reciverEmail.put("CREATEDBY", ap6);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants6= emailList[0];
      }else{
            participants6="NA";
          }


        String participants = participants1 + participants2 + participants3 + participants4 + participants5 + participants6 ;

		//System.out.println("appType--"+appType);
		//System.out.println("statusType--"+statusType);

	


		if(appType.equals("AP1"))
	    {   
		if(statusType.equals("A") ){
            sendMailto= ap2;
            status2	= priceApprovalWebController.updateStatusNp("L",priceid);
            approvers = priceApprovalWebController.getApproversNp(priceid,sendMailto);
                }else if(statusType.equals("MA")){
            sendMailto= ap2;
            status2	= priceApprovalWebController.updateStatusNp("UCA",priceid);
            approvers = priceApprovalWebController.getApproversNp(priceid,sendMailto);
                }else if(statusType.equals("H")||statusType.equals("R")){
            approvers = priceApprovalWebController.getApproversNp(priceid,CREATEDBY);
            }
		
	    }
		if(appType.equals("AP2") )
	    {   
            if(statusType.equals("A")|| statusType.equals("MA")){
            sendMailto= ap3;
                    approvers = priceApprovalWebController.getApproversNp(priceid,sendMailto);
            }else if(statusType.equals("H")||statusType.equals("R")){
            approvers = priceApprovalWebController.getApproversNp(priceid,CREATEDBY);
            }
		}

	SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy");

	Date createdOnDate = format.parse(createdOn);
	//String date2Temp = format.format(new Date());
	Date changedDate = format.parse("11-FEB-2022");
	
	if (createdOnDate.compareTo(changedDate) < 0) {

		if(appType.equals("AP3"))
	    {   
            if(statusType.equals("A")|| statusType.equals("MA")){
            //sendMailto= ap4;--Commented by Niraj on 19th April 2018
            sendMailto= ap5;
                    approvers = priceApprovalWebController.getApproversNp(priceid,sendMailto);
            }else if(statusType.equals("H")||statusType.equals("R")){
            approvers = priceApprovalWebController.getApproversNp(priceid,CREATEDBY);
            }
		}
        /* if(appType.equals("AP4"))//--Commented by Niraj on 19th April 2018
	    {   
            if(statusType.equals("A")|| statusType.equals("MA")){
            sendMailto= ap5;
                    approvers = priceApprovalWebController.getApproversNp(priceid,sendMailto);
            }else if(statusType.equals("H")||statusType.equals("R")){
            approvers = priceApprovalWebController.getApproversNp(priceid,CREATEDBY);
            }
		} */
        if(appType.equals("AP5"))
	    {   
            if(statusType.equals("A") || statusType.equals("MA")){
                     // sendMailto= ap6;
                    //approvers = priceApprovalWebController.getApproversNp(priceid,sendMailto);
            }else if(statusType.equals("H")||statusType.equals("R")){
                    approvers = priceApprovalWebController.getApproversNp(priceid,CREATEDBY);
            }
		}
        if(appType.equals("AP6"))
	    {   
            if(statusType.equals("A") || statusType.equals("MA")){
            //sendMailto= ap6;
            status2	= priceApprovalWebController.updateStatusNp("CL",priceid);
            
            }else if(statusType.equals("H")||statusType.equals("R")){
            approvers = priceApprovalWebController.getApproversNp(priceid,CREATEDBY);
            }
		}
        
		}else{

		if(appType.equals("AP3"))
	    {   
            if(statusType.equals("A")|| statusType.equals("MA")){
            sendMailto= ap4;
            //sendMailto= ap5;--Commented by Niraj on 19th April 2018
                    approvers = priceApprovalWebController.getApproversNp(priceid,sendMailto);
            }else if(statusType.equals("H")||statusType.equals("R")){
            approvers = priceApprovalWebController.getApproversNp(priceid,CREATEDBY);
            }
		}
         if(appType.equals("AP4"))//--Commented by Niraj on 19th April 2018
	    {   
            if(statusType.equals("A")|| statusType.equals("MA")){
					//sendMailto= ap5;
                    //approvers = priceApprovalWebController.getApproversNp(priceid,sendMailto);
					status2	= priceApprovalWebController.updateStatusNp("CL",priceid);  //added by Shreedhar on 10-Jun-2023
            }else if(statusType.equals("H")||statusType.equals("R")){
            approvers = priceApprovalWebController.getApproversNp(priceid,CREATEDBY);
            }
		} 
        if(appType.equals("AP5"))
	    {   
            if(statusType.equals("A") || statusType.equals("MA")){
                     // sendMailto= ap6;
                    //approvers = priceApprovalWebController.getApproversNp(priceid,sendMailto);
            }else if(statusType.equals("H")||statusType.equals("R")){
                    approvers = priceApprovalWebController.getApproversNp(priceid,CREATEDBY);
            }
		}
        if(appType.equals("AP6"))
	    {   
            if(statusType.equals("A") || statusType.equals("MA")){
            //sendMailto= ap6;
            //status2	= priceApprovalWebController.updateStatusNp("CL",priceid);  --commented by Shreedhar on 10-JUN-2023
            
            }else if(statusType.equals("H")||statusType.equals("R")){
            approvers = priceApprovalWebController.getApproversNp(priceid,CREATEDBY);
            }
		}
		}
		
	//out.println("hi: "+statusType);
	if(statusType.equals("H")){

		//Approver = "AP11";
		//appStatus = APPROVER11_STATUS;
		status2	= priceApprovalWebController.updateStatusNp("URE",priceid);
		approvers = priceApprovalWebController.getApproversNp(priceid,CREATEDBY);
	}


	
	status	= priceApprovalWebController.changeAllTableStatusNp(priceid, appType, statusType);


//	System.out.println("status "+status);
	//System.out.println("appType "+appType);
	//System.out.println("approvers "+approvers);


    int len, lenCount, counter3 =0;
    String temp = "";

	    len = quantity.length();

		temp = "";
			
		lenCount = len-1;

		counter3 = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter3>3) && (counter3%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + quantity.charAt(lenCount);
				
				lenCount--;
				counter3++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				quantity = temp;
		}

    if(invoicePrice.contains("."))
        {
            String[] parts  = invoicePrice.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            invoicePrice = part1;

	    len = invoicePrice.length();

		temp = "";
			
		lenCount = len-1;

		counter3 = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter3>3) && (counter3%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + invoicePrice.charAt(lenCount);
				
				lenCount--;
				counter3++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				invoicePrice = temp;
		}
       invoicePrice +="."+parts[1];
       }else{
	    len = invoicePrice.length();

		temp = "";
			
		lenCount = len-1;

		counter3 = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter3>3) && (counter3%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + invoicePrice.charAt(lenCount);
				
				lenCount--;
				counter3++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				invoicePrice = temp;
		}
}

/*------*/
    if(aopDealValue.contains("."))
        {
            String[] parts  = aopDealValue.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            aopDealValue = part1;

	    len = aopDealValue.length();

		temp = "";
			
		lenCount = len-1;

		counter3 = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter3>3) && (counter3%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + aopDealValue.charAt(lenCount);
				
				lenCount--;
				counter3++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				aopDealValue = temp;
		}
       aopDealValue +="."+parts[1];
       }else{
	    len = aopDealValue.length();

		temp = "";
			
		lenCount = len-1;

		counter3 = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter3>3) && (counter3%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + aopDealValue.charAt(lenCount);
				
				lenCount--;
				counter3++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				aopDealValue = temp;
		}
}

/*------*/
    if(totalActualCost_spend.contains("."))
        {
            String[] parts  = totalActualCost_spend.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            totalActualCost_spend = part1;

	    len = totalActualCost_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter3 = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter3>3) && (counter3%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + totalActualCost_spend.charAt(lenCount);
				
				lenCount--;
				counter3++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				totalActualCost_spend = temp;
		}
       totalActualCost_spend +="."+parts[1];
       }else{
	    len = totalActualCost_spend.length();

		temp = "";
			
		lenCount = len-1;

		counter3 = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter3>3) && (counter3%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + totalActualCost_spend.charAt(lenCount);
				
				lenCount--;
				counter3++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				totalActualCost_spend = temp;
		}
}
/*------*/

String priceLable="";
if(origin.equals("domestic"))
{
    priceLable = "Price (&#8377; per MT)";
}else if(origin.equals("imported"))
{
    priceLable = "Price (in $ per MT)";
}		
	
     if (!(approvers.isEmpty())){

		apprv  = (String [])approvers.get(0);
	    //System.out.println("========="+apprv[0]);
		 if(statusType.equals("A") || statusType.equals("MA"))
		 {	       
                    content  =   " <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\"> " 
                        + " <tr><td class=\"normal\" colspan = \"3\" align = \"left\"><h6><font size='2'>Please log onto Timescape for reviewing / approving the below Newsprint Purchase Approval Note. Please select \"Purchase Approval – Newsprint\" from Related links on Purchase Approval Page accessible under Application Services on Timescape.</font></h6> </td> </tr><br><br>"; 
     
                    content  += " <tr><td  class=\"normal\" align = \"left\"> <b>Sanction number </b> </td><br>\n\n";
                    content  += " <td class=\"normal\"> : "+priceid+" </td></tr><br>\n\n";

                    content  += " <tr><td  class=\"normal\" align = \"left\"> <b>Vendor </b> </td><br>\n\n";
                    content  += " <td class=\"normal\"> : "+vendorName+" </td></tr><br>\n\n";

                    content  += " <tr><td class=\"normal\" align = \"left\"> <b>Mill</b>  </td><br>\n\n";
                    content  += " <td class=\"normal\"> : "+mill+" </td></tr><br>\n\n";

                    content  += " <tr><td class=\"normal\" align = \"left\"><b>Grade</b>  </td><br>\n\n";
                    content  += " <td class=\"normal\"> : "+quality+"&nbsp;"+gsm+" </td></tr><br>\n\n";

                    content  += " <tr><td class=\"normal\" align = \"left\"> <b>Quantity (in MT)</b>  </td><br>\n\n";
                    content  += " <td class=\"normal\"> : "+quantity+"</td></tr><br>\n\n";

                    content  += " <tr><td class=\"normal\" align = \"left\"> <b>"+priceLable+"</b>  </td><br>\n\n";
                    content  += " <td class=\"normal\"> : "+invoicePrice+"</td></tr><br>\n\n";

                    content  += " <tr><td  class=\"normal\" align = \"left\"> <b>Delivery in </b> </td><br>\n\n";
                    content  += " <td class=\"normal\"> : "+deliveryIn+"</td></tr><br>\n\n";

                    content  += " <tr><td class=\"normal\" align = \"left\"> <b>Budgeted value (&#8377; cr)</b>  </td><br>\n\n";
                    content  += " <td class=\"normal\"> : "+aopDealValue+"</td></tr><br>\n\n";

                    content  += " <tr><td class=\"normal\" align = \"left\"> <b>Actual value  (&#8377; cr)</b>  </td><br>\n\n";
                    content  += " <td class=\"normal\"> : "+totalActualCost_spend+"</td></tr><br>\n\n";

                   // content  += " <tr><td class=\"normal\" align = \"left\"> <b>Participants  :</b></td>\n\n <br><br>";

                    content  += " <tr class=\"normal\"><td  align = \"left\"> <b>Proposed by </b>  </td>\n\n <br>";
                    content  += " <td class=\"normal\"> : "+creatorEmailid+"</td></tr><br>\n\n";

                    //content  += " <tr><td class=\"normal\" align = \"left\"><b>Participants</b>   </td>\n\n <br>";
                    //content  += " <td class=\"normal\" colspan = \"2\"> : "+participants+"</td></tr><br>\n\n";

                if(appType.equals("AP1")){
                    //content += "<td class=\"normal\" align = \"left\"><b>PAR Note Approved by : B&C</b>  </td><br>";    
                    content  += " <tr><td class=\"normal\" align = \"left\"><b>This PAR has been approved by the following people</b>   </td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+participants1+"</td></tr><br>\n\n";

                }
                else if(appType.equals("AP2")){
                    content  += " <tr><td class=\"normal\" align = \"left\"><b>This PAR has been approved by the following people</b></td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+participants1+" "+participants2+"</td></tr><br>\n\n";
                }
               else if(appType.equals("AP3")){
                    content  += " <tr><td class=\"normal\" align = \"left\"><b>This PAR has been approved by the following people</b></td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+participants1+" "+participants2+" "+participants3+"</td></tr><br>\n\n";
                }
               else if(appType.equals("AP4")){
                    content  += " <tr><td class=\"normal\" align = \"left\"><b>This PAR has been approved by the following people</b>   </td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+participants1+" "+participants2+" "+participants3+" "+participants4+"</td></tr><br>\n\n";
                }
                else if(appType.equals("AP5")){
                    content  += " <tr><td class=\"normal\" align = \"left\"><b>This PAR has been approved by the following people</b>   </td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+participants1+","+participants2+","+participants3+","+participants4+","+participants5+"</td></tr><br>\n\n";
                }
                else if(appType.equals("AP6")){
                }

			content  += " <tr><td class=\"normal\" colspan = \"0\" align = \"left\"><b>Purchase Approval Link on Timescape </td>\n\n <br>";

            //content  += "<td class=\"normal\" colspan = \"2\"> : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://97ad218f174cb8f381cc20394841cc2b </td></tr><br>\n\n";
            content  += "<td class=\"normal\" colspan = \"2\"> : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://0a7ef33267e080180c22a67a7e74966d</td></tr><br>\n\n";
			//content  += " <tr><td class=\"normal\" colspan = \"2\" align = \"left\"> This mail is regarding Purchase Approval Request put on Timescape. \n\n\n\n \n\n </td></tr>";
            content  +=  " <tr><td class=\"normal\" align = \"left\"><br><br>Regards,<br> Timescape Admin </td></tr></table>";



    String	htmlStr ="<html>" + "\n" 
						+ "<head>" + "\n" 
						+ "	<title>TAM Leads</title>" + "\n" 
						+ "	<style>" + "\n" 
						+ "		.bold {FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
						+ "		.normal {FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
						+ "		.bluenormal {FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: #6097cf; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
						+ "		.rednormal {FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: #ff0000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
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


	   		mailStatus =  priceApprovalWebController.sendIndividualMailNp(apprv[0],htmlStr,priceid,creatorEmailid);    
			
			//mailStatus =  priceApprovalWebController.sendIndividualMailNp("sachin.mehta@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
		  }		
		else if(statusType.equals("H") )
		{

                    content1  =   " <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\"> " 
                        + " <tr><td class=\"normal\" colspan = \"3\" align = \"left\"><h6></h6> </td> </tr><br><br>"; 

                    content1  += " <tr><td  colspan = \"3\" class=\"normal\"  align = \"left\"> <b><font size='2'> This request needs to be <font color='red'>reviewed</font> by the Buyer.</font></b> </td><br>\n\n";

                    content1  += " <tr><td  width = \"25%\" class=\"normal\" align = \"left\"  valign = \"bottom\"><b>Sanction number </b> </td><br>\n\n";
                    content1  += " <td class=\"normal\"  valign = \"top\"> : "+priceid+" </td></tr><br>\n\n";

                    content1  += " <tr><td  class=\"normal\" align = \"left\" valign = \"bottom\"> <b>Reviewer </b> </td><br>\n\n";
                    content1  += " <td class=\"normal\"> : "+displayName+" </td></tr><br>\n\n";

                    content1  += " <tr><td  class=\"normal\" align = \"left\" valign = \"bottom\"> <b>Reviewers comments</b> </td><br>\n\n";
                    content1  += " <td class=\"normal\"> : "+reviewersComments+" </td></tr><br>\n\n";

                    content1  += " <tr><td  class=\"normal\" align = \"left\" valign = \"bottom\"> <b>Vendor </b> </td><br>\n\n";
                    content1  += " <td class=\"normal\"> : "+vendorName+" </td></tr><br>\n\n";

                    content1  += " <tr><td class=\"normal\" align = \"left\" valign = \"bottom\"> <b>Mill</b>  </td><br>\n\n";
                    content1  += " <td class=\"normal\"> : "+mill+" </td></tr><br>\n\n";

                    content1  += " <tr><td class=\"normal\" align = \"left\" valign = \"bottom\"><b>Grade</b>  </td><br>\n\n";
                    content1  += " <td class=\"normal\"> : "+quality+"&nbsp;"+gsm+" </td></tr><br>\n\n";

                    content1  += " <tr><td class=\"normal\" align = \"left\" valign = \"bottom\"> <b>Quantity (in MT)</b>  </td><br>\n\n";
                    content1  += " <td class=\"normal\"> : "+quantity+"</td></tr><br>\n\n";

                    content1  += " <tr><td class=\"normal\" align = \"left\" valign = \"bottom\"> <b>"+priceLable+"</b>  </td><br>\n\n";
                    content1  += " <td class=\"normal\"> : "+invoicePrice+"</td></tr><br>\n\n";

                    content1  += " <tr><td  class=\"normal\" align = \"left\" valign = \"bottom\"> <b>Delivery in </b> </td><br>\n\n";
                    content1  += " <td class=\"normal\"> : "+deliveryIn+"</td></tr><br>\n\n";

                    content1  += " <tr><td class=\"normal\" align = \"left\" valign = \"bottom\"> <b>Budgeted value (&#8377; cr)</b>  </td><br>\n\n";
                    content1  += " <td class=\"normal\"> : "+aopDealValue+"</td></tr><br>\n\n";

                    content1  += " <tr><td class=\"normal\" align = \"left\" valign = \"bottom\"> <b>Actual value  (&#8377; cr)</b>  </td><br>\n\n";
                    content1  += " <td class=\"normal\"> : "+totalActualCost_spend+"</td></tr><br>\n\n";

                    //content1  += " <tr><td class=\"normal\" align = \"left\"> <b>Participants  :</b></td>\n\n <br><br>";

                    content1  += " <tr class=\"normal\"><td  align = \"left\" valign = \"bottom\"> <b>Proposed by </b>  </td>\n\n <br>";
                    content1  += " <td class=\"normal\"> : "+creatorEmailid+"</td></tr><br>\n\n";

                    //content1  += " <tr><td class=\"normal\" align = \"left\"><b>Participants</b>   </td>\n\n <br>";
                    //content1  += " <td class=\"normal\" colspan = \"2\"> : "+participants+"</td></tr><br>\n\n";

                    content1  += " <tr><td class=\"normal\" colspan = \"0\" align = \"left\" valign = \"bottom\"><b>Purchase Approval Link on Timescape </td>\n\n <br>";

                    //content1  += "<td class=\"normal\" colspan = \"2\"> : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://97ad218f174cb8f381cc20394841cc2b  </td></tr><br>\n\n";
                    content1  += "<td class=\"normal\" colspan = \"2\"> : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://0a7ef33267e080180c22a67a7e74966d </td></tr><br>\n\n";
                    //content1  += " <tr><td class=\"normal\" colspan = \"2\" align = \"left\"> This mail is regarding Purchase Approval Request put on Timescape.\n\n\n\n \n\n </td></tr>";
                    content1  +=  " <tr><td class=\"normal\" align = \"left\" valign = \"bottom\"><br><br>Regards,<br> Timescape Admin </td></tr></table>";

String	htmlStr ="<html>" + "\n" 
						+ "<head>" + "\n" 
						+ "	<title>Newsprint</title>" + "\n" 
						+ "	<style>" + "\n" 
						+ "		.bold {FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
						+ "		.normal {FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
						+ "		.bluenormal {FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: #6097cf; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
						+ "		.rednormal {FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: #ff0000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
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
            if(appType.equals("AP1")){	
                            mailStatus =  priceApprovalWebController.sendIndividualMailNp(apprv[0],htmlStr,priceid,creatorEmailid);
							//mailStatus =  priceApprovalWebController.sendIndividualMailNp("sachin.mehta@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
            }else if(appType.equals("AP2")){	
                            mailStatus =  priceApprovalWebController.sendIndividualMailNp(apprv[0],htmlStr,priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp("sachin.mehta@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants1/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
            }else if(appType.equals("AP3")){	
                            mailStatus =  priceApprovalWebController.sendIndividualMailNp(apprv[0],htmlStr,priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp("sachin.mehta@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants1/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants2/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
            }else if(appType.equals("AP4")){	
                            mailStatus =  priceApprovalWebController.sendIndividualMailNp(apprv[0],htmlStr,priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp("sachin.mehta@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants1/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants2/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants3/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
            }else if(appType.equals("AP5")){	
                            mailStatus =  priceApprovalWebController.sendIndividualMailNp(apprv[0],htmlStr,priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp("sachin.mehta@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants1/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants2/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants3/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants4/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
            }else if(appType.equals("AP6")){	
                            mailStatus =  priceApprovalWebController.sendIndividualMailNp(apprv[0],htmlStr,priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp("sachin.mehta@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants1/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants2/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants3/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants4/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
                            //mailStatus =  priceApprovalWebController.sendIndividualMailNp(participants5/*apprv0[0]*/,htmlStr,	priceid,creatorEmailid);
            }
		}
	}
	

%>
<% if(status == true)
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
			<!-- <tr>
				<td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
				<td width="23%" rowspan="2">&nbsp;</td>
			</tr> -->
			<tr><td colspan="2" align="center"><span class="normal"><%
			//out.println("UUU____"+statusType);
			if(statusType.equals("A") || statusType.equals("MA") )
			{%>You have successfully approved the request.<%}else if(statusType.equals("H")){%> This Request is put on Hold for Review.<%}else{%>You have Rejected the request.<%}%></td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			 <tr><td colspan="2" align="center" class="normal">Click <a href="javascript:navigateCallRemarksNp('<%=timescapeUserOId%>','<%=priceid%>');" class="normal"><b>here</b></a> to check the status</td></tr> 
			</table>
<%
	    }
%>
</body>
</html>