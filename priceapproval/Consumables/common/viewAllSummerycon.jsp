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

<table width="100%" cellspacing="1" cellpadding="1" border="0" >   

	
<%
	ArrayList vStatus2	=  new ArrayList();
	ArrayList priceidLst	=  new ArrayList();

	LinkedHashSet<String> summarryUniqueLst = new LinkedHashSet<String>(); 
 
	Hashtable summaryLst = new Hashtable();
	//String summaryStatus = "()";

	//summaryLst.put("tOId",tOId);
	summaryLst.put("STATUS","('UC','UCSD')");
	
	vStatus2 			=	priceApprovalWebController.viewAllSummarryCon(summaryLst);

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
			int len = 0;
			int lenCount = 0;
			int counter = 0;
			if(listOfIds[1].equals(value)){

			String  PARVALUE			= listOfIds[2];
			
	    len = PARVALUE.length();

		String temp = "";
			
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
<%if(listOfIds[5].equals("L")||listOfIds[5].equals("UC")||listOfIds[5].equals("UCD")){%><img src="../images/inprocess.png" /><%}else if(listOfIds[5].equals("S")){%><img src="../images/supported.png" /><%}else if(listOfIds[5].equals("CL")){%><img src="../images/approved.png" /><%}else if(listOfIds[5].equals("CR")){%><img src="../images/rejected.png" /><%}%>
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

			<br><b ><a href="common/showDetailsCon.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=listOfIds[0]%>">View PAR</a></b><br>
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
	

%>


			<!-- <td width="10%" height="25" align="left" valign="middle" class="normal BreakWord" ><a href="../common/viewSummary.jsp?summarryId=<%=value%>"> <strong>View Summary</strong></a></td> -->
			<td width="10%" height="25" align="left" valign="middle" class="normal BreakWord" ><%=viewSummary%> / <%=editSummary%></td>
			
<%}else{
	viewSummary  ="<a href=\"common/viewSummary.jsp?tOId="+timescapeUserOId+"&summarryId="+value+"\"><strong>View Summary</strong></a>";

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
