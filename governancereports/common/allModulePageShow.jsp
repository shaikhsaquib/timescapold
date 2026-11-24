<%--
 -- Governance Code
 -- @(#)countReport.jsp	11/05/2011
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Sachin Kale
 -- @version 	1.00, 04-DEC-2011
 --%>
<jsp:useBean id="domainObjectsWebController" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" scope="session"/>

    <!--<script Language="JavaScript" src="../jscripts/allModuleReports.js"></script>-->
	<%
	String selectedModule  = (String) session.getAttribute("selectedModule");
	%>
    <table width="100%" border="0" cellpadding="0" cellspacing="3">
	<tr width="100%" >
		<td class="style4" width = "10">Company</td>
		<td bgcolor="#fbfbfb" width = "20">
		 <%@ include file="../common/showCompaniesShow.jsp" %></td>
         
<%
         if (companyCode.equals("1000") || timescapeUserOId == 16666){
%>
         <td class = "style4" height = "10" width = "15">Dept</td>
         <td bgcolor="#fbfbfb" width = "20">
         <%@ include file="../common/showDepartments.jsp" %></td>
		 
		 <td class = "style4" height = "10" width = "15">Function</td>
         <td bgcolor="#fbfbfb" width = "20">
		 <div id="functionDiv">
		 <select name="selectedFunct" class="normal">
        <option value="0">Select a Function</option>
		</select>
		 </div>
		 </td>
		 

<%
        }
%>
<%
        if (timescapeUserOId == 11072 || timescapeUserOId == 24866 || timescapeUserOId == 26670){
%>

             <td class = "style4" height = "10" width = "15">Module</td>
             <td class = "normal" width = "15"><select name="module" class="normal">
             <option value="0" class="normal">Select Module</option>
             <option value="OCA" class="normal" <%=("OCA".equals(selectedModule)?"selected":"")%>>OCA</option>             
             </select>
             </td>
<%
        }else{
%>
             <td class = "style4" height = "10" width = "15">Module</td>
             <td class = "normal" width = "15"><select name="module" class="normal">
             <option value="0" class="normal">Select Module</option>
             <option value="OCA" class="normal" <%=("OCA".equals(selectedModule)?"selected":"")%>>OCA</option>
             <option value="CODE" class="normal" <%=("CODE".equals(selectedModule)?"selected":"")%>>CODE</option>
             <option value="QUIZ" class="normal" <%=("QUIZ".equals(selectedModule)?"selected":"")%>>QUIZ</option>
             </select>
             </td>
<%
        }
%>
         <!-- <td><img src="../images/orangearrow.gif" border="0" onclick="showDepartmentsShow()"></td>
 -->
<%
         if (companyCode.equals("1000") || timescapeUserOId == 16666 ){
%>		
		<td> <input type="button" name="GO" value="GO" class="normal" onclick="showDepartmentsShow()"></td>
<%
        }else{
%>
		<td> <input type="button" name="GO" value="GO" class="normal" onclick="showDepartmentsShowEx()"></td>
<%
        }
%>

    </tr>
 </table>
<!-- <script Language="JavaScript">

    showDepartmentsCode();
</script>
 -->