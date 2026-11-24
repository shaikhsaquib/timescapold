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

    <script Language="JavaScript" src="../jscripts/allModuleReports.js"></script>
	<%
	  selectedModule  = (String) session.getAttribute("selectedModule");
	%>
    <table width="100%" border="0" cellpadding="0" cellspacing="3">
	<tr width="100%">
		<td class="style4" width = "10">Company</td>
		<td bgcolor="#fbfbfb" width = "20">
		 <%@ include file="../common/showCompaniesOca.jsp" %></td>
        <!-- <td class = "style4" height = "30" width = "10">Department&nbsp;<span class = "rednormal"></span></td>
		 <td class = "normal" height = "30" id = "compDepartment" width = "20"></td> -->
         <td class = "style4" height = "10" width = "15">Module</td>
         <td class = "normal" width = "15"><select name="module" class="normal">
             <option value="0" >Select Module</option>
             <option value="OCA"  <%=("OCA".equals(selectedModule)?"selected":"")%>>OCA</option>
             <option value="CODE"  <%=("CODE".equals(selectedModule)?"selected":"")%>>CODE</option>
             <option value="QUIZ"  <%=("QUIZ".equals(selectedModule)?"selected":"")%>>QUIZ</option>
             </select>
             </td>
         <td>
		 <!-- <img src="../images/orangearrow.gif" border="0" onclick="showDepartmentsOca()"></td> -->
		 <input type="button" name="GO" value="GO" class="normal" onclick="showDepartmentsOca()"></td>
    </tr>
 </table>
<!-- <script Language="JavaScript">

    showDepartmentsCode();
</script>
 -->