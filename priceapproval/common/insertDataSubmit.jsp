<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%
	Hashtable priceData  = new Hashtable();
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
	String company			= "NA";
	int counter				= 0;

	String sanctionedRefType	= "NA";
	String refNumber			= "NA";
	String dateOfApproval		= "NA";

	
	counter = Integer.parseInt(counters);

	sanctionedRefType	= (String)request.getParameter("sanctionedRefType");
	refNumber			= (String)request.getParameter("refNumber");
	dateOfApproval		= (String)request.getParameter("dateOfApproval");
	
	 requestedBy		= (String)request.getParameter("requestedBy");
	 reason4			= (String)request.getParameter("reason4");
	 requestedBy7		= (String)request.getParameter("requestedBy7");
	 requestedBy8		= (String)request.getParameter("requestedBy8");
	 reason				= (String)request.getParameter("reason");
	 requestedBy9		= (String)request.getParameter("requestedBy9");
	 requestedBy10		= (String)request.getParameter("requestedBy10");
	 requestedBy2		= (String)request.getParameter("requestedBy2");
	 requestedBy3		= (String)request.getParameter("requestedBy3");
	 if((request.getParameter("requestedBy4"))!=null){
	 requestedBy4		= (String)request.getParameter("requestedBy4");}
	 validity			= (String)request.getParameter("validity");
	 requestedBy5		= (String)request.getParameter("requestedBy5");
	 fqtNumber			= (String)request.getParameter("fqtNumber");
	 requestedBy6		= (String)request.getParameter("requestedBy6");
	 req				= (String)request.getParameter("req");
	 reason1			= (String)request.getParameter("reason1");
	 reason2			= (String)request.getParameter("reason2");
	 reason3			= (String)request.getParameter("reason3");
	 reason44			= (String)request.getParameter("reason44");
	 reason5			= (String)request.getParameter("reason5");
	 reason6			= (String)request.getParameter("reason6");
	 reason7			= (String)request.getParameter("reason7");
	 reason8			= (String)request.getParameter("reason8");
	 reason9			= (String)request.getParameter("reason9");
	 reason10			= (String)request.getParameter("reason10");
	 attach1			= (String)request.getParameter("attach1New");
