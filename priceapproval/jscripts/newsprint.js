function getnpDetails()
{
	//alert("JJJJJ");
	var error = "";
	var flag  = 0;

	var frmObj2 = document.priceApprovalMain;
	var sanctionedRefType = document.getElementById('sanctionedRefType').value;
	var refNumber = document.getElementById('refNumber').value;
	var dateOfApproval = document.getElementById('dateOfApproval').value;
	//alert("dateOfApproval"+dateOfApproval);

	var fields = dateOfApproval.split(/-/);
	var newDate = fields[0];
	var newMonth = fields[1];

	//alert("name---"+newDate);
	//alert("street---"+newMonth);

	/*if (newMonth=="JAN" || newMonth=="APR" || newMonth=="JUL" || newMonth=="OCT")
	{
		document.priceApprovalMain.estimatedcons2.value = "90";
	}else if (newMonth=="MAY" || newMonth=="AUG" || newMonth=="NOV")
	{
		document.priceApprovalMain.estimatedcons2.value = "60";
	}else if (newMonth=="MAR" || newMonth=="JUN" || newMonth=="SEP" || newMonth=="DEC")
	{
		document.priceApprovalMain.estimatedcons2.value = "30";
	}else if (newMonth=="FEB")
	{
		document.priceApprovalMain.estimatedcons2.value = "58";
	}*/


	if (newMonth=="JAN")
	{
		document.priceApprovalMain.estimatedcons2.value = "90";
	}else if (newMonth=="FEB")
	{
		document.priceApprovalMain.estimatedcons2.value = "59";
	}else if (newMonth=="MAR")
	{
		document.priceApprovalMain.estimatedcons2.value = "31";
	}else if (newMonth=="APR")
	{
		document.priceApprovalMain.estimatedcons2.value = "91";
	}else if (newMonth=="MAY")
	{
		document.priceApprovalMain.estimatedcons2.value = "61";
	}else if (newMonth=="JUN")
	{
		document.priceApprovalMain.estimatedcons2.value = "30";
	}else if (newMonth=="JUL")
	{
		document.priceApprovalMain.estimatedcons2.value = "92";
	}else if (newMonth=="AUG")
	{
		document.priceApprovalMain.estimatedcons2.value = "61";
	}else if (newMonth=="SEP")
	{
		document.priceApprovalMain.estimatedcons2.value = "30";
	}else if (newMonth=="OCT")
	{
		document.priceApprovalMain.estimatedcons2.value = "92";
	}else if (newMonth=="NOV")
	{
		document.priceApprovalMain.estimatedcons2.value = "61";
	}else if (newMonth=="DEC")
	{
		document.priceApprovalMain.estimatedcons2.value = "30";
	}

	
	
	if(document.priceApprovalMain.sanctionedRefType.value == 0)
	{
		error += "Please Select Sanctioned Reference Type\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.sanctionedRefType.focus();
				flag = 1;
			}
	}

	if(isEmpty(document.priceApprovalMain.refNumber.value.length))
	{
		error += "Fill Reference Number\n";
		document.priceApprovalMain.refNumber.focus();
		flag = 1;
	}


	if(isEmpty(document.priceApprovalMain.dateOfApproval.value.length))
	{
		error += "Fill Date of Approval\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.dateOfApproval.focus();
				flag = 1;
			}
	}
	
	if(error!="")
	{
		alert(error);
	}
	else
	{
		randome = Math.random();
		$("#showRequests").show();
		//loadFragment1('createrequestnp.jsp?randome='+randome, 'showRequests', 'Showing All Fields');
	}
		
}

//changes made on 18/03/2015 Anagha
function validateForm1(queryType)
	{
		//alert("fdg");
		var error = "";
		var flag  = 0;
		origin				=			document.priceApprovalMain.origin.value;
		vendorName			=			document.priceApprovalMain.vendorName.value;
		mill				=			document.priceApprovalMain.mill.value;
		paymentTerms		=			document.priceApprovalMain.paymentTerms.value;
		sourcing			=			document.priceApprovalMain.sourcing.value;
		quantity			=			document.priceApprovalMain.quantity.value;
		deliveryIn			=			document.priceApprovalMain.deliveryIn.value;
		quality				=			document.priceApprovalMain.quality.value;
		gsm					=			document.priceApprovalMain.gsm.value;
		thisLot				=			document.priceApprovalMain.thisLot.value;
		invoicePrice		=			document.priceApprovalMain.invoicePrice.value;
		risi				=			document.priceApprovalMain.risi.value;
		aopreceiptprice		=			document.priceApprovalMain.aopreceiptprice.value;
		aopreceiptforex		=			document.priceApprovalMain.aopreceiptforex.value;
		aopdealvalue		=			document.priceApprovalMain.aopdealvalue.value;
		totalprice1			=			document.priceApprovalMain.totalprice1.value;
		totalprice2			=			document.priceApprovalMain.totalprice2.value;
		totalprice3			=			document.priceApprovalMain.totalprice3.value;
		cusduty1			=			document.priceApprovalMain.cusduty1.value;
		cusduty2			=			document.priceApprovalMain.cusduty2.value;
		cusduty3			=			document.priceApprovalMain.cusduty3.value;
		freight1			=			document.priceApprovalMain.freight1.value;
		freight2			=			document.priceApprovalMain.freight2.value;
		freight3			=			document.priceApprovalMain.freight3.value;
		insurance1			=			document.priceApprovalMain.insurance1.value;
		insurance2			=			document.priceApprovalMain.insurance2.value;
		insurance3			=			document.priceApprovalMain.insurance3.value;
		//totalcost1			=			document.priceApprovalMain.totalcost1.value;
		totalcost2			=			document.priceApprovalMain.totalcost2.value;
		totalcost3			=			document.priceApprovalMain.totalcost3.value;
		budact1				=			document.priceApprovalMain.budact1.value;
		quainv1				=			document.priceApprovalMain.quainv1.value;
		quainv2				=			document.priceApprovalMain.quainv2.value;
		expectedreceipts1	=			document.priceApprovalMain.expectedreceipts1.value;
		expectedreceipts2	=			document.priceApprovalMain.expectedreceipts2.value;
		estimatedcons1		=			document.priceApprovalMain.estimatedcons1.value;
		estimatedcons2		=			document.priceApprovalMain.estimatedcons2.value;
		quarterend1			=			document.priceApprovalMain.quarterend1.value;
		quarterend2			=			document.priceApprovalMain.quarterend2.value;
		annualBudget		=			document.priceApprovalMain.annualBudget.value;
		contractedTons		=			document.priceApprovalMain.contractedTons.value;
		currentquarter		=			document.priceApprovalMain.currentquarter.value;
		balance				=			document.priceApprovalMain.balance.value;
		otherRemarks		=			document.priceApprovalMain.otherRemarks.value;
		marketEvents		=			document.priceApprovalMain.marketEvents.value;
		bussinessAndCommercial	=	    document.priceApprovalMain.bussinessAndCommercial.value;
		ceo					=			document.priceApprovalMain.ceo.value;
		director		    =		    document.priceApprovalMain.director.value;
		coo		            =			document.priceApprovalMain.coo.value;
		epSupplyChain		=			document.priceApprovalMain.epSupplyChain.value;
		md		            =			document.priceApprovalMain.md.value;

		if(document.priceApprovalMain.origin.value=="0")
		{
			error += "Please select Origin \n ";
			if(parseInt(flag)==0)
					{
						document.priceApprovalMain.origin.focus();
						flag = 1;
					}
		}

		if(isEmpty(document.priceApprovalMain.vendorName.value.length))
		{
			     error += "Fill Vendor Name \n";
					if(parseInt(flag)==0)
					{
						document.priceApprovalMain.vendorName.focus();
						flag = 1;
					}
		}
		if(isEmpty(document.priceApprovalMain.mill.value.length))
		{
			     error += "Fill Mill \n";
				 if(parseInt(flag)==0)
				{
						document.priceApprovalMain.mill.focus();
						flag = 1;
				}
		}
		if(isEmpty(document.priceApprovalMain.paymentTerms.value.length))
		{
			     error += "Fill Payment Terms \n";
				  if(parseInt(flag)==0)
				  {
				      document.priceApprovalMain.paymentTerms.focus();
					  flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.sourcing.value.length))
		{
			     error += "Fill Sourcing \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.sourcing.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.quantity.value.length))
		{
			     error += "Fill Quantity \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.quantity.focus();
						flag = 1;
				  }
		}
		
		if(isEmpty(document.priceApprovalMain.deliveryIn.value.length))
		{
			     error += "Fill Delivery  \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.deliveryIn.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.quality.value.length))
		{
			     error += "Fill Quality  \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.quality.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.gsm.value.length))
		{
			     error += "Fill GSM  \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.gsm.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.thisLot.value.length))
		{
			     error += "Fill This Lot  \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.thisLot.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.invoicePrice.value.length))
		{
			     error += "Fill Invoice Price  \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.invoicePrice.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.risi.value.length))
		{
			     error += "Fill RISI (CFR,India)  \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.risi.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.aopreceiptprice.value.length))
		{
			     error += "Fill AOP Receipt Price \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.aopreceiptprice.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.aopreceiptforex.value.length))
		{
			     error += "Fill AOP Receipt ForEx \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.aopreceiptforex.focus();
						flag = 1;
				  }
		}
		M=aopreceiptforex.indexOf(".");
		if(M!=-1){
			val=aopreceiptforex.substring(M+1);
			if(val.length>2){
					error +="AOP Receipt ForEx should contain only 2 digit after decimal point!\n";
					document.priceApprovalMain.aopreceiptforex.focus();
				}
		}


			if(aopdealvalue.length>15)
				{
					error +="AOP Deal value calculation should not be greater than 15 digits\n";
				if(parseInt(flag)==0)
					{
						document.priceApprovalMain.aopdealvalue.focus();
						flag = 1;
					}
				}
		if(isEmpty(document.priceApprovalMain.totalprice1.value.length))
		{
			     error += "Fill Exchange Rate Unit Rate  \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.totalprice1.focus();
						flag = 1;
				  }
		}

	E=totalprice1.indexOf(".");
		if(E!=-1){
			val=totalprice1.substring(E+1);
			if(val.length>2){
					error +="Exchange Rate should contain only 2 digit after decimal point!\n";
					document.priceApprovalMain.totalprice1.focus();
				}
		}

		if(totalprice2.length>15)
		{
			error +="Exchange Rate Rs. per ton calculation should not be greater than 15 digits\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.totalprice2.focus();
				flag = 1;
			}
		}

		if(totalprice3.length>15)
		{
			error +="Exchange Rate Spend(Rs Lakh) calculation should not be greater than 15 digits\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.totalprice3.focus();
				flag = 1;
			}
		}		
		if(isEmpty(document.priceApprovalMain.cusduty1.value.length))
		{
			     error += "Fill Customs Duty / Taxes Unit Rate   \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.cusduty1.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.cusduty2.value.length))
		{
			     error += "Fill Customs Duty / Taxes Rs. per ton   \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.cusduty2.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.cusduty3.value.length))
		{
			     error += "Fill Customs Duty / Taxes Spend(Rs Lakh)   \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.cusduty3.focus();
						flag = 1;
				  }
		}

		I=cusduty3.indexOf(".");
		if(I!=-1){
			val=cusduty3.substring(I+1);
			if(val.length>2){
					error +="Custom Duty/Taxes Spend RS Lakh should contain only 2 digit after decimal point!\n";
									 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.cusduty3.focus();
						flag = 1;
				  }
				}
		}
		
		if(isEmpty(document.priceApprovalMain.freight1.value.length))
		{
			     error += "Logistics cost Unit Rate   \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.freight1.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.freight2.value.length))
		{
			     error += "Logistics cost Rs. per ton   \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.freight2.focus();
						flag = 1;
				  }
		}

		if(freight3.length>15)
		{
			error +="Logistics cost Spend(Rs Lakh) calculation should not be greater than 15 digits\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.freight3.focus();
				flag = 1;
			}
		}		
		if(isEmpty(document.priceApprovalMain.insurance1.value.length))
		{
			     error += "Fill Insurance Unit Rate   \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.insurance1.focus();
						flag = 1;
				  }
		}

		N=insurance1.indexOf(".");
		if(N!=-1){
			val=insurance1.substring(N+1);
			if(val.length>3){
					error +="Insurance unit rate should contain only 3 digit after decimal point!\n";
					if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.insurance1.focus();
						flag = 1;
				  }
				}
		}

		if(insurance2.length>15)
		{
			error +="Insurance Rs. per ton calculation should not be greater than 15 digits\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.insurance2.focus();
				flag = 1;
			}
		}

		if(insurance3.length>15)
		{
			error +="Insurance Spend(Rs Lakh) calculation should not be greater than 15 digits\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.insurance3.focus();
				flag = 1;
			}
		}		
	/*	if(isEmpty(document.priceApprovalMain.totalcost1.value.length))
		{
			     error += "Fill Total Actual cost Unit Rate   \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.totalcost1.focus();
						flag = 1;
				  }
		}*/

		if(totalcost2.length>15)
		{
			error +="Actual cost Rs. per ton calculation should not be greater than 15 digits\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.totalcost2.focus();
				flag = 1;
			}
		}

		if(totalcost3.length>15)
		{
			error +="Actual cost Spend(Rs Lakh) calculation should not be greater than 15 digits\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.totalcost3.focus();
				flag = 1;
			}
		}		

		if(budact1.length>15)
		{
			error +="Budget VS. Actual calculation should not be greater than 15 digits\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.budact1.focus();
				flag = 1;
			}
		}
	/*	if(isEmpty(document.priceApprovalMain.budact2.value.length))
		{
			     error += "Fill Budget VS. Actual Rs. per ton     \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.budact2.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.budact3.value.length))
		{
			     error += "Fill Budget VS. Actual Spend(Rs Lakh)     \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.budact3.focus();
						flag = 1;
				  }
		}
		*/
		if(isEmpty(document.priceApprovalMain.quainv1.value.length))
		{
			     error += "Aug Opening Inventory Quantity   \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.quainv1.focus();
						flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.quainv2.value.length))
		{
			     error += "Aug Opening Inventory Invetory Days   \n";
				 if(parseInt(flag)==0)
				  {
						document.priceApprovalMain.quainv2.focus();
						flag = 1;
				  }
		}
		
		if(isEmpty(document.priceApprovalMain.expectedreceipts1.value.length))
		{
			     error += "Fill Expected Receipts For Quarter Quantity   \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.expectedreceipts1.focus();
					flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.expectedreceipts2.value.length))
		{
			     error += "Fill Expected Receipts For Quarter Days   \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.expectedreceipts2.focus();
					flag = 1;
				  }
		}
		
		if(isEmpty(document.priceApprovalMain.estimatedcons1.value.length))
		{
			     error += "Fill Estimated cons. for balance of the quarter Quantity    \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.estimatedcons1.focus();
					flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.estimatedcons2.value.length))
		{
			     error += "Fill Estimated cons. for balance of the quarter Days   \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.estimatedcons2.focus();
					flag = 1;
				  }
		}
		
		if(isEmpty(document.priceApprovalMain.quarterend1.value.length))
		{
			     error += "Fill Expected Inventory At The End Of Quarter Quantity   \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.quarterend1.focus();
					flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.quarterend2.value.length))
		{
			     error += "Fill Expected Inventory At The End Of Quarter Days   \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.quarterend2.focus();
					flag = 1;
				  }
		}
