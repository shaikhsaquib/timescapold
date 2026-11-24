<select name = "vendorEmail" class="small">
	<option value ="0">select vendors email-Id</option>
<%
    ArrayList vendorsIdList = new ArrayList();
out.print(companyCode);
out.print(branchCode);
		vendorsIdList = businessCardUserWebController.getVendorsEmailId(companyCode, branchCode);

    if(vendorsIdList != null && vendorsIdList.size()>0){

        for(int jj=0; jj<vendorsIdList.size(); jj++){

            String tmpStrArr[]=(String[ ]) vendorsIdList.get(jj);


%>
	<option value = "<%=tmpStrArr[5]%>"><%=tmpStrArr[5]%></option>
<%
	out.println(tmpStrArr[5]);
       }//End of for
   }//End of if
%>
</select>