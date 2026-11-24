<%
		if(myClaimRequestDetail[12].equals("A")){
%>
			Kindly fill the form by clicking on the request no.
<%
		}else if(myClaimRequestDetail[12].equals("L")){
%>
			Kindly check the claim details by clicking on the request no.
<%
		}else if(myClaimRequestDetail[12].equals("AR") || myClaimRequestDetail[12].equals("AF")){
			
/*			Object objArr1[] = new Object[2];
			objArr1[0] = "'DD-MON-YYYY'";
			objArr1[1] = myClaimRequestDetail[1];

			claimFormDetailHash.put("queryId", "1000");
			claimFormDetailHash.put("arguments", objArr1);

			myClaimFormDetails = insuranceClaimController.viewClaimDetails(claimFormDetailHash);

			for (int j = 0; j < myClaimFormDetails.size(); j++)
			{
				String claimFormDetail[] = (String[]) myClaimFormDetails.get(j);

				Hashtable claimFormDetailHash = xmlObj.readSubNode(claimFormDetail[15],"reviewer");
*/
%>
					<%//=(String)claimFormDetailHash.get("remark-"+(j+1))%>
			Kindly check the Approver remark by clicking on the request no.
<%
		}else if(myClaimRequestDetail[12].equals("R")){
%>
			Claim has been rejected.Kindly check the approver's remark by clicking on the request no.
<%
		}else if(myClaimRequestDetail[12].equals("W")){
%>
			You have withdrawn the claim.
<%
		}else if(myClaimRequestDetail[12].equals("IR")){
%>
			The claim has been rejected by the Insurance company. Kindly check the approver's remark by clicking on the request no.
<%
		}else if(myClaimRequestDetail[12].equals("S")){
%>
			The claim has been settled by the Insurance company. Kindly check by clicking on the request no.
<%
		}else if(myClaimRequestDetail[12].equals("UF")){
%>
			The form has been sent for approval.
<%
		}else if(myClaimRequestDetail[12].equals("P")){
%>
			The courier details have been accepted by the Approver. Claim has been forwaded to Insurance company.
<%
		}else if(myClaimRequestDetail[12].equals("HA")){
%>
			The claim has been accepted by the Approver. The Approver will send the Surveyor details and form shortly.
<%
		}else if(myClaimRequestDetail[12].equals("UC")){
%>
			You have sent the courier to the Approver.
<%
		}else if(myClaimRequestDetail[12].equals("AC")){
%>
			The approver has asked for some more documnets. Kindly check the Approver remark by clicking on the request no.
<%
		}else if(myClaimRequestDetail[12].equals("H")){
%>
			The approver has put your request on hold. Kindly check the Approver remark by clicking on the request no.
<%
		}
%>
			
			
