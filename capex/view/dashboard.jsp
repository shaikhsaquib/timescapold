<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility ,java.text.ParseException, java.text.SimpleDateFormat"%>
<%@ page errorPage="../includes/error.jsp" %>  
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="capexkeyWordController" class="com.bccl.workflows.web.controller.DocumentKeywordsController"/>
<jsp:useBean id="capexDeatilsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> View </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/capex.css" rel="stylesheet"/>		
	<link href="../css/select2.min.css" rel="stylesheet">
	<style>	
	.panel-body1{
	    overflow-y: scroll;
		height: 50px;
}
	</style>
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../jscript/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../jscript/select2.min.js"></script>	
	<script src="../jscript/bootstrap-maxlength.min.js"></script>
	<script src="../jscript/capex.js"></script>
	<script src="../jscript/common.js"></script>

	<script>
	$(document).ready(function() {

	$('body').on('focus',".datepicker", function(){
			$(this).datepicker({ dateFormat: 'dd-mm-yy' });	
	});
	$('body').on('focus',"#textarea", function(){
			$(this).maxlength({alwaysShow: true});		
	});	
	$(".multi").select2({ width: '100%'  });
    function toggleNavbarMethod() {
        if ($(window).width() > 768) {
            $('.navbar .dropdown').on('mouseover', function(){
                $('.dropdown-toggle', this).trigger('click'); 
            }).on('mouseout', function(){
                $('.dropdown-toggle', this).trigger('click').blur();
            });
        }
        else {
            $('.navbar .dropdown').off('mouseover').off('mouseout');
        }
    }
    toggleNavbarMethod();
    $(window).resize(toggleNavbarMethod);
	$('body').on('focus',".datepicker1", function(){
			$(this).datepicker({ dateFormat: 'dd/mm/yy',changeMonth: true,
      changeYear: true });	
	});	
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
});
	</script>	
</head>
<%	
	String locStr = null;
	String deptStr = null;
	String emailStr = null;
	String drStr = null;
	String createdBy = null;
	String createdOn = null;
	String headerData[] = null; 
	String proposalNo = null;
	String requestId = (String)  request.getParameter("id");
    String status = (String)  request.getParameter("status");
    String mode = (String)  request.getParameter("mode");

	//out.println(requestId + " : " +status);
    Hashtable ht = new Hashtable();
    String activeFlag ="";
    String disabledFlag ="";
	String keywords = 	"";
	//out.println(" emailId :"+ emailId);
//	emailId ="rishiraj.shukla@timesgroup.com";
	//status = "R";
	String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Location","Function", "Project Manager", "Project Duration", "Budget Amount", "Keywords", "Reason If Unbudgeted" ,"Capex1" ,"Capex2" ,"Capex3" ,"Capex4" ,"Capex5","Opex1", "Opex2","Opex3","Opex4","Opex5","Background","Rationale", "Project Scope", "Alternatives Considered", "Risks","Header List","Particulars List", "QuantityList","Estimated Cost List","Total Cost List", "Total Capex Amt", "Savings Envisaged", "Payback Period", "Reviewed By List", "Approved By List", "compAttachment","attachmentFolderName"};
	
    ht.put("DETAILSECTION1", headerSection);
    ht.put("DOCUMENTOID", "DOC1005");
    ht.put("REQUESTOID", requestId);
    
    ArrayList headerDataList =  capexDeatilsController.view("sdf","sdfsd",ht);
    
    int headerSize = headerDataList.size();
     
//	out.println(" headerSize :"+ headerSize);
	if( headerSize > 0){  
        for (int eee = 0; eee < headerSize; eee++) {
           headerData = (String[]) headerDataList.get(eee);      
           
            for (int eee1 = 0; eee1 < headerData.length; eee1++) {
                createdBy = headerData[4];
				 keywords = headerData[16] ;
				 createdOn = headerData[46] ;
				//out.println (" headerData [ "+ eee1 +"] : " + headerData[eee1]);
            }
        }
    }
	//for(int eee11 = 0; eee11 < headerData.length; eee11++){               
   //   out.println(" headerData ["+eee11+"]-"+headerData[eee11]);
   //   }
	  
			
	Hashtable htable = new Hashtable();
	htable.put("DOCUMENTOID", "DOC1005");
	htable.put("APPLICATION", "capex");
    htable.put("WORKITEMOID", requestId);
	ArrayList commentArray = new ArrayList();
	commentArray  = capexkeyWordController.view("","",htable);

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
	try {
		Date date = (Date) format.parseObject(createdOn);
		createdOn = format2.format(date);										
	} catch (ParseException e) { 
	e.printStackTrace();
	}
	
	
	
	