/*		
		if(isEmpty(document.priceApprovalMain.earliercontracted1.value.length))
		{
			     error += "Fill Earlier Contracted Qty For Quarter Quantity    \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.earliercontracted1.focus();
					flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.earliercontracted2.value.length))
		{
			     error += "Fill Earlier Contracted Qty For Quarter Days    \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.earliercontracted2.focus();
					flag = 1;
				  }
		}
		
		if(isEmpty(document.priceApprovalMain.expcover1.value.length))
		{
			     error += "Fill Expected Total Cover Quantity    \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.expcover1.focus();
					flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.expcover2.value.length))
		{
			     error += "Fill Expected Total Cover Days     \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.expcover2.focus();
					flag = 1;
				  }
		}
		
		if(isEmpty(document.priceApprovalMain.currentcontarct1.value.length))
		{
			     error += "Fill Current contarct Quantity    \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.currentcontarct1.focus();
					flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.currentcontarct2.value.length))
		{
			     error += "Fill Current contarct Days    \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.currentcontarct2.focus();
					flag = 1;
				  }
		}*/
		
		if(isEmpty(document.priceApprovalMain.annualBudget.value.length))
		{
			     error += "Fill Annual Budget    \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.annualBudget.focus();
					flag = 1;
				  }
		}
		
		if(isEmpty(document.priceApprovalMain.contractedTons.value.length))
		{
			     error += "Fill Contracted tons till last Qtr   \n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.contractedTons.focus();
					flag = 1;
				  }
		}
		
		if(isEmpty(document.priceApprovalMain.currentquarter.value.length))
		{
			     error += "Fill Current quarter (incl. this deal)\n";
				 if(parseInt(flag)==0)
				  {
					document.priceApprovalMain.currentquarter.focus();
					flag = 1;
				  }
		}
		

		if(isEmpty(document.priceApprovalMain.otherRemarks.value.length))
		{
			     error += "Fill Other Remarks   \n";
				 if(parseInt(flag)==0)
				  {
				document.priceApprovalMain.otherRemarks.focus();
				flag = 1;
				  }
		}
		if(isEmpty(document.priceApprovalMain.marketEvents.value.length))
		{
			     error += "Fill Market Events   \n";
				 if(parseInt(flag)==0)
				  {
				document.priceApprovalMain.marketEvents.focus();
				flag = 1;
				  }
		}

//for loop fo offers add row
	counter					=	document.priceApprovalMain.count.value;

	for(i = 1; i<=counter; i++)
	{
		v = eval("document.priceApprovalMain.v"+i);
		vval = v.value;

		if(vval.length==0)
		{
			v.value = "NA";
		}

		c = eval("document.priceApprovalMain.c"+i);
		cval = c.value;

		if(cval.length==0)
		{
			c.value = "NA";
		}

		m = eval("document.priceApprovalMain.m"+i);
		mval = m.value;

		if(mval.length==0)
		{
			m.value = "NA";
		}

		g = eval("document.priceApprovalMain.g"+i);
		gval = g.value;

		if(gval.length==0)
		{
			g.value = "NA";
		}
		a = eval("document.priceApprovalMain.a"+i);
		aval = a.value;

		if(aval.length==0)
		{
			a.value = "NA";
		}
		oq = eval("document.priceApprovalMain.oq"+i);
		oqval = oq.value;

		if(oqval.length==0)
		{
			oq.value = "0";
		}

		op = eval("document.priceApprovalMain.op"+i);
		opval = op.value;

		if(opval.length==0)
		{
			op.value = "0";
		}

		fq = eval("document.priceApprovalMain.fq"+i);
		fqval = fq.value;

		if(fqval.length==0)
		{
			fq.value = "0";
		}

		fp = eval("document.priceApprovalMain.fp"+i);
		fpval = fp.value;

		if(fpval.length==0)
		{
			fp.value = "0";
		}
	}

//for loop fo comments add row

	counter1		=	document.priceApprovalMain.count2.value;

	for(i = 1; i<=counter1; i++)
	{
		vn = eval("document.priceApprovalMain.vn"+i);
		vnval = vn.value;

		if(vnval.length==0)
		{
			vn.value = "NA";
		}

		co = eval("document.priceApprovalMain.co"+i);
		coval = co.value;

		if(coval.length==0)
		{
			co.value = "NA";
		}

		mill = eval("document.priceApprovalMain.mill"+i);
		millval = mill.value;

		if(millval.length==0)
		{
			mill.value = "NA";
		}

		gr = eval("document.priceApprovalMain.gr"+i);
		grval = gr.value;

		if(grval.length==0)
		{
			gr.value = "NA";
		}
		qscr = eval("document.priceApprovalMain.qscr"+i);
		qscrval = qscr.value;

		if(qscrval.length==0)
		{
			qscr.value = "NA";
		}
		rem = eval("document.priceApprovalMain.rem"+i);
		remval = rem.value;

		if(remval.length==0)
		{
			rem.value = "NA";
		}

	}



		//alert("----"+document.priceApprovalMain.category.value);

		if(document.priceApprovalMain.aopdealvalue.value=="NaN")
		{
			document.priceApprovalMain.aopdealvalue.value = 0;
		}
		if(document.priceApprovalMain.totalprice2.value=="NaN")
		{
			document.priceApprovalMain.totalprice2.value = 0;
		}
		if(document.priceApprovalMain.totalprice3.value=="NaN")
		{
			document.priceApprovalMain.totalprice3.value = 0;
		}
		if(document.priceApprovalMain.freight3.value=="NaN")
		{
			document.priceApprovalMain.freight3.value = 0;
		}
		if(document.priceApprovalMain.insurance2.value=="NaN")
		{
			document.priceApprovalMain.insurance2.value = 0;
		}
		if(document.priceApprovalMain.insurance3.value=="NaN")
		{
			document.priceApprovalMain.insurance3.value = 0;
		}
		if(document.priceApprovalMain.totalcost2.value=="NaN")
		{
			document.priceApprovalMain.totalcost2.value = 0;
		}
		if(document.priceApprovalMain.totalcost3.value=="NaN")
		{
			document.priceApprovalMain.totalcost3.value = 0;
		}
		if(document.priceApprovalMain.budact1.value=="NaN")
		{
			document.priceApprovalMain.budact1.value = 0;
		}
		if(document.priceApprovalMain.quarterend1.value=="NaN")
		{
			document.priceApprovalMain.quarterend1.value = 0;
		}
		if(document.priceApprovalMain.balance.value=="NaN")
		{
			document.priceApprovalMain.balance.value = 0;
		}



/* validation for blank space and numeric values */
	if(document.priceApprovalMain.quantity.value.length>0)
	{
			if(isNaN(document.priceApprovalMain.quantity.value))
			{
					document.priceApprovalMain.quantity.focus();
					error += "Fill Numerics in Quantity \n";
			}
			if (document.priceApprovalMain.quantity.value.match(/\s/g,""))
			{	
				document.priceApprovalMain.quantity.focus();
				error +="Blank spaces are not allowed in Quantity \n";
			}
	}
	/*if(document.priceApprovalMain.aopdealvalue.value.length>0)
	{
			if(isNaN(document.priceApprovalMain.aopdealvalue.value))
			{
					document.priceApprovalMain.aopdealvalue.focus();
					error += "Fill Numerics in AOP Deal value \n";
			}
	}*/

	//Price Built-Up
	if(document.priceApprovalMain.totalprice1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.totalprice1.value))
		{
				document.priceApprovalMain.totalprice1.focus();
				error += "Fill Numerics in Total price Unit Rate \n";
		}
		if (document.priceApprovalMain.totalprice1.value.match(/\s/g,""))
			{	
				document.priceApprovalMain.totalprice1.focus();
				error +="Blank spaces are not allowed in Total Price Unit rate \n";
			}
	}
/*	if(document.priceApprovalMain.totalprice2.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.totalprice2.value))
		{
				document.priceApprovalMain.totalprice2.focus();
				error += "Fill Numerics in Total price Rs. per ton \n";
		}
	}
	if(document.priceApprovalMain.totalprice3.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.totalprice3.value))
		{
				document.priceApprovalMain.totalprice3.focus();
				error += "Fill Numerics in Total price Spend(Rs Lakh) \n";
		}
	}*/
	if(document.priceApprovalMain.cusduty1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.cusduty1.value))
		{
				document.priceApprovalMain.cusduty1.focus();
				error += "Fill Numerics in Customs Duty / Taxes Unit Rate \n";
		}
		if (document.priceApprovalMain.cusduty1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.cusduty1.focus();
			error +="Blank spaces are not allowed in Customs Duty / Taxes Unit Rate \n";
		}
	}
	if(document.priceApprovalMain.cusduty2.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.cusduty2.value))
		{
				document.priceApprovalMain.cusduty2.focus();
				error += "Fill Numerics in Customs Duty / Taxes Rs. per ton \n";
		}	
		if (document.priceApprovalMain.cusduty2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.cusduty2.focus();
			error +="Blank spaces are not allowed in Customs Duty / Taxes Rs. per ton \n";
		}
	}
	if(document.priceApprovalMain.cusduty3.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.cusduty3.value))
		{
				document.priceApprovalMain.cusduty3.focus();
				error += "Fill Numerics in Customs Duty / Taxes Spend(Rs Lakh) \n";
		}	
		if (document.priceApprovalMain.cusduty3.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.cusduty3.focus();
			error +="Blank spaces are not allowed in Customs Duty / Taxes Spend(Rs Lakh) \n";
		}
	}
	if(document.priceApprovalMain.freight1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.freight1.value))
		{
				document.priceApprovalMain.freight1.focus();
				error += "Fill Numerics in Freight Unit Rate \n";
		}

		if (document.priceApprovalMain.freight1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.freight1.focus();
			error +="Blank spaces are not allowed in Freight Unit Rate \n";
		}
	}
	if(document.priceApprovalMain.freight2.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.freight2.value))
		{
				document.priceApprovalMain.freight2.focus();
				error += "Fill Numerics in Freight Rs. per ton \n";
		}
		
		if (document.priceApprovalMain.freight2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.freight2.focus();
			error +="Blank spaces are not allowed in Freight Rs. per ton \n";
		}
	}
/*	if(document.priceApprovalMain.freight3.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.freight3.value))
		{
				document.priceApprovalMain.freight3.focus();
				error += "Fill Numerics in Freight Spend(Rs Lakh) \n";
		}
	}*/
	if(document.priceApprovalMain.insurance1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.insurance1.value))
		{
				document.priceApprovalMain.insurance1.focus();
				error += "Fill Numerics in Insurance Unit Rate \n";
		}
		if (document.priceApprovalMain.insurance1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.insurance1.focus();
			error +="Blank spaces are not allowed in Insurance Unit Rate \n";
		}
	}
