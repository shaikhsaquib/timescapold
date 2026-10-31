
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Utility" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="wasteSalesChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

 <!DOCTYPE >
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Submit Disposal Waste Aprroval</title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="../css/style_1.css" rel="stylesheet"/>
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-multiselect.css" rel="stylesheet">
	<link href="../css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
	
	<style>
		.select2-container .select2-selection--single 
		{
			box-sizing: border-box;
			cursor: pointer;
			display: block;
			height: 34px;		
		}
		.fa.fa-sig:after {
  position: absolute;
  content: "/";
  color: GREY;
  font-weight: 700;
  font-size: 1.2em;
  left: 7px;
  top: -1px;
  padding:0;
  margin:0;
}
	</style>	
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/bootstrap-multiselect.js"></script>	
	<script src="../js/wysihtml5-0.3.0.min.js"></script>
	<script src="../js/bootstrap3-wysihtml5.js"></script>	
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/additional-methods.min.js"></script>	
	<script src="../js/util.js" type="text/javascript"></script>
	<script src="../js/common.js" type="text/javascript"></script>
	<script src="../jscript/wasteSalesDisposal.js"></script>	

	<script>
	$(document).ready(function(){
		
	// $(document).ready(function(){:
	$('.RelatedLinks ul li.RelLinks').hover(function() {
	$(this).find('.dropdownmenu').show();
	}, function(){
	$(this).find('.dropdownmenu').hide();
	});

	//Custom Pop up Start here
	/* $('.CustomPopup').fancybox({  
			maxWidth    : 800,
			maxHeight   : 325,
			width		: 800,
			height	    : 450,
			autoSize    : false,
			fitToView   : false,
			'type' : 'iframe'
	});
 
 */
	});
  </script>

