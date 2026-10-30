<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%
	Hashtable priceData  = new Hashtable();
	Hashtable vendorData = new Hashtable();
	Hashtable commentsData = new Hashtable();
	Hashtable userTable	 = new Hashtable();

	boolean status			= false;
	boolean status1			= false;
	boolean status2			= false;
	boolean status3			= false;
	boolean parStatus			= false;

String origin			        = "NA";
String category			        = "NA";
String vendorName               = "NA";
String mill			            = "NA";
String paymentTerms		        = "NA";
String sourcing			        = "NA";
String quantity			        = "NA";
String deliveryIn		        = "NA";
String quality			        = "NA";
String gsm			            = "NA";
String thisLot			        = "NA";
String invoicePrice             = "NA";
String risi			            = "NA";
String aopreceiptprice          = "NA";
String aopreceiptforex          = "NA";
String aopdealvalue             = "NA";
String totalprice1              = "NA";
String totalprice2              = "NA";
String totalprice3		        = "NA";
String cusduty1			        = "NA";
String cusduty2			        = "NA";
String cusduty3			        = "NA";
String freight1			        = "NA";
String freight2			        = "NA";
String freight3			        = "NA";
String insurance1               = "NA";
String insurance2               = "NA";
String insurance3               = "NA";
String totalcost1               = "NA";
String totalcost2               = "NA";
String totalcost3		        = "NA";
String budact1			        = "NA";
/*String budact2			    = "NA";
String budact3			        = "NA";*/
String quainv1			        = "NA";
String quainv2			        = "NA";
String expectedreceipts1        = "NA";
String expectedreceipts2        = "NA";
String estimatedcons1           = "NA";
String estimatedcons2           = "NA";
String quarterend1			    = "NA";
String quarterend2			    = "NA";
/*String earliercontracted1     = "NA";
String earliercontracted2       = "NA";
String expcover1                = "NA";
String expcover2                = "NA";
String currentcontarct1         = "NA";
String currentcontarct2         = "NA";*/
String annualBudget             = "NA";
String contractedTons           = "NA";
String currentquarter           = "NA";
String balance			        = "NA";
String otherRemarks             = "NA";
String marketEvents             = "NA";
String app1                     = "NA";
String app2			            = "NA";
String app3 			        = "NA";
String app4			            = "NA";
String app5                     = "NA";
String app6			            = "NA";

//Added By Shreedhar for PAR Linking
//String txnid			        = "NA";
//String bcclvalue	            = "NA";
//End of Added By Shreedhar for PAR Linking

String sanctionedRefType	    = "NA";
String refNumber			    = "NA";
String dateOfApproval		    = "NA";
String folderName               ="";
String hiddenFileNameComp       ="";
String hiddenFileNameAdd        ="";

String hiddenDirSizeComp="";
String hiddenDirSizeAdd="";


	String createdby		= "NA";
	String createdon		= "NA";
	String modifiedby		= "NA";
	String modifiedon		= "NA";
	String userstatus		= "NA";
	
	//counter = Integer.parseInt(counters);

	sanctionedRefType	= (String)request.getParameter("sanctionedRefType");
	refNumber			= (String)request.getParameter("refNumber");
	dateOfApproval		= (String)request.getParameter("dateOfApproval");
	
