<%
	//out.println("myClaimRequestValues[1]== "+myClaimRequestValues[1]+"\n");
	//out.println("myClaimRequestValues[12]== "+myClaimRequestValues[12]+"\n");
	//out.println("attacmentClaimDetails "+attacmentClaimDetails.get("claimFormValue-"));
	String formName = (String)attacmentClaimDetails.get("claimFormValue-");
	System.out.println(formName);
	System.out.println((myClaimRequestValues[12]));
	if(myClaimRequestValues[12].equals("UF")){
		if(formName.equals("Fire Insurance Claim Form"))
		{
%>
			<a href = "../approver/approveClaimForms/approveFireInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
			
<%
		}
		else if(formName.equals("Marine Insurance Inland Transit Claim Form"))
		{
%>
			<a href = "../approver/approveClaimForms/approveMarineInlandInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=formName%></a>
			
			
<%
		}
        else if(formName.equals("Electronic Equipment Claim Form"))
		{
%>
			<a href = "../approver/approveClaimForms/approveEeiClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=formName%></a>
			
			
<%
		}
         else if(formName.equals("Group Term Life Insurance Claim Form"))
		{
%>
			<a href = "../approver/approveClaimForms/approveGtiClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=formName%></a>
			
			
<%
		}
        else if(formName.equals("GPA Claim Form"))
		{
%>
			<a href = "../approver/approveClaimForms/approveGpaClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=formName%></a>
			
			
<%
		}
        else if(formName.equals("Marine Inland Miscellaneous Claim Form"))
		{
%>
			<a href = "../approver/approveClaimForms/approveMarineInlandMiscellaneousInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=formName%></a>
			
			
<%
		}
		else if(formName.equals("Marine Insurance Import Transit Claim Form"))
		{
%>
			<a href = "../approver/approveClaimForms/approveMarineImportInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=formName%></a>			
<%
		}
		else if(formName.equals("Marine Insurance Container Transit Claim Form"))
		{
%>
			<a href = "../approver/approveClaimForms/approveMarineContainerInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=formName%></a>
<%
		}
		else if(formName.equals("All Risk Claim Form"))
		{
%>
			<a href = "../approver/approveClaimForms/approveAllRiskInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=formName%></a>			
			
<%
		}else if(formName.equals("Generic Claim Form"))
		{
%>
			<a href = "../approver/approveClaimForms/approveGenericClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=formName%></a>
			
<%
		}
%>

			<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Date of Submission of Documents</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left"><%=myClaimRequestValues[14]%>
			</td></tr>
<%
	}else if (myClaimRequestValues[12].equals("HA")){
		if(role.equals("2") || role.equals("3") )
		{
%>
			Not applicable
			<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Surveyor Details</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left"><a href = "../approver/surveyorDetails.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>">Surveyor Details</a>
			</td></tr>
			
<%
		}else{
%>
			Not applicable
<%
		}
		}
		else if (myClaimRequestValues[12].equals("A")){
		if(formName.equals("Fire Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/fireClaim/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
			
<%
		}
		else if(formName.equals("Marine Insurance Inland Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineInlandClaim/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
			
<%
		}

        else if(formName.equals("GPA Claim Form"))
		{
%>
			<a href = "../claimForms/GPAClaim/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
			
<%
		}
        else if(formName.equals("Electronic Equipment Claim Form"))
		{
%>
			<a href = "../claimForms/EEIClaim/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
			
<%
		}
        else if(formName.equals("Group Term Life Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/GTIClaim/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
			
<%
		}
        else if(formName.equals("Marine Inland Miscellaneous Claim Form"))
		{
%>
			<a href = "../claimForms/marineMiscellaneousClaim/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
			
<%
		}
		else if(formName.equals("Marine Insurance Import Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineImportClaim/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>			
			
<%
		}
		else if(formName.equals("Marine Insurance Container Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineContainerClaim/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>			
			
<%
		}
		else if(formName.equals("All Risk Claim Form"))
		{
%>
			<a href = "../claimForms/allRiskClaim/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
			
<%
		}
		else if(formName.equals("Generic Claim Form"))
		{
%>
			<a href = "../claimForms/genericClaim/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>"><%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
			
<%
		}
	}else if (myClaimRequestValues[12].equals("AR")){
		if(formName.equals("Fire Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/fireClaim/updateFireInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Inland Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineInlandClaim/updateMarineInlandInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
	    else if(formName.equals("Marine Inland Miscellaneous Claim Form"))
		{
%>
			<a href = "../claimForms/marineMiscellaneousClaim/updateMarineInlandMiscellaneousClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Import Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineImportClaim/updateMarineImportInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Container Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineContainerClaim/updateMarineContainerInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("All Risk Claim Form"))
		{
%>
			<a href = "../claimForms/allRiskClaim/updateAllRiskInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Generic Claim Form"))
		{
%>
			<a href = "../claimForms/genericClaim/updateGenericClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
%>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Date of Submission of Documents</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left"><%=myClaimRequestValues[14]%>
			</td></tr>
<%
	}else if(myClaimRequestValues[12].equals("AF")){
		if(formName.equals("Fire Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/fireClaim/viewFireInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>			
<%
		}
		else if(formName.equals("Marine Insurance Inland Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineInlandClaim/viewMarineInlandInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("GPA Claim Form"))
		{
%>
			<a href = "../claimForms/GPAClaim/viewGpaClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Electronic Equipment Claim Form"))
		{
%>
			<a href = "../claimForms/EEIClaim/viewEeiClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Group Term Life Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/GTIClaim/viewGtiClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
        else if(formName.equals("Marine Inland Miscellaneous Claim Form"))
		{
%>
			<a href = "../claimForms/marineMiscellaneousClaim/viewMarineInlandMiscellaneousClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Import Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineImportClaim/viewMarineImportInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Container Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineContainerClaim/viewMarineContainerInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}	
		else if(formName.equals("All Risk Claim Form"))
		{
%>
			<a href = "../claimForms/allRiskClaim/viewAllRiskInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Generic Claim Form"))
		{
%>
			<a href = "../claimForms/genericClaim/viewGenericClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
%>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Date of Submission of Documents</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left"><%=myClaimRequestValues[14]%>
			</td></tr>	

		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Courier Details</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left">
				<a href = "../common/courierDetails.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>">Fill Courier Details</a>
			</td></tr>
<%
	}else if(myClaimRequestValues[12].equals("UC")){
		if(formName.equals("Fire Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/fireClaim/viewFireInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Inland Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineInlandClaim/viewMarineInlandInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
	     else if(formName.equals("GPA Claim Form"))
		{
%>
			<a href = "../claimForms/GPAClaim/viewGpaClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
	     else if(formName.equals("Electronic Equipment Claim Form"))
		{
%>
			<a href = "../claimForms/EEIClaim/viewEeiClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Group Term Life Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/GTIClaim/viewGtiClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
	    else if(formName.equals("Marine Inland Miscellaneous Claim Form"))
		{
%>
			<a href = "../claimForms/marineMiscellaneousClaim/viewMarineInlandMiscellaneousClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Import Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineImportClaim/viewMarineImportInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("Marine Insurance Container Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineContainerClaim/viewMarineContainerInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("All Risk Claim Form"))
		{
%>
			<a href = "../claimForms/allRiskClaim/viewAllRiskInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Generic Claim Form"))
		{
%>
			<a href = "../claimForms/genericClaim/viewGenericClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
%>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Date of Submission of Documents</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left"><%=myClaimRequestValues[14]%>
			</td></tr>
<%
	if(role.equals("2") || role.equals("3") )
	{
%>

		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Courier Details</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left">
			<a href = "../common/updateCourierDetails.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>" class="style3Underline" >Courier Details</a>
			</td></tr>
<%
	}
	}else if(myClaimRequestValues[12].equals("AC")){
		if(formName.equals("Fire Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/fireClaim/viewFireInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Inland Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineInlandClaim/viewMarineInlandInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Import Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineImportClaim/viewMarineImportInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("Marine Insurance Container Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineContainerClaim/viewMarineContainerInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("All Risk Claim Form"))
		{
%>
			<a href = "../claimForms/allRiskClaim/viewAllRiskInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Generic Claim Form"))
		{
%>
			<a href = "../claimForms/genericClaim/viewGenericClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
%>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Date of Submission of Documents</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left"><%=myClaimRequestValues[14]%>
			</td></tr>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Courier Details</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left">
				<a href = "../common/courierDetails.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>" class="style3Underline" >Courier Details</a>
			</td></tr>
<%
	}else if(myClaimRequestValues[12].equals("P")){
		if(formName.equals("Fire Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/fireClaim/viewFireInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Inland Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineInlandClaim/viewMarineInlandInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
        else if(formName.equals("GPA Claim Form"))
		{
%>
			<a href = "../claimForms/GPAClaim/viewGpaClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		 else if(formName.equals("Electronic Equipment Claim Form"))
		{
%>
			<a href = "../claimForms/EEIClaim/viewEeiClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Group Term Life Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/GTIClaim/viewGtiClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Inland Miscellaneous Claim Form"))
		{
%>
			<a href = "../claimForms/marineMiscellaneousClaim/viewMarineInlandMiscellaneousClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Import Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineImportClaim/viewMarineImportInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("Marine Insurance Container Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineContainerClaim/viewMarineContainerInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("All Risk Claim Form"))
		{
%>
			<a href = "../claimForms/allRiskClaim/viewAllRiskInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Generic Claim Form"))
		{
%>
			<a href = "../claimForms/genericClaim/viewGenericClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
%>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Date of Submission of Documents</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left"><%=myClaimRequestValues[14]%>
		</td></tr>
		<!-- <tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Courier Details</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left">
				<a href = "../common/updateCourierDetails.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>" class="style3Underline" >Courier Details</a>
			</td></tr> -->
<%
	}else if(myClaimRequestValues[12].equals("IR")){
		if(formName.equals("Fire Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/fireClaim/viewFireInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Inland Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineInlandClaim/viewMarineInlandInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Import Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineImportClaim/viewMarineImportInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("Marine Insurance Container Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineContainerClaim/viewMarineContainerInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("All Risk Claim Form"))
		{
%>
			<a href = "../claimForms/allRiskClaim/viewAllRiskInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Generic Claim Form"))
		{
%>
			<a href = "../claimForms/genericClaim/viewGenericClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
%>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Date of Submission of Documents</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left"><%=myClaimRequestValues[14]%>
			</td></tr>
		<!-- <tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Courier Details</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left">
				<a href = "../common/updateCourierDetails.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>" class="style3Underline" >Courier Details</a>
			</td></tr> -->
<%
	}else if(myClaimRequestValues[12].equals("S")){
		if(formName.equals("Fire Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/fireClaim/viewFireInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Inland Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineInlandClaim/viewMarineInlandInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("GPA Claim Form"))
		{
%>
			<a href = "../claimForms/GPAClaim/viewGpaClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
	    else if(formName.equals("Electronic Equipment Claim Form"))
		{
%>
			<a href = "../claimForms/EEIClaim/viewEeiClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Group Term Life Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/GTIClaim/viewGtiClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Inland Miscellaneous Claim Form"))
		{
%>
			<a href = "../claimForms/marineMiscellaneousClaim/viewMarineInlandMiscellaneousClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Import Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineImportClaim/viewMarineImportInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("Marine Insurance Container Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineContainerClaim/viewMarineContainerInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("All Risk Claim Form"))
		{
%>
			<a href = "../claimForms/allRiskClaim/viewAllRiskInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Generic Claim Form"))
		{
%>
			<a href = "../claimForms/genericClaim/viewGenericClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
%>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Date of Submission of Documents</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left"><%=myClaimRequestValues[14]%>
		</td></tr>
			<!-- <a href = "../claimFormsWord/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.doc">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a> -->

		<!-- <tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Courier Details</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left">
				<a href = "../common/updateCourierDetails.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>" class="style3Underline" >Courier Details</a>
			</td></tr> -->
<%
	}else if(myClaimRequestValues[12].equals("W") && formName != null){
		if(formName.equals("Fire Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/fireClaim/viewFireInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Inland Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineInlandClaim/viewMarineInlandInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Import Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineImportClaim/viewMarineImportInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("Marine Insurance Container Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineContainerClaim/viewMarineContainerInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("All Risk Claim Form"))
		{
%>
			<a href = "../claimForms/allRiskClaim/viewAllRiskInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Generic Claim Form"))
		{
%>
			<a href = "../claimForms/genericClaim/viewGenericClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
%>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Date of Submission of Documents</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left"><%=myClaimRequestValues[14]%>
		</td></tr>
			<!-- <a href = "../claimFormsWord/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.doc">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a> -->

		<!-- <tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Courier Details</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left">
				<a href = "../common/updateCourierDetails.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>" class="style3Underline" >Courier Details</a>
			</td></tr> -->
<%
	}else if(myClaimRequestValues[12].equals("H")){
		if(formName.equals("Fire Insurance Claim Form"))
		{
%>
			<a href = "../claimForms/fireClaim/viewFireInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Inland Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineInlandClaim/viewMarineInlandInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Marine Insurance Import Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineImportClaim/viewMarineImportInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("Marine Insurance Container Transit Claim Form"))
		{
%>
			<a href = "../claimForms/marineContainerClaim/viewMarineContainerInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>

<%
		}
		else if(formName.equals("All Risk Claim Form"))
		{
%>
			<a href = "../claimForms/allRiskClaim/viewAllRiskInsuranceClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
		else if(formName.equals("Generic Claim Form"))
		{
%>
			<a href = "../claimForms/genericClaim/viewGenericClaimForm.jsp?claimNumber=<%=myClaimRequestValues[1]%>
			&requestNo=<%=requestNo%>">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a>
<%
		}
%>
		<tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Date of Submission of Documents</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left"><%=myClaimRequestValues[14]%>
		</td></tr>
			<!-- <a href = "../claimFormsWord/<%=(String)attacmentClaimDetails.get("claimFormValue-")%>.doc">
				<%=(String)attacmentClaimDetails.get("claimFormValue-")%></a> -->

		<!-- <tr>
			<td class = "style5" width = "10%" height = "30" align = "center"></td>
			<td class = "style5" width = "30%" height = "30" align = "left">Courier Details</td>
			<td class = "style5" width = "10%" height = "30" align = "center">:</td>
			<td class = "style5" width = "10%" height = "30" align = "left">
				<a href = "../common/updateCourierDetails.jsp?claimNumber=<%=myClaimRequestValues[1]%>&requestNo=<%=requestNo%>" class="style3Underline" >Courier Details</a>
			</td></tr> -->
<%
	}
%>
