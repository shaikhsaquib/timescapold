<%--
 -- Scholarship user
 -- @(#) checkStatus.jsp		23-JUN-2011
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Kavita Yadav
 -- @version 	1.00, 23-JUN-2011
 --%>
 
 <%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar, java.util.Date, java.util.StringTokenizer, java.io.*,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="com.bccl.util.Utility,com.bccl.util.HtmlUtil"%>
<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>
<%

	String gatepassType = (String)request.getParameter("gatepassValue");
	String outWardNumber = (String)request.getParameter("outReferenceNum");


	//out.println("gatepassType=="+gatepassType+"=outWardNumber =="+outWardNumber);

	Hashtable requestsHash = new Hashtable();
	Hashtable criteriaHash  = new Hashtable();

	ArrayList locationsList = new ArrayList();	
	ArrayList approversList = new ArrayList();
	ArrayList reviewersList = new ArrayList();
	ArrayList unitsList		= new ArrayList();
	ArrayList  dataList		= new ArrayList();
	ArrayList  requestsList		= new ArrayList();
	ArrayList  requestDetailsList		= new ArrayList();

	requestsHash.put("GATEPASSTYPE",gatepassType);
	requestsHash.put("OUTWARDNUMBER",outWardNumber);

	locationsList   = GatepassController.getUserLocationList(timescapeUserOId);
	
	unitsList	    = GatepassController.getUnits();

	requestsList = GatepassController.getInwardReferenceNoRequests(requestsHash);

	requestDetailsList = GatepassController.getInwardReferenceNoDetails(requestsHash);

	//out.println(requestDetailsList.size());

	String partyName		="";
	String mobileNumber		="";
	String Address			="";
	String dateofreturn		="";
	String hideDateofreturn	="0";

	
	for(int n=0; n < requestsList.size(); n++)
	{

		String tmpArrHed[] = (String [])requestsList.get(0);


		//out.println(tmpArrHed[6]);

		if("PA".equals(tmpArrHed[6]) || "CL".equals(tmpArrHed[6]))
		{

			 partyName		    = tmpArrHed[2];
			 mobileNumber		= tmpArrHed[7];
			 Address			= tmpArrHed[3];
			 dateofreturn		= tmpArrHed[10];
			 hideDateofreturn	= tmpArrHed[10];

		}
	}

	
	String months[ ] ={"0","Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
	GregorianCalendar today = new GregorianCalendar();
	int todayDay = today.get(Calendar.DAY_OF_MONTH);
	//String  todayMon = String.valueOf(today.get(Calendar.MONTH)+1);
	String todayMon = months[today.get(Calendar.MONTH)+1];
	int  todayYear = today.get(Calendar.YEAR);

	String dayMonYear			= todayDay + "-" + todayMon + "-" + todayYear;
%>
<table border="0" cellspacing="2" cellpadding="0" width="100%" align="center">
	</tr>
          <tr class="normal">
            <td width="40%" align="right" valign="middle">Party's Name</td>
            <td width="3%" align="center" valign="middle"> : </td>
            <td width="57%" align="left" valign="middle"><input maxlength="60" size="30" name="partyName" value="<%=partyName%>"  class="normal"/>(Please put complete name of party)
            <img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
		  <tr>
            <td width="40%" align="right" valign="middle" class="normal">Mobile No</td>
            <td width="3%"  align="center" valign="middle"> : </td>
            <td width="57%" align="left" valign="bottom" class="normal"><input maxlength="12" size="30" name="mobileNumber" value="<%=mobileNumber%>"  class="normal"/><img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
          <tr class="normal">
            <td width="40%" align="right" valign="middle">Address</td>
            <td width="3%"  align="center" valign="middle"> : </td>
            <td align="left" valign="middle"><textarea rows="4" cols="30" name="partyAddress"  class="normal"><%=Address%></textarea>
            (Max 200 chars)<img src="../images/tick.png" width="20" height="20" /></td>
          </tr>
		  <tr class="normal">
            <td width="40%" align="right" valign="middle">Vehicle No.</td>
            <td width="3%" align="center" valign="middle"> : </td>
            <td width="57%" align="left" valign="middle"><input maxlength="60" size="30" name="vehicleNo" value="0" class="normal" />
            </td>
          </tr>  
		  <tr id="showThisDate" name="showThisDate" class="normal">
            <td width="40%" align="right" valign="middle">Probable Date of Return</td>
            <td width="3%"  align="center" valign="middle"> : </td>
            <td width="57%" align="left" valign="middle"><input id="returnDate" size="20" name="returnDate" value="<%=dateofreturn%>"  class="normal"  onfocus="showCalendarControl(this);"/><img src="../images/tick.png" width="20" height="20" /></td>

				<input type="hidden" name="hideReturnDate" size = "2" id ="hideReturnDate" value="<%=hideDateofreturn%>" > 

            <!-- <img src="../images/calendar.png" width="26" height="26"/> -->
          </tr>
		  <tr class="normal">
            <td colspan="100%" valign="top">&nbsp;</td>
          </tr>
          
	</table>
	<table border="0" cellspacing="3" cellpadding="0" width="100%">
	<tr>
        <td width="5%" class="normal">&nbsp;Location:</td>  
		 <td width="15%" class="normal"> 
				<select name="locnCode" class="normal" onchange="showAll(1)">
				 <option value="0">Select a location</option>
                   
<%
				for(int kk=0; kk< locationsList.size(); kk++){
		
				String tmpArr[] = (String[])locationsList.get(kk);
%>	
				<option value = "<%=tmpArr[1]%>|<%=tmpArr[2]%>"><%=tmpArr[0]%></option>
<%
	
	
				}
%>  
		</select>  
		</td>
        <td width="10%" class="normal">Department :</td>     
		<td width="25%" class="normal"> <div id="departments"  class="normal" > </div></td>
		<td width="10%" class="normal">EmailID :</td> 
		<td width="25%" class="normal">
		   <div id="emailid"  class="normal" > </div>
		</td>
          </tr>
	  <tr class="normal">
		<td colspan="100%" valign="top">&nbsp;</td>
	  </tr>
    </table>
	
	<table border="0" cellspacing="3" cellpadding="0" width="100%">
	
		<tr class="greyBG">
<%		
			if(requestDetailsList.size() > 0)
			{
%>
			<td width="2%" height="30">Sr.No.</td>
<%
			}
%>

			<td width="15%">Purchase Order No.</td>
			<td width="15%">DC/Invoice</td>
			<td width="20%">Material Description</td>
			<td width="10%">UOM</td>
			<td width="3%">Quantity</td>
			<td width="25%">Reason for taking the material</td>	
			<td width="5%">Reject Quantity</td>
			<td width="5%">Received Quantity</td>
		</tr>

<%
	int count, ii=0;

	if(requestDetailsList.size() > 0)
	{
	    count = requestDetailsList.size(); 

	    for(ii=0; ii< count; ii++)
		{
		
			String tmpArrDetails[] = (String [])requestDetailsList.get(ii);

			String purchaseOrderNo		="NA";
			String dcInvoice			="NA";
			String materialDesc			=tmpArrDetails[3];
			String quantity			    =tmpArrDetails[4];
			String unitId			    =tmpArrDetails[5];
			String remarks			    =tmpArrDetails[8];
			//String rejectQuan			="";
%>
			<tr>
				<td height="30" class="normal" ><%=ii+1%></td>
				<td><input maxlength="50" name="purchaseOrderNo" class="normal" size="18" value= <%=purchaseOrderNo%>  readonly></td>
				<td><input maxlength="50" name="dcInvoice" class="normal" size="18" value= <%=dcInvoice%> readonly></td>
				<td><input maxlength="50" name="materialDesc" class="normal" size="22" 
				value= <%=materialDesc%> readonly></td>
				<td ><select name="uomId" class="normal">
<%
				for(int jj=0; jj< 1; jj++)
				{
					String tmpArr[] = (String[])unitsList.get(jj);
%>	
					<option value="<%=unitId%>"><%=unitId%></option>
<%
				}
%>
				</select></td>
				<td><input name="quantity<%=ii%>" size ="4"  maxlength="10" class="normal" id = "quantity" 
				value= <%=quantity%> readonly ></td>
				<td><input  name="remarks" class="normal" maxlength="100" size="36" value= <%=remarks%> readonly></td>
				<td><input  name="rejectQuan<%=ii%>" class="normal" size ="4" id ="rejectQuan" onblur= "onClickCheck(<%=count%>);" ></td>
				<td><input name="receivedQuan<%=ii%>" class="normal" size ="4" id="receivedQuan<%=ii%>" >
				</td>
			</tr>
<%
			}
		}else
		{
	    count = 1;

		String purchaseOrderNo		="";
		String dcInvoice			="";
		String materialDesc			="";
		String quantity			    ="";
		String remarks			    ="";
		String rejectQuan			="";

	    for(ii=1; ii<= 1; ii++)
		{
%>
		<tbody id="movDetails">
			<tr>
				<td><input maxlength="50" name="purchaseOrderNo" id="purchaseOrderNo<%=ii%>" class="normal" size="18"/></td>
				<td><input maxlength="50" name="dcInvoice" id="dcInvoice<%=ii%>" class="normal" size="18"/></td>

				<td><input maxlength="50" name="materialDesc"  id="materialDesc<%=ii%>" class="normal" size="22" /></td>

				<td ><select name="uomId" id="uomId<%=ii%>" class="normal">
<%
				for(int jj=0; jj< unitsList.size(); jj++)
				{
					String tmpArr[] = (String[])unitsList.get(jj);
%>	
					<option value="<%=tmpArr[1]%>"><%=tmpArr[1]%></option>
<%
				}
%>
				</select></td>
				<td><input name="quantity<%= ii %>" size ="4"  maxlength="10" class="normal" id = "quantity<%= ii %>"/></td>
				<td><input  name="remarks<%=ii%>" class="normal" maxlength="100" size="36"/></td>
				<td><input  name="rejectQuan<%=ii%>" class="normal" size ="10"  maxlength="10"
				id ="rejectQuan<%= ii %>" onblur= "onClickCheckMul(<%=ii%>);" /></td>
				<td><input name="receivedQuan<%= ii %>" class="normal" size ="10" maxlength="10" 
				id="receivedQuan<%= ii %>" readonly>
				</td>
			</tr>
		</tbody>
<%
		}
%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		 <tr>
				<td  height="25" colspan="10" align="right" class="normal"><a href="javascript:void(0)" onClick="addRow()" class="normal"><u>Add Rows</u></a>&nbsp;<!-- <a href="javascript:void(0)" onClick="delRow();runTimeAddFunction()" class="bluenormal">del rows</a> --></td>
		 </tr>
	    </table>
		<input type="hidden" name="movCounter" id="movCounter" value="1" >
<%
	}

%> 
	</table>

	<input type="hidden" name="totalPendingQuan" size = "2" id ="totalPendingQuan" > 

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td> &nbsp;&nbsp;</td>
		</tr>
	</table>
	

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td> &nbsp;&nbsp;</td>
			<td  align="center"><input type="button"  value="S U B M I T" onclick="javascript:validateRequest();">&nbsp;&nbsp;<input type="button" name="clear" value="R E S E T " onClick="javascript:reset();"> 
			</td>
		</tr>
	</table>
<input type="hidden" name="currentSysdate" value="<%=dayMonYear%>">	

</table>