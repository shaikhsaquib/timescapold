<%!
String months[ ] ={"0","Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
//Hashtable icons = new Hashtable( );
//Hashtable leaveStatus = new Hashtable( );
%>
<%
	GregorianCalendar today = new GregorianCalendar();
	int currMonth = 0;
	int prevMonth1 = 0;
	int prevMonth2 = 0;
	int currYear = 0;
	int prevYear = 0;
	String hiddMonthYear = "";
	String monthYear = "";

	//String option = "";
	String monthStr = "";
	String prevMonthYear1 = "";
	String prevMonthYear2 = "";
 /******************* Current month year combination for report ****************/
	currYear = today.get(Calendar.YEAR);
	currMonth = today.get(Calendar.MONTH)+1 ;
	//System.out.println("current month ="+currMonth);
	monthStr = currMonth + "";
	String currMonthYear = months[currMonth]+"-"+currYear;
	currMonthYear = currMonthYear.toUpperCase( );
	//currMonthYear = " '" + currMonthYear + "'";
	//System.out.println(currMonthYear);

/******************* previous month year combination for display ****************/

	if(currMonth == 1)
	{
		prevMonth1 = 12 ;
		prevMonth2 = 11;

		prevMonthYear1 = months[prevMonth1]+"-"+(currYear-1);
		prevMonthYear1 = prevMonthYear1.toUpperCase( );

		prevMonthYear2 = months[prevMonth2]+"-"+(currYear-1);
		prevMonthYear2 = prevMonthYear2.toUpperCase( );

		//System.out.println("prev month1 ="+prevMonthYear1);
		//System.out.println("prev month2 ="+prevMonthYear2);
	}else if(currMonth == 2)
	{
		prevMonth1 = 1 ;
		prevMonth2 = 12;

		prevMonthYear1 = months[prevMonth1]+"-"+(currYear);
		prevMonthYear1 = prevMonthYear1.toUpperCase( );

		prevMonthYear2 = months[prevMonth2]+"-"+(currYear-1);
		prevMonthYear2 = prevMonthYear2.toUpperCase( );

		//System.out.println("prev month1 ="+prevMonthYear1);
		//System.out.println("prev month2 ="+prevMonthYear2);
	}
	
	else{

		prevMonth1 = currMonth - 1 ;
		prevMonth2 = currMonth - 2 ;

		prevMonthYear1 = months[prevMonth1]+"-"+currYear;
		prevMonthYear1 = prevMonthYear1.toUpperCase( );

		prevMonthYear2 = months[prevMonth2]+"-"+currYear;
		prevMonthYear2 = prevMonthYear2.toUpperCase( );

	}
	
%>



<!-- <table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
		<td height = "35">
			&nbsp;<%//=breadcrumbs%>
		</td>
	</tr>
</table> -->
<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align="center">
<!-- <tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/space.gif" width="1" /></td>
     </tr> -->
     <tr>
          <td align="left" colspan = "100%" background="../images/red_shadow.jpg" bgcolor="#D60202" height="20"><div align="center"><span class="style5Copy">A P P R O V E &nbsp;&nbsp;&nbsp;N O M I N A T I O N (S)</span></div></td>
    </tr>
    <tr>
          <td bgcolor="#cccccc" height="1"><img height="1" src="../images/space.gif" width="1" /></td>
     </tr>
     <tr>
		<td align="left" colspan="100%" height="26"><div align="right"><span class="style3"><img src="../images/inProcess.png" width="20" height="20" /> In Process | <img src="../images/processed.png" width="20" height="20" /> Processed | <img src="../images/jurySelected.png" width="20" height="20" />Jury Selected | <img src="../images/awarded.png" width="20" height="20" /></span><span class="style3">Awarded&nbsp;&nbsp;</span></div></td>
	</tr>
	
    <tr>
	<input type="hidden" name="hiddMonthYear" value= "">
		<td align="left" bgcolor="#cccccc" colspan="10" height="1"><img height="1" src="spacer.gif" width="1"/>
		 </td>
<%
	hiddMonthYear  = (String) request.getParameter("hiddMonthYear");
	monthYear = hiddMonthYear;
	if(monthYear == null)
	{
		monthYear = prevMonthYear1;
	}

	if(hiddMonthYear==null || hiddMonthYear.equals(prevMonthYear1))
	{
%>
		 <td bgcolor="#cccccc" class = "style5" align = "right">Select Month-Year&nbsp;&nbsp;
		 		<select class = "style3" name = "monthyear" >
				<option value = "<%=prevMonthYear2%>" ><%=prevMonthYear2%></option>
				<option value = "<%=prevMonthYear1%>" selected><%=prevMonthYear1%></option>
			</select>
		</td>
<%
		
	
	}else{

		if(hiddMonthYear.equals(prevMonthYear2))
		{
%>
		<td bgcolor="#cccccc" class = "style5" align = "right">Select Month-Year&nbsp;&nbsp;
		 		<select class = "style3" name = "monthyear" >
				<option value = "<%=prevMonthYear2%>" selected><%=prevMonthYear2%></option>
				<option value = "<%=prevMonthYear1%>"><%=prevMonthYear1%></option>
			</select>
		</td>
<%
		}
	}
%>
		<td bgcolor="#cccccc">
			&nbsp;&nbsp;<a href = "javascript:go()"><img src = "../images/greyarrow.gif" border="0" align="absmiddle"></a>
		</td>
    </tr>
	
 
</table>
<table width="98%" align="center" cellpadding="0" cellspacing="2">
	<tr height="20">
	    <td height="20" bgcolor="#EFEFEF" class="style5" align="left" width="10%">Edition</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="12%">Nomination</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="14%">Nominee</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="8%">Date of story</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="8%">Location</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="15%">Attachment</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="19%">Remark</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="4%">Point</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="4%">Submit</td>
	

	</tr>

<%
	hiddMonthYear  = (String) request.getParameter("hiddMonthYear");

	Object objArr[] = new Object[5];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = timescapeUserOId;
	objArr[2] = "'L'";

	prevMonthYear1 = " '" + prevMonthYear1 + "'";
	if(hiddMonthYear != null)
	{
		hiddMonthYear = " '" + hiddMonthYear + "'";
	}
	if(hiddMonthYear == null)
	{
		objArr[3] = prevMonthYear1 ;
	}else{
		objArr[3] = hiddMonthYear ;
	}
	objArr[4] = "4" ;

	Hashtable searchHash = new Hashtable();
	searchHash.put("queryId", "1009");
	searchHash.put("arguments", objArr);

	ArrayList approveNominations = mtAwardController.viewAlert(searchHash);
	
	if(approveNominations!=null && approveNominations.size()>0)
	{
		String oldCategory = "";
		for (int i = 0; i < approveNominations.size(); i++)
		{
			String nominationDetail[] = (String[]) approveNominations.get(i);
			Hashtable headerHash = xmlObj.readSubNode(nominationDetail[13], "header");
			Hashtable detailsHash = xmlObj.readSubNode(nominationDetail[14], "detailValues");
			String stroyLink =(String)detailsHash.get("storyLink-");
			String attachment = (String)detailsHash.get("attachment-");
			String link = "/attachments/" + attachment;
			String remarkName = "remark" + i;
			String pointName = "point" + i;
			if(nominationDetail[8].equals(oldCategory))
			{
%>
				<tr height="20">
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("edition-")%>
					<td class = "style3Underline" height = "20" align = "left"><a href = "<%=(String)detailsHash.get("storyLink-")%>" class="style3Underline" target = "_blank"><%=(String)headerHash.get("nomination-")%></a></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("nominee-")%></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("storydate-")%></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("nomineeLocation-")%></td>
<%
	if (attachment.equals("-"))
	{
%>
					<td class = "style3" height = "20" align = "left">
					<%=attachment%></td>
<%
	}else{
%>
					<td class = "style3" height = "20" align = "left">
					<a href= "<%=link%>" class="style3Underline" target = "_blank"><%=attachment%></a></td>
<%
	}
%>

					<td class = "style3" width="200" height = "20" align = "left">
						<textarea rows="5" cols="30" class = "style3" name = "<%=remarkName%>" style ="height:50px;width:160px;"></textarea>
					</td>

					<td>
						<select class = "style3" name = "<%=pointName%>" >
<%
							for(int ii = 1; ii<= 50; ii++)
							{
%>
								<option value=<%=ii%>><%=ii%></option>
<%
							}
%>
						</select>
					</td>
					<td class = "style3Underline" width = "59" height = "20" align = "center">
						<a href="javascript:validate('<%=nominationDetail[0]%>','<%=nominationDetail[1]%>','<%=i%>','<%=nominationDetail[16]%>' , '<%=nominationDetail[17]%>')" class="style3Underline">Submit</a>
					</td>
				</tr>
<%
			}//end of inner if
			else{
				if(i != 0)
				{
%>
					<tr height=>
					<td height="1" colspan="10" align="right" bgcolor="#666666" class="menu2"><img src="images/spacer.gif" width="1" height="1" /></td>
					</tr>
					
<%
				}
				oldCategory = nominationDetail[8];
%>
				<tr height="25">
					 <td align="left" class="style3" colspan="10"><b><%=oldCategory%></b></td>
				</tr>
				<tr height="20">
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("edition-")%>
					<td class = "style3Underline" height = "20" align = "left"><a href = "<%=(String)detailsHash.get("storyLink-")%>" class="style3Underline" target = "_blank"><%=(String)headerHash.get("nomination-")%></a></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("nominee-")%></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("storydate-")%></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("nomineeLocation-")%></td>
<%
	if (attachment.equals("-"))
	{
%>
					<td class = "style3" height = "20" align = "left">
					<%=attachment%></td>
<%
	}else{
%>
					<td class = "style3" height = "20" align = "left">
					<a href= "<%=link%>" class="style3Underline" target = "_blank"><%=attachment%></a></td>
<%
	}
%>

					<td class = "style3" width="200" height = "20" align = "left">
						<textarea rows="5" cols="30" class = "style3" name = "<%=remarkName%>" style ="height:50px;width:160px;"></textarea>
					</td>
					<td>
						<select class = "style3" name = <%=pointName%> >
<%
							for(int ii = 1; ii<= 50; ii++)
							{
%>
								<option value=<%=ii%>><%=ii%></option>
<%
							}
%>
						</select>

					<td class = "style3Underline" width = "59" height = "20" align = "center">
						<a href="javascript:validate('<%=nominationDetail[0]%>','<%=nominationDetail[1]%>','<%=i%>','<%=nominationDetail[16]%>' , '<%=nominationDetail[17]%>')" class="style3Underline">Submit</a>
					</td>
 				</tr>
<%	
			}//end of else
		}//enf of for
	}//end of main if
	else{
%>
	<tr>
		<td bgcolor = "FFFFFF"><img src = "../images/spacer.gif" width = "1" height = "5"></td>
	</tr>	
	<tr>
		<td bgcolor = "FFFFFF" colspan="100%" align="center" class = "style5">No Nomination requests for Mata Talent Award are pending for approval !!!</td>
	</tr>
<%
	}//end of main if-else
%>
</table>
<!-- Hidden Fields -->
	<input type="hidden" name="hiddNominationNo" value=""/>
	<input type="hidden" name="hiddRemark" value=""/>
	<input type="hidden" name="hiddAlertNo" value=""/>
	<input type="hidden" name="hiddenMonthYear" value= "<%=monthYear%>">
	<input type="hidden" name="hiddParentCatCode" value=""/>
	<input type="hidden" name="hiddCatCode" value=""/>
<!------------------->