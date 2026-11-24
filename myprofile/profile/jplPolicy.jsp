<script Language="JavaScript" src="../jscripts/jplViewNominee.js"></script>

<form name="viewNomineeForm" method="POST">

<input type="hidden" name="addIndex">
<input type="hidden" name="nomineeId">
<input type="hidden" name="nomineeNameHidden">
<input type="hidden" name="nomineeLocationHidden">
<input type="hidden" name="nomineeRelationHidden">
<input type="hidden" name="nomineeDOBHidden">
<input type="hidden" name="nomineeGenderHidden">

<!-- <div class = "blueheaderCopy" align="right"><a href="http://www.rakshatpa.com/ClaimIntimation.jsp" target="_new">Raksha TPA Claim Intimation</a></div> -->
<script Language="JavaScript">
function openPopup()
{
    window.open("../utils/mediclaimInsurance.html","MediclaimNominee","resizable=yes,scrollbars=yes,toolbars=no,width=900,height=550,top=100,left=50");
    window.focus();
	return;
}

function openPopup1()
{
    window.open("employeeDetailsByEmp.jsp","RakshaTPA","resizable=yes,scrollbars=yes,toolbars=no,width=900,height=550,top=100,left=50");
    window.focus();
	return;
}

 </script>
<div class="underline">
<table align="right">
    <tr>
        <!-- <td ><a href="#" onclick="javascript:openPopup();"> <img src="../images/1.jpg" border="0" /></a></td> -->
<!--         <td ><a href="../pdf/Junglee.pdf" target="_blank"><img src="../images/2GrpCompany.jpg"  border="0" /></a> </td>
 -->        <td ><a href="../pdf/JUnglee_GMC_policy_Manual.pptx" target="_blank"><img src="../images/2GrpCompany.jpg"  border="0" /></a> </td>        <!-- <td ><a href="#" onclick="javascript:openPopup1();"> <img src="../images/3.jpg" border="0" /> </td> -->
    </tr>
</table></div></br></br>
<div class="welcome">Welcome to the Medical Insurance Nominations Page</div>
<div class="txt">This page has been designed to enable you to nominate your dependent who you want to be covered as part of the Comprehensive Medical Insurance Scheme of the Company.      
</div>
</br><div class = "blueheaderCopy" >Instructions:</div>
<span class="normal">Kindly provide details of Dependents including Relationship, Date of Birth and Gender. Additionally, please specify the location where each nominee is currently residing. Please note that on clicking <strong class="bold1">Add</strong> the nominee details are submitted. 
<!--In case you need to change some information, kindly click on the delete link and delete the entire line. Then add a new entry again.--><strong class="bold1"> <br />
Do not provide any information on self.</strong></span><br/>
</br>
<div class = "line"></div>
<table border = "0" cellspacing="3" cellpadding="0" width = "100%">
	<tr>
		<td class="white" align = "left" width="5%" height="20" bgcolor = "#000000"> Sr. No.</td>
		<td class="white" align = "left" width="22%" height="20" bgcolor = "#000000"> Name of Dependent Family Member</td>
		<td class="white" align = "left" width="10%" height="20" bgcolor = "#000000"> Location </td>
		<td class="white" align = "left" width="10%" height="20" bgcolor = "#000000"> Relationship </td>
		<td class="white" align = "left" width="13%" height="20" bgcolor = "#000000"> Date of Birth</td>
		<td class="white" align = "left" width="10%" height="20" bgcolor = "#000000"> Gender</td>
		<td class="white" align = "left" width="15%" height="20" bgcolor = "#000000"> Last Updated On</td>
		<td class="white" align = "left" width="15%" height="20" bgcolor = "#000000"> Submit</td>
 		</tr>
