<%
	GregorianCalendar thisDay = new GregorianCalendar( );
	String date = "";
	String assuredName = "BCCL";
    String policyNumber = "";
	int monthNum = thisDay.get(Calendar.MONTH);
	monthNum = monthNum+1;
	String month = Integer.toString(monthNum);
	if(date == null || date.equals("")){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));

		if(date.length() == 1){
			date = "0" + date;
		}
		if(month.length() == 1){
			month = "0" + month;
		}
		date += "/" + month;
		
		date += "/" +Integer.toString(thisDay.get(Calendar.YEAR));
	}

	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = requestNo;

	Hashtable claimRequestHash = new Hashtable();
	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

    //System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable approverClaimDetails = xmlObj.readSubNode(myClaimRequestValues[13], "approverClaimDetails");
        policyNumber = (String)approverClaimDetails.get("policyNumber-");
        //System.out.println("policyNumber-----"+policyNumber);
%>
    <input type = "hidden" name = "ploicyNumber" value = "<%=policyNumber%>">

    <!-- <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
		  <tr>
			   <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
		 <tbody>
		  <tr>
			   <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">GPA CLAIM FORM</span></div></td>
		  </tr>
		  </tbody>
	  </table> -->

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="right"><span class="style4">GPA CLAIM FORM</span></div></td>
        </tr>
		
		
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Claim Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=myClaimRequestValues[1]%></div></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Policy Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyNumber-")%></div></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Insurance Company: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyInsuCompany-")%></div></td>
        </tr>
		</tbody></table>

	<table cellspacing="0" cellpadding="0" width="700" border="0">
	<tbody>
		   <tr>
                 <td width="100%" colspan="4" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
           </tr>
         
    </tbody>
    </table>
	
    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
           <tr>
                 <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
           </tr>
		   <tr>
                 <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
           </tr>
    </tbody>
    </table>

    <table cellspacing="0" cellpadding="0" width="700" border="0">
	<tbody>
		    <tr>
		
                  <td colspan="100" height="5"></td></tr>
		    <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Period Of Insurance: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="periodOfInsurance" class="style3" size="17"></div></td>
		    </tr>
		    <tr>
                 <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
            </tr>
		    <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Date Of Accident: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="accidentDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
		    </tr>
		    <tr>
                 <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
            </tr>
		    <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left"> Claim Number: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"> <%=myClaimRequestValues[1]%></div></td>
            </tr>
		    <tr>
                 <td colspan="100" height="5"></td></tr>
		    <tr>
	</tbody>
	</table>

    <table cellspacing="0" cellpadding="0" width="700" border="0">
	<tbody>
		 
		    <tr>
                 <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
            </tr>
    </tbody>
	</table>
	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
	       <tr>
                 <td colspan="100" height="5"></td></tr>
		   <tr>
		   <tr>
                 <td align="left" bgcolor="#FFFFFF" height="30"><span class="style4">1. DETAILS OF INSURED&nbsp;&nbsp;&nbsp;</span></td>
           </tr>
           <br>
		   <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left">(i). Name of insured: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="insuredName" class="style3" size="20" maxlength="50"></div></td>
		   </tr>
           <tr>
                 <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> 
		   <tr>
                 <td height="50" align="right" class="style4"><div align="left">(ii). Address for correspondence : &nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><textarea name="address" cols="35" class="style3" id="area"></textarea>  </td>
          </tr>
		   <tr>
                 <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> 
		  <tr>
                 <td width="56%" height="30" align="right" class="style4"><div align="left">(iii). Contact Number: &nbsp;&nbsp;&nbsp;</div></td>
                 <td width="74%" height="20" align="left" class="style3"><input type="text" name="insuredTelephone" class="style3" size="17"></div></td>
		  </tr>
		 
	</tbody>
	</table>

    <table cellspacing="0" cellpadding="0" width="700" border="0">
	<tbody>
		 
		  <tr>
                 <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
    </tbody>
	</table>
	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
	      <tr>
                 <td colspan="100" height="5"></td>
		  </tr>
          <br>
		

		 <tr>
                <td width="56%" height="30" align="right" class="style4"><div align="left">2 (i). Name of injured person: &nbsp;&nbsp;&nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><input type="text" name="injuredName" class="style3" size="20" maxlength="50"></div></td>
		 </tr>
      
        <tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr> 
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(ii). Address of injured person: &nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><textarea name="address1" cols="35" class="style3" id="area"></textarea>  </td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr> 
		<tr>
                <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(iii). Age: &nbsp;&nbsp;&nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><input type="text" name="age" class="style3" size="17"></div></td>
		</tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr> 
		<tr>
                <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(iv). Date & time of injury: &nbsp;&nbsp;&nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><input type="text" name="injuryDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
		</tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr> 
		<tr>
                <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(v). Place of injury: &nbsp;&nbsp;&nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><input type="text" name="placeOfInjury" class="style3" size="17"></div></td>
		</tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr> 
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(vi). Details of the accident: &nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><textarea name="accidentdetails" cols="35" class="style3" id="area" ></textarea>  </td>
        </tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr> 
		
		<tr>
                <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(vii). Whether reported to Police: &nbsp;&nbsp;&nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3">
		       <input type="radio" name="r1" value="Yes">Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="radio" name="r1" value="No">No
               </td>
		</tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr> 
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(viii). If yes then name and address of Police Station: &nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><textarea name="address2" cols="35" class="style3" id="area"></textarea>  </td>
        </tr>
		<tr>
                <td colspan="100" height="5"></td></tr>
		<tr>
	</tbody>
	</table>

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
		 
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
    </tbody>
	</table>
	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
	    <tr>
                <td colspan="100" height="5"></td></tr>
		<tr>
		<br>
		<tr>
                <td width="56%" height="30" align="right" class="style4"><div align="left">3 (i). Were you moved to
		        hospital immediately after the accident?: &nbsp;&nbsp;&nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3">
		        <input type="radio" name="r2" value="Yes">Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="r2" value="No">No
                </td>
		</tr>
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr> 
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(ii). If yes then Name & address of the hospital: &nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><textarea name="address3" cols="35" class="style3" id="area" ></textarea></td>
        </tr>
		<tr>
               <td colspan="100" height="5"></td>
		</tr>
		
	</tbody>
	</table>

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
		 
		<tr>
                <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
    </tbody>
	</table>

    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
	    <tr>
                <td colspan="100" height="5"></td>
		</tr>
		<tr>
                <td width="56%" height="30" align="right" class="style4"><div align="left">4. Do you have any other Personal
		        Accident Policy?:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
		        <td width="74%" height="20" align="left" class="style3">
		       <input type="radio" name="r3" value="Yes">Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="radio" name="r3" value="No">No
                </td>
        </tr>
		<br>
		<tr>
                <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If yes, please give : &nbsp;&nbsp;&nbsp;</div></td>
        </tr>
		  
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(i). Name of the Insurance company: &nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><input type="text" name="insuranceCompanyname" class="style3" size="20" maxlength="50"></div></td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(ii). Address of the issuing office: &nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><textarea name="address4" cols="35" class="style3" id="area" ></textarea>  </td>
        </tr>
		<tr>
                <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp;&nbsp;&nbsp;(iii). Policy No:</span></div></td>
		        <td align="left" class="style3"><%=(String)approverClaimDetails.get("policyNumber-")%></td> 
		        <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		        <td align="left">&nbsp;</td>
        </tr>
		<tr>
                <td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(iv). Period: &nbsp;</div></td>
                <td width="74%" height="20" align="left" class="style3"><input type="text" name="period" class="style3" size="17"></div></td>
        </tr>
       
		<tr>
                <td colspan="100" height="5"></td>
		</tr>
		
	</tbody>
	</table>

	<table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
		 
		 <tr>
               <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
     </tbody>
	 </table>
	
    <table cellspacing="0" cellpadding="0" width="700" border="0">
    <tbody>
		 
		<tr>
               <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
        </tr>
    </tbody>
	</table>	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody>
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;I hereby agree, affirm and declare that:<br></span></div></td>
		</tr>
		<tr>
			<td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;(a) The
			statements/information given/stated by me in this claim form are true, correct and complete.<br></span></div></td>
		</tr>
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;(b) No material information which is relevant to the processing of the claim or which in any manner has a bearing 
		    on the &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    claim has been withheld 
		    or not disclosed.</span></div></td>		 
		    <td align="left">&nbsp;</td>
		</tr>
		
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;(c) If I have 
		    given/made any false or fraudulent statement/information, or suppressed or concealed or in any 
		    manner failed &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to disclose material information, the policy shall be void and that I shall not be entitled to all/any rights to recover  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;thereunder in respect of any or all claims, past, present 
		    or future.<br></span></div></td>
		</tr>
		
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;(d) The receipt 
		    of this claim form/other supporting/related documents does not constitute or be deemed to 
		    constitute &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;an agreement by the Company of the claim and the Company reserves the right to process or reject or require &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;further/additional information in respect of the claim.<br><br><br></span></div></td>
		</tr>
		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Place
		 <br></span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Date
		 <br></span></div>
		 </td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		 <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Signature of the Injured Person
		 <br></span></div>
		 </td>
		  <td align="left">&nbsp;</td>
		  </tr>
		 
		</tbody>
