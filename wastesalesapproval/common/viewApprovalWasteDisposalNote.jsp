<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility,org.json.simple.JSONArray,org.json.simple.JSONObject,org.json.simple.JSONValue"%>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<!DOCTYPE >
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> Waste Aprroval Process </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="../css/style_1.css" rel="stylesheet"/>
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-multiselect.css" rel="stylesheet">
	<link href="../css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
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
  .class1
	{
	 color: black;
	}
}
	</style>	
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/bootstrap-multiselect.js"></script>	
	 <script src="../js/wysihtml5-0.3.0.min.js"></script>
	<script src="../js/bootstrap3-wysihtml5.js"></script>	
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/additional-methods.min.js"></script>	
    	<script src="../js/wasteSales.js"></script>	
	<script>
	$(document).ready(function(){
	/*$('#log').on('click', function(e){
		$("#details").toggle();
		$(this).toggleClass('class1')
	});*/

	$('#ApprovalsId').on('click', function(e){
		$("#approverDetails").toggle();
		$(this).toggleClass('class1')
	});

	$('#log').on('click', function(e){
		$("#details").toggle();
		$(this).toggleClass('class1')
	});

	

	//$("#approverDetails").hide(); 

	
	$('.RelatedLinks ul li.RelLinks').hover(function() {
	$(this).find('.dropdownmenu').show();
	}, function(){ 
	$(this).find('.dropdownmenu').hide();
	});
	});
  </script>

	</head>
<%@ include file="../includes/statusHash.jsp" %>
<% 
    Hashtable processWasteDetailsHash = new Hashtable();
    Hashtable searchHash = new Hashtable();
	Hashtable logHash = new Hashtable();
	ArrayList logList = new ArrayList();
    ArrayList dList = new ArrayList();
    ArrayList approvalList = new ArrayList();
    String arrString [] = null;
    String jsString = null;
    String reference  = null;
    String requestNumber  =  (String)request.getParameter("requestId");
	int logSize =0;

    processWasteDetailsHash.put("REQUESTOID", requestNumber);
    processWasteDetailsHash.put("DOCUMENTOID", "DOC1001");
    ArrayList arrData = new ArrayList();
    arrData = wasteSalesHeaderController.view("","",processWasteDetailsHash);
    
	String str = null;
	String ApprovalNote1 = "";
	String ApprovalNote = "";
	String strRequestNo = "";
    searchHash.put("DOCUMENTOID", "DOC1001");
    searchHash.put("WORKITEMOID", requestNumber);
    approvalList = docChangeLogController.search("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",searchHash);
    int counter = arrData.size();
    for (int ii =0 ;ii< counter ;ii++){
        arrString = (String [] )arrData.get(ii);
        jsString = arrString[3]; 
        if(jsString.contains("WEST ZONE")){
        	str = "WEST ZONE";
        }
        if(jsString.contains("EAST ZONE")){
        	str = "EAST ZONE";
        }
        if(jsString.contains("NORTH ZONE")){
        	str = "NORTH ZONE";
        }
        if(jsString.contains("SOUTH1 ZONE")){
        	str = "SOUTH1 ZONE";
        }
		if(jsString.contains("SOUTH2 ZONE")){
        	str = "SOUTH2 ZONE";
        }
		if(jsString.contains("MMCL ZONE")){
        	str = "MMCL ZONE";
        }
		if(jsString.contains("MMCL WEST ZONE")){
        	str = "MMCL WEST ZONE";
        }
        JSONObject responseJson = (JSONObject) JSONValue.parse(jsString);  
        JSONArray lData = (JSONArray) responseJson.get(str);      
        for (int jj=0;jj<lData.size();jj++){
            JSONObject jsObject = (JSONObject) lData.get(jj);
             if(jj==0){
                 reference =  (String) jsObject.get("REFERENCE");
             }
            String requestNo =  (String) jsObject.get("REQUESTNO");
            String cityName = (String) jsObject.get("CITY");
            String pwmName =   (String) jsObject.get("PWM");
            String towName = (String) jsObject.get("TOW");
            String rewName = (String) jsObject.get("REW");
            String pgwName = (String) jsObject.get("PGW");
            String apwName = (String) jsObject.get("APW");          
            String status =  (String) jsObject.get("STATUS");
            String remark =  (String) jsObject.get("REMARK");
            String docRef =  (String) jsObject.get("DOCREFERENCE");
            

            if (requestNo == null && cityName == null && pwmName == null && towName == null && rewName == null && pgwName == null && apwName == null && status == null && remark == null  && docRef == null) {
				JSONObject js1 =  (JSONObject) jsObject.get("APPROVENOTE");
				ApprovalNote =(String) js1.get("ApprovalNote");
				ApprovalNote1 = (String) js1.get("ApprovalNote1");
            }else {
                String mainString[] =  {requestNo,cityName,pwmName,towName,rewName,pgwName,apwName,status,remark,docRef};
                dList.add(mainString);
              }            
        }     
    }     
	

    int sCounter = 0;
    int aCounter = 0;
    int listSize = dList.size();
   for (int ii=0; ii<approvalList.size(); ii++){
        String strArr[] = (String[])approvalList.get(ii);
        String str1 = strArr[2];
        if (str1.contains("Support")){
        	sCounter++;
        }
        if (str1.contains("Approval")){
        	aCounter++;
        }
	}  
	
	String input = str;

	StringTokenizer tokenizer = new StringTokenizer(input);

	StringBuffer sb = new StringBuffer();

	while (tokenizer.hasMoreTokens()) {
		String word = tokenizer.nextToken();
		sb.append(word.substring(0, 1).toUpperCase());
		sb.append(word.substring(1).toLowerCase());
		sb.append(' ');
	}

	String zText = sb.toString();

	
    %>