%>
<body onLoad="saveComments('0');"> 
<%@ include file="../includes/relatedLinksnew.jsp" %>
<hr>
<form  class="form-horizontal" role="form" name="dashboard">
<div class="container-fluid">
	<div class="row">
	
	<div class="col-xs-12 bs-example ">
	<div class="row">
	<div class="col-xs-12">
	<h4 class="form-section ">Capex/Opex Authorization
	<div class="pull-right ">		
		 <button type="Button" name= "Close"class="btn btn-info" onClick = "javascript:history.back();">Close</button>
	</div></h4>		
	</div>	
		<a href="#" class=" col-xs-5  text-center" style="margin-bottom:5px;">
		<button type="button" class="btn btn-primary" onclick="window.open('viewCapexNote.jsp?id=<%=requestId%>', '', '');"><i class="fa fa-eye"></i>&nbsp;View Application</button>
		</a>
	<div class="row">
	
	</div>
	<div class="col-xs-5" >
		<div class="list-group">
			<a href="#" class="list-group-item text-center" >
			<h4><%=headerData[6]%></h4></a>
			<a href="#" class="list-group-item list-group-item-danger text-center">
			Submitted On : <%=createdOn%></a>
			<a href="#" class="list-group-item list-group-item-info text-center">
			Submitted By : <%=headerData[45]%>
			</a>
		
	</div>
	
	 <table class="table table-bordered" style="">
        
        <tbody>
			<tr>
			<td colspan="2">
			<h4 class="form-section text-center"><i class="fa fa-info-circle"></i> Capex Request No. <%=headerData[1]%></h4></td>
			</tr>
            <tr class="info">
                <td style = "text-align:right;width:140px;">Project Name:</td>
                <td style = "text-align:left;"><%=headerData[6]%></td>
              
            </tr>
            <tr class="info">
                <td style = "text-align:right;width:140px;">Created On:</td>
                <td style = "text-align:left;"><%=createdOn%></td>
               
            </tr>
			<tr class="info">
                <td style = "text-align:right;width:160px;">Proposal Amount:<small class="pull-right text-danger" style="margin-top:4px;margin-left:3px;">(Rs. in lakhs)</small></td>
                <td style = "text-align:left;"><%=headerData[9]%></td>
              
            </tr>
            <tr class="info">
                <td style = "text-align:right;width:140px;">Budget Amount:<small class="pull-right text-danger" style="margin-top:4px;margin-left:3px;">(Rs. in lakhs)</small></td>
                <td style = "text-align:left;"><%=headerData[15]%></td>
               
            </tr>
            
			<tr class="info">
                <td style = "text-align:right;width:140px;">Project Manger:</td>
                <td style = "text-align:left;"><%=headerData[13]%></td>
               
            </tr>
            
			<tr class="info">
                <td style = "text-align:right;width:140px;">Category:</td>
                <td style = "text-align:left;"><%=headerData[8]%></td>
            </tr>
			
			<tr class="warning" >
			<td colspan="2">Rationale<hr>
			<p><%=headerData[29]%></p>
			</td>
			</tr>
			<!--div class="form-group"> 
			 <label class="col-xs-3 control-label">Attachments</label> 								
			 <div class="col-xs-9"> 
				Click on image to attach file <a href="javascript:attachmentFile('additional','0','dashboard');" ><img src="../images/attachment.png" border="0" /></a>  
			 </div> 
			 <div id="attachment1">
			 </div>
			</div--> 
			
        </tbody>
    </table>
		
	</div>

		
    <ul class="timeline" id="displayComments" onLoad="onLoadDetail('0','dashboard');">
	</ul>
	<ul>
		
	</ul>
	</div>
	</div>
	<input type="hidden"  name="email_Id" id="email_id"  value="<%=emailId%>">
	<input type="hidden"  name="requestId" id="requestId"  value="<%=requestId%>">
	<input type="hidden"  name="keywords" id="keywords"  value="<%=keywords%>">
	<input type="hidden"  name="status" id="status"  value="<%=status%>">
	<input type="hidden"  name="projectTitle" id="projectTitle"  value="<%=headerData[6]%>">
	<input type="hidden"  name="mode" id="mode"  value="<%=mode%>">
	<div class="col-xs-1"></div>
	
		
</div>
	
</form>	
</body>
</html>
