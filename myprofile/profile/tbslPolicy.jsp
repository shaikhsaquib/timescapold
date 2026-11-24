<script Language="JavaScript" src="../jscripts/tbslViewNomineeDetails.js"></script>

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
I hereby confirm that I have read & understood the Comprehensive Mediclaim Insurance Scheme of Times Business Solutions Limited. </br>
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

        
		int counter = 0;
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
								
								if(!(userTitle.equalsIgnoreCase("Mr.")) && !(userTitle.equalsIgnoreCase("Mr"))) 
								{
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
					<td height="25" class = "small"><A HREF="javascript:validate(<%=counter++%>,'<%=empBDay%>','<%=month.get(empBMonth)%>','<%=empBYear%>','<%=curDay%>','<%=curMonth%>','<%=curYear%>')">add</A>&nbsp;</td>
			</tr>
<%
		}							
%>
</br>
<table border = "0" cellspacing="3" cellpadding="0" width = "100%">
		<tr>
		<td class="blueheaderCopy" width = "20%" >Declaration Submission for Top Up Insurance Scheme</td>
		</tr>
<%

		String monthArrTbsl[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
		ArrayList resultListTbsl  = new ArrayList();
		Hashtable detailsHashTbsl = new Hashtable();
		GregorianCalendar thisDayTbsl = new GregorianCalendar( );

		//for fayear start
		int currentMonth1Tbsl		= thisDayTbsl.get(Calendar.MONTH);
		String currentMonthTbsl	= monthArrTbsl[currentMonth1Tbsl]  + "";	
		String faYearTbsl = thisDayTbsl.get(Calendar.YEAR) + "";
		String nextYearTbsl		=	thisDayTbsl.get(Calendar.YEAR) + 1 + "";
		if(currentMonthTbsl.equals("JAN") || currentMonthTbsl.equals("FEB")||currentMonthTbsl.equals("MAR") ){
		faYearTbsl = (Integer.parseInt(faYearTbsl)-1)+"";
		nextYearTbsl = (Integer.parseInt(nextYearTbsl)-1)+"";
		
		}  
		session.setAttribute("faYear",faYearTbsl);
		session.setAttribute("nextYearTbsl",nextYearTbsl);

		//for fayear end
		
		
		int currday1Tbsl		= thisDayTbsl.get(Calendar.DAY_OF_MONTH);
		int currMonth1Tbsl		= thisDayTbsl.get(Calendar.MONTH);
		String currDayTbsl		= currday1Tbsl + "";		
		String currMonthTbsl	= monthArrTbsl[currMonth1Tbsl]  + "";
		String currYearTbsl     = thisDayTbsl.get(Calendar.YEAR)	+	"";
		//out.println("currYearTbsl--"+currYearTbsl);
		 

		 String todayDateTbsl	=	currDayTbsl + "-" + currMonthTbsl + "-" + currYearTbsl;
		DateFormat formatterTbsl = new SimpleDateFormat("dd-MMM-yyyy");	
		//Date date1Tbsl = formatterTbsl.parse(joiningdate); 
		Date date1Tbsl = formatterTbsl.parse(todayDateTbsl); 
		Date date2Tbsl = formatterTbsl.parse(todayDateTbsl); 

		// long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");
		//out.println("faYearTbsl"+faYearTbsl);
		detailsHashTbsl.put("timescapeUserOID",(timescapeUserOID+""));
		detailsHashTbsl.put("currYear",(faYearTbsl+""));
		//out.println("detailsHashTbsl="+detailsHashTbsl);
		 resultListTbsl = mediclaimController.viewTopupAmount(detailsHashTbsl); 
		//out.println("resultListTbsl.size()"+resultListTbsl.size());

		long diffTbsl = date2Tbsl.getTime() - date1Tbsl.getTime(); 
		diffTbsl	=	(diffTbsl / (1000 * 60 * 60 * 24));

		//out.println("diffTbsl-"+diffTbsl);
		if(resultListTbsl.size() > 0){
		%>
		<td input type = "hidden" name = "nextYearTbsl" id = "nextYearTbsl" value = <%=nextYearTbsl%>>
		<tr>
		 <td colspan = "100%" align = "left" class = "normal"><p >You have declared for Mediclaim Top-Up amount.  Click <a href="#" onclick="javascript:window.open('TbslViewHistoty.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no');" >here</a> to view details.</p></td>  </tr>
		<%
		}else if (resultListTbsl.size() == 0 && ((currMonthTbsl.equals("APR") ||  currMonthTbsl.equals("MAY") ||  currMonthTbsl.equals("JUN") ||  currMonthTbsl.equals("JUL")) || ( diffTbsl < 31)) ){
			%>

		 <tr>
		<td colspan = "100%" align = "left" class = "normal">Click <a href="#" onclick="javascript:window.open('bcclApplyAmount.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no, toolbar=no' ); " >here</a>  to view Top Up Insurance Scheme Options and submit declaration.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('TbslViewHistoty.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history.</td>
		</tr> 

		
			<%

			//out.println("hii");

		}

		
		else if(resultListTbsl.size() == 0 &&  diffTbsl >= 31){
			%>

		<tr>
		<td colspan = "100%" align = "left" class = "normal"><p >Valid period for declaring Mediclaim Top-Up amount for current financial year <%=faYearTbsl%>-<%=nextYearTbsl%> has lapsed.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history. </p></td> </tr>

		<%}%>

		
		  <tr>
             <td colspan = "100%" align = "center">
                <div class="line"></div>
                </br>
                <div class = "bold"  align="left">
					<p><span class="blueheaderCopy">Types of updations you can make online:</span>	              <br />
						<span class="normal">Add dependents and their details in case there is a change due to marriage or birth of a child in your family.</span></p>
					<p><strong class="blueheaderCopy">If the details shown are incorrect or You want to delete a dependent&rsquo;s details</strong><span class="header"><br />
					</span><span class="normal">Please write a mail   to <a href="mailto:corporatehr@timesgroup.com" class="underline">corporatehr@timesgroup.com</a> outlining   the discrepancy and we will make the necessary change in the   system. For more details, read <a href="//timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://7ccf105464f459564ca3236027dd9ddb" target="_blank">Mediclaim Insurance Policy</a></span></p>
					
                </div>
			</td>
          </tr>
          <tr>
             <td colspan = "100%" align = "center"></br>
                <div class = "bold"  align="left">  Disclaimer: 
                I hereby confirm that I have read & understood the Comprehensive Mediclaim Insurance Scheme of Bennett University. </br>
                The information furnished by me in the above form is true to the best of my knowledge and belief. I also understand that in case of wrongful disclosure on my part, I will stand ineligible from the benefits of this scheme.
				</div>
             </td>
          </tr>