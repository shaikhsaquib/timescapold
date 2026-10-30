
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.text.SimpleDateFormat,java.util.GregorianCalendar,java.util.Calendar, java.util.Date,java.text.*" %>
<%@ page import="com.bccl.util.Utility,com.bccl.util.HtmlUtil,com.bccl.util.AESencrp"%>
<%@ page import = "java.util.*"%>
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

<script> 
    function hideImage() { 
        if (document.getElementById) { 
           // document.getElementById('hidetr1').style.display      = 'none'; 
            document.getElementById('hidetr3').style.display      = 'none'; 
			document.getElementById('hidetrNextPrev').style.display      = 'none'; 
        } 
    }
function showImage() { 
	if (document.getElementById) { 
		document.location.reload();
	} 
} 
function backPage()
{
	document.location.href = "../indexCon.jsp";
}

function loadNextImage(imageCounter,what){
		
		if(what=="N"){
			temp = document.getElementById('nextImageCounter').value;
		}else if(what=="P"){
			temp = document.getElementById('prevImageCounter').value;
		}
		//int imageCounter = temp;
		//alert(temp);
		//alert((document.getElementById("nextImageCounter"+imageCounter)).value);
		if(temp>=0){
			for(kk = 0; kk<500; kk++){
				var filePath = document.getElementById('nextImagePath'+parseInt(temp)).value;
				if(filePath!="NA"){
					document.getElementById("test").src=filePath;
					document.getElementById('prevImageCounter').value = parseInt(temp) - 1;
					document.getElementById('nextImageCounter').value = parseInt(temp) + 1;
					break;
				}else if(filePath=="NA"){
					if(what=="N"){
						temp = document.getElementById('nextImageCounter').value;
					}else if(what=="P"){
						temp = document.getElementById('prevImageCounter').value;
					}
					document.getElementById('prevImageCounter').value = parseInt(temp) - 1;
					document.getElementById('nextImageCounter').value = parseInt(temp) + 1;					
				}
			}
			
		}
	}

</script>
</head>

