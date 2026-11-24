
	<tr height="30">
		<td bgcolor="#CCCCCC" class="boldsmall" width="3%" align="center">&nbsp;</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="8%" align="left">&nbsp;REQUESTOR ID</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="13%" align="left">&nbsp;REQUESTOR NAME</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="9%" align="left">&nbsp;LOCATION</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="3%" align="left">&nbsp;</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="8%" align="left">&nbsp;CARD BRAND</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="13%" align="left">&nbsp;&nbsp;CARD TYPE</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="5%"  align="left">&nbsp;QTY&nbsp;</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="8%"  align="left">&nbsp;PROCESSED ON</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;&nbsp;&nbsp;CHALLAN NO</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;&nbsp;CHALLAN DATE</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;&nbsp;REMARK</td>
	</tr>
 
	<%
		if(listSize == 0){
	%>
	<tr>
		<td colspan="15" class="small" align="center" height="30">
			&nbsp;
		</td>
	</tr>

	<tr>
		<td colspan="15" class="small" align="center" height="60">
			No pending request(s) for Business Cards to be processed !
		</td>
	</tr>
	<%
		} else {
	%>
<%
	
		for(int ii=0; ii< listSize; ii++){

            String cardArr[ ] = (String[ ]) requestList.get(ii);
            String reqName = "name"+ii;
            String reqId = "reqId"+ii;
            String reqType = "reqType"+ii;
            String reqTmpl = "reqTmpl"+ii;
		    String cardType = "cardType"+ii;
			String quantity = "reqQty"+ii;
		    String challanNo = "chlNo"+ii;
		    String vendorRemarks = "remarks" + ii;
		    String select = "select"+ii;
		    String location = "locn"+ii;
//System.out.println(reqTmpl);
//System.out.println(cardType);
            String [] months = {"0", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
            GregorianCalendar today = new GregorianCalendar();

            int fromYear = today.get(Calendar.YEAR);
            int toYear = fromYear+2;
            int currMonth = today.get(Calendar.MONTH)+1;
            String monthStr = currMonth + "";
            int date = today.get(Calendar.DAY_OF_MONTH);
            String dateStr = date+"";
         
            String day = "dd"+ii;
            String month = "mon"+ii;
            String year = "yy"+ii;
            String cardTemplate = cardArr[10];
			//out.println(cardTemplate);
%>
    <tr>
        <td><img src ="../images/spacer.gif" height="10"></td>
    </tr>

    <tr height ="30">

		<td align="center" class="small">&nbsp;<input type="checkbox" id="select" name="<%=select%>" value="V"/></td>
		<td align="left" class="small">&nbsp;<%=cardArr[0]%></td>
		<td align="left" class="small">&nbsp;<%=cardArr[1]%></td>
            <input type="hidden" name="<%=reqName%>" value="<%=cardArr[24]%>|<%=cardArr[25]%>">
            <input type="hidden" name="<%=reqId%>" value="<%=cardArr[0]%>">
		
		<td align="left" class="small"><%=cardArr[34]%></td>
            <input type="hidden" name="<%=location%>" value="<%=cardArr[34]%>">
		
        <td align="right" class="small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:window.open('../utils/viewCardTemplate.jsp?id=<%=cardArr[0]%>','_blank','top=100, left=100, height=500, width=500, status=no, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" class="underline"><img src="../images/icon_vcard.gif" border="0"></a></td>
		    <input type="hidden" name="<%=reqTmpl%>" value="<%=cardArr[10]%>">
		
<%
	if(compCode.equals("1003") || compCode.equals("1024") ||compCode.equals("1025") ||compCode.equals("1026") ||compCode.equals("1027") ||compCode.equals("1036")|| companyCode.equals("1040") || companyCode.equals("1041") || companyCode.equals("1048") || companyCode.equals("1049") )
		{	
			//cardTemplate	=	cardArr[10];
			if( !(cardTemplate.equals("IDIVA") || cardTemplate.equals("IND") || cardTemplate.equals("GGL")||cardTemplate.equals("ETMONEY") ||cardTemplate.equals("ETINSURE") ||cardTemplate.equals("DO") ||cardTemplate.equals("MXP")))
				{
					String  card = cardTemplate.substring(0, cardTemplate.indexOf('-'));
					//backDesignVal = cardTemplate.substring( cardTemplate.indexOf('-') +1);
					//System.out.println(card);
					cardTemplate=card;
					

				}
		}

		if (cardTemplate.equals("ARTHA")) {
%>
				     <td align="left" class="small">&nbsp;&nbsp;&nbsp;Artha </td>
<%		
		}else {
%>
	     <td align="left" class="small">&nbsp;&nbsp;&nbsp;<%=deptCode.get(cardTemplate)%></td>

<%
		}
%>

		 <td align="left" class="small">
			<select name="<%=cardType%>" class="small" id="<%=cardType%>">
				<option value="0" selected="selected">Select Card Type</option>
				<option value="Normal">Normal</option>
				<option value="Non-Tearable">Non-Tearable</option>
				<option value="Digital">Digital</option>
			</select>
		</td>
		
       
		 <input type="hidden" name="crdType<%=ii%>" value="">
		  <input type="hidden" name="challandate" value="<%=cardArr[32]%>">   
	 
        <input type="hidden" name="quantity" value="<%=cardArr[11]%>">
		
        <td align="left" class="small">&nbsp;<%=cardArr[11]%></td>

		<input type="hidden" name="persb<%=ii%>" value="<%=cardArr[36]%>">

        <td align="left" class="small">&nbsp;<%=cardArr[22]%></td>

        <td align="left">&nbsp;
			<input type="text" name="<%=challanNo%>" value="" style="width:100px;" class="small"/>
		</td>

        <td align ="center" class = "normal">&nbsp;<input type="text" style="width:100px;" class="small" id="date" name="date<%=ii%>" onfocus="showCalendarControl(this);" readOnly></td>

		<td align="left" class="small">
			&nbsp;<textarea name="<%=vendorRemarks%>" style="height:40px;width:130px;" class="small"></textarea>
		</td>

	</tr>
	<!-- <tr>
		<td class="boldsmall" align="left" height="1" bgcolor="#000000" colspan="100%"><img src ="../images/spacer.gif"></td>
	</tr> -->
	
<%
	
     if(companyCode.equals("1000")){

		if(!cardArr[36].equals("0")){

%>
	<tr><td colspan="100%" name="persb" value="persb" id="persb" class="redbold" align="left">Personal Belief : &nbsp;<%=cardArr[36]%></td></tr>
	
	<tr><td colspan="100%" class="rednormal" align="left">Remarks : &nbsp;<%=cardArr[35]%></td></tr>
<%	
        }
	}//end of if
%>

 
	<tr>
		<td class="boldsmall" align="left" height="1" bgcolor="#000000" colspan="100%"><img src ="../images/spacer.gif"></td>
	</tr>
<%
	}//end of for
%>

	<tr>
		<td class="boldsmall" align="left" height="20" colspan="100%"><img src ="../images/spacer.gif"></td>
	</tr>

	<tr>
		<td colspan = "100%" align = "center">
			<a href = "javascript:validateVendor(<%=listSize%>)" class = "small"><img src = "../images/but_preview.jpg" border = "0"></a>&nbsp;&nbsp;
			<a href = "javascript:clear()" class = "small"><img src = "../images/but_reset.gif" border = "0"></a>
		</td>
	</tr>

<%
	}
%>