<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />

<%
	
    String currAppliedMonth			= "";

    ArrayList claimAmount = null;

    ArrayList viewDetails = new ArrayList();

    String[] arr1;

    arr1 = new String[50];       

	String noOfRows			= request.getParameter("noOfRows");

	//out.println(noOfRows);
	String todayDay			= request.getParameter("todayDay");

	String reviewedBy		= request.getParameter("reviewedBy");

	String selectApprover		= request.getParameter("email");

	int reqestorAmount = 0;

	String allwanceType = "";

	int reqestorAmount1 = 0;
	int reqestorAmount2 = 0;


	claimAmount = rmdAllowanceClaimDetails.getAmount(companyCode, branchCode, locationCode, deptGroup);

		for(int mm=0; mm<claimAmount.size() ; mm++)
		{
			String[] reqAmount = (String[]) claimAmount.get(mm);

			reqestorAmount		= Integer.parseInt(reqAmount[3]);
			//out.println(reqestorAmount);

			 allwanceType		= reqAmount[4];
			

			if(allwanceType.equals("NA"))
			{
				
				reqestorAmount1 = reqestorAmount;

			}
			else if(allwanceType.equals("FA"))
			{
				
				reqestorAmount2 = reqestorAmount;
			}
		}
//out.println(allwanceType);
//out.println(reqestorAmount1);
//out.println(reqestorAmount2);


    //out.println("email=="+selectApprover);
	int rows = 0;
	int count = 0;

	String[] currentDate	= null;
	String[] weekDay    	= null;
	String[] type	= null;
	String[] monthList = {"Month", "JAN" , "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG" ,"SEP", "OCT", "NOV", "DEC" };

	if(noOfRows!=null){

		rows = Integer.parseInt(noOfRows);
	}

	currentDate	    = new String[rows];
	weekDay		    = new String[rows];
	type			= new String[rows];
	

	String fromDay				= "";
//	String totalA				= "";
//	String totalB				= "";
//	String totalABC				= "";
	String selectMonth			= "";
	String selectYear			= "";
	String appliedMonth			= "";
	String monthName			= "";
	
%>

<html>
	<head>
		<title>FIELD/NIGHT ALLOWANCE PREVIEW</title>
		<link rel="stylesheet" href="../style/global.css" />
		<link rel="stylesheet" href="../style/common.css" />
		 <script Language="JavaScript" src="../jscripts/previewRequest.js"> 
		</script>
	</head>

<%
	if(true)
	{
		// Getting the submitted values from the previous page
		// Getting the header Details
		selectMonth = (String) request.getParameter("selectMonth");
		int month = Integer.parseInt(selectMonth);
		//out.println("----selectMonth" +selectMonth);
		monthName = monthList[month];
		selectYear = (String) request.getParameter("selectYear");
		int year = Integer.parseInt(selectYear);
		//out.println("===" +year);


		if(selectMonth.length( )==1)
		{
			selectMonth = "0" + selectMonth;
		}

		appliedMonth = selectYear + selectMonth;
      
	    //GregorianCalendar today = new GregorianCalendar();
        //int todayDay = today.get(Calendar.DAY_OF_MONTH);
		
		for(int ii=0; ii<rows; ii++)
		{
		// Get fromDate in the 'YYYY-MM-DD' format
			fromDay = (String) request.getParameter("fromDay"+ii);
			int day = Integer.parseInt(fromDay);
			currentDate[ii] = Utility.returnDate(day, month, year);
			//out.println(currentDate[ii]);
			
			weekDay[ii] = (String) request.getParameter("weekday"+ii);
			//remarks[ii] = (String) request.getParameter("remarks"+ii);
			//out.println(remarks[ii]);
			

				
		} // end of for loop

	}
%>

  <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"> 
  <%@ include file="../includes/rmdClaimHeader.html" %>
  <%@ include file="../includes/rmdClaimMenu.jsp" %>  

	<table width="100%" border="0" cellspacing="1" cellpadding="2">
	<form name="frmPreviewtechClaim" method="post">
		
