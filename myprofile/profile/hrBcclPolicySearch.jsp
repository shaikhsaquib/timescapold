<script Language="JavaScript" src="../jscripts/bcclSearchNomineeDetails.js"></script>

<form name="viewNomineeForm" method="POST">

<input type="hidden" name="addIndex">
<input type="hidden" name="userOIddhidden">
<input type="hidden" name="nomineeId">
<input type="hidden" name="nomineeNameHidden">
<input type="hidden" name="nomineeLocationHidden">
<input type="hidden" name="nomineeRelationHidden">
<input type="hidden" name="nomineeDOBHidden">
<input type="hidden" name="nomineeGenderHidden">
<%
String userOId="";
String myGender="";
%>
<!-- <div class = "blueheaderCopy" align="right"><a href="http://www.rakshatpa.com/ClaimIntimation.jsp" target="_new">Raksha TPA Claim Intimation</a></div> -->

</br><div class = "blueheaderCopy" >Instructions:</div>
<span class="normal">Kindly key in your nominees' name and choose the right relationship, date of birth and gender. In the location field, fill in the details where the nominee is currently residing. When you click on the <strong>add</strong> link the information is submitted. 
< In case you need to change some information, kindly click on the delete link and delete the entire line. Then add a new entry again.><strong class="bold1"> <br />
Do not enter your own profile information. </strong></span><br/>
</br>
<div class = "line"></div>
<table border = "0" cellspacing="3" cellpadding="0" width = "100%">
	<tr>
		<td class="white" align = "left" width="5%" height="20" bgcolor = "#000000"> Sr. No.</td>
		<td class="white" align = "left" width="10%" height="20" bgcolor = "#000000"> Name of Family Member</td>
		<td class="white" align = "left" width="10%" height="20" bgcolor = "#000000"> Location </td>
		<td class="white" align = "left" width="10%" height="20" bgcolor = "#000000"> Relationship </td>
		<td class="white" align = "left" width="20%" height="20" bgcolor = "#000000"> Date of Birth</td>
		<td class="white" align = "left" width="15%" height="20" bgcolor = "#000000"> Gender</td>
		<td class="white" align = "left" width="15%" height="20" bgcolor = "#000000"> Last Updated On</td>
		<td class="white" align = "left" width="15%" height="20" bgcolor = "#000000"> Submit</td>
		</tr>