</head>
<%
//	String detailSection2 [ ]				=  {"srNo","description","quantity","UOM","finalNegotiatedAmt","finalHighestBidder","comments"};

	String action							= (String)request.getParameter("frmStatus");


	String disposalType						= (String)request.getParameter("disposalType");
	disposalType							= Utility.replaceQuoteOracle(disposalType);

	String iboHead = (String)EnvironmentProperties.getValue("wastesalesapprovals", "IBO_HEAD");
	String fdHead = (String)EnvironmentProperties.getValue("wastesalesapprovals", "FUNCT_DIR");
	String exepHead = (String)EnvironmentProperties.getValue("wastesalesapprovals", "EXE_PRES");
	String masdHead = (String)EnvironmentProperties.getValue("wastesalesapprovals", "MAS_DIR");

	String documentOId="";
	String applName = "";
	String documnetOID = "";

	String hiddenDirSizeComp="";
	String hiddenDirSizeAdd="";

	String hiddenFileNameComp="";
	String hiddenFileNameAdd="";

	String folderName="";

	if("Fixed Asset Disposal".equals(disposalType))
	{
		applName = "Fixed Asset Disposal";
		documnetOID = "DOC1002";

		hiddenDirSizeComp = "hiddDirectorySizefixedassetcompulsory";  
		hiddenDirSizeAdd = "hiddDirectorySizefixedassetadditional";

		hiddenFileNameComp="hiddFilesName1fixedassetcompulsory";
		hiddenFileNameAdd="hiddFilesName1fixedassetadditional";

		folderName="fixedassetcompulsory"+","+"fixedassetadditional";

	}else if("One-off Miscellaneous".equals(disposalType))
	{
		applName = "One-off Miscellaneous";
		documnetOID = "DOC1003"; 

		hiddenDirSizeComp = "hiddDirectorySizeoneoffcompulsory";  
		hiddenDirSizeAdd = "hiddDirectorySizeoneoffadditional";

		hiddenFileNameComp="hiddFilesName1oneoffcompulsory";
		hiddenFileNameAdd="hiddFilesName1oneoffadditional";

		folderName="oneoffcompulsory"+","+"oneoffadditional";

	}else if("Damaged Newsprint Disposal".equals(disposalType))
	{

		applName = "Damaged Newsprint Disposal";
		documnetOID = "DOC1004";

		hiddenDirSizeComp = "hiddDirectorySizedamagedcompulsory";  
		hiddenDirSizeAdd = "hiddDirectorySizedamagedadditional";

		hiddenFileNameComp="hiddFilesName1damagedcompulsory";
		hiddenFileNameAdd="hiddFilesName1damagedadditional";

		folderName="damagedcompulsory"+","+"damagedadditional";
	}
	String actionStr = "";
	String locationCode1="";
	String locationName1=""; 
	String dispProposedByOId				= "0";

	String dispProposedBySapNum				= "0";

	String dispProposedBySapNum1			= "0";

	String dispProposedByEmailid			= "0";

	
	String dispApprovedByOId				= "0";

	String dispApprovedBySapNum				= "0";

	String dispApprovedBySapNum1			= "0";

	String dispApprovedByEmailid			= "0";

	String disposalName						= (String)request.getParameter("disposalName");
	disposalName							= Utility.replaceQuoteOracle(disposalName);

	String location1						= (String)request.getParameter("location1");
	location1								= Utility.replaceQuoteOracle(location1);

	String createdDate						= (String)request.getParameter("createdDate");
	createdDate								= Utility.replaceQuoteOracle(createdDate);

	String dispProposedBy					= (String)request.getParameter("dispProposedBy");
	dispProposedBy							= Utility.replaceQuoteOracle(dispProposedBy);

	String dispApprovedBy					= (String)request.getParameter("dispApprovedBy");
	dispApprovedBy							= Utility.replaceQuoteOracle(dispApprovedBy);


	if("I".equals(action))
	{
		actionStr = "In - Process";
		locationName1					= location1;
		dispProposedByEmailid = dispProposedBy;
		dispApprovedByEmailid = dispApprovedBy;


	}else if("D".equals(action))
	{
		actionStr = "Draft";
		dispProposedByEmailid = dispProposedBy;
		dispApprovedByEmailid = dispApprovedBy;
			locationName1 = location1;
		}


	String totalVOMValue = (String)request.getParameter("totalVOMValue");
	totalVOMValue = Utility.replaceQuoteOracle(totalVOMValue);

	String totalValue = (String)request.getParameter("totalValue");
	totalValue = Utility.replaceQuoteOracle(totalValue);

	double totalValueInt = Double.parseDouble(totalValue);
	double totalVOMValueInt = Double.parseDouble(totalVOMValue);
	//out.println("totalValueInt---"+totalValueInt);
	
	String vatNtds = (String)request.getParameter("vatNtds");
	vatNtds	= Utility.replaceQuoteOracle(vatNtds);

	String tabSize	= (String)request.getParameter("tabSize");

	int tabSize1 = Integer.parseInt(tabSize);	

	int counter = 0;

	Hashtable processWasteDetailsHash = new Hashtable();
	Hashtable approvalDetailsHash = new Hashtable();
	

	String description="";
	String quantities="";
	String uoms="";
	String valueOfMaterials1="";
	String finalNegotiatedAmt1="";
	String finalHighestBidder1="";
	String comments1="";
	
	for(int ii=0; ii < tabSize1; ii++){

			String desc1				= (String)request.getParameter("desc"+ii);
			String quantity="";
			String uom="";
			String valueOfMaterials="";
			String finalNegotiatedAmt="";
			String finalHighestBidder="";			
			String comments="";

			if(desc1!=null && !( desc1.trim().equals("") || desc1.equals("0") ) )
			{
				counter++;
				/*String srnoHeader = "srnoHeader";
				String desc1Header = "desc1Header";
				String quantityHeader = "quantityHeader";
				String UOMHeader = "UOMHeader";
				String valOfMatHeader = "valOfMatHeader";
				String finalNegAmtHeader = "finalNegAmtHeader";
				String finalHighBidHeader = "finalHighBidHeader";
				String commentsHeader = "commentsHeader";*/
				desc1					= Utility.replaceQuoteOracle(desc1);
				description = description+desc1+";";

				 quantity				= (String)request.getParameter("quantity"+ii);
				 quantity				= Utility.replaceQuoteOracle(quantity);
				 quantities = quantities+quantity+";";

				 uom					= (String)request.getParameter("uom"+ii);
				 uom					= Utility.replaceQuoteOracle(uom);
				 uoms = uoms+uom+";";

				 valueOfMaterials		= (String)request.getParameter("valueOfMaterials"+ii);
				 valueOfMaterials		= Utility.replaceQuoteOracle(valueOfMaterials);

				 valueOfMaterials1 = valueOfMaterials1+valueOfMaterials+";";

				 finalNegotiatedAmt	= (String)request.getParameter("finalNegotiatedAmt"+ii);
				 finalNegotiatedAmt		= Utility.replaceQuoteOracle(finalNegotiatedAmt);
				 finalNegotiatedAmt1 = finalNegotiatedAmt1+finalNegotiatedAmt+";";

				 finalHighestBidder	= (String)request.getParameter("finalHighestBidder"+ii);
				 finalHighestBidder		= Utility.replaceQuoteOracle(finalHighestBidder);
				 finalHighestBidder1 = finalHighestBidder1+finalHighestBidder+";";

				 comments				= (String)request.getParameter("comments"+ii);
				 comments		= Utility.replaceQuoteOracle(comments);
				 comments1 = comments1+comments+";";

				/*srnoHeader			= srnoHeader+ii+"";
				desc1Header			= desc1Header+ii;
				quantityHeader		= quantityHeader+ii;
				UOMHeader			= UOMHeader+ii;
				valOfMatHeader		= valOfMatHeader+ii;
				finalNegAmtHeader	= finalNegAmtHeader+ii;
				finalHighBidHeader	= finalHighBidHeader+ii;
				commentsHeader		= commentsHeader+ii;

				hashDetails = hashDetails+(ii+1);
				hashDetailsVal = hashDetailsVal+(ii+1);

				String detailSection2 [ ]	= {srnoHeader,desc1Header,quantityHeader,UOMHeader,valOfMatHeader,finalNegAmtHeader,finalHighBidHeader,commentsHeader};

				String detailSectionVal2 [ ]	=  {ii+"",desc1,quantity,uom,valueOfMaterials,finalNegotiatedAmt,finalHighestBidder,comments};

				processWasteDetailsHash.put(hashDetails, detailSection2);
				processWasteDetailsHash.put(hashDetailsVal, detailSectionVal2);*/
			}
		}

	 description = description.substring(0,description.length()-1 );
	 quantities = quantities.substring(0,quantities.length()-1 );
	 uoms = uoms.substring(0,uoms.length()-1 );
	 valueOfMaterials1 = valueOfMaterials1.substring(0,valueOfMaterials1.length()-1 );
	 finalNegotiatedAmt1 = finalNegotiatedAmt1.substring(0,finalNegotiatedAmt1.length()-1 );
	 finalHighestBidder1 = finalHighestBidder1.substring(0,finalHighestBidder1.length()-1 );
	 comments1 = comments1.substring(0,comments1.length()-1 );


	String attachmentSize			= (String)request.getParameter(hiddenDirSizeComp);
	String addAttachmentSize			= (String)request.getParameter(hiddenDirSizeAdd);

	String attachName				= "";
	String addAttachName				= "";

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


		String userTextComments			= (String)request.getParameter("userTextComments");
		userTextComments				= Utility.replaceQuoteOracle(userTextComments);


		String userDeptHeadSize			= (String)request.getParameter("userDeptHeadSize");
		
		int userDeptHeadSize1			= Integer.parseInt(userDeptHeadSize);

		String userDeptName				= "";
		String userDeptOId				= "";
		String userDeptSapNum				= "";
		String userDeptSapNum1				= "";
		String userDeptEmailid				= "";
		String mailTo ="";


		for(int j=0; j < userDeptHeadSize1; j++)
		{
			String userDeptName1		= (String)request.getParameter("userDeptHead"+j);

			if(userDeptName1.equals("0")){
				userDeptName= "0";
			}else{				
				userDeptName = userDeptName+userDeptName1+",";

				/*if(j==0)
				{
					mailTo  = userDeptName1;
				}*/
			}
		}

		userDeptName = userDeptName.substring(0, userDeptName.length() - 1).toLowerCase();

