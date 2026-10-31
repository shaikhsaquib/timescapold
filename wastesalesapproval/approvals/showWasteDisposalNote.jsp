<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<style>
	.select2-container .select2-selection--single 
	{
		box-sizing: border-box;
		cursor: pointer;
		display: block;
		height: 34px;		
	}
	.fa.fa-sig:after {
	  position: absolute;
	  content: "/";
	  color: GREY;
	  font-weight: 700;
	  font-size: 1.2em;
	  left: 7px;
	  top: -1px;
	  padding:0;
	  margin:0;
	}
</style>
<script>
	$(document).ready(function(){	
		
		$("#printable").find('.print').on('click', function() {

$.print("#printable");

});
	});
	</script>
<% 

		String asssignzone = (String) request.getParameter("asssignzone");

		String zoneVal	= asssignzone.substring(0,asssignzone.indexOf("|"));

		String zoneName1		= asssignzone.substring(asssignzone.indexOf("|")+1);

        Hashtable processWasteDetailsHash = new Hashtable();
        Hashtable attributeHash = new Hashtable();
        String  zone="";
        attributeHash.put("docId", "DOC1001");
        attributeHash.put("emailId",emailId);
        attributeHash.put("profileText", "ZONE HEAD");
        ArrayList listAttribute = wasteSalesHeaderController.listOfAtrributes(attributeHash);
        for (int kk = 0; kk<listAttribute.size(); kk++){
                String strArray[] = (String[]) listAttribute.get(kk);                   
                zone = strArray[0];
                break;           
	       }
       
        Calendar cal = Calendar.getInstance();
        int iYear =cal.get(Calendar.YEAR);
        int iMonth = cal.get(Calendar.MONTH)+1;
        int iDate= cal.get(Calendar.DAY_OF_MONTH);
		int curYear=cal.get(Calendar.YEAR);
   //     out.println( " Year : " + iYear + "  :  " + " Month : " + iMonth + "  :  "+" Date : " + iDate + "  :  ");
        String quator ="";
      
        if (iMonth >= 1 && iMonth <= 3){
                quator = "Q2";
        }
        if (iMonth >= 4 && iMonth <= 6){
                quator = "Q3";
        }
        if (iMonth >= 7 && iMonth <= 9){
                quator = "Q4";
        }
        if (iMonth >= 10 && iMonth <= 12){
                quator = "Q1";
                iYear = iYear+1;
        }
         String cYear = iYear+"";
         quator = quator +"-"+cYear.substring(2);
  //       out.println( " Year : " + cYear.substring(2) + "  :  " + " Month : " + iMonth + "  :  "+" Date : " + iDate + "  :  " +" quator : " + quator + "  :  ");
        String  jValue = session.getId();
        String searchCriteria[] ={"zonalType","reference","branch","date","pwmQ5FinalRate","towQ5FinalRate","rspQ5FinalRate","psQ5FinalRate","apQ5FinalRate","createdby"};
     	String serachString = " ";
        processWasteDetailsHash.put("ZONE", zoneName1 );
        processWasteDetailsHash.put("PERIOD", quator);
        processWasteDetailsHash.put("STATUS", "UI','RH','AH");
        processWasteDetailsHash.put("searchCriteria", searchCriteria);
        String reference = "Waste"+"\\"+quator+"\\"+iDate+"-"+iMonth+"-"+curYear;

	    ArrayList arrData = new ArrayList();
       arrData = wasteSalesHeaderController.search(jValue,"",processWasteDetailsHash);

        int listSize = arrData.size();

        ArrayList emailidList = new ArrayList();
		Hashtable emailHash = new Hashtable();
 		emailHash.put("COMPANYCODE", "1000");
		emailHash.put("DEPTCODE", "1002");
		emailidList = wasteSalesHeaderController.getEmailId(emailHash);
       String popupEmailId = "";
        for (int ii=0; ii<emailidList.size(); ii++) {
        String emailidArr[] = (String[])emailidList.get(ii);
       popupEmailId += "<option value='"+emailidArr[6]+"'>"+emailidArr[6]+"</option>";             
        }

		int actionCount = 0;

		if(arrData.size() > 0){
		for(int i = 0; i < arrData.size(); i++)
		{
				String[] strArray	= (String[])arrData.get(i);
			//	out.println("strArray---"+strArray[11]);
				if("I".equals(strArray[11]) || "R".equals(strArray[11]))
				{
						actionCount++;
				}
			}
		}

		String input = zoneName1;

		StringTokenizer tokenizer = new StringTokenizer(input);

		StringBuffer sb = new StringBuffer();

		while (tokenizer.hasMoreTokens()) {
			String word = tokenizer.nextToken();
			sb.append(word.substring(0, 1).toUpperCase());
			sb.append(word.substring(1).toLowerCase());
			sb.append(' ');
		}

		String zText = sb.toString();

		//out.println(arrData.size());
		 if(arrData.size() > 0 ) {
  %>
						<div class="row">
							<div class="col-xs-1"><label class="control-label">REFERENCE :</label></div>
							<div class="col-xs-4">
								<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-th"></i>   
										</span>
										<input type="text" class="form-control" id="reference" name="reference" placeholder="Reference" value="<%=reference%>" readonly>
									</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-8"><span id="subject" name ="subject"><h5>Subject : Sanction for Waste Disposal - <%=zText%><%//=zoneName1.toLowerCase()%> - <%=quator%></h5></span></div>

							<div class="col-xs-8"><h5>Dear Sir,</h5></div>

							<div class="col-xs-12"><span id="approvalNoteP" name ="approvalNoteP"><h5>Request your approval for the disposal of waste for the <%//=zoneName1.toLowerCase()%><%=zText%> in <%=quator%>. The summarized rate sheet for the top 5 items for each location of the zone is provided below for your reference.</h5></span></div>

							<input type="text" class="form-control" id="approvalNote" name = "approvalNote"  value="Request your approval for the disposal of waste for the <%//=zoneName1.toLowerCase()%><%=zText%> in <%=quator%>. The summarized rate sheet for the top 5 items for each location of the zone is provided below for your reference." style="display:none;" placeholder="approvalNote"/>

							<input type="hidden"  id="listSize"  name = "listSize" value="<%=listSize%>">
						</div>			
					
						
					
							
							<div class="col-sm-12" >
							<div class="row"><h5 class="pull-right" style="font-weight:bold;">Rs. / kg. </h5></div>
							<div class="table-responsive " >
							
							<table class="table table-bordered the-table" id="printable"  style="font-size:12px;">
								<thead>
									<tr class="info" style="font-size:12px;">
										<th class="text-center" width="15%" style="font-size:12px;">Waste Categories</th>
                                        <%  
                                             if(listSize > 0) {
                					                for(int jj = 0; jj < listSize; jj++)
					                                {
                                                        String[] cityArray	= (String[])arrData.get(jj);
                                              %>   
                                        <th class="text-center" width="10%" style="font-size:12px;"><%=cityArray[1]%> <input type="hidden"  name ="city<%=jj%>" id="city<%=jj%>"  value="<%=cityArray[1]%>" ></th>
                                        <%  } 
                                            }
                                        %>
									</tr>
								</thead>
								<tbody>
                                <tr> 
										<td class="text-center">Printed Waste</td>
                                    <% 
                                           if(listSize > 0) {
                					           for(int jj = 0; jj < listSize; jj++) {
                                                    String[ ] pwmArray = (String[ ]) arrData.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=pwmArray[3]%> <input type="hidden"  name ="pwm<%=jj%>" id="pwm<%=jj%>"  value="<%=pwmArray[3]%>" ></td>
                                     <%       }   
                                              }
                                     %>										
								</tr>
								<tr>
										<td class="text-center">Tear Off</td>
										 <% 
                                           if(listSize > 0) {
                					           for(int jj = 0; jj < listSize; jj++) {
                                                    String[ ] towArray = (String[ ]) arrData.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=towArray[4]%> <input type="hidden"  name ="tow<%=jj%>" id="tow<%=jj%>"  value="<%=towArray[4]%>" ></td>
                                     <%       }   
                                              }
                                     %>		
									</tr>
									<tr>
										<td class="text-center">Reel Ends</td>
										 <% 
                                           if(listSize > 0) {
                					           for(int jj = 0; jj < listSize; jj++) {
                                                    String[ ] reArray = (String[ ]) arrData.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=reArray[5]%> <input type="hidden"  name="re<%=jj%>" id="re<%=jj%>"  value="<%=reArray[5]%>" ></td>
                                     <%       }   
                                              }
                                     %>		
									</tr>
									<tr>
										<td class="text-center">Press Sweepings</td>
										 <% 
                                           if(listSize > 0) {
                					           for(int jj = 0; jj < listSize; jj++) {
                                                    String[ ] pgArray = (String[ ]) arrData.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=pgArray[6]%> <input type="hidden"  name="pg<%=jj%>" id="pg<%=jj%>"  value="<%=pgArray[6]%>" ></td>
                                     <%       }   
                                              }
                                     %>		
									</tr>
									<tr>
										<td class="text-center">Aluminum Plates</td>
										 <% 
                                           if(listSize > 0) {
                					           for(int jj = 0; jj < listSize; jj++) {
                                                    String[ ] apArray = (String[ ]) arrData.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=apArray[7]%> <input type="hidden"  name="ap<%=jj%>"  id="ap<%=jj%>"  value="<%=apArray[7]%>" ></td>
                                     <%       }   
                                              }
                                     %>		
									</tr>	
								</tbody>
							</table>
						</div>
						</div>
						
					
						
					
					

						<p id="approvalNote1P" name ="approvalNote1P">The approval of this document deems approval to the Purchase Committee meeting culminating into the following Waste Approval Notes.</p>

						<input type="text" class="form-control" id="approvalNote1" name = "approvalNote1" placeholder="approvalNote" value="The approval of this document deems approval to the Purchase Committee meeting culminating into the following Waste Approval Notes." style="display:none;" /><BR>

						
						<div class="row">
						
						<div class="col-xs-12" >
							<table id="table" class="table table-bordered"  >	
							<thead>
								<tr class="warning" >						
									<th class="text-center" style="font-size:12px;" width="5%">Sr.No.</th>								
									<th class="text-center" style="font-size:12px;"  width="15%">Region</th>
									<th class="text-center" style="font-size:12px;" width="10%">Reference</th>
                                    <th class="text-center" style="font-size:12px;" width="15%"> Action</th>
                                     <th class="text-center" style="font-size:12px;" width="25%">Remark</th>
								</tr>
							</thead>
							<tbody>
                            <%
                                if(arrData.size() > 0){

					                for(int i = 0; i < arrData.size(); i++)
					                {
                                        String[] strArray	= (String[])arrData.get(i);
										String remarks = "";
										//String remarks = ("NA".equals(strArray[15]))?"":strArray[15];
                                       
                                 %>                                  
							<tr class="active">
								<td class="text-center"><%=i+1%></td>								
								<td class="text-center"><%=strArray[1]%></td>
								<td class="text-center"><a href="#" onclick="showDetails('<%=strArray[0]%>')"><%=strArray[2]%></a></td>
                                <td class="text-left">
                                <% 
                                if("AH".equals(strArray[11])){     
                               
                                %><label class="radio-inline">
                                <input type="radio" name="approve<%=i%>" id="approve<%=i%>" checked="checked"  onclick="unCheck('review<%=i%>');" value ="A">Approve </label>
                                <%
								} else {   %>
                                <label class="radio-inline">
                                <input type="radio" name="approve<%=i%>" id="approve<%=i%>"  onclick="unCheck('review<%=i%>');" value ="A">Approve </label>
                                <% 
									
								}
                                 if("RH".equals(strArray[11])){    %>
                                <label class="radio-inline">
                                <input type="radio" name="review<%=i%>" id="review<%=i%>"   checked="checked" onclick="unCheck('approve<%=i%>');" value="R">Review</label>
                                <%   }else { %>
                                <label class="radio-inline">
                                <input type="radio" name="review<%=i%>" id="review<%=i%>"  onclick="unCheck('approve<%=i%>');" value="R">Review</label>
                                <%}  %>
                                </td>

                                <td class="text-center"><input type="text" class="form-control " id="remark<%=i%>"  name="remark<%=i%>" value="<%=remarks%>" placeholder="Remark"  ></td>
								<input type="hidden"  name="requestNo<%=i%>" id="requestNo<%=i%>"  value="<%=strArray[0]%>">
								<input type="hidden"  name="referenceNo<%=i%>" id="referenceNo<%=i%>"  value="<%=strArray[2]%>">
								<input type="hidden"  name="createdby<%=i%>" id="createdby<%=i%>"  value="<%=strArray[12]%>">
							</tr>		
                            <%
                               }
                                }
                            %>
							</tbody>
							</table>
						</div>
						
						</div>
						<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" >
						<table class="table table-bordered table-hover" id="tab_logic">			
							<thead>
								<tr class="warning">
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Supported By
									</th>
									
								</tr>
							</thead>
							<tbody>
								<tr id='addr0'>
									<td class="text-center">
									1
									</td>
									<td class="text-center">	                                   
                                    <select class="form-control js-example-basic-single" name="supportedBy0" id="supportedBy0" >
                                        <option value = "0" >Select Emailid</option>
                                        <%=popupEmailId%>
									</select>                                  
									</td>																	
								</tr>					
								<tr id='addr1'></tr>									
							</tbody>				
						</table>
							<a id='delete_row' class=" btn btn-default pull-right btn-sm prt" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row" class="btn btn-default pull-right btn-sm prt"><i class="fa fa-plus"></i> Add Row</a>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" >
						<table class="table table-bordered table-hover" id="tab_logic2">			
							<thead>
								<tr class="warning">
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Approved By
									</th>
									
								</tr>
							</thead>
							<tbody>
								<tr id='addr20'>
									<td class="text-center">
									1
									</td>
									<td class="text-center">
									<select class="form-control js-example-basic-single" name="approvedBy0" id="approvedBy0" >
                                        <option value = "0" >Select Emailid</option>
                                        <%=popupEmailId%>
									</select>
									</td>
																	
								</tr>					
								<tr id='addr21'></tr>									
							</tbody>				
						</table>
							<a id='delete_row2' class=" btn btn-default pull-right btn-sm prt" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row2" class="btn btn-default pull-right btn-sm prt"><i class="fa fa-plus"></i> Add Row</a>
						</div>
						</div>
					
					<div class="row ">
						<div class="col-xs-10">
							<div class="form-actions" style="margin-top:10px;">
							<div class="col-xs-offset-6 col-xs-5">
								<button type="Button" class="btn btn-warning prt" style="width:80px;"  id ="holdbutton" onclick="holdReview(this.id);">Hold</button>		
								<button type="Button" class="btn btn-info prt" style="width:80px;" id ="subbutton" onclick="submitReview(this.id);">Submit</button>		
								<button type="reset" class="btn btn-primary prt" style="width:80px;">Reset</button>
                                <input type="hidden"   name="counterApprovedBy" id="counterApprovedBy"  value="1">
                                <input type="hidden"  name="counterSupportedBy" id="counterSupportedBy"  value="1">
                                <input type="hidden"  name="zoneType" id="zoneType"  value="<%=zoneName1%>">
                                <input type="hidden"  name="zonalEmailid" id="zonalEmailid"  value="<%=emailId%>">
							</div>
							</div>
						</div>
					</div>
				
	
<%
                }else
                {
%>
                    <div class="row " style="margin-top:0px;margin-bottom:0;">
                        <table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F2F2"> 
                            <tr>
                                    <td align="left" height="20px">&nbsp;</td>
                            </tr>
                            <tr>
                                    <td align="center" class="normal" valign = "top" >No request(s) pending for approval.</td>
                            </tr>
							<tr>
                                    <td align="left" height="20px">&nbsp;</td>
                            </tr>
                        </table>
                    </div>
<%
                }
		//	}else
              //  {
