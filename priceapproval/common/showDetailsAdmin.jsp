<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ include file="../includes/idCategory.jsp"%>

<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" > -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<script src="../jscripts/jquery.js"language="javascript"></script>

<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.normal {
	FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 9pt; FONT-WEIGHT: normal; TEXT-DECORATION: none
}

.nav {
	TEXT-TRANSFORM: none; FONT-VARIANT: normal; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 11px; FONT-WEIGHT: bold; TEXT-DECORATION: none
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
	<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<link href="../style/calendarControl.css" rel="stylesheet">

<script> 
    function hideImage() { 
        if (document.getElementById) { 
            //document.getElementById('printbutton').style.visibility     = 'none'; 
           // document.getElementById('back').style.visibility            = 'none'; 
            //document.getElementById('delegatehide').style.visibility    = 'hidden'; 
            //document.getElementById('edithide').style.visibility        = 'hidden'; 
            //document.getElementById('reviewhide').style.visibility      = 'hidden'; 
            //document.getElementById('approvehide').style.visibility     = 'hidden'; 
            document.getElementById('hidetr1').style.display      = 'none'; 
            document.getElementById('hidetr2').style.display      = 'none'; 
            document.getElementById('hidetr3').style.display      = 'none'; 
        } 
    }
    function showImage() { 
        if (document.getElementById) { 
            //document.getElementById('printbutton').style.visibility     = 'visible'; 
            //document.getElementById('back').style.visibility            = 'visible'; 
            //document.getElementById('delegatehide').style.visibility    = 'visible'; 
            //document.getElementById('edithide').style.visibility        = 'visible'; 
           // document.getElementById('reviewhide').style.visibility      = 'visible'; 
           // document.getElementById('approvehide').style.visibility     = 'visible'; 
          // document.getElementById('hidetr1').style.visibility     = 'show'; 
           //document.getElementById('hidetr2').style.visibility     = 'show'; 
           //document.getElementById('hidetr3').style.visibility     = 'show'; 
document.location.reload();
        } 
    } 
    function backPage()
    {
        document.location.href = "../index.jsp";
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
<%
	String priceId = (String)request.getParameter("priceid");
	//out.println("priceId---"+priceId);
%>
<body onload="onLoadDetail('1','priceApprovalMain','<%=priceId%>');">

<%@ include file="../includes/setApprStatus.jsp"%>

<center>
<form name="priceApprovalMain" method="post" action="">
<table width="795px" height="493" border="1" bordercolor="#f0f0f0"cellpadding="2" cellspacing="0">
<!--  <tr><td height="10" colspan="7"></td></tr> -->
 <tr name="hidetr3" id="hidetr3"><td colspan="3" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="back" type="button" class="style4" id="back" value="Back" onclick="javascript:backPage();"/></td><td height="10" align="right" colspan="6" class="redbold"><input name="printbutton" type="button" class="style4" id="printbutton" value="Print" onclick="javascript:hideImage();window.print();showImage();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
  <!-- <tr><td height="5" colspan="8"></td></tr>
  <tr> -->
	<!-- <td colspan="8" align="right" class="travelMenuBG"> STATUS : <%//if(STATUS.equals("L")){%>In Process<%//}else if(STATUS.equals("A")){%>Approved<%//}else if(STATUS.equals("R")){%>Rejected<%//}%>&nbsp;&nbsp;&nbsp;&nbsp;
    </td> -->
	</tr>
<%	System.out.println("-----"+Approver);%>
	  <tr  name="hidetr1" id="hidetr1"><td height="10" class="boldsmall" align="right" colspan="9" ><%if(true/*pageType!=null*/){if(true/*pageType.equals("YES")*/){if(!AP31.equals("0") && APPROVER31_STATUS.equals("L") ){%><a  name="edithide" id="edithide" class="normal" onClick="bncEdit('<%=tOId%>','<%=priceid%>')"  href="javascript:void(0)"><b>Edit</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <%}if(STATUS.equals("C")){%><b>STATUS: Cancelled</b><%} else if(appStatus.equals("L") && !STATUS.equals("CL")){%><a  name="approvehide" id="approvehide" class="normal"onClick="openRemarks('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'A','<%=COMPANY%>')" href="javascript:void(0)"><b>Approve</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a name="reviewhide" id="reviewhide" class="normal" onClick="openRemarks('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'H','<%=COMPANY%>')" href="javascript:void(0)"><b>Review</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%if(Approver.equals("AP4")){%><a class="normal" onClick="remarkspop('<%=priceid%>',<%=tOId%>,'<%=Approver%>')" href="javascript:void(0)"><b>Specific Review</b></a><%}%><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onClick="openRemarks('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'R','<%=COMPANY%>')" class="normal"><b>Reject</b></a> -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%}else{if(STATUS.equals("CL")){%><b>STATUS: Approved</b><%}else if(STATUS.equals("C")){%><b>STATUS: Cancelled</b><%}else if(STATUS.equals("URE")){%><b>STATUS: Review</b><%}}}}%>&nbsp;&nbsp;</td></tr>
	
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
%>
<%

    }
}%>
  <tr name="hidetr2" id="hidetr2"><td height="10" class="boldsmall" align="right" colspan="9" ></td></tr>

<!--   <%
     
	 String categoryName= CATEGORY.toString();
     String cId=(String)categoryTable.get(categoryName);
     //out.println("category Name is" +cId);
	 String priceid1=cId + priceid;
		  
	%>

 -->
<%@ include file="../includes/parRequestDetails.jsp"%>

</form>
</center>
</body>
</html>