<body>
<%@ include file="../common/relatedLinks.jsp" %>
	<div class="container well">
	<div class="row ">
		<div class="col-xs-1"></div>
		<div class="col-xs-10 bs-example">
		<div class="row" style="margin-bottom:2px;"><button type="button"  value="Print" name="printButton" id="printButton" class="btn btn-danger  pull-right" onclick = "javascript:window.print();"><i class="fa fa-print"></i> Print</button></div>
			<div class="portlet box blue">
			<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i>  Waste Disposal Note For The <%=str%> 
			</div>			
			</div>

				<div class="portlet-body">
					<form class="form-horizontal" role="form" name="viewAllWasteSalesRequest" method ="post">
					<%@ include file="../includes/legand.jsp" %>
					<div class="demo_form">
  <%

                     if(listSize > 0) {
						 
						 String[] refStrs = reference.split("\\\\");

						 Hashtable  quarterHash = new Hashtable();
						 String srtquar= "";
						 String srtApproveNote= "";
						 quarterHash.put("Q1","Jan - Mar");
						 quarterHash.put("Q2","Apr - Jun");
						 quarterHash.put("Q3","Jul - Sep");
						 quarterHash.put("Q4","Oct - Dec");
						
						if(refStrs.length > 1){
							if(refStrs[1].contains("Q1"))
							{
								//srtquar = "Jan - Mar";
								srtquar= refStrs[1].replaceAll("Q1-", "Jan-Mar, ");
								srtApproveNote= ApprovalNote.replaceAll("Q1-", "Jan-Mar, ");

							}else if(refStrs[1].contains("Q2"))
							{
								//srtquar = "Apr - Jun";
								srtquar= refStrs[1].replaceAll("Q2-", "Apr-Jun, ");
								srtApproveNote= ApprovalNote.replaceAll("Q2-", "Apr-Jun, ");

							}else if(refStrs[1].contains("Q3"))
							{
								srtquar= refStrs[1].replaceAll("Q3-", "Jul-Sep, ");
								srtApproveNote= ApprovalNote.replaceAll("Q3-", "Jul-Sep, ");
								//srtquar = "Jul - Sep";
							}else
							{
								srtquar= refStrs[1].replaceAll("Q4-", "Oct-Dec, ");
								srtApproveNote= ApprovalNote.replaceAll("Q4-", "Oct-Dec, ");
								//srtquar = "Oct - Dec";
							}
						}else{
							srtquar = refStrs[0];
							srtApproveNote = ApprovalNote;
						}


  %>
						<div class="row ">
							<div class="col-xs-12">
							<div class="col-xs-6">
							<div class="form-group">
								<label class="control-label col-xs-2">REFERENCE:</label>
								<div class="col-xs-10">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-th"></i>   
										</span>
										<input type="text" class="form-control " id="reference" name = "reference" placeholder="Reference" disabled = "true" value="<%=reference%>" >  
                                         <input type="hidden"  id="listSize"  name = "listSize" value="<%=listSize%>" >
									</div>
								</div>
							</div>
							</div>							
							</div>	
						</div>
						</div>	
						<% if(refStrs.length>1){ %>
							<h5 ><span style="font-weight:bold;margin-top:0px;">Subject : </span>Sanction for Waste Disposal - <%=zText%> - <%=srtquar%><%//=refStrs[1]%> <h5>
						<%}else{ %>
							<h5 ><span style="font-weight:bold;margin-top:0px;">Subject : </span>Sanction for Waste Disposal - <%=zText%> - <%=srtquar%><%//=refStrs[0]%> <h5>
						<%}%>
						<p>
						Dear Sir, </p><p><%=srtApproveNote%></p>
						<div class="row ">
						<h5 class="pull-right" style="font-weight:bold;">Rs/kg </h5>
							<table class="table table-bordered">
								<thead>
									<tr class="info">
										<th class="text-center" width="15%">Waste Categories</th>
                                        <%  
                                             if(listSize > 0) {
                					                for(int kk = 0; kk < listSize; kk++)
					                                {
                                                        String[] cityArray	= (String[])dList.get(kk);
                                              %>   
                                        <th class="text-center" width="13%"><%=cityArray[1]%> <input type="hidden"  name ="city<%=kk%>" id="city<%=kk%>"  value="<%=cityArray[1]%>" ></th>
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
                                                    String[ ] pwmArray = (String[ ]) dList.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=pwmArray[2]%> <input type="hidden"  name ="pwm<%=jj%>" id="pwm<%=jj%>"  value="<%=pwmArray[2]%>" ></td>
                                     <%       }   
                                              }
                                     %>										
								</tr>
								<tr>
										<td class="text-center">Tear Off</td>
										 <% 
                                           if(listSize > 0) {
                					           for(int jj = 0; jj < listSize; jj++) {
                                                    String[ ] towArray = (String[ ]) dList.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=towArray[3]%> <input type="hidden"  name ="tow<%=jj%>" id="tow<%=jj%>"  value="<%=towArray[3]%>" ></td>
                                     <%       }   
                                              }
                                     %>		
									</tr>
									<tr>
										<td class="text-center">Reel ends</td>
										 <% 
                                           if(listSize > 0) {
                					           for(int jj = 0; jj < listSize; jj++) {
                                                    String[ ] reArray = (String[ ]) dList.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=reArray[4]%> <input type="hidden"  name="re<%=jj%>" id="re<%=jj%>"  value="<%=reArray[4]%>" ></td>
                                     <%       }   
                                              }
                                     %>		
									</tr>
									<tr>
										<td class="text-center">Press Sweepings</td>
										 <% 
                                           if(listSize > 0) {
                					           for(int jj = 0; jj < listSize; jj++) {
                                                    String[ ] pgArray = (String[ ]) dList.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=pgArray[5]%> <input type="hidden"  name="pg<%=jj%>" id="pg<%=jj%>"  value="<%=pgArray[5]%>" ></td>
                                     <%       }   
                                              }
                                     %>		
									</tr>
									<tr>
										<td class="text-center">Aluminium Plates</td>
										 <% 
                                           if(listSize > 0) {
                					           for(int jj = 0; jj < listSize; jj++) {
                                                    String[ ] apArray = (String[ ]) dList.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=apArray[6]%> <input type="hidden"  name="ap<%=jj%>"  id="ap<%=jj%>"  value="<%=apArray[6]%>" ></td>
                                     <%       }   
                                              }
                                     %>		
									</tr>	
								</tbody>
							</table>
						</div>
						<p><%=ApprovalNote1%></p>
						<div class="row">
						
						<div class="col-xs-11" >
							<table id="table" class="table table-bordered"  >	
							<thead>
								<tr class="warning" >						
									<th class="text-center">Sr.No.</th>								
									<th class="text-center">Region</th>
									<th class="text-center">Reference</th>
                                    <th class="text-center">Action</th>
                                     <th class="text-center">Remark</th>
								</tr>
							</thead>
							<tbody>
                            <%
                                if(dList.size() > 0){
					                for(int i = 0; i < dList.size(); i++)
					                {
                                        String[] strArray	= (String[])dList.get(i);
                                 %>                                  
							<tr class="active">
								<td class="text-center"><%=i+1%></td>								
								<td class="text-center"><%=strArray[1]%></td>
								<td class="text-center"><a href="#" onclick="showDetails('<%=strArray[0]%>')"><%=strArray[9]%> <input type="hidden"  name="requestNo<%=i%>" id="requestNo<%=i%>"  value="<%=strArray[0]%>"><input type="hidden"  name="docReference<%=i%>" id="docReference<%=i%>"  value="<%=strArray[9]%>"></a></td>
                             <%     strRequestNo = strArray[0]+"','"+strRequestNo;
									if ("A".equals(strArray[7])){      %>
                                              <td class="text-center"><label class="radio-inline">
                                                <input type="radio" name="approve<%=i%>" id="approve<%=i%>" checked="checked" onclick="unCheck('review<%=i%>');" value ="A">Approve </label>
                           <%      }else { %>
                                                <td class="text-center"><label class="radio-inline">
                                                <input type="radio" name="approve<%=i%>" id="approve<%=i%>"  onclick="unCheck('review<%=i%>');" value ="A">Approve </label>
                            <%      } 
                                      if ("R".equals(strArray[7])){    %>
                                                <label class="radio-inline">
                                                <input type="radio" name="review<%=i%>" id="review<%=i%>"  checked="checked" onclick="unCheck('approve<%=i%>');" value="R">Review</label></td>
                            <%      }else { %>
                                                <label class="radio-inline">
                                                <input type="radio" name="review<%=i%>" id="review<%=i%>"  onclick="unCheck('approve<%=i%>');" value="R">Review</label></td>
                        <%      }   %>
                                <td class="text-center"><input type="text" class="form-control " id="remark<%=i%>"  name="remark<%=i%>"  placeholder="Remark"   value = ""></td><!-- <%//=("NA".equals(strArray[8]) ? "" :strArray[8])%> -->
							</tr>		
                            <% 
                               }
                                }
                            %>
							</tbody>
							</table>
						</div>
						
						</div>

						 <div class="row ">
							<div class="col-xs-10">
								<div class="form-actions" style="margin-top:10px;">
								<div class="col-xs-offset-6 col-xs-5">
								<%
										   for (int ii=0; ii<approvalList.size(); ii++){
												 String strArr[] = (String[])approvalList.get(ii);
												 String emailIdStr = strArr[3];
												 String statusStr = strArr[7];                      
												if (emailId.equals(emailIdStr) && "L".equals(statusStr)){
								%>
												  <button type="Button" class="btn btn-info " style="width:80px;"  id = "approverSub" onclick="submitForApprovals(this.id);">Submit</button>		
								<%    } } %>
									<button type="Button" class="btn btn-primary" style="width:80px;"  onclick="javascript:history.back();">Close</button>
									<input type="hidden"   name="counterApprovedBy" id="counterApprovedBy"  value="<%=aCounter%>">
									<input type="hidden"  name="counterSupportedBy" id="counterSupportedBy"  value="<%=sCounter%>">
									<input type="hidden"  name="workItemOID" id="workItemOID"  value="<%=requestNumber%>">
								</div>
								</div>
							</div>
						</div>

						<p id="ApprovalsId" >&nbsp;&nbsp;&nbsp;&nbsp;<b>Approval Details :&nbsp;</b><span style="cursor:pointer">[Show / Hide]</span></p>
						<div class="row" id="approverDetails" style="display:none">
						<div class="col-xs-6" >
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
                            <%  for (int ii=0; ii<approvalList.size(); ii++)	{
                                      String strArr[] = (String[])approvalList.get(ii);
                                      String str1 = strArr[2];
                                        if (str1.contains("Support")){
                                            for (int mm=0; mm<sCounter; mm++)	{
                                            String madeStr = "Support"+(mm+1) ;
                            //          out.println("  support " +str  + "  madeStr  " +madeStr);
                                        if(madeStr.equals( strArr[2])){
                                            %>
								        <tr id="addr<%=mm%>">
									    <td class="text-center">
									<%=(mm+1)%>
									</td>
									<td class="text-center">	                                   
                                   	<input type="text" class="form-control " id="supportedBy<%=mm%>" name = "supportedBy<%=mm%>"  disabled value="<%=strArr[3]%>" >  
									</td>																	
								</tr>					
								<%      } }  }}%>						
							</tbody>				
						</table>						
						</div>
						<div class="col-xs-6" >
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
								<%  for (int ii=0; ii<approvalList.size(); ii++)	{
                                      String strArr[] = (String[])approvalList.get(ii);
                                      String str1 = strArr[2];
                                        if (str1.contains("Approval")){
                                            for (int nn= 0; nn < aCounter; nn++)	{
                                            String madeStr = "Approval"+(nn+1) ;
                            //          out.println("  support " +str  + "  madeStr  " +madeStr);
                                        if(madeStr.equals(strArr[2])){
                                            %>
								        <tr id="addr<%=nn%>">
									    <td class="text-center">
									<%=(nn+1)%>
									</td>
									<td class="text-center">	                                   
                                   	<input type="text" class="form-control " id="approvedBy<%=nn%>" name = "approvedBy<%=nn%>" disabled  value="<%=strArr[3]%>" >  
									</td>																	
								</tr>					
								<%      } }  }}%>										
							</tbody>				
						</table>						
						</div>
						</div>
												
<div class="row"><div class="col-xs-8" >
<% 
			if("".equals(strRequestNo))
			{
					logSize=0;
			}else
			{
				String trimStrRequestNo	= 	strRequestNo.substring(0, strRequestNo.length()-2);
				trimStrRequestNo  = "('"+trimStrRequestNo+")";
				logHash.put("REQUESTNO", trimStrRequestNo);
				logHash.put("DOCUMENTOID", "DOC1001");
			//	logHash.put("STATUS", "R");
				
				logList = wasteSalesHeaderController.searchLog("ttw","fasdfar",logHash);
				logSize = logList.size();
			}
					
%>
	
					<p id="log" ><b>Approval History :&nbsp;</b><span style="cursor:pointer">[Show / Hide]</span></p>
					</div></div>
					<div class="row "  id="details"> 
					<div class="col-xs-12" >
						<table class="table table-bordered table-hover" id="">			
							<thead>
								<tr class="warning">
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-left" >
										Reference
									</th>
									<th class="text-left" >
										Action By
									</th>
									<th class="text-left" >
										Action On
									</th>
									<th class="text-left" >
										Remarks
									</th>
									<th class="text-left" >
										Status
									</th>
								</tr>
							</thead>
							<tbody>
<%
		if(logSize == 0)	
		{
%>
							<tr>
								<td class="text-center"   colspan="6"  >No action details to be display.</td>																	
							</tr>
<%
}else{
							for (int ll=0; ll<logList.size(); ll++)	{
							  String logArr[] = (String[])logList.get(ll);
%>
							<tr>
								<td class="text-center"><%=(ll+1)%></td>																	
								<td class="text-left"><%=logArr[2]%></td>																	
								<td class="text-left"><%=logArr[5]%></td>																	
								<td class="text-left"><%=logArr[6]%></td>																	
								<td class="text-left"><%=logArr[4]%></td>																	
								<!-- <td class="text-center"><%//="-".equals(logArr[4])?"No comments": logArr[4]%></td>	 -->																
								<td class="text-left"><img src="<%=statusImg.get(logArr[7])%>" border="0"></td>																	
							</tr>	
<%
									}
		}
%>	
							</tbody>				
						</table>						
					</div>					
					</div>

       
 <%
                }else
                { 
%>
                    <div class="row " style="margin-top:0px;margin-bottom:0;">
                        <table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F2F2"> 
                            <tr>
                                    <td align="left" ><img src="../images/spacer.gif" width="1" height="40"></td>
                            </tr>
                            <tr>
                                    <td align="center" class="normal" valign = "top" >No Matching records found</td>
                            </tr>
                        </table>
                    </div>
<%
                }
    %>
        </div>
        </form>
    </div>
</div>	
</div>
<div class="col-xs-1"></div>
</div>
</div>

</body>

</html>