<%      
       //String modifiedOn="";
		for (int i=0;i<nomineeCount;i++) {	

			String nominees[ ]= (String[]) nomineeDetails.get(i);
           // modifiedOn=(String)nominees[9];
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
				    <td height="25" class = "small"> <%=nominees[9]%></td>
					<td height="25" class = "small"> <!-- <A HREF="javascript:deleteNominee(<%=nominees[0]%>,'<%=Utility.replaceQuoteJS(nominees[1])%>','<%=nominees[2]%>','<%=nominees[3]%>','<%=nominees[4]%>','<%=nominees[5]%>')">delete</A> --> &nbsp;</td>
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

		//out.println(gender);
		/*if((gender.equalsIgnoreCase("Male"))){
				selfGender = "M";
			}else{
				selfGender = "F";
			}
        */
		int jp = 0;
		for (int i=nomineeCount; i<5;i++) {
	
%>
			<tr>
				<td  height="25" class = "small" align="center"><%=(i+1)%></td>				
				<td height="25" class = "small"><input name="nomineeName" id="nomineeName" type="text" size="30" maxlength="100" class = "small"/></td>				
				<td height="25" class = "small"><input name="nomineeLocationName" id="nomineeLocationName" type="text" size="20" maxlength="100" class = "small"/></td>
				<td height="25" class = "small"><select name="nomineeRelationship" id="nomineeRelationship" class = "small">
						

					  <%
						  
						  if(spouseCount<1)
								out.println("<option value=\"Spouse\">Spouse</option>");
						  if(childrenCount<2)
								out.println("<option value=\"Child\">Dependent Child</option>");

						  if(inlawCount == 0 && parentCount < 2 ) {

								out.println("<option value=\"Parent\">Dependent Parent</option>");
                          }

						  if(parentCount == 0 && inlawCount < 2) {
								
								//if(!(userTitle.equalsIgnoreCase("Mr.")) && !(userTitle.equalsIgnoreCase("Mr"))) {

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
				<td height="25" class = "small"><select name="nomineeGender" id="nomineeGender" class = "small">
					  <option value="M">Male</option>
					  <option value="F">Female</option>
					</select>
				</td>
					<td height="25" class = "small"></td>
					<td height="25" class = "small"><div id="addLink"><A HREF="javascript:validate(<%=jp++%>,'<%=empBDay%>','<%=month.get(empBMonth)%>','<%=empBYear%>','<%=curDay%>','<%=curMonth%>','<%=curYear%>')">add</A>&nbsp;</div></td>
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

		String monthArrJpl[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
		ArrayList resultListJpl  = new ArrayList();
		Hashtable detailsHashJpl = new Hashtable();
		GregorianCalendar thisDayJpl = new GregorianCalendar( );

		//for fayear start
		int currentMonth1Jpl		= thisDayJpl.get(Calendar.MONTH);
		String currentMonthJpl	= monthArrJpl[currentMonth1Jpl]  + "";	
		String faYearJpl = thisDayJpl.get(Calendar.YEAR) + "";
		String nextYearJpl		=	thisDayJpl.get(Calendar.YEAR) + 1 + "";
		if(currentMonthJpl.equals("JAN") || currentMonthJpl.equals("FEB")||currentMonthJpl.equals("MAR") ){
		faYearJpl = (Integer.parseInt(faYearJpl)-1)+"";
		nextYearJpl = (Integer.parseInt(nextYearJpl)-1)+"";
		
		}  
		session.setAttribute("faYear",faYearJpl);
		session.setAttribute("nextYearJpl",nextYearJpl);

		//for fayear end
		
		
		int currday1Jpl		= thisDayJpl.get(Calendar.DAY_OF_MONTH);
		int currMonth1Jpl		= thisDayJpl.get(Calendar.MONTH);
		String currDayJpl		= currday1Jpl + "";		
		String currMonthJpl	= monthArrJpl[currMonth1Jpl]  + "";
		String currYearJpl     = thisDayJpl.get(Calendar.YEAR)	+	"";
		//out.println("currYearJpl--"+currYearJpl);
		 

		 String todayDateJpl	=	currDayJpl + "-" + currMonthJpl + "-" + currYearJpl;
		DateFormat formatterJpl = new SimpleDateFormat("dd-MMM-yyyy");	
		//Date date1Jpl = formatterJpl.parse(joiningdate); 
		Date date1Jpl = formatterJpl.parse(todayDateJpl); 
		Date date2Jpl = formatterJpl.parse(todayDateJpl); 

		// long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");
		//out.println("faYearJpl"+faYearJpl);
		detailsHashJpl.put("timescapeUserOID",(timescapeUserOID+""));
		detailsHashJpl.put("currYear",(faYearJpl+""));
		detailsHashJpl.put("backYear",faYearJpl+"");
		detailsHashJpl.put("back2Year",faYearJpl+"");
		//out.println("detailsHashJpl="+detailsHashJpl);
		 resultListJpl = mediclaimController.viewTopupAmount(detailsHashJpl); 
		//out.println("resultListJpl.size()"+resultListJpl.size());

		long diffJpl = date2Jpl.getTime() - date1Jpl.getTime(); 
		diffJpl	=	(diffJpl / (1000 * 60 * 60 * 24));

		//out.println("diffJpl-"+diffJpl);
		if(resultListJpl.size() > 0){
		%>
		<td input type = "hidden" name = "nextYearJpl" id = "nextYearJpl" value = <%=nextYearJpl%>>
		<tr>
		 <td colspan = "100%" align = "left" class = "normal"><p >You have declared for Mediclaim Top Up amount.  Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no');" >here</a> to view details.</p></td>  </tr>
		<%
		}else if (resultListJpl.size() == 0 && ((currMonthJpl.equals("APR") ||  currMonthJpl.equals("MAY") ||  currMonthJpl.equals("JUN") ||  currMonthJpl.equals("JUL")) || ( diffJpl < 31)) ){
			%> 

		 <tr>
		<td colspan = "100%" align = "left" class = "normal">Click <a href="#" onclick="javascript:window.open('bcclApplyAmount.jsp','_blank','top=100, left=100, height=250, width=600, status=yes, menubar=no, resizable=no, scrollbars=no, toolbar=no' ); " >here</a>  to view Top Up Insurance Scheme Options and submit declaration.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history.</td>
		</tr> 

		
			<%

			//out.println("hii");

		} 
		else if(resultListJpl.size() == 0 &&  diffJpl >= 31){
			%>

		<tr>
		<td colspan = "100%" align = "left" class = "normal"><p >Valid period for declaring Mediclaim Top Up amount for <%=faYearJpl%>-<%=nextYearJpl%> has lapsed.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history. </p></td> </tr>

		<%}%>

		
		  <!-- <tr>
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
          </tr> -->