/*	if(document.priceApprovalMain.insurance2.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.insurance2.value))
		{
				document.priceApprovalMain.insurance2.focus();
				error += "Fill Numerics in Insurance Rs. per ton \n";
		}
	}
	if(document.priceApprovalMain.insurance3.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.insurance3.value))
		{
				document.priceApprovalMain.insurance3.focus();
				error += "Fill Numerics in Insurance Spend(Rs Lakh) \n";
		}
	}*/
	if(document.priceApprovalMain.aopreceiptforex.value.length>0)
	{
			if(isNaN(document.priceApprovalMain.aopreceiptforex.value))
			{
					document.priceApprovalMain.aopreceiptforex.focus();
					error += "Fill Numerics in AOP Receipt ForEx  \n";
			}
			if (document.priceApprovalMain.aopreceiptforex.value.match(/\s/g,""))
			{	
				document.priceApprovalMain.aopreceiptforex.focus();
				error +="Blank spaces are not allowed in AOP Receipt ForEx \n";
			}
	}
	if(document.priceApprovalMain.aopreceiptprice.value.length>0)
	{
			if(isNaN(document.priceApprovalMain.aopreceiptprice.value))
			{
				document.priceApprovalMain.aopreceiptprice.focus();
				error += "Fill Numerics in AOP Receipt Price  \n";
			}
			if (document.priceApprovalMain.aopreceiptprice.value.match(/\s/g,""))
			{	
				document.priceApprovalMain.aopreceiptprice.focus();
				error +="Blank spaces are not allowed in AOP Receipt Price \n";
			}
	}
	if(document.priceApprovalMain.quainv1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.quainv1.value))
		{
				document.priceApprovalMain.quainv1.focus();
				error += "Fill Numerics in Quarter Opening Invetory Quantity \n";
		}
		if (document.priceApprovalMain.quainv1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.quainv1.focus();
			error +="Blank spaces are not allowed in Quarter Opening Invetory Quantity \n";
		}
	}
	if(document.priceApprovalMain.quainv2.value.length>0)
	{
		/*if(isNaN(document.priceApprovalMain.quainv2.value))
		{
				document.priceApprovalMain.quainv2.focus();
				error += "Fill Numerics in Quarter Opening Invetory Days \n";
		}*/
		if (document.priceApprovalMain.quainv2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.quainv2.focus();
			error +="Blank spaces are not allowed in Quarter Opening Invetory Days \n";
		}
	}
	if(document.priceApprovalMain.expectedreceipts1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.expectedreceipts1.value))
		{
				document.priceApprovalMain.expectedreceipts1.focus();
				error += "Fill Numerics in Expected Receipts For Quarter Quantity \n";
		}
		if (document.priceApprovalMain.expectedreceipts1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.expectedreceipts1.focus();
			error +="Blank spaces are not allowed in Expected Receipts For Quarter Quantity \n";
		}
	}
	if(document.priceApprovalMain.expectedreceipts2.value.length>0)
	{
		/*if(isNaN(document.priceApprovalMain.expectedreceipts2.value))
		{
				document.priceApprovalMain.expectedreceipts2.focus();
				error += "Fill Numerics in Expected Receipts For Quarter Days \n";
		}*/
		if (document.priceApprovalMain.expectedreceipts2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.expectedreceipts2.focus();
			error +="Blank spaces are not allowed in Expected Receipts For Quarter Days \n";
		}
	}
	if(document.priceApprovalMain.estimatedcons1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.estimatedcons1.value))
		{
				document.priceApprovalMain.estimatedcons1.focus();
				error += "Fill Numerics in Estimated cons. for balance of the quarter Quantity \n";
		}
		if (document.priceApprovalMain.estimatedcons1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.estimatedcons1.focus();
			error +="Blank spaces are not allowed in Estimated cons. for balance of the quarter Quantity \n";
		}
	}
	if(document.priceApprovalMain.estimatedcons2.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.estimatedcons2.value))
		{
				document.priceApprovalMain.estimatedcons2.focus();
				error += "Fill Numerics in Estimated cons. for balance of the quarter Days \n";
		}
		if (document.priceApprovalMain.estimatedcons2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.estimatedcons2.focus();
			error +="Blank spaces are not allowed in Estimated cons. for balance of the quarter Days \n";
		}
	}

/*	if(document.priceApprovalMain.quarterend1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.quarterend1.value))
		{
				document.priceApprovalMain.quarterend1.focus();
				error += "Fill Numerics in Quarter-end physical inventory / stock Quantity \n";
		}
	}*/
	if(document.priceApprovalMain.quarterend2.value.length>0)
	{
		/*if(isNaN(document.priceApprovalMain.quarterend2.value))
		{
				document.priceApprovalMain.quarterend2.focus();
				error += "Fill Numerics in Quarter-end physical inventory / stock Days \n";
		}*/
		if (document.priceApprovalMain.quarterend2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.quarterend2.focus();
			error +="Blank spaces are not allowed in Quarter-end physical inventory / stock Days \n";
		}
	}
	if(document.priceApprovalMain.thisLot.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.thisLot.value))
		{
				document.priceApprovalMain.thisLot.focus();
				error += "Fill Numerics in This Lot (CFR,India) \n";
		}
		if (document.priceApprovalMain.thisLot.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.thisLot.focus();
			error +="Blank spaces are not allowed in This Lot (CFR,India) \n";
		}
	}
	
	if(document.priceApprovalMain.invoicePrice.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.invoicePrice.value))
		{
				document.priceApprovalMain.invoicePrice.focus();
				error += "Fill Numerics in Invoice price \n";
		}
		if (document.priceApprovalMain.invoicePrice.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.invoicePrice.focus();
			error +="Blank spaces are not allowed in Invoice price \n";
		}
	}
	
	if(document.priceApprovalMain.risi.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.risi.value))
		{
				document.priceApprovalMain.risi.focus();
				error += "Fill Numerics in RISI (CFR,India) \n";
		}
		if (document.priceApprovalMain.risi.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.risi.focus();
			error +="Blank spaces are not allowed in RISI (CFR,India) \n";
		}
	}
	
	if(document.priceApprovalMain.annualBudget.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.annualBudget.value))
		{
				document.priceApprovalMain.annualBudget.focus();
				error += "Fill Numerics in Total Actual Cost \n";
		}
		if (document.priceApprovalMain.annualBudget.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.annualBudget.focus();
			error +="Blank spaces are not allowed in Total Actual Cost \n";
		}
	}
	if(document.priceApprovalMain.contractedTons.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.contractedTons.value))
		{
				document.priceApprovalMain.contractedTons.focus();
				error += "Fill Numerics in Contracted tons till last Qtr \n";
		}
		if (document.priceApprovalMain.contractedTons.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.contractedTons.focus();
			error +="Blank spaces are not allowed in Contracted tons till last Qtr \n";
		}
	}
	if(document.priceApprovalMain.currentquarter.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.currentquarter.value))
		{
				document.priceApprovalMain.currentquarter.focus();
				error += "Fill Numerics in Current quarter (incl. this deal) \n";
		}
		if (document.priceApprovalMain.currentquarter.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.currentquarter.focus();
			error +="Blank spaces are not allowed in Current quarter (incl. this deal) \n";
		}
	}

		var otherRemarks = document.priceApprovalMain.otherRemarks.value;
		otherRemarks = otherRemarks.replace(/^\s+|\s+$/g,'');
		document.priceApprovalMain.otherRemarks.value = otherRemarks;

		var marketEvents = document.priceApprovalMain.marketEvents.value;
		marketEvents = marketEvents.replace(/^\s+|\s+$/g,'');
		document.priceApprovalMain.marketEvents.value = marketEvents;

		if(document.priceApprovalMain.bussinessAndCommercial.value=="0")
		{
			// += "Please select B&C \n ";
			error += "Please select Category Head B&C \n ";
		}
		if(document.priceApprovalMain.director.value=="0")
		{
			error += "Please select Director - B&C \n ";
		}
		if(document.priceApprovalMain.epSupplyChain.value=="0")
		{
			//error += "Please select EP - Supply Chain \n ";
			//error += "Please select Executive Director \n ";
			error += "Please select COO (Publishing) & ED \n ";
		}
		if(document.priceApprovalMain.coo.value=="0")
		{
			//error += "Please select COO \n ";
			//error += "Please select CEC & ED \n ";
			error += "Please select CEO (Publishing) & ED \n ";
		}
		//if(document.priceApprovalMain.ceo.value=="0")
		//{
			//error += "Please select CEO \n ";
		//}
		if(document.priceApprovalMain.md.value=="0")
		{
			//error += "Please select MD \n ";
			//error += "Please select VC & MD \n ";
		}

		if(error!="")
		{
			alert(error);
		}else
			{

	document.priceApprovalMain.sanctionedRefType.disabled=false;
	/*document.priceApprovalMain.bussinessAndCommercial.disabled=false;
	document.priceApprovalMain.director.disabled=false;
	document.priceApprovalMain.epSupplyChain.disabled=false;*/
	document.priceApprovalMain.coo.disabled=false;
	document.priceApprovalMain.ceo.disabled=false;
	document.priceApprovalMain.md.disabled=false;


			if(queryType==1)
			{	
				document.priceApprovalMain.action = "common/submitnprequest.jsp";
				document.priceApprovalMain.submit();
			}
			else if(queryType==2)
			{
				document.priceApprovalMain.origin.disabled=false;
				var priceid = document.priceApprovalMain.priceid.value;
				document.priceApprovalMain.action = "common/updateDataSubmitnp.jsp?priceid="+priceid;
				document.priceApprovalMain.submit();
			}else if(queryType==3)
				{	
					document.priceApprovalMain.sanctionedRefType.disabled=false;
					document.priceApprovalMain.bussinessAndCommercial.disabled=false;
					document.priceApprovalMain.director.disabled=false;
					document.priceApprovalMain.epSupplyChain.disabled=false;
					document.priceApprovalMain.coo.disabled=false;
					document.priceApprovalMain.ceo.disabled=false;
					document.priceApprovalMain.md.disabled=false;

					var priceid = document.priceApprovalMain.priceid.value;
					document.priceApprovalMain.action = "common/updateDraftSubmitnp.jsp?priceid="+priceid;
					document.priceApprovalMain.submit();
				}else if(queryType==5)
			{
				document.priceApprovalMain.origin.disabled=false;
				var priceid = document.priceApprovalMain.priceid.value;
				document.priceApprovalMain.action = "common/updateDataSubmitnpCan.jsp?priceid="+priceid;
				document.priceApprovalMain.submit();
			}
	}
}//end of function

function negValCheck()
{
	var error = "";
	var flg   = 0;

	if(document.priceApprovalMain.quantity.value.length>0)
	{
			if(isNaN(document.priceApprovalMain.quantity.value))
			{
					document.priceApprovalMain.quantity.focus();
					error += "Fill Numerics in Quantity \n";
			}
			if (document.priceApprovalMain.quantity.value.match(/\s/g,""))
			{	
				document.priceApprovalMain.quantity.focus();
				error +="Blank spaces are not allowed in Quantity \n";
			}
	}
	/*if(document.priceApprovalMain.aopdealvalue.value.length>0)
	{
			if(isNaN(document.priceApprovalMain.aopdealvalue.value))
			{
					document.priceApprovalMain.aopdealvalue.focus();
					error += "Fill Numerics in AOP Deal value \n";
			}
	}*/

	//Price Built-Up
	if(document.priceApprovalMain.totalprice1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.totalprice1.value))
		{
				document.priceApprovalMain.totalprice1.focus();
				error += "Fill Numerics in Total price Unit Rate \n";
		}
		if (document.priceApprovalMain.totalprice1.value.match(/\s/g,""))
			{	
				document.priceApprovalMain.totalprice1.focus();
				error +="Blank spaces are not allowed in Total Price Unit rate \n";
			}
	}
/*	if(document.priceApprovalMain.totalprice2.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.totalprice2.value))
		{
				document.priceApprovalMain.totalprice2.focus();
				error += "Fill Numerics in Total price Rs. per ton \n";
		}
	}
	if(document.priceApprovalMain.totalprice3.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.totalprice3.value))
		{
				document.priceApprovalMain.totalprice3.focus();
				error += "Fill Numerics in Total price Spend(Rs Lakh) \n";
		}
	}*/
	if(document.priceApprovalMain.cusduty1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.cusduty1.value))
		{
				document.priceApprovalMain.cusduty1.focus();
				error += "Fill Numerics in Customs Duty / Taxes Unit Rate \n";
		}
		if (document.priceApprovalMain.cusduty1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.cusduty1.focus();
			error +="Blank spaces are not allowed in Customs Duty / Taxes Unit Rate \n";
		}
	}
	if(document.priceApprovalMain.cusduty2.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.cusduty2.value))
		{
				document.priceApprovalMain.cusduty2.focus();
				error += "Fill Numerics in Customs Duty / Taxes Rs. per ton \n";
		}	
		if (document.priceApprovalMain.cusduty2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.cusduty2.focus();
			error +="Blank spaces are not allowed in Customs Duty / Taxes Rs. per ton \n";
		}
	}
	if(document.priceApprovalMain.cusduty3.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.cusduty3.value))
		{
				document.priceApprovalMain.cusduty3.focus();
				error += "Fill Numerics in Customs Duty / Taxes Spend(Rs Lakh) \n";
		}	
		if (document.priceApprovalMain.cusduty3.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.cusduty3.focus();
			error +="Blank spaces are not allowed in Customs Duty / Taxes Spend(Rs Lakh) \n";
		}
	}
	if(document.priceApprovalMain.freight1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.freight1.value))
		{
				document.priceApprovalMain.freight1.focus();
				error += "Fill Numerics in Freight Unit Rate \n";
		}

		if (document.priceApprovalMain.freight1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.freight1.focus();
			error +="Blank spaces are not allowed in Freight Unit Rate \n";
		}
	}
	if(document.priceApprovalMain.freight2.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.freight2.value))
		{
				document.priceApprovalMain.freight2.focus();
				error += "Fill Numerics in Freight Rs. per ton \n";
		}
		
		if (document.priceApprovalMain.freight2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.freight2.focus();
			error +="Blank spaces are not allowed in Freight Rs. per ton \n";
		}
	}
