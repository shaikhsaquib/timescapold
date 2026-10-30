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
<link href="../css/global.css" rel="stylesheet" type="text/css" />
<link href="../css/custom.css" rel="stylesheet" type="text/css" />
<script src="../../jscripts/jquery.js"language="javascript"></script>

<script Language="JavaScript" src="../jscripts/consumables.js"></script>

<style>  
.travelMenuBG {
	FONT-SIZE: 8 pt;

}  
table{
border:1pt;
border-color:#CCCACA;
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
	$(document).ready(function(){
		$('#clickDiv').click(function() {
    var control = $('#divToShow').toggle();
});
$("textarea").each( function( i, el ) {
    $(el).height( el.scrollHeight );
});
});
</script>
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
           // document.getElementById('hidetr2').style.display      = 'none'; 
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
        document.location.href = "viewStatusCon.jsp";
    }

	function showSelectedImage(imagePath)
	{
		//var mylist=document.getElementById("country");
		//alert(imagePath);
		document.getElementById("test").src=imagePath;
	}


</script>



</head>
<body>

<%@ include file="../includes/setApprStatusConPrintPreview.jsp"%>

<center>
<body>
<form name="priceApprovalMain" method="post" action="">
<table width="998px"  border="1" bordercolor="#f0f0f0"cellpadding="2" cellspacing="0">
    <tr name="hidetr3" id="hidetr3">
        <td colspan="3" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="back" type="button" class="style4" id="back" value="Home" onclick="javascript:backPage();"/></td>
        <td height="10" align="right" colspan="6" class="redbold"><input name="printbutton" type="button" class="style4" id="printbutton" value="Print" onclick="javascript:hideImage();window.print();showImage();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>

  <tr  name="hidetr1" id="hidetr1">
    <td height="10" class="boldsmall" align="right" colspan="9" ><%if(!AP31.equals("0") && APPROVER31_STATUS.equals("L") ){%><a  name="edithide" id="edithide" class="normal" href="../indexUpdateDraftOsp.jsp?tOId=<%=tOId%>&priceid=<%=priceid%>&flag=E"><b>Edit </b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <%} else if(STATUS.equals("C")){%><b>STATUS: Cancelled</b><%}else{if(STATUS.equals("CL")){%><b>STATUS: Approved</b><%}else if(STATUS.equals("C")){%><b>STATUS: Cancelled</b><%}else if(STATUS.equals("URE")){%><b>STATUS: Review</b><%}else if(STATUS.equals("L")){%><b>STATUS: In-Process</b><%}}%>&nbsp;&nbsp;</td>
    </tr>
</table>	
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
  <tr name="hidetr2" id="hidetr2"><td height="10" class="boldsmall" align="right" colspan="9" ><a name="delegatehide" id="delegatehide" class="normal" onClick="delegateAdminPage('<%=priceid%>',<%=tOId%>)" href="javascript:void(0)"><b>Delegate</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<%
        }
    }
}%>
  <tr name="hidetr2" id="hidetr2"><td height="10" class="boldsmall" align="right" colspan="9" ></td></tr>

<%@ include file="../includes/requestDetailsConPrintPreview.jsp"%>

</form>
</center>
</body>
</html>