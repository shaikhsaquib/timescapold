<script Language="JavaScript" src="../jscripts/thplViewNomineeDetails.js"></script>

<form name="viewNomineeForm" method="POST">

<input type="hidden" name="addIndex">
<input type="hidden" name="nomineeId">
<input type="hidden" name="nomineeNameHidden">
<input type="hidden" name="nomineeLocationHidden">
<input type="hidden" name="nomineeRelationHidden">
<input type="hidden" name="nomineeDOBHidden">
<input type="hidden" name="nomineeGenderHidden">

<table border = "0" cellspacing="0" cellpadding="0" width = "100%">

    <tr>
		<td class="small" align = "left" width="5%" height="20"> &nbsp;</td>
    	<td height="25" class = "bold"  align="left" colspan="6">  Disclaimer: </br></br>
I hereby confirm that I have read & understood the Comprehensive Mediclaim Insurance Scheme of Times Global Broadcasting Company Ltd. </br>
The information furnished by me in the above form is true to the best of my knowledge and belief. I also understand that in case of wrongful disclosure on my part, I will stand ineligible from the benefits of this scheme. 
</td>
    </tr>
	 <tr>
		<td class="small" align = "left" width="5%" height="20" colspan="100%"> &nbsp;</td>
	</tr>
	<tr>
	            
		<td class="white" align = "left" width="5%" height="20" bgcolor = "#000000"> Sr. No.</td>
		<td class="white" align = "left" width="20%" height="20" bgcolor = "#000000"> Name of Family Member</td>
		<td class="white" align = "left" width="15%" height="20" bgcolor = "#000000"> Location </td>
		<td class="white" align = "left" width="15%" height="20" bgcolor = "#000000"> Relationship </td>
		<td class="white" align = "left" width="20%" height="20" bgcolor = "#000000"> Date of Birth</td>
		<td class="white" align = "left" width="10%" height="20" bgcolor = "#000000"> Gender</td>
		<td class="white" align = "left" width="10%" height="20" bgcolor = "#000000"> Delete</td>
	</tr>
<%
		for (int i=0;i<nomineeCount;i++) {	
	

			String nominees[ ]= (String[]) nomineeDetails.get(i);
%>			

			<tr>
					<td height="25" class = "small"  align="center"> <%=(i+1)%></td>				
					<td height="25" class = "small"> <%=nominees[1].toUpperCase()%></td>
					<td height="25" class = "small"> <%=nominees[2]%></td>				
					<td height="25" class = "small"> <%=nominees[3]%></td>				
					<td height="25" class = "small"> <%=nominees[4]%></td>				
					<td height="25" class = "small"> 
<% 
	if(nominees[5].equals("M")) {
		if(nominees[3].equals("Parent") || nominees[3].equals("Parent-In-Law")){
			parentGender = "M"+parentGender;
		}
		out.println("Male"); 
	} 
	else if (nominees[5].equals("F")) {
		if(nominees[3].equals("Parent") || nominees[3].equals("Parent-In-Law")){
			parentGender = parentGender+"F";
		}
		out.println("Female"); 
	}
	else {
		out.println(nominees[5]);
	}
%>
					</td>				
					<td height="25" class = "small"><A HREF="javascript:deleteNominee(<%=nominees[0]%>,'<%=Utility.replaceQuoteJS(nominees[1])%>','<%=nominees[2]%>','<%=nominees[3]%>','<%=nominees[4]%>','<%=nominees[5]%>')">delete</A>&nbsp;</td>
			</tr>



<%
			if(nominees[3].equals("Spouse"))
				spouseCount++;
			if(nominees[3].equals("Child"))
				childrenCount++;
			if(nominees[3].equals("Parent"))
				parentCount++;
			if(nominees[3].equals("Parent-In-Law"))
				inlawCount++;
			
		}

  	    if(!(userTitle.equalsIgnoreCase("Mr.")) && !(userTitle.equalsIgnoreCase("Mr"))) {
            selfGender = "F";
        } else {
            selfGender = "M";
        }

        
		int bkkkk = 0;
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
						  if(parentCount < 2 )
								out.println("<option value=\"Parent\">Dependent Parent</option>");
	/*		
						  if(parentCount == 0 && inlawCount < 2) {
								
								//if(!(userTitle.equalsIgnoreCase("Mr.")) && !(userTitle.equalsIgnoreCase("Mr"))) 
								{
    								out.println("<option value=\"Parent-In-Law\">Dependent Parent-In-Law</option>");
								}
							}
*/
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
					<td height="25" class = "small"><A HREF="javascript:validate(<%=bkkkk++%>,'<%=empBDay%>','<%=month.get(empBMonth)%>','<%=empBYear%>','<%=curDay%>','<%=curMonth%>','<%=curYear%>')">add</A>&nbsp;</td>
			</tr>