</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	
<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
		<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody>
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;(To be filled in by the Employer/Insured)<br></span></div></td>
		</tr>
        <br>

		<tr>
        <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;1. Was the injured person in respect of whom claims being made &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;absent from work?:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
		  <td width="74%" height="20" align="left" class="style3">
		  <input type="radio" name="r4" value="Yes">Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="r4" value="No">No
         </div></td>
        </tr>
		<tr>
          <td height="50" align="right" class="style4"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If so, please furnish the details of such absence. &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="absenseDetails" cols="35" class="style3" id="area" ></textarea>  </td>
        </tr>
		</tbody>
</table>

		<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	
<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody>
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;I / We hereby declare that the particulars made by the injured person in the claim from are true to the best of our &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;knowledge and belief. <br></span></div></td>
		</tr>
		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Place
		 <br></span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Date
		 <br></span></div>
		 </td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		 <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Signature of the Insured
		 <br></span></div>
		 </td>
		  <td align="left">&nbsp;</td>
		  </tr>
		 
		</tbody>
</table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	
<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
		 <tr>
         <td align="left" bgcolor="#FFFFFF" height="30"><span class="style4">SECTION II (TO BE COMPLETED BY HOSPITAL AUTHORITIES)&nbsp;&nbsp;&nbsp;</span></td>
        </tr>
        <br>
		
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left">1. Name and address of the hospital &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="nameAndAddress" cols="35" class="style3" id="area"></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> 
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">2. Date of admission<br> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(As in patient / out patient /  emergency case) &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="dateOfAdmission" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
		  </tr>
		  <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> 
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">3. Date of discharge &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="dateOfDischarge" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
		  </tr>
		  <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> 
		  <tr>
          <td width="56%" height="40" align="right" class="style4"><div align="left">4 (i). Nature of injury &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="natureOfInjury" class="style3" size="20" maxlength="50"></div></td>
		  </tr>
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(ii). Particulars of treatment &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
           <td width="74%" height="20" align="left" class="style3"><textarea name="treatmentdetails" cols="35" class="style3" id="area"></textarea></td>
		  </tr>
		   <td align="left">&nbsp;</td>
		  <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> 
		  
		  <td align="left">&nbsp;</td>

			<tr>
			<td width="56%" height="30" align="right" class="style4"><div align="left"><p>5 (i). Has the accident resulted into loss of hand/s or foot/feet or <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;eye/s or permanent disability of any other type which may &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prevent the insured from engaging in or being occupied with <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or giving attention to any employment or occupation &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;whatsoever?</p></div></td>
			<td width="74%" height="20" align="left" class="style3">
			<input type="radio" name="r5" value="Yes">Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="r5" value="No">No
			</div></td>
			</tr>

		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;(ii). If yes, please give details &nbsp;&nbsp;&nbsp;</div></td>
		  <td width="74%" height="20" align="left" class="style3"><textarea name="Details" cols="35" class="style3" id="area"></textarea>  </td>
		  </tr>
		   <td align="left">&nbsp;</td>
		
	</tbody></table>

	<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	