/*	if(document.priceApprovalMain.freight3.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.freight3.value))
		{
				document.priceApprovalMain.freight3.focus();
				error += "Fill Numerics in Freight Spend(Rs Lakh) \n";
		}
	}*/
	if(document.priceApprovalMain.insurance1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.insurance1.value))
		{
				document.priceApprovalMain.insurance1.focus();
				error += "Fill Numerics in Insurance Unit Rate \n";
		}
		if (document.priceApprovalMain.insurance1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.insurance1.focus();
			error +="Blank spaces are not allowed in Insurance Unit Rate \n";
		}
	}
/*	if(document.priceApprovalMain.insurance2.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.insurance2.value))
		{
				document.priceApprovalMain.insurance2.focus();
				error += "Fill Numerics in Insurance Rs. per ton \n";
		}
	}
	if(document.priceApprovalMain.insurance3.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.insurance3.value))
		{
				document.priceApprovalMain.insurance3.focus();
				error += "Fill Numerics in Insurance Spend(Rs Lakh) \n";
		}
	}*/
	if(document.priceApprovalMain.aopreceiptforex.value.length>0)
	{
			if(isNaN(document.priceApprovalMain.aopreceiptforex.value))
			{
					document.priceApprovalMain.aopreceiptforex.focus();
					error += "Fill Numerics in AOP Receipt ForEx  \n";
			}
			if (document.priceApprovalMain.aopreceiptforex.value.match(/\s/g,""))
			{	
				document.priceApprovalMain.aopreceiptforex.focus();
				error +="Blank spaces are not allowed in AOP Receipt ForEx \n";
			}
	}
	if(document.priceApprovalMain.aopreceiptprice.value.length>0)
	{
			if(isNaN(document.priceApprovalMain.aopreceiptprice.value))
			{
				document.priceApprovalMain.aopreceiptprice.focus();
				error += "Fill Numerics in AOP Receipt Price  \n";
			}
			if (document.priceApprovalMain.aopreceiptprice.value.match(/\s/g,""))
			{	
				document.priceApprovalMain.aopreceiptprice.focus();
				error +="Blank spaces are not allowed in AOP Receipt Price \n";
			}
	}
	if(document.priceApprovalMain.quainv1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.quainv1.value))
		{
				document.priceApprovalMain.quainv1.focus();
				error += "Fill Numerics in Quarter Opening Invetory Quantity \n";
		}
		if (document.priceApprovalMain.quainv1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.quainv1.focus();
			error +="Blank spaces are not allowed in Quarter Opening Invetory Quantity \n";
		}
	}
	if(document.priceApprovalMain.quainv2.value.length>0)
	{
		/*if(isNaN(document.priceApprovalMain.quainv2.value))
		{
				document.priceApprovalMain.quainv2.focus();
				error += "Fill Numerics in Quarter Opening Invetory Days \n";
		}*/
		if (document.priceApprovalMain.quainv2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.quainv2.focus();
			error +="Blank spaces are not allowed in Quarter Opening Invetory Days \n";
		}
	}
	if(document.priceApprovalMain.expectedreceipts1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.expectedreceipts1.value))
		{
				document.priceApprovalMain.expectedreceipts1.focus();
				error += "Fill Numerics in Expected Receipts For Quarter Quantity \n";
		}
		if (document.priceApprovalMain.expectedreceipts1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.expectedreceipts1.focus();
			error +="Blank spaces are not allowed in Expected Receipts For Quarter Quantity \n";
		}
	}
	if(document.priceApprovalMain.expectedreceipts2.value.length>0)
	{
		/*if(isNaN(document.priceApprovalMain.expectedreceipts2.value))
		{
				document.priceApprovalMain.expectedreceipts2.focus();
				error += "Fill Numerics in Expected Receipts For Quarter Days \n";
		}*/
		if (document.priceApprovalMain.expectedreceipts2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.expectedreceipts2.focus();
			error +="Blank spaces are not allowed in Expected Receipts For Quarter Days \n";
		}
	}
	if(document.priceApprovalMain.estimatedcons1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.estimatedcons1.value))
		{
				document.priceApprovalMain.estimatedcons1.focus();
				error += "Fill Numerics in Estimated cons. for balance of the quarter Quantity \n";
		}
		if (document.priceApprovalMain.estimatedcons1.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.estimatedcons1.focus();
			error +="Blank spaces are not allowed in Estimated cons. for balance of the quarter Quantity \n";
		}
	}
	if(document.priceApprovalMain.estimatedcons2.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.estimatedcons2.value))
		{
				document.priceApprovalMain.estimatedcons2.focus();
				error += "Fill Numerics in Estimated cons. for balance of the quarter Days \n";
		}
		if (document.priceApprovalMain.estimatedcons2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.estimatedcons2.focus();
			error +="Blank spaces are not allowed in Estimated cons. for balance of the quarter Days \n";
		}
	}

/*	if(document.priceApprovalMain.quarterend1.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.quarterend1.value))
		{
				document.priceApprovalMain.quarterend1.focus();
				error += "Fill Numerics in Quarter-end physical inventory / stock Quantity \n";
		}
	}*/
	if(document.priceApprovalMain.quarterend2.value.length>0)
	{
		/*if(isNaN(document.priceApprovalMain.quarterend2.value))
		{
				document.priceApprovalMain.quarterend2.focus();
				error += "Fill Numerics in Quarter-end physical inventory / stock Days \n";
		}*/
		if (document.priceApprovalMain.quarterend2.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.quarterend2.focus();
			error +="Blank spaces are not allowed in Quarter-end physical inventory / stock Days \n";
		}
	}
	if(document.priceApprovalMain.thisLot.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.thisLot.value))
		{
				document.priceApprovalMain.thisLot.focus();
				error += "Fill Numerics in This Lot (CFR,India) \n";
		}
		if (document.priceApprovalMain.thisLot.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.thisLot.focus();
			error +="Blank spaces are not allowed in This Lot (CFR,India) \n";
		}
	}
	
	if(document.priceApprovalMain.invoicePrice.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.invoicePrice.value))
		{
				document.priceApprovalMain.invoicePrice.focus();
				error += "Fill Numerics in Invoice price \n";
		}
		if (document.priceApprovalMain.invoicePrice.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.invoicePrice.focus();
			error +="Blank spaces are not allowed in Invoice price \n";
		}
	}
	
	if(document.priceApprovalMain.risi.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.risi.value))
		{
				document.priceApprovalMain.risi.focus();
				error += "Fill Numerics in RISI (CFR,India) \n";
		}
		if (document.priceApprovalMain.risi.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.risi.focus();
			error +="Blank spaces are not allowed in RISI (CFR,India) \n";
		}
	}
	
	if(document.priceApprovalMain.annualBudget.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.annualBudget.value))
		{
				document.priceApprovalMain.annualBudget.focus();
				error += "Fill Numerics in Total Actual Cost \n";
		}
		if (document.priceApprovalMain.annualBudget.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.annualBudget.focus();
			error +="Blank spaces are not allowed in Total Actual Cost \n";
		}
	}
	if(document.priceApprovalMain.contractedTons.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.contractedTons.value))
		{
				document.priceApprovalMain.contractedTons.focus();
				error += "Fill Numerics in Contracted tons till last Qtr \n";
		}
		if (document.priceApprovalMain.contractedTons.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.contractedTons.focus();
			error +="Blank spaces are not allowed in Contracted tons till last Qtr \n";
		}
	}
	if(document.priceApprovalMain.currentquarter.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.currentquarter.value))
		{
				document.priceApprovalMain.currentquarter.focus();
				error += "Fill Numerics in Current quarter (incl. this deal) \n";
		}
		if (document.priceApprovalMain.currentquarter.value.match(/\s/g,""))
		{	
			document.priceApprovalMain.currentquarter.focus();
			error +="Blank spaces are not allowed in Current quarter (incl. this deal) \n";
		}
	}
/*	if(document.priceApprovalMain.balance.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.balance.value))
		{
				document.priceApprovalMain.balance.focus();
				error += "Fill Numerics in Total Actual Cost \n";
		}
	}*/
	if(error!="")
	{
		alert(error);
	}

}