//out.println("userTextComments---"+userTextComments);
//out.println("userDeptName---"+userDeptName);
//out.println("totalValueInt---"+totalValueInt);

		String branchHeadSize			= (String)request.getParameter("branchHeadSize");		
		int branchHeadSize1				= Integer.parseInt(branchHeadSize);
		String branchHeadName			= "";

		int approvalCounter = 0;
		for(int k=0; k < branchHeadSize1; k++)
		{
			String branchHeadName1		= (String)request.getParameter("branchHead"+k);
										
			if(branchHeadName1.equals("0")){
				branchHeadName= "0";
			}else{		
				branchHeadName					= branchHeadName+branchHeadName1+",";

				if(k==0)
				{
					mailTo  = branchHeadName1;
				}
			}

			if("Fixed Asset Disposal".equals(disposalType))
			{
				if(totalVOMValueInt > 99999.00)
				{
					if(k==2)
					{
						//out.println(branchHeadName1+"---------"+iboHead);
						if(branchHeadName1.equals(iboHead))
						{//out.println("sss");
						}else{
							approvalCounter = approvalCounter+1;

						}
					}
				}

				/*if(k==3)
				{
					if(branchHeadName1.equals(fdHead))
					{//out.println("nn");
					}else{
						approvalCounter = approvalCounter+1;

					}
				}*/
			}

			
			if("One-off Miscellaneous".equals(disposalType))
			{
				if(totalValueInt > 99999.00)
				{
					if(k==2)
					{
						//out.println(branchHeadName1+"---------"+iboHead);
						if(branchHeadName1.equals(iboHead))
						{//out.println("sss");
						}else{
							approvalCounter = approvalCounter+1;

						}
					}
				}
			}
		}
		branchHeadName = branchHeadName.substring(0, branchHeadName.length() - 1).toLowerCase();

		String supportedHeadSize		= (String)request.getParameter("supportedHeadSize");
		
		int supportedHeadSize1			= Integer.parseInt(supportedHeadSize);

		String supportedHeadName		= "";

		for(int m=0; m < supportedHeadSize1; m++)
		{
			String supportedHeadName1	= (String)request.getParameter("supportedHead"+m);

			if(supportedHeadName1.equals("0")){
				supportedHeadName= "0";
			}else{
				supportedHeadName			= supportedHeadName+supportedHeadName1+",";
			}

			if("Fixed Asset Disposal".equals(disposalType))
			{
				if(totalVOMValueInt > 99999.00)
				{
					if(m==2)
					{
						if(supportedHeadName1.equals(masdHead))
						{}else{
							approvalCounter = approvalCounter+1;

						}
					}
				}
			}


			if("One-off Miscellaneous".equals(disposalType))
			{
				if(totalValueInt > 99999.00)
				{
					if(m==2)
					{
						if(supportedHeadName1.equals(masdHead))
						{}else{
							approvalCounter = approvalCounter+1;

						}
					}
				}
			}
		}
		supportedHeadName = supportedHeadName.substring(0, supportedHeadName.length() - 1).toLowerCase();

	//	out.println( " supportedHeadName : "+supportedHeadName);
		
		String approvedBySize		= (String)request.getParameter("approvedBySize");
		
		int approvedBySize1			= Integer.parseInt(approvedBySize);

		String approvedByName		= "";

		String approvedByOId				= "";
		String approvedBySapNum				= "";
		String approvedBySapNum1				= "";
		String approvedByEmailid				= "";

		for(int p=0; p< approvedBySize1; p++)
		{
			String approvedByName1	= (String)request.getParameter("approvedBy"+p);
			if(approvedByName1.equals("0"))	{
				approvedByName= "0";

			}else{				
				approvedByName			= approvedByName+approvedByName1+",";
			}

			if("Fixed Asset Disposal".equals(disposalType)  || "One-off Miscellaneous".equals(disposalType))
			{
				if(p==0)
				{
					if(approvedByName1.equals(fdHead) || approvedByName1.equals(iboHead))
					{}else{
						approvalCounter = approvalCounter+1;

					}
				}

				if(p==1)
				{
					if(approvedByName1.equals(exepHead))
					{}else{
						approvalCounter = approvalCounter+1;

					}
				}
			}

			/*if("Fixed Asset Disposal".equals(disposalType)  || "One-off Miscellaneous".equals(disposalType))
			{
				if(totalValueInt > 0.00 && totalValueInt < 100000.00)
				{
					if(approvedByName1.equals(iboHead))
					{}else{ approvalCounter = approvalCounter+1; }

				}else if(totalValueInt >= 100000.00 && totalValueInt < 2000000.00)
				{
					if(approvedByName1.equals(fdHead))
					{}else{
						approvalCounter = approvalCounter+1;

					}
				}else if(totalValueInt >= 2000000.00 && totalValueInt < 10000000.00)
				{
					if(approvedByName1.equals(exepHead))
					{}else{
						approvalCounter = approvalCounter+1;

					}

				}else if(totalValueInt >= 10000000.00)
				{
					if(approvedByName1.equals(exepHead))
					{}else{
						approvalCounter = approvalCounter+1;

					}
				}
			}*/
		}
		approvedByName = approvedByName.substring(0, approvedByName.length() - 1).toLowerCase();

	//	out.println("approvedByName---"+approvedByName);
	//	out.println("approvalCounter---"+approvalCounter);