<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody><br><br>
		 <tr>
		 <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp;Signature of the competent Authority of &nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Hospital / Nursing Home

		 <br></span></div>
		 </td>
		  <td align="left">&nbsp;</td>
		  </tr>
		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Date&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name
		 <br></span></div></td>
		 
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Official Seal of the Hospital:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Designation
		 <br></span></div> </td>
		 
		  <td align="left">&nbsp;</td>
		  </tr>
		 
		 
		</tbody>
</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	
<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
		 <tr>
         <td align="left" bgcolor="#FFFFFF" height="30"><span class="style4">SECTION III (TO BE COMPLETED BY NOMINEE IN THE EVENT OF INSURED’S DEATH)&nbsp;&nbsp;&nbsp;</span></td>
        </tr>
        <br>
		
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left">1. Details of Nominee &nbsp;</div></td>
          
        </tr>
		
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">(i). FullName&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="nomineeName" class="style3" size="20" maxlength="50"></div></td>
		  </tr>
		  <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> 
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">(ii). Address &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="address5" cols="35" class="style3" id="area"></textarea></td>
		  </tr>
		  <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> 
		  <tr>
          <td width="56%" height="40" align="right" class="style4"><div align="left">(iii). Age &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="nomineeAge" class="style3" size="17"></div></td>
		  </tr>
		  <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> 
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">(iv). Relationship with the deceased &nbsp;&nbsp;&nbsp;</div></td>
           <td width="74%" height="20" align="left" class="style3"><textarea name="relation" cols="35" class="style3" id="area" ></textarea></td>
		  </tr>
		   <td align="left">&nbsp;</td>
		 

			
	</tbody></table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	
