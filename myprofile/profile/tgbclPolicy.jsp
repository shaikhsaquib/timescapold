<script Language="JavaScript" src="../jscripts/tgbclViewNomineeDetails.js"></script>

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

        
		int kk = 0;
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
					<td height="25" class = "small"><A HREF="javascript:validate(<%=kk++%>,'<%=empBDay%>','<%=month.get(empBMonth)%>','<%=empBYear%>','<%=curDay%>','<%=curMonth%>','<%=curYear%>')">add</A>&nbsp;</td>
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

		String monthArrTgbcl[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
		ArrayList resultListTgbcl  = new ArrayList();
		Hashtable detailsHashTgbcl = new Hashtable();
		GregorianCalendar thisDayTgbcl = new GregorianCalendar( );

		//for fayear start
		int currentMonth1Tgbcl		= thisDayTgbcl.get(Calendar.MONTH);
		String currentMonthTgbcl	= monthArrTgbcl[currentMonth1Tgbcl]  + "";	
		String faYearTgbcl = thisDayTgbcl.get(Calendar.YEAR) + "";		
		//out.println("faYearTgbcl---"+faYearTgbcl);
		String nextYearTgbcl		=	thisDayTgbcl.get(Calendar.YEAR) + 1 + "";

		//if(currentMonthTgbcl.equals("JAN") || currentMonthTgbcl.equals("FEB")||currentMonthTgbcl.equals("MAR")||currentMonthTgbcl.equals("APR")||currentMonthTgbcl.equals("MAY")||currentMonthTgbcl.equals("JUN")){
		if(currentMonthTgbcl.equals("JAN") || currentMonthTgbcl.equals("FEB") ){
		faYearTgbcl = (Integer.parseInt(faYearTgbcl)-1)+"";
		//out.println("faYearTgbclcc---"+faYearTgbcl);
		nextYearTgbcl = (Integer.parseInt(nextYearTgbcl)-1)+"";
		
		}  
		session.setAttribute("faYear",faYearTgbcl);
		session.setAttribute("nextYear",nextYearTgbcl);

		//for fayear end
		
		
		int currday1Tgbcl		= thisDayTgbcl.get(Calendar.DAY_OF_MONTH);
		int currMonth1Tgbcl		= thisDayTgbcl.get(Calendar.MONTH);
		String currDayTgbcl		= currday1Tgbcl + "";		
		String currMonthTgbcl	= monthArrTgbcl[currMonth1Tgbcl]  + "";
		String currYearTgbcl     = thisDayTgbcl.get(Calendar.YEAR)	+	"";
		//out.println("currYear--"+currMonthTgbcl);
		 
		//out.println("joiningdate==="+joiningdate);
		 String todayDateTgbcl	=	currDayTgbcl + "-" + currMonthTgbcl + "-" + currYearTgbcl;
		DateFormat formatterTgbcl = new SimpleDateFormat("dd-MMM-yyyy");	
		Date date1Tgbcl = formatterTgbcl.parse(joiningdate); 
		Date date2Tgbcl = formatterTgbcl.parse(todayDateTgbcl); 

		// long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");
		//out.println("timescapeUserOID"+timescapeUserOID);
		detailsHashTgbcl.put("timescapeUserOID",(timescapeUserOID+""));
		detailsHashTgbcl.put("currYear",(faYearTgbcl+""));
		detailsHashTgbcl.put("backYear",(faYearTgbcl+""));

		 resultListTgbcl = mediclaimController.viewTopupAmount(detailsHashTgbcl); 
		//out.println("resultListTgbcl.size()"+resultListTgbcl.size());

		long diffTgbcl = date2Tgbcl.getTime()  - date1Tgbcl.getTime() ; 
		//long diffTgbcl = date2Tgbcl.getTime() ; 
		diffTgbcl	=	(diffTgbcl / (1000 * 60 * 60 * 24));

		out.println("currMonthTgbcl-"+currMonthTgbcl);
		//out.println("diffTgbcl-"+diffTgbcl);
		if(resultListTgbcl.size() > 0){
		%>
		<td input type = "hidden" name = "nextYearTgbcl" id = "nextYearTgbcl" value = <%=nextYearTgbcl%>>
		<tr>
		 <td colspan = "100%" align = "left" class = "normal"><p >You have declared for Mediclaim Top Up amount.  Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no');" >here</a> to view details. </p> <p>For Top Up Policy Guidelines <a href="../pdf/Guidelines for Top Up Insurance Scheme_2024-25.pdf" target="_blank">Mediclaim Insurance Policy</a></p></td>  </tr>
		<%
		//}else if (resultListTgbcl.size() == 0 && (diff < 31) ){
		}else if (resultListTgbcl.size() == 0 && ((currMonthTgbcl.equals("OCT") ) || ( diffTgbcl < 31)) ) {
			%>

		 <tr>
		<td colspan = "100%" align = "left" class = "normal">Click <a href="#" onclick="javascript:window.open('tgbclApplyAmount.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no, toolbar=no' ); " >here</a>  to view Top Up Insurance Scheme Options and submit declaration.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history.</td>
		</tr> 

		
			<%

			//out.println("hii");

		} 
		else if(resultListTgbcl.size() == 0 &&  diffTgbcl >= 31){
			%>

		<tr>
		<td colspan = "100%" align = "left" class = "normal"><p >Valid period for declaring Mediclaim Top Up amount for <%=faYearTgbcl%>-<%=nextYearTgbcl%> has lapsed.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history. </p></td> </tr>

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