//out.println(attach1);
	 attach2			= (String)request.getParameter("attach2New");
	 attach3			= (String)request.getParameter("attach3New");
	 attach4			= (String)request.getParameter("attach4New");
	 attach5			= (String)request.getParameter("attach5New");
	 attach6			= (String)request.getParameter("attach6New");
	 attach7			= (String)request.getParameter("attach7New");
	 attach8			= (String)request.getParameter("attach8New");
	 attach9			= (String)request.getParameter("attach9New");
	 attach10			= (String)request.getParameter("attach10New");
	 reason14			= (String)request.getParameter("reason14");
	 reason15			= (String)request.getParameter("reason15");
	 reason16			= (String)request.getParameter("reason16");
	 fromDateAir1		= (String)request.getParameter("fromDateAir1");
	 fromDateAir2		= (String)request.getParameter("fromDateAir2");
	 fromDateAir3		= (String)request.getParameter("fromDateAir3");
	 fromDateAir4		= (String)request.getParameter("fromDateAir4");
	 fromDateAir8		= (String)request.getParameter("fromDateAir8");
	 fromDateAir9		= (String)request.getParameter("fromDateAir9");
	 recommendation		= (String)request.getParameter("recommendation");
	 compName1			= (String)request.getParameter("compName1");
	 compName2			= (String)request.getParameter("compName2");
	 compName3			= (String)request.getParameter("compName3");
	 UOM1				= (String)request.getParameter("UOM1");
	 UOM2				= (String)request.getParameter("UOM2");
	 UOM3				= (String)request.getParameter("UOM3");
	 rem1				= (String)request.getParameter("rem1");
	 rem2				= (String)request.getParameter("rem2");
	 rem3				= (String)request.getParameter("rem3");
	 sbd1				= (String)request.getParameter("sbd1");
	 sbd2				= (String)request.getParameter("sbd2");
	 category			= (String)request.getParameter("category");
	 company			= (String)request.getParameter("company");
	 app1				= (String)request.getParameter("app1H");
	
	 if(app1 == null){app1="0";}
		String app2Tid ="";
		String app5Tid ="";
		String app8Tid ="";
	 app2				= (String)request.getParameter("app2H");
	 if(app2.equals("0")){app2="0";}
        else{
        app2Tid = app2.substring(0,app2.indexOf("|"));
        app2=app2Tid;
        //out.println("app2="+app2);
        }
	 app4				= (String)request.getParameter("app4H");
	 if(app4.equals("0")){app4="0";}
	 app5				= (String)request.getParameter("app5H");
	 if(app5.equals("0")){app5="0";}
        else{
        app5Tid = app5.substring(0,app5.indexOf("|"));
        app5=app5Tid;
        //out.println("app5="+app5);
        }
	 app7				= (String)request.getParameter("app7H");
	 if(app7 == null){app7="0";}
	 app8				= (String)request.getParameter("app8H");
	 if(app8.equals("0")){app8="0";}
        else{
        app8Tid = app8.substring(0,app8.indexOf("|"));
        app8=app8Tid;
        //out.println("app8="+app8);
        }
 	 select12			= (String)request.getParameter("select12");
	 select13			= (String)request.getParameter("select13");
	 int negVal			= Integer.parseInt(request.getParameter("requestedBy7"));


	 if ((company.equals("1005") || company.equals("1006") ) && (!(category.equals("Group Company related buying") || category.equals("Projects") || category.equals("IT buying")) )){

		 app3				= (String)request.getParameter("app3");
		 if(app3 == null){app3="0";}
		 app6				= (String)request.getParameter("app6");
		  if(app6 == null){app6="0";}
		 app9				= "31243";
		  //if(app9 == null){app9="0";}
		 app10				= (String)request.getParameter("app10");
		  if(app10 == null){app10="0";}
		 select14			= (String)request.getParameter("select14");
		 select15			= (String)request.getParameter("select15");
		 select16			= (String)request.getParameter("select16");
		 		 if(select14 == null){select14="0";}
		 if(select15 == null){select15="0";}
		   if(select16 == null){select16="0";}

	} else if ((company.equals("1005") || company.equals("1006") ) && ((category.equals("Group Company related buying") || category.equals("Projects") || category.equals("IT buying")) )){

		 app3				= (String)request.getParameter("app3");
		 if(app3 == null){app3="0";}
		 app6				= (String)request.getParameter("app6");
		  if(app6 == null){app6="0";}
		 app9				= (String)request.getParameter("app9");
		  if(app9 == null){app9="0";}
		 app10				= (String)request.getParameter("app10");
		  if(app10 == null){app10="0";}
		 select14			= (String)request.getParameter("select14");
		 select15			= (String)request.getParameter("select15");
		 select16			= (String)request.getParameter("select16");
		 		 if(select14 == null){select14="0";}
		 if(select15 == null){select15="0";}
		   if(select16 == null){select16="0";}

	} else if ((company.equals("1501") )){

		 app3				= (String)request.getParameter("app3");
		 if(app3 == null){app3="0";}
		 app6				= (String)request.getParameter("app6");
		  if(app6 == null){app6="0";}
		 app9				= "31243";
		  //if(app9 == null){app9="0";}
		 app10				= (String)request.getParameter("app10");
		  if(app10 == null){app10="0";}
		 select14			= (String)request.getParameter("select14");
		 select15			= (String)request.getParameter("select15");
		 select16			= (String)request.getParameter("select16");
		 if(select14 == null){select14="0";}
		 if(select15 == null){select15="0";}
		   if(select16 == null){select16="0";}

	}else if ((company.equals("1042") )){

		 app3				= (String)request.getParameter("app3");
		 if(app3 == null){app3="0";}
		 app6				= (String)request.getParameter("app6");
		  if(app6 == null){app6="0";}
		 app9				= (String)request.getParameter("app9");
		  if(app9 == null){app9="0";}
		 app10				= (String)request.getParameter("app10");
		  if(app10 == null){app10="0";}
		 select14			= (String)request.getParameter("select14");
		 select15			= (String)request.getParameter("select15");
		 select16			= (String)request.getParameter("select16");
		 		 if(select14 == null){select14="0";}
		 if(select15 == null){select15="0";}
		   if(select16 == null){select16="0";}
		 
	}

	 //if(negVal>=2000000){
	
	if((negVal>=2000000)&& (!(company.equals("1005") || company.equals("1006") || company.equals("1501"))) ){
	 app3				= (String)request.getParameter("app3");
	  if(app3 == null){app3="0";}
	 app6				= (String)request.getParameter("app6");
	  if(app6 == null){app6="0";}
	 app9				= (String)request.getParameter("app9");
	  if(app9 == null){app9="0";}
	 app10				= (String)request.getParameter("app10");
	  if(app10 == null){app10="0";}
	 select14			= (String)request.getParameter("select14");
	 select15			= (String)request.getParameter("select15");
	 select16			= (String)request.getParameter("select16");
	 
	 }

	 app11				= (String)request.getParameter("app11H");
	  if(app11== null)
        {app11="0";}
	 app12				= (String)request.getParameter("app12H");
	  if(app12== null)
        {app12="0";}
		 select15			= (String)request.getParameter("select15");
	  if(select15 == null){select15="0";}
	 select16			= (String)request.getParameter("select16");
	  if(select16 == null){select16="0";}
	 
	 createdby			= Long.toString(timescapeUserOId);
	 createdon			= "NA";
	 modifiedby			= Long.toString(timescapeUserOId);
	 modifiedon			= "NA";
	 userstatus			= "UC";


	for(int i = 1; i <= counter; i++)
	{
		vendorData.put("v"+i,(String)Utility.replaceQuoteOracle(request.getParameter("v"+i)));
		vendorData.put("i"+i,(String)Utility.replaceQuoteOracle(request.getParameter("i"+i)));
		vendorData.put("f"+i,(String)Utility.replaceQuoteOracle(request.getParameter("f"+i)));
		vendorData.put("d"+i,(String)Utility.replaceQuoteOracle(request.getParameter("d"+i)));
		//vendorData.put("w"+i,(String)Utility.replaceQuoteOracle(request.getParameter("w"+i)));
		vendorData.put("pt"+i,(String)Utility.replaceQuoteOracle(request.getParameter("pt"+i)));
		vendorData.put("va"+i,(String)Utility.replaceQuoteOracle(request.getParameter("va"+i)));
	}

	vendorData.put("CREATEDBY",createdby);
	vendorData.put("CREATEDON","SYSDATE");
	vendorData.put("MODIFIEDBY",modifiedby);
	vendorData.put("MODIFIEDON","SYSDATE");
	vendorData.put("STATUS",userstatus);

	priceData.put("NEGOTIATION_PC_DATE",(String)Utility.replaceQuoteOracle(requestedBy));
	priceData.put("NEGOTIATION_PC_MEETING_VENUE",Utility.replaceQuoteOracle(reason4));
	priceData.put("NEGOTIATION_VALUE",Utility.replaceQuoteOracle(requestedBy7));
	priceData.put("FINALIZED_VENDOR_NAME",Utility.replaceQuoteOracle(requestedBy8));
	priceData.put("VALIDITY_PERIOD",Utility.replaceQuoteOracle(validity));
	priceData.put("PAYMENT_TERMS",Utility.replaceQuoteOracle(reason));
	priceData.put("SAVINGS",Utility.replaceQuoteOracle(requestedBy9));
	//Start 3/27/2014
	priceData.put("COST_AVOIDANCE",Utility.replaceQuoteOracle(requestedBy10));
	priceData.put("COMPANYNAME1",Utility.replaceQuoteOracle(compName1));
	priceData.put("COMPANYNAME2",Utility.replaceQuoteOracle(compName2));
	priceData.put("COMPANYNAME3",Utility.replaceQuoteOracle(compName3));
	priceData.put("UMO1",Utility.replaceQuoteOracle(UOM1));
	priceData.put("UMO2",Utility.replaceQuoteOracle(UOM2));
	priceData.put("UMO3",Utility.replaceQuoteOracle(UOM3));
	priceData.put("REMARKS1",Utility.replaceQuoteOracle(rem1));
	priceData.put("REMARKS2",Utility.replaceQuoteOracle(rem2));
	priceData.put("REMARKS3",Utility.replaceQuoteOracle(rem3));
	priceData.put("CATEGORY",Utility.replaceQuoteOracle(category));
	//End 3/27/2014
	priceData.put("PRODUCT_SERVICE_PROJECT_NAME",Utility.replaceQuoteOracle(requestedBy2));
	priceData.put("INDENTED_USER",Utility.replaceQuoteOracle(requestedBy3));
	
	priceData.put("PACKAGE_NAME_SANCTION",Utility.replaceQuoteOracle(requestedBy4));
	priceData.put("TOTAL_BUDGET",Utility.replaceQuoteOracle(requestedBy5));
	priceData.put("PO_COMMITTED_TILL_DATE",Utility.replaceQuoteOracle(fqtNumber));
	priceData.put("BALANCE_BUDGET",Utility.replaceQuoteOracle(requestedBy6));
	priceData.put("REQUIREMENT",Utility.replaceQuoteOracle(req));
	priceData.put("DESCRIPTION1",Utility.replaceQuoteOracle(reason1));
	priceData.put("DESCRIPTION2",Utility.replaceQuoteOracle(reason2));
	priceData.put("DESCRIPTION3",Utility.replaceQuoteOracle(reason3));
	priceData.put("DESCRIPTION4",Utility.replaceQuoteOracle(reason44));
	priceData.put("DESCRIPTION5",Utility.replaceQuoteOracle(reason5));
	priceData.put("DESCRIPTION6",Utility.replaceQuoteOracle(reason6));
	priceData.put("DESCRIPTION7",Utility.replaceQuoteOracle(reason7));
	priceData.put("DESCRIPTION8",Utility.replaceQuoteOracle(reason8));
	priceData.put("DESCRIPTION9",Utility.replaceQuoteOracle(reason9));
	priceData.put("DESCRIPTION10",Utility.replaceQuoteOracle(reason10));
	priceData.put("ATTACHMENT1",Utility.replaceQuoteOracle(attach1));
	priceData.put("ATTACHMENT2",Utility.replaceQuoteOracle(attach2));
	priceData.put("ATTACHMENT3",Utility.replaceQuoteOracle(attach3));
	priceData.put("ATTACHMENT4",Utility.replaceQuoteOracle(attach4));
	priceData.put("ATTACHMENT5",Utility.replaceQuoteOracle(attach5));
	priceData.put("ATTACHMENT6",Utility.replaceQuoteOracle(attach6));
	priceData.put("ATTACHMENT7",Utility.replaceQuoteOracle(attach7));
	priceData.put("ATTACHMENT8",Utility.replaceQuoteOracle(attach8));
	priceData.put("ATTACHMENT9",Utility.replaceQuoteOracle(attach9));
	priceData.put("ATTACHMENT10",Utility.replaceQuoteOracle(attach10));
	priceData.put("PRODUCT1",Utility.replaceQuoteOracle(reason14));
	priceData.put("PRODUCT2",Utility.replaceQuoteOracle(reason15));
	priceData.put("PRODUCT3",Utility.replaceQuoteOracle(reason16));
	priceData.put("RATE1",Utility.replaceQuoteOracle(fromDateAir1));
	priceData.put("RATE2",Utility.replaceQuoteOracle(fromDateAir2));
	priceData.put("RATE3",Utility.replaceQuoteOracle(fromDateAir3));
