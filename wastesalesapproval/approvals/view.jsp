<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
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
	<!--[if lte IE 9]>
	<link href="../css/IE9.css" rel="stylesheet" type="text/css" type="text/css"/>
	<![endif]-->
	<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
	</script>
	<![endif]-->
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
.class1
{
 color: black;
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
	});
*/

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
    ArrayList dList = new ArrayList();
    ArrayList approvalList = new ArrayList();
    ArrayList logList = new ArrayList();
    String arrString [] = null;
    String jsString = null;
    String reference  = null;
    String reqCreatedBy = null;
    String zoneType =  ""; 
    String approveNote =  "";
    String approveNote1 =  "";
    String requestNumber = (String)request.getParameter("requestId");
    String frmstatus = (String)request.getParameter("status");

      //  requestNumber = "201511000164";
    processWasteDetailsHash.put("WORKITEMOID", requestNumber);
    processWasteDetailsHash.put("DOCUMENTOID", "DOC1001");
    ArrayList arrData = new ArrayList();
    arrData = docChangeLogController.search("ttw","fasdfar",processWasteDetailsHash);

    searchHash.put("DOCUMENTOID", "DOC1001");
    searchHash.put("REQUESTOID", requestNumber);

    approvalList = docChangeLogController.viewRequest(searchHash);

   String period ="";
   int logSize =0;
         int counter = approvalList.size();
        for (int jj=0;jj<counter;jj++){
            String itemData[] = (String[]) approvalList.get(jj);
            String requestNo =  itemData[0];
            String cityName = itemData[1];
            String docRef =  itemData[2];
            String pwmName =  itemData[3];
            String towName = itemData[4];
            String rewName = itemData[5];
            String pgwName = itemData[6];
            String apwName = itemData[7];  
            String docDate =  itemData[8];
            period =  itemData[9];
            zoneType =  itemData[10];
            String status =  itemData[11];
            String createdBy =  itemData[12] ;
            reference =  itemData[13] ;
            reqCreatedBy = itemData[14] ;
			if(jj==0)
			{
				 approveNote = itemData[15] ;
				 approveNote1 = itemData[16] ;
			}
      //      out.println( requestNo + " :  " + cityName + " :  " + docRef +" :  "  +pwmName + " :  " +towName + " :  " +rewName + " :  " +pgwName + " :  " +apwName + " :  " +docDate+ "  :  "+zoneType + " :  " +status + " :  " +createdBy + " :  " +reference);
             
            String mainString[] =  {requestNo,cityName,docRef,pwmName,towName,rewName,pgwName,apwName,docDate,period,zoneType,status,createdBy,reference};
            dList.add(mainString);     
        }      


        int rCounter = 0;
        int sCounter = 0;
        int aCounter = 0;
        int listSize = dList.size();
 //out.println("List size "+arrData.size());
       for (int ii=0; ii<arrData.size(); ii++){
            String strArr[] = (String[])arrData.get(ii);
            String str = strArr[2];
		
            if (str.contains("Support")){
                sCounter++;
            }
            if (str.contains("Approval")){
                aCounter++;
            }
        }  
		
		for (int ii=0; ii<dList.size(); ii++)
		{
			String strArr[] = (String[])dList.get(ii);
			String str = strArr[2];

			if("I".equals(strArr[11]))
			{
				rCounter++;
			}		       
        }  



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

		String strRequestNo = "";

		String input = zoneType;

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
				<i class="fa fa-th"></i>  Waste Disposal Note For The <%=zoneType%>
			</div>			
			</div>

				<div class="portlet-body">
					<form class="form-horizontal" role="form" name="viewAllWasteSalesRequest"  id="viewAllWasteSalesRequest" method ="post">
					<%@ include file="../includes/legand.jsp" %>
					<div class="demo_form">
  <%

                     if(listSize > 0) {
					
						String[] strs = reference.split("\\\\");

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
						<% if(strs.length>1){%>						
							<h5 ><span style="font-weight:bold;margin-top:0px;">Subject : </span>Sanction for Waste Disposal - <%=zText%><%//=zoneType.toLowerCase()%> - <%=strs[1]%> <h5>
						<%}else{ %>							
							<h5 ><span style="font-weight:bold;margin-top:0px;">Subject : </span>Sanction for Waste Disposal - <%=zText%><%//=zoneType.toLowerCase()%> - <%=strs[0]%> <h5>
						<%	} %>
						<p>
						Dear Sir, </p><p id="approvalNoteP" name ="approvalNoteP"><%=approveNote%></p>
						
						<input type="text" class="form-control" id="approvalNote" name = "approvalNote"  value="<%=approveNote%>" style="display:none;" placeholder="approvalNote"/>


						<!-- <input type="hidden"  name ="approvalNote" id="approvalNote"  value="<%//=approveNote%>" > 

						<input type="hidden"  name ="approvalNote1" id="approvalNote1"  value="<%//=approveNote1%>" >-->

						<div class="row ">
						<h5 class="pull-right" style="font-weight:bold;">Rs. /kg. </h5>
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
                                                    String[ ] towArray = (String[ ]) dList.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=towArray[4]%> <input type="hidden"  name ="tow<%=jj%>" id="tow<%=jj%>"  value="<%=towArray[4]%>" ></td>
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
                                                    String[ ] pgArray = (String[ ]) dList.get(jj);                                                    
                                    %>   									
									        <td class="text-right"><%=pgArray[6]%> <input type="hidden"  name="pg<%=jj%>" id="pg<%=jj%>"  value="<%=pgArray[6]%>" ></td>
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
									        <td class="text-right"><%=apArray[7]%> <input type="hidden"  name="ap<%=jj%>"  id="ap<%=jj%>"  value="<%=apArray[7]%>" ></td>
                                     <%       }   
                                              }
                                     %>		
									</tr>	
								</tbody>
							</table>
						</div>
						 <p id="approvalNote1P" name ="approvalNote1P"><%=approveNote1%></p>
							
						<input type="text" class="form-control" id="approvalNote1" name = "approvalNote1" placeholder="approvalNote" value="<%=approveNote1%>" style="display:none;" /><BR>

						
						<div class="row">
						
						<div class="col-xs-11" >
							<table id="table" class="table table-bordered"  >	
							<thead>
								<tr class="warning" >						
									<th class="text-center">Sr.No.</th>								
									<th class="text-center">Region</th>
									<th class="text-center">Reference</th>
                                    <th class="text-center">Action</th>
 <%     					
									if (rCounter>0){			
%>
                                     <th class="text-center">Remark</th>
<%
									}	
