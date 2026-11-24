<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>


<%@ page import="java.util.Hashtable, java.util.ArrayList,com.bccl.leave.web.util.Utility" %>
<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>

<%!
String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
%>

<%
	ArrayList experienceList = new ArrayList();

	String action =  request.getParameter("redirection");
	//System.out.println("Action -- "+action);

	if(request.getParameterValues("departments") != null) {

		String[] tempdepartments;
		String[] tempjobDescription;
		String[] tempjoinedAs;
		String[] tempdesignation;
		String[] tempinternalFromMonth;
		String[] tempinternalFromYear;
		String[] tempprevToMonth;
		String[] tempprevToYear;
		String[] experienceDetailId;

		experienceDetailId		= request.getParameterValues("experienceDetailId");
		tempdepartments			= request.getParameterValues("departments");
		tempjobDescription		= request.getParameterValues("jobDesc");
		tempjoinedAs			= request.getParameterValues("designation");
		tempdesignation			= request.getParameterValues("promotedDesignation");
		tempinternalFromMonth	= request.getParameterValues("fromMonth");
		tempinternalFromYear	= request.getParameterValues("fromYear");
		tempprevToMonth			= request.getParameterValues("toMonth");
		tempprevToYear			= request.getParameterValues("toYear");

		int noOfExp = 0;

		Hashtable experienceHash = null;

		for(int j = 0; j < tempjobDescription.length; j++)  {

			//System.out.println("tempjobDescription --"+tempjobDescription[j]+"--" );

			if (tempjobDescription[j] != null && !tempjobDescription[j].equals("") ) {

				experienceHash = new Hashtable();
               if (!"0".equals(experienceDetailId[j])) {
    			    experienceHash.put("experienceDetailID",experienceDetailId[j]);
                }
				experienceHash.put("deptCompany",tempdepartments[j]);
				experienceHash.put("experienceFlag","IN");
				experienceHash.put("jobDesc",Utility.replaceQuoteOracle(tempjobDescription[j]));
				experienceHash.put("joinedDesignation",tempjoinedAs[j]);
				experienceHash.put("promotedDesignation",tempdesignation[j]);
				experienceHash.put("fromDate","01-" + monthArr[Integer.parseInt(tempinternalFromMonth[j])-1] + "-" + tempinternalFromYear[j]);
				experienceHash.put("toDate","01-" + monthArr[Integer.parseInt(tempprevToMonth[j])-1] + "-" + tempprevToYear[j]);

                //update the updatedDate in the database. If passing explicit date pass with single quotes.
                // for e.g. '20-DEC-04' or else just sysdate.
                experienceHash.put("updatedOn", "sysdate");

				experienceList.add(experienceHash);
			}
		}
	}

	if(request.getParameterValues("companyName") != null){

		String[] tempdepartments;
		String[] tempjobDescription;
		String[] tempjoinedAs;
		String[] tempdesignation;
		String[] tempinternalFromMonth;
		String[] tempinternalFromYear;
		String[] tempprevToMonth;
		String[] tempprevToYear;
		String[] experienceDetailId;

		experienceDetailId		= request.getParameterValues("experienceDetailIdPrev");
		tempdepartments			= request.getParameterValues("companyName");
		tempjobDescription		= request.getParameterValues("jobDesc1");
		tempjoinedAs			= request.getParameterValues("joinedAs1");
		tempdesignation			= request.getParameterValues("designation1");
		tempinternalFromMonth	= request.getParameterValues("fromPrevMonth1");
		tempinternalFromYear	= request.getParameterValues("fromPrevYear1");
		tempprevToMonth			= request.getParameterValues("toPrevMonth1");
		tempprevToYear			= request.getParameterValues("toPrevYear1");

		int noOfExp = 0;

		Hashtable experienceHash = null;
		for(int j = 0; j < tempjobDescription.length; j++){

			if (tempjobDescription[j] != null && !tempjobDescription[j].equals("") ) {

			   experienceHash = new Hashtable();
               if (!"0".equals(experienceDetailId[j])) {
    			    experienceHash.put("experienceDetailID",experienceDetailId[j]);
                }
				experienceHash.put("deptCompany",Utility.replaceQuoteOracle(tempdepartments[j]));
				experienceHash.put("experienceFlag","EX");
				experienceHash.put("jobDesc",Utility.replaceQuoteOracle(tempjobDescription[j]));
				experienceHash.put("joinedDesignation",Utility.replaceQuoteOracle(tempjoinedAs[j]));
				experienceHash.put("promotedDesignation",Utility.replaceQuoteOracle(tempdesignation[j]));
				experienceHash.put("fromDate","01-" + monthArr[Integer.parseInt(tempinternalFromMonth[j])-1] + "-" + tempinternalFromYear[j]);
				experienceHash.put("toDate","01-" + monthArr[Integer.parseInt(tempprevToMonth[j])-1] + "-" + tempprevToYear[j]);

                //update the updatedDate in the database. If passing explicit date pass with single quotes.
                // for e.g. '20-DEC-04' or else just sysdate.
                experienceHash.put("updatedOn", "sysdate");

				experienceList.add(experienceHash);
			}
		}
	}


    Hashtable profile = (Hashtable) session.getValue("profile");

	boolean status = profileController.setExperienceDetail(Long.parseLong(profile.get("timescapeUserOID")+""),experienceList);

	String redirectUrl = "../common/promptPage.jsp?msg=6";

    if(status) {
		if(action.equals("Add")){
			redirectUrl = "../common/promptPage.jsp?msg=3";
		} else {
			redirectUrl = "../profile/editExperience.jsp";
		}
    }

    response.sendRedirect(redirectUrl);

%>