//	priceData.put("BENCHMARK1",Utility.replaceQuoteOracle(fromDateAir4));
//	priceData.put("BENCHMARK2",Utility.replaceQuoteOracle(fromDateAir8));
//	priceData.put("BENCHMARK3",Utility.replaceQuoteOracle(fromDateAir9));
	priceData.put("RECOMMENEDATION",Utility.replaceQuoteOracle(recommendation));
	priceData.put("SUPPORTEDBY_DIRECTOR1","0"/*Utility.replaceQuoteOracle(sbd1)*/);
	priceData.put("SUPPORTEDBY_DIRECTOR2","0"/*Utility.replaceQuoteOracle(sbd2)*/);
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
	//out.println("select15"+select15+"select16"+select16);
	priceData.put("CREATEDBY",createdby);
	priceData.put("CREATEDON","SYSDATE");
	priceData.put("MODIFIEDBY",modifiedby);
	priceData.put("MODIFIEDON","SYSDATE");
	priceData.put("STATUS",userstatus);
	priceData.put("COMPANY",company);

	priceData.put("SANCTIONEDREFTYPE",Utility.replaceQuoteOracle(sanctionedRefType));
	priceData.put("REFNUMBER",Utility.replaceQuoteOracle(refNumber));
	priceData.put("DATEOFAPPROVAL",Utility.replaceQuoteOracle(dateOfApproval));

	ArrayList priceCounterTable = priceApprovalWebController.getPriceCounter(category);

	//String categoryCode = priceCounterTable.get(0).toString();

  // Long priceCounterStr = ((Long)priceCounterTable.get(1)).longValue();

   
