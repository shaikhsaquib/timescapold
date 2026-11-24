<script Language="JavaScript" src="../jscripts/tilViewNomineeDetails.js"></script>

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
				•	Please note once the policy is renewed, you can only make new addition changes for the applicable policy period, i.e. (1 June – 31 May), only spouse / child can be added during the year. </br>
                •	Any mid-year addition has to be routed through HRHelpdesk https://hrhelpdesk.timesinternet.in only.</br>
                •	Please note that Timescape is not monitored for any mid-year changes made to dependent data.</br>
                •	Please track emails coming from HR ID for any kind of change in process of declaring dependent.</br></br>
I hereby confirm that I have read & understood the Comprehensive Mediclaim Insurance Scheme of Times Internet Limited. 
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

        
		int twsl = 0;
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
								
								//if(!(userTitle.equalsIgnoreCase("Mr.")) && !(userTitle.equalsIgnoreCase("Mr"))) 
								//{
    								out.println("<option value=\"Parent-In-Law\">Dependent Parent-In-Law</option>");
								//}
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
					<td height="25" class = "small"><A HREF="javascript:validate(<%=twsl++%>,'<%=empBDay%>','<%=month.get(empBMonth)%>','<%=empBYear%>','<%=curDay%>','<%=curMonth%>','<%=curYear%>')">add</A>&nbsp;</td>
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
		String monthArrTwsl[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
		ArrayList resultListTwsl  = new ArrayList();
		Hashtable detailsHashTwsl = new Hashtable();
		GregorianCalendar thisDayTwsl = new GregorianCalendar( );

		//for fayear start
		int currentMonth1Twsl		= thisDayTwsl.get(Calendar.MONTH);
		String currentMonthTwsl	= monthArrTwsl[currentMonth1Twsl]  + "";	
		String faYearTwsl = thisDayTwsl.get(Calendar.YEAR) + "";
		String nextYearTwsl		=	thisDayTwsl.get(Calendar.YEAR) + 1 + "";
		if(currentMonthTwsl.equals("JAN") || currentMonthTwsl.equals("FEB")||currentMonthTwsl.equals("MAR") ){
		faYearTwsl = (Integer.parseInt(faYearTwsl)-1)+"";
		nextYearTwsl = (Integer.parseInt(nextYearTwsl)-1)+"";
		
		}  
		session.setAttribute("faYear",faYearTwsl);
		session.setAttribute("nextYearTwsl",nextYearTwsl);

		//for fayear end
		
		
		int currday1Twsl		= thisDayTwsl.get(Calendar.DAY_OF_MONTH);
		int currMonth1Twsl		= thisDayTwsl.get(Calendar.MONTH);
		String currDayTwsl		= currday1Twsl + "";		
		String currMonthTwsl	= monthArrTwsl[currMonth1Twsl]  + "";
		String currYearTwsl     = thisDayTwsl.get(Calendar.YEAR)	+	"";
		//out.println("currYearTwsl--"+currYearTwsl);
		 

		 String todayDateTwsl	=	currDayTwsl + "-" + currMonthTwsl + "-" + currYearTwsl;
		DateFormat formatterTwsl = new SimpleDateFormat("dd-MMM-yyyy");	
		Date date1Twsl = formatterTwsl.parse(joiningdate); 
		//Date date1Twsl = formatterTwsl.parse(todayDateTwsl); 
		Date date2Twsl = formatterTwsl.parse(todayDateTwsl); 

		// long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");
		//out.println("faYearTwsl"+faYearTwsl);
		detailsHashTwsl.put("timescapeUserOID",(timescapeUserOID+""));
		detailsHashTwsl.put("currYear",(faYearTwsl+""));
		//out.println("detailsHashTwsl="+detailsHashTwsl);
		 resultListTwsl = mediclaimController.viewTopupAmount(detailsHashTwsl); 
		//out.println("resultListTwsl.size()"+resultListTwsl.size());

		long diffTwsl = date2Twsl.getTime() - date1Twsl.getTime(); 
		diffTwsl	=	(diffTwsl / (1000 * 60 * 60 * 24));

		//out.println("diffTwsl-"+diffTwsl);
		if(resultListTwsl.size() > 0){
		%>
		<td input type = "hidden" name = "nextYearTwsl" id = "nextYearTwsl" value = <%=nextYearTwsl%>>
		<tr>
		 <td colspan = "100%" align = "left" class = "normal"><p >You have declared for Mediclaim Top-Up amount.  Click <a href="#" onclick="javascript:window.open('twslViewHistory.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no');" >here</a> to view details.</p></td>  </tr>
		<%
		}

		//else if (resultListTwsl.size() == 0 && (diffTwsl < 31) ){
			else if (resultListTwsl.size() == 0 && (((currMonthTwsl.equals("AUG") && currday1Twsl <= 22)) || ( diffTwsl < 31)) ){
			//else if (resultListTwsl.size() == 0 && ((currMonthTwsl.equals("APR") ||  currMonthTwsl.equals("MAY")) || ( diffTwsl < 31)) ){
			%>

		 <tr>
		<td colspan = "100%" align = "left" class = "normal">Click <a href="#" onclick="javascript:window.open('twslApplyAmount.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no, toolbar=no' ); " >here</a>  to view Top Up Insurance Scheme Options and submit declaration.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('twslViewHistory.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history.</td>
		</tr> 

		
			<%

			//out.println("hii");

		} 
		else if(resultListTwsl.size() == 0 &&  diffTwsl >= 31){
			%>

		<tr>
		<td colspan = "100%" align = "left" class = "normal"><p >Valid period for declaring Mediclaim Top-Up amount for current financial year <%=faYearTwsl%>-<%=nextYearTwsl%> has lapsed.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('twslViewHistory.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history. </p></td> </tr>

		<%}%>

		
		  