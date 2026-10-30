<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<html>
<body>
<form name ="remarksSubmit">
<%
		long userOId		    = Long.parseLong(request.getParameter("userOId"));
		String userOId1		    = (String)(request.getParameter("userOId"));

		//long priceid		= Long.parseLong(request.getParameter("priceId"));
		String priceid		= (String) request.getParameter("priceId");

		String approverType = request.getParameter("approverType");

		String remarks      = request.getParameter("remarks");
		String statusType   = "C";

		String buyerEmailaddress1 = request.getParameter("buyerEmailaddress");

		remarks             = Utility.replaceQuoteOracle(remarks);
		boolean mailStatus = false;
		String content="" ;
		String content1="";
		String apprv1 [] = null ;
		String apprv [] = null ;

		//System.out.println("userOId--"+userOId);
		//System.out.println("priceid--"+priceid);
		//System.out.println("remarks--"+remarks);
		//System.out.println("statusType--"+statusType);

		boolean	status	= priceApprovalWebController.insertRemarksNpCan(userOId,priceid, remarks, statusType);
		//boolean status1	= priceApprovalWebController.cancelParNpAdmin(adminHash);

		
		//boolean status2 = priceapprovalWebController.changeVendorTableStatus(tOId, priceid);

		//boolean	status3	= priceapprovalWebController.changeUserTableStatus(tOId, priceid); 	
//out.println(status);
/*	System.out.println(tOId);
	System.out.println(priceid);
	System.out.println(approverType);
	System.out.println(remarks); */

	ArrayList vStatus	=  new ArrayList();
		vStatus 			=	priceApprovalWebController.viewStatusnp(userOId1,priceid);
		ArrayList vStatus2	=  new ArrayList();
		vStatus2 			=	priceApprovalWebController.viewApproverNp(priceid);
	
		//String pageType		= request.getParameter("viewSAB"); 


		String[] data3      = (String [])vStatus2.get(0);
		String[] data1      = (String [])vStatus.get(0);


        String priceId			        =  data1[0];
        String vendorName		        =  data1[1];
        String category			        =  data1[2];
        String mill			            =  data1[3];
        String paymentTerms		        =  data1[4];
        String sourcing			        =  data1[5];
        String quantity			        =  data1[6];
        String deliveryIn		        =  data1[7];
        String quality			        =  data1[8];
        String gsm			            =  data1[9];
        String thisLotcfr		        =  data1[10];
        String invoicePrice		        =  data1[11];
        String risi		                =  data1[12];
        String aopReceiptPrice		    =  data1[13];
        String aopReceiptForEx  	    =  data1[14];
        String aopDealValue       	    =  data1[15];
        String annualBudget		        =  data1[16];
        String contractedTonsytd	    =  data1[17];
        String currentQuarter   	    =  data1[18];
        String balanceToBought		    =  data1[19];
        String otherRemaks		        =  data1[20];
        String marketEvent		        =  data1[21];
        String ap1			            =  data1[22];
        String ap2			            =  data1[23];
        String ap3			            =  data1[24];
        String ap4			            =  data1[25];
        String ap5			            =  data1[26];
        String ap6			            =  data1[27];
        String STATUS			        =  data1[28];
        String totalPrice_unitRate	    =  data1[29];
        String totalPrice_rsperTon	    =  data1[30];
        String totalPrice_spend		    =  data1[31];
        String customsDuty_unitRate	    =  data1[32];
        String customsDuty_rsperTon	    =  data1[33];
        String customsDuty_spend	    =  data1[34];
        String freight_unitRate		    =  data1[35];
        String freight_rsperTon		    =  data1[36];
        String freight_spend		    =  data1[37];
        String insurance_unitRate	    =  data1[38];
        String insurance_rsperTon	    =  data1[39];
        String insurance_spend		    =  data1[40];
        String totalActualCost_unitRate =  data1[41];
        String totalActualCost_rsperTon =  data1[42];
        String totalActualCost_spend	=  data1[43];
        String budgetvsActual_unitRate  =  data1[44];
        String quarterOpeningQuantity	=  data1[45];
        String quarterOpeningDays	    =  data1[46];
        String expectedReceiptsQuantity     =  data1[47];
        String expectedReceiptsDays	        =  data1[48];
        String estimatedCons1   	        =  data1[49];
        String estimatedCons2   	        =  data1[50];
        String quarterEnd1         	        =  data1[51];
        String quarterEnd2         	        =  data1[52];

        String AP1Name                      =  data1[53];
        String AP2Name                      =  data1[54];
        String AP3Name                      =  data1[55];
        String AP4Name                      =  data1[56];
        String AP5Name                      =  data1[57];
        String AP6Name                      =  data1[58];
        String CREATEDBY                    =  data1[62];
        String creatorEmailid               =  data1[63];
        String origin                       =  data1[66];

        String AP1_STATUS					=   data3[0]; 
        String AP1_DATE						=   data3[1]; 
        String AP2_STATUS					=   data3[2]; 
        String AP2_DATE						=   data3[3]; 
        String AP3_STATUS					=   data3[4]; 
        String AP3_DATE						=   data3[5]; 
        String AP4_STATUS					=   data3[6]; 
        String AP4_DATE						=   data3[7]; 
        String AP5_STATUS					=   data3[8]; 
        String AP5_DATE						=   data3[9]; 
        String AP6_STATUS					=   data3[10]; 
        String AP6_DATE						=   data3[11]; 
