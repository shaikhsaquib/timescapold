<jsp:useBean id="sendImapMessage" class="com.bccl.util.SendImapMessage"/>
<%
/*
		String[] northEast = {"Delhi","Jaipur","Chandigarh","Kolkata","Bhopal","Lucknow","Patna"};
		String[] southWest = {"Mumbai","Pune","Ahmedabad","Chennai","Cochin","Hyderabad","Kandivali","Bangalore"};
		
		String northEastStr				= "jayant.anantpurkar@timesgroup.com";
		String southWestStr				= "arvind.nair@timesgroup.com";
*/
		StringBuffer content	        = new StringBuffer();
		String frmAddr			        = "timescape.admin@timesgroup.com";
		String toAddr					= "timescape.admin@timesgroup.com";
		String ccAddr					= "timescape.admin@timesgroup.com";
		String subject			        = "Alteration to the nomination by " + fullName;
		Hashtable emailHash				= new Hashtable();

		int iCompany = Integer.parseInt(companyCode);
		//out.println("Company Code = "+iCompany);

		switch(iCompany){
			case 1:
			// do nothing
			break;

			case 20:
			// do nothing
			break;

			case 27:
			// do nothing
			break;

			case 42:
				toAddr = "rajesh.dalvi@timesgroup.com";
				ccAddr = "lara.gomes@timesgroup.com";
			break;

			default:
			// do nothing
		}
	
		//System.out.println("Company Code : "+iCompany);

/*
		for(int ii=0;ii<northEast.length;ii++){
			if(northEast[ii].equals(locationName)){
				toAddr = northEastStr;
				break;
			}
		}

		for(int ii=0;ii<southWest.length;ii++){
			if(southWest[ii].equals(locationName)){
				toAddr = southWestStr;
				break;
			}
		}
*/
		
		if(request.getParameter("addIndex")!=null && !request.getParameter("addIndex").equals("null") && !request.getParameter("addIndex").trim().equals("")){

			content.append("Dear H.R.\n").append(title).append(" ").append(fullName).append(" ").append("has successfully added ").append(nomineeNameStr).append(" as a nominee.");

			//Append the details of Nominee
			content.append("\n\nThe Added Nominee Details are as follows:\nName :").append(nomineeNameStr).append("\nLocation :").append(nomineeLocationStr).append("\nRelation :").append(nomineeRelationshipStr).append("\nDate Of Birth :").append(nomineeDOBStr).append("\nGender :").append(nomineeGenderStr);

			//Append the details of the employee
			content.append("\n\nThe Details of the Employee are as follows:\nName :").append(title).append(" ").append(fullName).append("\nPay Roll ID :").append(payId).append("\nEmployee Code :").append(empCode).append("\nCompany Code :").append(companyCode).append("\nCompany Name :").append(companyName).append("\nBranch Code :").append(branchCode).append("\nBranch Name :").append(branchName).append("\nLocation Code :").append(locationCode).append("\nLocation Name :").append(locationName).append("\nActivity Code :").append(activityCode).append("\nActivity Name :").append(activityName).append("\nDesignation :").append(designation).append("\nDepartment Name :").append(deptName).append("\nDate Of Birth :").append(birthdate.substring(0,birthdate.indexOf(" ")));

		}
		else if(request.getParameter("nomineeId")!=null && !request.getParameter("nomineeId").equals("null") && !request.getParameter("nomineeId").trim().equals("")){

				content.append("Dear H.R.\n").append(title).append(" ").append(fullName).append(" ").append("has successfully deleted ").append(nomineeNameStr).append(" from the nominee list.");

				//Append the details of Nominee
				content.append("\n\nThe Deleted Nominee Details are as follows:\nName :").append(nomineeNameStr).append("\nLocation :").append(nomineeLocationStr).append("\nRelation :").append(nomineeRelationshipStr).append("\nDate Of Birth :").append(nomineeDOBStr).append("\nGender :").append(nomineeGenderStr);

				//Append the details of the employee
				content.append("\n\nThe Details of the Employee are as follows:\nName :").append(title).append(" ").append(fullName).append("\nPay Roll ID :").append(payId).append("\nEmployee Code :").append(empCode).append("\nCompany Code :").append(companyCode).append("\nCompany Name :").append(companyName).append("\nBranch Code :").append(branchCode).append("\nBranch Name :").append(branchName).append("\nLocation Code :").append(locationCode).append("\nLocation Name :").append(locationName).append("\nActivity Code :").append(activityCode).append("\nActivity Name :").append(activityName).append("\nDesignation :").append(designation).append("\nDepartment Name :").append(deptName).append("\nDate Of Birth :").append(birthdate.substring(0,birthdate.indexOf(" ")));
		}

		if(content.length()>0){
		
			emailHash.put("fromAddr", frmAddr);
			emailHash.put("toAddr", toAddr);
			emailHash.put("subject", subject);
			emailHash.put("content", content.toString());
			emailHash.put("ccAddr", ccAddr);

			sendImapMessage.sendMail(emailHash);
		}
%>