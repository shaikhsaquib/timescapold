 <%
	String [] months = {"0", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
    String weekArr[] = {"","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
	String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
	//String monthArr[] = {"01","02","03","04","05","06","07","08","09","10","11","12"};
	Hashtable claimRequestHash = new Hashtable( );
	Hashtable allClaimRequestHash = new Hashtable( );
	GregorianCalendar today = new GregorianCalendar();
   
    String date = "";
    String date1 = "";

    ArrayList myClaimRequest = new ArrayList();
    ArrayList allClaimRequest = new ArrayList();
	String option  = (String) request.getParameter("option");
	String hiddstatus = "";
	String hiddyear = "";
	String hiddmonth1 = "";
	String status = "";
	String fromDate = "";
	String toDate = "";
	int hiddmonth = 0;
	String monthStr = "";
	String monYear = "";
	int lastYear = 0;
	int currYear = 0;
	int selYear = 0;
	int currMonth = 0;
	String comp = "";
	String policy = "";

    status = (String) request.getParameter("status");
    fromDate = (String) request.getParameter("fromDate");
    toDate = (String) request.getParameter("toDate");
	comp = (String) request.getParameter("comp");
	policy = (String) request.getParameter("policy");


	String sel = comp;

	
    
    if(date == null || date.equals("")) {
				date = Integer.toString(today.get(Calendar.DAY_OF_MONTH));
				if(date.length() == 1) {
					date = "0" + date;
				}
				date += "-" +monthArr[today.get(Calendar.MONTH)]+ "-" + today.get(Calendar.YEAR);
				//out.println("date444"+date);
			}

    if(date1 == null || date1.equals("")) {
				date1 = Integer.toString(today.get(Calendar.DAY_OF_MONTH));
				if(date1.length() == 1) {
					date1 = "0" + date1;
				}
				date1 += "-" +monthArr[today.get(Calendar.MONTH)]+ "-" + today.get(Calendar.YEAR);
				//out.println("date444"+date);
			}

   if(comp == null){
	   comp = "ALL";
   }

	if (fromDate == null || fromDate.equals("")){
    
        fromDate = date;

    }

    if (toDate == null || toDate.equals("")){
    
        toDate = date1;

    }

	Object objArr[] = new Object[6];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = fromDate;
	objArr[3] = toDate;
	objArr[4] = comp;
	objArr[5] = policy;

    if(status == null)
		{
			status = "all";
		}


    if(status.equals("settled"))
		{
			objArr[2] = "'S'";
		}
		else if(status.equals("areject"))
		{
			objArr[2] = "'R'";
		}
		else if(status.equals("ireject"))
		{
			objArr[2] = "'IR'";
		}
		else if(status.equals("wuser"))
		{
			objArr[2] = "'W'";
		}
		else if(status.equals("hold"))
		{
			objArr[2] = "'H'";
		}
        else if(status.equals("pending"))
		{
			objArr[2] = "'P'";
		}
        else if(status.equals("all"))
		{
			objArr[2] = "'S','R','IR','W','H','P','A','AF','L','UC','UF'";
		}
	
	
	if(comp.equals("ALL")){
		claimRequestHash.put("queryId", "1006");  
	}else{
	claimRequestHash.put("queryId", "1003");                                      
	}

	claimRequestHash.put("arguments", objArr);

	myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

	hiddstatus = (String) request.getParameter("hiddstatus");
	hiddyear = (String) request.getParameter("hiddyear");
	hiddmonth1 = (String) request.getParameter("hiddmonth1");


	if(hiddstatus == null)
	{
		hiddstatus = "settled";
	}
	if(hiddyear == null)
	{
		hiddyear = "2011";
	}
	if(hiddmonth1 == null)
	{
		hiddmonth1 = currMonth + "";
	}
	//System.out.println(hiddmonth1);
%>
<input type="hidden" name="option">
<input type="hidden" name="hiddstatus">
<input type="hidden" name="hiddyear">
<input type="hidden" name="hiddmonth1">

<table width="100%" border="0" cellspacing="0" cellpadding="0" >
	<tr>
<%
	    if(status.equals("settled")){
%>
		<td align="left" class="style3" bgcolor="#cccccc" >
		Status&nbsp;:&nbsp;<select id="status" name="status" class="style3">
				  <option value="settled" class="style3" selected>Settled</option>			
				  <option value="areject" class="style3" >Rejected(Approver)</option>
				  <option value="ireject" class="style3">Rejected(Insurance Company)</option>
				  <option value="wuser" class="style3">Withdrawn(User)</option>
				  <option value="hold" class="style3">On Hold</option>
                  <option value="pending" class="style3">Pending</option>
                  <option value="all" class="style3" >All</option>
			 </select>
<%
	}else if(status.equals("areject")){
%>
		<td align="left" class="style3" bgcolor="#cccccc">
		Status&nbsp;:&nbsp;<select id="status" name="status" class="style3">
				  <option value="settled" class="style3" >Settled</option>			
				  <option value="areject" class="style3" selected>Rejected(Approver)</option>
				  <option value="ireject" class="style3" >Rejected(Insurance Company)</option>
				  <option value="wuser" class="style3">Withdrawn(User)</option>
				  <option value="hold" class="style3">On Hold</option>
                  <option value="pending" class="style3">Pending</option>
                  <option value="all" class="style3" >All</option>
			 </select>
<%
	}else if(status.equals("ireject")){
%>
		<td align="left" class="style3" bgcolor="#cccccc">
		Status&nbsp;:&nbsp;<select id="status" name="status" class="style3">
				  <option value="settled" class="style3" >Settled</option>			
				  <option value="areject" class="style3" >Rejected(Approver)</option>
				  <option value="ireject" class="style3" selected>Rejected(Insurance Company)</option>
				  <option value="wuser" class="style3">Withdrawn(User)</option>
				  <option value="hold" class="style3">On Hold</option>
                  <option value="pending" class="style3">Pending</option>
                  <option value="all" class="style3" >All</option>
			 </select>
<%
	}else if(status.equals("wuser")){
%>
		<td align="left" class="style3" bgcolor="#cccccc">
		Status&nbsp;:&nbsp;<select id="status" name="status" class="style3">
				  <option value="settled" class="style3" >Settled</option>			
				  <option value="areject" class="style3" >Rejected(Approver)</option>
				  <option value="ireject" class="style3" >Rejected(Insurance Company)</option>
				  <option value="wuser" class="style3" selected>Withdrawn(User)</option>
				  <option value="hold" class="style3">On Hold</option>
                   <option value="pending" class="style3">Pending</option>
                   <option value="all" class="style3" >All</option>
			 </select>
<%
	}else if(status.equals("hold")){
%>
		<td align="left" class="style3" bgcolor="#cccccc">
		Status&nbsp;:&nbsp;<select id="status" name="status" class="style3">
				  <option value="settled" class="style3" >Settled</option>			
				  <option value="areject" class="style3" >Rejected(Approver)</option>
				  <option value="ireject" class="style3" >Rejected(Insurance Company)</option>
				  <option value="wuser" class="style3" >Withdrawn(User)</option>
				  <option value="hold" class="style3" selected>On Hold</option>
                  <option value="pending" class="style3">Pending</option>
                  <option value="all" class="style3" >All</option>
			 </select></td>
<%
	}else if(status.equals("pending")){
%>
		<td align="left" class="style3" bgcolor="#cccccc">
		Status&nbsp;:&nbsp;<select id="status" name="status" class="style3">
				  <option value="settled" class="style3" >Settled</option>			
				  <option value="areject" class="style3" >Rejected(Approver)</option>
				  <option value="ireject" class="style3" >Rejected(Insurance Company)</option>
				  <option value="wuser" class="style3" >Withdrawn(User)</option>
				  <option value="hold" class="style3">On Hold</option>
				  <option value="pending" class="style3" selected>Pending</option>
                  <option value="all" class="style3" >All</option>
			 </select></td>
<%
	}else if(status.equals("all")){
%>
		<td align="left" class="style3" bgcolor="#cccccc">
		Status&nbsp;:&nbsp;<select id="status" name="status" class="style3">
				  <option value="settled" class="style3" >Settled</option>			
				  <option value="areject" class="style3" >Rejected(Approver)</option>
				  <option value="ireject" class="style3" >Rejected(Insurance Company)</option>
				  <option value="wuser" class="style3" >Withdrawn(User)</option>
				  <option value="hold" class="style3">On Hold</option>
				  <option value="pending" class="style3" >Pending</option>
                  <option value="all" class="style3" selected>All</option>
			 </select></td>
<%
	}
%>

   
		<%
		ArrayList company = insuranceClaimController.searchCompanyDetails();
		%>
		<td class="style3" align="left" bgcolor="#cccccc">&nbsp;&nbsp;Company&nbsp;:&nbsp;
		<select id="company" name="company" class="style3" onchange="getPolicy(this.value,'subPolicy','../common/subPolicy.jsp')">
		<option class="style3" value="0">Select Company</option>
<%
		if(("ALL".equals(comp))){
%>
			<option class="style3" value="ALL" selected>ALL</option>
<%
		}else{
%>
			<option class="style3" value="ALL">ALL</option>	

		<%
		}//String companyCode = 0;
			for(int i=0; i < company.size(); i++)
			{
				String companyDetails[] = (String[]) company.get(i);
				sel = companyDetails[1];
				
				if((sel.equals(comp))){
		%>		
					<option class="style3" value = "<%=companyDetails[1]%>" selected><%=companyDetails[0]%></option>
		<%
				}else{			
		%>
				<option class="style3" value = "<%=companyDetails[1]%>" ><%=companyDetails[0]%></option>
		<%
				}		
			}
		%>
		
		</select>&nbsp;
		</td>
		<%
			if(comp.equals("ALL")){
		%>
		<td></td>
		<%
		}else{	
		%>
		<td class="style3" align="left" bgcolor="#cccccc" width ="5%">Policy :</td>
		<%
			}	
		%>
		<td id="subPolicy" class="normal" align="left" width="15%" bgcolor="#cccccc">
		<select class="style3">
			<option>Select Policy</option>
		</select>
		</td>
		<td class="style3" align="left" bgcolor="#cccccc" value = "fDate" width ="10%">From Date :
		<input type="text" style="text-align:left" class="style3" name="closureMonth"
		id="fromdate1" size="10" onfocus="showCalendarControl(this);" readOnly value="<%=fromDate%>"></td>

        <td class="style3" align="left" bgcolor="#cccccc" value = "tDate" width ="10%">To Date :
		<input type="text" style="text-align:left" class="style3" name="closureMonth"
		id="todate1" size="10" onfocus="showCalendarControl(this);" readOnly value="<%=toDate%>"/>&nbsp;<a href="#" ><img src="../images/greyarrow.png" border="0" align = "center" onclick="test(document.getElementById('status').value)"></a></td>

		<td align="right"  height="26" bgcolor="#cccccc" width ="10%"><div align="left"><span class="style5">
	<!-- 	<a href="../common/insuranceExcelReports.jsp?hiddyear=<%=hiddyear%>&hiddmonth=<%=hiddmonth1%>">Open / Save Report to Excel <img src="../images/icon_excel.gif" width="15" height="22" border="0"/></a> -->
        <a href="../common/insuranceExcelReports.jsp?status=<%=status%>&fromDate=<%=fromDate%>&toDate=<%=toDate%>&company=<%=comp%>&policy=<%=policy%>">Open / Save Report<img src="../images/icon_excel.gif" width="15" height="15" border="0"/></a>
		</td>
	</tr>
</table>

<table width="98%"  align="center" cellpadding="0" cellspacing="2">
	<tr height="20">
		<td height="20" bgcolor="#EFEFEF" class="style5" align="left" width="3%">Request No</td>
		<td height="20" bgcolor="#EFEFEF" class="style5" align="left" width="3%">Claim No</td>
		<td height="20" bgcolor="#EFEFEF" class="style5" align="left" width="12%">Entity Name</td>
		<td height="20" bgcolor="#EFEFEF" class="style5" align="left" width="12%">Entity Location</td>
	    <td bgcolor = "#EFEFEF" class="style5" align="left" width="16%">Item Name</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="11%">Date of Loss</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="13%">Cause of Damage</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="8%">Settled Amount</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="12%">Updated Loss Amount</td>
		<td bgcolor = "#EFEFEF" class = "style5" align = "left" width="6%">Status</td>
	</tr>
<%
	
	if(myClaimRequest!=null && myClaimRequest.size()>0)
	{
		for (int i = 0; i < myClaimRequest.size(); i++)
		{
			String myClaimRequestDetail[] = (String[]) myClaimRequest.get(i);

			Hashtable userClaimDetailHash = xmlObj.readSubNode(myClaimRequestDetail[3], "userClaimDetails");
            Hashtable userDetailHash = xmlObj.readSubNode(myClaimRequestDetail[2], "userDetails");

			String idDisplay = myClaimRequestDetail[9].substring(myClaimRequestDetail[9].lastIndexOf("-")+1)+myClaimRequestDetail[9].substring(myClaimRequestDetail[9].indexOf("-")+1,myClaimRequestDetail[9].lastIndexOf("-"))+myClaimRequestDetail[9].substring(0,myClaimRequestDetail[9].indexOf("-")); 

%>
				<tr height="20">
					<td class = "style3Underline" width = "20%" height = "20" align = "left">
					<a href="javascript:void window.open('../common/checkRequestDetails.jsp?requestno=<%=myClaimRequestDetail[0]%>','','resizable=yes,toolbars=no,scrollbars=yes,width=800,height=600,top=50,left=50')" 			
					class="style3Underline"><%=idDisplay.toLowerCase()%><%=myClaimRequestDetail[0]%></a>
					</td>
					<td class = "style3" height = "20" align = "left"><%=myClaimRequestDetail[1]%></td>
                    <td class = "style3" height = "5" align = "left"><%=(String)userDetailHash.get("company-")%></td>
					<td class = "style3" height = "5" align = "left"><%=(String)userDetailHash.get("location-")%></td>
					<td class = "style3" height = "20" align = "left"><%=(String)userClaimDetailHash.get("claimItemName-")%></td>
					<td class = "style3" height = "20" align = "left"><%=(String)userClaimDetailHash.get("damageDate-")%></a></td>
					<td class = "style3" height = "20" align = "left"><%=(String)userClaimDetailHash.get("damageCause-")%></td>
<%					
					if (myClaimRequestDetail[12].equals("S")) {

							ArrayList settleRemarkList = new ArrayList();
							ArrayList settleList = new ArrayList();
							ArrayList cheque = new ArrayList();

							Hashtable claimSettleHash = new Hashtable();
							Hashtable settleRemarkDetails = new Hashtable();

							String[] tags2 = {"cheque"};

							//System.out.println("on settle page");

							Object objArr2[] = new Object[2];
							objArr2[0] = "'DD-MON-YYYY'";
							objArr2[1] = myClaimRequestDetail[0];

							claimSettleHash.put("queryId", "1001");
							claimSettleHash.put("arguments", objArr2);

							settleList.add(claimSettleHash);

						//	Hashtable reviewerRemarkDetails = insuranceClaimController.viewReviewerRemark(reviewerList,tags);
							settleRemarkList = insuranceClaimController.viewSettleRemark(settleList,tags2);

							for(int k = 0 ; k<settleRemarkList.size(); k++)
							{
								settleRemarkDetails = (Hashtable)settleRemarkList.get(k);
								//System.out.println("settleRemarkDetails"+settleRemarkDetails);
								cheque = (ArrayList)settleRemarkDetails.get("cheque");
								if(cheque!=null)
								{
									for(int jj=0; jj<cheque.size(); jj++)
									{
										Hashtable chequeSettleDetails = (Hashtable)cheque.get(jj);
%>
										<td class = "style3" height = "20" align = "left"><%=(String)chequeSettleDetails.get("chequeAmount")%></td>

<%
									}
								}
							}
					} else {

%>					
						<td class = "style3" height = "20" align = "left">NA</td>

<%
					}
%>
	
<%					
			if (myClaimRequestDetail[12].equals("S")) {
%>
						<td class = "style3" height = "20" align = "left"><%=(String)userClaimDetailHash.get("updatedDamageAmount-")%></td>
<%
			}else{
%>	
						<td class = "style3" height = "20" align = "left">0</td>
<%
			}
%>
			<td class = "style3" height = "20" align = "left"><img src="../images/insuranceIcons/<%=(String)requestStatus.get(myClaimRequestDetail[12])%>" width="20" height="20" /></td>
			</tr>
			<!-- <tr height="20">
				<td height="1" colspan="10" align="right" bgcolor="#666666" class="menu2"><img src="images/spacer.gif" width="1" height="1" /></td>
			</tr> -->
<%				
		} // end of for loop

	}
%>

			
</table>