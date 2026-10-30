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
<jsp:useBean id="capexDeatilsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
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
	//String dPath = EnvironmentProperties.getValue("capex", "uploadPath");	
	
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
	String mode =  (String)request.getParameter("mode");    
 
	
//	out.println(" mode :"+mode);
   
	//String strData [] = data.split(",");		
	String keyWordsStr[] = null;
	String strKeySelect = "";   
	String headerData[] = null; 		
	String actionPro = "";
	
     //  out.println ( email_id + " : " + newKeyword + " :  " +requestId + " : "+ comment +" : " + keywords) ;
		Boolean result  = false;
		if("0".equals(newKeyword)){
			
		}else{			
						
			ht.put("APPLICATIONNAME", "capex");
			ht.put("DOCUMNETOID", "DOC1005");
				
			ht.put("REMARKS",comment);
			ht.put("REQUESTOID",requestId); 	
			ht.put("attachmentFolderName","additional");
			ht.put("APPROVALEMAILID",emailId);  
			ht.put("WORKITEMRECIPIENT",emailId);   		
			ht.put("KEYWORD",newKeyword);  
		//	ht.put("STATUS",status);   //RA
			ht.put("ACTIONTXT","-");  
			if("RA".equals(status)){
				ht.put("SEARCHSTATUS","L','I','RA");  
				ht.put("STATUS","RA");
			}else{
				 actionPro =  (String)request.getParameter("actionPro");   
			//	out.println(" actionPro = "+ actionPro);
				
				Hashtable htHeader = new Hashtable(); 
				Hashtable htDetails = new Hashtable(); 

				htHeader.put("APPLICATION_NAME", "capex");		
				htHeader.put("CREATEDBY", emailId); 	
				htHeader.put("REQUESTOID", requestId); 	

				htDetails.put("APPLICATION_NAME", "capex");	
				htDetails.put("CREATEDBY", emailId); 	
				htDetails.put("REQUESTOID", requestId); 
				
				if("Accept".equals(actionPro)){
					htHeader.put("ACTIONSTATE", "Approved");
					htHeader.put("STATUS", "A"); 		
					htDetails.put("STATUS", "A"); 
					ht.put("SEARCHSTATUS","L"); 
					ht.put("STATUS","A");
				}		
				if("Reject".equals(actionPro)){
					htHeader.put("ACTIONSTATE", "Rejected");
					htHeader.put("STATUS", "RJ"); 		
					htDetails.put("STATUS", "RJ"); 
					ht.put("SEARCHSTATUS","L");
					ht.put("STATUS","RJ");
				}					
					boolean headerResult = capexHeaderController.updateAction(" "," ",htHeader);
					boolean detailsResult = capexDeatilsController.updateAction(" "," ",htDetails);
					
				}
					
			}			
			boolean flag12 = docChangeLogController.updateApproval("sees","sdfsdf",ht);		
			
			if(flag12 == true && "A".equals(status)){
				ht.clear();
				ht.put("DOCUMENTOID", "DOC1005");
				ht.put("APPLICATION_NAME", "capex");
				ht.put("WORKITEMOID", requestId);
				ht.put("EMAILID", emailId);
				ht.put("ACTIONTEXT", "approvedBy");
				
				ArrayList emailList = docChangeLogController.findEmailId(ht);
				/*
				if(emailList.size()>0){
					for(int zz=0;zz<emailList.size();zz++){
						String emailArr[] = (String[])emailList.get(zz);					
						
				ArrayList  lstArray= new ArrayList();		
			
				lstArray  = docChangeLogController.getEmailid(emailArr[3]);
				String strArr[] = (String[])lstArray.get(0);
				
				String str = "Dear "+strArr[0]+", <br><br>"
						   + "<br> The following capex request is pending for your approval. Please accept or reject this request on Timescape.<BR><BR>"
						   + "Request Id : "+requestId+"<br>"
						   + "Project Title	   : "+projectTitle+" <br>"
						   + "Created By	   : "+emailId+" <br><BR>"
						   + "Alternatively you can also click on the following link:<BR> <br><br>"
						   + "<p>Regards,</p><p> Timescape Admin</p>";

				String subject= "Capex note pending for approval";

				String htmlstr = "<html>" + "\n" 
							+ "<head>" + "\n" 
							+ "	<title>Email Alert</title>" + "\n" 
							+ "	<style>" + "\n" 
							+ "		.bold {FONT-WEIGHT: bold; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
							+ "		.normal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
							+ "		.bluenormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #6097cf; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
							+ "		.rednormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #ff0000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
							+ "	</style>"
							+ "</head>" 
							+ "<body>" 
							+ "	<form name = \"frmMessage\" method = \"post\">" 
							+ "     <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
							+ "			<tr>" 
							+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://wsqa.timesgroup.com/timescape/sapep/collaboration/workflow/capex/images/capexheader.jpg\" border = \"0\"></td>" 
							+ "		    </tr>" 
							+ "		</table> "
							+ "		<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
							+ "			<tr>" 
							+ "				<td width = \"100%\" class = \"normal\" align = \"left\">" 
							+ "					<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
							+ "						<tr>" 
							+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"20\">&nbsp;</td>" 
							+ "						</tr>" 
							+ "						<tr>" 
							+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\">&nbsp;</td>" 
							+ "							<td colspan = \"3\" align = \"left\" class = \"normal\">" 
							+ "								<div align = \"left\">"+str+"</div>" 
							+ "							</td>" 
							+ "						</tr>" 
							+ "						<tr>" 
							+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\"></td>" 
							+ "						</tr>" 
							+ "					</table> "					
							+ "				</td>" 
							+ "			</tr><br>" 
							+ "		</table>"
							+ "</form></body>" 
							+ "</html>";


				Hashtable mailDetailsHash = new Hashtable();
				mailDetailsHash.put("CREATEDBYEMAILID", emailId);		
				mailDetailsHash.put("MAILTO", "rishiraj.shukla@timesgroup.com");
				mailDetailsHash.put("MAILSTATUS", "I");
				mailDetailsHash.put("REQUESTID", result);
				mailDetailsHash.put("SUBJECT", subject);
				mailDetailsHash.put("MESSAGE", htmlstr);
				boolean mailFlag  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);
						
					}
					
				}
				*/
			}
	//	}
		
        if(keywords.contains(",")){
			keyWordsStr = keywords.split(",");	
			for(int ii=0;ii<keyWordsStr.length;ii++){
				String keyArray = keyWordsStr[ii];
				strKeySelect+="<option value="+keyArray+">"+keyArray+"</option>"; 										
			}				
		}else{
			strKeySelect+="<option value="+keywords+">"+keywords+"</option>"; 	
		}			
		
      // out.println(" result " + result);
		Hashtable htable = new Hashtable();
		htable.put("DOCUMENTOID", "DOC1005");
		htable.put("APPLICATION", "capex");
		htable.put("WORKITEMOID", requestId);
		ArrayList commentArray = new ArrayList();
		commentArray  = capexkeyWordController.view("","",htable);	
	%>
			<ul class="timeline" id="displayComments" > 
		<div class="line text-muted"></div> 
        <li class="timeline-inverted"> 
         <div class="timeline-badge"><i class="glyphicon glyphicon-check" ></i></div> 
             <div class="timeline-panel"> 
                <div class="timeline-heading"> 
					<div class="row" style="margin-bottom:3px;" > 
					<% int commSize = commentArray.size();  %>
				<button type="button" class="btn">Comments <span class="badge badge-warning "><%=commSize%></span></button> 
					</div> 
				</div> 
				 <div class="timeline-footer" > 
                    <div> 
					<%  if(commSize > 0){  %>
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
										//	out.println( " attachmentSize[0] : "+attachmentSize[0] );
											fileComment = (attachmentSize[0] == null) || (attachmentSize[0] == "") ? "-" : attachmentSize[0];
											fileName = ((attachmentSize[1] == null ) || ("".equals(attachmentSize[1]))) ? "-" : attachmentSize[1];
										 %>	
										<strong class="primary-font"><%=userEmail[0]%></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small class="pull-center text-muted">                             

										<a href="#"  onclick="javascript:showAttachFile('1','dashboard','additional','<%=requestId%>','<%=commentStrArray[5]%>'); ">attachments</a>
										</small><small class="pull-right text-muted">Comment for : <%=commentStrArray[3]%></small><hr> 
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
						<% }else{ %>						
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
						 </div>	
						<%} %>
						 <div class="panel-footer"> 
							 <div class="form-group"> 
								 <label class="col-xs-3 control-label">Keywords  </label> 								
								 <div class="col-xs-9"> 
									 <select class="form-control" name="keyword" id ="keyword" > 										
									 <%=strKeySelect%>
									 </select> 
								 </div> 
							 </div> 
							 <% if ("R".equals(mode)){  %>
                           <div class="form-group" > 
						   <label class="col-xs-3 control-label">Comment here </label> 								
								 <div class="col-xs-9"> 
									 <textarea class="form-control" rows="3" style="" maxlength="500" name="keyComments" placeholder="Type your comment here..." id="keyComments"></textarea> 
								 </div>	
								<div class="col-xs-2 pull-right" style="margin-top:5px;"> 
                               <span class="input-group-btn">                                   
								  <input type="button"  class="btn btn-warning"  value="Send" name="submitButton" id="Send" height="20" onclick = "javascript:saveComments('1');"/>
								</span> 
							 </div>	
                           </div> 					   
							 <% }else{   
									if("".equals(actionPro)){
										
											 %>
							 <div class="form-group" id="myComments"> 
								<label class="col-xs-3 control-label">Comment here </label> 								
								 <div class="col-xs-9"> 
									 <textarea class="form-control" rows="3" style="" maxlength="500" name="keyComments" placeholder="Type your comment here..." id="keyComments"></textarea> 
								 </div>	
								<div class="col-xs-4 pull-right" style="margin-top:5px;">                                
							  <span class="input-group-btn"> 
								  <input type="button"  class="btn btn-primary"  value="Approve" name="submitButton" id="Approve" height="20" onclick = "javascript:finalStatus('1','Accept');"/>
							 </span> 
							 <span class="input-group-btn">                                   
								  <input type="button"  class="btn btn-danger"  value="Reject" name="submitButton" id="Reject" height="20" onclick = "javascript:finalStatus('1','Reject');"/>
							  </span>
							 </div>	
                           </div> 		
							 <% }   }%> 
                       </div> 
                     </div> 
                    </div> 
                   </div> 
                 </div> 
			 </div> 
             </li> 
           </ul> 

  
  