origin                      = (String)request.getParameter("origin");
category                    = (String)request.getParameter("category");
vendorName                  = (String)request.getParameter("vendorName");
mill					    = (String)request.getParameter("mill");
paymentTerms                = (String)request.getParameter("paymentTerms");
sourcing                    = (String)request.getParameter("sourcing");
quantity                    = (String)request.getParameter("quantity");
deliveryIn                  = (String)request.getParameter("deliveryIn");
quality                     = (String)request.getParameter("quality");
gsm                         = (String)request.getParameter("gsm");
thisLot                     = (String)request.getParameter("thisLot");
invoicePrice                = (String)request.getParameter("invoicePrice");
risi                        = (String)request.getParameter("risi");
aopreceiptprice             = (String)request.getParameter("aopreceiptprice");
aopreceiptforex             = (String)request.getParameter("aopreceiptforex");
aopdealvalue                = (String)request.getParameter("aopdealvalue");
totalprice1                 = (String)request.getParameter("totalprice1");
totalprice2                 = (String)request.getParameter("totalprice2");
totalprice3                 = (String)request.getParameter("totalprice3");
cusduty1                    = (String)request.getParameter("cusduty1");
cusduty2                    = (String)request.getParameter("cusduty2");
cusduty3                    = (String)request.getParameter("cusduty3");
freight1                    = (String)request.getParameter("freight1");
freight2                    = (String)request.getParameter("freight2");
freight3                    = (String)request.getParameter("freight3");
insurance1                  = (String)request.getParameter("insurance1");
insurance2                  = (String)request.getParameter("insurance2");
insurance3                  = (String)request.getParameter("insurance3");
totalcost1                  = (String)request.getParameter("totalcost1");
totalcost2                  = (String)request.getParameter("totalcost2");
totalcost3                  = (String)request.getParameter("totalcost3");
budact1                     = (String)request.getParameter("budact1");
quainv1                     = (String)request.getParameter("quainv1");
quainv2                     = (String)request.getParameter("quainv2");
expectedreceipts1           = (String)request.getParameter("expectedreceipts1");
expectedreceipts2           = (String)request.getParameter("expectedreceipts2");
estimatedcons1              = (String)request.getParameter("estimatedcons1");
estimatedcons2              = (String)request.getParameter("estimatedcons2");
quarterend1                 = (String)request.getParameter("quarterend1");
quarterend2                 = (String)request.getParameter("quarterend2");
annualBudget                = (String)request.getParameter("annualBudget");
contractedTons              = (String)request.getParameter("contractedTons");
currentquarter              = (String)request.getParameter("currentquarter");
balance                     = (String)request.getParameter("balance");
otherRemarks                = (String)request.getParameter("otherRemarks");
marketEvents                = (String)request.getParameter("marketEvents");
app1                        = (String)request.getParameter("bussinessAndCommercial");
app2                        = (String)request.getParameter("director");
app3                        = (String)request.getParameter("epSupplyChain");
app4                        = (String)request.getParameter("coo");
app5                        = (String)request.getParameter("ceo");
app6				        = (String)request.getParameter("md");



//End Of Added By Shreedhar for PAR Linking

//System.out.println("txnid--"+txnid);
//System.out.println("bcclvalue--"+bcclvalue);

