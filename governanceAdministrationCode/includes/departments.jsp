<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>

<%
            String deptStr ="";
            String compname ="";

            deptStr+="<select class=\"normal\" name=\"deptCode\" id=\"deptCode\">\n";

			String compCode = (String)request.getParameter("companyCode");
			compCode = compCode.substring(0,compCode.indexOf("|"));
			//System.out.println("compCode--"+compCode);
			

            if(compCode== null || compCode.equals("0")){

                deptStr+="<option value=0>Select a Department</option>";

            }	
			else if(compCode.equals("1000"))
			{
					ArrayList deptList = new ArrayList();
					
					deptList = governanceadministrationcode.getDeptList(compCode);

					for (int ii=0; ii<deptList.size(); ii++){
					String deptArr[] = (String[])deptList.get(ii);
					deptStr+="<option value=\""+deptArr[0]+"|"+deptArr[1]+"\" style=normal>"+deptArr[1]+"</option>";
			}

            }else
			{
				deptStr+="<option value=NA>NA</option>";

			}	

           deptStr+="</select>";
           out.println(deptStr);
%>