<%
	  String APPROVER11_STATUS 	=	"";
	  String APPROVER12_STATUS 	=	"";
	  String APPROVER13_STATUS 	=	"";
	  String APPROVER21_STATUS 	=	"";
	  String APPROVER22_STATUS 	=	"";
	  String APPROVER23_STATUS 	=	"";
	  String APPROVER31_STATUS 	=	"";
	  String APPROVER32_STATUS 	=	"";
	  String APPROVER33_STATUS 	=	"";
	  String APPROVER4_STATUS  	=	"";
	  String APPROVER5_STATUS  	=	"";
	  String APPROVER6_STATUS  	=	"";
	  String APPROVER11_DATE 	=	"";
	  String APPROVER12_DATE 	=	"";
	  String APPROVER13_DATE 	=	"";
	  String APPROVER21_DATE 	=	"";
	  String APPROVER22_DATE 	=	"";
	  String APPROVER23_DATE 	=	"";
	  String APPROVER31_DATE 	=	"";
	  String APPROVER32_DATE 	=	"";
	  String APPROVER33_DATE 	=	"";
	  String APPROVER4_DATE  	=	"";
	  String APPROVER5_DATE  	=	"";
	  String APPROVER6_DATE  	=	"";
	  String APPROVER34_STATUS 	=	"";
	  String APPROVER35_STATUS 	=	"";
	  String APPROVER36_STATUS 	=	"";
	  String APPROVER7_STATUS  	=	"";
	  String APPROVER34_DATE   	=	"";
	  String APPROVER35_DATE   	=	"";
	  String APPROVER36_DATE   	=	"";
	  String APPROVER7_DATE    	=	"";
	  String APPROVER8_STATUS  	=	"";
	  String APPROVER8_DATE		=	"";
	  String STATUS				= "";


		
		String AP11 =	""	;
		String AP12	=	""	;
		String AP13	=	""	;
		String AP21	=	""	;
		String AP22	=	""	;
		String AP23	=	""	;
		String AP31	=	""	;
		String AP32	=	""	;
		String AP33	=	""	;
		String AP34	=	""	;
		String AP35	=	""	;
		String AP36	=	""	;
		String AP4	=	""	;
		String AP5	=	""	;
		String AP6	=	""	;
		String AP7	=	""	;
		String AP8	=	""	;
					
		String APPROVER11	=	""	;
		String APPROVER12	=	""	;
		String APPROVER13	=	""	;
		String APPROVER21	=	""	;
		String APPROVER22	=	""	;
		String APPROVER23	=	""	;
		String APPROVER31	=	""	;
		String APPROVER32	=	""	;
		String APPROVER33	=	""	;
		String APPROVER34	=	""	;
		String APPROVER35	=	""	;
		String APPROVER36	=	""	;
					
		String APPROVER4	=	""	;
		String APPROVER5	=	""	;
		String APPROVER6	=	""	;
		String APPROVER7	=	""	;
		String APPROVER8	=	""	;

		String timescapeUId = Long.toString(timescapeUserOId); 
		String tOId			= (String)request.getParameter("tOId");
		
		String DOWNPATH        = EnvironmentProperties.getValue("priceapproval", "downloadPath");
	
		String DPATH        = EnvironmentProperties.getValue("priceapproval", "uploadPath");

		String summarryId		= (String)request.getParameter("summarryId");

		String display						= "NA";

	    String userEmailid  = "";

		String priceid = "";

		boolean chkAllApproved = true;


		ArrayList vStatus	=  new ArrayList();
	
		vStatus 			=	priceApprovalWebController.viewSummaryAttachments(summarryId);

		String[] data1		= (String [])vStatus.get(0);


		userEmailid	=	data1[8];

		if (userEmailid.indexOf("@") > -1) {
			userEmailid = userEmailid.substring(0, userEmailid.indexOf("@"));        
	   } 


		
%>
<table width="795px" border="1" bordercolor="#f0f0f0"cellpadding="2" cellspacing="0" align="center">
<!--  <tr><td height="10" colspan="7"></td></tr> -->
 <tr name="hidetr3" id="hidetr3"><td colspan="3" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="back" type="button" class="style4" id="back" value="Back" onclick="javascript:window.history.back();"/></td><td height="10" align="right" colspan="6" class="redbold"><input name="printbutton" type="button" class="style4" id="printbutton" value="Print" onclick="javascript:hideImage();window.print();showImage();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>

	</tr>



</table>
<table  width="795px"  border="1" border-color="#f0f0f0" cellpadding="2" cellspacing="0" align="center">
	
  
		
	<!--tech specification-->
	
	<tr>
	<td  height="18px" colspan="12" align="center" valign="top" class="travelMenuBG" style="background-color:#80807E;color:#FFF;"><font size="2"> SUMMARY ID : <%=data1[0]%></font></td>
	</tr>
	<tr>
	<td  height= "30px" colspan="12" valign="top" class="travelMenuBG" >
	<table  width="992px" border-color="#f0f0f0" border="1" cellpadding="2" cellspacing="0">


	<tr>
	<td  height="18px" colspan="12" align="center" valign="top" class="travelMenuBG" style="background-color:#80807E;color:#FFF;"><font size="2"> ATTACHMENTS</font></td>
	</tr>
	<tr>
	<td  height= "30px" colspan="12" valign="top" class="travelMenuBG" >
	<table  width="992px" border-color="#f0f0f0" border="1" cellpadding="2" cellspacing="0">
<%
Hashtable imageList = new Hashtable();
boolean isFirstTime = true;
int nxtImgCnt = 0;
int prvImgCnt = 0;
boolean nxtImgCntStatus = true;
boolean prvImgCntStatus = true;