folderName="compulsory"+","+"additional";


	 createdby			= Long.toString(timescapeUserOId);
	 createdon			= "NA";
	 modifiedby			= Long.toString(timescapeUserOId);
	 modifiedon			= "NA";
	 userstatus			= "UC";

	priceData.put("ORIGIN",Utility.replaceQuoteOracle(origin));
	priceData.put("CATEGORY",Utility.replaceQuoteOracle(category));
	priceData.put("CREATOROID",Utility.replaceQuoteOracle(createdby));
	priceData.put("VENDORNAME",Utility.replaceQuoteOracle(vendorName));
	priceData.put("MILL",Utility.replaceQuoteOracle(mill));
	priceData.put("PAYMENTTERMS",Utility.replaceQuoteOracle(paymentTerms));
	priceData.put("SOURCING",Utility.replaceQuoteOracle(sourcing));
	priceData.put("QUANTITY",Utility.replaceQuoteOracle(quantity));
	priceData.put("DELIVERYIN",Utility.replaceQuoteOracle(deliveryIn));

	priceData.put("QUALITY",Utility.replaceQuoteOracle(quality));
	priceData.put("GSM",Utility.replaceQuoteOracle(gsm));
	priceData.put("THISLOT",Utility.replaceQuoteOracle(thisLot));
	priceData.put("INVOICEPRICE",Utility.replaceQuoteOracle(invoicePrice));
	priceData.put("RISI",Utility.replaceQuoteOracle(risi));
	priceData.put("AOPRECEIPTPRICE",Utility.replaceQuoteOracle(aopreceiptprice));
	priceData.put("AOPRECEIPTFOREX",Utility.replaceQuoteOracle(aopreceiptforex));
	priceData.put("AOPDEALVALUE",Utility.replaceQuoteOracle(aopdealvalue));
	priceData.put("TOTALPRICE1",Utility.replaceQuoteOracle(totalprice1));
	priceData.put("TOTALPRICE2",Utility.replaceQuoteOracle(totalprice2));
	priceData.put("TOTALPRICE3",Utility.replaceQuoteOracle(totalprice3));
	priceData.put("CUSDUTY1",Utility.replaceQuoteOracle(cusduty1));

	priceData.put("CUSDUTY2",Utility.replaceQuoteOracle(cusduty2));
	priceData.put("CUSDUTY3",Utility.replaceQuoteOracle(cusduty3));
	
	priceData.put("FREIGHT1",Utility.replaceQuoteOracle(freight1));
	priceData.put("FREIGHT2",Utility.replaceQuoteOracle(freight2));
	priceData.put("FREIGHT3",Utility.replaceQuoteOracle(freight3));
	priceData.put("INSURANCE1",Utility.replaceQuoteOracle(insurance1));
	priceData.put("INSURANCE2",Utility.replaceQuoteOracle(insurance2));
	priceData.put("INSURANCE3",Utility.replaceQuoteOracle(insurance3));
	priceData.put("TOTALCOST1",Utility.replaceQuoteOracle(totalcost1));
	priceData.put("TOTALCOST2",Utility.replaceQuoteOracle(totalcost2));
	priceData.put("TOTALCOST3",Utility.replaceQuoteOracle(totalcost3));
	priceData.put("BUDACT1",Utility.replaceQuoteOracle(budact1));
	priceData.put("QUAINV1",Utility.replaceQuoteOracle(quainv1));
	priceData.put("QUAINV2",Utility.replaceQuoteOracle(quainv2));
	priceData.put("EXPECTEDRECEIPTS1",Utility.replaceQuoteOracle(expectedreceipts1));
	priceData.put("EXPECTEDRECEIPTS2",Utility.replaceQuoteOracle(expectedreceipts2));
	priceData.put("ESTIMATEDCONS1",Utility.replaceQuoteOracle(estimatedcons1));
	priceData.put("ESTIMATEDCONS2",Utility.replaceQuoteOracle(estimatedcons2));

	priceData.put("QUARTEREND1",Utility.replaceQuoteOracle(quarterend1));
	priceData.put("QUARTEREND2",Utility.replaceQuoteOracle(quarterend2));
	priceData.put("ANNUALBUDGET",Utility.replaceQuoteOracle(annualBudget));
	priceData.put("CONTRACTEDTONS",Utility.replaceQuoteOracle(contractedTons));
	priceData.put("CURRENTQUARTER",Utility.replaceQuoteOracle(currentquarter));
	priceData.put("BALANCE",Utility.replaceQuoteOracle(balance));
	priceData.put("OTHERREMARKS",Utility.replaceQuoteOracle(otherRemarks));
	priceData.put("MARKETEVENTS",Utility.replaceQuoteOracle(marketEvents));
	priceData.put("BUSSINESSANDCOMMERCIAL",app1);
	priceData.put("DIRECTOR",app2);
    priceData.put("EPSUPPLYCHAIN",app3);
    priceData.put("COO",app4);
	priceData.put("CEO",app5);
	priceData.put("MD",app6);
	priceData.put("CREATEDBY",createdby);
	priceData.put("CREATEDON","SYSDATE");
	priceData.put("MODIFIEDBY",modifiedby);
	priceData.put("MODIFIEDON","SYSDATE");
	priceData.put("STATUS",Utility.replaceQuoteOracle(userstatus));

	priceData.put("SANCTIONEDREFTYPE",Utility.replaceQuoteOracle(sanctionedRefType));
	priceData.put("REFNUMBER",Utility.replaceQuoteOracle(refNumber));
	priceData.put("DATEOFAPPROVAL",Utility.replaceQuoteOracle(dateOfApproval));

	priceData.put("attachmentFolderName",Utility.replaceQuoteOracle(folderName));
	priceData.put("CREATEDBYEMAIL",Utility.replaceQuoteOracle(emailId));



	ArrayList priceCounterTable = priceApprovalWebController.getPriceCounter(category);

	String[] data1      = (String [])priceCounterTable.get(0);

    String categoryCode=data1[0];


	String  priceIdCode=data1[1];

   int priceIdNew= Integer.parseInt(priceIdCode);
  
   String priceCounter = categoryCode + priceIdNew ;