<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>	  

    <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>

		<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody>
		
		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Place
		 <br></span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Date
		 <br></span></div>
		 </td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		 <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Signature of the Nominee
		 <br></span></div>
		 </td>
		  <td align="left">&nbsp;</td>
		  </tr>
		 
		</tbody>
</table>

   

		<table cellspacing="0" cellpadding="0" width="700" border="0">
        <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		
</table>


<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value="<%=date%>" onfocus="onLoadDetail(<%=requestNo%>,'frmMarineInsuranceClaim');" readOnly> </td>
		 </tr>		 
</table>

		<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="center" class="style5">
				<u>GPA Claim Documentation</u>
			</td>
		 </tr>
		<tr>
			<td height="30" colspan="2" align="left" class="style3">
				<input type="checkbox" name="intimation">Death Certificate<br>				
				<input type="checkbox" name="invoice">Post Mortem Report<br>
				<input type="checkbox" name="report">Original Policy document with receipt<br>
				
			</td>
		 </tr>			
</table>

		 <table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="right" class="style5" id="attachment"></td>
		 </tr>		 
	</table>

	 <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody>
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Declaration to be signed by the Insured/ claimant or by the Nominee (in the event of Insured’s death).<br></span></div></td>
		</tr>
		<tr>
			<td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;I/WE HEREBY DECLARE and warrant the truth of the foregoing particulars in every respect. I / We agree that if I / we have &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;made or shall make false or untrue statement, suppression or concealment, my/our right to compensation shall be forfeited.<br></span></div></td>
		</tr>
		<tr>
		    <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;I/we also here by declare that I am /we are accepting the amount in full discharge of your obligations under the policy to the &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Insured Person and / or his/her legal heirs. I/We will hold you indemnified in the event of any claim under this policy being &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;made against you by any other person or persons.</span></div></td>		 
		    <td align="left">&nbsp;</td>
		</tr>
		
		
		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Place
		 <br></span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Date
		 <br></span></div>
		 </td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		 <td align="left" bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Signature of the Nominee
		 <br></span></div>
		 </td>
		  <td align="left">&nbsp;</td>
		  </tr>
		 
		</tbody>
</table>
<table width="250" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "gpa_validate()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Preview
           </td>
		   <td align="center" class="blueButton" style="height:40px;" onclick= "this.form.reset();" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reset</td>
        </tr>
	</table> 



<%
	String claimNumber = (String)request.getParameter("claimNumber");
	//String requestNo = (String)request.getParameter("requestNo");

%>
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "submitClaim">
<input type = "hidden" name = "hiddFormName" value = "GpaInsurance">
