<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.text.SimpleDateFormat,java.util.GregorianCalendar,java.util.Calendar, java.util.Date,java.text.*" %>
<%@ page import="com.bccl.util.Utility,com.bccl.util.HtmlUtil,com.bccl.util.AESencrp"%>
<%@ page import = "java.util.*"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<head>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}


</style>
<link href="/timescape/sapep/employeeselfservice/priceapproval/OSP/css/popup.css" rel="stylesheet" type="text/css" />
<link href="/timescape/sapep/employeeselfservice/priceapproval/OSP/css/global.css" rel="stylesheet" type="text/css" />
<script src="../../jscripts/jquery.js"language="javascript"></script>

<script Language="JavaScript" src="../jscripts/consumables.js"></script>
</head>
<body >

<form name="viewStatus" method="post" action="">

<%
	String tOId			=   Long.toString(timescapeUserOId);
	
	ArrayList vStatus	=  new ArrayList();
	
	vStatus 			=	priceApprovalWebController.viewSabApprovedHistoryCon(tOId);
	
	int len, lenCount, counter =0;
	String temp = "";


%>
<table width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="greyBG">Approvers Status</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="/timescape/sapep/employeeselfservice/priceapproval/images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="../images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="/timescape/sapep/employeeselfservice/priceapproval/images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="../images/rejected.jpg" /> --><a href = "#" onclick="javascript:reportWin('../reportsUser.jsp');"><!-- Dashboard --></a></td></td>
          </tr>
</table>
<table width="100%" cellspacing="1" cellpadding="1" border="0">      
		<tr class="greyBG">
            <td width="3%" height="29" >Sr. No</td>
            <td width="10%" align="left" >CATEGORY</td> 
            <td width="13%" align="left" >PURCHASE APPROVAL ID</td>    
            <td width="15%" align="left" >PAR VALUE</td>
            <td width="15%" align="left" >INITIATOR NAME</td>
            <td width="10%" align="left" >INITIATED ON</td>
            <td width="8%" align="left" >STATUS</td>
            <td width="20%" align="center" colspan="2">ACTION</td>
        </tr>

		

		
 <%
	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			String[] data  = (String[])vStatus.get(i); 
			String status               = data[22];
			String priceid              = data[0];
			String INITIATOR_NAME       = data[37];
			String INITIATEDON          = data[38];
			String AP11                 = data[4];
			String AP21                 = data[7];
			String AP31                 = data[10];
			String APPROVER31_STATUS    = data[29];

            String approverType ="";

                if(!AP11.equals("0") && AP11.equals(tOId)){
                    approverType    ="AP11";
                }else if(!AP21.equals("0") && AP21.equals(tOId)){
                approverType    ="AP21";
                }else if(!AP31.equals("0") && AP31.equals(tOId)){
                   approverType    ="AP31";
                }
            String cancel   ="";
            String edit     ="";
            String view     ="";

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
             <td width="3%" height="25" align="left" valign="middle" class="small">&nbsp;&nbsp;&nbsp;<%=i+1%></td>
          <td width="10%" height="25" align="left" valign="middle" class="normal"><%=data[1] == null ? "NA" :data[1]%></td>
 <td width="13%" height="25" align="left" valign="middle" class="normal"><b><%=priceid%></b></td>

          <td width="15%" height="25" align="left" valign="middle" class="normal"><%=PARVALUE==null?"NA":PARVALUE%> </td>

        <td width="15%" align="left" valign="middle" class="small"><%=INITIATOR_NAME%></td>
        <td width="10%" align="left" valign="middle" class="small"><%=INITIATEDON%></td>

          <td width="8%" height="25" valign="middle" align="left"><%if(status.equals("L")){%><img src="../../images/inprocess.png" /><%}else if(status.equals("UC")){%><span class="small">Request Created</span><%}else if(status.equals("UD")){%><span class="small">Draft</span><%}else if(status.equals("CL")){%><img src="../../images/approved.png" /><%}else if(status.equals("CR")){%><img src="../../images/rejected.png" /><%}else if(status.equals("URE")){%><span class="small">Review</span><%}else if(status.equals("C")){%><span class="small">Cancelled</span><%}%></td>

<%


if ((status.equals("CL")||status.equals("L")||status.equals("UC")||status.equals("C")||status.equals("URE")) && (!status.equals("UD"))){
    view  ="<a href=\"showDetailsHistoryCon.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
}

%>
<td width="20%" height="25" align="center" valign="middle" class="normal"><%=view%></td>

        </tr>
			  <tr><td  width="20%" bgcolor="#f0f0f0" height="1" colspan="8"></td></tr>
<% }//end of for
 }else{%>
<tr><td   width="20%" class="small" align="center" colspan="8">No Request Found</td></tr>	
<%}%>
</table>

<%
	ArrayList vStatus2	=  new ArrayList();
	ArrayList priceidLst	=  new ArrayList();

	LinkedHashSet<String> summarryUniqueLst = new LinkedHashSet<String>(); 

	
	Hashtable summaryLst = new Hashtable();
	//String summaryStatus = "()";

	//summaryLst.put("tOId",tOId);
	summaryLst.put("STATUS","('UC','UCSD')");
	
	vStatus2 			=	priceApprovalWebController.viewSummarryLstCon(summaryLst);


	if(vStatus2.size()!=0)
	{
		for(int i=0; i<vStatus2.size(); i++)
		{

		String[] data  = (String[])vStatus2.get(i);
		String summaryId			= "";//data[0];
		String status               = data[6];
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


<table width="100%" cellspacing="1" cellpadding="1" border="0">   

	<tr class="greyBG">
			<td width="3%" height="29" >Sr. No</td>
            <td width="10%" align="left">SUMMARY ID</td> 
            <td width="13%" align="left">PURCHASE APPROVAL ID</td>    
           <td width="15%" align="left" >PAR VALUE</td>
            <td width="15%" align="left" >INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="8%" align="left">STATUS</td>
            <td width="10%" align="center" colspan="2">ACTION</td>
	</tr>

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
			if(listOfIds[1].equals(value)){
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
<%if(listOfIds[5].equals("L")||listOfIds[5].equals("UC")){%><img src="../../images/inprocess.png"style=" margin-bottom: -7%;" /><%}else if(listOfIds[5].equals("S")){%><img src="../../images/supported.png" style=" margin-bottom: -7%;"/><%}else if(listOfIds[5].equals("CL")){%><img src="../../images/approved.png"style=" margin-bottom: -7%;" /><%}else if(listOfIds[5].equals("CR")){%><img src="../../images/rejected.png"style=" margin-bottom: -7%;" /><%}%>
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
			<!-- <td width="10%" height="25" align="left" valign="middle" class="normal BreakWord" ><a href="common/viewSummary.jsp?summarryId=<%=value%>"> <strong>View Summary</strong></a></td> -->
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

		<tr>

			<td width="4%" height="25" align="center" valign="middle" class="normal" colspan="7"><!-- No records --></td>

		</tr>
<%
	}

	
%>
</table>





</form>
</body>
</html>