%>
                   <!--  <div class="row " style="margin-top:0px;margin-bottom:0;">
                        <table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F2F2"> 
                            <tr>
                                    <td align="left" ><img src="../images/spacer.gif" width="1" height="40"></td>
                            </tr>
                            <tr>
                                    <td align="center" class="normal" valign = "top" >No request(s) to processing</td>
                            </tr>
                        </table>
                    </div> -->
<%
              //  }
%>

					
	
 <script>
	$(document).ready(function(){		
	  $(".js-example-basic-single").select2({ width: '100%'  });
      var i=1;
    $("#add_row").click(function(){
        	
		$('#addr'+i).html("<td class='text-center'>"+ (i+1) +"</td> <td class='text-center'> <select class='form-control js-example-basic-single' name='supportedBy"+i+"' id='supportedBy"+i+"' ><option value = '0' >Select Emailid</option><%=popupEmailId%></select> </td>");		
		$('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
		i++; 
         $("#counterSupportedBy").val(i);
         $(".js-example-basic-single").select2({ width: '100%'  });
	});
    $("#delete_row").click(function(){
    	if(i>1){
			$("#addr"+(i-1)).html('');
			i--;
             $("#counterSupportedBy").val(i);
		}
	});
    
	$('.multi').multiselect( {
    buttonWidth: 'col-md-10'});
	});


    var j=1;
    $("#add_row2").click(function(){
		$('#addr2'+j).html("<td class='text-center'>"+ (j+1) +"</td> <td class='text-center'><select class='form-control js-example-basic-single' name='approvedBy"+j+"' id='approvedBy"+j+"' ><option value = '0' >Select Emailid</option><%=popupEmailId%></select> </td>");		
		$('#tab_logic2').append('<tr id="addr2'+(j+1)+'"></tr>');
		j++; 
        $("#counterApprovedBy").val(j);
          $(".js-example-basic-single").select2({ width: '100%'  });
	});
    $("#delete_row2").click(function(){
    	if(j>1){
			$("#addr2"+(j-1)).html('');
			j--;
            $("#counterApprovedBy").val(j);
		}
	});
</script>