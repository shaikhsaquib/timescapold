<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.text.SimpleDateFormat,java.util.GregorianCalendar,java.util.Calendar, java.util.Date,java.text.*" %>
<%@ page import="com.bccl.util.Utility,com.bccl.util.HtmlUtil,com.bccl.util.AESencrp"%>
<%@ page import = "java.util.*"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<link href="../../style/calendarControl.css" rel="stylesheet">

<link href="/timescape/sapep/employeeselfservice/priceapproval/OSP/css/popup.css" rel="stylesheet" type="text/css" />
<link href="/timescape/sapep/employeeselfservice/priceapproval/OSP/css/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../../jscripts/Consumables.js"></script>
<script Language="JavaScript" src="../../jscripts/reports.js"></script>

<% String category1 = (String)request.getParameter("category") == null ? "" : (String)request.getParameter("category"); 
	String status1 = (String)request.getParameter("status") == null ? "" : (String)request.getParameter("status"); 
	String fromdate1 = (String)request.getParameter("fromdate") == null ? "" : (String)request.getParameter("fromdate"); 
	String todate1 = (String)request.getParameter("todate") == null ? "" : (String)request.getParameter("todate"); 
	String month1 = (String)request.getParameter("month") == null ? "" : (String)request.getParameter("month") ; 
	String year1 = (String)request.getParameter("year") == null ? "" : (String)request.getParameter("year"); 



	String fromdate = "";
	String todate ="";

	String tOId			=   Long.toString(timescapeUserOId);
	
	ArrayList vStatus	=  new ArrayList();

	vStatus 			=	priceApprovalWebController.viewBuyersLstCon(tOId);

	int len, lenCount, counter =0;
	String temp = "";

	
%>


 <table width="100%" cellspacing="1" cellpadding="1">       
		
		<tr class="greyBG">
			<td width="3%" height="29" >Sr. No</td>
            <td width="10%" align="left">CATAGORY</td> 
            <td width="13%" align="left">PURCHASE APPROVAL ID</td>    
            <td width="15%" align="left">PAR VALUE</td>
            <td width="15%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="8%" align="left">STATUS</td>
            <td width="20%" align="center"colspan="2">ACTION</td>
	</tr>

                                                                 
 <%
  String monthh1 = "";
  String yearr1 = "";
	ArrayList resultList =  new ArrayList();
	
	//out.println("vStatus.size"+vStatus.size()+"===category1"+category1+"===status1"+status1);
 	if(!category1.equals("")  && !status1.equals("")  ){
		
	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			
				String[] data1  = (String[])vStatus.get(i); 
				
				
				
				DateFormat inputFormat= new SimpleDateFormat("dd-MMM-yyyy");
				DateFormat inputFormat1= new SimpleDateFormat("dd-MM-yyyy");  
				Date CompareDate = inputFormat.parse(data1[22]);
				
				Date historyDate = new Date(); 
				Date futureDate = new Date();
				//}
				
				if(!"0".equals(month1) &&  !"0".equals(year1)){
					int iYear = Integer.parseInt(year1) ;
					int iMonth = Integer.parseInt(month1)-1; // 1 (months begin with 0)
					//int iMonth = 11; // 1 (months begin with 0)
					int iDay = 1;
					Calendar mycal = new GregorianCalendar(iYear, iMonth, iDay);
					int daysInMonth = mycal.getActualMaximum(5);
	 
					String newHistoryDate = "01" + "-" + month1 +"-" + year1;
					String newFutureDate = daysInMonth + "-" + month1 + "-" + year1;
					
					 historyDate = inputFormat1.parse(newHistoryDate);
					futureDate = inputFormat1.parse(newFutureDate);
				
			
					
				}
				else
			{

				 historyDate = inputFormat.parse(fromdate1);
				 futureDate = inputFormat.parse(todate1);
			}

				

			String[] items1 = data1[22].split("-");
				String date1= items1[0];
				String monthh2= items1[1];
				String yearr2= items1[2];
				/*out.println("yearr1--"+yearr1);*/
			//	out.println("status1"+status1);
				if("All".equals(status1))
				{
	
					String tmpstatus1 = "'L','C','UDS','CR','CL','URE','UCS','UC','UD'";
					
					if(category1.contains(data1[1]) && tmpstatus1.contains(data1[25]) && (( CompareDate.after(historyDate) || CompareDate.equals(historyDate) ) &&  ( CompareDate.before(futureDate) || CompareDate.equals(futureDate) ))  )
						{
					resultList.add(data1);
}
				}
				else
				{
	
					
					
					if(category1.contains(data1[1]) && status1.equals(data1[25]) && (( CompareDate.after(historyDate) || CompareDate.equals(historyDate) ) &&  ( CompareDate.before(futureDate) || CompareDate.equals(futureDate) ))  )
						{
					resultList.add(data1);


						}
				}

		}

	}
	vStatus = resultList;

	}

 	ArrayList buyersLstCon	=  new ArrayList();
            

	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			String[] data  = (String[])vStatus.get(i);
			String cancel   ="";
            String edit     ="";
            String view     ="";
			//out.println("=="+data[1]);
		//	if(!category1.equals("") && !status1("") && !fromdate1.equals("") && !todate1.equals("")){
			//if(!"".equals(category1)){
				
			//if("Chemicals".equals(data[1])){
				

            String approverType ="";

			String parStatus            = data[25];
			String priceid              = data[0];
			//out.println("priceid=="+priceid);
			String INITIATOR_NAME       = data[26];
			String INITIATEDON          = data[22];
			String AP11                 = data[4];
			String AP21                 = data[7];
			String AP31                 = data[10];
			String APPROVER31_STATUS    = data[31];



			String  PARVALUE			= data[2];

			if(PARVALUE == null){
				PARVALUE="0";
			}

	    len = PARVALUE.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + PARVALUE.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				PARVALUE = temp;
		}





