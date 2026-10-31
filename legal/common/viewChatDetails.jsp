<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="docKeyWordController" class="com.bccl.workflows.web.controller.DocumentKeywordsController"/>

<%
	
	//String requestoid			= (String)request.getParameter("requestoid");
	String requestoid			= (String)session.getAttribute("requestId");
	String userEmailId1			= (String)session.getAttribute("userEmailId");
	String id					= (String)request.getParameter("id");

	userEmailId1 = userEmailId1.trim();
//	String emailId1 = emailId.trim();

	String msg = "";
	String keyWord = "-";
	String actionText = "-";
	Hashtable  insertHash = new Hashtable();
	Hashtable  detailHash = new Hashtable();
	ArrayList detailsList1		= new ArrayList();

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");

	/*System.out.println("id----"+id);
	if("1".equals(id))
	{
		System.out.println("hi");

		boolean insertFlag = false;

		msg					= (String)request.getParameter("msg");
		insertHash.put("COMMENTS", msg);
		insertHash.put("DOCUMENTOID", "DOC1006");			
		insertHash.put("WORKITEMOID", requestoid);			
		insertHash.put("EMAILID", emailId);			
		insertHash.put("KEYWORDS", keyWord);			
		insertHash.put("ACTIONTEXT", actionText);			
		insertHash.put("STATUS", "A");			
		insertHash.put("APPLICATION_NAME", "legalContractManagement");	
		insertHash.put("APPLICATION", "legalContractManagement");	
		 
		insertFlag = docKeyWordController.create("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",insertHash);
		System.out.println("insertFlag----"+insertFlag);

	}

	if("0".equals(id))
	{*/

		detailHash.put("DOCUMENTOID", "DOC1006");
		detailHash.put("WORKITEMOID", requestoid); 
		detailHash.put("STATUS", "A");
		detailHash.put("APPLICATION", "legalContractManagement");		
		detailsList1 = docKeyWordController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailHash);
	/*}else
	{
		out.println("no comments");
	}*/


	for (int ii=0; ii<detailsList1.size(); ii++) 
	{
		String strArr[] = (String[])detailsList1.get(ii);	
		String comments ="";
		String createdBy ="";
		String createdOn ="";
		comments = strArr[4].replaceAll("alert", "");
		createdBy = strArr[5];
		createdBy	= createdBy.substring(0,createdBy.indexOf("@")).replace(".", " ");

		try 
		{
			Date date = (Date) format.parseObject(strArr[6]);
			createdOn = format2.format(date);	
										
		} catch (ParseException e) { 
			e.printStackTrace();
		}		

		if(strArr[5].equals(userEmailId1))
		{
%>
			 <li class="mar-btm">
				<div class="media-left">
					<img src="../images/user_2.png" class="img-circle img-sm" alt="Profile Picture">
				</div>
				<div class="media-body pad-hor">
					<div class="speech" style="height:auto;">
						<span class="media-heading" style="height: 20px;"><b><font style="text-transform: capitalize;"><%=createdBy%></font></b></span>
						<span style="height: 2px;"><%=comments%></span><br>
						<span class="speech-time"><i class="fa fa-clock-o fa-fw"></i><%=createdOn%></span>
					</div>
				</div>
			</li>


<%		}else
		{
%>
			 <li class="mar-btm">
				<div class="media-right">
					<img src="../images/user_2.png" class="img-circle img-sm" alt="Profile Picture">
				</div>
				<div class="media-body pad-hor speech-right">
					<div class="speech" style="height:80px;">
						<span class="media-heading" style="height: 20px;"><b><font style="text-transform: capitalize;"><%=createdBy%></font></b></span>
						<span style="height: 2px;"><%=comments%></span><br>
						<span class="speech-time"><i class="fa fa-clock-o fa-fw"></i><%=createdOn%></span>
					</div>
				</div>
			</li>



<%
		}
		

%>
	<!-- <li class="left clearfix">
		<span class="chat-img pull-left">
			<img src="../images/user_2.png" alt="User Avatar" class="img-circle">
		</span>
		<div class="chat-body clearfix">
			<div class="header">
				<strong class="primary-font"><%//=createdBy%></strong> <span class="text-muted pull-right ">Commented On :  <%//=createdOn%></span> <!--  <small class=" text-muted" style="margin-top:4px;margin-left:6px;">
								<i class="fa fa-calendar"></i>   15/10/2015</small><small class="pull-right text-muted">
					   Comment for:  Doc. Name</small> --><!-- <hr>
			</div>
			<p style="word-break: break-all;">
				<%//=comments%>
			</p>
			<div class="footer1">
				<div class="row">
					<div class="col-xs-8 pull-right"> 
					</div>
				</div>
			</div>
		</div>
	</li> -->



<%
	}
%>