function savedraftnp()
	{

		var frmObj = document.priceApprovalMain;

		bussinessAndCommercial	    =	    document.priceApprovalMain.bussinessAndCommercial.value;
		ceo							=	    document.priceApprovalMain.ceo.value;
		director					=	    document.priceApprovalMain.director.value;
		coo							=	    document.priceApprovalMain.coo.value;
		epSupplyChain				=	    document.priceApprovalMain.epSupplyChain.value;
		md							=	    document.priceApprovalMain.md.value;

		//alert(bussinessAndCommercial);
		//alert(ceo);
		//alert(director);
		//alert(coo);
		//alert(epSupplyChain);
		//alert(md);

		if(document.priceApprovalMain.bussinessAndCommercial.value=="0")
		{
			//alert( "Please select B&C" );
			alert( "Please select Category Head B&C" );
			return;
		}
		if(document.priceApprovalMain.director.value=="0")
		{
			//error += "Please select Director - B&C \n ";
			alert( "Please select Director - B&C" );
			return;
		}
		if(document.priceApprovalMain.epSupplyChain.value=="0")
		{
			//error += "Please select EP - Supply Chain \n ";
			//alert( "Please select EP - Supply Chain" );
			//alert( "Please select Executive Director" );
			alert( "Please select COO (Publishing) & ED" );
			return;
		}
		if(document.priceApprovalMain.coo.value=="0")
		{
			//error += "Please select COO \n ";
			//alert( "Please select COO" );
			//alert( "Please select CEC & ED" );
			alert( "Please select CEO (Publishing) & ED" );
			return;
		}
		//if(document.priceApprovalMain.ceo.value=="0")
		//{
			//error += "Please select CEO \n ";
			//alert( "Please select CEO" );
			//return;
		//}
		if(document.priceApprovalMain.md.value=="0")
		{
			//error += "Please select MD \n ";
			//alert( "Please select MD" );
			//alert( "Please select VC & MD" );
			//return;
		}

/*		if(isEmpty(document.priceApprovalMain.origin.value.length))
		{
			document.priceApprovalMain.origin.value=="0";
		}

		 if(isEmpty(document.priceApprovalMain.vendorName.value.length))
		{
			 
			document.priceApprovalMain.vendorName.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.mill.value.length))
		{
			 
			document.priceApprovalMain.mill.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.paymentTerms.value.length))
		{
			 
			document.priceApprovalMain.paymentTerms.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.sourcing.value.length))
		{
			 
			document.priceApprovalMain.sourcing.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.quantity.value.length))
		{
			 
			document.priceApprovalMain.quantity.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.deliveryIn.value.length))
		{
			 
			document.priceApprovalMain.deliveryIn.value = "NA";
		}
		

		if(isEmpty(document.priceApprovalMain.quality.value.length))
		{
			 
			document.priceApprovalMain.quality.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.gsm.value.length))
		{
			 
			document.priceApprovalMain.gsm.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.thisLot.value.length))
		{
			 
			document.priceApprovalMain.thisLot.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.invoicePrice.value.length))
		{
			 
			document.priceApprovalMain.invoicePrice.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.risi.value.length))
		{
			 
			document.priceApprovalMain.risi.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.aopreceiptprice.value.length))
		{
			 
			document.priceApprovalMain.aopreceiptprice.value = 0;
		}
		if(isEmpty(document.priceApprovalMain.aopreceiptforex.value.length))
		{
			 
			document.priceApprovalMain.aopreceiptforex.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.aopdealvalue.value.length))
		{
			 
			document.priceApprovalMain.aopdealvalue.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.totalprice1.value.length))
		{
			 
			document.priceApprovalMain.totalprice1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.totalprice2.value.length))
		{
			 
			document.priceApprovalMain.totalprice2.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.totalprice3.value.length))
		{
			 
			document.priceApprovalMain.totalprice3.value = 0;
		}
		

		if(isEmpty(document.priceApprovalMain.cusduty1.value.length))
		{
			 
			document.priceApprovalMain.cusduty1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.cusduty2.value.length))
		{
			 
			document.priceApprovalMain.cusduty2.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.cusduty3.value.length))
		{
			 
			document.priceApprovalMain.cusduty3.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.freight1.value.length))
		{
			 
			document.priceApprovalMain.freight1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.freight2.value.length))
		{
			 
			document.priceApprovalMain.freight2.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.freight3.value.length))
		{
			 
			document.priceApprovalMain.freight3.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.insurance1.value.length))
		{
			 
			document.priceApprovalMain.insurance1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.insurance2.value.length))
		{
			 
			document.priceApprovalMain.insurance2.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.insurance3.value.length))
		{
			 
			document.priceApprovalMain.insurance3.value = 0;
		}
*/
/*	if(isEmpty(document.priceApprovalMain.totalcost1.value.length))
		{
			 
			document.priceApprovalMain.totalcost1.value = 0;
		}*/
		
/*		if(isEmpty(document.priceApprovalMain.totalcost2.value.length))
		{
			 
			document.priceApprovalMain.totalcost2.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.totalcost3.value.length))
		{
			 
			document.priceApprovalMain.totalcost3.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.budact1.value.length))
		{
			 
			document.priceApprovalMain.budact1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.quainv1.value.length))
		{
			 
			document.priceApprovalMain.quainv1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.quainv2.value.length))
		{
			 
			document.priceApprovalMain.quainv2.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.expectedreceipts1.value.length))
		{
			 
			document.priceApprovalMain.expectedreceipts1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.expectedreceipts2.value.length))
		{
			 
			document.priceApprovalMain.expectedreceipts2.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.estimatedcons1.value.length))
		{
			 
			document.priceApprovalMain.estimatedcons1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.estimatedcons2.value.length))
		{
			 
			document.priceApprovalMain.estimatedcons2.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.quarterend1.value.length))
		{
			 
			document.priceApprovalMain.quarterend1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.quarterend2.value.length))
		{
			 
			document.priceApprovalMain.quarterend2.value = 0;
		}


		if(isEmpty(document.priceApprovalMain.annualBudget.value.length))
		{
			 
			document.priceApprovalMain.annualBudget.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.contractedTons.value.length))
		{
			 
			document.priceApprovalMain.contractedTons.value = 0;
		}
		if(isEmpty(document.priceApprovalMain.currentquarter.value.length))
		{
			 
			document.priceApprovalMain.currentquarter.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.balance.value.length))
		{
			 
			document.priceApprovalMain.balance.value = 0;
		}
*/



//for loop fo offers add row
	counter					=	document.priceApprovalMain.count.value;

	for(i = 1; i<=counter; i++)
	{
		v = eval("document.priceApprovalMain.v"+i);
		vval = v.value;

		if(vval.length==0)
		{
			v.value = "NA";
		}

		c = eval("document.priceApprovalMain.c"+i);
		cval = c.value;

		if(cval.length==0)
		{
			c.value = "NA";
		}

		m = eval("document.priceApprovalMain.m"+i);
		mval = m.value;

		if(mval.length==0)
		{
			m.value = "NA";
		}

		g = eval("document.priceApprovalMain.g"+i);
		gval = g.value;

		if(gval.length==0)
		{
			g.value = "NA";
		}
		a = eval("document.priceApprovalMain.a"+i);
		aval = a.value;

		if(aval.length==0)
		{
			a.value = "NA";
		}
		oq = eval("document.priceApprovalMain.oq"+i);
		oqval = oq.value;

		if(oqval.length==0)
		{
			oq.value = "0";
		}

		op = eval("document.priceApprovalMain.op"+i);
		opval = op.value;

		if(opval.length==0)
		{
			op.value = "0";
		}

		fq = eval("document.priceApprovalMain.fq"+i);
		fqval = fq.value;

		if(fqval.length==0)
		{
			fq.value = "0";
		}

		fp = eval("document.priceApprovalMain.fp"+i);
		fpval = fp.value;

		if(fpval.length==0)
		{
			fp.value = "0";
		}
	}

//for loop fo comments add row

	counter1		=	document.priceApprovalMain.count2.value;

	for(i = 1; i<=counter1; i++)
	{
		vn = eval("document.priceApprovalMain.vn"+i);
		vnval = vn.value;

		if(vnval.length==0)
		{
			vn.value = "NA";
		}

		co = eval("document.priceApprovalMain.co"+i);
		coval = co.value;

		if(coval.length==0)
		{
			co.value = "NA";
		}

		mill = eval("document.priceApprovalMain.mill"+i);
		millval = mill.value;

		if(millval.length==0)
		{
			mill.value = "NA";
		}

		gr = eval("document.priceApprovalMain.gr"+i);
		grval = gr.value;

		if(grval.length==0)
		{
			gr.value = "NA";
		}
		qscr = eval("document.priceApprovalMain.qscr"+i);
		qscrval = qscr.value;

		if(qscrval.length==0)
		{
			qscr.value = "NA";
		}
		rem = eval("document.priceApprovalMain.rem"+i);
		remval = rem.value;

		if(remval.length==0)
		{
			rem.value = "NA";
		}

	}


/*
		if(isEmpty(document.priceApprovalMain.otherRemarks.value.length))
		{
			 
			document.priceApprovalMain.otherRemarks.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.marketEvents.value.length))
		{
			 
			document.priceApprovalMain.marketEvents.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.marketEvents.value.length))
		{
			 
			document.priceApprovalMain.marketEvents.value = "NA";
		}
*/

		if(document.priceApprovalMain.aopdealvalue.value=="NaN")
		{
			document.priceApprovalMain.aopdealvalue.value = 0;
		}
		if(document.priceApprovalMain.totalprice2.value=="NaN")
		{
			document.priceApprovalMain.totalprice2.value = 0;
		}
		if(document.priceApprovalMain.totalprice3.value=="NaN")
		{
			document.priceApprovalMain.totalprice3.value = 0;
		}
		if(document.priceApprovalMain.freight3.value=="NaN")
		{
			document.priceApprovalMain.freight3.value = 0;
		}
		if(document.priceApprovalMain.insurance2.value=="NaN")
		{
			document.priceApprovalMain.insurance2.value = 0;
		}
		if(document.priceApprovalMain.insurance3.value=="NaN")
		{
			document.priceApprovalMain.insurance3.value = 0;
		}
		if(document.priceApprovalMain.totalcost2.value=="NaN")
		{
			document.priceApprovalMain.totalcost2.value = 0;
		}
		if(document.priceApprovalMain.totalcost3.value=="NaN")
		{
			document.priceApprovalMain.totalcost3.value = 0;
		}
		if(document.priceApprovalMain.budact1.value=="NaN")
		{
			document.priceApprovalMain.budact1.value = 0;
		}
		if(document.priceApprovalMain.quarterend1.value=="NaN")
		{
			document.priceApprovalMain.quarterend1.value = 0;
		}
		if(document.priceApprovalMain.balance.value=="NaN")
		{
			document.priceApprovalMain.balance.value = 0;
		}


	document.priceApprovalMain.sanctionedRefType.disabled=false;
	/*document.priceApprovalMain.bussinessAndCommercial.disabled=false;
	document.priceApprovalMain.director.disabled=false;
	document.priceApprovalMain.epSupplyChain.disabled=false;*/
	document.priceApprovalMain.coo.disabled=false;
	document.priceApprovalMain.ceo.disabled=false;
	document.priceApprovalMain.md.disabled=false;



			frmObj.action="common/saveDraftSubmitnp.jsp";
			frmObj.submit();
	}//end of function save draft

function showSABnp()
{	
	//alert("gggg");
	randome = Math.random();
	loadFragment('common/viewSABnp.jsp?randome='+randome,'sab1','Checking Support & Approve');
	loadFragment('common/viewSABnpCan.jsp?randome='+randome,'sab1','Checking Support & Approve');
	setTimeout("showSAB()",1000*15);
}

function showSABnpCAN()
{	
	//alert("jjjj");
	randome = Math.random();
	loadFragment('common/viewSABnpCan.jsp?randome='+randome,'sab1','Checking Support & Approve');
	setTimeout("showSAB()",1000*15);
}

function openRemarksnp(priceId,userOId,approverType, statusType,creatorEmailid)
{     
	//alert("priceId : "+priceId);
	//alert("userOId : "+userOId);
	//alert("approverType : "+approverType);
	//alert("statusType : "+statusType);
	//alert("creatorEmailid : "+creatorEmailid);

	if(approverType=="AP1")
	{
		AP1   = 1;
		flagR = 1;
	}else if(approverType=="AP2")
	{
		AP2   = 1;
		flagR = 1;
	
	}else if(approverType=="AP3")
	{
		AP3   = 1;
		flagR = 1;
	
	}else if(approverType=="AP4")
	{
		AP4   = 1;
		flagR = 1;
	}else if(approverType=="AP5")
	{
		AP5   = 1;
		flagR = 1;
	}else if(approverType=="AP6")
	{
		AP6   = 1;
		flagR = 1;
	}
	
	window.open('../common/insertRemarksnp.jsp?priceId='+priceId+'&userOId='+userOId+'&approverType='+approverType+'&statusType='+statusType+'&creatorEmailid='+creatorEmailid,'','resizable=no,scrollbars=yes,toolbars=no,status=yes,width=750,height=300,top=80,left=100');
}


function openRemarksnpAmmend(priceId,userOId,approverType, statusType,creatorEmailid)
{     
	//alert("priceId : "+priceId);
	//alert("userOId : "+userOId);
	//alert("approverType : "+approverType);
	//alert("statusType : "+statusType);
	//alert("creatorEmailid : "+creatorEmailid);


	if(approverType=="AP1")
	{
		AP1   = 1;
		flagR = 1;
	}else if(approverType=="AP2")
	{
		AP2   = 1;
		flagR = 1;
	
	}else if(approverType=="AP3")
	{
		AP3   = 1;
		flagR = 1;
	
	}else if(approverType=="AP4")
	{
		AP4   = 1;
		flagR = 1;
	}else if(approverType=="AP5")
	{
		AP5   = 1;
		flagR = 1;
	}else if(approverType=="AP6")
	{
		AP6   = 1;
		flagR = 1;
	}
	
	window.open('../common/insertRemarksnp.jsp?priceId='+priceId+'&userOId='+userOId+'&approverType='+approverType+'&statusType='+statusType+'&creatorEmailid='+creatorEmailid,'','resizable=no,scrollbars=yes,toolbars=no,status=yes,width=750,height=300,top=80,left=100');

	
}


function cancelRemarksnp(priceId,userOId,approverType, statusType,creatorEmailid)
{     
	window.open('../priceapproval/common/cancelRemarksnp.jsp?priceId='+priceId+'&userOId='+userOId+'&approverType='+approverType+'&statusType='+statusType+'&creatorEmailid='+creatorEmailid,'','resizable=no,scrollbars=yes,toolbars=no,status=yes,width=750,height=300,top=80,left=100');
}


function postRemarksnp(priceId,userOId,approverType,statusType,buyerEmailaddress)
{
	//alert("buyerEmailaddress"+buyerEmailaddress);
	var remarks = document.postRemarksForm.remarksContainer.value;

	remarks = remarks.replace(/^\s+|\s+$/g,'');


	
	if(remarks.length!=0 && remarks!='')
	{
				if (window.XMLHttpRequest)
				  { // code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp = new XMLHttpRequest();
				  }
				else
				  {// code for IE6, IE5
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				  }
			
				  xmlhttp.onreadystatechange=function()
					{
						if (xmlhttp.readyState==4 && xmlhttp.status==200)
						{
							//alert("Done");
							document.getElementById('poststatus').innerHTML = "Remarks Posted Successfully!!!";							window.close();				    									
						}
					}

				  var random = Math.random();
				  var URL    = '../common/insertRemarksSubmitnp.jsp?priceId='+priceId+'&userId='+userOId+'&approverType='+approverType+'&remarks='+remarks+'&random='+random+"&buyerEmailaddress="+buyerEmailaddress;;
				 // alert(URL);
				  xmlhttp.open("GET",URL,true);
		    	  xmlhttp.send();

	}

}


function postRemarksnp1(priceId,userOId,approverType,statusType,buyerEmailaddress)
{

//alert("priceId : "+priceId);
	//alert("userOId : "+userOId);
	//alert("approverType : "+approverType);
	//alert("statusType : "+statusType);
	//alert("creatorEmailid : "+buyerEmailaddress);

	frmObj = document.postRemarksForm;

	var remarks = document.postRemarksForm.remarksContainer.value;

	remarks = remarks.replace(/^\s+|\s+$/g,'');


	if(remarks.length!=0 && remarks!='')
	{
		var random = Math.random();
		//loadURL("../common/insertRemarksSubmitnp.jsp?priceId="+priceId+'&userId='+userOId+'&approverType='+approverType+'&remarks='+remarks+"&random="+random , priceId, userOId, approverType, remarks , statusType);
	
	}else
	{
		alert("Please enter remarks");
		 return;

	}
	frmObj.action="../common/insertRemarksSubmitnp.jsp?priceId="+priceId+'&userId='+userOId+'&approverType='+approverType+'&remarks='+remarks+"&random="+random+"&statusType="+statusType+"&buyerEmailaddress="+buyerEmailaddress;
	frmObj.submit( );

}

