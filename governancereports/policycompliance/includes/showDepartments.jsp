<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="domainObjectsWebController" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" scope="session"/>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" />

<%   
            String deptStr ="";

            deptStr+="<select class=\"normal\" name=\"department\" id=\"department\">\n";

			String compCode = (String)request.getParameter("companyCode");
                     //ArrayList deptList = new ArrayList();
                    //deptList = policyController.getDepartmentNames(compCode);
            //out.println(compCode);
            //out.println(deptList.size());
			
           if((compCode.equals("0")||compCode== null)){

                deptStr+="<option value=0>Select a Department</option>";

           }else{

				deptStr+="<option value=0>Select a Department</option>";

                    ArrayList deptList = new ArrayList();
                    deptList = policyController.getDeptNames(compCode);
                    for (int ii=0; ii<deptList.size(); ii++){
                        String deptArr[] = (String[])deptList.get(ii);
                          deptStr+="<option value=\""+deptArr[0]+"|"+deptArr[2]+"\" style=normal>"+deptArr[2]+"</option>";
						  //out.println("deptStr....."+deptStr);
                    }
            }

            deptStr+="</select>";
            out.println(deptStr);
			
%>