%>
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
								<td class="text-center"><a href="#" onclick="showDetails('<%=strArray[0]%>')"><%=strArray[2]%> <input type="hidden"  name="requestNo<%=i%>" id="requestNo<%=i%>"  value="<%=strArray[0]%>"><input type="hidden"  name="docReference<%=i%>" id="docReference<%=i%>"  value="<%=strArray[2]%>"></a></td>
                            <%     
									strRequestNo = strArray[0]+"','"+strRequestNo;
								 if ("A".equals(strArray[11]) || "CL".equals(strArray[11])){      %>
                                              <td class="text-center"><label class="radio-inline">
                                                <input type="radio" name="approve<%=i%>" id="approve<%=i%>" checked="checked" onclick="unCheck('review<%=i%>');" value ="A" >Approve </label>
                           <%      }else { %>
                                                <td class="text-center"><label class="radio-inline">
                                                <input type="radio" name="approve<%=i%>" id="approve<%=i%>"  onclick="unCheck('review<%=i%>');" value ="A">Approve </label>
                            <%      } 
                                      if ("R".equals(strArray[11])){    %>
                                                <label class="radio-inline">
                                                <input type="radio" name="review<%=i%>" id="review<%=i%>"  checked="checked" onclick="unCheck('approve<%=i%>');" value="R"  >Review</label></td>
                            <%      }else { %>
                                                <label class="radio-inline">
                                                <input type="radio" name="review<%=i%>" id="review<%=i%>"  onclick="unCheck('approve<%=i%>');" value="R" >Review</label></td>
                        <%      }  
												
									if (rCounter>0){			
						%>
                                <td class="text-center"><input type="text" class="form-control " id="remark<%=i%>"  name="remark<%=i%>"  placeholder="Remark"   value = ""></td>
						<%
									}	
						%>
							
							</tr>		
                            <%
                               }
                                }
                            %>
							</tbody>
							</table>
							</div>
						<div class="row">
                        <%      int sizeCount = arrData.size();
                                     if(sizeCount >0){
                            %>
						<div class="col-xs-6" >
						<table class="table table-bordered table-hover" id="tab_logic">			
							<thead>
								<tr class="warning">
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Supported by
									</th>
									
								</tr>
							</thead>
							<tbody>
                            <%  
                                    for (int ii=0; ii<sizeCount; ii++)	{
                                      String strArr[] = (String[])arrData.get(ii);
                                      String str = strArr[2];
                                        if (str.contains("Support")){
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
                                   	<input type="text" class="form-control " id="supportedBy<%=mm%>" name = "supportedBy<%=mm%>"  readonly="true" value="<%=strArr[3]%>" >  
									</td>																	
								</tr>					
								<%      } }  } }  %>	                             
							</tbody>				
						</table>						
						</div>

                        <%} else { %>
	                    <div class="col-xs-6" >
						<table class="table table-bordered table-hover" id="tab_logic">			
							<thead>
								<tr class="warning">
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Supported by
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
							<a id='delete_row' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>
						</div>
                        <%  }                            
                                  if(sizeCount >0){
                            %>
						<div class="col-xs-6" >
						<table class="table table-bordered table-hover" id="tab_logic2">			
							<thead>
								<tr class="warning">
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Approved by
									</th>									
								</tr>
							</thead>
							<tbody>
								<%  for (int ii=0; ii<arrData.size(); ii++)	{
                                      String strArr[] = (String[])arrData.get(ii);
                                      String str = strArr[2];
                                        if (str.contains("Approval")){
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
                                   	<input type="text" class="form-control " id="approvedBy<%=nn%>" name = "approvedBy<%=nn%>" readonly="true"  value="<%=strArr[3]%>" >  
									</td>																	
								</tr>					
								<%      } }  }}%>										
							</tbody>				
						</table>						
						</div>
                         <%} else { %>
<div class="col-xs-6" >
						<table class="table table-bordered table-hover" id="tab_logic2">			
							<thead>
								<tr class="warning">
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Approved by
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
							<a id='delete_row2' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row2" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>
						</div>
                               <%} %>
                          </div>	
									
					<div class="row">
						<div class="col-xs-8" >
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
				//logHash.put("STATUS", "R");
				
				logList = wasteSalesHeaderController.searchLog("ttw","fasdfar",logHash);
				logSize = logList.size();
			}
					