<%
                 viewDetails = rmdAllowanceClaimDetails.checkRequest(timescapeUserOId, appliedMonth);
                    
                 if (viewDetails.size()!= 0){
%>
               <tr>
					<td colspan="100%">&nbsp;
					</td>
				</tr>
				<tr width="100%" align="center" class="normal">
					<td width="100%"align="center" class="bold">CLAIMS HAS ALREADY BEEN APPLIED FOR THE SELECTED MONTH AND YEAR!!!</td>
				</tr>
				<tr>
					<td colspan="100%">&nbsp;
					</td>
				</tr>
				<tr>
					<td width="100%"align="center">
					<a href="javascript:history.back( )"><img src="../images/but_back.gif" border="0"></a></td>
				</tr>
				
<%
                } else {

%>
	        <input type="hidden" name="noOfRows"       value="<%=noOfRows%>" >
			<input type="hidden" name="appliedMonth"   value="<%=appliedMonth%>" >
			<input type="hidden" name="selectedMonth"  value="<%=monthName%>" >
			<input type="hidden" name="selectedYear"   value="<%=selectYear%>">
			<input type="hidden" name="selectApprover" value="<%=selectApprover%>">
			
			<tr>
				<td colspan="100%" align="center" class="bold" height="8">&nbsp;</td>
			</tr>
			<table width="100%">
				<tr>
					
					<td width="16%" align="center" class="bold" height="20">Name :</td>
					<td width="34%" align="left" class="normal" height="20"><%=displayName%></td>
					<td width="16%" align="center" class="bold" height="20">Department :</td>
					<td width="34%" align="left" class="normal" height="20"><%=deptName%></td>
				 </tr>	
	  
	  			<tr>
					<td width="16%" align="center" class="bold" height="20">Month  :</td>
					<td width="34%" align="left" class="normal" height="20"><%=monthName%>&nbsp;-&nbsp;<%=selectYear%></td>
					<td width="16%" align="center" class="bold" height="20">SAP NUMBER :</td>
					<td width="34%" align="left" class="normal" height="20"><%=sapId%></td>
				</tr>	
			</table>
				
			<table width="100%" border="0" cellspacing="1" cellpadding="0">

				<tr width="100%" bgcolor="#CCCCCC" align="left" >
					<td class="boldsmall" align="left" width="15%" height="35">&nbsp;&nbsp;DATE</td>
					<td class="boldsmall" align="left" width="15%" height="35">&nbsp;&nbsp;DAY</td>
					<td class="boldsmall" align="left" width="25%" height="35">&nbsp;&nbsp;ALLOWANCE TYPE</td>
					<td class="boldsmall" align="left" width="15%" height="35">&nbsp;&nbsp;AMOUNT</td>
					<td class="boldsmall" align="left" width="30%" height="35">&nbsp;&nbsp;CLIENT VISIT DETAILS</td>
										
				</tr>
				<tr align="left" >
					<td colspan="8" class="normal" height="5"><block type="spacer" height="5"></td>
				</tr>
				
<%
				int amount = 0;
					
				for(int ii=0; ii<rows ; ii++)
				{
						
					String particularCheck = (String) request.getParameter("particularsChk"+ii);
					String visitDetails = (String) request.getParameter("visitDetails"+ii);
				
			
				if((particularCheck!=null && !(particularCheck.trim().equals("") || particularCheck.equals("0"))))
				{
					String type1 = (String) request.getParameter("type"+ii);
							
					count = count+1; 
%>
				<tr width="100%">
					<td class="normal" align="left" style="border-bottom:1px solid #cccccc" height="30">&nbsp;&nbsp;<%=currentDate[ii]%></td>
					<td class="normal" align="left" style="border-bottom:1px solid #cccccc" height="30">&nbsp;&nbsp;<%=weekDay[ii]%></td>
					<td class="normal" align="left" style="border-bottom:1px solid #cccccc" height="30">&nbsp;&nbsp;<%=type1%></td>
<%
				if(type1.equals("Night"))
					{

%>
				<td class="normal" align="left" style="border-bottom:1px solid #cccccc" height="30">&nbsp;&nbsp;<%=reqestorAmount1%></td>
<%
					reqestorAmount = reqestorAmount1;
					}else if(type1.equals("Field"))
					{

%>
				<td class="normal" align="left" style="border-bottom:1px solid #cccccc" height="30">&nbsp;&nbsp;<%=reqestorAmount2%></td>
<%
					reqestorAmount = reqestorAmount2;
					}	
	
					if(particularCheck.equals("on"))
					{
						amount = amount + reqestorAmount;
					}	
%>
					<td class="normal" align="left" style="border-bottom:1px solid #cccccc" height="30">&nbsp;&nbsp;<%=visitDetails%></td>
					<input type="hidden" name="currentDate<%=ii%>" value="<%=currentDate[ii]%>">
					<input type="hidden" name="weekDay<%=ii%>" value="<%=weekDay[ii]%>">
					<input type="hidden" name="type<%=ii%>" value="<%=type1%>">
					<input type="hidden" name="visitDetails<%=ii%>" value="<%=visitDetails%>">
					<input type="hidden" name="reqestorAmount1<%=ii%>" value="<%=reqestorAmount1%>">
					<input type="hidden" name="reqestorAmount2<%=ii%>" value="<%=reqestorAmount2%>">

<%					
					}// end of if 
				else 
					continue; 					
					
					} // end of for loop
					
					int countrows = count;
					//out.println("reqestorAmount="+reqestorAmount);
					//int amount = countrows * reqestorAmount;
					
%>
					<input type="hidden" name="countrows" value="<%=countrows%>">
					<input type="hidden" name="amount" value="<%=amount%>">
					
				</tr>
				
				<tr align="left" >
					<td colspan="9" class="normal" height="5"><block type="spacer" height="5"></td>
				</tr>
				<tr width="100%">
					<td class="normal" align="left" colspan="3" style="border-bottom:1px solid #cccccc" height="20">&nbsp;</td>
					<td class="bold" align="right" style="border-bottom:1px solid #cccccc" height="20">Total Amount:&nbsp;</td>
					<td class="normal" align="left" style="border-bottom:1px solid #cccccc" height="20">&nbsp;<%=amount%></td>
				</tr>
			</table>
			 <table width="100%">
				<tr>
					<td colspan="100%">&nbsp;
					</td>
				</tr>
                		<tr>
					<td width="100%" align="center">
						<input type="button" value=" Submit " height="20" onclick = "this.disabled= true;add();this.value='Wait...'"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value=" Back " onclick= "javascript:history.back();" />
					</td>
				</tr>
<%
                }
%>
			</table> 
		</form>
		</table>
	</body> 
</html>