//System.out.println("priceCounter----"+priceCounter);

//Added By Shreedhar for PAR Linking
//Hashtable feedback = new Hashtable();
//int bcclsize = Integer.parseInt((String)request.getParameter("size"));
//for(int hh=0;hh<bcclsize;hh++){
//txnid					= (String) request.getParameter("txnid"+hh);
//bcclvalue			    = (String)request.getParameter("bcclvalue"+hh);
//String valueArr[] = {txnid,bcclvalue,priceCounter};
//feedback.put(hh+"",valueArr);
//feedback.put(bcclsize+"", bcclsize);
//}

	long vendorCounter = priceApprovalWebController.getVendorCountNp();


	if(vendorCounter == 0)
	{
		vendorCounter = 100000;
	}


	long commentCounter = priceApprovalWebController.getCommentsCountNp();


	if(commentCounter == 0)
	{
		commentCounter = 200000;
	}


	String counters			= (String)request.getParameter("count");
	String counters1		= (String)request.getParameter("count2");
    int counter				= 0;
    int counter1			= 0;
	 
        counter             = Integer.parseInt(counters);
        counter1            = Integer.parseInt(counters1);

	for(int i = 1; i <= counter; i++)
	{
		vendorData.put("v"+i,(String)Utility.replaceQuoteOracle(request.getParameter("v"+i)));
		vendorData.put("c"+i,(String)Utility.replaceQuoteOracle(request.getParameter("c"+i)));
		vendorData.put("m"+i,(String)Utility.replaceQuoteOracle(request.getParameter("m"+i)));
		vendorData.put("g"+i,(String)Utility.replaceQuoteOracle(request.getParameter("g"+i)));
		vendorData.put("a"+i,(String)Utility.replaceQuoteOracle(request.getParameter("a"+i)));
		vendorData.put("oq"+i,(String)Utility.replaceQuoteOracle(request.getParameter("oq"+i)));
		vendorData.put("op"+i,(String)Utility.replaceQuoteOracle(request.getParameter("op"+i)));
		vendorData.put("fq"+i,(String)Utility.replaceQuoteOracle(request.getParameter("fq"+i)));
		vendorData.put("fp"+i,(String)Utility.replaceQuoteOracle(request.getParameter("fp"+i)));
	}

	vendorData.put("CREATEDBY",createdby);
	vendorData.put("CREATEDON","SYSDATE");
	vendorData.put("MODIFIEDBY",modifiedby);
	vendorData.put("MODIFIEDON","SYSDATE");
	vendorData.put("STATUS",userstatus);

    for(int j = 1; j <= counter1; j++)
	{
		commentsData.put("vn"+j,(String)Utility.replaceQuoteOracle(request.getParameter("vn"+j)));
		commentsData.put("co"+j,(String)Utility.replaceQuoteOracle(request.getParameter("co"+j)));
		commentsData.put("mill"+j,(String)Utility.replaceQuoteOracle(request.getParameter("mill"+j)));
		commentsData.put("gr"+j,(String)Utility.replaceQuoteOracle(request.getParameter("gr"+j)));
		commentsData.put("qscr"+j,(String)Utility.replaceQuoteOracle(request.getParameter("qscr"+j)));
		commentsData.put("rem"+j,(String)Utility.replaceQuoteOracle(request.getParameter("rem"+j)));
	}

	commentsData.put("CREATEDBY",createdby);
	commentsData.put("CREATEDON","SYSDATE");
	commentsData.put("MODIFIEDBY",modifiedby);
	commentsData.put("MODIFIEDON","SYSDATE");
	commentsData.put("STATUS",userstatus);

