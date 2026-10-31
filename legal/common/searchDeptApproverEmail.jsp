<%@ page import="java.util.Hashtable,java.util.ArrayList, java.util.*"%>
<%@ page import="java.util.regex.Matcher, java.util.regex.Pattern" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
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
  			    //reqFirstName = reqFirstName.toUpperCase();
				reqLastName = "";
                searchHash.put("QUERYSTRING", reqFirstName);
				//out.println("QUERYSTRING--"+reqFirstName);
			}else{
				reqFirstName = name.substring(0, name.lastIndexOf(" "));
				reqLastName  = name.substring(name.lastIndexOf(" ") + 1, name.length());
  			    //reqFirstName = reqFirstName.toUpperCase();
  			    //reqLastName  = reqLastName.toUpperCase();
                searchHash.put("QUERYSTRING", reqFirstName);                
				//out.println("QUERYSTRING----"+reqFirstName);
			}
        }

		ArrayList contactsList = new ArrayList();
		
		if("1005".equals(deptGroup)){
		
			String[] strArray0 = {"","","","","","","amit.rai@timesgroup.com"};
			String[] strArray1 = {"","","","","","","mritunjay.kataria@timesgroup.com"};
			String[] strArray2 = {"","","","","","","rajan.vaid@timesgroup.com"};
			
			String[] strArray3 = {"","","","","","","tasneem.lightwala@timesgroup.com"};
			String[] strArray4 = {"","","","","","","aarjay.prakashan@timesgroup.com"};
			String[] strArray5 = {"","","","","","","kumar.laxmikant@timesgroup.com"};
			
			String[] strArray6 = {"","","","","","","kunal.endait@timesgroup.com"};
			String[] strArray7 = {"","","","","","","hemlata.bhasin@timesgroup.com"};
			String[] strArray8 = {"","","","","","","saikat.chaudhuri@timesgroup.com"};
					
			contactsList.add(strArray0);
			contactsList.add(strArray1);
			contactsList.add(strArray2);

			contactsList.add(strArray3);
			contactsList.add(strArray4);
			contactsList.add(strArray5);
			
			contactsList.add(strArray6);
			contactsList.add(strArray7);
			contactsList.add(strArray8);			
			
		}else {		
			contactsList = legalHeaderController.getEmailId(searchHash);	
		}	
			int yy = contactsList.size();
			//out.println("yy----"+yy);
			if( yy> 0){
				for( int iit=0; iit< yy;iit++){
					String tmpArr[] = (String[])contactsList.get(iit);	

					if("userDeptHead".equals(idName)){
						out.println("<ul class =\"normal\" onclick=\"fill('"+tmpArr[6]+"','"+idName+"');\" >"+tmpArr[6]+"</ul>");
					}else{
						out.println("<ul class =\"normal\" onclick=\"fill1('"+tmpArr[6]+"','"+idName+"');\" >"+tmpArr[6]+"</ul>");
					}
				}
			}
	   
    }
%>
