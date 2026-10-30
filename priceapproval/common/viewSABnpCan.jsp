<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%//@ include file="../includes/empHeader.jsp"%>
<%
	String tOId1			=   Long.toString(timescapeUserOId);
	//String tOId1			=   Long.toString(timescapeUserOId);

	//out.println("tOId1----"+tOId1);

	String Approver1 ="";	
	ArrayList vStatus1	=   new ArrayList();
	ArrayList vStatus11	=   new ArrayList();
	
	//vStatus1 			=	priceApprovalWebController.viewSABNPCAN(tOId1);
	vStatus1 			=	priceApprovalWebController.viewSABNPAmmend(tOId1);

	//vStatus1 			=	priceApprovalWebController.viewSAB(tOId);
	String appStatus1 = "";

%>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr class="greyBG">
            <td width="8%" height="29" >Sr. No</td>
            <td width="18%" align="left">VENDOR NAME</td> 
            <td width="12%" align="left">PURCHASE APPROVAL ID</td>    
            <td width="18%" align="left">QUANTITY</td>
            <td width="16%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="16%" align="left">STATUS</td>
        </tr>
		
 <%
	if(vStatus1.size()!=0)
	{
		for(int i=0; i<vStatus1.size(); i++)
		{
			appStatus1="";
			String[] data1  = (String[])vStatus1.get(i); 
			String status1  = data1[27];
			//out.println("status1---"+status1);
			String priceid1 = data1[0];   
			String INITIATOR_NAME1   = data1[40];
			String INITIATEDON1      = data1[41];
			String view     ="";
            String view1     ="";
			String cancel   ="";
			String Ammendment   ="";
			String cancelAuthorision     ="";
			
    
%>
		<tr>
          <td width="8%" height="25" align="left" valign="middle" class="small" >&nbsp;&nbsp;&nbsp;<%=i+1%></td>
          
          <td width="18%" height="25" align="left" valign="middle" class="small"><%=data1[1]%></td>
<td width="12%" height="25" align="left" valign="middle" >&nbsp;&nbsp;&nbsp;<a href="common/showDetailsnp.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=priceid1%>&viewSAB=YES" class="boldunderline_small_Blue"><U><%=priceid1%></U></a></td>
           <td width="18%" height="25" align="left" valign="middle" class="small"><a href="common/showDetailsnp.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=priceid1%>&viewSAB=YES" class="boldunderline_small"><%=data1[6]%></a></td>
       <td width="16%" align="left" valign="middle" class="small"><%=INITIATOR_NAME1%></td>
         <td width="10%" align="left" valign="middle" class="small"><%=INITIATEDON1%></td>
          <!-- <td width="16%" height="25" valign="middle" align="left"><%if(status1.equals("L")||status1.equals("UC")){%><img src="images/inprocess.png" /><%}else if(status1.equals("S")){%><img src="images/supported.png" /><%}else if(status1.equals("CL")){%><img src="images/approved.png" /><%}else if(status1.equals("CR")){%><img src="images/rejected.png" /><%}%></td> -->
        
<%
		if (status1.equals("AM"))
	{
		//view  ="<a href=\"../common/showDetailsBuyersStatusnp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid1+"\">View</a>";
		cancelAuthorision  =" <a href=\"../priceapproval/indexUpdatenpCan.jsp?tOId="+timescapeUserOId+"&priceid="+priceid1+"\">Amend</a> ";

	}
%>	<td height="25" align="left" valign="middle" class="normal"><%//=view%><%=cancelAuthorision%></td>
</tr>
	     <tr><td bgcolor="#f0f0f0" height="1" colspan="7"></td></tr> 
<% }} else{%>
<!-- <tr><td class="small" align="center">No Request Found!!</td></tr> -->	
<%}%>
</table>