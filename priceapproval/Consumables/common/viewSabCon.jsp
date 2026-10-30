<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.text.SimpleDateFormat,java.util.GregorianCalendar,java.util.Calendar, java.util.Date,java.text.*" %>
<%@ page import="com.bccl.util.Utility,com.bccl.util.HtmlUtil,com.bccl.util.AESencrp"%>
<%@ page import = "java.util.*"%>

<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<%
	String tOId			=   Long.toString(timescapeUserOId);
	String Approver ="";	

	int len, lenCount, counter =0;
	String temp = "";


	ArrayList vStatus	=   new ArrayList();
	ArrayList specialRstatus	=   new ArrayList();
	ArrayList vStatus1	=   new ArrayList();
	Hashtable rStatus = new Hashtable();
	vStatus 			=	priceApprovalWebController.viewSabCon(tOId);

	specialRstatus 			=	priceApprovalWebController.specialReviewStatus(rStatus);

	//vStatus1 			=	priceApprovalWebController.viewSAB(tOId);
	String appStatus = "";
    String createdForApproverType = "";
            String view     ="";
            String view1    ="";

ArrayList noSummaryPar = new ArrayList();

			String status           = "";//data[22];
			String priceid          = "";//data[0];
			String INITIATOR_NAME   = "";//data[37];
			String INITIATEDON      = "";//data[38];

%>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
 <%
	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			appStatus="";
			String[] data           = (String[])vStatus.get(i); 

			if(data[3].equals("NO")){

				//break;
		String[] noSummaryLst  = {data[1],data[0],data[3],data[37],data[38],data[22],data[2]};
			noSummaryPar.add(noSummaryLst);
			}
		}
	}

	if(noSummaryPar.size()!=0)
	{
		for(int kk=0; kk<noSummaryPar.size(); kk++)
		{
			String[] data				= (String[])noSummaryPar.get(kk); 
					status				= data[5];
					priceid				= data[1];
					INITIATOR_NAME		= data[3];
					INITIATEDON			= data[4];
			String  PARVALUE			= data[6];

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
            <td width="3%" height="25" align="left" valign="middle" class="small" >&nbsp;&nbsp;&nbsp;<%=kk+1%></td>

            <td width="10%" height="25" align="left" valign="middle" class="small"><%=data[0]%></td>
            <td width="13%" height="25" align="left" valign="middle" class="normal">&nbsp;<b><%=priceid%></b></td>
            <td width="15%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;<b><%=PARVALUE%></b></td>
            <td width="15%" align="left" valign="middle" class="small">&nbsp;&nbsp;<%=INITIATOR_NAME%></td>
            <td width="10%" align="left" valign="middle" class="small">&nbsp;&nbsp;<%=INITIATEDON%></td>
            <td width="8%" height="25" valign="middle" align="left">&nbsp;&nbsp;<%if(status.equals("L")||status.equals("UC")){%><img src="../images/inprocess.png" /><%}else if(status.equals("S")){%><img src="images/supported.png" /><%}else if(status.equals("CL")){%><img src="images/approved.png" /><%}else if(status.equals("CR")){%><img src="images/rejected.png" /><%}%></td>

<%
if ((status.equals("CL")||status.equals("L")||status.equals("UC")||status.equals("C")||status.equals("URE"))|| (status.equals("UD"))){
    view  ="<a href=\"common/showDetailsCon.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
}
%>
		<td width="20%" height="25" align="middle" valign="middle" class="normal">&nbsp;&nbsp;<%=view%></td>
	</tr>
	<tr><td bgcolor="#f0f0f0" height="1" colspan="8"></td></tr>
<%		
		}
	}else{
%>
	 <tr>
		<td width="4%" height="25" align="center" valign="middle" class="normal" colspan="7">No records</td>
	</tr>
<%
	}
 %>

