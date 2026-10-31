<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>
<jsp:useBean id="groupwareWebController" class="com.bccl.groupware.web.controller.GroupwareWebController" /> 

<%
            String deptStr ="";

            deptStr+="<select class=\"normal\" name=\"deptCode\" id=\"deptCode\">\n";

			String compCode = (String)request.getParameter("companyCode");

            if(compCode== null || compCode.equals("0")){

                deptStr+="<option value=0>Select a Department</option>";

            }else{

                deptStr+="<option value=all>ALL</option>";

                if(!(compCode.equals("all"))){

                    ArrayList deptList = new ArrayList();
                    compCode = compCode.substring(0,compCode.indexOf("|"));
                    deptList = groupwareWebController.getDeptList(compCode);

                    for (int ii=0; ii<deptList.size(); ii++){
                        String deptArr[] = (String[])deptList.get(ii);
                          deptStr+="<option value=\""+deptArr[0]+"|"+deptArr[1]+"\" style=normal>"+deptArr[1]+"</option>";
                    }
                }
            }

            deptStr+="</select>";
            out.println(deptStr);
%>