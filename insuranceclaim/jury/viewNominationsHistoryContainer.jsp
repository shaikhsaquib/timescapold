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

		//System.out.println("prev month1 ="+prevMonthYear1);
		//System.out.println("prev month2 ="+prevMonthYear2);
		//prevYear = today.get(Calendar.YEAR)-1;
		//System.out.println("curruent year ="+currYear);
		//System.out.println("previous year ="+prevYear);
		//selYear = currYear-1;
		//lastYear = currYear - 2;
		
		//System.out.println("curruent month ="+currMonth);
		
		//System.out.println("month year ="+monthYear);
	}
	
%>


<!-- <table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
		<td height = "35">
			&nbsp;<%=breadcrumbs%>
		</td>
	</tr>
</table> -->

<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align="center">
	 <!-- <tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/space.gif" width="1" /></td>
     </tr> -->
     <tr>
          <td align="left" width = "100%" background="../images/red_shadow.jpg"  bgcolor="#D60202" height="20" colspan = "100%"><div align="center"><span class="style5Copy">V I E W &nbsp;&nbsp;&nbsp;N O M I N A T I O N &nbsp;&nbsp;&nbsp;H I S T O R Y </span></div></td>
    </tr>
    <tr>
          <td bgcolor="#cccccc" height="1"><img height="1" src="../images/space.gif" width="1" /></td>
     </tr>
     <tr>
		<td align="left" colspan="100%" height="26"><div align="right"><span class="style3"><img src="../images/inProcess.png" width="20" height="20" /> In Process | <img src="../images/processed.png" width="20" height="20" /> Processed | <img src="../images/jurySelected.png" width="20" height="20" />Jury Selected | <img src="../images/awarded.png" width="20" height="20" /></span><span class="style3">Awarded &nbsp;&nbsp;</span></div></td>
	</tr>
     <tr>
	<input type="hidden" name="hiddMonthYear" value= "">
		<td align="left" bgcolor="#cccccc" colspan="3" height="1"><img height="1" src="spacer.gif" width="1"/>
		 </td>
