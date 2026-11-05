<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.io.File,java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*, java.io.File, com.bccl.util.Utility"%>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties,com.bccl.util.AESencrp"%>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.Calendar, java.util.Date" %>

<%@ page import="com.bccl.util.Utility" %>

<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController" />

<%
	String nameOfAsset				= (String)request.getParameter("nameOfAsset");
	nameOfAsset = Utility.replaceQuoteOracle(nameOfAsset);
	
	String assetNo					= (String)request.getParameter("assetNo");
	assetNo = Utility.replaceQuoteOracle(assetNo);

	String assetCategory			= (String)request.getParameter("assetCategory");
	assetCategory = Utility.replaceQuoteOracle(assetCategory);

	String assetType				= (String)request.getParameter("assetType");
	assetType = Utility.replaceQuoteOracle(assetType);

	String installationDate			= (String)request.getParameter("installationDate");
	installationDate = Utility.replaceQuoteOracle(installationDate);

	String originalCost				= (String)request.getParameter("originalCost");
	originalCost = Utility.replaceQuoteOracle(originalCost);

	String currentCost				= (String)request.getParameter("currentCost");
	currentCost = Utility.replaceQuoteOracle(currentCost);

	String assetLocation			= (String)request.getParameter("assetLocation");
	assetLocation = Utility.replaceQuoteOracle(assetLocation);

	//String assetMake				= (String)request.getParameter("assetMake");
	String assetMake				= "NA";
	assetMake = Utility.replaceQuoteOracle(assetMake);

	String assetModel				= (String)request.getParameter("assetModel");
	assetModel = Utility.replaceQuoteOracle(assetModel);

	//String assetCapacity			= (String)request.getParameter("assetCapacity");
	String assetCapacity			= "NA";
	assetCapacity = Utility.replaceQuoteOracle(assetCapacity);

	String assetSerialNo			= (String)request.getParameter("assetSerialNo");
	assetSerialNo = Utility.replaceQuoteOracle(assetSerialNo);

	String assetSpecification		= (String)request.getParameter("assetSpecification");
	assetSpecification = Utility.replaceQuoteOracle(assetSpecification);

	String assetCondition			= (String)request.getParameter("assetCondition");
	//String assetCondition			= "NA";
	assetCondition = Utility.replaceQuoteOracle(assetCondition);

	String assetAvailableFromDate	= (String)request.getParameter("assetAvailableFromDate");
	assetAvailableFromDate = Utility.replaceQuoteOracle(assetAvailableFromDate);

	String reviewedBy				= (String)request.getParameter("reviewedBy");
	reviewedBy = Utility.replaceQuoteOracle(reviewedBy);

	String reviewedByOId			= reviewedBy.substring(0,reviewedBy.indexOf("|"));
	reviewedBy						= reviewedBy.substring(reviewedBy.indexOf("|")+1);
	
	String attachmentName 			= (String)request.getParameter("attachment1");
	attachmentName = Utility.replaceQuoteOracle(attachmentName);
	
	String redirectURL				= "";

	ArrayList reqList = new ArrayList();
	Hashtable detailsHash = new Hashtable();

	detailsHash.put("ASSETNO", assetNo);
	detailsHash.put("STATUS", "'UC','CL','RA','RR'");

    if (!assetNo.equalsIgnoreCase("NA"))
    {
	    reqList = assetMgmt.getMyRequests(detailsHash);
    }
	//out.println("reqList.size()=="+reqList.size());

	if(reqList.size() > 0){

		redirectURL="../common/promptPage.jsp?msg=ALR_EXIST";
		//out.println("request with this asset no has already been created!!! Kindly check the requests");
	}
	else{
	
		Hashtable assetDetailsHash = new Hashtable();

		assetDetailsHash.put("ASSETNO", assetNo);
		assetDetailsHash.put("SERIALNO", assetSerialNo);
		assetDetailsHash.put("ASSETNAME", nameOfAsset);
		assetDetailsHash.put("ASSETCATEGORY", assetCategory);
		assetDetailsHash.put("ASSETTYPE", assetType);
		assetDetailsHash.put("INSTALLATIONDATE", installationDate);
		assetDetailsHash.put("ORIGINALCOST", originalCost);
		assetDetailsHash.put("CURRENTCOST", currentCost);
		assetDetailsHash.put("ASSETLOCATION", assetLocation);
		assetDetailsHash.put("ASSETMAKE", assetMake);
		assetDetailsHash.put("ASSETMODEL", assetModel);
		assetDetailsHash.put("CAPACITY", assetCapacity);
		assetDetailsHash.put("SPECIFICATION", assetSpecification);
		assetDetailsHash.put("ASSETCONDITION", assetCondition);
		assetDetailsHash.put("ASSETAVAILABLEFROM", assetAvailableFromDate);
		assetDetailsHash.put("REVIEWEDBY", reviewedByOId);
		assetDetailsHash.put("REVIEWERREMARKS", "NA");
		assetDetailsHash.put("CREATEDBY", timescapeUserOId+"");
		assetDetailsHash.put("CREATERREMARKS", "NA");
		assetDetailsHash.put("MODIFIEDBY", timescapeUserOId+"");
		assetDetailsHash.put("STATUS", "UC");
		assetDetailsHash.put("ATTACHMENT_NAME", attachmentName);

		boolean createFlag = true;

		createFlag = assetMgmt.createSurplusAsset(assetDetailsHash);

		String subject = "Surplus Asset Request pending for Review";
		String mailToWhom = reviewedBy;
		//String mailToWhom = "shreedhar.godbole@timesgroup.com";
		//out.println(reviewedBy);

		Hashtable requestHash = new Hashtable();

		requestHash.put("CREATEDBY", timescapeUserOId+"");
		requestHash.put("STATUS", "'UC'");
		requestHash.put("ASSETNO", assetNo);
		requestHash.put("SERIALNO", assetSerialNo);
		requestHash.put("ASSETNAME", nameOfAsset);

		//out.println(createFlag);
		
		if(createFlag){
%>
		<%//@ include file="../includes/mailContent.jsp"%>
<%

			redirectURL="../common/promptPage.jsp?msg=SUC_REQ";
			//out.println("Successful Asset Creation!! " +assetDetailsHash);
		
			String DPATH     = EnvironmentProperties.getValue("assetmanagement", "uploadPath");
	try {
		final class DirListing {
			private String[] dirlist(String fname) {
				File dir = new File(fname);
				String[] chld = dir.list();
				return chld;
			}
		}

		String email = "";
		
		if (emailId.indexOf("@") > -1) {
			email = emailId.substring(0, emailId.indexOf("@"));
		}
		
		String result = assetNo+assetSerialNo+assetType;
		
		String userFolderPath = DPATH + email;

		DirListing dirListing = new DirListing();

		String dirAdditional = userFolderPath + "/" + result;
		File dirAdditionalfileName = new File(dirAdditional);
		if (!dirAdditionalfileName.isDirectory()) {
			boolean dirAdditionalFlag = dirAdditionalfileName.mkdir();
		}

		String fileName = "";
		int fileSize = 0;
		String[] fileList = dirListing.dirlist(userFolderPath);
		String attachmentCoreName = attachmentName.substring(0,attachmentName.lastIndexOf("."));
		//out.println("attachmentCoreName"+attachmentCoreName);
		for (int i = 0; i < fileList.length; i++) {
			fileName = fileList[i];
			if (fileName.contains(".")) {
				String st4 = fileName.substring(fileName.lastIndexOf("_"), fileName.lastIndexOf("."));
				//out.println(st4);
				//out.println(attachmentCoreName);
				fileSize = fileList.length;
				//out.println("result"+result);
				if (fileName.contains(attachmentCoreName)) {

					File temp1 = new File(userFolderPath + "/" + fileName);
					if (!result.equals("0")) {

						temp1.renameTo(new File(dirAdditional + "/" + fileName));
						temp1.delete();
					} else {
						temp1.delete();
					}
				}

			}
		}

	} catch (Exception e) {
		//out.println(e);
	}
		
		}else{

			redirectURL="../common/promptPage.jsp?msg=ERR_REQ";
			//out.println("Oops!! Asset Creation failed.  "+assetDetailsHash);

		}
	}

	response.sendRedirect(redirectURL);
%>