function postRemarksnpCan(priceId,statusType,userOId,approverType,buyerEmailaddress)
{
	var remarks = document.postRemarksForm.remarksContainer.value;

	remarks = remarks.replace(/^\s+|\s+$/g,'');


	
	if(remarks.length!=0 && remarks!='')
	{

		document.postRemarksForm.action = '../common/insertRemarksSubmitnpCan.jsp?priceId='+priceId+'&statusType='+statusType+'&remarks='+remarks+'&userOId='+userOId+'&approverType='+approverType+'&buyerEmailaddress='+buyerEmailaddress;
				document.postRemarksForm.submit();
							  
				  //var random = Math.random();
				  //var URL    = '../common/insertRemarksSubmitnpCan.jsp?priceId='+priceId+'&statusType='+statusType+'&remarks='+remarks+'&userOId='+userOId;
				  //alert(URL);
				  //xmlhttp.open("GET",URL,true);
		    	  //xmlhttp.send();

	}

}


function ammendRemarksnp(priceId,statusType,userOId,approverType,buyerEmailaddress)
{
	var remarks = document.postRemarksForm.remarksContainer.value;

	remarks = remarks.replace(/^\s+|\s+$/g,'');


	
	if(remarks.length!=0 && remarks!='')
	{

		document.postRemarksForm.action = '../common/ammendRemarksSubmitnp.jsp?priceId='+priceId+'&statusType='+statusType+'&remarks='+remarks+'&userOId='+userOId+'&approverType='+approverType+'&buyerEmailaddress='+buyerEmailaddress;
				document.postRemarksForm.submit();
							  
				  //var random = Math.random();
				  //var URL    = '../common/insertRemarksSubmitnpCan.jsp?priceId='+priceId+'&statusType='+statusType+'&remarks='+remarks+'&userOId='+userOId;
				  //alert(URL);
				  //xmlhttp.open("GET",URL,true);
		    	  //xmlhttp.send();

	}

}


function navigateCallRemarksNp(timescapeUserOId,priceid)
{
	 url = "../common/showDetailsnp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid;
	 window.opener.location.href=url;
 	 self.close();
}

function loadURL(fragment_url ,priceId ,userOId ,approverType,remarks ,statusType){

	//alert("rand="+Math.random());
    var xmlhttp = "";
    if (window.XMLHttpRequest){
        // code for Mozilla, etc.
        xmlhttp=new XMLHttpRequest();
    }else if (window.ActiveXObject){ 
        // code for IE
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        alert("Sorry Your Browser is not Supported");
    }
	
	var message = "";
   
        
	try{
        xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//alert(xmlhttp.responseText);
				var text = xmlhttp.responseText;
					text = text.replace(/[^a-zA-Z 0-9]+/g,'');
					text = text.replace(/^\s+|\s+$/g,'');
				//var gotresponse	=	xmlhttp.responseText;
                
				//message =  gotresponse;
               // element.innerHTML = message;
				var URL = "";
				document.getElementById('poststatus').innerHTML = "Remarks Posted Successfully!!!";	
				window.close();
				
				if(text == "true")
				{
					opener.location.href = "../common/supportApprovenp.jsp?priceid="+priceId+"&appType="+approverType+"&statusType="+statusType;
				}
						
		}
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){

		alert("Can't connect to server:\n" + e.toString());
	 }
}

function savedraft2np(){


var priceid = document.priceApprovalMain.priceid.value;

	var sanctionedRefType = document.getElementById('sanctionedRefType').value;
	var refNumber = document.getElementById('refNumber').value;
	var dateOfApproval = document.getElementById('dateOfApproval').value;


//alert("app11---"+document.priceApprovalMain.app11.value);
//alert("app11H---"+document.priceApprovalMain.app11H.value);
//alert("app8---"+document.priceApprovalMain.app8.value);
//alert("app8H---"+document.priceApprovalMain.app8H.value);

	
	if(document.priceApprovalMain.sanctionedRefType.value == 0)
	{
		//error += "Please Select Sanctioned Reference Type\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.sanctionedRefType.focus();
				flag = 1;
			}
	}
	//alert("fghfhf"+sanctionedRefType);


/*	
		 if(isEmpty(document.priceApprovalMain.vendorName.value.length))
		{
			 
			document.priceApprovalMain.vendorName.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.mill.value.length))
		{
			 
			document.priceApprovalMain.mill.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.paymentTerms.value.length))
		{
			 
			document.priceApprovalMain.paymentTerms.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.sourcing.value.length))
		{
			 
			document.priceApprovalMain.sourcing.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.quantity.value.length))
		{
			 
			document.priceApprovalMain.quantity.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.deliveryIn.value.length))
		{
			 
			document.priceApprovalMain.deliveryIn.value = "NA";
		}
		

		if(isEmpty(document.priceApprovalMain.quality.value.length))
		{
			 
			document.priceApprovalMain.quality.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.gsm.value.length))
		{
			 
			document.priceApprovalMain.gsm.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.thisLot.value.length))
		{
			 
			document.priceApprovalMain.thisLot.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.invoicePrice.value.length))
		{
			 
			document.priceApprovalMain.invoicePrice.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.risi.value.length))
		{
			 
			document.priceApprovalMain.risi.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.aopreceiptprice.value.length))
		{
			 
			document.priceApprovalMain.aopreceiptprice.value = 0;
		}
		if(isEmpty(document.priceApprovalMain.aopreceiptforex.value.length))
		{
			 
			document.priceApprovalMain.aopreceiptforex.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.aopdealvalue.value.length))
		{
			 
			document.priceApprovalMain.aopdealvalue.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.totalprice1.value.length))
		{
			 
			document.priceApprovalMain.totalprice1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.totalprice2.value.length))
		{
			 
			document.priceApprovalMain.totalprice2.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.totalprice3.value.length))
		{
			 
			document.priceApprovalMain.totalprice3.value = 0;
		}
		

		if(isEmpty(document.priceApprovalMain.cusduty1.value.length))
		{
			 
			document.priceApprovalMain.cusduty1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.cusduty2.value.length))
		{
			 
			document.priceApprovalMain.cusduty2.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.cusduty3.value.length))
		{
			 
			document.priceApprovalMain.cusduty3.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.freight1.value.length))
		{
			 
			document.priceApprovalMain.freight1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.freight2.value.length))
		{
			 
			document.priceApprovalMain.freight2.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.freight3.value.length))
		{
			 
			document.priceApprovalMain.freight3.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.insurance1.value.length))
		{
			 
			document.priceApprovalMain.insurance1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.insurance2.value.length))
		{
			 
			document.priceApprovalMain.insurance2.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.insurance3.value.length))
		{
			 
			document.priceApprovalMain.insurance3.value = 0;
		}
*/
	/*	if(isEmpty(document.priceApprovalMain.totalcost1.value.length))
		{
			 
			document.priceApprovalMain.totalcost1.value = 0;
		}
		*/
	/*	if(isEmpty(document.priceApprovalMain.totalcost2.value.length))
		{
			 
			document.priceApprovalMain.totalcost2.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.totalcost3.value.length))
		{
			 
			document.priceApprovalMain.totalcost3.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.budact1.value.length))
		{
			 
			document.priceApprovalMain.budact1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.quainv1.value.length))
		{
			 
			document.priceApprovalMain.quainv1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.quainv2.value.length))
		{
			 
			document.priceApprovalMain.quainv2.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.expectedreceipts1.value.length))
		{
			 
			document.priceApprovalMain.expectedreceipts1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.expectedreceipts2.value.length))
		{
			 
			document.priceApprovalMain.expectedreceipts2.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.estimatedcons1.value.length))
		{
			 
			document.priceApprovalMain.estimatedcons1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.estimatedcons2.value.length))
		{
			 
			document.priceApprovalMain.estimatedcons2.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.quarterend1.value.length))
		{
			 
			document.priceApprovalMain.quarterend1.value = 0;
		}
		
		if(isEmpty(document.priceApprovalMain.quarterend2.value.length))
		{
			 
			document.priceApprovalMain.quarterend2.value = 0;
		}


		if(isEmpty(document.priceApprovalMain.annualBudget.value.length))
		{
			 
			document.priceApprovalMain.annualBudget.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.contractedTons.value.length))
		{
			 
			document.priceApprovalMain.contractedTons.value = 0;
		}
		if(isEmpty(document.priceApprovalMain.currentquarter.value.length))
		{
			 
			document.priceApprovalMain.currentquarter.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.balance.value.length))
		{
			 
			document.priceApprovalMain.balance.value = 0;
		}


*/

//for loop fo offers add row
	counter					=	document.priceApprovalMain.count.value;

	for(i = 1; i<=counter; i++)
	{
		v = eval("document.priceApprovalMain.v"+i);
		vval = v.value;

		if(vval.length==0)
		{
			v.value = "NA";
		}

		c = eval("document.priceApprovalMain.c"+i);
		cval = c.value;

		if(cval.length==0)
		{
			c.value = "NA";
		}

		m = eval("document.priceApprovalMain.m"+i);
		mval = m.value;

		if(mval.length==0)
		{
			m.value = "NA";
		}

		g = eval("document.priceApprovalMain.g"+i);
		gval = g.value;

		if(gval.length==0)
		{
			g.value = "NA";
		}
		a = eval("document.priceApprovalMain.a"+i);
		aval = a.value;

		if(aval.length==0)
		{
			a.value = "NA";
		}
		oq = eval("document.priceApprovalMain.oq"+i);
		oqval = oq.value;

		if(oqval.length==0)
		{
			oq.value = "0";
		}

		op = eval("document.priceApprovalMain.op"+i);
		opval = op.value;

		if(opval.length==0)
		{
			op.value = "0";
		}

		fq = eval("document.priceApprovalMain.fq"+i);
		fqval = fq.value;

		if(fqval.length==0)
		{
			fq.value = "0";
		}

		fp = eval("document.priceApprovalMain.fp"+i);
		fpval = fp.value;

		if(fpval.length==0)
		{
			fp.value = "0";
		}
	}

//for loop fo comments add row

	counter1		=	document.priceApprovalMain.count2.value;

	for(i = 1; i<=counter1; i++)
	{
		vn = eval("document.priceApprovalMain.vn"+i);
		vnval = vn.value;

		if(vnval.length==0)
		{
			vn.value = "NA";
		}

		co = eval("document.priceApprovalMain.co"+i);
		coval = co.value;

		if(coval.length==0)
		{
			co.value = "NA";
		}

		mill = eval("document.priceApprovalMain.mill"+i);
		millval = mill.value;

		if(millval.length==0)
		{
			mill.value = "NA";
		}

		gr = eval("document.priceApprovalMain.gr"+i);
		grval = gr.value;

		if(grval.length==0)
		{
			gr.value = "NA";
		}
		qscr = eval("document.priceApprovalMain.qscr"+i);
		qscrval = qscr.value;

		if(qscrval.length==0)
		{
			qscr.value = "NA";
		}
		rem = eval("document.priceApprovalMain.rem"+i);
		remval = rem.value;

		if(remval.length==0)
		{
			rem.value = "NA";
		}

	}

/*		if(isEmpty(document.priceApprovalMain.otherRemarks.value.length))
		{
			 
			document.priceApprovalMain.otherRemarks.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.marketEvents.value.length))
		{
			 
			document.priceApprovalMain.marketEvents.value = "NA";
		}
*/
		var otherRemarks = document.priceApprovalMain.otherRemarks.value;
		otherRemarks = otherRemarks.replace(/^\s+|\s+$/g,'');
		document.priceApprovalMain.otherRemarks.value = otherRemarks;
//alert("check: "+document.priceApprovalMain.otherRemarks.value);
		var marketEvents = document.priceApprovalMain.marketEvents.value;
		marketEvents = marketEvents.replace(/^\s+|\s+$/g,'');
		document.priceApprovalMain.marketEvents.value = marketEvents;

		document.priceApprovalMain.sanctionedRefType.disabled=false;
		//document.priceApprovalMain.origin.disabled=false;
		document.priceApprovalMain.bussinessAndCommercial.disabled=false;
		document.priceApprovalMain.director.disabled=false;
		document.priceApprovalMain.epSupplyChain.disabled=false;
		document.priceApprovalMain.coo.disabled=false;
		document.priceApprovalMain.ceo.disabled=false;
		document.priceApprovalMain.md.disabled=false;

	
			document.priceApprovalMain.action = "common/updateDraftSubmitnp.jsp?priceid="+priceid;
			document.priceApprovalMain.submit();

}

function savedraftnp1()
{
			document.priceApprovalMain.action="common/saveDraftSubmitnp.jsp";
			document.priceApprovalMain.submit();
}


