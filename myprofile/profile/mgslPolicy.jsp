<script Language="JavaScript" src="../jscripts/mgslViewNomineeDetails.js"></script>

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
				•	Voluntary top up will be done through Darwinbox for FY 20-21. Please refer policy on people center for additional information. 
</td>
    </tr>


<!--
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
    </tr>-->
	
	<% /* %>
	
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

        
		int mg = 0;
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
					<td height="25" class = "small"><A HREF="javascript:validate(<%=mg++%>,'<%=empBDay%>','<%=month.get(empBMonth)%>','<%=empBYear%>','<%=curDay%>','<%=curMonth%>','<%=curYear%>')">add</A>&nbsp;</td>
			</tr>
<%
		}
			*/
			
			/*
%>


</br>
<table border = "0" cellspacing="3" cellpadding="0" width = "100%">
		<tr><br>
		<td class="blueheaderCopy" width = "20%" >Declaration Submission for Top Up Insurance Scheme</td>
		</tr>
<%
		String monthArrMgsl[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
		ArrayList resultListMgsl  = new ArrayList();
		Hashtable detailsHashMgsl = new Hashtable();
		GregorianCalendar thisDayMgsl = new GregorianCalendar( );

		//for fayear start
		int currentMonth1Mgsl		= thisDayMgsl.get(Calendar.MONTH);
		String currentMonthMgsl	= monthArrMgsl[currentMonth1Mgsl]  + "";	
		String faYearMgsl = thisDayMgsl.get(Calendar.YEAR) + "";
		String nextYearMgsl		=	thisDayMgsl.get(Calendar.YEAR) + 1 + "";
		if(currentMonthMgsl.equals("JAN") || currentMonthMgsl.equals("FEB")||currentMonthMgsl.equals("MAR") ){
		faYearMgsl = (Integer.parseInt(faYearMgsl)-1)+"";
		nextYearMgsl = (Integer.parseInt(nextYearMgsl)-1)+"";
		
		}  
		session.setAttribute("faYear",faYearMgsl);
		session.setAttribute("nextYearMgsl",nextYearMgsl);

		//for fayear end
		
		
		int currday1Mgsl		= thisDayMgsl.get(Calendar.DAY_OF_MONTH);
		int currMonth1Mgsl		= thisDayMgsl.get(Calendar.MONTH);
		String currDayMgsl		= currday1Mgsl + "";		
		String currMonthMgsl	= monthArrMgsl[currMonth1Mgsl]  + "";
		String currYearMgsl     = thisDayMgsl.get(Calendar.YEAR)	+	"";
		//out.println("currYearMgsl--"+currYearMgsl);
		 

		 String todayDateMgsl	=	currDayMgsl + "-" + currMonthMgsl + "-" + currYearMgsl;
		DateFormat formatterMgsl = new SimpleDateFormat("dd-MMM-yyyy");	
		//Date date1Mgsl = formatterMgsl.parse(joiningdate); 
		Date date1Mgsl = formatterMgsl.parse(joiningdate); 
		Date date2Mgsl = formatterMgsl.parse(todayDateMgsl); 

		// long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");
		//out.println("faYearMgsl"+faYearMgsl);
		detailsHashMgsl.put("timescapeUserOID",(timescapeUserOID+""));
		detailsHashMgsl.put("currYear",(faYearMgsl+""));
		//out.println("detailsHashMgsl="+detailsHashMgsl);
		 resultListMgsl = mediclaimController.viewTopupAmount(detailsHashMgsl); 
		//out.println("resultListMgsl.size()"+resultListMgsl.size());

		//out.println("date1Mgsl.getTime()"+date1Mgsl.getTime());
		//out.println("date2Mgsl.getTime()"+date2Mgsl.getTime());

		long diffMgsl = date2Mgsl.getTime() - date1Mgsl.getTime(); 
		diffMgsl	=	(diffMgsl / (1000 * 60 * 60 * 24));

		//long diff = date2.getTime() - date1.getTime(); 
		//diff	=	(diff / (1000 * 60 * 60 * 24));

		//out.println("diffMgsl-"+diffMgsl);
		if(resultListMgsl.size() > 0){
		%>
		<td input type = "hidden" name = "nextYearMgsl" id = "nextYearMgsl" value = <%=nextYearMgsl%>>
		<tr>
		 <td colspan = "100%" align = "left" class = "normal"><p >You have declared for Mediclaim Top-Up amount.  Click <a href="#" onclick="javascript:window.open('mgslViewHistory.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no');" >here</a> to view details.</p></td>  </tr>
		<%
		}

		//else if (resultListMgsl.size() == 0 && (diffMgsl < 31) ){
			else if (resultListMgsl.size() == 0 && (( (currMonthMgsl.equals("JUL") && currday1Mgsl <= 22)) || ( diffMgsl < 31)) ){
			//else if (resultListMgsl.size() == 0 && ((currMonthMgsl.equals("APR") ||  currMonthMgsl.equals("MAY")) || ( diffMgsl < 31)) ){
			%>

		 <tr>
		<td colspan = "100%" align = "left" class = "normal">Click <a href="#" onclick="javascript:window.open('mgslApplyAmount.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no, toolbar=no' ); " >here</a>  to view Top Up Insurance Scheme Options and submit declaration.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('mgslViewHistory.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history.</td>
		</tr> 

		
			<%

			//out.println("hii");

		} 
		else if(resultListMgsl.size() == 0 &&  diffMgsl >= 31){
			%>

		<tr>
		<td colspan = "100%" align = "left" class = "normal"><p >Valid period for declaring Mediclaim Top-Up amount for current financial year <%=faYearMgsl%>-<%=nextYearMgsl%> has lapsed.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('mgslViewHistory.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history. </p></td> </tr>

		<%}
		*/
		%>
		
		
		
		  