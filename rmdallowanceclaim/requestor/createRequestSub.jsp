<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date" %>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />
<%
	//List of all tags need to write in the xml in the specific order
	String[] dateDetails	= {"dateDetails","travelOn", "date", "day", "type", "amt"};
	String[] vdDetails		= {"visitDetails","vdId", "date", "visitDetails"};
	
	ArrayList tagsLst			= new ArrayList();
	ArrayList vdTagsLst			= new ArrayList();

	ArrayList dataLst			= new ArrayList();
	ArrayList vdDataLst			= new ArrayList();

	ArrayList travelOnLst		= new ArrayList();
	ArrayList vdArrLst			= new ArrayList();
	

    String noOfRows					= request.getParameter("noOfRows");
    String appliedMonth				= request.getParameter("appliedMonth");
    String selectApprover			= request.getParameter("selectApprover");
	
	int rows						= 0;
	rows							= Integer.parseInt(noOfRows);
	String countrows				= request.getParameter("countrows");
	String amount					= request.getParameter("amount");
	
	String approvedBy				= request.getParameter("selectApprover");
	//String approvedByOId			= approvedBy.substring(0,approvedBy.indexOf("|"));
	//approvedBy						= approvedBy.substring(approvedBy.indexOf("|")+1);
	String redirectURL				= "";
	String date ="";
	String day	="";				
	String type	="";				
	String weekDay	="";
	String approverDetails ="";
	String type1 ="";
	String amt ="";
	String visitDetails ="";
	
	//out.println(amount);

		
	Hashtable rmdClaimHeader	= new Hashtable( );
	rmdClaimHeader.put("workingDays", countrows);
	rmdClaimHeader.put("claimAmount", amount);
	rmdClaimHeader.put("approvedAmount", "0");
	rmdClaimHeader.put("createdBy", timescapeUserOId+"");
	rmdClaimHeader.put("approvedBy", approvedBy);
	rmdClaimHeader.put("approverRemarks", "-");
	rmdClaimHeader.put("approverDetails", "-");
	rmdClaimHeader.put("status","L");	    
	rmdClaimHeader.put("appliedMonth",appliedMonth);	
	
	for(int ii=0; ii<rows ; ii++)
	{

		weekDay = (String) request.getParameter("weekDay"+ii);
		if ( weekDay!=null && !( weekDay.trim().equals("") || weekDay.equals("0") ) )
		{
            Hashtable dateHash	= new Hashtable( );
            Hashtable vdDateHash	= new Hashtable( );
			
			 date					= (String)request.getParameter("currentDate"+ii);
			 day					= (String)request.getParameter("weekDay"+ii);
			 type				    = (String)request.getParameter("type"+ii);
			 visitDetails			= (String)request.getParameter("visitDetails"+ii);
			 visitDetails = "".equals(visitDetails) ? "-": visitDetails;

			 if(type.equals("Field"))
			{
				type1 = "FA";
				amt				    = (String)request.getParameter("reqestorAmount2"+ii);

			}else if(type.equals("Night"))
			{
				type1 = "NA";
				amt				    = (String)request.getParameter("reqestorAmount1"+ii);

			}
			

			dateHash.put("date",date);
			dateHash.put("day",day);
			dateHash.put("type",type1);
			dateHash.put("amt",amt);
			vdDateHash.put("date",date);
			vdDateHash.put("visitDetails",visitDetails);

			out.println("vdDateHash--"+vdDateHash);
			
            travelOnLst.add(dateHash);
            vdArrLst.add(vdDateHash);

           
		}// end of if
		else continue;
	}
	tagsLst.add(dateDetails);
	vdTagsLst.add(vdDetails);

	dataLst.add(travelOnLst);
	vdDataLst.add(vdArrLst);

	boolean status = false;

	status = rmdAllowanceClaimDetails.create(rmdClaimHeader, tagsLst, dataLst, vdTagsLst, vdDataLst);
	out.println("status----"+status);
	
	
	if(status)
	{
	response.sendRedirect("../requestor/checkRequest.jsp");
	}
	else
	{
	response.sendRedirect("../common/promptPage.jsp?msg=ERR_REQ");
	}
	 

%>