function aopDealValue()
{

	var aopreceiptprice	=	document.priceApprovalMain.aopreceiptprice.value;
	var aopreceiptforex	=	document.priceApprovalMain.aopreceiptforex.value;
	var aopdealvalue	=	document.priceApprovalMain.aopdealvalue.value;
	var freight2		=	document.priceApprovalMain.freight2.value;
	var quantity		=	document.priceApprovalMain.quantity.value;
	var cusduty1		=	document.priceApprovalMain.cusduty1.value;

	//alert("quantity== "+quantity);

	if(aopreceiptprice.length>0 && aopreceiptforex.length>0 && freight2.length>0 && quantity.length>0)
	{
		//aopdealvalue = ((aopreceiptprice * aopreceiptforex) + parseInt(freight2)) * parseInt(quantity) / 10000000;
		aopdealvalue = ((((100+parseFloat(cusduty1))/100)*(aopreceiptprice * aopreceiptforex)) + parseInt(freight2)) * parseInt(quantity) / 10000000;
	}
	document.priceApprovalMain.aopdealvalue.value = aopdealvalue.toFixed(2);

}

function insuranceRsPerTon()
{

	var invoicePrice	=	document.priceApprovalMain.invoicePrice.value;
	var totalprice1		=	document.priceApprovalMain.totalprice1.value;
	var insurance1		=	document.priceApprovalMain.insurance1.value;
	var insurance2		=	document.priceApprovalMain.insurance2.value;

	//alert("quantity== "+quantity);

		if(invoicePrice.length>0 && totalprice1.length>0 && insurance1.length>0 )
		{
		  insurance2 = invoicePrice * totalprice1 * insurance1;
		}
		document.priceApprovalMain.insurance2.value = insurance2;
}

function insuranceSpendRsLakh()
{

	var invoicePrice	=	document.priceApprovalMain.invoicePrice.value;
	var totalprice1		=	document.priceApprovalMain.totalprice1.value;
	var insurance1		=	document.priceApprovalMain.insurance1.value;
	var insurance2		=	document.priceApprovalMain.insurance2.value;
	var quantity		=	document.priceApprovalMain.quantity.value;
	var insurance3		=	document.priceApprovalMain.insurance3.value;

	//alert("quantity== "+quantity);

		if(invoicePrice.length>0 && totalprice1.length>0 && insurance1.length>0 && quantity.length>0)
		{
		  insurance3 = invoicePrice * totalprice1 * insurance1 * quantity / 10000000;
		}
		document.priceApprovalMain.insurance3.value = insurance3;
}

function freightRsPerTon()
{

	var freight1		=	document.priceApprovalMain.freight1.value;
	var quantity		=	document.priceApprovalMain.quantity.value;
	var freight3		=	document.priceApprovalMain.freight3.value;

	//alert("quantity== "+quantity);

		if(freight1.length>0 && quantity.length>0 )
		{
		  freight3 = freight1 * quantity / 10000000;
		}
		document.priceApprovalMain.freight3.value = freight3;
}


function calculations()
{
		
		vendorName			=			document.priceApprovalMain.vendorName.value;
		mill				=			document.priceApprovalMain.mill.value;
		paymentTerms		=			document.priceApprovalMain.paymentTerms.value;
		sourcing			=			document.priceApprovalMain.sourcing.value;
		quantity			=			document.priceApprovalMain.quantity.value;
		deliveryIn			=			document.priceApprovalMain.deliveryIn.value;
		quality				=			document.priceApprovalMain.quality.value;
		gsm					=			document.priceApprovalMain.gsm.value;
		thisLot				=			document.priceApprovalMain.thisLot.value;
		invoicePrice		=			document.priceApprovalMain.invoicePrice.value;
		risi				=			document.priceApprovalMain.risi.value;
		aopreceiptprice		=			document.priceApprovalMain.aopreceiptprice.value;
		aopreceiptforex		=			document.priceApprovalMain.aopreceiptforex.value;
		aopdealvalue		=			document.priceApprovalMain.aopdealvalue.value;
		totalprice1			=			document.priceApprovalMain.totalprice1.value;
		totalprice2			=			document.priceApprovalMain.totalprice2.value;
		totalprice3			=			document.priceApprovalMain.totalprice3.value;
		cusduty1			=			document.priceApprovalMain.cusduty1.value;
		cusduty2			=			document.priceApprovalMain.cusduty2.value;
		cusduty3			=			document.priceApprovalMain.cusduty3.value;
		freight1			=			document.priceApprovalMain.freight1.value;
		freight2			=			document.priceApprovalMain.freight2.value;
		freight3			=			document.priceApprovalMain.freight3.value;
		insurance1			=			document.priceApprovalMain.insurance1.value;
		insurance2			=			document.priceApprovalMain.insurance2.value;
		insurance3			=			document.priceApprovalMain.insurance3.value;
		//totalcost1			=			document.priceApprovalMain.totalcost1.value;
		totalcost2			=			document.priceApprovalMain.totalcost2.value;
		totalcost3			=			document.priceApprovalMain.totalcost3.value;
		budact1				=			document.priceApprovalMain.budact1.value;
		quainv1				=			document.priceApprovalMain.quainv1.value;
		quainv2				=			document.priceApprovalMain.quainv2.value;
		expectedreceipts1	=			document.priceApprovalMain.expectedreceipts1.value;
		expectedreceipts2	=			document.priceApprovalMain.expectedreceipts2.value;
		estimatedcons1		=			document.priceApprovalMain.estimatedcons1.value;
		estimatedcons2		=			document.priceApprovalMain.estimatedcons2.value;
		quarterend1			=			document.priceApprovalMain.quarterend1.value;
		quarterend2			=			document.priceApprovalMain.quarterend2.value;
		annualBudget		=			document.priceApprovalMain.annualBudget.value;
		contractedTons		=			document.priceApprovalMain.contractedTons.value;
		currentquarter		=			document.priceApprovalMain.currentquarter.value;
		balance				=			document.priceApprovalMain.balance.value;
		origin				=			document.priceApprovalMain.origin.value;

//alert("cusduty1"+cusduty1);
//alert("cusduty2"+cusduty2);
//alert("cusduty3"+cusduty3);

	 
		//document.priceApprovalMain.quarterend2.value = quarterend1 / test;
		

		if(aopreceiptprice.length>0 && aopreceiptforex.length>0 && freight2.length>0 && quantity.length>0)
		{
			//aopdealvalue = ((aopreceiptprice * aopreceiptforex) + parseInt(freight2)) * parseInt(quantity) / 10000000;
			aopdealvalue = ((((100+parseFloat(cusduty1))/100)*(aopreceiptprice * aopreceiptforex)) + parseInt(freight2)) * parseInt(quantity) / 10000000;
			document.priceApprovalMain.aopdealvalue.value = aopdealvalue.toFixed(2);
		}


		//if(invoicePrice.length>0 && totalprice1.length>0 && insurance1.length>0 )
		//{
		  //insurance2 = invoicePrice * totalprice1 * insurance1 / 100;
		  //insurance2 = (((invoicePrice * totalprice1 * ((cusduty1/100)+1))  + freight1)  * insurance1) / 100;
		  //document.priceApprovalMain.insurance2.value = Math.round(insurance2);
		//}

		if(invoicePrice.length>0 && totalprice1.length>0 && insurance1.length>0)
		{
		  if (origin=="imported")
		  {		  
			  insurance2 = ((invoicePrice*totalprice1*((cusduty1/100)+1))+ freight1)*(insurance1)/100;
			  document.priceApprovalMain.insurance2.value = Math.round(insurance2);
		  }else {
			  insurance2 = ((invoicePrice*totalprice1*((cusduty1/47)+1))+ freight1)*(insurance1)/100;
			  document.priceApprovalMain.insurance2.value = Math.round(insurance2);
 
		  }
		}

		if(invoicePrice.length>0 && totalprice1.length>0 && insurance1.length>0 && quantity.length>0)
		{
		 // insurance3 = (parseFloat(invoicePrice) * parseFloat(totalprice1) * parseFloat(insurance1) * quantity) / 10000000;
		  insurance3 = (parseFloat(insurance2) * quantity) / 10000000;
		  document.priceApprovalMain.insurance3.value = insurance3.toFixed(2);
		}

		if(freight1.length>0 && quantity.length>0 )
		{
		  freight3 = parseFloat(freight1) * parseFloat(quantity) / 10000000;
		  document.priceApprovalMain.freight3.value = freight3.toFixed(2);

		}

		if(thisLot.length>0 && totalprice1.length>0 )
		{
		  totalprice2 = thisLot * totalprice1;
		  document.priceApprovalMain.totalprice2.value = Math.round(totalprice2);
		}
	

		  totalcost2 = parseFloat(totalprice2) + parseFloat(cusduty2) + parseFloat(freight2) + parseFloat(insurance2);
		  document.priceApprovalMain.totalcost2.value = totalcost2.toFixed(1);;


		  totalprice3 = totalprice2 * quantity / 10000000;
		  document.priceApprovalMain.totalprice3.value =  totalprice3.toFixed(2);


			totalcost3 = parseFloat(totalprice3) + parseFloat(cusduty3) + parseFloat(freight3) + parseFloat(insurance3);
			document.priceApprovalMain.totalcost3.value = totalcost3.toFixed(2);

			budact1 = aopdealvalue - totalcost3;
			document.priceApprovalMain.budact1.value = budact1.toFixed(2);


		if(thisLot.length>0 && cusduty1.length>0 )
		{
		  cusduty2 = (thisLot * cusduty1 * totalprice1) / 100;
		  document.priceApprovalMain.cusduty2.value = Math.round(cusduty2);
		}


		cusduty3 = cusduty2 * quantity / 10000000;
		  document.priceApprovalMain.cusduty3.value =  cusduty3.toFixed(2);


		if(annualBudget.length>0 && contractedTons.length>0 && currentquarter.length>0 )
		{
			balance  = annualBudget - contractedTons - currentquarter;
			document.priceApprovalMain.balance.value = balance;
		}
		if(quainv1.length>0 && expectedreceipts1.length>0 && estimatedcons1.length>0 )
		{
		quarterend1  = (parseFloat(quainv1) + parseFloat(expectedreceipts1)) - estimatedcons1 ;
		document.priceApprovalMain.quarterend1.value =Math.round(quarterend1);
		}
		if(quainv2.length>0 && expectedreceipts2.length>0 && estimatedcons2.length>0 )
		{
		quarterend2  = (parseFloat(quainv2) + parseFloat(expectedreceipts2)) - estimatedcons2 ;

		document.priceApprovalMain.quarterend2.value = Math.round(quarterend2);
		}

	 test	=	estimatedcons1 / estimatedcons2;
		document.priceApprovalMain.quainv2.value = Math.round(quainv1 / test);

	 //test2	=	quarterend1 / quarterend2;
		document.priceApprovalMain.expectedreceipts2.value = Math.round(expectedreceipts1 / test);
}



function showAllRequestsNp()
{
	//alert("ABCDEFG");
	randome = Math.random();
	loadFragment('common/viewAllStatusNp.jsp?randome='+randome,'allProcess','Showing All Requests');
	//setTimeout("showStatus()",1000*15);
}


function showAllRequestsNpPending()
{
	//alert("ABCDEFG");
	randome = Math.random();
	loadFragment('common/viewAllRequests.jsp?randome='+randome,'values','Showing All Requests with Pending Status');
	//setTimeout("showStatus()",1000*15);
}

function attachmentFile(attachDetails, str){			
	var url			= "/timescape/sapep/employeeselfservice/priceapproval/uploadnp/uploadFile.jsp?attachment="+attachDetails+"&str="+str;
	window.open(url,"File","width=500,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");	
}

