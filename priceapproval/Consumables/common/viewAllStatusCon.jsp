<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<%
	String tOId			=   Long.toString(timescapeUserOId);
	
	ArrayList vStatus	=  new ArrayList();
	
	vStatus 			=	priceApprovalWebController.viewAllReqCon();

	int len, lenCount, counter =0;
	String temp = "";
%>

 <table width="100%" cellspacing="1" cellpadding="1">       
		
		

		<%
		ArrayList viewAllCon	=  new ArrayList();
           
            String view     ="";

	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			String[] data  = (String[])vStatus.get(i); 
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

			<td width="8%" height="25" valign="middle" align="left"><%if(parStatus.equals("L")){%><img src="../images/inprocess.png" /><%}else if(parStatus.equals("UC")){%><span class="normal">Request Created</span><%}else if(parStatus.equals("UD")||parStatus.equals("UDS")){%><span class="normal">Draft</span><%}else if(parStatus.equals("CL")){%><img src="../images/approved.png" /><%}else if(parStatus.equals("CR")){%><img src="../images/rejected.png" /><%}else if(parStatus.equals("URE")){%><span class="normal">Review</span><%}else if(parStatus.equals("C")){%><span class="normal">Cancelled</span><%}if(parStatus.equals("UCS")){%><span class="normal">Summary Sheet</span><%}%></td>

<%


	if ((parStatus.equals("CL")||parStatus.equals("L")||parStatus.equals("UC")||parStatus.equals("C")||parStatus.equals("UCS")||parStatus.equals("URE") ||parStatus.equals("UDS")) && (!parStatus.equals("UD"))){
		view  ="<a href=\"common/showDetailsBuyersCon.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
	}


	
%>
	<td width="20%" height="25" align="center" valign="middle" class="normal"><%=view%></td>

	</tr>
			  <tr><td bgcolor="#f0f0f0" height="1" colspan="8"></td></tr>
			 <% //}//end of if
		//}
 }//end of for
 }else{%>
<tr><td class="small" align="center" colspan="8">No Request Found</td></tr>	
<%}%>
</table>



