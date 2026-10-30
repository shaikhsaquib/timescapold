  <tr>
    <td width="52%" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="2" cellspacing="2">
     
      <tr>
        <td height="22" bgcolor="#ffffff" class="greyBG">APPROVALS</td>
        </tr>
    </table>
      <table width="100%" cellspacing="2" cellpadding="2">
        <tr class="greyBG">
          <td width="12%" >B&amp;C<span class="small"></span><span class="redsmall"><br> (3rd approver is mandatory)</span></td>
          <td width="11%" height="29" >Category Head<!-- (min 1) --></span></td>
          <td width="11%" align="left" colspan='2'>SUPPORTED BY <span class="redsmall"><!-- <span class="small">LEVEL 1</span> (min 1)</span> --></td>
          <td width="11%" align="left"><span class="small"><%=label1%><!-- </span><br><span class="redsmall">&#42&nbsp;(for Negotiated value > 3L and < 20L)</span> --></td>
          <td width="11%" align="left"><%=label2%><!-- <span class="small"></span> --></td>
          <td width="11%" align="left"><%=label3%><!-- <span class="small"> --></span></td>
          <td width="11%" align="left"><%=label4%><!-- <span class="small"> --></span></td>
          <td width="11%" align="left"><span class="small"><strong>Managing Director</strong> </span></td>
        </tr>
		<td colspan="2">&nbsp;</td>
		<td class = "small" height = "15" >&nbsp;<b>Name</b>
		</td>
		<td class = "small" height = "15" >&nbsp;<b>Role</b>
		</td>	
        <tr class="small">

          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app1" id="app1" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER11==null?"":APPROVER11%>" disabled>
			  <input  name = "app1H" id="app1H" type="hidden" value="<%=AP11==null?"":AP11%>" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app2" id="app2" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER12==null?"":APPROVER12%>" disabled>
			 <input  name = "app2H" id="app2H" type="hidden" value="<%=AP12==null?"":AP12%>" />
		  </td>
<%
		ArrayList approverList   = new ArrayList();
		String str          = ""; 
		int i = 0;
        String roleType     ="";
        String selected="";
        Hashtable approverData  = new Hashtable();
%>

		  <td  class = "normal"  height = "25" align="left">
		 <input type = "text" name = "app11" id="app11"  class = "normal" size="22" onClick="addUser('approvedby',this.id)"  value="<%=APPROVER35==null?"":APPROVER35%>"  class = "normal" disabled>
		<input  name = "app11H" id="app11H" type="hidden" value="<%=AP35==null?"":AP35%>"  / ></td>
		 <td class = "normal" height = "25" align="left">HR/Personnel</td>
          <td rowspan="3" align="left" valign="top" class="small"><span class="boldunderline_small">
            <select name="select12" class="small" id="select12" style="width:130px;" disabled>
        <option value="0">Select</option>
	    <!-- <option value="20411" <%//if(AP4.equals("20411")){%>selected="selected"<%//}%>>Shyam Shanker</option> -->
                    <%=app4%>
	  </select>
			</span></td>
          <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">

        <select name="select13" class="small" id="select13" style="width:130px;" disabled>
		<option value="0">Select</option>	
	  <!-- <option value="3459" <%//if(AP5.equals("3459")){%>selected="selected"<%//}%>>Mohit Jain</option> -->
	        <%=app5%>
      </select> 
     </span></td>


         <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select14" class="small" id="select14" style="width:130px;" disabled> 
		<option value="0">Select</option>
         <!-- <option value="31891" <%//if(AP6.equals("31891")){%>selected="selected"<%//}%>>Shrijeet Mishra</option> -->
                 <%=app6%>
	  </select>         </span></td>

		<td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select15" class="small" id="select15" style="width:130px;" disabled>
		<option value="0">Select</option>
         <!-- <option value="48795" <%//if(AP7.equals("48795")){%>selected="selected"<%//}%>>Raj Jain</option> -->
                <%=app7%>
		</select> </span></td>



	    <td rowspan="3" align="left" valign="top"><span class="boldunderline_small">
        <select name="select16" class="small" id="select16" style="width:130px;" disabled>
		<option value="0">Select</option>
     <!--  <option value="3459" <%if(AP6.equals("3459")){%>selected="selected"<%}%>>Mohit Jain</option>
      <option value="20411" <%if(AP6.equals("20411")){%>selected="selected"<%}%>>Shyam Shanker</option> -->
	   <option value="29616" <%if(AP8.equals("29616")){%>selected="selected"<%}%>>Vineet Jain</option>
        </select>         </span></td>
        </tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app4" id="app4" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER21==null?"":APPROVER21%>" disabled>
			  <input  name = "app4H" id="app4H" type="hidden" value="<%=AP21==null?"":AP21%>" />
		 </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app5" id="app5" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER22==null?"":APPROVER22%>" disabled>
			  <input  name = "app5H" id="app5H" type="hidden" value="<%=AP22==null?"":AP22%>" />

		  <td  class = "normal"  height = "25" align="left">
		 <input type = "text" name = "app12" id="app12"  class = "normal" size="22" onClick="addUser('approvedby',this.id)" value="<%=APPROVER36==null?"":APPROVER36%>" disabled>
		<input  name = "app12H" id="app12H" type="hidden" value="<%=AP36==null?"":AP36%>"  /></td>
		 <td class = "normal" height = "25" align="left">Branch Head</td>
        </tr>
        <tr class="small">
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app7" id="app7" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER31==null?"":APPROVER31%>" disabled>
			  <input  name = "app7H" id="app7H" type="hidden" value="<%=AP31==null?"":AP31%>" />
		  </td>
          <td class = "normal" height = "25"  align="left"><input type = "text" name = "app8" id="app8" class = "normal" size="20" onClick="addUser('approvedby',this.id)" value="<%=APPROVER32==null?"":APPROVER32%>" disabled>
			  <input  name = "app8H" id="app8H" type="hidden" value="<%=AP32==null?"":AP32%>" />
		  </td>

			  <input name="priceid" id="priceid" type="hidden" value="<%=priceid%>" /> 
 <td class = "normal" height = "25"  align="left">
		<select name="app3" id="app3" class = "normal" style="width:174px;" disabled>
			<option value="0">Select</option>
