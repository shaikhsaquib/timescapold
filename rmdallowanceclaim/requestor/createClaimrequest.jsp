<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />

<html>
	<head>
		<title> FIELD/NIGHT ALLOWANCE REIMBURSEMENT FORM </title>
		<!-- <link rel="stylesheet" href="../style/global.css">-->
		<link rel="stylesheet" href="../style/common.css"> 
	 <script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript" src="../jscripts/common.js"></script>
		<script Language="JavaScript" src="../jscripts/createRequest.js"></script>
		<script src="../jscripts/calendarControl.js"language="javascript"></script> 
		 <link href="../style/calendarControl.css"rel="stylesheet"> 
	 </head>
 	
	<%
		
		GregorianCalendar today = new GregorianCalendar();
        int todayDay = today.get(Calendar.DAY_OF_MONTH);

		String months[ ] ={"0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};


		String todayMon = months[today.get(Calendar.MONTH)+1];

		int  todayYear = today.get(Calendar.YEAR);

		String dayMonYear			= todayDay + "-" + todayMon + "-" + todayYear;
   
        //out.println("dayMonYear=="+dayMonYear);

		int noOfRows = 31;
		session.setAttribute("currLink", "../requestor/createClaimrequest.jsp");
		session.setAttribute("topLink", "1");
		ArrayList approvers = new ArrayList( );	     
	%>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="getWeekDay(0)">
		<%@ include file="../includes/rmdClaimHeader.html" %>
		<%@ include file="../includes/rmdClaimMenu.jsp" %> 
		<%
		//if (((deptGroup.equals("1025")&& (branchCode.equals ("1426") || branchCode.equals ("1022") || branchCode.equals ("1021") || branchCode.equals ("1068") || branchCode.equals ("1005") || branchCode.equals ("1016") || branchCode.equals ("1056") || branchCode.equals ("1038"))))) {
		if ((deptGroup.equals("1025")) && (!(sapId.equals("10003106") || sapId.equals("10000215") || sapId.equals("10030971") || sapId.equals("10030151") || sapId.equals("10031392") || sapId.equals("10015009") || sapId.equals("10023579") || sapId.equals("10021581") || sapId.equals("10026954") || sapId.equals("10020922") || sapId.equals("10026953") || sapId.equals("10029268") || sapId.equals("10013634") || sapId.equals("10024956") || sapId.equals("10012724") || sapId.equals("10024061") || sapId.equals("10006762") || sapId.equals("10030231") || sapId.equals("10021779") || sapId.equals("10029288") || sapId.equals("10002351") || sapId.equals("10023812") || sapId.equals("10029942") || sapId.equals("10018475") || sapId.equals("10002995") || sapId.equals("10031192") || sapId.equals("10022944") || sapId.equals("10019719") || sapId.equals("10026285") || sapId.equals("10031036") || sapId.equals("10016315") || sapId.equals("10032223") || sapId.equals("10023435") || sapId.equals("10006137") || sapId.equals("10005773") || sapId.equals("10002469") || sapId.equals("10023139") || sapId.equals("10022200") || sapId.equals("10010382") || sapId.equals("10025039") || sapId.equals("10023392") || sapId.equals("10020401") || sapId.equals("10019707") || sapId.equals("10027875") || sapId.equals("10016293") || sapId.equals("10014391") || sapId.equals("10030684") || sapId.equals("10031195") || sapId.equals("10006996") || sapId.equals("10027111") || sapId.equals("10002776") || sapId.equals("10002498") || sapId.equals("10001635") || sapId.equals("10028686") || sapId.equals("10031391") || sapId.equals("10028509") || sapId.equals("10028619") || sapId.equals("10005992") || sapId.equals("10024775") || sapId.equals("10032148") || sapId.equals("10030714") || sapId.equals("10028516") || sapId.equals("10019892") || sapId.equals("10032095") || sapId.equals("10027331") || sapId.equals("10018301") || sapId.equals("10026583") || sapId.equals("10030724") || sapId.equals("10006463") || sapId.equals("10022856") || sapId.equals("10032219") || sapId.equals("10032237") || sapId.equals("10027145") || sapId.equals("10017416") || sapId.equals("10022584") || sapId.equals("10019342") || sapId.equals("10025352") || sapId.equals("10017275") || sapId.equals("10016195") || sapId.equals("10000260") || sapId.equals("10026056") || sapId.equals("10018293") || sapId.equals("10013766") || sapId.equals("10031194") || sapId.equals("10031968") || sapId.equals("10027928") || sapId.equals("10022628") || sapId.equals("10003034") || sapId.equals("10000468") || sapId.equals("10004693") || sapId.equals("10001976") || sapId.equals("10001689") || sapId.equals("10030284") || sapId.equals("10019175") || sapId.equals("10002090") || sapId.equals("10029734") || sapId.equals("10001631") || sapId.equals("10012816") || sapId.equals("10019460") || sapId.equals("10011169") || sapId.equals("10024654") || sapId.equals("10002038") || sapId.equals("10030530") || sapId.equals("10003092") || sapId.equals("10004651") || sapId.equals("10029697") || sapId.equals("10011088") || sapId.equals("10026990") || sapId.equals("10018754") || sapId.equals("10014187") || sapId.equals("10022874") || sapId.equals("10003942") || sapId.equals("10002310") || sapId.equals("10027751") || sapId.equals("10031721") || sapId.equals("10002189") || sapId.equals("10001765") || sapId.equals("10020800") || sapId.equals("10002918") || sapId.equals("10012835") || sapId.equals("10001982") || sapId.equals("10024026") || sapId.equals("10018068") || sapId.equals("10014711") || sapId.equals("10032204") || sapId.equals("10006530") || sapId.equals("10024255") || sapId.equals("10030855") || sapId.equals("10019219") || sapId.equals("10031452") || sapId.equals("10021347") || sapId.equals("10004730") || sapId.equals("10026550") || sapId.equals("10026582") || sapId.equals("10025061") || sapId.equals("10007442") || sapId.equals("10016716") || sapId.equals("10016864") || sapId.equals("10010399") || sapId.equals("10015263") || sapId.equals("10004131") || sapId.equals("10028307") || sapId.equals("10003090") || sapId.equals("10030042") || sapId.equals("10029733") || sapId.equals("10030616") || sapId.equals("10031396") || sapId.equals("10017775") || sapId.equals("10001149") || sapId.equals("10029702") || sapId.equals("10028560") || sapId.equals("10011076") || sapId.equals("10022151") || sapId.equals("10029983") || sapId.equals("10002008") || sapId.equals("10027904") || sapId.equals("10024197") || sapId.equals("10022114") || sapId.equals("10007352") || sapId.equals("10024033") || sapId.equals("10027722") || sapId.equals("10026343") || sapId.equals("10001877") || sapId.equals("10030023") || sapId.equals("10018661") || sapId.equals("10013628") || sapId.equals("10004479") || sapId.equals("10011303") || sapId.equals("10027982") || sapId.equals("10029868") || sapId.equals("10018139") || sapId.equals("10030956") || sapId.equals("10012736") || sapId.equals("10013863") || sapId.equals("10024650") || sapId.equals("10012674") || sapId.equals("10022003") || sapId.equals("10027614") || sapId.equals("10027682") || sapId.equals("10026379") || sapId.equals("10021105") || sapId.equals("10010020") || sapId.equals("10025157") || sapId.equals("10030185") || sapId.equals("10026362") || sapId.equals("10012651") || sapId.equals("10013782") || sapId.equals("10021450") || sapId.equals("10029886") || sapId.equals("10016940") || sapId.equals("10001887") || sapId.equals("10023390") || sapId.equals("10000455") || sapId.equals("10000457") || sapId.equals("10028604") || sapId.equals("10030717") || sapId.equals("10023266") || sapId.equals("10021002") || sapId.equals("10004339") || sapId.equals("10018524") || sapId.equals("10012632") || sapId.equals("10024681") || sapId.equals("10018911") || sapId.equals("10018850") || sapId.equals("10007586") || sapId.equals("10012686") || sapId.equals("10029819") || sapId.equals("10002233") || sapId.equals("10000268") || sapId.equals("10003221") || sapId.equals("10025820") || sapId.equals("10012821") || sapId.equals("10002287") || sapId.equals("10002974") || sapId.equals("10026842") || sapId.equals("10030478") || sapId.equals("10002753") || sapId.equals("10012643") || sapId.equals("10020495") || sapId.equals("10001684") || sapId.equals("10031383") || sapId.equals("10006317") || sapId.equals("10027022") || sapId.equals("10015711") || sapId.equals("10027069") || sapId.equals("10018886") || sapId.equals("10020386") || sapId.equals("10029896") || sapId.equals("10005820") || sapId.equals("10024064") || sapId.equals("10020190") || sapId.equals("10018002") || sapId.equals("10024870") || sapId.equals("10004341") || sapId.equals("10023822") || sapId.equals("10025006") || sapId.equals("10024014") || sapId.equals("10011322") || sapId.equals("10030275") || sapId.equals("10030906") || sapId.equals("10024963") || sapId.equals("10015073") || sapId.equals("10001676") || sapId.equals("10031196") || sapId.equals("10015068") || sapId.equals("10030700") || sapId.equals("10031198") || sapId.equals("10030681") || sapId.equals("10012654") || sapId.equals("10002556") || sapId.equals("10000440") || sapId.equals("10012035") || sapId.equals("10023767") || sapId.equals("10029863") || sapId.equals("10002488") || sapId.equals("10031197") || sapId.equals("10020061") || sapId.equals("10018240") || sapId.equals("10002224") || sapId.equals("10024486") || sapId.equals("10000582") || sapId.equals("10026547") || sapId.equals("10015671") || sapId.equals("10004728") || sapId.equals("10025226") || sapId.equals("10000556") || sapId.equals("10021709") || sapId.equals("10022787") || sapId.equals("10029106") || sapId.equals("10028053") || sapId.equals("10031405") || sapId.equals("10001806") || sapId.equals("10018308") || sapId.equals("10021855") || sapId.equals("10002312") || sapId.equals("10030213") || sapId.equals("10006200") || sapId.equals("10026965") || sapId.equals("10016571") || sapId.equals("10032151") || sapId.equals("10003235") || sapId.equals("10006107") || sapId.equals("10002675") || sapId.equals("10003069") || sapId.equals("10028552") || sapId.equals("10002337") || sapId.equals("10010385") || sapId.equals("10030079") || sapId.equals("10018659") || sapId.equals("10005215") || sapId.equals("10022129") || sapId.equals("10027856") || sapId.equals("10024688") || sapId.equals("10006730") || sapId.equals("10001990") || sapId.equals("10024329") || sapId.equals("10024030") || sapId.equals("10005535") || sapId.equals("10021686") || sapId.equals("10024078") || sapId.equals("10028876") || sapId.equals("10025317") || sapId.equals("10026217") || sapId.equals("10021423") || sapId.equals("10027893") || sapId.equals("10015681") || sapId.equals("10014289") || sapId.equals("10028838") || sapId.equals("10027133") || sapId.equals("10019455") || sapId.equals("10027618") || sapId.equals("10029258") || sapId.equals("10029097") || sapId.equals("10020028") || sapId.equals("10003168") || sapId.equals("10002981") || sapId.equals("10003027") || sapId.equals("10025933") || sapId.equals("10022723") || sapId.equals("10029920") || sapId.equals("10002513") || sapId.equals("10016738") || sapId.equals("10018880") || sapId.equals("10001795") || sapId.equals("10018300") || sapId.equals("10028271") || sapId.equals("10024946") || sapId.equals("10029162") || sapId.equals("10011977") || sapId.equals("10029993") || sapId.equals("10024290") || sapId.equals("10021840") || sapId.equals("10000555") || sapId.equals("10029114") || sapId.equals("10030856") || sapId.equals("10031384") || sapId.equals("10016687") || sapId.equals("10019634") || sapId.equals("10024989") || sapId.equals("10000535") || sapId.equals("10018437") || sapId.equals("10005988") || sapId.equals("10029777") || sapId.equals("10028155") || sapId.equals("10007406") || sapId.equals("10026906") || sapId.equals("10029646") || sapId.equals("10007141") || sapId.equals("10025285") || sapId.equals("10028576") || sapId.equals("10010091") || sapId.equals("10032165") || sapId.equals("10000578") || sapId.equals("10028455") || sapId.equals("10001888") || sapId.equals("10003102") || sapId.equals("10023106") || sapId.equals("10001854") || sapId.equals("10000267") || sapId.equals("10017871") || sapId.equals("10012220") || sapId.equals("10014852") || sapId.equals("10028802") || sapId.equals("10012109") || sapId.equals("10030809") || sapId.equals("10025844") || sapId.equals("10001864") || sapId.equals("10001140") || sapId.equals("10000304") || sapId.equals("10020484") || sapId.equals("10030776") || sapId.equals("10021748") || sapId.equals("10025151") || sapId.equals("10030289") || sapId.equals("10000547") || sapId.equals("10025128") || sapId.equals("10011280") || sapId.equals("10012754") || sapId.equals("10022660") || sapId.equals("10000502") || sapId.equals("10027492") || sapId.equals("10009984") || sapId.equals("10015697") || sapId.equals("10030893") || sapId.equals("10004729") || sapId.equals("10030517") || sapId.equals("10017729") || sapId.equals("10001708") || sapId.equals("10020933") || sapId.equals("10005559") || sapId.equals("10029111") || sapId.equals("10010074") || sapId.equals("10029340") || sapId.equals("10026051") || sapId.equals("10012819") || sapId.equals("10012648") || sapId.equals("10030235") || sapId.equals("10031408") || sapId.equals("10030920") || sapId.equals("10031202") || sapId.equals("10002589") || sapId.equals("10012708") || sapId.equals("10016639") || sapId.equals("10002262") || sapId.equals("10001642") || sapId.equals("10010334") || sapId.equals("10005811") || sapId.equals("10010927") || sapId.equals("10016819") || sapId.equals("10021849") || sapId.equals("10022303") || sapId.equals("10022936") || sapId.equals("10027077") || sapId.equals("10002959") || sapId.equals("10015492") || sapId.equals("10029880") || sapId.equals("10024740") || sapId.equals("10030142") || sapId.equals("10028899") || sapId.equals("10031024") || sapId.equals("10028717") || sapId.equals("10031206") || sapId.equals("10029792") || sapId.equals("10011288") || sapId.equals("10018714") || sapId.equals("10022610") || sapId.equals("10031203") || sapId.equals("10004116") || sapId.equals("10031349") || sapId.equals("10026359") || sapId.equals("10012722") || sapId.equals("10012646") || sapId.equals("10006087") || sapId.equals("10017804") || sapId.equals("10020208") || sapId.equals("10007443") || sapId.equals("10007631") || sapId.equals("10012732") || sapId.equals("10022568") || sapId.equals("10001620") || sapId.equals("10018817") || sapId.equals("10021800") || sapId.equals("10028669") || sapId.equals("10025943") || sapId.equals("10004120") || sapId.equals("10022773") || sapId.equals("10031207") || sapId.equals("10007585") || sapId.equals("10002943") || sapId.equals("10029829") || sapId.equals("10017627") || sapId.equals("10030925") || sapId.equals("10030186") || sapId.equals("10024815") || sapId.equals("10025316") || sapId.equals("10014397") || sapId.equals("10030066") || sapId.equals("10018333") || sapId.equals("10021171") || sapId.equals("10022006") || sapId.equals("10000398") || sapId.equals("10001647") || sapId.equals("10007636") || sapId.equals("10001985") || sapId.equals("10012681") || sapId.equals("10017483") || sapId.equals("10030859") || sapId.equals("10027657") || sapId.equals("10028518") || sapId.equals("10016202") || sapId.equals("10031992") || sapId.equals("10026657") || sapId.equals("10029108") || sapId.equals("10025111") || sapId.equals("10017141") || sapId.equals("10032028") || sapId.equals("10029227") || sapId.equals("10004193") || sapId.equals("10027106") || sapId.equals("10015598") || sapId.equals("10021091") || sapId.equals("10027229") || sapId.equals("10026981") || sapId.equals("10022233") || sapId.equals("10000289") || sapId.equals("10002014") || sapId.equals("10029980") || sapId.equals("10029291") || sapId.equals("10001639") || sapId.equals("10018729") || sapId.equals("10031212") || sapId.equals("10004389") || sapId.equals("10017944") || sapId.equals("10006990") || sapId.equals("10002574") || sapId.equals("10027765") || sapId.equals("10012231") || sapId.equals("10004062") || sapId.equals("10028230") || sapId.equals("10007177") || sapId.equals("10020341") || sapId.equals("10001853") || sapId.equals("10028837") || sapId.equals("10025181") || sapId.equals("10012684") || sapId.equals("10023055") || sapId.equals("10026099") || sapId.equals("10026195") || sapId.equals("10018044") || sapId.equals("10022868") || sapId.equals("10017274") || sapId.equals("10029226") || sapId.equals("10024685") || sapId.equals("10023393") || sapId.equals("10026278") || sapId.equals("10000221") || sapId.equals("10019407") || sapId.equals("10022040") || sapId.equals("10020601") || sapId.equals("10015586") || sapId.equals("10002692") || sapId.equals("10012496") || sapId.equals("10022332") || sapId.equals("10030441") || sapId.equals("10002239") || sapId.equals("10019796") || sapId.equals("10026360") || sapId.equals("10028682") || sapId.equals("10000308") || sapId.equals("10002194") || sapId.equals("10003032") || sapId.equals("10030977") || sapId.equals("10022634") || sapId.equals("10022816") || sapId.equals("10020003") || sapId.equals("10001874") || sapId.equals("10011549") || sapId.equals("10022405") || sapId.equals("10020011") || sapId.equals("10002235") || sapId.equals("10028689") || sapId.equals("10026325") || sapId.equals("10027839") || sapId.equals("10002590") || sapId.equals("10014563") || sapId.equals("10019478") || sapId.equals("10024866") || sapId.equals("10026725") || sapId.equals("10022594") || sapId.equals("10025212") || sapId.equals("10024372") || sapId.equals("10000437") || sapId.equals("10000279") || sapId.equals("10030022") || sapId.equals("10000511") || sapId.equals("10032234") || sapId.equals("10031063") || sapId.equals("10031393") || sapId.equals("10006725") || sapId.equals("10029183") || sapId.equals("10003022") || sapId.equals("10018345") || sapId.equals("10024146") || sapId.equals("10030708") || sapId.equals("10031040") || sapId.equals("10007132") || sapId.equals("10002188") || sapId.equals("10024145") || sapId.equals("10030202") || sapId.equals("10016662") || sapId.equals("10031204") || sapId.equals("10028739") || sapId.equals("10000545") || sapId.equals("10024820") || sapId.equals("10005272") || sapId.equals("10018379") || sapId.equals("10030839") || sapId.equals("10018462") || sapId.equals("10027459") || sapId.equals("10002290") || sapId.equals("10028673") || sapId.equals("10031386") || sapId.equals("10012822") || sapId.equals("10002204") || sapId.equals("10028836") || sapId.equals("10002228") || sapId.equals("10000263") || sapId.equals("10016957") || sapId.equals("10026450") || sapId.equals("10000408") || sapId.equals("10020296") || sapId.equals("10027820") || sapId.equals("10012740") || sapId.equals("10023020") || sapId.equals("10002438") || sapId.equals("10028312") || sapId.equals("10002203") || sapId.equals("10002402") || sapId.equals("10001275") || sapId.equals("10020504") || sapId.equals("10029104") || sapId.equals("10030745") || sapId.equals("10029090") || sapId.equals("10002846") || sapId.equals("10012715") || sapId.equals("10000240") || sapId.equals("10022432") || sapId.equals("10022324") || sapId.equals("10004815") || sapId.equals("10022968") || sapId.equals("10020178") || sapId.equals("10013950") || sapId.equals("10018201") || sapId.equals("10001637") || sapId.equals("10013981") || sapId.equals("10000053") || sapId.equals("10017846") || sapId.equals("10029779") || sapId.equals("10010117") || sapId.equals("10017986") || sapId.equals("10017452") || sapId.equals("10031200") || sapId.equals("10032224") || sapId.equals("10026575") || sapId.equals("10031867") || sapId.equals("10002928") || sapId.equals("10024858") || sapId.equals("10019641") || sapId.equals("10024682") || sapId.equals("10002269") || sapId.equals("10012806") || sapId.equals("10016573") || sapId.equals("10012823") || sapId.equals("10000257") || sapId.equals("10000492") || sapId.equals("10023523") || sapId.equals("10000288") || sapId.equals("10000458") || sapId.equals("10004063") || sapId.equals("10017670") || sapId.equals("10024758") || sapId.equals("10031208") || sapId.equals("10022232") || sapId.equals("10023860") || sapId.equals("10000091") || sapId.equals("10022996") || sapId.equals("10000223") || sapId.equals("10019018") || sapId.equals("10016659") || sapId.equals("10028928") || sapId.equals("10029857") || sapId.equals("10025093") || sapId.equals("10020712") || sapId.equals("10014516") || sapId.equals("10025009") || sapId.equals("10004734") || sapId.equals("10014398") || sapId.equals("10004789") || sapId.equals("10015491") || sapId.equals("10026999") || sapId.equals("10023281") || sapId.equals("10022933") || sapId.equals("10028938") || sapId.equals("10018419") || sapId.equals("10004733") || sapId.equals("10018130") || sapId.equals("10031205") || sapId.equals("10024684") || sapId.equals("10031366") || sapId.equals("10002006") || sapId.equals("10007256") || sapId.equals("10027723") || sapId.equals("10003199") || sapId.equals("10012221") || sapId.equals("10026418") || sapId.equals("10015237") || sapId.equals("10030625") || sapId.equals("10029012") || sapId.equals("10022084") || sapId.equals("10028945") || sapId.equals("10003996") || sapId.equals("10015745") || sapId.equals("10028370") || sapId.equals("10012818") || sapId.equals("10026356") || sapId.equals("10017438") || sapId.equals("10029735") || sapId.equals("10026410") || sapId.equals("10016460") || sapId.equals("10032481") || sapId.equals("10032496") || sapId.equals("10031812") || sapId.equals("10033060") || sapId.equals("10033177") || sapId.equals("10032760") || sapId.equals("10032644") || sapId.equals("10033533") || sapId.equals("10033060") || sapId.equals("10034856") || sapId.equals("10034669") || sapId.equals("10034545") || sapId.equals("10035153") || sapId.equals("10032657") || sapId.equals("10032657") || sapId.equals("10035329") || sapId.equals("10033056") ))) {
			%><table border = "0" cellspacing="0" cellpadding="3" width = "100%">
		<tr height = "70px"><td colspan = "100%">&nbsp;</td></tr>
	<tr>
		<td width = "20%"  align = "right"><img src="../images/Icon1.png"  /></td>
		<td class = "bigBlueNormal" >Info :	</td>
	</tr>
	
	<tr>
		<td width = "20%"  align = "right">&nbsp;</td>
		<td class = "normalBig" >
			Please note: Employees for BCCL – RESPONSE are requested to use SMT Tool to login in their Sales Calls to claim FSA.
		</td>
	</tr>
		
</table><%
				} else{%>
   		<table width="100%" border="0" cellspacing="0" cellpadding="0">
         <form name="frmcreaterequest" method="post">
		 <input type="hidden" name="noOfRows" value="<%=noOfRows%>">
		 
			<tr>
				<td colspan="100%" align="center" class="bold" height="3">&nbsp;</td>
			</tr>
           	<tr>
				<td colspan="100%">
					<table width="100%" border = "0">
					<tr>
			<!-- <td width="5%" align="right" class="bold" height="20"> </td> -->
					 <td width="50%" align="left" class="bold" height="20">Month & Year:
					<select id="selectMonth" name="selectMonth" class="normal" onchange="changeDate()">
					<%= HtmlUtil.getMonthList(String.valueOf(today.get(Calendar.MONTH)+1)) %>
					</select>
					<select id="selectYear" name="selectYear" class="normal" onchange="changeDate()">
					<%= HtmlUtil.getYearList(2008,2100,today.get(Calendar.YEAR),"asc") %>
					</select>
					</td>

					<td width="50%" align="left" class="bold" height="20"> SUBMIT TO
					 <select name="email" class = "normal" id = "email">
					 <option value="" selected>Select Authority</option>
<%
		
					approvers = rmdAllowanceClaimDetails.getApprovers(companyCode, locationCode, deptGroup,timescapeUserOId);
					//out.println(approvers.size());
					String approverName = "";
					String[] approver =null;

					for(int ii=0; ii < approvers.size( ); ii++){
					approver = (String[ ]) approvers.get(ii);
                    approverName = approver[0].substring(0,approver[0].indexOf("@"));
%>
					<option value="<%=approver[0]%>"><%=approverName%></option>
										
<%
					}
%>
					</select>
					</td>
					
					</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td colspan="100%">
				<table width="100%">	 
				<tr colspan="100" bgcolor="#CCCCCC" align="left">
				<td class="boldsmall" width="2%" height="10" align="center">&nbsp;DATE</td>
				<td class="boldsmall" width="2%" height="10" align="center"> DAY</td>
				<td class="boldsmall" width="1%" height="10" align="center"> SELECT/DESELECT&nbsp; 
				<input type = "checkbox" name = "userCheckBox" 
				onClick="if(this.checked){javascript:selectAll(<%=noOfRows%>)}
						 else{javascript:noSelection(<%= noOfRows%>)}" checked>
				</td>
				<td class="boldsmall" width="2%" height="10" align="center"> ALLOWANCE TYPE</td> 
				<td class="boldsmall" width="3%" height="10" align="center"> REMARKS / CLIENT VISIT DETAILS</td> 

				</tr>
				</table>
				<table width="100%" border="0" cellspacing="1" cellpadding="0" align="center">

				<tr align="left" >
				<td class="normal" height="5"><block type="spacer" height="5"></td>
				</tr>

<%
			String [] weekDays = {"Day", "Sun" , "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
			String [] monthList = {"Month", "January" , "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
			
			for(int ii=0; ii<noOfRows; ii++)
				{ 
%>
				<tr style="border-bottom: solid";>
				<td width="20%" align="left" >
				&nbsp;&nbsp;<select id="fromDay" name="fromDay<%=ii%>" class="normal" disabled=disabled  onchange="getWeekDay(<%=ii%>)">
				<%= HtmlUtil.getDayList("1") %>
				</select>

				<input type="text" id="fromMonth" name="fromMonth<%=ii%>" class="normal" size="6" value="<%=monthList[(today.get(Calendar.MONTH)+1)]%>" onchange="getWeekDay(<%=ii%>)" readOnly>
				<input type="text" id="fromYear" name="fromYear<%=ii%>" class="normal" size="3" value="<%=String.valueOf(today.get(Calendar.YEAR))%>" onchange="getWeekDay(<%=ii%>)" readOnly>
				</td>

				<td width="20%" align="center">
				<input type="text" id="weekday" name="weekday<%=ii%>" size="8" class="normal" maxlength="10" value="<%=weekDays[today.get(Calendar.DAY_OF_WEEK)]%>" readOnly/>
				</td>
				<td width="10%" align="center">
			    <input type="checkbox" id="particularsChk" name="particularsChk<%=ii%>"  checked />
                </td>

				
				<td width="20%" align="center"> 
					<select name="type<%=ii%>" id = "type" class="normal">
					<option value="0">Select Type</option>
					<option value ="Field">Field Allowance</option>
					<option value ="Night">Night Allowance</option>
					<!-- <option value ="Depot">Depot Allowance</option> -->
					</select>
				</td>

				<td width="30%" align="right" class="normal">
					<textarea name="visitDetails<%=ii%>" id="visitDetails<%=ii%>" cols="30" rows="2"  onKeyDown="return imposeMaxLength(event, this, 100, 'reqLen<%=ii%>');" onKeyUp="return imposeMaxLength(event, this, 100, 'reqLen<%=ii%>');" class="normal"></textarea><input readonly type="text"style="width: 27px; height: 20px;" name="reqLen" id="reqLen<%=ii%>" size="2" maxlength="2" value="100" >char left&nbsp;&nbsp;
                </td>
			</tr>
			<tr>
				 <td height="1"></td>
			 </tr>
			 <tr>
				 <td height="1" colspan="9" align="left" valign="middle" bgcolor="#cccccc"><img src="../images/spacer.gif" width="1" height="1" /></td>
			 </tr>
			<tr>
				 <td height="1"></td>
			 </tr>
<%
		}
		
%>
			<!-- <tr>
				<td width="100%"align="center"colspan="7">
				<a href="javascript:validate(<%=todayDay%>)"><img src="../images/but_preview.gif" border="0"><a/>
				&nbsp;&nbsp;
				<a href="javascript:clear( )"><img src="../images/but_reset.gif" border="0"></a>
				</td>
			</tr> -->

			<tr>
				<td width="100%" align="center" colspan="7">
					<input type="button" value=" Preview " height="20" onclick = "javascript:validate(<%=todayDay%>)"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button"  value=" Reset " onclick= "javascript:clear( );" />
				</td>
			</tr>

	<input type="hidden" name="currentSysdate" value="<%=dayMonYear%>">

        </form>
    </table>
</body>

<% }
	%>
			
</html>