String  hiddDirectorySizecompulsory ="";
String hiddDirectorySizeadditional  ="";

	String attachmentSize			= (String)request.getParameter(hiddDirectorySizecompulsory);
	String addAttachmentSize		= (String)request.getParameter(hiddDirectorySizeadditional);


	String attachName				= "";
	String addAttachName			= "";

	//(compulsaryAttachmentSize == "null") ||
	if(attachmentSize == null)
	{
		attachName="";
		//System.out.println("compulsaryAttachName--"+compulsaryAttachName);
	}else
	{
		int comp_Size							= 0;

		comp_Size								= Integer.parseInt(attachmentSize);

		for(int ii=0; ii < comp_Size; ii++) 
		{
		String attachName1		= (String)request.getParameter(hiddenFileNameComp+ii);
		attachName				= attachName1+","+attachName;

		}

		if (attachName.endsWith(",")) 
		{
			attachName = attachName.substring(0, attachName.length() - 1);
		}
	}


	if(addAttachmentSize == null)
	{
		addAttachName="";
		//System.out.println("compulsaryAttachName--"+compulsaryAttachName);
	}else
	{
		int add_Size							= 0;

		add_Size								= Integer.parseInt(addAttachmentSize);

		for(int jj=0; jj < add_Size; jj++)
		{
		String attachName2		= (String)request.getParameter(hiddenFileNameAdd+jj);
		addAttachName			= attachName2+","+addAttachName;

		}

		if (addAttachName.endsWith(",")) 
		{
			addAttachName = addAttachName.substring(0, addAttachName.length() - 1);
		}
	}

	priceData.put("attachName",Utility.replaceQuoteOracle(attachName));
	priceData.put("addAttachName",Utility.replaceQuoteOracle(addAttachName));



	status  = priceApprovalWebController.createRequestNp(priceData, priceCounter,categoryCode);

	//Added By Shreedhar for PAR Linking
	//parStatus  = priceApprovalWebController.submitBcclValues(txnid, bcclvalue);
	//parStatus  = priceApprovalWebController.submitBcclValues(feedback);
	//End of Added By Shreedhar for PAR Linking

    if(status == true )
	    {
	    status1 = priceApprovalWebController.insertVendorDataNp(vendorData, counter, priceCounter, vendorCounter);
        }

    if(status1 == true )
	    {
	    status2 = priceApprovalWebController.insertCommentDataNp(commentsData,counter1, priceCounter, commentCounter);
        }

	if(status == true && status1 == true && status2 == true){

        String participants1 = "";
        String participants2= "";
        String participants3 = "";
        String participants4 = "";
        String participants5 = "";
        String participants6 = "";


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
        participants2= emailList[0] + ", ";
      }else{
            participants2="NA"+" , ";
          }

        reciverEmail.put("CREATEDBY", app3);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants3= emailList[0] + ", ";
      }else{
            participants3="NA"+" , ";
          }

        reciverEmail.put("CREATEDBY", app4);
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

        reciverEmail.put("CREATEDBY", app6);
    listOfreciverEmailId = priceApprovalWebController.listOfreciverEmail(reciverEmail);
     if(listOfreciverEmailId.size()>0)
	{
        emailList   = (String[])listOfreciverEmailId.get(0);
        participants6= emailList[0];
      }else{
            participants6="NA";
          }

        String participants = participants1 + participants2 + participants3 + participants4 + participants5 + participants6 ;


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
    if(aopdealvalue.contains("."))
        {
            String[] parts  = aopdealvalue.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            aopdealvalue = part1;

	    len = aopdealvalue.length();

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
				
				temp = temp + aopdealvalue.charAt(lenCount);
				
				lenCount--;
				counter3++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				aopdealvalue = temp;
		}
       aopdealvalue +="."+parts[1];
       }else{
	    len = aopdealvalue.length();

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
				
				temp = temp + aopdealvalue.charAt(lenCount);
				
				lenCount--;
				counter3++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				aopdealvalue = temp;
		}
}