// Long priceCounterStr = priceCounterTable.get(1).longValue();

    //String  priceCounterStr="CPX";

	String[] data1      = (String [])priceCounterTable.get(0);

    String categoryCode=data1[0];


	String  priceIdCode=data1[1];

  //int negVal= Integer.parseInt(NEGOTIATION_VALUE);

   int priceIdNew= Integer.parseInt(priceIdCode);
  
   String priceCounter = categoryCode + priceIdNew ;

	//System.out.println("priceCounter:::::::::::::" +priceCounter);

    /*
  
    if(priceCounter == 0)
	{
		priceCounter = 100000;
	} 
	
	*/

	long vendorCounter = priceApprovalWebController.getVendorCounter();

	if(vendorCounter == 0)
	{
		vendorCounter = 100000;
	}
	
	long userTableCounter = priceApprovalWebController.getUserTableCounter();
	
	if(userTableCounter == 0)
	{
		userTableCounter = 100000;
	}

	status  = priceApprovalWebController.insertData(priceData, priceCounter);

//out.println("priceCounter"+priceCounter);
//out.println("priceData"+priceData);
//	priceCounter = priceCounter + 1;

	status1 = priceApprovalWebController.insertVendorData(vendorData, counter, priceCounter, vendorCounter);

//out.println("status : "+status+"status1"+status1);
//out.println("vendorData"+vendorData);
//out.println("counter"+counter);
//out.println("priceCounter"+priceCounter);
//out.println("vendorCounter"+vendorCounter);

	String priceCounter1 = priceCounter + "";
	
	userTable.put("TOID",createdby);
	userTable.put("PRICEID",priceCounter1);
	userTable.put("CREATEDBY",createdby);
	userTable.put("CREATEDON","SYSDATE");
	userTable.put("MODIFIEDBY",modifiedby);
	userTable.put("MODIFIEDON","SYSDATE");
	userTable.put("STATUS",userstatus);

	userTableCounter = userTableCounter + 1;

	status2  = priceApprovalWebController.insertUserTable(userTable, userTableCounter, categoryCode);
	
