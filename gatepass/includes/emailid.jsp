<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>

<%
            String emailStr ="";

           emailStr+="<select class=\"normal\" name=\"emailId\" id=\"emailId\">\n";
		   
			String compCode = (String)request.getParameter("comp");
			String locn     = (String)request.getParameter("locn");
			String deptCode = (String)request.getParameter("deptCode");
			
          if(compCode== null || compCode.equals("0")){

                emailStr+="<option value=0>Select a EmailID</option>";

            }else{

                emailStr+="<option value=all>ALL</option>";

                if(!(compCode.equals("all"))){

                    ArrayList emailidList = new ArrayList();

					emailidList = GatepassController.getEmailIdList(compCode, locn, deptCode);

                    for (int ii=0; ii<emailidList.size(); ii++){
                        String emailidArr[] = (String[])emailidList.get(ii);
                          emailStr+="<option value=\""+emailidArr[0]+"|"+emailidArr[1]+"|"+emailidArr[3]+"\" style=normal>"+emailidArr[3]+"</option>";
                    }
                }
            }

            emailStr+="</select>";
            out.println(emailStr);
%>