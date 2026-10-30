<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="../../includes/sessionCheck.jsp"%>
<%@ include file="../../includes/idCategory.jsp"%>

<%//@ page errorPage="../../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" > -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>PURCHASE APPROVAL</title>
<link href="/timescape/sapep/employeeselfservice/priceapproval/OSP/css/global.css" rel="stylesheet" type="text/css" />
<script src="/timescape/sapep/employeeselfservice/priceapproval/OSP/jscripts/jquery.js"language="javascript"></script>
<script src="/timescape/sapep/employeeselfservice/priceapproval/jscripts/osp.js"language="javascript"></script>

<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
    text-align:justify;
}


.travelMenuBG {
	FONT-SIZE: 8 pt;
	
}


/* Tool tip css */
.ToolText{position:relative; }
.ToolTextHover{position:relative;z-index:1;}
.ToolText span#test{display: none;}

.ToolTextHover span#test{
  display:block;
  position:absolute;
  border:1px solid black;
  /* top:1.3em;*/
  right:0;
  bottom:50px;
  background-color:#333333; color:white;
  font-size:8pt;
  font-family:Verdana, Arial, Helvetica, sans-serif;
  text-align: justify;
  width:300px;


  /* css ends here */
}
</style>

<script> 
    function hideImage() { 
        if (document.getElementById) { 

            document.getElementById('hidetr1').style.display      = 'none'; 
            document.getElementById('hidetr2').style.display      = 'none'; 
            document.getElementById('hidetr3').style.display      = 'none'; 
        } 
    }
    function showImage() { 
        if (document.getElementById) { 

             document.location.reload();
        } 
    } 
    function backPage()
    {
        document.location.href = "../../indexOsp.jsp";
    }
</script>

<script> 
	$(document).ready(function(){
//window.setTimeout( function() {
 //   $("textarea").height( $("textarea")[0].scrollHeight );
//}, 1);
$("textarea").each( function( i, el ) {
    $(el).height( el.scrollHeight );
});
});
</script>

</head>
<body>

<%@ include file="../includes/setApprStatusOsp.jsp"%>

<center>
<body onload="showFixedAttachmentFile('1','<%=priceid%>','<%=userEmailid%>','<%=STATUS%>','<%=compAttachmentName%>','<%=addAttachmentName%>')">
<form name="priceApprovalMain" method="post" action="">
<table width="992px"  border="1" bordercolor="#f0f0f0"cellpadding="2" cellspacing="0">
  
 <tr name="hidetr3" id="hidetr3"><td colspan="3" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="back" type="button" class="style4" id="back" value="Back" onclick="javascript:backPage();"/></td><td height="10" align="right" colspan="6" class="redbold"><input name="printbutton" type="button" class="style4" id="printbutton" value="Print" onclick="javascript:hideImage();window.print();showImage();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
 
	</tr>

	  <tr  name="hidetr1" id="hidetr1"><td height="10" class="boldsmall" align="right" colspan="9" ><%if(!AP31.equals("0") && APPROVER31_STATUS.equals("L") ){%><a  name="edithide" id="edithide" class="normal" href="../indexUpdateDraftOsp.jsp?tOId=<%=tOId%>&priceid=<%=priceid%>&flag=E"><b><!-- Edit --> </b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <%}if(STATUS.equals("C")){%><b>STATUS: Cancelled</b><%} else if(appStatus.equals("L") && !STATUS.equals("CL")){%><a  name="approvehide" id="approvehide" class="normal"onClick="openRemarksOsp('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'A','<%=COMPANY%>')" href="javascript:void(0)"><b>Approve</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a name="reviewhide" id="reviewhide" class="normal" onClick="openRemarksOsp('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'H','<%=COMPANY%>')" href="javascript:void(0)"><b>Review</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<%
if(COMPANY.equals("1000") && Approver.equals("AP4"))
{%><a class="normal" onClick="remarkspopOsp('<%=priceid%>',<%=tOId%>,'<%=Approver%>')" href="javascript:void(0)"><b>Specific Review</b></a><%}else if(!COMPANY.equals("1000") && Approver.equals("AP5")){%><a class="normal" onClick="remarkspopOsp('<%=priceid%>',<%=tOId%>,'<%=Approver%>')" href="javascript:void(0)"><b>Specific Review</b></a><%}

%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%}else{if(STATUS.equals("CL")){%><b>STATUS: Approved</b><%}else if(STATUS.equals("C")){%><b>STATUS: Cancelled</b><%}else if(STATUS.equals("URE")){%><b>STATUS: Review</b><%}}%>&nbsp;&nbsp;</td></tr>
	
<%          
        Hashtable adminHash = new Hashtable();

		ArrayList adminList	=  new ArrayList();
	    String adData[]       = null;
        int adminId     = 0;
        int kk          =0;
        boolean checkAdmin = false;
		adminList 			=	priceApprovalWebController.getAdminData(adminHash);
          if(adminList.size()>0)
           {
            for(kk = 0; kk<adminList.size(); kk++)
                {
                    adData   = (String[])adminList.get(kk);
          adminId   = Integer.parseInt(adData[0]);

            if(timescapeUserOId==adminId)
                {
                    checkAdmin=true;
                }
             }
}
%>
<%
if(STATUS.equals("L") || STATUS.equals("UC")){
if(APPROVER34_STATUS.equals("L")){

if(checkAdmin){
%>
  <!-- <tr name="hidetr2" id="hidetr2"><td height="10" class="boldsmall" align="right" colspan="9" ><a name="delegatehide" id="delegatehide" class="normal" onClick="delegateAdminPage('<%//=priceid%>',<%//=tOId%>)" href="javascript:void(0)"><b>Delegate</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr> -->
<%
        }
    }
}%>
  <tr name="hidetr2" id="hidetr2"><td height="10" class="boldsmall" align="right" colspan="9" ></td></tr>

<%@ include file="../includes/requestDetailsOsp.jsp"%>

</form>
</center>
</body>
</html>