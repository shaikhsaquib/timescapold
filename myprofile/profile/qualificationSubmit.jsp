<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@page errorPage="../common/errorPage.jsp"%>


<%@ page import="java.util.Hashtable, java.util.ArrayList,com.bccl.util.Utility" %>
<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>

<%
	ArrayList qualificationList = new ArrayList( );

	if(request.getParameterValues("qualificationOID") != null) {

        String[] tempQualificationDetailId   = request.getParameterValues("qualificationDetailId");
        String[] tempQualificationCode       = request.getParameterValues("qualificationOID");
        String[] tempSpecialization          	 = request.getParameterValues("specialization");
        String[] tempInstitute               			 = request.getParameterValues("institute");
        String[] tempUniversity              			= request.getParameterValues("university");
        String[] tempStudyType               		= request.getParameterValues("studyType");
        String[] tempPercentAcquired     	= request.getParameterValues("percentAcquired");
        String[] tempPassingYear             	= request.getParameterValues("passingYear");

		Hashtable qualificationHash = null;

		for(int j = 0; j < tempQualificationCode.length;j++){

         qualificationHash = new Hashtable();

			/*if((tempPercentAcquired[j] == null) || (tempPercentAcquired[j].equals(""))){
				continue;
			}*/
			if((tempInstitute[j] == null) || (tempInstitute[j].equals(""))){
				continue;
			}
			else
			{

                if (!"0".equals(tempQualificationDetailId[j])) {
	    			    qualificationHash.put("qualificationDetailID",tempQualificationDetailId[j]);
                }

				    qualificationHash.put("qualificationCode",tempQualificationCode[j]);
					qualificationHash.put("specialization",Utility.replaceQuoteOracle( tempSpecialization[j] ));

					qualificationHash.put("institute",Utility.replaceQuoteOracle( tempInstitute[j] ));

					qualificationHash.put("boardUniversity",Utility.replaceQuoteOracle( tempUniversity[j] ));

					qualificationHash.put("studyType",tempStudyType[j]);

					if(tempPercentAcquired[j] == null || "".equals(tempPercentAcquired[j])){
						tempPercentAcquired[j] = "0";
					}

					qualificationHash.put("percentAcquired",tempPercentAcquired[j]);

					qualificationHash.put("passingYear","01-JAN-" + tempPassingYear[j]);

                    //update the updatedDate in the database. If passing explicit date pass with single quotes.
                    // for e.g. '20-DEC-04' or else just sysdate.
                    qualificationHash.put("updatedOn", "sysdate");


			}
			qualificationList.add(qualificationHash);
		}
	}

    Hashtable profile = (Hashtable) session.getValue("profile");

	String action = request.getParameter("option");
   boolean status = profileController.setQualificationDetail(Long.parseLong(profile.get("timescapeUserOID")+""), qualificationList);

    if(status){
		if(action.equals("Add")){
	        response.sendRedirect("../common/promptPage.jsp?msg=2");
		} else {
			response.sendRedirect("../profile/editQualifications.jsp");
		}
    }else{
        response.sendRedirect("../common/promptPage.jsp?msg=6");
    }
%>