session.setAttribute("reviewersComments",remarks);

%>
<%
if(status == true ){
	content  =   " <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\"> " 
											+ " <tr><td class=\"normal\" colspan = \"3\" align = \"left\"><h6><font size='2'>The following Newsprint PAR has been Cancelled. </font></h6> </td> </tr><br><br>";

					content  +=			"<tr><td  class=\"normal\" colspan = \"0\" align = \"left\"> <b>Sanction number </b> </td>\n\n <br>";
					content  += " <td class=\"normal\" colspan = \"2\"> : "+priceid+" </td></tr><br>\n\n";

					content  += " <tr class=\"normal\"><td  colspan = \"0\" align = \"left\"> <b>Cancelled by </b>  </td>\n\n <br> ";
					//content  += " <td class=\"normal\" colspan = \"2\"> : "+buyerEmailaddress1+"</td></tr><br>\n\n";
					content  += " <td class=\"normal\" colspan = \"2\"> : "+emailId+"</td></tr><br>\n\n";

					content  += " <tr><td  class=\"normal\" colspan = \"0\" align = \"left\" valign = \"bottom\"> <b>Reviewers comments</b> </td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+remarks+" </td></tr><br>\n\n";

                    content  += " <tr><td  class=\"normal\" colspan = \"0\" align = \"left\" valign = \"bottom\"> <b>Vendor </b> </td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+vendorName+" </td></tr><br>\n\n";

                    content  += " <tr><td class=\"normal\" colspan = \"0\" align = \"left\" valign = \"bottom\"> <b>Mill</b>  </td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+mill+" </td></tr><br>\n\n";

                    content  += " <tr><td class=\"normal\" colspan = \"0\" align = \"left\" valign = \"bottom\"><b>Grade</b>  </td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+quality+"&nbsp;"+gsm+" </td></tr><br>\n\n";

                    content  += " <tr><td class=\"normal\" colspan = \"0\" align = \"left\" valign = \"bottom\"> <b>Quantity (in MT)</b>  </td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+quantity+"</td></tr><br>\n\n";

                    content  += " <tr><td class=\"normal\" colspan = \"0\" align = \"left\" valign = \"bottom\"> <b>Price</b>  </td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+invoicePrice+"</td></tr><br>\n\n";

                    content  += " <tr><td  class=\"normal\" colspan = \"0\" align = \"left\" valign = \"bottom\"> <b>Delivery in </b> </td>\n\n <br>";
                    content  += " <td class=\"normal\" colspan = \"2\"> : "+deliveryIn+"</td></tr><br>\n\n";


					content  += " <tr><td class=\"normal\" colspan = \"0\" align = \"left\"><b>Price Approval Link on Timescape </td>\n\n <br>";

					//content  += "<td class=\"normal\" colspan = \"2\"> : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://97ad218f174cb8f381cc20394841cc2b </td></tr><br>\n\n";
					content  += "<td class=\"normal\" colspan = \"2\"> : https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://0a7ef33267e080180c22a67a7e74966d </td></tr><br>\n\n";

					content  +=  " <tr><td class=\"normal\" align = \"left\"><br><br>Regards,<br> Timescape Admin </td></tr></table>";

String	htmlStr ="<html>" + "\n" 
						+ "<head>" + "\n" 
						+ "	<title>TAM Leads</title>" + "\n" 
						+ "	<style>" + "\n" 
						+ "		.bold {FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
						+ "		.normal {FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
						+ "		.bluenormal {FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: #6097cf; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
						+ "		.rednormal {FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: #ff0000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
						+ "	</style>"
						+ "</head>" 
						+ "<body>" 
						+ "	<form name = \"frmMessage\" method = \"post\">" 
                        + "     <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
                        + "			<tr>" 
                        + "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price1.jpg\" border = \"0\"></td>" 
                        + "		    </tr>" 
                        + "			<tr>" 
                        + "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/images/header_price2.jpg\" border = \"0\"></td>" 
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
						+ "								<div align = \"left\">" + content + "</div>" 
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


	   		mailStatus =  priceApprovalWebController.sendIndividualMailNp(apprv[0],htmlStr,priceid,creatorEmailid);    
	   		//mailStatus =  priceApprovalWebController.sendIndividualMailNp(emailId,htmlStr,priceid,buyerEmailaddress1);    
			
			//mailStatus =  priceApprovalWebController.sendIndividualMailNp("sachin.mehta@timesgroup.com"/*apprv0[0]*/,htmlStr,	priceid,buyerEmailaddress1);
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<tr><td colspan="2" align="center"><span class="normal">You Have successfully Cancelled the PAR <%=priceid%></td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="../indexnp.jsp" class="normal"><b>here</b></a> to check the status</td></tr>
</table>



<%}else{
%>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td colspan="2" align="center"><span class="normal">Sorry there was an Error while posting your Remark.</td><tr>
 </table>
<%}%>
</form>
</body>
</html>	