<%
	hiddMonthYear  = (String) request.getParameter("hiddMonthYear");
	if(hiddMonthYear==null || hiddMonthYear.equals(currMonthYear))
	{
%>
		 <td bgcolor="#cccccc" class = "style5" align = "right">Select Month-Year&nbsp;&nbsp;
		 		<select class = "style3" name = "monthyear" >
				<option value = "<%=prevMonthYear2%>" ><%=prevMonthYear2%></option>
				<option value = "<%=prevMonthYear1%>" ><%=prevMonthYear1%></option>
				<option value = "<%=currMonthYear%>" selected><%=currMonthYear%></option>

			</select>
		</td>
<%
		
	
	}else{

		if(hiddMonthYear.equals(prevMonthYear1))
		{
%>
		<td bgcolor="#cccccc" class = "style5" align = "right">Select Month-Year&nbsp;&nbsp;
		 		<select class = "style3" name = "monthyear" >
				<option value = "<%=prevMonthYear2%>" ><%=prevMonthYear2%></option>
				<option value = "<%=prevMonthYear1%>" selected><%=prevMonthYear1%></option>
				<option value = "<%=currMonthYear%>" ><%=currMonthYear%></option>

			</select>
		</td>
<%
		}else{
%>		
		<td bgcolor="#cccccc" class = "style5" align = "right">Select Month-Year&nbsp;&nbsp;
		 		<select class = "style3" name = "monthyear" >
				<option value = "<%=prevMonthYear2%>"  selected ><%=prevMonthYear2%></option>
				<option value = "<%=prevMonthYear1%>"><%=prevMonthYear1%></option>
				<option value = "<%=currMonthYear%>" ><%=currMonthYear%></option>
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
	    <td height="20" bgcolor="#EFEFEF" class="style5" align="left" width="7%">Category</td>
		<td bgcolor = "#EFEFEF" class = "style5" align="left" width="8%">Location</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="25%">Nomination</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="7%">Date of story</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="10%">Nominee</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="25%">Rationale</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="15%">Attachment</td>
		<!-- <td bgcolor = "#EFEFEF" class = "style5" align = "left">Link</td> -->
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="3%">Status</td>
		
	</tr>
<%

	hiddMonthYear  = (String) request.getParameter("hiddMonthYear");
	//System.out.println("Hello");
	//System.out.println("month is " + hiddMonthYear);

	ArrayList nominationHistory = new ArrayList();
	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = "'DD-MON-YYYY'";
	
	currMonthYear = " '" + currMonthYear + "'";
	
	if(hiddMonthYear != null)
	{
		hiddMonthYear = " '" + hiddMonthYear + "'";
	}
	
	if(hiddMonthYear == null)
	{
		objArr[2] = currMonthYear ;
	}else{
		objArr[2] = hiddMonthYear ;
	}
	
	Hashtable searchHash = new Hashtable();
	searchHash.put("queryId", "1012");
	searchHash.put("arguments", objArr);

	
	nominationHistory = storyAwardController.viewNomination(searchHash);
	
	String oldCategory = "";
	if(nominationHistory!=null && nominationHistory.size()>0)
	{
		for (int i = 0; i < nominationHistory.size(); i++)
		{
			String nominationDetail[] = (String[]) nominationHistory.get(i);
			
			Hashtable detailsHash = xmlObj.readSubNode(nominationDetail[4], "details");
			Hashtable headerHash = xmlObj.readSubNode(nominationDetail[3], "header");

			String uploadFilePath = (String)detailsHash.get("uploadFilePath-");

			if(nominationDetail[8].equals(oldCategory))
			{

%>
				<tr>
					<td>&nbsp;</td>
					<td class = "style3" height = "20" align = "left"><%=nominationDetail[17]%>
					<td class = "style3Underline" height = "20" align = "left"><a href = "<%=(String)detailsHash.get("storyLink-")%>" class="style3Underline" target = "_blank"><%=(String)headerHash.get("nomination-")%></a></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("storydate-")%></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("nominee-")%></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("impact-")%></td>
					
<%
	if (uploadFilePath.equals("-"))
	{
%>
					<td class = "style3" height = "20" align = "left">
					<%=(String)detailsHash.get("uploadFilePath-")%></td>
<%
	}else{
	String link = "/attachments/" + (String)detailsHash.get("uploadFilePath-");
%>
					<td class = "style3" height = "20" align = "left">
					<a href= "<%=link%>" class="style3Underline" target = "_blank"><%=(String)detailsHash.get("uploadFilePath-")%></a></td>
<%
	}
%>					
					<td class = "style3" width = "101" height = "20" align = "left"><img src="../images/<%=(String)requestStatus.get(nominationDetail[15]+nominationDetail[16])%>" width="20" height="20" /></td>
				</tr>
<%
			}else{
						if(i != 0)
				{
%>
					<tr height="38">
					<td height="1" colspan="8" align="right" bgcolor="#666666" class="menu2"><img src="images/spacer.gif" width="1" height="1" /></td>
					</tr>
<%
				}

				oldCategory = nominationDetail[8];
			//	if(testRole.equals("3"))
			//	{
%>
				<tr>
					
					<td class = "style3" width="124" height = "20" align = "left"><%=oldCategory%></td>
					
					<td class = "style3" height = "20" align = "left"><%=nominationDetail[17]%>
					<td class = "style3Underline" height = "20" align = "left"><a href = "<%=(String)detailsHash.get("storyLink-")%>" class="style3Underline" target = "_blank"><%=(String)headerHash.get("nomination-")%></a></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("storydate-")%></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("nominee-")%></td>
					<td class = "style3" height = "20" align = "left"><%=(String)headerHash.get("impact-")%></td>
					
<%
	if (uploadFilePath.equals("-"))
	{
%>
					<td class = "style3" height = "20" align = "left">
					<%=(String)detailsHash.get("uploadFilePath-")%></td>
<%
	}else{
	String link = "/attachments/" + (String)detailsHash.get("uploadFilePath-");
%>
					<td class = "style3" height = "20" align = "left">
					<a href= "<%=link%>" class="style3Underline" target = "_blank"><%=(String)detailsHash.get("uploadFilePath-")%></a></td>
<%
	}
%>					
					<td class = "style3" width = "101" height = "20" align = "left"><img src="../images/<%=(String)requestStatus.get(nominationDetail[15]+nominationDetail[16])%>" width="20" height="20" /></td>
				</tr>
<%
			}
		}
	}else{
%>
	<tr>
		<td bgcolor = "FFFFFF"><img src = "../images/spacer.gif" width = "1" height = "5"></td>
	</tr>
	<tr>
		<td bgcolor = "FFFFFF" colspan="100%" align="center" class = "style5">You have not filled any Nomination for Mata Talent Award !!!</td>
	</tr>
<%
	}
%>
	<tr>
		<td bgcolor = "FFFFFF"><img src = "../images/spacer.gif" width = "1" height = "1"></td>
	</tr>
</table>