%> 
					<p id="log" >Approval History</p>
					</div></div>
					<div class="row" id="details"> 
					<div class="col-xs-12" >
						<table class="table table-bordered table-hover" id="">			
							<thead>
								<tr class="warning"> 
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center" >
										Reference
									</th>
									<th class="text-center" >
										Action By
									</th>
									<th class="text-center" >
										Action On
									</th>
									<th class="text-center" >
										Remarks
									</th>
									<th class="text-center" >
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
								<td class="text-center" colspan="6" >No action details to be display.</td>																	
							</tr>															
						
<%
}else{
							for (int ll=0; ll<logList.size(); ll++)	{
							  String logArr[] = (String[])logList.get(ll);
%>
							<tr>
								<td class="text-center"><%=(ll+1)%></td>																	
								<td class="text-center"><%=logArr[2]%></td>																	
								<td class="text-center"><%=logArr[5]%></td>																	
								<td class="text-center"><%=logArr[6]%></td>																	
								<td class="text-center"><%=logArr[4]%></td>																	
								<!-- <td class="text-center"><%//="-".equals(logArr[4])?"No comments": logArr[4]%></td>	 -->																
								<td class="text-center"><img src="<%=statusImg.get(logArr[7])%>" border="0"></td>																	
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
               
<%
						 if("CL".equals(frmstatus) || rCounter==0 )						
						 {

%>
						 <div class="col-xs-offset-7 col-xs-4">
							 <button type="Button" class="btn btn-primary" style="width:80px;"  onclick="javascript:history.back();">Close</button>
						 </div>
<%
						 }else
						 {
%>
						 <div class="col-xs-offset-6 col-xs-5">
							<button type="Button" class="btn btn-info " style="width:80px;" id="submitViewZonal"  onclick="submitZonalApprovals(this.id);">Submit</button>		
							<button type="Button" class="btn btn-primary" style="width:80px;"  onclick="javascript:history.back();">Close</button>
					 	</div>
<%
						 } 
%>
                    <input type="hidden"   name="counterApprovedBy" id="counterApprovedBy"  value="<%=aCounter%>">
                    <input type="hidden"  name="counterSupportedBy" id="counterSupportedBy"  value="<%=sCounter%>">
                    <input type="hidden"  name="workItemOID" id="workItemOID"  value="<%=requestNumber%>">
                    <input type="hidden"  name="reqCreatedBy" id="reqCreatedBy"  value="<%=reqCreatedBy%>">
                    <input type="hidden"  name="zoneType" id="zoneType"  value="<%=zoneType%>">
               
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
	</script>
	<script>
	$(document).ready(function(){		
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
	});
	</script>
</html>