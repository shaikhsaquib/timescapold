<%@ page import="java.util.Hashtable,java.util.ArrayList, java.util.*"%>
<%@ page import="java.util.regex.Matcher, java.util.regex.Pattern" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<jsp:useBean id="legalHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>


<%
	Hashtable detailsHash = new Hashtable();   
	Hashtable searchHash = new Hashtable();

	String name = (String)request.getParameter("queryString");
	String idName = (String)request.getParameter("idName");
	String selectedOpt  = (String)request.getParameter("selectedOption");
	String commonStr  = "";
	searchHash.put("COMPANYCODE", companyCode);
	searchHash.put("DEPTCODE", deptGroup);
	searchHash.put("EMAILID", emailId);
	//out.println(companyCode+"--"+deptGroup+"--"+emailId+"--"+selectedOpt);
	
	

			ArrayList contactsList = new ArrayList();
				
			Hashtable legalHash1 = new Hashtable();
			legalHash1.put("STATUS", "A");
			legalHash1.put("DOCUMENTOID", "DOC1006");
			legalHash1.put("APROFILEOID", "PRO6002");
			legalHash1.put("BPROFILEOID", "PRO6003");
			legalHash1.put("ATTRIBUTEVALUE", locationCode);

			contactsList	= legalHeaderController.getlegalcordinates(legalHash1);				

			int yy = contactsList.size();
			if( yy> 0){
				for( int iit=0; iit< yy;iit++){
					String headerData[] = (String[])contactsList.get(iit);	
					String array[] = headerData[2].split(",");
					for (int ii=0; ii< array.length; ii++){		
						String emailidArr = array[ii];
						out.println("<ul class =\"normal\" onclick=\"fill1('"+emailidArr+"','"+idName+"');\" >"+emailidArr+"</ul>");					
					}					
				}
			}	
   
%>