<%
			   roleType    =   "MAS 1";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
%>
		<option value="<%=tempArr[2]%>" <%if(AP13.equals(tempArr[2])){%>selected="selected"<%}%>><%=tempArr[3]%></option>
<%
		}
%>
        </select>
		
		</td> 

		   <td class = "normal" height = "25" width="10%" align="left">MAS 1 </td>
		 
        </tr>
		<tr class="small">
		  <td colspan="2" >&nbsp;</td>

  <td class = "normal" height = "25"  align="left">
		<select name = "app6" id="app6" class = "normal" style="width:174px;" disabled>
			<option value="0"> Select</option>
<%
			   roleType    =   "MAS 2";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);

%>
		<option value="<%=tempArr[2]%>" <%if(AP23.equals(tempArr[2])){%>selected="selected"<%}%>><%=tempArr[3]%></option>
<%
		}
%>
        </select>
		</td> 
		  <td class = "normal" height = "25" width="10%" align="left">MAS 2</td>
        </tr>
		<tr>
		 <td></td>
		 <td></td>
			  <td class = "normal" height = "25"  align="left">
		<select name = "app9" id="app9" class = "normal" style="width:174px;" disabled>
			<option value="0">Select</option>
<%
			   roleType    =   "Finance 1";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
%>
		<option value="<%=tempArr[2]%>" <%if(AP33.equals(tempArr[2])){%>selected="selected"<%}%>><%=tempArr[3]%></option>
<%
		}
%>
        </select>
		  </td>
			  <td class = "normal" height = "25" width="10%" align="left">Finance 1</td>
		
        </tr>
		<tr>
		 <td></td>
		 <td></td>
	  <td class = "normal" height = "25"  align="left">
		<select name = "app10" id="app10" class = "normal" style="width:174px;" disabled>
			<option value="0"> Select</option>
<%
			   roleType    =   "Finance 2";
               approverData.put("roleType",roleType);				   
               approverList  = priceApprovalWebController.approversMaster(approverData);
		for(int ii=0;ii<approverList.size();ii++)
		{
			String tempArr[] = (String[])approverList.get(ii);
%>
		<option value="<%=tempArr[2]%>" <%if(AP34.equals(tempArr[2])){%>selected="selected"<%}%>><%=tempArr[3]%></option>
<%
		}
%>
        </select>
		  </td>
		  <td class = "normal" height = "25" width="10%" align="left">Finance 2</td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="4" cellpadding="0">
        <tr>
          <td width="50%">&nbsp;</td>
          <td width="50%">&nbsp;</td>
        </tr>

