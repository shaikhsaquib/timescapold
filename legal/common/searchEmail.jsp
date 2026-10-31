<%@ page import="java.util.Hashtable,java.util.ArrayList, java.util.*"%>
<%@ page import="java.util.regex.Matcher, java.util.regex.Pattern" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<jsp:useBean id="legalHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="groupwareWebController" class="com.bccl.groupware.web.controller.GroupwareWebController" /> 
<%@ include file="../common/queryString.jsp" %>

<%
	Hashtable detailsHash = new Hashtable();   
	Hashtable searchHash = new Hashtable();

	String name = (String)request.getParameter("queryString");
	String idName = (String)request.getParameter("idName");
	String selectedOpt  = (String)request.getParameter("selectedOption");
	String commonStr  = "";

	if(selectedOpt!=null){

        if(selectedOpt.equals("emailId")){

 			name = name.toLowerCase();

            searchHash.put("emailId", name);

        }else{

			int pos = name.lastIndexOf(" ");
			String reqFirstName = "";
			String reqLastName = "";

			if(pos < 1){

				reqFirstName = name;
  			    reqFirstName = reqFirstName.toUpperCase();
				reqLastName = "";

                searchHash.put("name", reqFirstName);

			}else{

				reqFirstName = name.substring(0, name.lastIndexOf(" "));
				reqLastName  = name.substring(name.lastIndexOf(" ") + 1, name.length());
  			    reqFirstName = reqFirstName.toUpperCase();
  			    reqLastName  = reqLastName.toUpperCase();

                searchHash.put("firstName", reqFirstName);
                searchHash.put("lastName", reqLastName);
			}
        }

		ArrayList contactsList = new ArrayList();

		contactsList = groupwareWebController.peopleLocator(searchHash);

		int yy = contactsList.size();
		if( yy> 0){
			for( int iit=0; iit< yy;iit++){
				String tmpArr[] = (String[])contactsList.get(iit);	

				if("userDeptHead".equals(idName))
				{
					out.println("<ul class =\"normal\" onclick=\"fill('"+tmpArr[1]+"','"+idName+"');\" >"+tmpArr[1]+"</ul>");
				}else
				{
					out.println("<ul class =\"normal\" onclick=\"fill1('"+tmpArr[1]+"','"+idName+"');\" >"+tmpArr[1]+"</ul>");

				}
			}
		}
    }
 

%>