//out.println("priceCounter"+priceCounter);
//out.println("requestedBy2"+requestedBy2);
//out.println("requestedBy2"+requestedBy2);
//out.println("requestedBy7"+requestedBy7);
//out.println("Requirement"+req);

   
//  status3  = priceApprovalWebController.updatePriceId(categoryCode);



	if(status == true && status1 == true && status2 == true){
	ArrayList approver = new ArrayList();
	
		
		String apprv [] = null ;
		String content="" ;
		String content1="" ;
		boolean mailStatus = true;
		boolean mailStatus1 = true;
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




   /*     if(request.getParameter("app3")!=null){
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
        }*/
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

        String participants = participants1 + participants2 + participants3 + participants4 + participants5 + participants6 + participants7 + participants8 + participants9 + participants10;

		//out.println("participants...."+participants);
	
        String supportingFuctions = "";
               supportingFuctions = participants7 + participants8 + participants9 + participants10 + participants11 + participants12;
             /*if(supportingFuctions.equals("")){
                    supportingFuctions="NA";
             }*/
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
			content += "Purchase Approval Id : "+priceCounter+"\n\n <br>";
            content += "Item Description : "+requestedBy2+ "\n\n <br>";
            content += "Buyer : "+buyer+ "\n\n <br>";
            content += "User : "+requestedBy3+ "\n\n <br>";
            content += "PC meeting date : "+requestedBy+"\n\n <br><br>";
            content += "Participants : \n\n <br><br>";
			content += "Buyer : "+participants1+"   "+participants2+"   "+participants3+"\n\n <br>";
			content += "User :  "+participants4+"   "+participants5+"   "+participants6+" \n\n <br>";
			//content += "Supporting Functions :  "+participants7+"   "+participants8+"   "+participants9+"   "+participants10+"\n\n";
			content += "Supporting Functions :  "+supportingFuctions+"\n\n <br><br>";
			content += "Sanctioned Value (Rs) : "+requestedBy5+"\n\n <br>";			
			content += "Negotiated Value (Rs) : "+requestedBy7+ "\n\n <br>";
			content += "Scope : "+req+"\n\n <br>";
			content += "Recommended Vendor : "+requestedBy8+"\n\n <br>";			
			//content += "Purchase Approval Link on Timescape : https://10.100.36.198:8080/timescape/login/index.jsp \n\n <br><br>";					
			content += "Purchase Approval Link on Timescape : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://2d9ef3e47a3d0b2994d01580d128c340 \n\n <br><br>";
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
			
			String mailToCreater=createdby;
			ArrayList createrList = new ArrayList();
			createrList = priceApprovalWebController.getApprover(mailToCreater);
			String toCreater [] = (String [])createrList.get(0);			
			
			content1  = "The following Purchase Approval(PAR Note) request has been created.\n\n <br><br>";
			content1 += "Purchase Approval Id : "+priceCounter+"\n\n <br>";
            content1 += "Item Description : "+requestedBy2+ "\n\n <br>";
            content1 += "Buyer : "+buyer+ "\n\n <br>";
            content1 += "User : "+requestedBy3+ "\n\n <br>";
            content1 += "PC meeting date : "+requestedBy+"\n\n <br><br>";
            content1 += "Participants : \n\n <br><br>";
			content1 += "Buyer : "+participants1+"   "+participants2+"   "+participants3+"\n\n <br>";
			content1 += "User :  "+participants4+"   "+participants5+"   "+participants6+" \n\n <br>";			
			content1 += "Supporting Functions :  "+supportingFuctions+"\n\n <br><br>";
			content1 += "Sanctioned Value (Rs) : "+requestedBy5+"\n\n <br>";			
			content1 += "Negotiated Value (Rs) : "+requestedBy7+ "\n\n <br>";
			content1 += "Scope : "+req+"\n\n <br>";
			content1 += "Recommended Vendor : "+requestedBy8+"\n\n <br>";			
			content += "Regards,<br> Timescape admin";

			String	htmlStr1 = "<html>" + "\n" 
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
							mailStatus1 =  priceApprovalWebController.sendIndividualMail(toCreater[0],htmlStr1,priceCounter);	
			
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
<% 
if(status == true && status1 == true)
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
			<tr><td colspan="2" align="center" class="normal">Click <a href="../index.jsp" class="normal"><b>here</b></a> to check the status</td></tr>
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
			<tr><td colspan="2" align="center" class="normal">Click <a href="../index.jsp" class="normal"><b>here</b></a> to check the status</td></tr>
			</table>
<%}%>
</body>
</html>