%>
		<tr>
			<td width="3%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=i+1%></td>
			<td width="10%" height="25" align="left" valign="middle" class="normal BreakWord"><%=data[1] == null ? "NA" :data[1]%></td>
			<td width="13%" height="25" align="left" valign="middle" class="normal "><b><%=priceid%></b></td>

			<td width="15%" height="25" align="left" valign="middle" class="normal"><%=PARVALUE==null?"NA":PARVALUE%> </td>

			<td width="15%" align="left" valign="middle" class="normal"><%=INITIATOR_NAME%></td>
			<td width="10%" align="left" valign="middle" class="normal"><%=INITIATEDON%></td>

			<td width="8%" height="25" valign="middle" align="left"><%if(parStatus.equals("L")){%><img src="../../images/inprocess.png" /><%}else if(parStatus.equals("UC")){%><span class="normal">Request Created</span><%}else if(parStatus.equals("UD")||parStatus.equals("UDS")){%><span class="normal">Draft</span><%}else if(parStatus.equals("CL")){%><img src="../../images/approved.png" /><%}else if(parStatus.equals("CR")){%><img src="../../images/rejected.png" /><%}else if(parStatus.equals("URE")){%><span class="normal">Review</span><%}else if(parStatus.equals("C")){%><span class="normal">Cancelled</span><%}if(parStatus.equals("UCS")){%><span class="normal">Summary Sheet</span><%}%></td>

<%

	if (parStatus.equals("C")){
		cancel  ="";
	}
	else if (!AP31.equals("0") && APPROVER31_STATUS.equals("L")||parStatus.equals("UD")||parStatus.equals("URE")||parStatus.equals("UDS") )
	{
	  cancel  ="/ <a href=\"#\" onclick=\"cancelParCon('"+priceid+"','"+tOId+"','C')\">Cancel</a> ";
	}

	if ((parStatus.equals("CL")||parStatus.equals("L")||parStatus.equals("UC")||parStatus.equals("C")||parStatus.equals("UCS")||parStatus.equals("URE") ) && (!parStatus.equals("UD"))){
		//out.println(priceid+"parStatus"+parStatus);
		view  ="<a href=\"showDetailsBuyersCon.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
	}


	if (parStatus.equals("URE")){
		edit  ="/ <a href=\"../indexUpdateCon.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">Modify</a> ";
	}else if(parStatus.equals("UD"))
	{
		edit  =" <a href=\"../indexUpdateDraftCon.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">Modify</a> ";
	}else if(parStatus.equals("UDS"))
	{
		edit  =" <a href=\"../indexUpdateDraftCon.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">Modify</a> ";
	}else {
		edit  ="";
	}
%>
	<td width="20%" height="25" align="center" valign="middle" class="normal"><%=view%><%=edit%><%=cancel%></td>

	</tr>
			  <tr><td bgcolor="#f0f0f0" height="1" colspan="8"></td></tr>
			 <% //}//end of if
		//}
 }//end of for
 }else{%>
<tr><td class="small" align="center" colspan="8">No Request Found</td></tr>	
<%}%>
</table>

<table width="100%" cellspacing="1" cellpadding="1" border="0" >   

	<tr class="greyBG">
			<td width="3%" height="29" >Sr. No</td>
            <td width="10%" align="left">SUMMARY ID</td> 
            <td width="13%" align="left">PURCHASE APPROVAL ID</td>    
            <td width="15%" align="left">PAR VALUE</td>
            <td width="15%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="8%" align="left">STATUS</td>
            <td width="10%" align="center" colspan="2">ACTION</td>
	</tr>
