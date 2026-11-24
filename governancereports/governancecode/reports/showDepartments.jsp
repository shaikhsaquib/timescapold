<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="domainObjectsWebController" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" scope="session"/>
<jsp:useBean id="GovernancequizApproverWebController" class="com.bccl.governancequiz.web.controllerbeans.GovernancequizApproverWebController" />

<%   
            String deptStr ="";

            deptStr+="<select class=\"normal\" name=\"department\" id=\"department\">\n";

			String compCode = (String)request.getParameter("companyCode");
           if((compCode.equals("0")||compCode== null)){

                deptStr+="<option value=0>Select a Department</option>";

           }else{

				deptStr+="<option value=0>Select a Department</option>";

                    ArrayList deptList = new ArrayList();
                    deptList = GovernancequizApproverWebController.getDeptNames(compCode);
                    for (int ii=0; ii<deptList.size(); ii++){
                        String deptArr[] = (String[])deptList.get(ii);
                          deptStr+="<option value=\""+deptArr[0]+"\" style=normal>"+deptArr[2]+"</option>";
                    }
            }

            deptStr+="</select>";
            out.println(deptStr);
            session.setAttribute("compcode",compCode);
			
%>