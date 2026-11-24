 
	<tr height="20">
		<td bgcolor="#CCCCCC" class="boldsmall" width="23%" align="left">REQUESTOR NAME</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%"  align="left">LOCATION</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="9%"  align="left">CARD BRAND</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="9%"  align="left">CARD TYPE</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="5%"  align="left">QTY</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="9%" align="left">CARD COST(Rs.)</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="8%" align="left">CHALLAN NO</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="9%" align="left">CHALLAN DATE</td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="18%" align="left">REMARK</td>
		 
		<!-- <td bgcolor="#CCCCCC" class="boldsmall" width="12%" align="left">ACCEPT / REJECT</td> -->
	</tr>

<%

//Retrieve the data from service.jsp
      
        
		String listSize = (String)request.getParameter("listSize");
        //cardType = (String)request.getParameter("cardType");
		//String persb = (String)request.getParameter("persb");
		//out.println(persb);
		//Double quantity = Double.parseDouble(request.getParameter("quantity"));
       // out.println(quantity);
		
		
%>

<%
		for (int ii=0;ii<Integer.parseInt(listSize);ii++){

		String select = "select"+ii;
		String reqSelect = (String)request.getParameter(select);
		
		//out.println(persb);
		//Double quantity = Double.parseDouble(request.getParameter("quantity"));
         double cost=0.0;


		if(reqSelect!=null && !reqSelect.equals("null") && !reqSelect.trim().equals("")){

			String reqId = "reqId"+ii;
			String requestId = (String)request.getParameter(reqId);

			String name = "name"+ii;
			String requestorName = (String)request.getParameter(name);
%>
	<tr>
		<td class = "small" align = "left" height ="30">
			&nbsp;<%=requestorName.substring(0,requestorName.indexOf("|"))%>&nbsp;<%=requestorName.substring(requestorName.indexOf("|")+1)%>
		</td>

		<input type="hidden" name="<%=name%>" value="<%=requestorName%>">
		<input type="hidden" name="<%=reqId%>" value="<%=requestId%>">

<%
			String reqLocn = "locn"+ii;
			String location = (String)request.getParameter(reqLocn);
%>
		<td class = "small" align = "left" height = "30"><%=location%></td>

<%			
			String reqTmpl = "reqTmpl"+ii;
			String cardTmpl = (String)request.getParameter(reqTmpl);
			//out.println(cardTmpl);
			
			if(compCode.equals("1003") || compCode.equals("1024") ||compCode.equals("1025") ||compCode.equals("1026") ||compCode.equals("1027") ||compCode.equals("1036") || compCode.equals("1040") || compCode.equals("1041") || compCode.equals("1048") || compCode.equals("1049"))
			{	
				//cardTemplate	=	cardArr[10];
				if( !(cardTmpl.equals("IDIVA") || cardTmpl.equals("IND") || cardTmpl.equals("GGL") ||cardTmpl.equals("ETMONEY") ||cardTmpl.equals("ETINSURE") ||cardTmpl.equals("DO") ||cardTmpl.equals("MXP") ))
				{
					String  card = cardTmpl.substring(0, cardTmpl.indexOf('-'));
					//backDesignVal = cardTemplate.substring( cardTemplate.indexOf('-') +1);
					//System.out.println(card);
					cardTmpl=card;
					

				}
			}


%>
		<td class = "small" align = "left" height = "30">&nbsp;&nbsp;<%=deptCode.get(cardTmpl)%></td>

<%
			String reqcardType = "crdType"+ii;
			String cardType = (String)request.getParameter("crdType"+ii);
            String reqpersb = "persb"+ii;
			String persb = (String)request.getParameter("persb"+ii);
			//out.println(cardType);
%>
		<td class = "small" align = "left" height = "30"><%=cardType%></td> 

<%
			String reqQty = "reqQty"+ii;
			//quantity = (String)request.getParameter(reqQty);
			String quantity = (String)request.getParameter(reqQty);
			double quantity1 = Double.parseDouble(request.getParameter("quantity"));
%>
<td class = "small" align = "left" height = "30"><%=quantity1%></td>
 <% 
        //System.out.println("persb="+persb);
        if(cardType.equals("Normal") && !persb.equals("-") && !persb.equals("0") && !persb.equals("NA"))
		{
         cost=(2.00*quantity1)+(quantity1*0.10);
		 //out.println("Normal="+cost);
        }
		else if(cardType.equals("Normal") && (persb.equals("-") || persb.equals("0") || persb.equals("NA")))
		{
		 cost=2.00*quantity1;
		 //out.println("Normal="+cost);
        }

%>

<% 
        if(cardType.equals("Non-Tearable") && !persb.equals("-") && !persb.equals("0") && !persb.equals("NA"))
		{
         cost=(1.90*quantity1)+(quantity1*0.10);
		 //out.println("Non-Tearable="+cost);
        }
		else if(cardType.equals("Non-Tearable") && (persb.equals("-") || persb.equals("0") || persb.equals("NA")))
		{
         cost=1.90*quantity1;
		 //out.println("Non-Tearable="+cost);
        }

%>

<% 
        if(cardType.equals("Digital") && !persb.equals("-") && !persb.equals("0") && !persb.equals("NA"))
		{
         cost=(2.70*quantity1)+(quantity1*0.10);
		 //out.println("Digital="+cost);
        }
        else if(cardType.equals("Digital") && (persb.equals("-") || persb.equals("0") || persb.equals("NA")))
		{
         cost=2.70*quantity1;
		 //out.println("Digital="+cost);
        }


%>

		<input type="hidden" name="quantity" value="<%=quantity1%>">

		<td class = "small" align = "left" height = "30"><%=cost%></td>

		<input type="hidden" name="cost<%=ii%>" value="<%=cost%>">
		
<%			
			String reqChlNo = "chlNo"+ii;
			String challanNo = (String)request.getParameter(reqChlNo);
%>
		<td class = "small" align = "left" height = "30"><%=challanNo%></td>

		
<%
//			String [] months = {"0", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

//			String reqDay = "dd"+ii;
//			String day = (String)request.getParameter(reqDay);
//			String reqMonth = "mon"+ii;
//			String month = (String)request.getParameter(reqMonth);
//			String reqYear = "yy"+ii;
//			String year = (String)request.getParameter(reqYear);
			String reqDate = "date"+ii;
			String date = (String)request.getParameter(reqDate);
%>
		<td class = "small" align = "left" height = "30"><%=date%></td>
		<!-- <td class = "small" align = "left" height = "30">&nbsp;&nbsp;<%//=day%>-<%//=months[Integer.parseInt(month)]%>-<%//=year%></td> -->
		<input type="hidden" name="<%=reqChlNo%>" value="<%=challanNo%>">
		<input type="hidden" name="<%=reqDate%>" value="<%=date%>">
		<input type="hidden" name="<%=reqcardType%>" value="<%=cardType%>">
		<input type="hidden" name="<%=reqpersb%>" value="<%=persb%>">
		<!-- <input type="hidden" name="<%//=reqDay%>" value="<%//=day%>">
		<input type="hidden" name="<%//=reqMonth%>" value="<%//=month%>">
		<input type="hidden" name="<%//=reqYear%>" value="<%//=year%>"> -->
<%
			String remarks = "remarks" + ii;
			String vendorRemarks = (String)request.getParameter(remarks);

			if(vendorRemarks==null || vendorRemarks.equals("null") || vendorRemarks.trim().equals("")){
				vendorRemarks = "-";
			}
%>
		<td class = "small" align = "left" height = "30"><%=vendorRemarks%></td>

		<input type="hidden" name="<%=remarks%>" value="<%=vendorRemarks%>">
		<input type="hidden" name="<%=select%>" value="<%=reqSelect%>">
	</tr>
<%
		}
	}
%>
	<tr>
		<td class="boldsmall" align="left" height="30" colspan="100%"><img src ="../images/spacer.gif"></td>
	</tr>
	<tr>
		<td colspan = "100%" class = "normal" align = "center" height = "20">
			<a href = "javascript:confirmRequestVendor()" class = "normal"><img src = "../images/but_submit.gif" border = "0"></a>&nbsp;&nbsp;
			<a href = "javascript:history.back()" class = "normal"><img src = "../images/but_back.gif" border = "0"></a>&nbsp;&nbsp;
		</td>
	</tr>