<%
	ArrayList vStatus2	=  new ArrayList();
	ArrayList priceidLst	=  new ArrayList();

	LinkedHashSet<String> summarryUniqueLst = new LinkedHashSet<String>(); 
 
	Hashtable summaryLst = new Hashtable();
	//String summaryStatus = "()";

	summaryLst.put("tOId",tOId);
	summaryLst.put("STATUS","('UC','UCSD')");
	
	vStatus2 			=	priceApprovalWebController.viewSummarryLstCon(summaryLst);

	
	ArrayList resultSumList = new ArrayList();
	//ArrayList vStatus2	=  new ArrayList();
	//out.println("vStatus2.size"+vStatus2.size()+"===category1"+category1+"===status1"+status1);
	if(!category1.equals("")  && !status1.equals("")  ){



	if(vStatus2.size()!=0)
	{
		for(int i=0; i<vStatus2.size(); i++)
		{
			//out.println("==="+status1);
				String[] data1  = (String[])vStatus2.get(i); 
				
				
				
				DateFormat inputFormat= new SimpleDateFormat("dd-MMM-yyyy");
				DateFormat inputFormat1= new SimpleDateFormat("dd-MM-yyyy");  
				Date CompareDate = inputFormat.parse(data1[3]);
				
				Date historyDate = new Date(); 
				Date futureDate = new Date();
				if(status1.equals("L"))
					status1 = "UC";

				//}
				
				if(!"0".equals(month1) &&  !"0".equals(year1)){
					int iYear = Integer.parseInt(year1) ;
					int iMonth = Integer.parseInt(month1)-1; // 1 (months begin with 0)
					//int iMonth = 11; // 1 (months begin with 0)
					int iDay = 1;
					Calendar mycal = new GregorianCalendar(iYear, iMonth, iDay);
					int daysInMonth = mycal.getActualMaximum(5);
	 
					String newHistoryDate = "01" + "-" + month1 +"-" + year1;
					String newFutureDate = daysInMonth + "-" + month1 + "-" + year1;
					
					 historyDate = inputFormat1.parse(newHistoryDate);
					futureDate = inputFormat1.parse(newFutureDate);
				
			
					
				}
				else
			{
					historyDate = inputFormat.parse(fromdate1);
					futureDate = inputFormat.parse(todate1);
			}
				if("All".equals(status1))
					{
					String tmpstatus1 = "'L','C','UDS','CR','CL','URE','UCS','UC','UD'";

				if(category1.contains(data1[8]) && tmpstatus1.contains(data1[6]) && (( CompareDate.after(historyDate) || CompareDate.equals(historyDate) ) &&  ( CompareDate.before(futureDate) || CompareDate.equals(futureDate) ))  )
						{
						//out.println("status1"+status1+"======data1[6]"+data1[6]);
					resultSumList.add(data1);


						}
					}

				else
				{
	
					
					
					if(category1.contains(data1[8]) && status1.equals(data1[6]) && (( CompareDate.after(historyDate) || CompareDate.equals(historyDate) ) &&  ( CompareDate.before(futureDate) || CompareDate.equals(futureDate) ))  )
						{
					resultSumList.add(data1);


						}
				}


		}

	}
	vStatus2 = resultSumList ;

	}

	if(vStatus2.size()!=0)
	{
		for(int i=0; i<vStatus2.size(); i++)
		{

		String[] data  = (String[])vStatus2.get(i);
		String summaryId			= "";//data[0];
		String status               = data[6];
		String priceidCheck			= "";
		//out.println("=="+data[3]);
				priceidCheck  = data[1];
				summaryId  = data[0];

				summarryUniqueLst.add(summaryId); 


			String[] priceid1             = {priceidCheck,summaryId,data[9],data[11],data[12],data[13],status};//data[1];
			
			priceidLst.add(priceid1); 
		}
	if(!summarryUniqueLst.isEmpty()){
%>

<%
String summaryStatus = "";
		int qq=0;
		Iterator<String> itr=summarryUniqueLst.iterator();  
		while(itr.hasNext()){
		String value = itr.next();
%>
		<tr>

			<td width="3%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=qq+1%></td>
			<td width="10%" height="25" align="left" valign="middle" class="normal BreakWord"><%=value%></td>
			<td width="13%" height="40" align="left" valign="middle" class="normal ">
<%
		for(int i=0; i<priceidLst.size(); i++)
		{
			String[] listOfIds  = (String[])priceidLst.get(i);
			//out.println("###"+listOfIds[0]);
			if(listOfIds[1].equals(value)){
				summaryStatus = listOfIds[6];
%>

			<br><b ><%=listOfIds[0]%></b><br>
<%
			}
		}
%>			
			</td>

			<td width="15%" height="25" align="left" valign="middle" class="normal">
			
<%
		for(int i=0; i<priceidLst.size(); i++)
		{
			String[] listOfIds  = (String[])priceidLst.get(i);
			if(listOfIds[1].equals(value)){

			String  PARVALUE			= listOfIds[2];
			
	    len = PARVALUE.length();

		temp = "";
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + PARVALUE.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

					temp =  new StringBuffer(temp).reverse().toString();
	   				PARVALUE = temp;
		}





%>

			<br><b ><%=PARVALUE%></b><br>
<%
			}
		}
%>				
			
			</td>

			<td width="15%" align="left" valign="middle" class="normal">
	<%
		for(int i=0; i<priceidLst.size(); i++)
		{
			String[] listOfIds  = (String[])priceidLst.get(i);
			
			if(listOfIds[1].equals(value)){
%>

			<br><b ><%=listOfIds[3]%></b><br>
<%
			}
		}
%>				
			
		
			</td>
			<td width="10%" align="left" valign="middle" class="normal">
			
	<%
	
		for(int i=0; i<priceidLst.size(); i++)
		{
			String[] listOfIds  = (String[])priceidLst.get(i);
			if(listOfIds[1].equals(value)){
%>

			<br><%=listOfIds[4]%><br>
<%
			}
		}
%>				
			</td>
			<td width="8%" align="left" valign="middle" class="normal">
<%
		for(int i=0; i<priceidLst.size(); i++)
		{
			String[] listOfIds  = (String[])priceidLst.get(i);
			if(listOfIds[1].equals(value)){
%><br>
<%if(listOfIds[5].equals("L")||listOfIds[5].equals("UC")||listOfIds[5].equals("UCD")){%><img src="../../images/inprocess.png"style=" margin-bottom: -7%;" /><%}else if(listOfIds[5].equals("S")){%><img src="../../images/supported.png"style=" margin-bottom: -7%;" /><%}else if(listOfIds[5].equals("CL")){%><img src="../../images/approved.png"style=" margin-bottom: -7%;" /><%}else if(listOfIds[5].equals("CR")){%><img src="../../images/rejected.png"style=" margin-bottom: -7%;" /><%}%>
			<%//=listOfIds[5]%><br>
<%
			}
		}
%>	
			
			</td>

			<td width="10%" align="left" valign="middle" class="normal">
<%
		for(int i=0; i<priceidLst.size(); i++)
		{
			String[] listOfIds  = (String[])priceidLst.get(i);
			if(listOfIds[1].equals(value)){
%>

			<br><b ><a href="../common/showDetailsCon.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=listOfIds[0]%>">View PAR</a></b><br>
<%
			}
		}
%>	
		
			</td>
<%
	String 	viewSummary  ="";
	String 	editSummary  ="";
	if(summaryStatus.equals("UCSD")){

	viewSummary  ="<a href=\"../common/viewSummary.jsp?tOId="+timescapeUserOId+"&summarryId="+value+"\"><strong>View Summary</strong></a>";
	editSummary  ="<a href=\"../updateSummary.jsp?tOId="+timescapeUserOId+"&summarryId="+value+"\"><strong>Edit Summary</strong></a>";

%>


			<!-- <td width="10%" height="25" align="left" valign="middle" class="normal BreakWord" ><a href="../common/viewSummary.jsp?summarryId=<%=value%>"> <strong>View Summary</strong></a></td> -->
			<td width="10%" height="25" align="left" valign="middle" class="normal BreakWord" ><%=viewSummary%> / <%=editSummary%></td>
			
<%}else{
	viewSummary  ="<a href=\"../common/viewSummary.jsp?tOId="+timescapeUserOId+"&summarryId="+value+"\"><strong>View Summary</strong></a>";

%>
			<td width="10%" height="25" align="left" valign="middle" class="normal BreakWord" ><%=viewSummary%></td>

<%}%>
		</tr>
			  <tr><td bgcolor="#f0f0f0" height="1" colspan="9"></td></tr>
	
<%
          qq++; 
		}
	}
	}else{
%>
		<tr><td class="small" align="center" colspan="8">No Request Found</td></tr>	
		<tr>

			<td width="4%" height="25" align="center" valign="middle" class="normal" colspan="7"></td>

		</tr>
		
<%
	}
//	}
	
%>
</table>

</div>
 