if(vStatus.size()>0){

    for(int i=0;i<vStatus.size();i++)
    {
        String[] data2 = (String [])vStatus.get(i);	
		
		String	ATTACHMENT	= data2[1];
		String st1 = "";
		String st2 = "";
		String st3 = "";
	
			if(!(ATTACHMENT.equals("NA.NA_NA")))
				{
				 st1 = ATTACHMENT.substring(0, ATTACHMENT.lastIndexOf("."));
				 st2 = ATTACHMENT.substring(ATTACHMENT.lastIndexOf(".")+1,ATTACHMENT.length());
                 st3 = st1.substring(0, ATTACHMENT.lastIndexOf("_"));
                 display = st3 + "." + st2;
				imageList.put(i,(DOWNPATH+userEmailid+"/"+ATTACHMENT));
				if(st2.equals("jpg")){
					//out.println(display);
					
					if(isFirstTime==false && nxtImgCntStatus == true){
						nxtImgCnt = i;
						nxtImgCntStatus = false;
					}
				
%>
		<input type="hidden" id="nextImagePath<%=i%>" name="nextImagePath<%=i%>" value="<%=imageList.get(i)%>"></input>
<%

				}else{
%>
		<input type="hidden" id="nextImagePath<%=i%>" name="nextImagePath<%=i%>" value="NA"></input>
<%
				}
				}
if(st2.equals("jpg") && isFirstTime==true){
	isFirstTime = false;

%>
	  <tr id="hidetrNextPrev">
	  <td align="right" class="normal" valign="middle" colspan="5"><input name="prevbutton" type="button" class="style4" id="prevbutton" value="Previous Page" onclick="javascript:loadNextImage('<%=i%>','P');"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="nextbutton" type="button" class="style4" id="nextbutton" value="Next Page" onclick="javascript:loadNextImage('<%=i%>','N');"/></td>
	  
	  
	  </tr>
	  <tr>
	  <td align="center" class="normal" valign="middle" colspan="4">
	  
	  <div id='divToShow' style='display:show;'>
	  <h5  align="center"><%//=display%></h5>
		 <!-- <object src="PAR Consumables - Use Cases.xlsx"><embed src="PAR Consumables - Use Cases.xlsx"></embed></object>
 	
 <object width="900" height="800px" style="overflow:hidden;" data="<%//=DOWNPATH+userEmailid+"/"+ATTACHMENT%>" ></object> -->

		 <img src="<%=DOWNPATH+userEmailid+"/"+ATTACHMENT%>" width="100%" height="1160px" style="border: none;" id="test"></img>
		 
		 </div>
 </td>
	</tr>

<%}}}%>

	<input type="hidden" id="nextImageCounter" name="nextImageCounter" value="<%=nxtImgCnt%>">
	<input type="hidden" id="prevImageCounter" name="prevImageCounter" value="<%=prvImgCnt%>">

	<tr>
	<td width="50px" class="normal" align="center">Sr. No.</td>
	<td width="280px" class="normal" align="center">File Name</td>
	<td width="263px" class="normal" align="center">File Description</td>
	<td width="263px" class="normal" align="center">Type Of Document</td>
	
	</tr>
	<%
    for(int i=0;i<vStatus.size();i++)
    {
        String[] data2 = (String [])vStatus.get(i);	
		
		String	ATTACHMENT	= data2[1];

		String st1 = "";
		String st2 = "";
		String st3 = "";

				if(!(ATTACHMENT.equals("NA.NA_NA")))
				{
				 st1 = ATTACHMENT.substring(0, ATTACHMENT.lastIndexOf("."));
				 st2 = ATTACHMENT.substring(ATTACHMENT.lastIndexOf(".")+1,ATTACHMENT.length());
                 st3 = st1.substring(0, ATTACHMENT.lastIndexOf("_"));
                 display = st3 + "." + st2;

				//out.println(data2[2]);

				}
%>
	<tr>
	<td align="center" class="normal" valign="middle"><%=i+1%></td>
	<td align="center" class="normal" valign="middle" ><%if(!(ATTACHMENT.equals("NA.NA_NA")))
				{%><a href="#"  onclick="downloadAttachments('<%=DPATH+userEmailid+"/"+ATTACHMENT%>')" class="normal"><%=display%></a></td> 
	<td align="center" class="normal" valign="middle" ><%=data2[2]%></td> 
	<td align="center" class="normal" valign="middle" ><%=data2[3]%></td> 
	
	</tr>
<%
				}else{
%>	
	 <tr>
		<td width="4%" height="25" align="center" valign="middle" class="normal" colspan="7">No records</td>
	</tr>
<%
   }}
