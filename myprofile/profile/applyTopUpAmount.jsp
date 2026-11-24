<%--
 -- @(#)viewNomineeDetails.jsp	8/6/2002
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author  Amey Divekar
 -- @version 	1.00, April 29, 2007

 -- Comments...
 --		Included sendMail.jsp file to send an email to HR on alteration of nominee list.
 -- @author		Manisha Wadhawane
 -- @version 	2.00, May 07, 2008

 -- Comments...
 --		Added Medicalim policy for ZEN.
 -- @author		Manisha Wadhawane
 -- @version 	3.00, Sep 24, 2009
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList, java.text.DateFormat, java.text.SimpleDateFormat" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,java.util.Date,com.bccl.util.Breadcrumbs,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>


</br>
<table border = "0" cellspacing="3" cellpadding="0" width = "100%">
		<tr>
		<td class="blueheaderCopy" width = "20%" >Declaration Submission for Top Up Insurance Scheme</td>
		</tr>
<%

		String monthArrGrpComp[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
		ArrayList resultListGrpComp  = new ArrayList();
		Hashtable detailsHashGrpComp = new Hashtable();
		GregorianCalendar thisDayGrpComp = new GregorianCalendar( );

		//for fayear start
		int currentMonth1GrpComp		= thisDayGrpComp.get(Calendar.MONTH);
		String currentMonthGrpComp	= monthArrGrpComp[currentMonth1GrpComp]  + "";	
		String faYearGrpComp = thisDayGrpComp.get(Calendar.YEAR) + "";		
		String nextYearGrpComp		=	thisDayGrpComp.get(Calendar.YEAR) + 1 + "";

		if(currentMonthGrpComp.equals("JAN") || currentMonthGrpComp.equals("FEB")||currentMonthGrpComp.equals("MAR")||currentMonthGrpComp.equals("APR")||currentMonthGrpComp.equals("MAY")||currentMonthGrpComp.equals("JUN")){
		faYearGrpComp = (Integer.parseInt(faYearGrpComp)-1)+"";
		nextYearGrpComp = (Integer.parseInt(nextYearGrpComp)-1)+"";
		
		}  
		session.setAttribute("faYear",faYearGrpComp);
		session.setAttribute("nextYear",nextYearGrpComp);

		//for fayear end
		
		
		int currday1GrpComp		= thisDayGrpComp.get(Calendar.DAY_OF_MONTH);
		int currMonth1GrpComp		= thisDayGrpComp.get(Calendar.MONTH);
		String currDayGrpComp		= currday1GrpComp + "";		
		String currMonthGrpComp	= monthArrGrpComp[currMonth1GrpComp]  + "";
		String currYearGrpComp     = thisDayGrpComp.get(Calendar.YEAR)	+	"";
		//out.println("currYear--"+currYear);
		 

		 String todayDateGrpComp	=	currDayGrpComp + "-" + currMonthGrpComp + "-" + currYearGrpComp;
		DateFormat formatterGrpComp = new SimpleDateFormat("dd-MMM-yyyy");	
		Date date1GrpComp = formatterGrpComp.parse(joiningdate); 
		Date date2GrpComp = formatterGrpComp.parse(todayDateGrpComp); 

		// long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");
		//out.println("timescapeUserOID"+timescapeUserOID);
		detailsHashGrpComp.put("timescapeUserOID",(timescapeUserOID+""));
		detailsHashGrpComp.put("currYear",(faYearGrpComp+""));

		 resultListGrpComp = mediclaimController.viewTopupAmount(detailsHashGrpComp); 
		//out.println("resultList.size()"+resultList.size());

		long diffGrpComp = date2GrpComp.getTime() - date1GrpComp.getTime(); 
		diffGrpComp	=	(diffGrpComp / (1000 * 60 * 60 * 24));

		//out.println("diff-"+diff);
		if(resultListGrpComp.size() > 0){
		%>
		<td input type = "hidden" name = "nextYear" id = "nextYear" value = <%=nextYearGrpComp%>>
		<tr>
		 <td colspan = "100%" align = "left" class = "normal"><p >You have declared for Mediclaim Top-Up amount.  Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no');" >here</a> to view details.</p></td>  </tr>
		<%
		}

		//else if (resultList.size() == 0 && (diff < 31) ){
			else if (resultListGrpComp.size() == 0 && ((currMonthGrpComp.equals("APR") ||  currMonthGrpComp.equals("MAY") ||  currMonthGrpComp.equals("JUN") ||  currMonthGrpComp.equals("JUL")) || ( diffGrpComp < 31)) ){
			%>

		 <tr>
		<td colspan = "100%" align = "left" class = "normal">Click <a href="#" onclick="javascript:window.open('bcclApplyAmount.jsp','_blank','top=100, left=100, height=225, width=550, status=yes, menubar=no, resizable=no, scrollbars=no, toolbar=no' ); " >here</a>  to view Top Insurance Scheme Options and submit declaration.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history.</td>
		</tr> 

		
			<%

			//out.println("hii");

		} 
		else if(resultListGrpComp.size() == 0 &&  diffGrpComp >= 31){
			%>

		<tr>
		<td colspan = "100%" align = "left" class = "normal"><p >Valid period for declaring Mediclaim Top-Up amount for <%=faYearGrpComp%>-<%=nextYearGrpComp%> has lapsed.&nbsp;&nbsp;Click <a href="#" onclick="javascript:window.open('bcclViewHistoty.jsp','_blank','top=100, left=100, height=400, width=500, status=yes, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" >here</a> to view history. </p></td> </tr>

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
                I hereby confirm that I have read & understood the Comprehensive Mediclaim Insurance Scheme of Bennett, Coleman & Co. Ltd. </br>
                The information furnished by me in the above form is true to the best of my knowledge and belief. I also understand that in case of wrongful disclosure on my part, I will stand ineligible from the benefits of this scheme.
				</div>
             </td>
          </tr>