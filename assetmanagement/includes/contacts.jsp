<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="groupwareWebController" class="com.bccl.groupware.web.controller.GroupwareWebController" /> 
<link href="../style/common.css" rel="stylesheet" type="text/css"/>
<%
Hashtable searchHash = new Hashtable();
String name = (String)request.getParameter("name");
String selectedOpt  = (String)request.getParameter("selectedOpt");
String tblId1  = (String)request.getParameter("tblId");

String commonStr  = "";

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
  			    reqFirstName = reqFirstName.toUpperCase();
				reqLastName = "";

                searchHash.put("name", reqFirstName);

			}else{

				reqFirstName = name.substring(0, name.lastIndexOf(" "));
				reqLastName  = name.substring(name.lastIndexOf(" ") + 1, name.length());
  			    reqFirstName = reqFirstName.toUpperCase();
  			    reqLastName  = reqLastName.toUpperCase();

                searchHash.put("firstName", reqFirstName);
                searchHash.put("lastName", reqLastName);
			}
        }
    }
 
    ArrayList contactsList = new ArrayList();
    contactsList = groupwareWebController.peopleLocator(searchHash);
%>
<table width="100%" border="0" cellspacing="2" cellpadding="0">
    <tr bgcolor ="#000000">
		<td class="whitenormal" align="left" width="3%" height="20px">
			N0.
		</td>
		<!-- <td class="whitenormal" align="left" width="20%">
			Name
		</td> -->
		<td class="whitenormal"  align="left" width="15%">
			Email-Id
		</td>
<!--		<td class="whitenormal" align="left" width="15%">
			Company
		</td>
        <td class="whitenormal" align="left" width="13%">
			Location
		</td>
		<td class="whitenormal" align="left" width="18%">
			Designation
		</td>-->
		<td class="whitenormal" align="left" width="12%">
			Phone
		</td>
		<td class="whitenormal" align="left" width="10%">
			Extn
		</td>
<!--		
        <td class="whitenormal" align="left" width="10%">
			Board No
		</td>
        <td class="whitenormal" align="left" width="10%">
			Hotline
		</td>
-->	
        <td class="whitenormal" align="left" width="12%">
			Mobile
		</td>
		<td class="whitenormal" align="left" width="5%">
			Action
		</td>
    </tr>
<%  
  
    if(contactsList.size()>0){
        String color="";
        for(int ii=0;ii<contactsList.size();ii++){
            String contactsArr[] = (String[])contactsList.get(ii);
            if(ii%2!=0)
                color="#EFEFEF";
            else
                color="#FFFFFF";
%>
    <tr bgcolor ="<%=color%>">
		<td class="normal" align="left" height="20px">
            <%=(ii+1)%>
		</td>
		
		<td class="normal" align="left">
			<a href="mailto:<%=contactsArr[1]%>" class="normal"><%=contactsArr[1]%></a>
		</td>
<!--		<td class="normal" align="left">
			<%=contactsArr[3]%>
		</td>
        <td class="normal" align="left">
			<%=contactsArr[5]%>
		</td>
		<td class="normal" align="left">
			<%=contactsArr[7]%>
		</td>-->
		<td class="normal" align="left">
			<%=contactsArr[8]%>
		</td>
		<td class="normal" align="left">
			<%=contactsArr[11]%>
		</td>
<!--	
        <td class="normal" align="left">
			<%=contactsArr[10]%>
		</td>
	
         <td class="normal" align="left">
			<%=contactsArr[12]%>
		</td> 
        -->

        <td class="normal" align="left">
			<%=contactsArr[13]%>
		</td>
		<td class="normal" align="left">
			<a href="#" onClick="add('<%=tblId1%>','<%=contactsArr[1]%>','<%=tblId1+"H"%>','<%=contactsArr[0]%>','<%=tblId1+"N"%>','<%=contactsArr[2]%>');" class="underline">add</a>
		</td>
	</tr>
	<tr>
		<td class="normal" colspan="100%" height="2px"align="center">
			&nbsp;
		</td>
	</tr>
<%
        }//end of for
   }//end of if
   else{
%>
	<tr>
		<td class="normal" colspan="100%" height="25px"align="center">
			No Members found for the selected Criteria!!
		</td>
	</tr>
<%
   }
%>
</table>