//String action = "I";
	//String actionStr = "In - Process";
	String headerSection1 [ ]				= {"ApplicationName","statusType", "createdby", "documentstate","disposalType","disposalName","location","createdDate","disposalProposedBy","disposalApprovedBy","totalValue","comments","compAttachment","attachmentFolderName","detailsTableSize","addAttachment","VatNTds","totalVOMValue"};

	String detailSection2 [ ]	 = {"COUNTS","DESC_HEADER", "QUANTITY_HEADER", "UOM_HEADER","VAL_OF_MAT_HEADER","FINAL_NEG_AMT_HEADER", "FINAL_HIGH_BIDHEADER","COMMENTS_HEADER"};

	String headerSectionVal1 [ ]	= { applName, action, emailId, actionStr, disposalType,disposalName,locationName1,createdDate,dispProposedByEmailid,dispApprovedByEmailid,totalValue,userTextComments,attachName,folderName,counter+"",addAttachName,vatNtds,totalVOMValue};
	
	String detailSectionVal2 [ ]	 = {counter+"",description, quantities, uoms,valueOfMaterials1,finalNegotiatedAmt1,finalHighestBidder1,comments1};

	processWasteDetailsHash.put("HEADERSECTION1", headerSection1);
	processWasteDetailsHash.put("HEADERSECTIONVAL1", headerSectionVal1);

	processWasteDetailsHash.put("DETAILSECTION2", detailSection2);
	processWasteDetailsHash.put("DETAILSECTIONVAL2", detailSectionVal2);


	String  createRequest = "";
	boolean  approvalFlag =false;
	String message ="";
	if(approvalCounter > 0)
	{
		message = "<h5>Some error occured while processing your request."
					+"<br> Click <a href=\"javascript:history.back();\">here</a> to view the Request.</h5>";

	}else
	{
		createRequest  = wasteSalesHeaderController.create("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", processWasteDetailsHash);

		if("".equals(userDeptName) || userDeptName==null)
		{
			userDeptName = "0";
		}

		if("".equals(branchHeadName) || branchHeadName==null)
		{
			branchHeadName ="0";
		}

		if("".equals(supportedHeadName) || supportedHeadName==null)
		{
			supportedHeadName ="0";
		}

		if("".equals(approvedByName) || approvedByName==null)
		{
			approvedByName = "0";
		}



		//String approvalheaderSection [ ]				= {"UserDepartmentHead","BnCBranchHead","Support","Approval" };
		//String approvalheaderSectionVal [ ]				= {userDeptName,branchHeadName,supportedHeadName,approvedByName };
		String approvalheaderSection [ ]				= {"BnCBranchHead","UserDepartmentHead","Support","Approval" };
		String approvalheaderSectionVal [ ]				= {branchHeadName,userDeptName,supportedHeadName,approvedByName };
		
		approvalDetailsHash.put("REQUESTOID", createRequest);
		approvalDetailsHash.put("DOCUMNETOID", documnetOID);
		approvalDetailsHash.put("APPLICATIONNAME", "wastesalesapprovals");
		approvalDetailsHash.put("CREATEDBY", emailId);


		if(!"".equals(userDeptName) || !"".equals(branchHeadName) || !"".equals(supportedHeadName) || !"".equals(approvedByName))
		{
			approvalDetailsHash.put("APPROVALHEADERSECTION", approvalheaderSection);
			approvalDetailsHash.put("APPROVALHEADERSECTIONVAL", approvalheaderSectionVal);

			approvalFlag  = wasteSalesChangeLogController.insertApproval("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", approvalDetailsHash);
		}

		if ("AuthFail".equals(createRequest)){
         message = "<h5>Some error occured while processing your request."
					+"<br> Click <a href=\"javascript:history.back();\">here</a> to view the Request.</h5>";	

    }else{
         message = "<h5>Request number <b>"+createRequest+" </b>has been created successfully."
					+"<br> Click <a href=\"../user/viewWSDisposal.jsp\">here</a> to view the Request.</h5>";	

		if("I".equals(action))
		{
			//String  str = "<p>Dear All ,</p><p>Request number " +createRequest+ " has been created by  " +emailId+ " from " +branch+ " .</p><p> This is for your //kind information. Kindly approve\review it.</p><p>Regards,</p><p> Timescape Admin</p>";

			String mailFrom ="timescape.admin@timesgroup.com";

			String host ="apprelay.timesgroup.com";

			
			ArrayList  lstArray= new ArrayList();

			lstArray  = wasteSalesChangeLogController.getEmailid(mailTo);
			String strArr[] = (String[])lstArray.get(0);

			String str = "Dear "+strArr[0]+", <br>" //manager[2] + "<br>"
					   + "<br> The following Sale Approval (SAR Note) request is pending for your approval. Please approve or review this request on Timescape.<BR><BR>"
					   + "Sale Approval Id : "+createRequest+"<br>"
					   + "Type of Disposal : "+disposalType+" <br>"
					   + "Approval Sought For Disposal Of : "+disposalName+" <br>"
					   + "Created By	   : "+emailId+" <br><BR>"
					   + "Alternatively you can also click on the following link: <a href='http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://db6b2f31872d3befc50f7f254ea44cbd'>Sale Approval(SAR Note)</a><br><br>"
					   + "<p>Regards,</p><p> Timescape Admin</p>";

			String subject= "SAR Note pending for approval";

			String htmlstr = "<html>" + "\n" 
						+ "<head>" + "\n" 
						+ "	<title>Email Alert</title>" + "\n" 
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
                        + "				<td colspan = \"3\" align = \"left\"><img src = \"http://wsqa.timesgroup.com/timescape/sapep/collaboration/workflow/wastesalesapproval/images/bannerfinal.jpg\" border = \"0\"></td>" 
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
						+ "								<div align = \"left\">"+str+"</div>" 
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

	//	out.println("--------"+mailTo);
			Hashtable mailDetailsHash = new Hashtable();
			mailDetailsHash.put("fromAddr", mailFrom);
			mailDetailsHash.put("mailPath", host);
			mailDetailsHash.put("toAddr", mailTo);
			mailDetailsHash.put("subject",subject);
			mailDetailsHash.put("content", htmlstr);
			/*mailDetailsHash.put("CREATEDBYEMAILID", emailId);		
			mailDetailsHash.put("MAILTO", mailTo);
			mailDetailsHash.put("MAILSTATUS", "I");
			mailDetailsHash.put("REQUESTID", createRequest);
			mailDetailsHash.put("SUBJECT", subject);
			mailDetailsHash.put("MESSAGE", htmlstr);*/

		boolean mailFlag  = wasteSalesChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);


		}


      }
	}

//System.out.println("approvalFlag-----"+approvalFlag);


	
	%>

<body>
<%@ include file="../common/relatedLinks.jsp" %>
<div class="container well">
	<div class="row ">
	<div class="col-xs-2"></div>
		<div class="col-xs-8 bs-example  ">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
					<i class="fa fa-th"></i>  <strong>Submit Waste/Fixed Asset Disposal Aprroval</strong>
					</div>			
					</div>
					<div class="portlet-body">
						<form class="form-horizontal" role="form" id="demo_form" name ="frmCreateWasteSalesProcess" method="post">
						<div class="form-body">
							<div class="row " style="margin-top:0px;margin-bottom:0;">
								<table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F2F2"> 
									<tr>
										<td align="left" ><img src="../images/spacer.gif" width="1" height="40"></td>
									</tr>
									<tr>
										<td align="center" class="normal" valign = "top" ><%=message%></td>
									</tr>
									<tr>
										<td align="left" ><img src="../images/spacer.gif" width="1" height="40"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="col-xs-2"></div>
	</div>
</div>
					

</body>
</html>
