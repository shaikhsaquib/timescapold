<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility, java.text.ParseException, java.text.SimpleDateFormat" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page errorPage="../includes/error.jsp" %>  
<jsp:useBean id="capexkeyWordController" class="com.bccl.workflows.web.controller.DocumentKeywordsController"/>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="../jscript/jquery-1.9.1.min.js"></script>
<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
<script src="../jscript/select2.min.js"></script>	
<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script src="../jscript/bootstrap-maxlength.min.js"></script>
<script src="../jscript/capex.js"></script>
<script src="../jscript/common.js"></script>
<% 
    response.setHeader("Cache-Control","no-cache"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", 0); 
	String dPath = EnvironmentProperties.getValue("capex", "uploadPath");
	
	
        Hashtable ht = new Hashtable();           
        String email_id =  (String)request.getParameter("email_id");
        String newKeyword =  Utility.replaceQuoteOracle(((String)request.getParameter("newKeyword"))== null ?"" :(String)request.getParameter("newKeyword"));  
		newKeyword = newKeyword.replaceAll("&","%26");
		String keywords =  Utility.replaceQuoteOracle((String)request.getParameter("keywords"));
		keywords = keywords.replaceAll("&","%26");
        String comment =  Utility.replaceQuoteOracle((String)request.getParameter("keyComments"));   
		comment = comment.replaceAll("&","%26");
			
        String requestId =  (String)request.getParameter("requestId");    
        String status =  (String)request.getParameter("state");  
		String projectTitle =  (String)request.getParameter("title");    		
       
		//String strData [] = data.split(",");		
		String keyWordsStr[] = null;
		String strKeySelect = "";   
		String headerData[] = null; 		
	
	
     //  out.println ( email_id + " : " + newKeyword + " :  " +requestId + " : "+ comment +" : " + keywords) ;
		Boolean result  = false;
		if("0".equals(newKeyword)){
		}else{
			/*ht.put("APPLICATION", "capex");
			ht.put("DOCUMENTOID", "DOC1005");
			ht.put("EMAILID", email_id);
			ht.put("KEYWORDS", newKeyword);
			ht.put("WORKITEMOID",requestId);
			ht.put("COMMENTS",comment); 
   		   result  = capexkeyWordController.create("","",ht);
			*/
			String data =  (String)request.getParameter("data")==null?"":(String)request.getParameter("data");  
			 data = data.substring(0,data.length()-1 );
			
			Hashtable hstable = new Hashtable(); 
			String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Location","Function", "Project Manager", "Project Duration", "Budget Amount", "Keywords", "Reason If Unbudgeted" ,"Capex1" ,"Capex2" ,"Capex3" ,"Capex4" ,"Capex5","Opex1", "Opex2","Opex3","Opex4","Opex5","Background","Rationale", "Project Scope", "Alternatives Considered", "Risks","Header List","Particulars List", "QuantityList","Estimated Cost List","Total Cost List", "Total Capex Amt", "Savings Envisaged", "Payback Period", "Reviewed By List", "Approved By List", "compAttachment","attachmentFolderName"};
		
			hstable.put("HEADERSECTION1", headerSection);
			hstable.put("DOCUMENTOID", "DOC1005");
			hstable.put("REQUESTOID", requestId);

			ArrayList headerDataList =  capexHeaderController.viewAll("sdf","sdfsd",hstable);
			int headerSize = headerDataList.size();
			if( headerSize > 0){  
				for (int eee = 0; eee < headerSize; eee++){
					headerData = (String[]) headerDataList.get(eee);
					//out.println("headerData length : "+ headerData.length);
				//	for (int eee1 = 0; eee1 < headerData.length; eee1++){                
				//		out.println (" headerData [ "+ eee1 +"] : " + headerData[eee1]);
				//	}
					
				}
			}  	
			
			
			
			String valueSection[ ] = {"capex", "R",emailId, "Review",headerData[7], headerData[8], headerData[9],headerData[10], headerData[11], headerData[12],headerData[13], headerData[14], headerData[15], headerData[16],  headerData[17], headerData[18], headerData[19],headerData[20],headerData[21],headerData[22],headerData[23],headerData[24], headerData[25],headerData[26],headerData[27],headerData[28],headerData[29],headerData[30], headerData[31], headerData[32], headerData[33],headerData[34],headerData[35], headerData[36],headerData[37],headerData[38], headerData[39], headerData[40], headerData[41], headerData[42], headerData[43] , headerData[44],"additional"};
		
			Hashtable hCtable = new Hashtable();
			hCtable.put("Application_Name", "capex");
			hCtable.put("REQUESTOID",requestId);        
			hCtable.put("HEADERSECTION1", headerSection);
			hCtable.put("HEADERSECTIONVAL1", valueSection);				
			boolean flag  = capexHeaderController.update( "sees","sdfsdf",hCtable);	
			ht.put("APPLICATIONNAME", "capex");
			ht.put("DOCUMNETOID", "DOC1005");
			//ht.put("EMAILID", email_id);
		//	ht.put("KEYWORDS", newKeyword);
		//	ht.put("WORKITEMOID",requestId);
			if(data != null){
				comment = comment+"#"+data;
			}
			
			ht.put("REMARKS",comment);
			ht.put("REQUESTOID",requestId);  
		//	ht.put("APPROVALEMAILID",emailId);  
		//	ht.put("WORKITEMRECIPIENT",emailId);  
			ht.put("attachmentFolderName","additional");
			ht.put("APPROVALEMAILID",emailId);  //ajay.parashar@timesgroup.com ,shrijeet.mishra@timesgroup.com ,mohit.jain@timesgroup.com
			ht.put("WORKITEMRECIPIENT",emailId);   //ajay.parashar@timesgroup.com ,shrijeet.mishra@timesgroup.com,mohit.jain@timesgroup.com
		
			ht.put("KEYWORD",newKeyword);  
			ht.put("STATUS",status);   //RA
			ht.put("ACTIONTXT","-");  
			if("RA".equals(status)){
				ht.put("SEARCHSTATUS","L','I','RA");  
			}else{
				ht.put("SEARCHSTATUS","L"); 
			}
			
			boolean flag12 = docChangeLogController.updateApproval("sees","sdfsdf",ht);
			
		}
		
        if(keywords.contains(",")){
			keyWordsStr = keywords.split(",");	
			for(int ii=0;ii<keyWordsStr.length;ii++){
				String keyArray = keyWordsStr[ii];
				strKeySelect+="<option value="+keyArray+">"+keyArray+"</option>"; 										
			}				
		}			
		
      // out.println(" result " + result);
		Hashtable htable = new Hashtable();
		htable.put("DOCUMENTOID", "DOC1005");
		htable.put("APPLICATION", "capex");
		htable.put("WORKITEMOID", requestId);
		ArrayList commentArray = new ArrayList();
		commentArray  = capexkeyWordController.view("","",htable);	
	%>	
  		<ul class="timeline" id="displayComments" onLoad="onLoadDetail('1','dashboard');"> 
		<div class="line text-muted"></div> 
        <li class="timeline-inverted"> 
         <div class="timeline-badge"><i class="glyphicon glyphicon-check" ></i></div> 
             <div class="timeline-panel"> 
                <div class="timeline-heading"> 
					<div class="row" style="margin-bottom:3px;" > 
					<% int commSize = commentArray.size();  %>
				<button type="button" class="btn ">Comments <span class="badge badge-warning "><%=commSize%></span></button> 
					</div> 
				</div> 
				 <div class="timeline-footer" > 
                    <div> 	
					<% if(commSize > 0){  %>		
                     <div class="panel panel-default"> 
							 
                     <div class="panel-body"> 
                         <ul class="chat"> 
						<%	for (int yy=0;yy<commSize;yy++){
								String commentStrArray [] =(String[]) commentArray.get(yy); 
                    //            out.println(" commentStrArray[5]-----"+ commentStrArray[5]);
								String userEmail[] = commentStrArray[5].split("@");
								String createdOn1 = commentStrArray[6];
								String commentsHere = commentStrArray[4];
								commentsHere = commentsHere.replaceAll("%26","&");							
							
								SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
								SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
								try {
										Date date = (Date) format.parseObject(createdOn1);
										createdOn1 = format2.format(date);										
								} catch (ParseException e) { 
									e.printStackTrace();
									}
						%>
							 <li class="left clearfix"> 
							 <span class="chat-img pull-left"> 
                                 <img src="../images/user_2.png" alt="User Avatar" class="img-circle"> 
                             </span> 
                             <div class="chat-body clearfix"> 
                                       <div class="header"> 
									   <% 
									   String attachmentSize[] = null;
									   String fileComment = null;
									   String fileName = null;
									   
									   if(commentsHere.contains("#")){
											attachmentSize = commentsHere.split("#");
											fileComment = attachmentSize[0] == null ? "-" : attachmentSize[0];
											fileName = attachmentSize[1] == null ? "-" : attachmentSize[1];
										 %>	
										<strong class="primary-font"><%=userEmail[0]%></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small class="pull-center text-muted">                       

										<a href="#"  onclick="javascript:showAttachFile('1','dashboard','additional','<%=requestId%>','<%=commentStrArray[5]%>'); ">attachments</a>
										</small><small class="pull-right text-muted"><span class="badge badge-primary ">Comment for : <%=commentStrArray[3]%></span></small><hr> 
                                        </div> 									   
                                        <p><%=fileComment%>                                           
                                        </p> 
										<%	}else{ %>
									  
										<strong class="primary-font"><%=userEmail[0]%></strong><small class="pull-right text-muted"><span class="badge badge-primary ">Comment for : <%=commentStrArray[3]%></span></small><hr> 
                                        </div> 									   
                                        <p><%=commentsHere%>                                           
                                        </p> 
										<% }%>                                           
									   <div class="footer1"> 
									   <div class="row"> 
                                           <div class="col-xs-6 pull-right"><small class="pull-right text-muted">Commented On : <%=createdOn1%></small>  
                                       </div> 
									   </div> 
                                   </div> 
							</div>
                             </li> 
							<%	 }		%>							
                         </ul> 
						 </div>
					<% }else { %>
						<div class="panel panel-default"> 
							 
						<div class="panel-body1"> 
                         <ul class="chat"> 
						 <li class="left clearfix"> 
							 
                             <div class="chat-body clearfix">                                       									   
										                                        
								 <label class="col-xs-7 control-label text-muted text-align:right">No Comments</label> 
							</div>
                             </li> 														
                         </ul> 
						 </div>	
						
						
				<%	} %>
						 <div class="panel-footer">                     					   
						   <div class="form-group" id ="LoadRecomm"> 
							 <label class="col-xs-2 control-label width:25px;">Additional Reviewer</label> 							
							  <div class="col-xs-9"> 
							   <input type="text" placeholder="Search" class="form-control width:4px;" name="recommendedBy" id="recommendedBy" onfocus="onLoadDetail('1','dashboard');" onkeyup="lookup(this.value);" style="font-size:12px;" >
								<div class="suggestionsBox" id="suggestions" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="autoSuggestionsList" style="padding-left:2px;text-align:left;">
									</div>
								</div>	 
							  </div> 
							 <div class="col-xs-2 pull-right" style="margin-top:5px;"> 
							 <span class="input-group-btn"> 
                                <button class="btn btn-warning btn-sm" id="btn-chat"  onClick ="saveRecommendation();">Send</button>
							 </span>						   
						   	 </div> 
							 </div>							
                       </div> 
                     </div> 
                    </div> 
                   </div> 
                 </div> 
			 </div> 
             </li> 
           </ul> 


  


