<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="domainObjectsWebController" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" scope="session"/>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 


<%   
            String deptStr ="";

            deptStr+="<select class=\"normal\" name=\"department\" id=\"department\">\n";

			String compCode = (String)request.getParameter("companyCode");
			
			//System.out.println("compCode" +compCode);

           if((compCode.equals("0")||compCode== null)){

                deptStr+="<option value=0>Select a Department</option>";

           }else{

                //deptStr+="<option value=all>ALL</option>";

                //if(!(compCode.equals("all"))){
                deptStr+="<option value=0>Select a Department</option>";
                

                    ArrayList deptList = new ArrayList();
                    
                    deptList = policyController.getDepartmentNames(compCode);
						//out.println(deptList.size());
                    
                    if (deptList.size() > 0 ) {

                        deptStr+="<option value=all|all>All</option>";

                    }

                    for (int ii=0; ii<deptList.size(); ii++){
                        String deptArr[] = (String[])deptList.get(ii);
						//out.println(deptArr[2]);
                          deptStr+="<option value=\""+deptArr[0]+"|"+deptArr[2]+"\" style=normal>"+deptArr[2]+"</option>";
						  //out.println(deptArr[2]);
                    }
                //}
            }

            deptStr+="</select>";
            out.println(deptStr);
			
%>