<%
		}							
%>
</br>
<table border = "0" cellspacing="3" cellpadding="0" width = "100%">
		<tr><br>
		<td class="blueheaderCopy" width = "20%" >Declaration Submission for Top Up Insurance Scheme</td>
		</tr>
<%

		String monthArrbccl9991[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
		ArrayList resultListbccl9991  = new ArrayList();
		Hashtable detailsHashbccl9991 = new Hashtable();
		GregorianCalendar thisDaybccl9991 = new GregorianCalendar( );

		//for fayear start
		int currentMonth1bccl9991		= thisDaybccl9991.get(Calendar.MONTH);
		String currentMonthbccl9991	= monthArrbccl9991[currentMonth1bccl9991]  + "";	
		String faYearbccl9991 = thisDaybccl9991.get(Calendar.YEAR) + "";		
		//out.println("faYearbccl9991---"+faYearbccl9991);
		String nextYearbccl9991		=	thisDaybccl9991.get(Calendar.YEAR) + 1 + "";

		//if(currentMonthbccl9991.equals("JAN") || currentMonthbccl9991.equals("FEB")||currentMonthbccl9991.equals("MAR")||currentMonthbccl9991.equals("APR")||currentMonthbccl9991.equals("MAY")||currentMonthbccl9991.equals("JUN")){
		if(currentMonthbccl9991.equals("JAN") || currentMonthbccl9991.equals("FEB") ){
		faYearbccl9991 = (Integer.parseInt(faYearbccl9991)-1)+"";
		//out.println("faYearbccl9991cc---"+faYearbccl9991);
		nextYearbccl9991 = (Integer.parseInt(nextYearbccl9991)-1)+"";
		
		}  
		session.setAttribute("faYear",faYearbccl9991);
		session.setAttribute("nextYear",nextYearbccl9991);

		//for fayear end
		
		
		int currday1bccl9991		= thisDaybccl9991.get(Calendar.DAY_OF_MONTH);
		int currMonth1bccl9991		= thisDaybccl9991.get(Calendar.MONTH);
		String currDaybccl9991		= currday1bccl9991 + "";		
		String currMonthbccl9991	= monthArrbccl9991[currMonth1bccl9991]  + "";
		String currYearbccl9991     = thisDaybccl9991.get(Calendar.YEAR)	+	"";
		//out.println("currYear--"+currMonthbccl9991);
		 
		//out.println("joiningdate==="+joiningdate);
		 String todayDatebccl9991	=	currDaybccl9991 + "-" + currMonthbccl9991 + "-" + currYearbccl9991;
		DateFormat formatterbccl9991 = new SimpleDateFormat("dd-MMM-yyyy");	
		Date date1bccl9991 = formatterbccl9991.parse(joiningdate); 
		Date date2bccl9991 = formatterbccl9991.parse(todayDatebccl9991); 

		// long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");
		//out.println("timescapeUserOID"+timescapeUserOID);
		detailsHashbccl9991.put("timescapeUserOID",(timescapeUserOID+""));
		detailsHashbccl9991.put("currYear",(faYearbccl9991+""));
		detailsHashbccl9991.put("backYear",(faYearbccl9991+""));

		 resultListbccl9991 = mediclaimController.viewTopupAmount(detailsHashbccl9991); 
		//out.println("resultListbccl9991.size()"+resultListbccl9991.size());

		long diffbccl9991 = date2bccl9991.getTime()  - date1bccl9991.getTime() ; 
		//long diffbccl9991 = date2bccl9991.getTime() ; 
		diffbccl9991	=	(diffbccl9991 / (1000 * 60 * 60 * 24));

		out.println("currMonthbccl9991-"+currMonthbccl9991);
		//out.println("diffbccl9991-"+diffbccl9991);
		if(resultListbccl9991.size() > 0){
		%>
		<td input type = "hidden" name = "nextYearbccl9991" id = "nextYearbccl9991" value = <%=nextYearbccl9991%>>
		<tr>
		 <td colspan = "100%" align = "left" class = "normal"><p >You have declared for Mediclaim Top Up amount.  Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no');" >here</a> to view details. </p> <p>For Top Up Policy Guidelines <a href="../pdf/Guidelines for Top Up Insurance Scheme_2024-25.pdf" target="_blank">Mediclaim Insurance Policy</a></p></td>  </tr>
		<%
		//}else if (resultListbccl9991.size() == 0 && (diff < 31) ){
		}else if (resultListbccl9991.size() == 0 && ((currMonthbccl9991.equals("OCT") ) || ( diffbccl9991 < 31)) ) {
			%>

		 <tr>
		<td colspan = "100%" align = "left" class = "normal">Click <a href="#" onclick="javascript:window.open('bccl9991ApplyAmount.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no, toolbar=no' ); " >here</a>  to view Top Up Insurance Scheme Options and submit declaration.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history.</td>
		</tr> 

		
			<%

			//out.println("hii");

		} 
		else if(resultListbccl9991.size() == 0 &&  diffbccl9991 >= 31){
			%>

		<tr>
		<td colspan = "100%" align = "left" class = "normal"><p >Valid period for declaring Mediclaim Top Up amount for <%=faYearbccl9991%>-<%=nextYearbccl9991%> has lapsed.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history. </p></td> </tr>

		<%}%>

		
		  <tr>
             <td colspan = "100%" align = "center">
                <div class="line"></div>
                </br>
                <div class = "bold"  align="left">
					<p><span class="blueheaderCopy">Types of updations you can make online: </span>	              <br />
						<span class="normal">Add dependents and their details in case there is a change due to marriage or birth of a child in your family.</span></p>
					<p><strong class="blueheaderCopy">If the details shown are incorrect or You want to delete a dependent&rsquo;s details</strong><span class="header"><br />
					</span>
					<!-- <span class="normal">Please write a mail   to <a href="mailto:iconnecthr@timesgroup.com" class="underline">iconnecthr@timesgroup.com</a> outlining   the discrepancy and we will make the necessary change in the   system. For more details, read <a href="//timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://f1e7fbda6bae18588fe265eb693768ce" target="_blank">Mediclaim Insurance Policy</a></span> -->
					<span class="normal">Please raise request on Hr Help Desk outlining the discrepancy and we will make the necessary change in the system. For more details, read <a href="//timeslink.timesgroup.com/irj/portal?NavigationTarget=navurl://f1e7fbda6bae18588fe265eb693768ce" target="_blank">Mediclaim Insurance Policy</a></span>
					</p>
					
                </div>
			</td>
          </tr>
          <tr>
             <td colspan = "100%" align = "center"></br>
                <div class = "bold"  align="left">  Disclaimer: 
                I hereby confirm that I have understood the Group Mediclaim Insurance Policy of Times Network. 
				The information furnished by me in the above form is true to the best of my knowledge and belief. I also understand that in case of wrongful disclosure on my part, I will stand ineligible from the benefits of this scheme. 
.
				</div>
             </td>
          </tr>