function deleteFile(fileName,dirPath,str){
	var url = "/timescape/sapep/employeeselfservice/priceapproval/common/deleteFile.jsp?fileName="+fileName+"&dirPath="+dirPath+"&id=delete&requestStr="+str;
	window.open(url,"File","width=500,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
}

function onLoadDetail(str){	

	if(str == '0'){
		loadFragment1("/timescape/sapep/employeeselfservice/priceapproval/common/dirListing.jsp?attachment=compulsory&str="+str,"attachment","Attachment");
		loadFragment1("/timescape/sapep/employeeselfservice/priceapproval/common/dirListing.jsp?attachment=additional&str="+str,"attachment1","Attachment");
	}else 	{
		loadFragment1("/timescape/sapep/employeeselfservice/priceapproval/common/dirListing.jsp?attachment=compulsory&str=1","attachment","Attachment");
		loadFragment1("/timescape/sapep/employeeselfservice/priceapproval/common/dirListing.jsp?attachment=additional&str=1","attachment1","Attachment");
	}
}



function showFixedAttachmentFile(str, requestId, userEmailId, status, compAttachment, addAttachment){	

	loadFragment1("/timescape/sapep/employeeselfservice/priceapproval/common/showDirListing.jsp?attachment="+compAttachment+"&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status,"attachment","Attachment");
	loadFragment1("/timescape/sapep/employeeselfservice/priceapproval/common/showDirListing.jsp?attachment="+addAttachment+"&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status,"attachment1","Attachment");
}
function showFixedAttachmentFile1(str, requestId, userEmailId, status, compAttachment, addAttachment,flag){	

	loadFragment1("/timescape/sapep/employeeselfservice/priceapproval/common/showDirListing.jsp?attachment="+compAttachment+"&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status+"&flag="+flag,"attachment","Attachment");
	loadFragment1("/timescape/sapep/employeeselfservice/priceapproval/common/showDirListing.jsp?attachment="+addAttachment+"&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status+"&flag="+flag,"attachment1","Attachment");
}

function showAttachedFile(fileName, emailid,str,requestId,attachment){
	var url			= "/timescape/sapep/employeeselfservice/priceapproval/common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str=1&requestNo="+requestId+"&attachment="+attachment;
	window.location.href = url;
}


function loadFragment1(fragment_url, element_id, for_what){
	//alert("JII");
	var xmlhttp = "";
    if (window.XMLHttpRequest){
        // code for Mozilla, etc.
        xmlhttp=new XMLHttpRequest();
    }else if (window.ActiveXObject){ 
        // code for IE
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        alert("Sorry Your Browser is not Supported");
    }
    // alert(fragment_url);

    var element = document.getElementById(element_id);
    
    var message = "";
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
        
    element.innerHTML = processingRequest;

    try{
       	xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
		
                element.innerHTML = message;
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
		alert("Can't connect to server:\n" + e.toString());
	 }
}



function spaceAlertNp(field)
{

	//var f = field;
    if (field.match(/\s/g,"")) {
        alert("Blank spaces are not allowed in any numeric field");
        return false;
    }

}

function validateNumericData(elementId, elementValue)
{
	counter					=	document.priceApprovalMain.count.value;
	for(i = 1; i<=counter; i++)
	{

		oq = eval("document.priceApprovalMain.oq"+i);
		op = eval("document.priceApprovalMain.op"+i);
		fq = eval("document.priceApprovalMain.fq"+i);
		fp = eval("document.priceApprovalMain.fp"+i);

		if(isNaN(oq.value))
		{
				oq.focus();
				alert("Fill only numerics in OFFER QUANTITY(MT)  \n");
		}
		if(isNaN(op.value))
		{
				op.focus();
				alert("Fill only numerics in OFFER PRICE(per/MT) \n");
		}
		if(isNaN(fq.value))
		{
				fq.focus();
				alert("Fill only numerics in FINAL QUANTITY(MT) \n");
		}
		if(isNaN(fp.value))
		{
				fp.focus();
				alert("Fill only numerics in FINAL PRICE(per/MT) \n");
		}
	}
}

function autoAnnexure()
{
		vendorName			=			document.priceApprovalMain.vendorName.value;
		mill				=			document.priceApprovalMain.mill.value;
		paymentTerms		=			document.priceApprovalMain.paymentTerms.value;
		sourcing			=			document.priceApprovalMain.sourcing.value;
		quantity			=			document.priceApprovalMain.quantity.value;
		deliveryIn			=			document.priceApprovalMain.deliveryIn.value;
		quality				=			document.priceApprovalMain.quality.value;
		gsm					=			document.priceApprovalMain.gsm.value;
		thisLot				=			document.priceApprovalMain.thisLot.value;
		freight1			=			document.priceApprovalMain.freight1.value;
		freight2			=			document.priceApprovalMain.freight2.value;

		if(vendorName.length>0)
		{			
			document.priceApprovalMain.v1.value = vendorName;
		}
		if(mill.length>0)
		{			
			document.priceApprovalMain.m1.value = mill;
		}
		if(quality.length>0 && gsm.length>0)
		{
			var grade ="";
			grade = quality +" "+ gsm ;
			document.priceApprovalMain.g1.value = grade;
		}
		if((freight1.length>=0) ||freight1.length=='')
		{
			document.priceApprovalMain.freight2.value = freight1;
		}
}


function cancelParNp(priceId,userOId, statusType)
{
	//alert("HIII");
	frmObj = document.viewStatusNp;

	val = confirm("Do you wish to cancel your News Print approval request ? ");

	if(val){
		//If "yes" then submit the page
		frmObj.action = "../common/cancelParNp.jsp?priceId="+priceId+'&userOId='+userOId+'&statusType='+statusType;
		frmObj.submit();
	
	}else{
		return;
	}
}


function cancelParNpAdmin(priceId, statusType)
{
	//alert("JJJJJJJJJ");
	frmObj = document.viewAllStatusNp;
	//alert("priceId"+priceId);

	val = confirm("Do you wish to cancel your News Print approval request ? ");

	if(val){
		//If "yes" then submit the page
		frmObj.action = "../priceapproval/common/cancelParNpAdmin.jsp?priceId="+priceId+'&statusType='+statusType;
		//frmObj.action = "../priceapproval/common/cancelParNpAdmin1.jsp?priceId="+priceId+'&statusType='+statusType;
		frmObj.submit();
	
	}else{
		//alert("KKKKKKKK");
		return;
	}
}

function cancelParNpAdmin1(priceId, statusType,timescapeUserOId,Approver,INITIATOREMAILID)
{
	//frmObj = document.priceApprovalMain;
	frmObj = document.viewAllRequests;
	val = confirm("Do you want to cancel PAR Id : "+priceId);
	alert(val);
	if(val){
		alert("jjjjj");
		//frmObj.action = "cancelParNpAdmin1.jsp?priceId="+priceId+"&statusType="+statusType+"&timescapeUserOId="+timescapeUserOId+"&Approver="+Approver+"&INITIATOREMAILID="+INITIATOREMAILID;
		window.open("cancelParNpAdmin1.jsp?priceId="+priceId+'&statusType='+statusType+'&timescapeUserOId='+timescapeUserOId+'&Approver='+Approver+'&INITIATOREMAILID='+INITIATOREMAILID);	

		
	
	}else{
		alert("mmmmm");
		return;
	}
}


function ammendParNpAdmin(priceId, statusType,timescapeUserOId,Approver,INITIATOREMAILID)
{

	//alert("KKKKK");
	//alert("Approver"+Approver);


	//frmObj = document.priceApprovalMain;
	frmObj = document.viewAllRequests;

	val = confirm("Do you want to Amend PAR Id : "+priceId);

	if(val){
		//alert("1=====/common/ammendParNpAdmin.jsp?priceId="+priceId+"&statusType="+statusType+"&timescapeUserOId="+timescapeUserOId);
		frmObj.action = "ammendParNpAdmin.jsp?priceId="+priceId+"&statusType="+statusType+"&timescapeUserOId="+timescapeUserOId+"&Approver="+Approver+"&INITIATOREMAILID="+INITIATOREMAILID;
		//window.open("common/ammendParNpAdmin.jsp?priceId="+priceId+"&statusType="+statusType+"&timescapeUserOId="+timescapeUserOId);
		//alert("2");
		frmObj.submit();
	
	}else{
		return;
	}
}


function navigateCallbuyersStatusNp(timescapeUserOId,priceid)
{
	 url = "../common/showDetailsBuyersStatusnp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid;
	 window.location.href=url;
 	 //self.close();
}


function lookupAll22(inputString,idText,idList,urlText) {
	var url;
	if(inputString.length == 0) {
		$('#'+idText).hide();
	} else {
		
		if(urlText=='parnumber'){
			//alert("HIIIII");
			url = "common/searchParNumber.jsp";
			//alert("url........."+url);
		}
		//alert("url= "+url);
		//alert("inputString= "+inputString );
		$.post("common/searchParNumber.jsp", {queryString: ""+inputString+""}, function(data){
			//$.post(url, {queryString: ""+inputString+""}, function(data){
			alert(data);
		/*if(data.length > 0) {
			$('#suggestions').show();
			$('#autoSuggestionsList').html(data);
			}*/
			if(data.length > 0) {
		$('#'+idText).show();
		$('#'+idList).html(data);
	}else{
		$('#'+idText).hide();
		}
		});
	}
}


function lookupAll(inputString,idText,idList,urlText) {
	var url;
	if(inputString.length == 0) {
		$('#'+idText).hide();
	} else {
		
		if(urlText=='parnumber'){
			url = "common/searchParNumber.jsp?inputString="+inputString;
		}
		
		$.post(url, {queryString: ""+inputString+""}, function(data){
		if(data.length > 0) {
		$('#'+idText).show();
		$('#'+idList).html(data);
	}else{
		$('#'+idText).hide();
		}
		});
	}
}

function fillLocation(thisValue) {
	//alert("KKKKK");
	$('#parnumber').val(thisValue).focus();
	$('#suggestions').hide();
	$('autoSuggestionsList').hide();
}


function edit(){
	//alert("hi");
	frmObj = document.priceApprovalMain;
	var parnumber		=	document.priceApprovalMain.parnumber.value;
	//var dateOfApproval		=	document.priceApprovalMain.dateOfApproval.value;
	//var refNumber		=	document.priceApprovalMain.refNumber.value;
	//alert(parnumber);
	frmObj.action = "indexnpdata.jsp?parnumber="+parnumber;
		frmObj.submit();
		
}    


function filldays(){
	frmObj = document.priceApprovalMain;
	var frmObj2 = document.priceApprovalMain;
	var deliveryIn		=	document.priceApprovalMain.deliveryIn.value;
	var dateOfApproval = document.getElementById('dateOfApproval').value;
	//var deliveryIn		=$('#deliveryIn').val();
	//alert("VVVVVVV");
	//if (deliveryIn.indexOf('1Q') >= 0 || deliveryIn.indexOf('OCT') >= 0 || deliveryIn.indexOf('NOV') >= 0 || deliveryIn.indexOf('DEC') >= 0)
	/*if (deliveryIn.indexOf('1Q') !=-1 || deliveryIn.indexOf('OCT') !=-1 || deliveryIn.indexOf('NOV') !=-1 || deliveryIn.indexOf('DEC') !=-1)
	{
		document.priceApprovalMain.quainv2.value = "44";
	}else 
	{
		document.priceApprovalMain.quainv2.value = "00";
	}*/
		
}   

 function validateParValue(){
			 //alert(":HI");
			 var k = 0;
			 frmObj = document.priceApprovalMain;

			 size				= 	document.priceApprovalMain.dataSize.value;
			//alert(size);
			 while (k < size )
				{ 
				 //alert("eeee");
				txnid = eval("document.priceApprovalMain.txnid"+k);
				valtxnid = txnid.value;
				bcclvalue = eval("document.priceApprovalMain.bcclvalue"+k);
				valbcclvalue = bcclvalue.value;
				k++;	
				}

			frmObj.action="common/submitnprequest.jsp?size="+size;
			frmObj.submit();
}

function viewAllReport() {
	
	var frmObj2 = document.priceApprovalMain;
	
	
	frmObj2.action = "common/downloadReport.jsp";
	
	frmObj2.submit();

}

 
function clearDates() {
	
	document.getElementById("frmDate").value = "";
	document.getElementById("toDate").value = "";
}

//Function to view the Report in excel format
function viewAllReportNew() {
	//alert("in reports");
	var frmObj2 = document.viewAllRequests;
	
	//alert("obj" + frmObj2);
	frmObj2.action = "downloadReport.jsp";
	
	frmObj2.submit();

}
//This function is called when Go button is clicked and takes dates and status as input and validates them and sends to searchDataReq jsp file. 
function dispValues() {

frmObj = document.viewAllRequests;
fromdate = document.getElementById("frmDate").value;

todate = document.getElementById("toDate").value;

status = document.getElementById("status").value;

 if(status == "0"){
				
				alert("Please Select Status\n");
				document.getElementById("status").focus();
				return ;
			}

			if((fromdate == "" || fromdate == null)  && (todate == "" || todate == null))
			{
				alert("Please Select FROM DATE and TO DATE ");
				document.getElementById("frmDate").focus();
				return ;
			}
			else if((!fromdate == ""   && todate == "")    )
			{
				alert("Please Select TO DATE");
				document.getElementById("toDate").focus();
				return ;
			}
			else if (fromdate == "" && !todate == "")
			{
				alert("Please Select FROM DATE");
				document.getElementById("frmDate").focus();
				return;
			}
			
			else if (Date.parse(todate) <= Date.parse(fromdate) )
			{
				alert ("TO DATE cannot be earlier than FROM DATE");
				document.getElementById("toDate").focus();
				return;
			}

//var url = "viewAllRequests.jsp?status="+status+"&fromdate"+fromdate+"&todate="+todate;
//alert("Link is " + url);
var random = Math.random();

loadFragment1("searchDataReq.jsp?status="+status+"&fromdate="+fromdate+"&todate="+todate, "pricedataReq", "Data for from and to date and selected status");

}

function loadFragment1(fragment_url, element_id, for_what){
	//alert("enetered frag");
	var xmlhttp = "";
    if (window.XMLHttpRequest){
        // code for Mozilla, etc.
        xmlhttp=new XMLHttpRequest();
    }else if (window.ActiveXObject){ 
        // code for IE
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        alert("Sorry Your Browser is not Supported");
    }
    // alert(fragment_url);

    var element = document.getElementById(element_id);

    var message = "";
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
        
    element.innerHTML = processingRequest;

    try{
       	xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
		
                element.innerHTML = message;
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
		alert("Can't connect to server:\n" + e.toString());
	 }
} 