<%
		for (int i=0;i<nomineeCount;i++) {	
	

			String nominees[ ]= (String[]) nomineeDetails.get(i);
			userOId = nominees[0];
			//out.println("userOId====="+userOId);
			//out.println("gender====="+nominees[12]);
			myGender=nominees[12];
%>			

			<tr>
					<td width="5%" height="25" class = "small"  align="center"> <%=(i+1)%></td>				
					<td width="10%" height="25" class = "small"> <%=nominees[2].toUpperCase()%></td>
					<td width="10%" height="25" class = "small"> <%=nominees[3]%></td>				
					<td width="10%" height="25" class = "small"> <%=nominees[4]%></td>				
					<td width="20%" height="25" class = "small"> <%=nominees[5]%></td>
 					
					<td width="15%" height="25" class = "small"> 
<% 
	
	if(nominees[6].equals("M")) {
		if(nominees[4].equals("Parent") || nominees[4].equals("Parent-In-Law")){
			parentGender = "M"+parentGender;
		}
		out.println("Male"); 
	} 
	else if (nominees[6].equals("F")) {
		if(nominees[4].equals("Parent") || nominees[4].equals("Parent-In-Law")){
			parentGender = parentGender+"F";
		}
		out.println("Female"); 
	}
	else {
		out.println(nominees[6]);
	}
%>
					</td>	
					
 					<td width="15%" height="25" class = "small"> <%=nominees[10]%></td>
					<!-- <td height="25" class = "small"><A HREF="javascript:deleteNominee(<%=nominees[0]%>,'<%=Utility.replaceQuoteJS(nominees[1])%>','<%=nominees[2]%>','<%=nominees[3]%>','<%=nominees[4]%>','<%=nominees[5]%>')">delete</A>&nbsp;</td> -->
					<td height="25" width="15%" class = "small" ><A HREF="javascript:deleteNominee(<%=nominees[0]%>,<%=nominees[1]%>,'<%=Utility.replaceQuoteJS(nominees[2])%>','<%=nominees[3]%>','<%=nominees[4]%>','<%=nominees[5]%>','<%=nominees[6]%>')">delete</A>&nbsp;</td>
			</tr>



<%
			if(nominees[4].equals("Spouse"))
				spouseCount++;
			if(nominees[4].equals("Child"))
				childrenCount++;
			if(nominees[4].equals("Parent"))
				parentCount++;
			if(nominees[4].equals("Parent-In-Law"))
				inlawCount++;
			
		}

        if(!(myGender.equalsIgnoreCase("Mr.")) && !(myGender.equalsIgnoreCase("Mr"))) {
            selfGender = "F";
        } else {
            selfGender = "M";
        }
        //out.println(selfGender);
		int jj = 0;
		for (int i=nomineeCount; i<5;i++) {
%>
			<tr>
				<td  height="25" class = "small" align="center"><%=(i+1)%></td>				
				<td height="25" class = "small"><input name="nomineeName" type="text" size="30" maxlength="100" class = "small"/></td>				
				<td height="25" class = "small"><input name="nomineeLocationName" type="text" size="20" maxlength="100" class = "small"/></td>
				<td height="25" class = "small"><select name="nomineeRelationship" class = "small">
					  
					  <%
						  
						  if(spouseCount<1)
								out.println("<option value=\"Spouse\">Spouse</option>");
						  if(childrenCount<2)
								out.println("<option value=\"Child\">Dependent Child</option>");

						  if(inlawCount == 0 && parentCount < 2 ) {

								out.println("<option value=\"Parent\">Dependent Parent</option>");
                          }

						  if(parentCount == 0 && inlawCount < 2) {
								
								if(!(userTitle.equalsIgnoreCase("Mr.")) && !(userTitle.equalsIgnoreCase("Mr"))) {

    								out.println("<option value=\"Parent-In-Law\">Dependent Parent-In-Law</option>");
								}
							}

						%>
					  </select>
				</td>			
				<td height="25" class = "small">
					<select name="day" class="small">
					    <%=HtmlUtil.getDayList("0")%>
					</select>
					<select name="month" class="small">
					    <%=HtmlUtil.getMonthList("0")%>
					</select>
					<select name="year" class="small">
					    <%=HtmlUtil.getYearList(1920,today.get(Calendar.YEAR),today.get(Calendar.YEAR),"desc")%>
					</select>
				</td>				
				<td height="25" class = "small"><select name="nomineeGender" class = "small">
					  <option value="M">Male</option>
					  <option value="F">Female</option>
					</select>
				</td>	
					<td height="25" class = "small"></td>
					<td height="25" class = "small"><A HREF="javascript:validate(<%=userOId%>,<%=jj++%>)">add</A>&nbsp;</td>
			</tr>
<%
		}							
%>
		  <tr>
             <td colspan = "100%" align = "center">
                <div class="line"></div>
                </br>
                <div class = "bold"  align="left">
					<p><span class="blueheaderCopy">Types of updations you can make online:</span>	              <br />
						<span class="normal">Add dependents and their details in case there is a change due to marriage or birth of a child in your family.</span></p>
					<p><strong class="blueheaderCopy">If the details shown are incorrect or You want to delete a dependent&rsquo;s details</strong><span class="header"><br />
					</span><span class="normal">Please write a mail   to <a href="mailto:prathmesh.bhosale@timesgroup.com"  class="underline">corporatehr@timesgroup.com</a> outlining   the discrepancy and we will make the necessary change in the   system.</span></p>
					<p><span class="hrblue">For more details, please review the policy on TIMESCAPE   under Essentials &nbsp; &gt; &nbsp; Policies &nbsp; &gt; &nbsp; Mediclaim Insurance Scheme. </span><span class="normal"><br />
					  <br />
					  </span></p>
                </div>
			</td>
          </tr>
          <tr>
             <td colspan = "100%" align = "center"></br>
                <div class = "bold"  align="left">  Disclaimer: 
                I hereby confirm that I have read & understood the Comprehensive Mediclaim Insurance Scheme of Bennett Coleman & Co. Ltd. </br>
                The information furnished by me in the above form is true to the best of my knowledge and belief. I also understand that in case of wrongful disclosure on my part, I will stand ineligible from the benefits of this scheme.
				</div>
             </td>
          </tr>