/*------*/
    if(totalcost3.contains("."))
        {
            String[] parts  = totalcost3.split("\\.");
            String part1    = parts[0];
            //String part2    = parts[1];
            totalcost3 = part1;

	    len = totalcost3.length();

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
				
				temp = temp + totalcost3.charAt(lenCount);
				
				lenCount--;
				counter3++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				totalcost3 = temp;
		}
       totalcost3 +="."+parts[1];
       }else{
	    len = totalcost3.length();

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
				
				temp = temp + totalcost3.charAt(lenCount);
				
				lenCount--;
				counter3++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				totalcost3 = temp;
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

		ArrayList approver = new ArrayList();
	
		String apprv1 [] = null ;
		String apprv [] = null ;
		String content="" ;
		String content1="";

		boolean mailStatus = true;

            approver = priceApprovalWebController.getApprover(app1);
			apprv  = (String [])approver.get(0);
            content  =   " <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\"> " 
                        + " <tr><td class=\"normal\" colspan = \"3\" align = \"left\"><h6><font size='2'>Please log onto Timescape for reviewing / approving the below Newsprint Purchase Approval Note. Please select \"Purchase Approval – Newsprint\" from Related links on Purchase Approval Page accessible under Application Services on Timescape.</font></h6> </td> </tr><br><br>"; 

            content  += " <tr><td  class=\"normal\" align = \"left\"> <b>Sanction number </b> </td><br>\n\n";
            content  += " <td class=\"normal\"> : "+priceCounter+" </td></tr><br>\n\n";

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
            content  += " <td class=\"normal\"> : "+aopdealvalue+"</td></tr><br>\n\n";

            content  += " <tr><td class=\"normal\" align = \"left\"> <b>Actual value  (&#8377; cr)</b>  </td><br>\n\n";
            content  += " <td class=\"normal\"> : "+totalcost3+"</td></tr><br>\n\n";

           // content  += " <tr><td class=\"normal\" align = \"left\"> <b>Participants  :</b></td>\n\n <br><br>";

            content  += " <tr class=\"normal\"><td  align = \"left\"> <b>Proposed by </b>  </td>\n\n <br>";
            content  += " <td class=\"normal\"> : "+emailId+"</td></tr><br>\n\n";

          //  content  += " <tr><td class=\"normal\" align = \"left\"><b>Participants</b>   </td>\n\n <br>";
           // content  += " <td class=\"normal\" colspan = \"2\"> : "+participants+"</td></tr><br>\n\n";

			content  += " <tr><td class=\"normal\" colspan = \"0\" align = \"left\"><b>Price Approval Link on Timescape </td>\n\n <br>";

            //content  += "<td class=\"normal\" colspan = \"2\"> : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://97ad218f174cb8f381cc20394841cc2b </td></tr><br>\n\n";
            content  += "<td class=\"normal\" colspan = \"2\"> : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://0a7ef33267e080180c22a67a7e74966d </td></tr><br>\n\n";
			//content  += " <tr><td class=\"normal\" colspan = \"2\" align = \"left\"> This mail is regarding Price Approval Request put on Timescape. \n\n\n\n \n\n </td></tr>";
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
	   		mailStatus =  priceApprovalWebController.sendIndividualMailNp(apprv[0],htmlStr,priceCounter,emailId);
            //mailStatus =  priceApprovalWebController.sendIndividualMailNp("sachin.mehta@timesgroup.com",htmlStr,priceCounter,emailId);

}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PRICE APPROVAL - SUBMIT DATA</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<script Language="JavaScript" src="../jscripts/newsprint.js"></script>
</head>
<body>


<%	//System.out.println("status"+status);
	//System.out.println("status1"+status1);
	//System.out.println("status2"+status2);
if(status == true && status1 == true && status2 == true)
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
			<tr><td colspan="2" align="center" class="normal">Click <a href="../indexnp.jsp" class="normal"><b>here</b></a> to check the status</td></tr>
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
			<tr><td colspan="2" align="center" class="normal">Click <a href="../indexnp.jsp" class="normal"><b>here</b></a> to check the status</td></tr>
			</table>
<%}%>
</body>
</html>