%>	
	</table>
	</td>
	</tr>


<tr>
	<td width="250px" class="normal" align="center"><strong>PURCHASE ID</strong></td>
	<td width="250px" class="normal" align="center"><strong>CATEGORY</strong></td>
	<td width="250px" class="normal" align="center"><strong>PAR Value</strong></td>
	<td width="250px" class="normal" align="center"><strong>STATUS</strong></td>
	<td width="250px" class="normal" align="center"><strong>ACTION</strong></td>
	
</tr>


<%

		ArrayList vStatus1	=  new ArrayList();
	
		vStatus1 			=	priceApprovalWebController.viewSummaryParLst(summarryId);

if(vStatus1.size() > 0){
	for(int i=0;i<vStatus1.size();i++)
	{
        String[] data2 = (String [])vStatus1.get(i);	

		String  PARVALUE = data2[2];

		if(PARVALUE == null){
			PARVALUE="0";
		}

	    int len = PARVALUE.length();

		String temp = "";
			
		int lenCount = len-1;

		int counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
				{
					temp = temp + ",";
				}
				
				temp = temp + PARVALUE.charAt(lenCount);
				
				lenCount--;
				counter++;
			}

			temp =  new StringBuffer(temp).reverse().toString();
			PARVALUE = temp;
		}

%>

<tr>

	<td width="250px" class="normal" align="center"><%=data2[0]%></td>
	<td width="250px" class="normal" align="center"><%=data2[1]%></td>
	<td width="250px" class="normal" align="center"><%=PARVALUE==null?"NA":PARVALUE%></td>
	<td width="250px" class="normal" align="center"><%//=data2[4]%>
	
	<%if(data2[4].equals("L")||data2[4].equals("UC")){%><img src="../../images/inprocess.png" /><%}else if(data2[4].equals("S")){%><img src="../../images/supported.png" /><%}else if(data2[4].equals("CL")){%><img src="../../images/approved.png" /><%}else if(data2[4].equals("CR")){%><img src="../../images/rejected.png" /><%}%>

	
	</td>
	<td width="250px" class="normal" align="center"><a href="../common/showDetailsCon.jsp?tOId=<%=tOId%>&priceid=<%=data2[0]%>">View</td>

	</tr>