<%int ii=0;
	if(specialRstatus.size()!=0)
	{
		for(ii=0; ii<specialRstatus.size(); ii++)
		{			String[] data3      =   (String[])specialRstatus.get(ii);

        createdForApproverType = data3[62];

		String createdFor="";
        createdFor=data3[55];
//out.println("priceid = "+data3[0]);
%><%if(createdFor.equals(tOId)){%>
		<tr>
          <td width="3%" height="25" align="left" valign="middle" class="small" >&nbsp;&nbsp;&nbsp;<%=ii+1%></td>
          
          <td width="10%" height="25" align="left" valign="middle" class="small"><%=data3[8]%></td>
<td width="13%" height="25" align="left" valign="middle" class="normal">&nbsp;<strong><%=data3[0]%></strong></td>
<!-- <td width="13%" height="25" align="left" valign="middle">&nbsp;&nbsp;&nbsp;<a href="common/createdForReview.jsp?tOId=<%//=timescapeUserOId%>&priceid=<%//=data3[0]%>&splId=<%//=data3[51]%>&approverType=<%//=createdForApproverType%>&viewSAB=YES" class="boldunderline_small"><%//=data3[0]%></a></td> -->
           <td width="15%" height="25" align="left" valign="middle" class="small">&nbsp;&nbsp;<strong><%=data3[7]%> - <%=data3[9]%></strong></td>
           <!-- <td width="15%" height="25" align="left" valign="middle" class="small"><a href="common/createdForReview.jsp?tOId=<%//=timescapeUserOId%>&priceid=<%//=data3[0]%>&splId=<%//=data3[51]%>&approverType=<%//=createdForApproverType%>&viewSAB=YES" class="boldunderline_small"><%//=data3[7]%> - <%//=data3[9]%></a></td>
 -->       
        <td width="15%" align="left" valign="middle" class="small">&nbsp;&nbsp;<%=data3[63]%></td>
        <td width="10%" align="left" valign="middle" class="small">&nbsp;&nbsp;<%=data3[60]%></td>

          <td width="8%" height="25" valign="middle" align="left" class="small"><%if(data3[61].equals("SPLR")||data3[61].equals("UC")){%>Specific review<%}else if(data3[61].equals("S")){%><img src="images/supported.png" /><%}else if(data3[61].equals("CL")){%><img src="images/approved.png" /><%}%></td>

<%
if (data3[61].equals("SPLR")) {
    view1  ="<a href=\"common/createdForReview.jsp?tOId="+timescapeUserOId+"&priceid="+data3[0]+"&splId="+data3[51]+"&approverType="+createdForApproverType+"&viewSAB=YES\">View</a>";
}
%>
<td width="8%"height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;<%=view1%></td>

        </tr>
	    <tr><td bgcolor="#f0f0f0" height="1" colspan="8"></td></tr>
<% }}} %>

<%//if(vStatus.size()==0 && specialRstatus.size()==0){%>
<%if(vStatus.size()==0 && specialRstatus.size()==0){%>
<tr><td class="small" align="center"></td></tr>
<%}%>
</table>

<%
	ArrayList vStatus2	=  new ArrayList();
	ArrayList priceidLst	=  new ArrayList();

	LinkedHashSet<String> summarryUniqueLst = new LinkedHashSet<String>(); 
	
	Hashtable summaryLstData	= new Hashtable();

	//summaryLstData.put("tOId",tOId);
	summaryLstData.put("STATUS","('UC','L')");
	
	vStatus2 			=	priceApprovalWebController.viewSummarryLstCon(summaryLstData);


	if(vStatus2.size()!=0)
	{
		for(int i=0; i<vStatus2.size(); i++)
		{

		String[] data  = (String[])vStatus2.get(i);
		String summaryId			= "";//data[0];
		String status1               = data[6];
		String priceidCheck			= "";

		for(int j = 0; j <vStatus.size(); j++){
		String[] data2  = (String[])vStatus.get(j);
				
		if(data2[0].equals(data[1]))
		{
				priceidCheck  = data[1];
				summaryId  = data[0];
				
				summarryUniqueLst.add(summaryId); 
				break;
		}else{
				priceidCheck = "";
				summaryId = "";

			}

		}
			String[] priceid1             = {priceidCheck,summaryId,data[9],data[11],data[12],data[13]};//data[1];
			
			priceidLst.add(priceid1); 
			
		}
	if(!summarryUniqueLst.isEmpty()){
%>

<br />
<table width="100%" cellspacing="1" cellpadding="1" border="0">   

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
			if(listOfIds[1].equals(value)){
%>

			<!-- <br><b ><a href="common/showDetailsCon.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=listOfIds[0]%>"><%=listOfIds[0]%></a></b><br> -->
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
<%if(listOfIds[5].equals("L")||listOfIds[5].equals("UC")){%><img src="../images/inprocess.png" /><%}else if(listOfIds[5].equals("S")){%><img src="images/supported.png" /><%}else if(listOfIds[5].equals("CL")){%><img src="images/approved.png" /><%}else if(listOfIds[5].equals("CR")){%><img src="images/rejected.png" /><%}%>
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
			<td width="10%" height="25" align="left" valign="middle" class="normal BreakWord" ><a href="common/viewSummary.jsp?tOId=<%=timescapeUserOId%>&summarryId=<%=value%>"> <strong>View Summary</strong></a></td>

		</tr>
			  <tr><td bgcolor="#f0f0f0" height="1" colspan="9"></td></tr>
	
<%
          qq++; 
		}
	}
	}else{
%>

		<tr>

			<td width="4%" height="25" align="center" valign="middle" class="normal" colspan="7"></td>

		</tr>
<%
	}
//	}
	
%>
</table>