<%
	if(!data2[4].equals("CL")){
		chkAllApproved = false;
	}
	if(i==0){
		
		priceid = (String)data2[0];		

	}
   }

   
   ///for displaying approvals section on summary for first PAR ID only in case if all PARs in a summary are approved/closed status
   if(chkAllApproved){
	ArrayList vStatusCon	=  new ArrayList();	
	vStatusCon 			=	priceApprovalWebController.viewStatusCon("",priceid);	


	ArrayList vStatus5	=  new ArrayList();	
	vStatus5 			=	priceApprovalWebController.viewApproverDetailsCon("",priceid);
	

	if(vStatusCon.size()>0 && vStatus5.size()>0){
	
		String[] data1Con		= (String [])vStatusCon.get(0);			
		
		String[] data3      = (String [])vStatus5.get(0);		

		   APPROVER11_STATUS = data3[0];            
		   APPROVER12_STATUS = data3[1];           
		   APPROVER13_STATUS = data3[2];            
		   APPROVER21_STATUS = data3[3];            
		   APPROVER22_STATUS = data3[4];            
		   APPROVER23_STATUS = data3[5];             
		   APPROVER31_STATUS = data3[6];            
		   APPROVER32_STATUS = data3[7];            
		   APPROVER33_STATUS = data3[8];            
		   APPROVER4_STATUS  = data3[9];            
		   APPROVER5_STATUS  = data3[10];            
		   APPROVER6_STATUS  = data3[11];           
		   APPROVER11_DATE = data3[12];              
		   APPROVER12_DATE = data3[13];              
		   APPROVER13_DATE = data3[14];              
		   APPROVER21_DATE = data3[15];              
		   APPROVER22_DATE = data3[16];              
		   APPROVER23_DATE = data3[17];              
		   APPROVER31_DATE = data3[18];              
		   APPROVER32_DATE = data3[19];              
		   APPROVER33_DATE = data3[20];              
		   APPROVER4_DATE  = data3[21];              
		   APPROVER5_DATE  = data3[22];              
		   APPROVER6_DATE  = data3[26];
		   APPROVER34_STATUS = data3[24];
		   APPROVER35_STATUS = data3[30];
		   APPROVER36_STATUS = data3[32];
		   APPROVER7_STATUS  = data3[25];
		   APPROVER34_DATE   = data3[26];
		   APPROVER35_DATE   = data3[31];
		   APPROVER36_DATE   = data3[33];
		   APPROVER7_DATE    = data3[27];
		   APPROVER8_STATUS  = data3[28];
		   APPROVER8_DATE	   = data3[29];



		
		 AP11     					= data1Con[4];
		 AP12					        = data1Con[5];
		 AP13					        = data1Con[6];
		 AP21					        = data1Con[7];
		 AP22					        = data1Con[8];
		 AP23					        = data1Con[9];
		 AP31					        = data1Con[10];
		 AP32					        = data1Con[11];
		 AP33					        = data1Con[12];
		 AP34					        = data1Con[13];
		 AP35					        = data1Con[14];
		 AP36					        = data1Con[15];
		 AP4					        = data1Con[16];
		 AP5					        = data1Con[17];
		 AP6					        = data1Con[18];
		 AP7					        = data1Con[19];
		 AP8					        = data1Con[20];

		 APPROVER11					= data1Con[27];
		 APPROVER12					= data1Con[28];
		 APPROVER13					= data1Con[29];
		 APPROVER21					= data1Con[30];
		 APPROVER22					= data1Con[31];
		 APPROVER23					= data1Con[32];
		 APPROVER31					= data1Con[33];
		 APPROVER32					= data1Con[34];
		 APPROVER33					= data1Con[35];
		 APPROVER34					= data1Con[36];
		 APPROVER35					= data1Con[37];
		 APPROVER36					= data1Con[38];

		 APPROVER4					= data1Con[39];
		 APPROVER5					= data1Con[40];
		 APPROVER6					= data1Con[41];
		 APPROVER7					= data1Con[42];
		 APPROVER8					= data1Con[43];		

		 STATUS						= data1Con[25];
		
		
	}

%>	

<!--approvals-->
	<tr>
  <td  height="18px" colspan="12" align="center" valign="middle" class="travelMenuBG" style="background-color:#80807E;color:#FFF;"><font size="2"> APPROVALS</font></td>
</tr>

<tr>
  <td    colspan="12" valign="top" class="travelMenuBG" >
   
   <table width="992px"  border-color="#f0f0f0" border="1" cellpadding="2" cellspacing="0">
  <tr>
    <td width="263px" class="normal" align="center"><strong>B&C</strong></td>
    <td width="263px" class="normal" align="center"><strong>Category Head</strong> </td>
    <td width="263px" class="normal" align="center"><strong>Supported By</strong></td>
    <td width="263px" class="normal" align="center"><strong>Director B&C </strong></td>
    <td width="263px" class="normal" align="center"><strong>COO (Publishing)</strong></td>
    <td width="263px" class="normal" align="center"><strong>COO</strong></td>
    <td width="263px" class="normal" align="center"><strong>CEO (Publishing)</strong></td>
    <td width="263px" class="normal" align="center"><strong>Managing Director</strong></td>
  </tr>
  <tr>
    <td align="left" class="normal">
	<%if(!AP11.equals("0") && AP11.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP11%>,'AP11','X')"><img border="0" ></a><%}%></td>
    <td class="normal" align="left"><%if(!AP12.equals("0") && AP12.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP12%>,'AP12','X')"><img border="0" ></a><%}%></td>
    <td class="normal" align="left"><%if(!AP35.equals("0") && AP35.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP35%>,'AP35','X')"><img border="0" ></a><%}%></td> 
    <td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP4.equals("0") && AP4.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP4%>,'AP4','X')"><img border="0" ></a><%}%></td></tr>
	<tr>
	<td valign="top"  height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'" ><span id="test" style="padding:4px"><div id="ap4Remarks">
	<!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP4.equals("0") && AP4.equals(timescapeUId)&& (APPROVER4_STATUS.equals("L"))){%><%}if(APPROVER4!=null){out.println(APPROVER4);}if(!APPROVER4_STATUS.equals("L")){%><br><%out.println(APPROVER4_DATE);}%><%if(APPROVER4_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER4_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER4_STATUS.equals("H")){%><span class="small">Review</span><%}%>
    </span></td>
	</tr>
	</table>
	</td>
	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP5.equals("0") && AP5.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP5%>,'AP5','X')"><img border="0" ></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap5Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if (!AP5.equals("0") && AP5.equals(timescapeUId) && (APPROVER5_STATUS.equals("L"))){%>
   <%}if(APPROVER5!=null){out.println(APPROVER5);}if(!APPROVER5_STATUS.equals("L")){%><br><%out.println(APPROVER5_DATE);}%><%if(APPROVER5_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER5_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER5_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>
    <td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP6.equals("0") && AP6.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP6%>,'AP6','X')"><img border="0" ></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap6Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP6.equals("0") && AP6.equals(timescapeUId) && (APPROVER6_STATUS.equals("L"))){%>
   <%}if(APPROVER6!=null){out.println(APPROVER6);}if(!APPROVER6_STATUS.equals("L")){%><br><%out.println(APPROVER6_DATE);}%><%if(APPROVER6_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER6_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER6_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>




	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP7.equals("0") && AP7.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP7%>,'AP7','X')"><img border="0" ></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap7Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP7.equals("0") && AP7.equals(timescapeUId) && (APPROVER7_STATUS.equals("L"))){%>
   <%}if(APPROVER7!=null){out.println(APPROVER7);}if(!APPROVER7_STATUS.equals("L")){%><br><%out.println(APPROVER7_DATE);}%><%if(APPROVER7_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER7_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER7_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>
	<td rowspan="12" valign="top">
	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8F8F8">
	<tr><td align="left"><%if(!AP8.equals("0") && AP8.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP8%>,'AP8','X')"><img border="0" ></a><%}%></td></tr>
	<tr>
    <td valign="top" height="70" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap8Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP8.equals("0") && AP8.equals(timescapeUId) && (APPROVER8_STATUS.equals("L"))){%>
   <%}if(APPROVER8!=null){out.println(APPROVER8);}if(!APPROVER8_STATUS.equals("L")){%><br><%out.println(APPROVER8_DATE);}%><%if(APPROVER8_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER8_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER8_STATUS.equals("H")){%><span class="small">Review</span><%}%> </span></td>
	</tr>
	</table>
	</td>




  </tr>
  <tr>
    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap11Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else  if(!AP11.equals("0") && AP11.equals(timescapeUId) && (APPROVER11_STATUS.equals("L"))){%>
   <%} if(APPROVER11!=null){out.println(APPROVER11);}if(!APPROVER11_STATUS.equals("L")){%><br><%out.println(APPROVER11_DATE);}%><%if(APPROVER11_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER11_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER11_STATUS.equals("H")){%><span class="small">Review</span><%}%></td>
    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap12Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP12.equals("0") && AP12.equals(timescapeUId) && (APPROVER12_STATUS.equals("L"))){%>
   <%} if(APPROVER12!=null){out.println(APPROVER12);}if(!APPROVER12_STATUS.equals("L")){%><br><%out.println(APPROVER12_DATE);}%><%if(APPROVER12_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER12_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER12_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>

    <td align="center" class="ToolText" onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap13Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else if(!AP35.equals("0") && AP35.equals(timescapeUId) && (APPROVER35_STATUS.equals("L"))){%>
   <%}
 if(APPROVER35!=null){out.println(APPROVER35);}if(!APPROVER35_STATUS.equals("L")){%><br><%out.println(APPROVER35_DATE);}%><%if(APPROVER35_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER35_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER35_STATUS.equals("H")){%><span class="small">Review</span><%}%>
   </span></td>
  </tr>
  <tr>
    <td align="left"><%if(!AP21.equals("0") && AP21.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP21%>,'AP21','X')"><img border="0" ></a><%}%></td>
    <td align="left"><%if(!AP22.equals("0") && AP22.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP22%>,'AP22','X')"><img border="0" ></a><%}%></td>
    <td align="left"><%if(!AP36.equals("0") && AP36.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP36%>,'AP36','X')"><img border="0" ></a><%}%></td>
  </tr>
  <tr>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap21Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else if(!AP21.equals("0") && AP21.equals(timescapeUId) && (APPROVER21_STATUS.equals("L"))){%>
   <%} if(APPROVER21!=null){out.println(APPROVER21);}if(!APPROVER21_STATUS.equals("L")){%><br><%out.println(APPROVER21_DATE);}%><%if(APPROVER21_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER21_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER21_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap22Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP22.equals("0") && AP22.equals(timescapeUId) && (APPROVER22_STATUS.equals("L"))){%>
   <%} if(APPROVER22!=null){out.println(APPROVER22);}if(!APPROVER22_STATUS.equals("L")){%><br><%out.println(APPROVER22_DATE);}%><%if(APPROVER22_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER22_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER22_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap23Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(STATUS.equals("C")){ } else if(!AP36.equals("0") && AP36.equals(timescapeUId) && (APPROVER36_STATUS.equals("L"))){%>
   <%} if(APPROVER36!=null){out.println(APPROVER36);}if(!APPROVER36_STATUS.equals("L")){%><br><%out.println(APPROVER36_DATE);}%><%if(APPROVER36_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER36_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER36_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
  </tr>
  <tr>
    <td align="left"><%if(!AP31.equals("0") && AP31.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP31%>,'AP31','X')"><img border="0" ></a><%}%></td>
    <td align="left"><%if(!AP32.equals("0") && AP32.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP32%>,'AP32','X')"><img border="0" ></a><%}%></td>
    <td align="left"><%if(!AP33.equals("0") && AP33.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP33%>,'AP33','X')"><img border="0" ></a><%}%></td>
  </tr>
  <tr>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap31Remarks"><!-- Remarks Loads Here--></div></span>
	<span class="small"><%if(STATUS.equals("C")){ } else if(!AP31.equals("0") && AP31.equals(timescapeUId) && (APPROVER31_STATUS.equals("L"))){%>
   <%}
	if(APPROVER31!=null){out.println(APPROVER31);} if(!APPROVER31_STATUS.equals("L")){%><br><%out.println(APPROVER31_DATE);}%><%if(APPROVER31_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER31_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER31_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText"  
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap32Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><%if(!AP32.equals("0") && AP32.equals(timescapeUId) && (APPROVER32_STATUS.equals("L"))){%>
   <%}
if(APPROVER32!=null){out.println(APPROVER32);}if(!APPROVER32_STATUS.equals("L")){%><br><%out.println(APPROVER32_DATE);}%><%if(APPROVER32_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER32_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER32_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
    <td align="center" class="ToolText" 
	onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap33Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP13.equals("0") && AP13.equals(timescapeUId) && (APPROVER13_STATUS.equals("L"))){%>
   <%} if(APPROVER13!=null){out.println(APPROVER13);}if(!APPROVER13_STATUS.equals("L")){%><br><%out.println(APPROVER13_DATE);}%><%if(APPROVER13_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER13_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER13_STATUS.equals("H")){%><span class="small">Review</span><%}%></span></td>
  </tr>
<%if(AP23.equals("0")){}else{%>
  <tr>
  <td>&nbsp;<td>
  <td align="left"><%if(!AP34.equals("0") && AP34.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP34%>,'AP34','X')"><img border="0" ></a><%}%></td>

  </tr>

  <tr>
  
  <td>&nbsp;<td>
  <td align="center" class="ToolText" 
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap34Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP23.equals("0") && AP23.equals(timescapeUId) && (APPROVER23_STATUS.equals("L"))){%>
   <%} if(APPROVER23!=null){out.println(APPROVER23);}if(!APPROVER23_STATUS.equals("L")){%><br><%out.println(APPROVER23_DATE);}%><%if(APPROVER23_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER23_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER23_STATUS.equals("H")){%><span class="small">Review</span> <%}%></span></td>

  </tr>
<%}%>
<%if(AP33.equals("0")){}else{%>
  <tr>
  <td colspan="0">&nbsp;<td>

  <td align="left"><%if(!AP33.equals("0") && AP33.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP33%>,'AP33','X')"><img border="0" ></a><%}%></td>

  </tr>
  <tr>
  
<td colspan="0">&nbsp;<td>
  <td align="center" class="ToolText" 
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap35Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP33.equals("0") && AP33.equals(timescapeUId) && (APPROVER33_STATUS.equals("L"))){%>
   <%} if(APPROVER33!=null){out.println(APPROVER33);}if(!APPROVER33_STATUS.equals("L")){%><br><%out.println(APPROVER33_DATE);}%><%if(APPROVER33_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER33_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER33_STATUS.equals("H")){%><span class="small">Review</span> <%}%></span></td>

  </tr>
<%}%>
<%if(AP34.equals("0")){}else{%>
<tr>
  <td colspan="0">&nbsp;<td>

  <td align="left"><%if(!AP34.equals("0") && AP34.equals(timescapeUId)){%><a href="#" onclick="openRemarks('<%=priceid%>',<%=AP34%>,'AP34','X')"><img border="0" ></a><%}%></td>

  </tr>
  <tr>
  
  <td colspan="0">&nbsp;<td>
  <td align="center" class="ToolText" 
  onMouseOut="javascript:this.className='ToolText'"><span id="test" style="padding:4px"><div id="ap36Remarks"><!-- Remarks Loads Here--></div></span><span class="small"><% if(!AP34.equals("0") && AP34.equals(timescapeUId) && (APPROVER34_STATUS.equals("L"))){%>
   <%} if(APPROVER34!=null){out.println(APPROVER34);}if(!APPROVER34_STATUS.equals("L")){%><br><%out.println(APPROVER34_DATE);}%><%if(APPROVER34_STATUS.equals("A")){%><img src="../../images/approved.png"><%}else if(APPROVER34_STATUS.equals("R")){%><img src="../../images/rejected.png"><%}else if(APPROVER34_STATUS.equals("H")){%><span class="small">Review</span> <%}%></span></td>

  </tr>
<%}

}///for displaying approvals section on summary for first PAR ID only in case if all PARs in a summary are approved/closed status

}%>
 
</table>

   
   </td>
   
</tr>
</table>


